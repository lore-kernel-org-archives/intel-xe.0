Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5991CCF9F0
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 06:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E0A10E12C;
	Sat,  1 Nov 2025 06:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJvMz0Ym";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707F110E12C
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 06:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761979085; x=1793515085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XbxPe9YbDCmnzR9fq6MVcFpp6guEtaVKWSjXgXbvUXM=;
 b=fJvMz0YmEjkn9uKjsMk9GA6APK9VyWfYPLeUY4Xf2zxaA/QH9WTSbau6
 pJwCr6g3sPjk8u+s6bjhzCWIO074Wu0d666CLjfH5U27LKWE4Ug1WDOR8
 uLy58D8I73DpXIxFBMbosaK3tZW26iDN6pQVYzxQ7kE6+9aPz0L4SiP7w
 5JpRd9syH9DvKHY2HT3q+TrGUrRSx+WKAUhtxvTcQxUKoqNO0aNPnxJcJ
 apDZoCDtkUxdmpkAgiys8IaT2Veom16dN1rfzcOGSCXUO0kdxLf8zUEM+
 e2ruY6QM+LRMbhUbB/6PzpYLfcL61CmJAAIZQv9JVc4gDs454fs0Ku9QO A==;
X-CSE-ConnectionGUID: d0TXwgN5Q+G7zN51YNE4kA==
X-CSE-MsgGUID: sKzMQ9RIRM614vs6pllLTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="51707072"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; d="scan'208";a="51707072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 23:38:05 -0700
X-CSE-ConnectionGUID: AXgisKiFT76quDx+S9F/Ew==
X-CSE-MsgGUID: RJzyVGTeTXeU7qgvc2lrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; d="scan'208";a="185682799"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 23:38:04 -0700
Date: Sat, 1 Nov 2025 07:38:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <aQWqyJD6n45ufeZM@black.igk.intel.com>
References: <20251031-gt-throttle-cri-v4-1-b4691ee9ebf4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-gt-throttle-cri-v4-1-b4691ee9ebf4@intel.com>
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

On Fri, Oct 31, 2025 at 09:47:25AM -0700, Lucas De Marchi wrote:
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
> +	group = get_platform_throttle_group(xe);
> +
> +	for (pother = group->attrs; *pother; pother++) {

Shouldn't this entire loop be inside if (reasons), or did I miss something?

> +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
> +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
> +
> +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)

With above in place this will be much simpler.

> +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
> +	}
> +
> +	if (ret)
> +		/* Drop extra space from last iteration above */
> +		ret--;
> +	else
> +		ret += sysfs_emit_at(buff, ret, "none");

I find the lack of '+' a bit more readable as it guarantees that nothing
else is inherited here, or perhaps it's my needless paranoia at work :(
Upto you.

Raag
