Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BD0D277DB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 10:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A758B10E0D6;
	Sat, 10 Jan 2026 10:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h03qd7Q+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9B010E0D6
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768039802; x=1799575802;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iyBODYrInzvUrw4iHJYt2pln/pFspZVRAykeC+Xg8so=;
 b=h03qd7Q++D8PqlD8HzkfqIe9n8ieN3R0c9++kJV94MkMTb6dIZF18aeD
 usdt+yhYRsS7t6Rp9xaA02Zb2yqYhOIiw4XRpRNYaXFxd2BSitpb1Kfh8
 8smaAJz5sc3tbarxuRlqGcZOyTflCrNkgmdemyKIhBkfvUHuk14XQ25je
 Ch4Sy4gDk67K9JtD9p9Dd+f5DhP3oA5qzN077Z7UMBncXr9/creTDP9T/
 7wnOgUgESRorTtiUjJTYDqioCoIDgRwI3MXysirQ5XfTcdJdGrYBOhO/+
 0N9xPBNvRuyy4ek/FU697tGdkyb/8KN6IT7ROkEjdRz2y/RPdnuR8n0Vw g==;
X-CSE-ConnectionGUID: glN5UpsfTs63mMvBmrVUWA==
X-CSE-MsgGUID: Ye5GFqGfSbqP7+UBPdCnwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69315243"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="69315243"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 02:10:01 -0800
X-CSE-ConnectionGUID: 8OtQLQToT0qGnGfaU9QcfQ==
X-CSE-MsgGUID: jbl9SB5XQnGDlb83QrWTbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203685918"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 02:10:00 -0800
Date: Sat, 10 Jan 2026 11:09:56 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 1/4] drm/xe/hwmon: Expose temperature limits
Message-ID: <aWIldD6hKFt_Sle9@black.igk.intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-2-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109201644.736483-2-karthik.poosa@intel.com>
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

On Sat, Jan 10, 2026 at 01:46:41AM +0530, Karthik Poosa wrote:
> Read temperature limits using pcode mailbox and expose shutdown
> temperature limit as tempX_emergency, critical temperature limit as
> tempX_crit and GPU max temperature limit as temp2_max.
> 
> Update Xe hwmon documentation for these entries.

...

> @@ -808,6 +871,37 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  		/* HW register value is in degrees Celsius, convert to millidegrees. */
>  		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
>  		return 0;
> +	case hwmon_temp_emergency:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			return 0;
> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_temp_crit:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> +			return 0;
> +		case CHANNEL_VRAM:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;

Missed an instance, please drop it ;)

> +	case hwmon_temp_max:
> +		switch (channel) {
> +		case CHANNEL_PKG:
> +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] * MILLIDEGREE_PER_DEGREE;
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -1263,6 +1357,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  	for (channel = 0; channel < FAN_MAX; channel++)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> +
> +	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
> +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");

I think this should be drm_warn() but I'll let you all make the final call.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
