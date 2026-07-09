Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20A8C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 06:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C0F10F3AF;
	Thu,  9 Jul 2026 06:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFBs8VxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0C210F3C6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783579147; x=1815115147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ITsrQ564oVpiljBLh77u8ZAseH47f7pBngAjV1FLuVw=;
 b=HFBs8VxWh8bN6pUGm/IfTiKZBd2Q81jjqyU74SPLgeNbDiAD1qYiNQTt
 IDK6VgH9DgC/p2wbTL7i0V0PKj3Bq/fKGiD5y985FcTHcmHTJosuR95HF
 QmB8I/25f4DPLBZIqctgs3nVK9Vli+LOmfwpGl+JdqRmwpyK4ReNu26LQ
 HxDObnd04aaEwFPvpWWjvnaugzpZPccS+G+8uxZFZi7Far4/WYsKrxew8
 J3BCqdaHlB6Nh5SoZMbtkxGrpM7eaeAc7BBdcM8Snq5BPqFMi8clVvsZZ
 f95dxmMZAea1B7rU7sxDplNIEeC8GdLDZImOdtU4qVZtoF2eTAlhS0rFr g==;
X-CSE-ConnectionGUID: dCRsKObbTiGneXMbI3izHA==
X-CSE-MsgGUID: PIy8PCAxSYmoNkKv3DeAvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84352094"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84352094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:39:07 -0700
X-CSE-ConnectionGUID: I7kJ/MoVT9CCLIcgk7Unhg==
X-CSE-MsgGUID: Pio2DIYNRXu6VVlmpGEPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="259401987"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 23:39:04 -0700
Date: Thu, 9 Jul 2026 08:39:01 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v8 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <ak9CBeiKXktRJ7DW@black.igk.intel.com>
References: <20260708135110.4117174-3-soham.purkait@intel.com>
 <20260708135110.4117174-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708135110.4117174-4-soham.purkait@intel.com>
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

On Wed, Jul 08, 2026 at 07:21:12PM +0530, Soham Purkait wrote:
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

> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		July 2026
> +KernelVersion:	7.2

Perhaps 7.3?

...

> +	health = gpu_health_states[response.health];
> +
> +	xe_dbg(xe, "[RAS]: set health: %s\n", health);
> +
> +	return count;
> +}

> +

Redundant blank line.

> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static struct attribute *gpu_health_attrs[] = {
> +	&dev_attr_gpu_health.attr,
> +	NULL,

Guaranteed last member, so redundant comma.

> +};

...

> @@ -350,4 +493,8 @@ void xe_ras_init(struct xe_device *xe)
>  
>  	if (IS_ENABLED(CONFIG_PCIEAER))
>  		ras_usp_aer_init(xe);
> +
> +	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
> +	if (ret)
> +		xe_err(xe, "Failed to initialize GPU health sysfs, err=%d\n", ret);

Nit: We're not initializing anything, just creating.

Raag

>  }
