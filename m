Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AE0CF9C6E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 11:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43810E1D0;
	Mon, 23 Sep 2024 11:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+yNIlUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8366E10E1D0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 11:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092638; x=1758628638;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X5bZxsnJuXjuL079HbDiRN4SoJPqxA1dSQ5F3GPziOQ=;
 b=D+yNIlUo7Rk7Va2VZrUrDSs9EhHvnewklgs03fnwCwr4AlnhdS2uCkbU
 Q1ubGrMuXvH76gxYy2/ogn7lSA9ogv6lV0RqTf7X6PygMKxqjiMtjLFS0
 sifuVXZb67VPQB5j/9xEZoWcyNx/G7n8NUGunjSyBbY415bzgNMSJ/lb+
 5irZac2VoAYfVDlzv18DOaL/SYO1pQVZGJZgVcJzZk5KlRF15pi9ui4pN
 dvtAT0hLpCgWJaMxkopqKUYPyZU9V6ZFMsPRdfLLOzLrfNE0CpcCLAWmX
 hfufgvLF4/FvmYbFQ8LZWhGlojjQv5Me2AkDt0X2E3G32shV7On/iLYQr Q==;
X-CSE-ConnectionGUID: IZCV480+Szm7QWcKoSnWzA==
X-CSE-MsgGUID: yf3ioBTZRVOLH15mIvogWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26190231"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="26190231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:57:17 -0700
X-CSE-ConnectionGUID: surcUbvwRxqetMXdmNrEGg==
X-CSE-MsgGUID: 9/CNBshhRk+c5fkwD0HcEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="70636409"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:57:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: himal.prasad.ghimiray@intel.com, Apoorva Singh <apoorva.singh@intel.com>
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
In-Reply-To: <20240923110633.19545-1-apoorva.singh@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240923110633.19545-1-apoorva.singh@intel.com>
Date: Mon, 23 Sep 2024 14:57:11 +0300
Message-ID: <87ikum60rs.fsf@intel.com>
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

On Mon, 23 Sep 2024, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
>
> Check the return values of the functions xe_force_wake_get()
> and xe_force_wake_put() to prevent mistakenly treating them as
> void returns.
>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 274737417b0f..eaeaae1df198 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -890,9 +890,9 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));

Up to the xe maintainers, but personally I very much dislike "hiding"
functional stuff inside *WARN_ON(). It's harder to read. IMO it should
be only for checks, and functions without side effects.

And while we're at it, unrelated to this patch, what's the point of
XE_WARN_ON?

It's defined to be just WARN_ON. But for multi-GPU systems you'd benefit
from using drm_WARN_ON() with device info. But for that you'd need to
pass drm device, and a simple redefinition doesn't even work.

There are a little over 100 uses, but more seem to crop up all the time,
and people love to cargo cult this kind of stuff. It's not too late to
change course now, but it's a royal PITA to change this when you have 1k
of them.


BR,
Jani.


>  }
>  
>  /**

-- 
Jani Nikula, Intel
