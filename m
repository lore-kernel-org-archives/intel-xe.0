Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14925CD3427
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 05:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80CC10E02C;
	Thu,  7 May 2026 05:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Up6IjuOq";
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB3B10E02C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 05:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=h6eJGUZwtdE3R1e5qs1TDicNfuPEDB4C0Px4Pv7EZJY=; b=Up6IjuOqCkyVYSmndwA24sQu4S
 QGT45JesMF82uoQvcfxzRLSgzRYVBoVZE7UEfVJk7JhT7/cP1px/NVLtkxYctB3ybi2vBBoOgVA3P
 6TrjqZt2QOdtboX575pnHAl8ROdglyH2w+kkglu/XIoTnjWutTj6SMregmuha1g1X5Yu2AHG9tnYi
 fnIMrK52FUc6dMoXg55VUCaUnGoFsjwbRUqvj4NDSox9fKijLJOTkS2uFibGjSKfpDL5uMcCWtyn6
 0Knor1nkA51A7cwKpfdKFy4IHvb3RZ5PV0fILkgzO0PNH71jQsRth2hwD3/phq10/6tYAixj7sL9K
 fJkwlODg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wKrUP-00000002pUX-2o2K; Thu, 07 May 2026 05:41:37 +0000
Message-ID: <21c8813c-e3af-4764-b6f7-3d4cb1fe1c65@infradead.org>
Date: Wed, 6 May 2026 22:41:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
References: <20260507023232.4108680-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260507023232.4108680-1-shuicheng.lin@intel.com>
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



On 5/6/26 7:32 PM, Shuicheng Lin wrote:
> Add validation in check_sections() to verify that inline member
> documentation tags (/** @member: description */) match actual struct/union
> member names. Previously, kernel-doc only validated section headers against
> the parameter list, but inline doc tags stored in parameterdescs were never
> cross-checked, allowing stale or mistyped member names to go undetected.
> 
> The new check iterates over parameterdescs keys and warns about any that
> don't appear in the parameter list, catching issues like renamed struct
> members where the documentation tag was not updated to match.
> 
> This catches real issues such as:
>   - xe_bo_types.h: @atomic_access (missing struct prefix, should be
>     @attr.atomic_access)
>   - xe_device_types.h: @usm.asid (member is actually asid_to_vm)
> 
> While at it, fix two long-standing issues with named variadic parameters
> (macros like ``#define foo(fmt, args...)``) that the new check exposed:
> 
>   1. A description provided via the ``@args...:`` doc form was stored
>      in parameterdescs under the unstripped key ``args...``, while
>      push_parameter() stripped the trailing ``...`` and only added
>      ``args`` to parameterlist.  As a result the user-supplied
>      description was orphaned, parameterdescs[``args``] was auto-
>      populated with the generic "variable arguments" text, and the
>      user's actual description was silently discarded by the output
>      stage.  Migrate the description from the unstripped to the
>      stripped key inside push_parameter() so the user's text reaches
>      the output and the new check does not flag the orphaned key.
> 
>   2. push_parameter() always auto-populated parameterdescs[param] with
>      "variable arguments" for variadic parameters, which bypassed the
>      existing "parameter not described" warning at line 549.  As a
>      consequence, a named variadic with no matching ``@<name>:`` doc
>      tag (or a mistyped one such as ``@args:`` for a parameter named
>      ``arg``) went undetected.  Emit the standard "not described"
>      warning for named variadics before applying the auto-fill, so
>      missing or mistyped variadic docs are reported just like missing
>      docs for any other parameter.  The bare ``@...:`` form is
>      unaffected because it has no natural name for the user to
>      document.
> 
> This second hunk surfaces one real pre-existing documentation gap in
> include/linux/hashtable.h: hash_for_each_possible_rcu()'s ``cond...``
> parameter has no matching ``@cond:`` doc entry.  No false positives were
> observed across include/linux, kernel/, or drivers/gpu/drm.
> 
> v2: Skip variadic parameters whose documented key ends with ``...`` and
>     whose stripped name is in parameterlist, to avoid false-positive
>     "Excess function parameter 'args...'" warnings on macros like
>     ``#define foo(fmt, args...)`` documented with ``@args...:``.
> 
> v3: The v2 special case in check_sections() only suppressed the warning
>     while still letting the user's description be silently dropped from
>     the generated output.  Replace it with a fix in push_parameter() that
>     migrates the description from ``args...`` to ``args`` when the name
>     is stripped, so the user's text is preserved end-to-end and the
>     new excess-parameter check naturally finds nothing to flag.
> 
> v4: Also emit the standard "parameter not described" warning for named
>     variadics that have no matching ``@<name>:`` doc tag.  Previously
>     push_parameter()'s unconditional auto-fill bypassed that warning,
>     so a missing or mistyped variadic doc went undetected. (Randy)
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks. This is good stuff.

> ---
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-xe@lists.freedesktop.org
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 54 +++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index ca00695b47b3..2bc49c3ece14 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -512,9 +512,36 @@ class KernelDoc:
>          #
>          if dtype == '':
>              if param.endswith("..."):
> -                if len(param) > 3: # there is a name provided, use that
> +                named_variadic = len(param) > 3
> +                if named_variadic: # there is a name provided, use that
> +                    #
> +                    # If the user documented the parameter using the
> +                    # ``@name...:`` form, the description is stored in
> +                    # parameterdescs under the unstripped key.  Migrate
> +                    # it to the stripped key so the user's text is not
> +                    # silently dropped during output, and so the new
> +                    # excess-parameter check in check_sections() does
> +                    # not flag the unstripped key as orphaned.
> +                    #
> +                    orig = self.entry.parameterdescs.pop(param, None)
>                      param = param[:-3]
> +                    if orig is not None and \
> +                       not self.entry.parameterdescs.get(param):
> +                        self.entry.parameterdescs[param] = orig
>                  if not self.entry.parameterdescs.get(param):
> +                    #
> +                    # For a named variadic (e.g. ``args...``), emit the
> +                    # standard "not described" warning before auto-filling
> +                    # so a missing or mistyped ``@<name>:`` doc tag does
> +                    # not go undetected.  The bare ``...`` form has no
> +                    # natural name for the user to document and so always
> +                    # gets the auto-generated text.
> +                    #
> +                    if named_variadic and decl_type == 'function':
> +                        self.emit_msg(ln,
> +                                      f"function parameter '{param}' "
> +                                      f"not described in "
> +                                      f"'{declaration_name}'")
>                      self.entry.parameterdescs[param] = "variable arguments"
>  
>              elif (not param) or param == "void":
> @@ -673,6 +700,31 @@ class KernelDoc:
>                  self.emit_msg(ln,
>                                f"Excess {dname} '{section}' description in '{decl_name}'")
>  
> +        #
> +        # Check that documented parameter names (from doc comments, including
> +        # inline ``/** @member: */`` tags) actually match real members in
> +        # the declaration.  This catches mismatched or stale kernel-doc
> +        # member tags that don't correspond to any actual struct/union
> +        # member or function parameter.
> +        #
> +        for param_name, desc in self.entry.parameterdescs.items():
> +            # Skip auto-generated entries from push_parameter()
> +            if desc == self.undescribed:
> +                continue
> +            if desc in ("no arguments", "anonymous\n", "variable arguments"):
> +                continue
> +            if param_name.startswith("{unnamed_"):
> +                continue
> +            if param_name in self.entry.parameterlist:
> +                continue
> +
> +            if decl_type == 'function':
> +                dname = f"{decl_type} parameter"
> +            else:
> +                dname = f"{decl_type} member"
> +            self.emit_msg(ln,
> +                          f"Excess {dname} '{param_name}' description in '{decl_name}'")
> +
>      def check_return_section(self, ln, declaration_name, return_type):
>          """
>          If the function doesn't return void, warns about the lack of a

-- 
~Randy
