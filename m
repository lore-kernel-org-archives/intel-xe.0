Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35030CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 13:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC77F10E072;
	Wed,  5 Nov 2025 13:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cf6l9r1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862B910E072
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Nov 2025 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762349757; x=1793885757;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YjmArwL6BpOgXHEmSycU0FFRlxPavvmd9Kd872YqIQo=;
 b=cf6l9r1rxH+XlJ2ih6G8SOfWmxGJRXOkXdjvz5ZCrd+dz7NB+Gx/QAB8
 p9rPCruTqbPd0lJUMoAJQHGrURYXJq4bKkH8jE6IsbRLTQLAoHvIMIJdN
 ZF3PsBcmR2WsM2I5NW16j9k3yDLB2fdR2C9ef7gZ/Z5gfes1uBUgFDHwM
 9RajhSSubuR5DrWg43TitUr4wiHqLG03d9C4mrbQVFkATVwVPbMdu4mn/
 K9fFrSRDKW+OugOWMxjf4bFPtnsCGodXh8k2nNzV+ZWrE5CCdiNTyWUZR
 BzYJWZMYExIi/jISdlR9DBJkjIvv/37bmIT0F2Y+MVgru32PaVhb7LGTx w==;
X-CSE-ConnectionGUID: kix1bgj+QoqWXZhDSH+BEw==
X-CSE-MsgGUID: 1T6ZEWsaQsutdnkmy6yuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89924465"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="89924465"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 05:35:57 -0800
X-CSE-ConnectionGUID: SAXroJElQ7G4ntMlgGESpA==
X-CSE-MsgGUID: arblhzzwRiqiVQFxLGhNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186745345"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 05:35:56 -0800
Date: Wed, 5 Nov 2025 14:35:53 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQtSuU6CtNpYU8MU@black.igk.intel.com>
References: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
 <aQtQr4ks-Nxi2z1W@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQtQr4ks-Nxi2z1W@black.igk.intel.com>
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

On Wed, Nov 05, 2025 at 02:27:15PM +0100, Raag Jadav wrote:
> On Tue, Nov 04, 2025 at 02:20:51PM -0800, Lucas De Marchi wrote:
> > It's currently not possible to safely monitor if there's throttling
> > happening and what are the reasons. The approach of reading the status
> > and then reading the reasons is not reliable as by the time sysadmin
> > reads the reason, the throttling could not be happening anymore.
> > 
> > Previous tentative to fix that[1] was breaking the ABI and potentially
> > sysadmin's scripts. This takes a different approach of adding and
> > documenting the additional attribute. It's still valuable, though
> > redundant, to provide the simpler 0/1 interface.
> > 
> > In order to avoid userspace knowledge on the bitmask meaning and to be
> > able to maintain the kernel side in sync with possible changes in
> > future, just walk the attribute group and check what are the masks that
> > match the value read.
> > 
> > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> 
> ...
> 
> > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> > +
> > +static ssize_t reasons_show(struct kobject *kobj,
> > +			    struct kobj_attribute *attr, char *buff)
> > +{
> > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > +	const struct attribute_group *group;
> > +	struct attribute **pother;
> > +	ssize_t ret = 0;
> > +	u32 reasons;
> > +
> > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > +	if (!reasons)
> > +		goto ret_none;
> > +
> > +	group = get_platform_throttle_group(xe);
> > +	for (pother = group->attrs; *pother; pother++) {
> > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> > +
> > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> > +	}
> > +
> > +	if (drm_WARN_ONCE(&xe->drm, !ret, "Unknown reason: %#x\n", reasons))
> 
> Nit: I know we're masking it but I'm a bit more used to the full format for
> register values, i.e. 0x%08x

On second thought, I just checked the mask and realized almost half of it
will be redundant 0s so let's keep it as is :)

> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> 
> > +		goto ret_none;
> > +
> > +	/* Drop extra space from last iteration above */
> > +	ret--;
> > +	ret += sysfs_emit_at(buff, ret, "\n");
> > +
> > +	return ret;
> > +
> > +ret_none:
> > +	return sysfs_emit(buff, "none\n");
> > +}
> > +
> >  #define THROTTLE_ATTR_RO(name, _mask)				\
> >  	struct throttle_attribute attr_##name =	{		\
> >  		.attr = __ATTR(name, 0444, reason_show, NULL),	\
> >  		.mask = _mask,					\
> >  	}
> >  
> > +#define THROTTLE_ATTR_RO_FUNC(name, _mask, _show)		\
> > +	struct throttle_attribute attr_##name =	{		\
> > +		.attr = __ATTR(name, 0444, _show, NULL),	\
> > +		.mask = _mask,					\
> > +	}
> > +
> > +static THROTTLE_ATTR_RO_FUNC(reasons, 0, reasons_show);
> >  static THROTTLE_ATTR_RO(status, U32_MAX);
> >  static THROTTLE_ATTR_RO(reason_pl1, POWER_LIMIT_1_MASK);
> >  static THROTTLE_ATTR_RO(reason_pl2, POWER_LIMIT_2_MASK);
> > @@ -128,6 +180,7 @@ static THROTTLE_ATTR_RO(reason_vr_thermalert, VR_THERMALERT_MASK);
> >  static THROTTLE_ATTR_RO(reason_vr_tdc, VR_TDC_MASK);
> >  
> >  static struct attribute *throttle_attrs[] = {
> > +	&attr_reasons.attr.attr,
> >  	&attr_status.attr.attr,
> >  	&attr_reason_pl1.attr.attr,
> >  	&attr_reason_pl2.attr.attr,
> > @@ -153,6 +206,7 @@ static THROTTLE_ATTR_RO(reason_psys_crit, PSYS_CRIT_MASK);
> >  
> >  static struct attribute *cri_throttle_attrs[] = {
> >  	/* Common */
> > +	&attr_reasons.attr.attr,
> >  	&attr_status.attr.attr,
> >  	&attr_reason_pl1.attr.attr,
> >  	&attr_reason_pl2.attr.attr,
> > 
> > 
> > 
