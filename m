Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61887CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 21:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B39F10EBD9;
	Mon, 28 Sep 2026 21:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4RICGBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1910EBD9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790630280; x=1822166280;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHe4XZHSWCDUGGK9MlK1KygkijV4aIW4wBA4aVP7CdY=;
 b=Z4RICGBwU2DiKTnur+D+m7ya61rGK2l3Y6qV66JanPlP5bTrn4w5eUNS
 OtbBE29Q9dCymmr6/w4ivZ+LQ/cPoMRXs6MoTFGFvh4mZsnLQ1FcpJynQ
 5XUr113u+RrxCWXAV9pEMkEXKn0MFJIqWs5miWBU3xzV/qVoj2BFRkhCu
 fF6fqG8rH5WEwomno5g0QdJpV88D/m2xw8O9C9Zk624kPdjJTWhZSb6V8
 V11Aoy4py9ymb3j12ntUu3B+3VUCXtMBn7NVl4lc6k6YGBGo+xSHwXdkB
 m+A5sqMVBbIBVSSSCgnsBsXddlJSQzKPt/mqbxAEoz+6a9m1GkkaNALQV w==;
X-CSE-ConnectionGUID: r/GGTn1BTNW3JWF1gRCA3A==
X-CSE-MsgGUID: xUxQ6UlSQqWuNsUL0/y6qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90107438"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90107438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 14:17:56 -0700
X-CSE-ConnectionGUID: knDJVyL4SmaZXrO9E9RmCQ==
X-CSE-MsgGUID: 063kcy6LQiirnBkb2X8UoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="275193251"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 14:17:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:17:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:17:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:17:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTiSKQc+zZGHM6b97xQ20K4MiVYtQ1MbjptGPvlFNyKuo8293NF+mZRd+1FapmxlAqVyif8KT2M98CjoW8p0PP66ikH/RXjJdrhq8HCxaVeeOGi2kISSXf+XPH4Lv5NcmHMgylafWcQanwmhD/0/lpKLe0xybllJk6J5W+iUCb6fonKynNU+rv5fyVpBuazjqX/QUibjFYLttIlxncBZ5Tux3zhM3bBwkPN5TOgIGlaBRiyqtcI+WLKvdzcUrKwYtP+TINI6ivYcDmHip0FHSlfUP1Rjn5EdSswYSu/eoGkaz0sDi+wPUozAb6TNSNpDmenPA1W1ADzakAi016MMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6QW48BPyHlBkOxVyOPFZunTUOFOZQ9G1ir4osR3LAA=;
 b=Zwc+WrZK0bB8ipkqMXsHgLL/izmmn/mx99vMdmF2WyUomN3fHtIAByqvoAUFSgeZEVpRoydthB+kniaYjQgI+6YDcazMb/ZdfQfuEvKKv2t0cMcCkGnbqDAkPJGKdKeIUzGzkgqyH8po9lopDB4SPd+Hj4Me7FaZn3h7BDLnMvn3xgS9Au2UhKD1SSPlXDjgrwxBmLzD2gr4A3GyETUnc4Z2CLS6gfsaythxVZk/vEA+v2cczb4/jYfIevADEtpVPy3fX5ZEh7HIyiHANXei2t4vFF1qhpD/7qZp56L/bsTKJqH0aZipbNLOaVnWqqU4ousCRXt9xv6MRL0TFe7S/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV2PR11MB880597.namprd11.prod.outlook.com (2603:10b6:408:3a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:17:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:17:53 +0000
Date: Mon, 28 Sep 2026 17:17:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 08/13] drm/xe/hwmon: Cache temperature availability to
 reduce probe time
Message-ID: <arrZcykEkTznmWHD@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-9-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-9-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV2PR11MB880597:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb9eedd-58d2-4c5a-e658-08df1da5f51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|10067099003|11063799006|56012099006|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: HkMwNsgKjcfFxNwzkK1gdo9ZMAEgsDBWgKRLOxGhCNZ+GJm+VLg3/oxizQ59Ohj0BI1vzJg6kI3k/7SQRtDpkBtgAKpfnU1A2fTny1eV0rLGFtXI+RPjDAH1u//kWrQXWd8hucsCf4bWchWV00g7saOgftZJDBbWnaGV6W44n72eyXR6IusDaN86+OmselUTwht8H5x+zfK7MMWZJNSJitESVJKxYfAUXis576bjzZO6rq5Vitta0vuiJ+mUhpc0iHqPUOUXtkAjgpfQHvv585LSukRDh88ZX0L8tplt7FFPwB8vS9gbs9P9OiF+NuitzV/AO9MpQhgDOp2KLPaITqd7Md9M3qFAe2ChXyutiVJRMJMHi9ba7jYNUtjMVWLgmt2kS9nqiyXEOQFnJulJ55Yp8CfwnUQPXr67hXwVuni3h6TveLViHEpbFJBPRKcPWeMrrRMN1uWHSvtfiHiCbWuUKCLNqb9HhMTUmj1qtP8bsJ25fcdeHiJGpnrql0i1MAbK/t1+Y9Xhbf8L+QSjneviswddkKsTo5U75+kPVUgFLG6bOQP/kojEfArTZnPuTh++sxuqj0bvbC2T98v8Habpl0y9Z3Abt10mIzBfyqYZdxriG3vj3grK3+F0MzRpCojcLlJKhba0K/Wz4o6g/jzzgT3bQZrz1c5ikUCwrCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tUM5H40tA7X7b129d8xs0RsGl93u6ryCVngPgfluFgnQWYc95ryMCKLwpyzM?=
 =?us-ascii?Q?LSZGuOeBm5U+F/JITak+fre9HkNB8t19hEYI0s3IMWiBtHmeI1+nB7CjIDtV?=
 =?us-ascii?Q?OXv/6MdnRllCPJDPvDUlF4nUn27/ZPQzv3lVaCJ7SDR8iTqwzyOkjOyGZMdP?=
 =?us-ascii?Q?tLJa88k68Q2z2HJXQgUuJCsjGsdosm8zEqQuaMWv8aUSb503I2RsRZ/PRZOd?=
 =?us-ascii?Q?Wik1F1RJ87m3AhSTkl/Yk9qZVLLDLbVlZz9oVqrN1i25SCI7gbjj1QWAhJJK?=
 =?us-ascii?Q?Y3z3BrIjzWA7SEGTr5OhuGDLuUl6dX2iMr+YlAW/1EnWLt4heEYb2GoNdBOg?=
 =?us-ascii?Q?Pab+nnsm2dFqUu04BE6EGbumnNHqh1Hgs7xTU/NvE/L/OviCeF5drGusMRKC?=
 =?us-ascii?Q?gl0wrMZzFh6AR3flVWGvd/7fVN86X9kKm4Cii4LPBqIcY6olryVy1943KZPQ?=
 =?us-ascii?Q?yxVmCoj6uM/sLcCdJUB3xNfwiDLWdzJDvkIzVHc4pws2bxC5VJInsxK9ILMj?=
 =?us-ascii?Q?LyZLmS+dNDDweGN2UgVFk0wxf+BcOveuBRQfPJ4qucV1x6iKw+vrRp41TADW?=
 =?us-ascii?Q?FMF4a6J560YaQzafYb9tHT7oJ4GMCMhdBmFwS207MeMBQbOzMof5lW0NC1rA?=
 =?us-ascii?Q?4fdE3uHj8Ekvpnh4XtBn17UbJE1b71xv4peMHbdbnfcdgJnm9ns38OIWs93e?=
 =?us-ascii?Q?Maxp6dIpKfNzfS7CXs02t6iFcUdV5sY6KDSZsvKknDDb+gtJjLB2++z2KDFy?=
 =?us-ascii?Q?5gTuA6m+gfDz0QwmHsKnFdQkMIelfmhK2GehZFh+uDbeUD+pAvPCOWmL2Ql3?=
 =?us-ascii?Q?3c4XuP5BbTl4x6TIR5cqnnLTJgRHJu+bO2sK9o4XMF3y/FbYA9RKgAA8vJwj?=
 =?us-ascii?Q?tub0oXElbbWQJKZR885fCbgisyPE84YdugTetbGP5alqKBytdj+uMyTQLMlJ?=
 =?us-ascii?Q?u+ra1INpSg5OGQzzc+HXcbu4cAuilXltGSLGjkFlLYIxjohYTMOW+40a9rrK?=
 =?us-ascii?Q?wM35Apycbowopkv1pyGRsDIlFmqnCa1Kw916pkMe84uzKRegQP1cMki9JzFj?=
 =?us-ascii?Q?IP8FmAZ03H+DZqE9BXB+D7rP6H6WXBtzsITID0p+d34FL+ATOuiQzEiHhesl?=
 =?us-ascii?Q?NFNBqnSZ8jC9vcT6Rs7D36cN7FJ0wIhCJRiQRjjZ9px6Fr60DCK/2lN7MLnD?=
 =?us-ascii?Q?/ejEGgWyHGlxtAYyq0bzbMq0KRl921FaU4IVj1vm7jKpns2alIpuuoIAnI0r?=
 =?us-ascii?Q?rFs86kzQDzAMErX+Zgt3vr3mQoDGDQFkE7Pvmq6n7TpnkA47yrIxcwJ7Yumz?=
 =?us-ascii?Q?0u37iRUo8TQyEaCIjbYnyXmXV3tjG3GV2MK9h+zwYemoj1awP/DNDjPIcgv5?=
 =?us-ascii?Q?rmpPpXI5ciHnTnItkjR9+onm9ftgcF4OCG5W8UJYqTnF8qd6bWgKOhv/5W6e?=
 =?us-ascii?Q?AXRufuTszVP8UH7+hQvqp59ByGVD8H1cd07OJzCcb5giYtB27dvlaqwebTgh?=
 =?us-ascii?Q?jMpCyzk+xA3vlTUrDQRG8di1EwBcnzTA1F+a1iSB186tjza4XxL1N1xNeE5I?=
 =?us-ascii?Q?ro7G0RxquI7/lB/y7j1DW0NNZUInMSW96NNdnU0WSsu/BRhaDOnN8FC+Eenf?=
 =?us-ascii?Q?YAKhze7aLIq/Nn9nfi/8tih9EskjiDEDAxYRBESqGfvynXbp2xb/I/h7GE92?=
 =?us-ascii?Q?Y4MoCMFrHjW8dUZGAjB0EZfzmNUSc/+kRHzSUjb6G0/Uxlwc8nT4FbaKy4zB?=
 =?us-ascii?Q?3N4/VW8KY+A0HzJr4Bthg/YYlVcixJk=3D?=
X-Exchange-RoutingPolicyChecked: B4nlW02kvgHOwQW22iQqQIChbCTA4bGtLQrUaPDWcHfqwWLhkP06A48saJ+Q/eDJlRx73j1knzSma9BTnEJPDhCdYkQM65c0BVpBl7GBc9Xl2IjEmPxDx1icDHeaLIV+jz7ecKSGapjCASFFV5YHjdS8CEDzOQ9lAbpey3PypDAyHNKpNzO3o0UuzcB+x3tCP8vPVVDDdCQqygrxoSLfBhCnHi2qGKNjaSaspQXCxBDsTH+W//GSRuTQSv97tf0IQzcETju+HvcoSpdjRhnqzSF+XIkoHfHeialwMHAIZ8LoJGiqn/jSQ+zkvIlfCNM/l5xSwjxAbhywq7em11lU2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb9eedd-58d2-4c5a-e658-08df1da5f51d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:17:53.3841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0sxo37dMmZigr36/tUYJ2nKlAzCrbFw2QW4FkTjY/J5YJWg5SdAuKaLNuW/C67YWIxUwu/HU3l0BlTsJyOMaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB880597
X-OriginatorOrg: intel.com
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

On Fri, Sep 25, 2026 at 02:24:24AM +0530, Karthik Poosa wrote:
> Avoid probing temperature sensor availability from the hwmon is_visible()
> callback. For MCTRL and PCIe channels, that path can trigger repeated
> blocking mailbox reads while sysfs attributes are being created, increasing
> probe time and making attribute creation sensitive to transient failures.
> 
> Probe temperature availability once during preregistration and cache the
> result for subsequent visibility checks.

fine to cache, perhaps wroth checking that 0 temp case..

but this patch itself looks good:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 39 +++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 052b25a233d6..92280248f1e9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -146,6 +146,8 @@ struct xe_hwmon_thermal_info {
>  	};
>  	/** @count: no of temperature sensors available for the platform */
>  	u8 count;
> +	/** @available: temperature sensor availability cached at registration */
> +	bool available[CHANNEL_MAX];
>  	union {
>  		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
>  		u8 value[U8_MAX + 1];
> @@ -1002,7 +1004,7 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>  	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>  }
>  
> -static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
> +static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	struct xe_reg reg;
> @@ -1023,10 +1025,6 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  			return false;
>  		}
>  
> -		if (channel >= CHANNEL_VRAM_N)
> -			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
> -				"vram_ch_%d", channel - CHANNEL_VRAM_N);
> -
>  		return true;
>  	case CHANNEL_MCTRL:
>  		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> @@ -1037,6 +1035,22 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  	}
>  }
>  
> +static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
> +{
> +	int channel;
> +
> +	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
> +		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
> +
> +	for (channel = 0; channel < CHANNEL_MAX; channel++) {
> +		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
> +		if (hwmon->temp.available[channel] &&
> +		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
> +				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
> +	}
> +}
> +
>  static umode_t
>  xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> @@ -1046,11 +1060,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_PKG:
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return (is_temp_available(hwmon, channel) &&
> +			return (hwmon->temp.available[channel] &&
>  				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
>  		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_temp_available(hwmon, channel) &&
> +			return (hwmon->temp.available[channel] &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1060,11 +1074,11 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_PKG:
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return (is_temp_available(hwmon, channel) &&
> +			return (hwmon->temp.available[channel] &&
>  				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
>  		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_temp_available(hwmon, channel) &&
> +			return (hwmon->temp.available[channel] &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1072,7 +1086,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_max:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return (is_temp_available(hwmon, channel) &&
> +			return (hwmon->temp.available[channel] &&
>  				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1085,7 +1099,7 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return is_temp_available(hwmon, channel) ? 0444 : 0;
> +			return hwmon->temp.available[channel] ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -1627,8 +1641,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  
> -	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
> -		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
> +	xe_hwmon_init_temp_info(hwmon);
>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> -- 
> 2.25.1
> 
