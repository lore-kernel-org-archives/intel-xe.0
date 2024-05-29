Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A9C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 07:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B6C10E147;
	Wed, 29 May 2024 07:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELplFbkr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE25110E147
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716968189; x=1748504189;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NwO5EJE9XOkOAHxhIpcZbhT/I7hdDRoQnX+wTfOn2OU=;
 b=ELplFbkrblGqvClAAVUKcpJs8volkx0l0UXO4NA6jffOJogxSmJ/6K39
 bDrsvS/bOXSwAJzDadNOThwDN0PPamUiZSWCMc0qnuBb7lQkmqg6xWfGt
 QEPSRFJjfPcghhY+exRn+SMIvjD8KO/pd0ZLzikf5jvWuYZoKEdfz0/dg
 YoaTs3dARYo4wCKdGSI7qAClByFjoGRI0yPBFzVJsNLdsrxlqio5kUZIM
 Lj5tLEeHIWwc9Xx++2oQjfElr7d3BiURj7oE628mPsqQpVANzu00lQMjY
 28FViu3/1XHMRIXiFw1s4g51N+Ufaie5inqpf8wIHnmQfORbH8sZ0Jnkf A==;
X-CSE-ConnectionGUID: S6voeVFqT5So1ANiX/Loxw==
X-CSE-MsgGUID: M+KI/RNARTuOZ/G0Q9d7BQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17192937"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="17192937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 00:36:28 -0700
X-CSE-ConnectionGUID: pnWZXCQRRgaIbIm/oA3tuQ==
X-CSE-MsgGUID: /MiRiOqbTWSavGcMK2KX5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="35273475"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 00:36:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
In-Reply-To: <20240524063228.127423-1-tejas.upadhyay@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
Date: Wed, 29 May 2024 10:36:23 +0300
Message-ID: <87bk4pkr2g.fsf@intel.com>
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

On Fri, 24 May 2024, Tejas Upadhyay <tejas.upadhyay@intel.com> wrote:
> Wa_15015404425 applies to xe2_lpm all steppings
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 722fb6dbb72e..07c8a23bd7c2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -42,6 +42,7 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
>  
> +#define MEDIA_DUMMY_REG				XE_REG(0x138000)
>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
>  
>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ff7a7cf99530..e1dc87078387 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
>  
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!(xe->info.platform == XE_LUNARLAKE))
> +		return;
> +
> +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) == 20) {
> +		int itr = 4;
> +		/* 4 dummy writes */
> +		while (itr--)

If you need to do something N times, the paradigm loop is:

	for (i = 0; i < N; i++)

and nobody has to pause to consider the loop condition.

BR,
Jani.

> +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> +	}
> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -479,6 +494,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }

-- 
Jani Nikula, Intel
