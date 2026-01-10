Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C363D277D9
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 11:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38C10E00C;
	Sat, 10 Jan 2026 11:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SaKzdUyc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A5510E00C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768043623; x=1799579623;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qiUhNT+gH9pdmCAVlf5NW23b5sVyodEQv79LAveYc84=;
 b=SaKzdUycwDOokebCzkLLAJvgS4m8hTXPE+9Fzd9NhJ9o1TpCTHYkMQ6+
 VsSAGGaL24usMK/1l50r8YVe3NYAuzd7B6cdacToOcuTLBe8SKWv4czOx
 kH4kcscJe9DjeDiAzxvl6ee/qOoXZsz1r6N9ndRDhtoTXgOaOgzhjLlwq
 F5LahXqLqCyZLy/BwfWfAL6H4ENGnK+OG0MRe3rFqudiCwq4+N/nF7HaG
 Fgil90rT/6396P0X3Cc6pYEe03k7jlrg8Lf/uye3WbywnFUsnKGQYDlCT
 6kaPYEd618zzM1kPcXNEllPOsOVFTilWT3L6J85PcqGzezodlMIrRHujP g==;
X-CSE-ConnectionGUID: V7WSjM54Tn+ZQJ1QFT5/1w==
X-CSE-MsgGUID: tk6TL4KXT+iPQ052ySg2ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="79698332"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="79698332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 03:13:42 -0800
X-CSE-ConnectionGUID: nLFFBV5rSiOwludTFF7LUA==
X-CSE-MsgGUID: FHTs8tQnTN+RI0f5J/X9nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="204437802"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2026 03:13:41 -0800
Date: Sat, 10 Jan 2026 12:13:38 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 3/4] drm/xe/hwmon: Expose GPU pcie temperature
Message-ID: <aWI0YuShzGJ5nfmu@black.igk.intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-4-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109201644.736483-4-karthik.poosa@intel.com>
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

On Sat, Jan 10, 2026 at 01:46:43AM +0530, Karthik Poosa wrote:
> Expose GPU PCIe average temperature and its limits via hwmon sysfs entry

Please also use 'PCIe' with correct upper/lower case in patch subject.

...

>  /* Index of memory controller in READ_THERMAL_DATA output */
> -#define TEMP_INDEX_MCTRL	(2)
> +#define TEMP_INDEX_MCTRL	2

Unneeded churn. If you don't want braces, don't even introduce it in
earlier patch.

> +#define PCIE_SENSOR_GROUP_ID	0x2

This is used as part of mailbox command ...

> +#define PCIE_SENSOR_MASK	REG_GENMASK(31, 16)

... and these are output bitfields, so both should be in xe_pcode_api.h.

...

> +static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	int ret;
> +	u32 data = 0;

Use reverse xmas tree order.

> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
> +						  PCIE_SENSOR_GROUP_ID), &data, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* Sensor offset is different for G21 */
> +	if (hwmon->xe->info.subplatform != XE_SUBPLATFORM_BATTLEMAGE_G21)
> +		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
> +
> +	data &= TEMP_MASK;

Use REG_FIELD_GET() for consistency.

> +	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +
> +	return 0;
> +}

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
