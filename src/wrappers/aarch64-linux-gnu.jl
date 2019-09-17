# Autogenerated wrapper script for Graphene_jll for aarch64-linux-gnu
export libgraphene

using Glib_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libgraphene`
const libgraphene_splitpath = ["lib", "libgraphene-1.0.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgraphene_path = ""

# libgraphene-specific global declaration
# This will be filled out by __init__()
libgraphene_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgraphene = "libgraphene-1.0.so.0"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Glib_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Glib_jll.LIBPATH_list,))

    global libgraphene_path = abspath(joinpath(artifact"Graphene", libgraphene_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgraphene_handle = dlopen(libgraphene_path)
    push!(LIBPATH_list, dirname(libgraphene_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

