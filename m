Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258FC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 21:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F334210E0D9;
	Tue, 14 Jul 2026 21:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="FujvXYl1";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E5F10E0D9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=LmUED+JhE6GfXFjui0hCexz1XM2vfWKgWmuWmEOwuXM=; b=FujvXYl1jW/UqNjl/J3nIITNtm
 ICw1EG0z7w616Ld86IXtDzyQ+JeFu+z/ttRliVmMzFxflbiUANLUGyOU+RTLuBxZ/UPKD11tXBUAC
 /dKsFSXfGVUxVYhXvgDzPhR8PobM/BFHxnHaYJKp6/rUBR/4oiOM3CsNASqDtfTwOEhrQjiC7f32r
 QAQJN5AO1e+EX0XAykM5xC8Rx2n1VoeAszLXv40vVIyFiVALAVYWrewmwdisaaHkJicSXmchNnWuB
 2IU4g01u57uryxCRrpfvIRTmtXkC/Wq9ThI0ULM1n6IxixpLFtFJYSqk/V6UVd2ejGgQhBiMdFNxC
 vusN4BFA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wjkvP-0000000DMsn-2OCO; Tue, 14 Jul 2026 21:44:23 +0000
Message-ID: <12d74842-c826-46ec-922a-68f5e4042cb6@infradead.org>
Date: Tue, 14 Jul 2026 14:44:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20260714111208.323108-1-ryszard.knop@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,


On 7/14/26 4:12 AM, Ryszard Knop wrote:
> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
> 

Seems to work for me.

> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 2dedda215c22..3f88095eab06 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -558,6 +558,13 @@ class KernelDoc:
>                          self.push_parameter(ln, decl_type, param, dtype,
>                                              arg, declaration_name)
>  
> +    def get_suggestions_hint(self, decl_name, possible_names):
> +        suggestions = set(name for name in possible_names if decl_name in name)
> +        if not suggestions:
> +            return ""
> +
> +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +
>      def check_sections(self, ln, decl_name, decl_type):
>          """
>          Check for errors inside sections, emitting warnings if not found
> @@ -566,12 +573,13 @@ class KernelDoc:
>          for section in self.entry.sections:
>              if section not in self.entry.parameterlist and \
>                 not known_sections.search(section):
> +                hint = self.get_suggestions_hint(section, self.entry.parameterlist)
>                  if decl_type == 'function':
>                      dname = f"{decl_type} parameter"
>                  else:
>                      dname = f"{decl_type} member"
>                  self.emit_msg(ln,
> -                              f"Excess {dname} '{section}' description in '{decl_name}'")
> +                              f"Excess {dname} '{section}' description in '{decl_name}' {hint}")

When 'hint' is empty, this statement and/or the similar one below
adds a trailing space to each of those lines.
Can you prevent that?  (yeah, it's just a nit)

>  
>          #
>          # Check that documented parameter names (from doc comments, including
> @@ -591,12 +599,13 @@ class KernelDoc:
>              if param_name in self.entry.parameterlist:
>                  continue
>  
> +            hint = self.get_suggestions_hint(param_name, self.entry.parameterlist)
>              if decl_type == 'function':
>                  dname = f"{decl_type} parameter"
>              else:
>                  dname = f"{decl_type} member"
>              self.emit_msg(ln,
> -                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
> +                          f"Excess {dname} '{param_name}' description in '{decl_name}' {hint}")
>  
>      def check_return_section(self, ln, declaration_name, return_type):
>          """

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
