Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673B5EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 15:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB5810E3E6;
	Thu, 29 Jun 2023 15:10:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBD410E3E8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688051402; x=1719587402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZiiFt4xToGwklbX1/8YH7t31So4Pr0Iw3mfx2+tZnfM=;
 b=jpzYyEK17tmmQ1vUpY9tHbFmxdDTFlQEsRBKkmGg9iXV7zE2xlJefkh6
 J6MkYr3jtEgHIFU40n/Q/P38gNBBG2Z6FryKS8g7xzgcVEgIgTUcjFk+u
 ZWkzaKodx5GF+zZcCZmCJLINqYFt5cqeT0syblGnY9iTFMuG7IgJkB046
 galae7eUahpErZgfWJcMfmRyEpxmHRj7SxbAFE2ggzYReeesLKrMltR6e
 AMKneiXwyw3nkWVLCgqCRcRBDti22J/5NNoIv8oM80cJLnawPGCM7wBNQ
 9Q2eLJQgn+Dn4HX+fiYTb0Q5AH6vrV6x464CM11eJhEvXn9woIHGEShGx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="392856454"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="392856454"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 08:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841480679"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="841480679"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.226])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 08:09:55 -0700
Date: Thu, 29 Jun 2023 17:09:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZJ2ev5QkGFt/b6bq@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-6-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-6-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/hwmon: Expose hwmon energy
 attribute
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

[...]

> @@ -614,12 +793,22 @@ void xe_hwmon_register(struct xe_device *xe)
>  
>  	/* primary GT to access device level properties */
>  	ddat->gt = xe->tiles[0].primary_gt;
> +//	ddat->gt = &xe->gt[0];

please clean it up before sending

> +	ddat->gt_n = -1;
>  
>  	ddat->hwmon = hwmon;
>  	snprintf(ddat->name, sizeof(ddat->name), "xe");
>  
>  	init_waitqueue_head(&ddat->waitq);
>  
> +	for_each_gt(gt, xe, id) {
> +		ddat_tile = hwmon->ddat_tile + id;
> +		ddat_tile->hwmon = hwmon;
> +		ddat_tile->gt = gt;
> +		snprintf(ddat_tile->name, sizeof(ddat_tile->name), "xe_tile%u", id);
> +		ddat_tile->gt_n = id;
> +	}
> +
>  	hwm_get_preregistration_info(ddat);
>  
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
> @@ -637,6 +826,23 @@ void xe_hwmon_register(struct xe_device *xe)
>  	}
>  
>  	ddat->hwmon_dev = hwmon_dev;
> +
> +	for_each_gt(gt, xe, id) {

you could eventually make a for_each_hwmon_gt()

Andi

> +		ddat_tile = hwmon->ddat_tile + id;
> +		/*
> +		 * Create per-gt directories only if a per-gt attribute is
> +		 * visible. Currently this is only energy
> +		 */
> +		if (!hwm_gt_is_visible(ddat_tile, hwmon_energy, hwmon_energy_input, 0))
> +			continue;
> +
> +		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_tile->name,
> +								 ddat_tile,
> +								 &hwm_gt_chip_info,
> +								 NULL);
> +		if (!IS_ERR(hwmon_dev))
> +			ddat_tile->hwmon_dev = hwmon_dev;
> +	}
