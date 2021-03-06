
%module(directors="1") EverydayMoose

%{
#include "GoldenCat.h"
%}

%include std_string.i
%include std_vector.i
%include exception.i

class QString
{
public:
    static QString fromStdString(const std::string &s);
    std::string toStdString() const;
    
    int size() const;
    int count() const;
    int length() const;
    bool isEmpty() const;
};

%exception{
    try {
        $action
    } catch (std::exception const& e) {
        SWIG_exception(SWIG_RuntimeError, (std::string("std::exception: ") + e.what()).c_str());
    } catch (...) {
        SWIG_exception(SWIG_UnknownError, "Unknown error");
    }
}

%include "GoldenCat.h"
