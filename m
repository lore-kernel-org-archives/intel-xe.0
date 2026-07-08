Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F2C43602
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 06:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301CE10EFF3;
	Wed,  8 Jul 2026 06:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2musIkk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054BC10EFE4
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783493242; x=1815029242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1fqH7gqGiMm6AX/xECOCeGgShkS8rvZJBSHLK9vNPwE=;
 b=e2musIkkSvX5zSJEf04yybDvYL3XfqceOF9GLn7bGZYuluqplEdzLlA1
 8RaGUY7y+5RdCuhPEe9jTvzeqSfdQR4g1ApF5vWzR8Qd5dGCvXf00Sa8N
 t+gswHm8gbAUyYP75cmKjQUf+xSQlYwB/gl2aOLVN2hXyMzIXKNniGhas
 KjkuuiF2E/oxl3JP/nA5Qj+w/ZGKr1+y6/Gy9nKvHJrAx+07OA72dHOhl
 EdHNfKPnmRP+RHZBSUefY6vN1y6pmk0+XJSD/bfw9QnSdRYSCGCHYPOGe
 yurz73k4pqgds5r+Z407G9U0iAidZrbqHF0J/sODGTNQzxZndAKTm4Gje Q==;
X-CSE-ConnectionGUID: vXz+b8xLQnStl7upLTRjWg==
X-CSE-MsgGUID: nPKSxXl2QGGAAhuy2Sty7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83926574"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83926574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 23:47:22 -0700
X-CSE-ConnectionGUID: AgwQiLL7SNCEnPqUOlLR3w==
X-CSE-MsgGUID: v2FlhnK3TJqrqY2CkwwCXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="259115187"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 23:47:19 -0700
Date: Wed, 8 Jul 2026 08:47:16 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v7 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <ak3ydOjMXBrOVKbC@black.igk.intel.com>
References: <20260708061221.4006706-3-soham.purkait@intel.com>
 <20260708061221.4006706-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708061221.4006706-4-soham.purkait@intel.com>
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

On Wed, Jul 08, 2026 at 11:42:23AM +0530, Soham Purkait wrote:
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

> index 000000000000..9612b97b0f88
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2

Unless there's time travel involved here that I'm not familiar with, we
should consider using correct[1] date and version.

[1] https://jnikula.github.io/linux-kernel-tea-leaves/

...

> +/**
> + * DOC: GPU Health Indicator
> + *
> + * On Intel Xe platforms that support the GPU health indicator interface,
> + * the driver exposes a sysfs attribute at the device level as:
> + *
> + *	``/sys/bus/pci/drivers/xe/<BDF>/gpu_health``

The attribute is already under device <BFD>, so I'm really unsure of "gpu"
is needed here. IMO it can simply be 'health' but I'll leave it to you all.

> + * Reading the attribute returns a single line containing the current GPU
> + * health state. Writing one of the valid values updates the same. Reads
> + * are available to all users; writes are restricted to administrative
> + * users only (attribute permissions ``0644``).

Why is it readable for all users? Is there such a requirement?

Raag
