Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4DDCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 16:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC1010E430;
	Mon,  3 Nov 2025 16:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGxIiBhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4068310E430
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762186980; x=1793722980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WEdajW5579kic6VvEJZCQmvRmVG1G11DSqZD6WRVyg8=;
 b=cGxIiBhSIkH0e81g8hQjZV+cDliLHC4MmtpMm95EvP68ncc/GeD1aJZP
 3RhjOqMIEmx8gK6Ke13fNZlqCnqWhctVWgsYWfDVFocZhr0MZ/fZVUlo2
 +UBkYoX3qmH549xrBgg0WUXkQ7yTEbwbvytIZkARd3RmT0iqon3Yz1g/n
 R1LSL9tsgbapXqu98yaJDEFb3HT1dwpepqma4kPRNEsOfI0Br/PyYh7pg
 czcPDhAMMynLpiOpLbPYAF3D+B3VypFabpT0M1NRcxsqU6nm//UK9w8Ex
 qgQjAqAe0aZT5Hn0+vEXShUy8tB1I6bdm43bN3qqR3B5XV+Fii57fVveu A==;
X-CSE-ConnectionGUID: KrmWVUj+RaCY8gkeWmFFJQ==
X-CSE-MsgGUID: wr/9cWtEQX6XkLKQufYekg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63279670"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63279670"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 08:23:00 -0800
X-CSE-ConnectionGUID: f1SyZKc7RlOb6vWou2SnNg==
X-CSE-MsgGUID: qc8KHnX4SximF3vZIz9zVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="217545562"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 08:22:59 -0800
Date: Mon, 3 Nov 2025 17:22:55 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQjW374EgQZH1_KZ@black.igk.intel.com>
References: <20251031-gt-throttle-cri-v4-1-b4691ee9ebf4@intel.com>
 <aQWqyJD6n45ufeZM@black.igk.intel.com>
 <u5iaqtgrobvvzal4t7mjnspuacswc6ul5etk23toitrr7e4wdd@zkwdz2kvsfxf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u5iaqtgrobvvzal4t7mjnspuacswc6ul5etk23toitrr7e4wdd@zkwdz2kvsfxf>
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

On Mon, Nov 03, 2025 at 09:20:40AM -0600, Lucas De Marchi wrote:
> On Sat, Nov 01, 2025 at 07:38:00AM +0100, Raag Jadav wrote:
> > On Fri, Oct 31, 2025 at 09:47:25AM -0700, Lucas De Marchi wrote:
> > > It's currently not possible to safely monitor if there's throttling
> > > happening and what are the reasons. The approach of reading the status
> > > and then reading the reasons is not reliable as by the time sysadmin
> > > reads the reason, the throttling could not be happening anymore.
> > > 
> > > Previous tentative to fix that[1] was breaking the ABI and potentially
> > > sysadmin's scripts. This takes a different approach of adding and
> > > documenting the additional attribute. It's still valuable, though
> > > redundant, to provide the simpler 0/1 interface.
> > > 
> > > In order to avoid userspace knowledge on the bitmask meaning and to be
> > > able to maintain the kernel side in sync with possible changes in
> > > future, just walk the attribute group and check what are the masks that
> > > match the value read.
> > > 
> > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > 
> > ...
> > 
> > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> > > +
> > > +static ssize_t reasons_show(struct kobject *kobj,
> > > +			    struct kobj_attribute *attr, char *buff)
> > > +{
> > > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	const struct attribute_group *group;
> > > +	struct attribute **pother;
> > > +	ssize_t ret = 0;
> > > +	u32 reasons;
> > > +
> > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > > +	group = get_platform_throttle_group(xe);
> > > +
> > > +	for (pother = group->attrs; *pother; pother++) {
> > 
> > Shouldn't this entire loop be inside if (reasons), or did I miss something?
> 
> it could be an optimization, but should work regardless.

Yep, upto you.

> > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> > > +
> > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> > 
> > With above in place this will be much simpler.
> 
> why would it be simpler? we would still skip the status attribute
> (conviniently defined with mask == U32_MAX the status attribute) and
> still do a & with mask

Hm, I had a misconception that we've indexed the attributes as per their
mask value. With that perhaps for_each_set_bit() would've been a great
alternative.

> > > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> > > +	}
> > > +
> > > +	if (ret)
> > > +		/* Drop extra space from last iteration above */
> > > +		ret--;
> > > +	else
> > > +		ret += sysfs_emit_at(buff, ret, "none");
> > 
> > I find the lack of '+' a bit more readable as it guarantees that nothing
> > else is inherited here, or perhaps it's my needless paranoia at work :(
> > Upto you.
> 
> Keeping the pattern is good IMO. If we'd change then it would be for a
> sysfs_emit().
> 
> 	if (!ret)
> 		return sysfs_emit(buff, "none\n");
> 
> 	ret--;
> 	ret += sysfs_emit_at(buff, ret, "\n");
> 
> 	return ret;

Either way works for me :)

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
