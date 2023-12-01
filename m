Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF046C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 20:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA8D10E95A;
	Fri,  1 Dec 2023 20:52:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06CF10E955
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701463959; x=1732999959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DpiGrV2aLZtoEXzw17wX5VEwe5GfUvUE5sPxrJj/dL8=;
 b=oJgIWzAwaRO5zvThz77XHeOZxpICYCaCR3ZHkAlkAA/YsLQxB8sY+HK8
 qnuw/zfxgFNnZAEbGx6FADSMx7RauIFLU1WUb9oRwaBAL+E95ybunQqZr
 be44AtYblWwhKXih/SfMePZ52HJgN1kclYapd3ERsOGg+AkHrJ5m/UQfd
 rQtgufKkriFVaw+1kESYyzaa7LjbUsFRMrmuGKFf4YHdsufGTLlDTGsrA
 BP11sMGEpJbT9PSEb9Z+tpwCtVy+rolR9mo5n9ic4hXrRLgOiqNLaYtDn
 9mhNUmRa+K7NqgW4trRS8KtAb2eWU17ft7IhzYbzJC+Gxr43spEYyGv3s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="15095062"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="15095062"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="773555128"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; d="scan'208";a="773555128"
Received: from ipollak-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.73])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 12:52:32 -0800
Date: Fri, 1 Dec 2023 21:52:28 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZWpHjLio4sNtHWnm@ashyti-mobl2.lan>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
 <20231129025716.9094-2-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129025716.9094-2-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe: Enable Fixed CCS mode setting
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Niranjana,

looks good, just a few comments below.

...

> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> +{
> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_hw_engine *hwe;
> +	int num_slices = hweight32(CCS_MASK(gt));
> +	int width, cslice;
> +	enum xe_hw_engine_id id;

please put 'id' and 'hwe' inside the for ()

> +	u32 config = 0;

this should actually be sorted in a reverse Christmas tree shape.

> +	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
> +
> +	xe_assert(xe, num_engines && num_engines <= num_slices);
> +	xe_assert(xe, !(num_slices % num_engines));
> +
> +	/*
> +	 * Loop over all available slices and assign each a user engine.
> +	 *
> +	 * With 1 engine (ccs0):
> +	 *   slice 0, 1, 2, 3: ccs0
> +	 *
> +	 * With 2 engines (ccs0, ccs1):
> +	 *   slice 0, 2: ccs0
> +	 *   slice 1, 3: ccs1
> +	 *
> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
> +	 *   slice 0: ccs0
> +	 *   slice 1: ccs1
> +	 *   slice 2: ccs2
> +	 *   slice 3: ccs3
> +	 */
> +	for (width = num_slices / num_engines, cslice = 0; width--;) {

why not

	for (....; width > 0; width--) {
		...
	}

as normally it's done? :-)

> +		for_each_hw_engine(hwe, gt, id) {
> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
> +				continue;
> +
> +			if (hwe->logical_instance >= num_engines)
> +				break;
> +
> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
> +
> +			/* If a slice is fused off, leave disabled */
> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
> +				cslice++;
> +
> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
> +			cslice++;
> +		}
> +	}
> +
> +	xe_mmio_write32(gt, CCS_MODE, mode);
> +
> +	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> +		   mode, config, num_engines, num_slices);
> +}
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
> +{
> +	if (gt->ccs_mode.num_engines)
> +		__xe_gt_apply_ccs_mode(gt, gt->ccs_mode.num_engines);
> +}

I don't see the need for this wrapper here... just:

void xe_gt_apply_ccs_mod(struct xe_gt *gt)
{
	u32 num_engines = gt->css_mode.num_engines;

	if (!num_engines)
		return;
	
	...
}

...

> +static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
> +{
> +	/* Enable CCS mode interface on all platforms with more than one CCS engine */

This comment is misleading, since it's not doing any operation,
please, replace "Enable..." with "Check if it's enabled..."

> +	return hweight32(CCS_MASK(gt)) > 1;
> +}
> +
> +#endif

...

> +	/**
> +	 * @ccs_mode: Fixed mapping between CCS engines and compute slices.
> +	 * Through the per-gt 'ccs_mode' sysfs interface, the user can specify a
> +	 * fixed number of compute hardware engines to which the available compute
> +	 * slices are to be allocated. By default all compute slices are allocated
> +	 * to the first available compute engine instance. This user configuration
> +	 * change triggers a gt reset and it is expected that there are no open
> +	 * drm clients while doing so.
> +	 */
> +	struct {
> +		/** @num_engines: Number of CCS engines enabled */
> +		u32 num_engines;
> +	} ccs_mode;

why the need to have a struct here? It looks free complexity to
me.

Andi

> +
