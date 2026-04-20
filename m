Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A47EF5A8C6
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 21:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4549E10E771;
	Mon, 20 Apr 2026 21:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXXYX9zf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C545610E771;
 Mon, 20 Apr 2026 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776718808; x=1808254808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PxLzUjDWq3WdbTkvOEYrCxwuTAA72lTz6XE+9X5+LMs=;
 b=LXXYX9zfkevK22nid3y0mzAbTGjZeR/86//GcBevqKfdJvq7PMJd+GgS
 2Yw7XFM8XQ9/m0onIgbYVqFLh2iX7Eit4djS5rIkg9QJrRQdc4nEYUHvC
 1liKM8Q61b8uhbDwm0Z7+V9TaooE8frBZxouBmvJyilxFib5DUWpGjMDs
 CTeREKAYU4wqFP+mb+bPVWrnOTnqHEG/7E3YTuAv3V6zEL4278iSl20cL
 nfyr67fu6Ax9ZfkcdjDI4XXH0AUYYHgVBA0gdVAGCQ+e0c0CSHrS+FLuE
 owodUcyPw5DekwxyhJ/m3VaKtcI0i+ME91shnrqzVana5DPfpvOQgR8Af Q==;
X-CSE-ConnectionGUID: H4wh4hJsTSmCEbwT/+7SFg==
X-CSE-MsgGUID: Dbo/vDYdSJKu1vUrqYC9tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76810000"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="76810000"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 14:00:07 -0700
X-CSE-ConnectionGUID: bBK0VZzeTamSHDOhC57kPw==
X-CSE-MsgGUID: JOIO4hleS0GLuAMNSty0Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="229155717"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.159])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:00:06 -0700
Date: Tue, 21 Apr 2026 00:00:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com
Subject: Re: [PATCH] drm/i915: remove unused DPLL_TEST register definitions
Message-ID: <aeaT07EcZ8jXeR41@intel.com>
References: <20260420204715.3906215-1-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420204715.3906215-1-luciano.coelho@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, Apr 20, 2026 at 11:46:47PM +0300, Luca Coelho wrote:
> Remove the old DPLL_TEST register definitions from i915_reg.h.
> 
> They are no longer used anywhere in the driver.

Reading register definitions is easier than reading the spec.
So unless they are incorrect I don't want to remove the
register definitions for anything.

> 
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5d99b99b0c57..68bd0b3a6f83 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -509,18 +509,6 @@
>  #define   IVB_SPR_STRETCH_MAX_X2	REG_FIELD_PREP(IVB_SPR_STRETCH_MAX_MASK, 2)
>  #define   IVB_SPR_STRETCH_MAX_X1	REG_FIELD_PREP(IVB_SPR_STRETCH_MAX_MASK, 3)
>  
> -#define DPLL_TEST	_MMIO(0x606c)
> -#define   DPLLB_TEST_SDVO_DIV_1		(0 << 22)
> -#define   DPLLB_TEST_SDVO_DIV_2		(1 << 22)
> -#define   DPLLB_TEST_SDVO_DIV_4		(2 << 22)
> -#define   DPLLB_TEST_SDVO_DIV_MASK	(3 << 22)
> -#define   DPLLB_TEST_N_BYPASS		(1 << 19)
> -#define   DPLLB_TEST_M_BYPASS		(1 << 18)
> -#define   DPLLB_INPUT_BUFFER_ENABLE	(1 << 16)
> -#define   DPLLA_TEST_N_BYPASS		(1 << 3)
> -#define   DPLLA_TEST_M_BYPASS		(1 << 2)
> -#define   DPLLA_INPUT_BUFFER_ENABLE	(1 << 0)
> -
>  #define D_STATE		_MMIO(0x6104)
>  #define  DSTATE_GFX_RESET_I830			(1 << 6)
>  #define  DSTATE_PLL_D3_OFF			(1 << 3)
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
