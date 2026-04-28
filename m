Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CA0FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 08:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75D310EA74;
	Tue, 28 Apr 2026 08:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJiWgCX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297AB10EA82
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 08:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777363948; x=1808899948;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jHDjgCPUB1CxxAOsbvTGjHdOjV3p3Giyuyyo3H04gZ8=;
 b=XJiWgCX1HDGKjmlDvx+pPviL4wjqsgpbJ/JUgI2Ag3NrhxfXY+1mGcLm
 wPDcZYxysY//ICrymCypWd88xsvTbPkRHeUKof4MME27hz7LQs1ZiE4wf
 4rkorwBdLIa2XzQT7kQoi1glb/oJ1o1C33n8EbdV42v+Fa/INZL3kVu7Y
 TOKvSiVfVNAZ+gmktHuIBXYieSbY5BcRRgUc4hKfb454NUtVxhVkXBQAy
 a4TYuu07CzpgJPdL9UOQliAwMNnPmKfky98R600Fo9nDAAmXgqbAJ/Zlf
 y71pnLS62ygaMtQaholeOMF8P/YKTVXmdDF8q8vMHpmWxEjsXvICHqoaT g==;
X-CSE-ConnectionGUID: qCPapU6wROqX9Ni9e5lr4w==
X-CSE-MsgGUID: ER/SNP82S4SNkaeKDj8G7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="65794662"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="65794662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:12:27 -0700
X-CSE-ConnectionGUID: n88pwTJpSD24kP1jWmnwvg==
X-CSE-MsgGUID: gJhnjn60Q5GIe9zM6KiMjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="229324365"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:12:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
In-Reply-To: <20260415215032.3398330-1-shuicheng.lin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260415215032.3398330-1-shuicheng.lin@intel.com>
Date: Tue, 28 Apr 2026 11:12:23 +0300
Message-ID: <0cd899be469b13ed4e6738ce8eb8716081c22d8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 15 Apr 2026, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
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
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Cc: linux-doc@vger.kernel.org

> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index ca00695b47b3..f21f06c0a9b0 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -673,6 +673,31 @@ class KernelDoc:
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
Jani Nikula, Intel
