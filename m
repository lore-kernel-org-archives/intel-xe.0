Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A6AC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 08:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86C10E0FA;
	Fri, 15 Dec 2023 08:56:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A556310E0FA
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702630570; x=1734166570;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cc6RN/n7w+gPH9n/hWUNbbYVYvpkAdRQTyyTlRHvwrw=;
 b=Llf5MULzRbtYIz/ZQHhEp3H/bBQyBEjePR84oCoPVhNS9HvMXcb+5BZe
 Xj110WJpgXbTd1D1rnBxJEkdy2dgBkQ2eIQINqoCNE9CwBzqXVW6FwCHq
 6KJAsoXFYr1w4VhgBnpnGNJAgHyro+BXcXjuhI6VPNkqCYk6VhwvfRyX7
 SvTT+ZSYOWB/2arz6mp9IZc7JF4Rsl9YL3Oe27Q/HOVWj4g9eDQIjMF+c
 eoRqzI6ljm0qtfLkBr1WKgrt9WoD53XkIzP8leE3p96vgh0BA7iyD4Khh
 RHuPfdWI/Ba46ywsoAx6ZgBrrdCOY/4wa2/gDvJk7mw+CeCTn7JvkIjGE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394123860"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="394123860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 00:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="17742896"
Received: from eparshut-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.224])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 00:56:08 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/xe: Enable W=1 warnings by default
In-Reply-To: <20231214213954.3223263-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
 <20231214213954.3223263-3-lucas.demarchi@intel.com>
Date: Fri, 15 Dec 2023 10:56:04 +0200
Message-ID: <87h6kjx2sb.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 14 Dec 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
> for i915, enable W=1 warnings by default in xe.

Acked-by: Jani Nikula <jani.nikula@intel.com>

once the build is clean.

There seems to be interest in doing this the same way drm subsystem wide
[1], but getting the build cleaned up there is a bit bigger task...

BR,
Jani.

[1] https://lore.kernel.org/r/20231129181219.1237887-1-jani.nikula@intel.com


>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 47 ++++++++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f4ae063a7005..6790c049d89e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -3,25 +3,34 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>  
> -# Add a set of useful warning flags and enable -Werror for CI to prevent
> -# trivial mistakes from creeping in. We have to do this piecemeal as we reject
> -# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
> -# need to filter out dubious warnings.  Still it is our interest
> -# to keep running locally with W=1 C=1 until we are completely clean.
> -#
> -# Note the danger in using -Wall -Wextra is that when CI updates gcc we
> -# will most likely get a sudden build breakage... Hopefully we will fix
> -# new warnings before CI updates!
> -subdir-ccflags-y := -Wall -Wextra
> -subdir-ccflags-y += $(call cc-disable-warning, unused-parameter)
> -subdir-ccflags-y += $(call cc-disable-warning, type-limits)
> -subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
> -subdir-ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
> -# clang warnings
> -subdir-ccflags-y += $(call cc-disable-warning, sign-compare)
> -subdir-ccflags-y += $(call cc-disable-warning, sometimes-uninitialized)
> -subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
> -subdir-ccflags-y += $(call cc-disable-warning, frame-address)
> +# Unconditionally enable W=1 warnings locally
> +# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
> +subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
> +subdir-ccflags-y += -Wmissing-declarations
> +subdir-ccflags-y += $(call cc-option, -Wrestrict)
> +subdir-ccflags-y += -Wmissing-format-attribute
> +subdir-ccflags-y += -Wmissing-prototypes
> +subdir-ccflags-y += -Wold-style-definition
> +subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
> +subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
> +subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
> +subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
> +subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
> +# The following turn off the warnings enabled by -Wextra
> +ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-missing-field-initializers
> +subdir-ccflags-y += -Wno-type-limits
> +subdir-ccflags-y += -Wno-shift-negative-value
> +endif
> +ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
> +subdir-ccflags-y += -Wno-sign-compare
> +endif
> +# --- end copy-paste
> +
> +# Enable -Werror in CI and development
>  subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
>  
>  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)

-- 
Jani Nikula, Intel
