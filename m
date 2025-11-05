Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58564CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 13:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019BA10E072;
	Wed,  5 Nov 2025 13:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If/QAvhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923A10E072
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 13:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762349235; x=1793885235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dNIntkDdfFjMKuTCTAb9+shWwZ5l2ab/G82tBSmpA2Y=;
 b=If/QAvhH8d5GnbirNkSjEq3EEOhFIWKN2o7rlzS8EJGe400OhHyT36Ka
 /tZqlk2/tFuW9mkoQ4JBZRFQcCLKCx9HC2eMTczGRKVT3wV8R9ypc1rWu
 Y3T32YQHSZd3eqmcwqoOtDPFWxXLQQNub2S0AQfJWpYeH1qq/G4+bvfTK
 gwKQxhO540mL7qvaqXdt1MhbxhXy+Gb25gIdqja7OkvrPM/dMqJN2X+np
 u9i4q+nKTMCt4VSwyfUsZxxZC+b8vuL2Of7ikNNP9sabNqVSfVELBYKJe
 V481EbSz+LAr0YTIiY39VLhUN2W/SlPexKJlYm25/8ZcLL5Hfea+jhN46 w==;
X-CSE-ConnectionGUID: hn3rqw6zSMOTF2D2WHWNKA==
X-CSE-MsgGUID: U13i1SxVR2i8aY6yz4Xbfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64345025"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64345025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 05:27:14 -0800
X-CSE-ConnectionGUID: MTaBmrZqSYOX55nlvxwHpg==
X-CSE-MsgGUID: OurqLwHuTrWfWc3Fe2Z9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187617599"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 05:27:15 -0800
Date: Wed, 5 Nov 2025 14:27:11 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQtQr4ks-Nxi2z1W@black.igk.intel.com>
References: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
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

On Tue, Nov 04, 2025 at 02:20:51PM -0800, Lucas De Marchi wrote:
> It's currently not possible to safely monitor if there's throttling
> happening and what are the reasons. The approach of reading the status
> and then reading the reasons is not reliable as by the time sysadmin
> reads the reason, the throttling could not be happening anymore.
> 
> Previous tentative to fix that[1] was breaking the ABI and potentially
> sysadmin's scripts. This takes a different approach of adding and
> documenting the additional attribute. It's still valuable, though
> redundant, to provide the simpler 0/1 interface.
> 
> In order to avoid userspace knowledge on the bitmask meaning and to be
> able to maintain the kernel side in sync with possible changes in
> future, just walk the attribute group and check what are the masks that
> match the value read.
> 
> [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

...

> +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> +
> +static ssize_t reasons_show(struct kobject *kobj,
> +			    struct kobj_attribute *attr, char *buff)
> +{
> +	struct xe_gt *gt = throttle_to_gt(kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct attribute_group *group;
> +	struct attribute **pother;
> +	ssize_t ret = 0;
> +	u32 reasons;
> +
> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> +	if (!reasons)
> +		goto ret_none;
> +
> +	group = get_platform_throttle_group(xe);
> +	for (pother = group->attrs; *pother; pother++) {
> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> +
> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> +	}
> +
> +	if (drm_WARN_ONCE(&xe->drm, !ret, "Unknown reason: %#x\n", reasons))

Nit: I know we're masking it but I'm a bit more used to the full format for
register values, i.e. 0x%08x

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +		goto ret_none;
> +
> +	/* Drop extra space from last iteration above */
> +	ret--;
> +	ret += sysfs_emit_at(buff, ret, "\n");
> +
> +	return ret;
> +
> +ret_none:
> +	return sysfs_emit(buff, "none\n");
> +}
> +
>  #define THROTTLE_ATTR_RO(name, _mask)				\
>  	struct throttle_attribute attr_##name =	{		\
>  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
>  		.mask = _mask,					\
>  	}
>  
> +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
> +	struct throttle_attribute attr_##name =	{		\
> +		.attr = __ATTR(name, 0444, _show, NULL),	\
> +		.mask = _mask,					\
> +	}
> +
> +static THROTTLE_ATTR_RO_FUNC(reasons, 0, reasons_show);
>  static THROTTLE_ATTR_RO(status, U32_MAX);
>  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
>  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> @@ -128,6 +180,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
>  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
>  
>  static struct attribute *throttle_attrs[] = {
> +	&attr_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> @@ -153,6 +206,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
>  
>  static struct attribute *cri_throttle_attrs[] = {
>  	/* Common */
> +	&attr_reasons.attr.attr,
>  	&attr_status.attr.attr,
>  	&attr_reason_pl1.attr.attr,
>  	&attr_reason_pl2.attr.attr,
> 
> 
> 
