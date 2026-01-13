Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFEAD29DE9
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 08:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A0A10E46B;
	Tue, 13 Jan 2026 08:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Er/agN9L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F90510E46B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768292480; x=1799828480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iccW+zgwkB5VtSXW6txWPIixrqSDuz9ZPS9KIwqyJh0=;
 b=Er/agN9L/qfqjiPwSpBwP/ydDPc9+DyYvu0CdwzLiV8rpnjF6Cd+/beJ
 G9E/+ueAh2v7r5T7oqgq/qa17kWXfQYHtKTuiGw4oo+vDZnbhjTHnWNEv
 3uNSGhqgtgZuhG2yL7gnK6eiaGKV03qmU9wqzVvpnZFXt/j51jdyPDGrg
 KD/gVDq1SAuMsLQLeExwOshpUM+vEdS9DgKKdzn64MzdvZRS/jtNwYq8o
 CSekk/fJsl4UzQiMBykZ+wpjPzbZV0JDRy2nXv35ikQ53SCbTCxKzgcaq
 UJCB3azuHjOXoMQRitx8BpvC4oAHnGFmQ4EZiEGt1CD5C8Uktau84a2Uf Q==;
X-CSE-ConnectionGUID: PbBrVs9mSViYsP3cLKcbKQ==
X-CSE-MsgGUID: vulOU85/RDWiuFNjctHAQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73425864"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73425864"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:21:20 -0800
X-CSE-ConnectionGUID: flxJERDASZOY5uNEMIOz9w==
X-CSE-MsgGUID: hwt+FCPDTaO3KBHXEKALmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235564552"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 00:21:18 -0800
Date: Tue, 13 Jan 2026 09:21:15 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v7 4/4] drm/xe/hwmon: Expose individual VRAM channel
 temperature
Message-ID: <aWYAewvdkrS_WSZx@black.igk.intel.com>
References: <20260112203521.1014388-1-karthik.poosa@intel.com>
 <20260112203521.1014388-5-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112203521.1014388-5-karthik.poosa@intel.com>
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

On Tue, Jan 13, 2026 at 02:05:21AM +0530, Karthik Poosa wrote:
> Expose individual VRAM temperature attributes.
> Update Xe hwmon documentation for this entry.

...

> @@ -255,6 +264,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> +			else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))

I think this should be

	if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))

or did I miss something?

> +				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
>  				return PCU_CR_PACKAGE_TEMPERATURE;

...

> @@ -1353,6 +1415,8 @@ static int xe_hwmon_read_label(struct device *dev,
>  			       enum hwmon_sensor_types type,
>  			       u32 attr, int channel, const char **str)
>  {
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +
>  	switch (type) {
>  	case hwmon_temp:
>  		if (channel == CHANNEL_PKG)
> @@ -1363,6 +1427,8 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> +		else if (in_range(channel, CHANNEL_VRAM_N, CHANNEL_VRAM_N_MAX))

Ditto.

Raag

> +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> -- 
> 2.25.1
> 
