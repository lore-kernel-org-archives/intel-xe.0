Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19175C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 04:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF0510E128;
	Fri, 10 Jul 2026 04:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k36r2syt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927210E128
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 04:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783658171; x=1815194171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=svttDwwVqO6ggKw6wavirMBI9WOsLUZ0Y/Hzf7br9gc=;
 b=k36r2sytdW78hlK2z/J4ZCgtIkj+e2KmSk5HsCitpgzHvFAuh1httm2e
 VefZFjAEqzRHFIYLsRQNaksCSt/wBD+ONR3N8Pst09Yrpxwv6Yl+ciAOw
 lFpKpMMhaxAhRLoZh/yBAJOTzuqQyELRxcG9vBARqL0oShOEh14ZkQK41
 1lmYdo7ZBJOMDCG0g83Xws9CQL5h7PFe7uhNVceaj/Gor2D8DU+wU5BAm
 xkZcIr682uyNCziYQWN07Z5WZpYQQU3P8yoMGn+key9gKVT9Wg6oLYq8Y
 2DMo8bC2fZmy1JmiuOEG5FeROPh+lKZO+eoaYr/Mkfd6CHGDsf2sa8f5R g==;
X-CSE-ConnectionGUID: WeQtr5I4SlCWBEPkVNwELA==
X-CSE-MsgGUID: KRYWOPfvTBmeUouMBGJ2Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88183042"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88183042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:36:10 -0700
X-CSE-ConnectionGUID: Uv9leAXuQp6NCc2moLFZIA==
X-CSE-MsgGUID: lGlmvAYNS/GxywDCsX85MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="254289375"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 21:36:08 -0700
Date: Fri, 10 Jul 2026 06:36:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v9 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <alB2tbx64x7RRmWB@black.igk.intel.com>
References: <20260710041555.19974-3-soham.purkait@intel.com>
 <20260710041555.19974-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710041555.19974-4-soham.purkait@intel.com>
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

On Fri, Jul 10, 2026 at 09:45:57AM +0530, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
> 
> The interface is a single read/write file at the device level:
> 
>   $ cat /sys/.../device/gpu_health
>   ok
> 
>   $ echo critical > /sys/.../device/gpu_health
> 
>   $ cat /sys/.../device/gpu_health
>   critical

...

> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>  
>  #define XE_RAS_NUM_COUNTERS			16
>  
> +/**
> + * enum xe_ras_health - gpu health values
> + *
> + * @XE_RAS_HEALTH_OK: gpu is healthy and operating normally.
> + * @XE_RAS_HEALTH_WARNING: gpu has minor issues but is still operational.
> + * @XE_RAS_HEALTH_CRITICAL: gpu is in a critical state and may not be operational.
> + * @XE_RAS_HEALTH_MAX: Sentinel value for validation
> + */
> +enum xe_ras_health {
> +	XE_RAS_HEALTH_OK = 0,
> +	XE_RAS_HEALTH_WARNING,
> +	XE_RAS_HEALTH_CRITICAL,
> +	XE_RAS_HEALTH_MAX
> +};

Shouldn't these be in the .c file (similar to severity and component)?

Raag
