Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ED9CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 09:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DA110E8FA;
	Thu, 30 Oct 2025 09:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHUHcKc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556410E8FA
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761818020; x=1793354020;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5SgYrXoJ80aUfbl5wXQz6vVG/wf+RxJJI1C8xEB/00s=;
 b=GHUHcKc3f6RS63a+389B22vF0MFW7/5IniPg6NMnyqilmKN8jXfujM6T
 vAOxJOVt1wn7vJhtD80hjA4xCt8fmKIA9lV6/sXObZ4YbJx9mUVq1xsIa
 tgkuGRGkpPlFjWl+S0jTiOBeU/bJMsvrDrJh2tDgtdDIdkuZeh1tqZupm
 p92w3NjI+BM33EazwAiyPsZw7Egffr70wCEpXv8zWDrg75Bvx25eHQKVe
 iRwKS+KgofJm3xcrylqJcT3YZ0xdgS299eo499rolbyXYD+RkVNTt6+NZ
 jVxZqm6IdTfhtreQQA1Sl+nCZmgZ01sj9r39rbxF+osYFzC2VSNPPLEdf g==;
X-CSE-ConnectionGUID: MjBwkq2vSiu7qGZPO0uaIQ==
X-CSE-MsgGUID: /uVipNDpTTCNE6G0VJMkCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81373245"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="81373245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:53:40 -0700
X-CSE-ConnectionGUID: 5S4NFyLEQJSULL7VzTJHtw==
X-CSE-MsgGUID: evRjfE8dR4KRDyGdA0to4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="223132764"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 02:53:39 -0700
Date: Thu, 30 Oct 2025 10:53:36 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 8/8] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQM1oKHBh0GvQQK5@black.igk.intel.com>
References: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
 <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-gt-throttle-cri-v3-8-d1f5abbb8114@intel.com>
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

On Wed, Oct 29, 2025 at 04:45:10PM -0700, Lucas De Marchi wrote:
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
> +static ssize_t status_reasons_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buff)
> +{
> +	struct xe_gt *gt = throttle_to_gt(kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	const struct attribute_group *group;
> +	struct attribute **pother;
> +	ssize_t ret = 0;
> +	u32 reasons;
> +
> +	reasons = xe_gt_throttle_get_limit_reasons(gt);
> +	group = get_platform_throttle_group(xe);
> +
> +	for (pother = group->attrs; *pother; pother++) {
> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> +
> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);

Much better.

> +	}
> +
> +	/* Drop extra space from last iteration above */
> +	if (ret)
> +		ret--;
> +
> +	ret += sysfs_emit_at(buff, ret, "\n");

I went through the documentation again and I couldn't find any rules
related to empty files or whether it is allowed (just thinking out
loud about no throttling cases).

Thoughts?

Raag
