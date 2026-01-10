Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C35D277E0
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 10:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2310E00C;
	Sat, 10 Jan 2026 10:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP2oUNh5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8A110E00C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 10:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768041755; x=1799577755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fLw5acGuqAgRaGlkcOF4277DwEk+AYCwTMeZGDHHzBU=;
 b=IP2oUNh5vcz8jrr7MWEFOxZ8Dhp/JUreAotL2YH2DiT9hf4XFdGz3JcF
 WoQJCYUJ1hcRqQHoEt5UYlHQNrA8ItoMMd2CBXmMYYGEOGsgrF6XddCP/
 E2b3OG+72bfXo+n4+YJJruKHn8iJxASOx5dhGLlUROvIuLjx/vNL3oL/7
 n6MxsPrJvSIhZh+5m42uuoMGJbKwfRGWmTqErG8a2Ji6RTJx8K9Q90mDA
 9GTVDqMXJHlKEcLFbeS1n+n8e0Aso8VGWg+9wsyeBQ+Pg/bqDffNyZRs6
 jANz7LFuOXqZ+YAnxwKX7iazDrxjdPiyC3PB7+7THzJFWIz0o9Im1F/+w w==;
X-CSE-ConnectionGUID: /6p43Y2+QIeOKTL4VeqkSg==
X-CSE-MsgGUID: 0SM/FAsGQRWArD/Izp28Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80040144"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="80040144"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 02:42:34 -0800
X-CSE-ConnectionGUID: UD4ydYNDQJWRwjwqc0ta9Q==
X-CSE-MsgGUID: S+A85iIYSEyiJ20QrMvzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="202802449"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 02:42:33 -0800
Date: Sat, 10 Jan 2026 11:42:30 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 2/4] drm/xe/hwmon: Expose memory controller temperature
Message-ID: <aWItFl5qz85fwjA6@black.igk.intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-3-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109201644.736483-3-karthik.poosa@intel.com>
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

On Sat, Jan 10, 2026 at 01:46:42AM +0530, Karthik Poosa wrote:
> Expose GPU memory controller average temperature and its limits under
> temp4_xxx.
> Update Xe hwmon documentation for this.

...

> @@ -718,15 +727,50 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	int ret;
> +	u32 config = 0;

Use reverse xmas tree order.

>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>  			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> +	if (ret)
> +		return ret;
> +
>  	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
>  		hwmon->temp.data[0], hwmon->temp.data[1]);
>  
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> +			    &config, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(&hwmon->xe->drm, "thermal config count %d\n", config);

If you want decimal value then I think you should print after[*] you mask
it, but if you want raw value then I think 0x%x would be more useful for
debugging.

> +	hwmon->temp.count = config & TEMP_MASK;

Use REG_FIELD_GET() for consistency.

[*]

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
