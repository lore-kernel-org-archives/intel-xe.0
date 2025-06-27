Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C3C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 09:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5663D10E98F;
	Fri, 27 Jun 2025 09:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mt2FrInw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C1810E98F
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751015227; x=1782551227;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=yujBe+VdpawAMTJhdP9i/lSN1e31Q9t91CI5WanvLOc=;
 b=Mt2FrInwIKruqqXZ4RDOkAUIziue4OiJhlwisky7TP5aIzacTBDRdtTS
 KVhpfdH7F/hkHZ/mLQo9fQ1bbbfSH1uXPEvnCkM2Op3U4ntRcSCGITEgg
 RkXS/hGgaU+5izDqW3p+PcvmH2SOpyL7ydVsfYpDgMZQq/FmpyERAoijF
 swhi/axazMXsiYUhROZCIoftZbd9iz1hh59S6vlI+BSf2lQqGvt39pa+v
 2JqHbkojc/pwsEXZKVIBavmGhD0x7tHrKlX+uZozIukrWHdXjVJFXH6Un
 RuCEkhUpMAN6TKOQFIfHDR1plekW2Fcqkyf9NDWyd3z+OKh5f7aWEIOEe A==;
X-CSE-ConnectionGUID: YW8zb4n7R0uOzoBi8yOUyg==
X-CSE-MsgGUID: Dbyr7B0RToWNrteMjVTsgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52444779"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52444779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:07:07 -0700
X-CSE-ConnectionGUID: oqBKOXMFTDyPR8AB1U5S8w==
X-CSE-MsgGUID: aQwUrq/iTb2uwr5O7uI7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153463443"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:07:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] FOR_CI: pcode-fix
In-Reply-To: <20250626-xe-kunit-v1-1-2440e6d9a4b5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250626-xe-kunit-v1-0-2440e6d9a4b5@intel.com>
 <20250626-xe-kunit-v1-1-2440e6d9a4b5@intel.com>
Date: Fri, 27 Jun 2025 12:07:02 +0300
Message-ID: <57bd015e02c14a1e6a28e46aa35957ef89f93faf@intel.com>
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

On Thu, 26 Jun 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Just to test/validate second patch. The solution is being discussed
> at https://lore.kernel.org/intel-xe/gbisrh7ep2gn2fxv7xz4g4sy75qjpmcr5yqdx5atlab2oxevlx@j3zwx3k4o4x4/

I think this is the simplest fix.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 87323ad0cbbb2..08aee78ff08ed 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -337,7 +337,10 @@ int xe_pcode_probe_early(struct xe_device *xe)
>  }
>  ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>  
> -/* Helpers with drm device */
> +
> +/* Helpers with drm device. These should only be called by the display side */
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +
>  int intel_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32 *val1)
>  {
>  	struct xe_device *xe = to_xe_device(drm);
> @@ -362,3 +365,5 @@ int intel_pcode_request(struct drm_device *drm, u32 mbox, u32 request,
>  
>  	return xe_pcode_request(tile, mbox, request, reply_mask, reply, timeout_base_ms);
>  }
> +
> +#endif

-- 
Jani Nikula, Intel
