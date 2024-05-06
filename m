Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A47EC4345F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 08:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DBC112218;
	Mon,  6 May 2024 08:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzDSyx70";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D389A10EE79
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714982680; x=1746518680;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CMshXdYV3YoKI8Hh04TBBGZ9ORAcm+sPVSBVpZ6mdT0=;
 b=gzDSyx70jy77zvd8TWwU6O5QjrOQqOxDJulMQuWMlK0p+KuXfs2kdnJ3
 FjpDM5GWAOrK4Kdb0evZCJOT14D40c4aWKpELcWuFmq72fgSGkxwSPHem
 oPIkSCqGbnitkT9DZf5y+WCE5FMqcPqd+f1FbsnRkMncICCgrghYhQ95G
 gV1THlHWnaF78VWb0VGdyOyfcZU4gmqrIGCJQ6F9jCjvvsYRd5iB+vWv0
 v7Gv7VfXXE/Nyi7R/Cjb83sHPyMVMDaQ/tclprgI3kXy3vABWE6ewjGpa
 KbDsVY7KW5JonKqXzgYADTqXgLTELcZUhvbFmUi+PltPg24nsV0qJSFdz g==;
X-CSE-ConnectionGUID: DoHPKsNQTK21o77XMhuOZA==
X-CSE-MsgGUID: 3maBVBQgS8Ohyp2vMC2FCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="28242364"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28242364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:04:39 -0700
X-CSE-ConnectionGUID: UL30o31aSbeqVJKd0fAmTQ==
X-CSE-MsgGUID: POXk7epcSiWuIXZwumr1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="28197264"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 01:04:38 -0700
Message-ID: <8518ffbf-04e7-4220-98ba-9e228d238afb@intel.com>
Date: Mon, 6 May 2024 10:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/xe/device_sysfs: switch over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-9-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29.04.2024 14:14, Matthew Auld wrote:
> When hotunplugging the device we currently hit:
> 
> kernfs: can not remove 'vram_d3cold_threshold', no directory
> 
> Due to directory already being removed. Using drmm for sysfs device
> stuff like vram_d3cold_threshold doesn't really make sense when you
> consider hot unplugging of the pci device. In such a case the device is
> removed however the drmm release action will only fire once the driver
> instance can be released, which can be long after the device has already
> been hotunplugged. Rather use devm which is directly tied to the device
> and should be called when it is removed.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1432
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

I am not sure why this patch is separate from the next one, IMO they 
could be merged.

Apparently I have started working on similar issue [1], anyway I was 
later and took care only of sysfs stuff, thx Lucas for response.

Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

[1]: https://patchwork.freedesktop.org/series/133080/

Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_device_sysfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> index 21677b8cd977..7375937934fa 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -69,7 +69,7 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>   
>   static DEVICE_ATTR_RW(vram_d3cold_threshold);
>   
> -static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> +static void xe_device_sysfs_fini(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   
> @@ -85,5 +85,5 @@ int xe_device_sysfs_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> +	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
>   }

