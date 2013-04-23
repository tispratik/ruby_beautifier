REGEX = {
  missing_space_before_hash_rocket: {
    search: /(?<![ \<])=>/, # /(?<! )(?<!\<)=>/, /(?<!( |\<))=>/
    replace: ' =>'
  },

  missing_space_after_hash_rocket: {
    search: /=>(?! )/,
    replace: '=> '
  },

  missing_space_after_comma: {
    search: /,(?!( |'\)|"\)|\/\)|\n))/, # /(,(?! ))(?!'\))(?!"\))(?!\/\))(?!\n)/
    replace: ', '
  },

  missing_new_line_after_method: {
    search: /end(\n)def/,
    replace: '\n\n'
  }
}