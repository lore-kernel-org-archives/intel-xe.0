Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B73FC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D9710E0F7;
	Fri, 15 Dec 2023 15:06:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A36310E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702652812; x=1734188812;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=NjqqWHrKoSPtfUSqpmbV7eDvpP/ayToB5H5cN4kPQXc=;
 b=WzbLoeNRWN7ORWPCuZcBmh1TjhJoP7DZT4JHPz7RtoueUskfCiCVvEJr
 /btTZTT7QrwHDAmcXQy2QMgtV/t7M3sJ6DaWfDhVkcKjmX24/AUCvQzcN
 2SuZ9ymqLEqmG+ltz89srVl6FJf5FvjZUzccgkA34+R05rPhyX/tuNC7S
 Z92o1e8FJP/aTzv5Y36px68PnpiNOJuVT77KLzegTy7DAlrRywsCvRbnZ
 AB1Q0gjhzqxUuCetn+lMlwlpMtXD+gFi0bSe8C8giieWbhF/n2kSFsgVb
 VZ9K6p/WTsgy5B1tH72MA9SNs3WqWG8YSXE+MOpkSHnvfxBcPE6aadJAE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2453591"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2453591"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="809000844"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="809000844"
Received: from eparshut-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.224])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:06:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Kershner <david.kershner@intel.com>, david.kershner@intel.com,
 intel-xe@lists.freedesktop.org, michael.j.ruhl@intel.com,
 john.fleck@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v3 1/3] drm/xe: Introduce XeLink device
In-Reply-To: <20231213214525.2584729-2-david.kershner@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231213214525.2584729-1-david.kershner@intel.com>
 <20231213214525.2584729-2-david.kershner@intel.com>
Date: Fri, 15 Dec 2023 17:06:44 +0200
Message-ID: <87v88zv723.fsf@intel.com>
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

On Wed, 13 Dec 2023, David Kershner <david.kershner@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d1a48456e9a3..6b3ff57f358c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,6 +21,7 @@
>  #include "xe_pmu.h"
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
> +#include "xe_link.h"

Nothing in this file requires you to include xe_link.h.

I've put a lot of effort into untangling the insane header
interdependencies in i915; please take care to not create the same in
xe.

BR,
Jani.

>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  #include "soc/intel_pch.h"
> @@ -255,6 +256,8 @@ struct xe_device {
>  		u8 has_asid:1;
>  		/** @force_execlist: Forced execlist submission */
>  		u8 force_execlist:1;
> +		/** @has_xelink: Has XeLink */
> +		u8 has_xelink:1;
>  		/** @has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @has_llc: Device has a shared CPU+GPU last level cache */
> @@ -439,6 +442,28 @@ struct xe_device {
>  	/** @needs_flr_on_fini: requests function-reset on fini */
>  	bool needs_flr_on_fini;
>  
> +	/** @xelink: XeLink information, for those gpus with XeLink connectivity */
> +	struct {
> +		/** @ops: shared interface operations */
> +		const struct xelink_ops *ops;
> +		/** @handle: XeLink device handle */
> +		void *handle;
> +		/** @pd: platform data needed for auxiliary bus */
> +		struct xelink_pdata *pd;
> +		/** @dpa: base device physical address */
> +		u64 dpa;
> +		/** @irq_base: base IRQ for multi tile devices */
> +		int irq_base;
> +		/** @index: internal index for xe devices */
> +		int index;
> +		/** @xelink_id: XeLink id generated by the XeLink device */
> +		u32 xelink_id;
> +		/** @socket_id: socket from certain platforms */
> +		u8 socket_id;
> +		/* @present: Reflect PUNIT presence information */
> +		bool present;
> +	} xelink;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index f74684660475..1e8c0d3cf17f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -358,6 +358,8 @@ struct xe_gt {
>  		/** @oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +	/** @xelink_irq: IRQ value assigned to the Xelink device */
> +	int xelink_irq;
>  };
>  
>  #endif

-- 
Jani Nikula, Intel
