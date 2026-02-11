Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11347E9E2FD
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 12:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE81510E189;
	Wed, 11 Feb 2026 12:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Adx3aZvc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C510E189;
 Wed, 11 Feb 2026 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770813951; x=1802349951;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lvGAfMFv354LCCily7l1DFsi/DPxnOSDgvqXVGMU0YE=;
 b=Adx3aZvcSTxeL+gsXHUa031hjlCrmXbXfA2QCN48LlgUz7V6Uv0NR8vc
 mVsWoOCG2ek5Q7etyBX129mZc4tOlPzJK1qF93fXPLYQ9yUznq3TKT3kd
 U0A0rVsZTTl6HJ99E4elZymmhZjjxBs4cxi2cMFTTI7Jp+TYGT3bduvyY
 yy08uakrzjILNmbt6GVuacOypzCwiFXDgXO6DnbSXGgnoIwsmwaTs8qOT
 oIL25gd27EguKdjZ5PzH7NgOcf2mxx9Tc8b8jS113JxHy9QMa4QLjdwjy
 j8K3s+KLbaVF6fUUu9tUXOSmJUohvaPHKAZUNsyv365AM5CkY4Lt9Yd8V A==;
X-CSE-ConnectionGUID: 0pm+Gy6cQ12hHIJYibgN3w==
X-CSE-MsgGUID: Mji7QHjSRGWYWx8sBKn2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72052931"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72052931"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:45:50 -0800
X-CSE-ConnectionGUID: ERPg1wKOSDmj9w+PYVVsmA==
X-CSE-MsgGUID: GPHBKHQjR2uoUvbh8hDBBA==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:45:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v4 07/20] drm/i915: Move GMD_ID and mask to intel_gt header
In-Reply-To: <20260205094341.1882816-8-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205094341.1882816-1-uma.shankar@intel.com>
 <20260205094341.1882816-8-uma.shankar@intel.com>
Date: Wed, 11 Feb 2026 14:45:46 +0200
Message-ID: <df0924e9ccb0db4b2f2d6a36660af20bec538b46@intel.com>
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

On Thu, 05 Feb 2026, Uma Shankar <uma.shankar@intel.com> wrote:
> GMD_ID* is relevant only for GT, hence moving the same
> together in gt/intel_gt_regs.h
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h | 3 +++
>  drivers/gpu/drm/i915/i915_reg.h         | 4 ----
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 7421ed18d8d1..14d31882e9e7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -61,6 +61,9 @@
>  
>  #define GMD_ID_GRAPHICS				_MMIO(0xd8c)
>  #define GMD_ID_MEDIA				_MMIO(MTL_MEDIA_GSI_BASE + 0xd8c)
> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>  
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>  #define MTL_STEER_SEMAPHORE			_MMIO(0xfd0)
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 90a5c60e7667..b12c6bf68a2c 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -922,10 +922,6 @@
>  #define   MASK_WAKEMEM				REG_BIT(13)
>  #define   DDI_CLOCK_REG_ACCESS			REG_BIT(7)
>  
> -#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> -#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> -#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> -
>  /* PCH */
>  
>  #define SDEISR  _MMIO(0xc4000)

-- 
Jani Nikula, Intel
