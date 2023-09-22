Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6709DCD4847
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 17:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EC710E6AF;
	Fri, 22 Sep 2023 17:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72CD10E6B0
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695403503; x=1726939503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/SroJ1aFo6ArEMp71YqeEGAaEDS7S5qASa1V5RBkrho=;
 b=GMmeSdTcjghniQ9JY+TC7pdXUrdUtwUwraZLxshACsbuk4aC7K6JJr8T
 dMA5USdMkT1CxGwJUBxtSFAzRfR56WIUlotO860mP/c+HEqF9Ll6fZvsI
 HJj854Zxz9M9OxrOYXJ1CxhFikfiEbO2cFAv6WS+ZHjNFB0KsgDHdABkW
 kRmolPC8WYHt5mPfMpG95m9v9zNn60FyVPvoU0McZ78ZLoLLWGAvmKyTt
 oyVpCs0mOTuMlZglwn6YA8bi4gGzBQe2+vug7IVpo/Et0g7C2ePAkvXNX
 F/PNs1g4EyOxXmhOej0nVFGS/CAnPJ868o65xv6T3wAPv1AQTwjr2TdoG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="361140149"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="361140149"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 10:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="871317483"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="871317483"
Received: from velangov-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.214.174.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 10:24:52 -0700
Date: Fri, 22 Sep 2023 19:24:46 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZQ3N3vvbkh9xPX40@ashyti-mobl2.lan>
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
 <20230921102519.3355538-3-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921102519.3355538-3-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v5 2/6] drm/xe/hwmon: Expose power attributes
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
Cc: linux-hwmon@vger.kernel.org, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

[...]

> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +{
> +	u32 reg_val;
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ, &reg_val,
> +				     PKG_PWR_LIM_1_EN, 0);
> +
> +		if (reg_val & PKG_PWR_LIM_1_EN)
> +			return -ENODEV;

so, here you are trying to disable PL1 and check then if it's
disabled. Shall we try at least twice before returning error?

And why ENODEV? It might be that we failed to write on the
register but it doesn't mean that the device is wrong.

> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
> +
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, &reg_val,
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +
> +	return 0;
> +}

[...]

> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
> +								"xe",
> +								hwmon,
> +								&hwmon_chip_info,
> +								NULL);

here the allignment is a bit fancy... in this cases I wouldn't
mind going up to 100 characters or not align under the bracket.

I would write it like this

	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev,
					"xe", hwmon, &hwmon_chip_info, NULL);

but, of course, it's a matter of taste. Up to you.

Andi
