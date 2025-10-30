Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F79CCF9E3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 16:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A9E10E9FD;
	Thu, 30 Oct 2025 16:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJJveKeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CCF10E9FE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761840410; x=1793376410;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oKcEYwt2HUmd6KOn7O6kgLTGDoonjWfbWQswIlCsmCQ=;
 b=FJJveKeOlq2qbc4YUbEWRoWQQM3BSzSBsPHfpQSpSascVhgx3OGhtJn1
 zT31koy/ge0L2uIzWcZBaGS9tTAYEysaG8OUT60f9uwb/lcG9VXMqMxV6
 4ZkURrARsxV7ZC4Ob8kRTiKTU9WXdW+rUmxcgU59f5n8S+orI9Hq9OYOv
 P/EAH0GyB05z1N1FOtVcDbVZKGezyJ06WNrJOuC9DWn2CWcjrv4jUJa8S
 Y4itR+DPYucFYb0rn/BUJG/eTu4z2YvAtH8NU32ckGiHyklaBU3SUjg1h
 UaEeYT7D+MUAwDJkFe8Tr2m0avXKsAlCG2hC/EX+1iJJxVPzkI6u2r1Lg w==;
X-CSE-ConnectionGUID: 2ZBMF+jvTfuhPu20RC2org==
X-CSE-MsgGUID: q9KgPTvPTgi1U9zN4UOgYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51560314"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="51560314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:06:50 -0700
X-CSE-ConnectionGUID: gCGgG9URShy9y9l9/QKjiA==
X-CSE-MsgGUID: dQvP+OtjRb2ouNt8/SilAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185653492"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 09:06:49 -0700
Date: Thu, 30 Oct 2025 17:06:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQONFr2dRVU93R3T@black.igk.intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
 <aQM1oKHBh0GvQQK5@black.igk.intel.com>
 <jnuis4h4uq7he4yq52rsb7ee6jffgclyf4skvftu3m3gsnk7xy@vhtbsgchkvyx>
 <aQOIdza-zd3ES9xw@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQOIdza-zd3ES9xw@intel.com>
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

On Thu, Oct 30, 2025 at 11:47:03AM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 30, 2025 at 09:55:30AM -0500, Lucas De Marchi wrote:
> > On Thu, Oct 30, 2025 at 10:53:36AM +0100, Raag Jadav wrote:
> > > On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
> > > > It's currently not possible to safely monitor if there's throttling
> > > > happening and what are the reasons. The approach of reading the status
> > > > and then reading the reasons is not reliable as by the time sysadmin
> > > > reads the reason, the throttling could not be happening anymore.
> > > > 
> > > > Previous tentative to fix that[1] was breaking the ABI and potentially
> > > > sysadmin's scripts. This takes a different approach of adding and
> > > > documenting the additional attribute. It's still valuable, though
> > > > redundant, to provide the simpler 0/1 interface.
> > > > 
> > > > In order to avoid userspace knowledge on the bitmask meaning and to be
> > > > able to maintain the kernel side in sync with possible changes in
> > > > future, just walk the attribute group and check what are the masks that
> > > > match the value read.
> > > > 
> > > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
> > > 
> > > ...
> > > 
> > > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
> > > > +
> > > > +static ssize_t status_reasons_show(struct kobject *kobj,

Semantically there's much of a 'status' here, so this could simply be
'reasons' (and same for the attribute name).

> > > > +				   struct kobj_attribute *attr, char *buff)
> > > > +{
> > > > +	struct xe_gt *gt = throttle_to_gt(kobj);
> > > > +	struct xe_device *xe = gt_to_xe(gt);
> > > > +	const struct attribute_group *group;
> > > > +	struct attribute **pother;
> > > > +	ssize_t ret = 0;
> > > > +	u32 reasons;
> > > > +
> > > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> > > > +	group = get_platform_throttle_group(xe);
> > > > +
> > > > +	for (pother = group->attrs; *pother; pother++) {
> > > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> > > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> > > > +
> > > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> > > > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> > > 
> > > Much better.
> > > 
> > > > +	}
> > > > +
> > > > +	/* Drop extra space from last iteration above */
> > > > +	if (ret)
> > > > +		ret--;
> > > > +
> > > > +	ret += sysfs_emit_at(buff, ret, "\n");
> > > 
> > > I went through the documentation again and I couldn't find any rules
> > > related to empty files or whether it is allowed (just thinking out
> > > loud about no throttling cases).
> > 
> > do you mean if "empty" files are allowed in sysfs? I don't think there's
> > any problem with that. It's also not empty, it has a newline there ;)
> 
> alternatively we could print the entire reg in hex format?
> But I prefer the text line in this patch.
> 
> Nothing against the 'empty' file with or without the new-line,
> but perhaps we could consider to track that in the loop
> and if none is add we print
> 
> if (ret)
> 	ret--;
> else
> 	sysfs_emit_at(buff, ret, "none");
> 
> and document that above...

+1.

PS: A good read[1] if anyone's interested.

[1] https://lwn.net/Articles/378884/

Raag
