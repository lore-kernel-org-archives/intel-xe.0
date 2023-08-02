Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EF3C001E0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 22:41:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E992810E05D;
	Wed,  2 Aug 2023 22:41:01 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5963D10E05D
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 22:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691016059; x=1722552059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f8YFBTlUshDYzhWoXJmWq5V3aYJIeDhpQpoZmgtlBak=;
 b=O2720kqPBmPyW1ob/CRc8TkClxUaS0i4Chflzjfg5U15kXhxhDSD7U7D
 XxJRapoJahAKp1U54en0CbCHN4/SgJzSwGYszzUF5TdvubMTJSrUO7FGY
 Vm9DLtoVRr7JK/w+wkubQ38ZgwDn/wyO7GEqy16KTxqTE8qtbkrw+muOk
 HAH8Q79X9M5xhgUBMC5i05NdFNwP7CMBuQeHC5FJV4boYOKLZKwvsHXPl
 ji7bsHTTzTGrsbqiqRF/WXvzNlbxFiST5PQkcA0ouUEJ7cXwNe5rpESkv
 ztNzkUOVMthVzoqhPmh1YdrTuAAjxL9nD7wrsZ7pZaQ9HAqIzc3fJVLLE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369719191"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="369719191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 15:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843326383"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="843326383"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.38.55])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 15:40:40 -0700
Date: Thu, 3 Aug 2023 00:40:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802135241.458855-2-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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

> +struct xe_hwmon_data {
> +	struct device *hwmon_dev;
> +	struct xe_gt *gt;
> +	char name[12];
> +};
> +
> +struct xe_hwmon {
> +	struct xe_hwmon_data ddat;
> +	struct mutex hwmon_lock;
> +};

why do we need two structures here? Can we merge them?

> +static const struct hwmon_channel_info *hwmon_info[] = {
> +	NULL
> +};

just:

  static const struct hwmon_channel_info *hwmon_info[] = { };

would do.

> +static umode_t
> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		 u32 attr, int channel)
> +{
> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
> +	int ret;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (type) {
> +	default:
> +		ret = 0;
> +		break;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;

OK... we are forced to go through the switch and initialize ret.
Would be nicer to initialize ret to '0'... but it's not
important, feel free to ignore this comment if the compiler
doesn't complain.

> +}

[...]

> +	/*  hwmon_dev points to device hwmon<i> */
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
> +							 ddat,
> +							 &hwmon_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));

I think this is better:

   drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);

> +		xe->hwmon = NULL;
> +		return;
> +	}
> +
> +	ddat->hwmon_dev = hwmon_dev;
> +}
> +
> +void xe_hwmon_unregister(struct xe_device *xe)
> +{
> +	xe->hwmon = NULL;

I think this is not necessary. Will xe check for hwmon at some
point?

Andi

> +}
