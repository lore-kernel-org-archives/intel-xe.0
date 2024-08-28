Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB37AC71133
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 20:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4AA10E5D5;
	Wed, 28 Aug 2024 20:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvW/26R3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DD010E5D5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 20:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724877421; x=1756413421;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0rlCBlJ9IwiQu1UT5gO4MYBd27A2M7ao3s2gyyQmznc=;
 b=LvW/26R361BvDUN2cOOaQWIgiBnh4H3HBeDLUDvmnibQXUhx67eLtuTf
 LMTwbTXgAsN2kH39DewefBLSGNra8uENW9ZM2jnis7CDrAWdhLBy0d7Om
 YP2q4svbtVqxssECrXWwLc0LFouKhPXf2B1aT0JVNxvWEpal2UvlY26RV
 2Xu2yfgWNpqqy96fqnwIunbG/Sc/N52SbTqZMfWU0vDFEDJQ9BFnrqWLS
 1IxW1ZXbaD3XFEO1F58MT5ZeuexQGeNPaPbnamEQUfrzUxwqtob/kk06z
 s7HgiFpj5o6ba5P0lkfOt92cazycqcshNWQ2A+fjEIl1pmZby0GAOS/ce g==;
X-CSE-ConnectionGUID: /EoFa/f8RQS27bgXPpoH/Q==
X-CSE-MsgGUID: oosH4gesSUihX2UobrRL8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34590534"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="34590534"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 13:37:00 -0700
X-CSE-ConnectionGUID: oK+YyBz8S76LuEA0qH1ryw==
X-CSE-MsgGUID: UXFyUfKOS1GJwGbGLIwiSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="64045218"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 28 Aug 2024 13:36:58 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 59E68312D4;
 Wed, 28 Aug 2024 21:36:56 +0100 (IST)
Message-ID: <fd92d6e3-f250-4f12-8ffe-b026b98da64b@intel.com>
Date: Wed, 28 Aug 2024 22:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe: add memirq offsets for engine instance 0
 to hw engine properties
To: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, niranjana.vishwanathapura@intel.com,
 matthew.brost@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
References: <20240828091841.1840086-1-ilia.levi@intel.com>
 <20240828091841.1840086-4-ilia.levi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240828091841.1840086-4-ilia.levi@intel.com>
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



On 28.08.2024 11:18, Ilia Levi wrote:
> This is needed for accessing memirq interrupt status and source for
> MSI-X devices.
> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 28 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 18980238a2ea..2262968f2896 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -44,6 +44,7 @@ struct engine_info {
>  	unsigned int class : 8;
>  	unsigned int instance : 8;
>  	unsigned int irq_offset : 8;
> +	unsigned int e0_irq_offset : 8;
>  	enum xe_force_wake_domains domain;
>  	u32 mmio_base;
>  };
> @@ -54,6 +55,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_RENDER,
>  		.instance = 0,
>  		.irq_offset = ilog2(INTR_RCS0),
> +		.e0_irq_offset = ilog2(INTR_RCS0),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = RENDER_RING_BASE,
>  	},
> @@ -62,6 +64,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 0,
>  		.irq_offset = ilog2(INTR_BCS(0)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = BLT_RING_BASE,
>  	},
> @@ -70,6 +73,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 1,
>  		.irq_offset = ilog2(INTR_BCS(1)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS1_RING_BASE,
>  	},
> @@ -78,6 +82,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 2,
>  		.irq_offset = ilog2(INTR_BCS(2)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS2_RING_BASE,
>  	},
> @@ -86,6 +91,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 3,
>  		.irq_offset = ilog2(INTR_BCS(3)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS3_RING_BASE,
>  	},
> @@ -94,6 +100,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 4,
>  		.irq_offset = ilog2(INTR_BCS(4)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS4_RING_BASE,
>  	},
> @@ -102,6 +109,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 5,
>  		.irq_offset = ilog2(INTR_BCS(5)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS5_RING_BASE,
>  	},
> @@ -110,6 +118,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 6,
>  		.irq_offset = ilog2(INTR_BCS(6)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS6_RING_BASE,
>  	},
> @@ -117,6 +126,7 @@ static const struct engine_info engine_infos[] = {
>  		.name = "bcs7",
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.irq_offset = ilog2(INTR_BCS(7)),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.instance = 7,
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS7_RING_BASE,
> @@ -126,6 +136,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COPY,
>  		.instance = 8,
>  		.irq_offset = ilog2(INTR_BCS8),
> +		.e0_irq_offset = ilog2(INTR_BCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = XEHPC_BCS8_RING_BASE,
>  	},
> @@ -135,6 +146,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 0,
>  		.irq_offset = 32 + ilog2(INTR_VCS(0)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX0,
>  		.mmio_base = BSD_RING_BASE,
>  	},
> @@ -143,6 +155,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 1,
>  		.irq_offset = 32 + ilog2(INTR_VCS(1)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX1,
>  		.mmio_base = BSD2_RING_BASE,
>  	},
> @@ -151,6 +164,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 2,
>  		.irq_offset = 32 + ilog2(INTR_VCS(2)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX2,
>  		.mmio_base = BSD3_RING_BASE,
>  	},
> @@ -159,6 +173,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 3,
>  		.irq_offset = 32 + ilog2(INTR_VCS(3)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX3,
>  		.mmio_base = BSD4_RING_BASE,
>  	},
> @@ -167,6 +182,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 4,
>  		.irq_offset = 32 + ilog2(INTR_VCS(4)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX4,
>  		.mmio_base = XEHP_BSD5_RING_BASE,
>  	},
> @@ -175,6 +191,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 5,
>  		.irq_offset = 32 + ilog2(INTR_VCS(5)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX5,
>  		.mmio_base = XEHP_BSD6_RING_BASE,
>  	},
> @@ -183,6 +200,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 6,
>  		.irq_offset = 32 + ilog2(INTR_VCS(6)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX6,
>  		.mmio_base = XEHP_BSD7_RING_BASE,
>  	},
> @@ -191,6 +209,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_DECODE,
>  		.instance = 7,
>  		.irq_offset = 32 + ilog2(INTR_VCS(7)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VCS(0)),
>  		.domain = XE_FW_MEDIA_VDBOX7,
>  		.mmio_base = XEHP_BSD8_RING_BASE,
>  	},
> @@ -199,6 +218,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 0,
>  		.irq_offset = 32 + ilog2(INTR_VECS(0)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
>  		.domain = XE_FW_MEDIA_VEBOX0,
>  		.mmio_base = VEBOX_RING_BASE,
>  	},
> @@ -207,6 +227,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 1,
>  		.irq_offset = 32 + ilog2(INTR_VECS(1)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
>  		.domain = XE_FW_MEDIA_VEBOX1,
>  		.mmio_base = VEBOX2_RING_BASE,
>  	},
> @@ -215,6 +236,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 2,
>  		.irq_offset = 32 + ilog2(INTR_VECS(2)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
>  		.domain = XE_FW_MEDIA_VEBOX2,
>  		.mmio_base = XEHP_VEBOX3_RING_BASE,
>  	},
> @@ -223,6 +245,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_VIDEO_ENHANCE,
>  		.instance = 3,
>  		.irq_offset = 32 + ilog2(INTR_VECS(3)),
> +		.e0_irq_offset = 32 + ilog2(INTR_VECS(0)),
>  		.domain = XE_FW_MEDIA_VEBOX3,
>  		.mmio_base = XEHP_VEBOX4_RING_BASE,
>  	},
> @@ -231,6 +254,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 0,
>  		.irq_offset = ilog2(INTR_CCS(0)),
> +		.e0_irq_offset = ilog2(INTR_CCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE0_RING_BASE,
>  	},
> @@ -239,6 +263,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 1,
>  		.irq_offset = ilog2(INTR_CCS(1)),
> +		.e0_irq_offset = ilog2(INTR_CCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE1_RING_BASE,
>  	},
> @@ -247,6 +272,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 2,
>  		.irq_offset = ilog2(INTR_CCS(2)),
> +		.e0_irq_offset = ilog2(INTR_CCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE2_RING_BASE,
>  	},
> @@ -255,6 +281,7 @@ static const struct engine_info engine_infos[] = {
>  		.class = XE_ENGINE_CLASS_COMPUTE,
>  		.instance = 3,
>  		.irq_offset = ilog2(INTR_CCS(3)),
> +		.e0_irq_offset = ilog2(INTR_CCS(0)),
>  		.domain = XE_FW_RENDER,
>  		.mmio_base = COMPUTE3_RING_BASE,
>  	},
> @@ -481,6 +508,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->instance = info->instance;
>  	hwe->mmio_base = info->mmio_base;
>  	hwe->irq_offset = info->irq_offset;
> +	hwe->e0_irq_offset = info->e0_irq_offset;

hmm, maybe instead of adding new member to the engine_info and the hwe
all you need is a helper function to lookup engine by instance and then:

	hwe->irq_offset = USES_MSIX() ?
		lookup_hwe(info->class, 0)->irq_offset :
		info->irq_offset;

as likely the old irq_offset is meaningless in MSIX mode, no?

>  	hwe->domain = info->domain;
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 39f24012d0f4..18998e204458 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -118,6 +118,8 @@ struct xe_hw_engine {
>  	u16 logical_instance;
>  	/** @irq_offset: IRQ offset of this hw engine */
>  	u16 irq_offset;
> +	/** @e0_irq_offset: IRQ offset of engine instance 0 (of that class) */
> +	u16 e0_irq_offset;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
>  	/**
