Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B78C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA1F10E550;
	Tue,  5 Dec 2023 21:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2C710E60C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701813438; x=1733349438;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tug7IM2Gw1WzYQUMgvq3UkdzpvGxb+fjIq+NYRHqCzM=;
 b=dVwN/aTxVg7Z3NIrgpGMHUmoSMpIo9xnaOyIH6flq+7K+9l4sHR+Ub7i
 sgZsf4WxqQsyJPm0uWW+XmQAYQYW8tMWZqqHdBFrkAMV3ilD6qx1lFapJ
 5y0UAz9eZuhGhFALTmXRJ65GubMgrJvHDGqSl8oSQ+2fL2zIaeNG1P23T
 nU/MkvXX+Hks3FkyTcyEQCcl431jgBZVCSrMwBtFoz3YPj7V9kL0eJDBx
 B3L8B22M0XnXbEKd2y3QzcIC/gSwbcUOUlNn1FyrHgbDnlU6UTDVjt9Az
 cFcQIkZmUiUTwFf5LiavQDKZ2/i+S/SFsaUPahyZXNFhsDzdqYo0J+pxc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1030199"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1030199"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="19112314"
Received: from ckochhof-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.179])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:57:17 -0800
Date: Tue, 5 Dec 2023 22:57:13 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZW-cuW43D-RmXaci@ashyti-mobl2.lan>
References: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
 <20231204053709.30013-2-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204053709.30013-2-niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Enable Fixed CCS mode setting
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

> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
> +{
> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
> +	int num_slices = hweight32(CCS_MASK(gt));
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int width, cslice = 0;
> +	u32 config = 0;
> +
> +	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
> +
> +	xe_assert(xe, num_engines && num_engines <= num_slices);
> +	xe_assert(xe, !(num_slices % num_engines));
> +
> +	/*
> +	 * Loop over all available slices and assign each a user engine.
> +	 * For example, if there are four compute slices available, the
> +	 * assignment of compute slices to compute engines would be,
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
> +	for (width = num_slices / num_engines; width; width--) {
> +		struct xe_hw_engine *hwe;
> +		enum xe_hw_engine_id id;
> +
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

yeah... this looks correct!

> +
> +	xe_mmio_write32(gt, CCS_MODE, mode);
> +
> +	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
> +		   mode, config, num_engines, num_slices);
> +}
> +
> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
> +{
> +	if (!gt->ccs_mode)
> +		return;
> +
> +	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
> +}

I thought you were going to remove this wrapper, but it's OK, I
don't really mind.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
