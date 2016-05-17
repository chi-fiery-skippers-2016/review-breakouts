def find_cat
  @cat = Cat.find(params[:id])
end