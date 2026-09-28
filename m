Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4652C9830E
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 00:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5910E707;
	Mon, 28 Sep 2026 00:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iox1YnD4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264FB10E707
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 00:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790554828; x=1822090828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Wz/Dh9R2hqpyTeGz7XUNKeSkFSZ6YiQG5xe2VBPFuWs=;
 b=Iox1YnD4xj71TWYb5bd81wVp8FwV24U+ZoDtdlTw7I0t30+Fo7iKhf1M
 T6QReUfSGRNV3po598ee3BOxQ+WMX06qRMwNgKopfS829Awz763sagynN
 yRl8Lm6F/L4X0E+WXhAAievsjU0hWi0nUVke7NJ8ZYBZFnT7PGhim8DbJ
 d+GD2jyXwr1c6c1jtdNI4Ybd5izHi2GDhrG3/k9mh3okoiARYiPII7Onl
 wqW4D/ARNHGPmVoF+UEpvWwtuWp8CnW5LhqDKYr5Xwe2t5F5A4Lb4LGJe
 vhLMr2SvBc/y31sXtoIj42m+/Gyw73FvUhJh298OsbN41NZ4HyDoBTEyq A==;
X-CSE-ConnectionGUID: nDnH6QukR4qnXcWTcfSWRw==
X-CSE-MsgGUID: OGCVF5gFRSm15nKUzTjGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91350743"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="91350743"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:20:28 -0700
X-CSE-ConnectionGUID: shsrT25mQrKuP5PkvAm44Q==
X-CSE-MsgGUID: 9Rq9L6HgQAePHar5K4wKmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; d="scan'208";a="278107859"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2026 17:20:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:20:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 17:20:11 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 17:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFZuBoSggqVwgjAxp6u9scV7MOvd21gWmLyO/o9EqunqC2ColVVDbLs8LWtF8+UmxDX2n9Ns6SODTjAkecgXUMoK/zBnlTti5i9qrE0jxY6JXh7KzHEsqbuJoISW3AEX86rqsJ9ZIgZeUcc4d6mJfdw5OmkSAvRAE6rsN2EXwF3gaLVZYc9kUd3ZEC7wOni/RJaOfUNLCx2b6MrE5dsFgf1cYjRVzysAYbYIky25cygb5+SrUeBTk1mgIHX1DpLF+4Dur9cNXZbXKGiKiugm8VHxJLXtqASU1glOD4FpbURibTI0l65BBO8tddKv3A6/o46mG17iQTpCWU9zFiwPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqlwfssTtZWlaZINZRn8PBdHmMqqT9vMSIlR9E9J/ec=;
 b=xlzAJRoRf8YAbEI0cHTX6BF33/QKkGmoUh0CvieSrK4Yxz+Bl+E82thAT3E4Xbb1F1AEaC1qtUoB3pf2EFYh3e9o8FJBGzZMYqv/Gz7dGPiJ+bpAFIe3C1sHAuGwfgkOz1Ze2BJ6j/9JMf7AgvRbC/zjjoXgmGue8O+7VsDRZefoFuifCI0tmv+QcdbEUQxuiml7/LLConRiG4tv0S4k0eOUthde0M0MNJ+TP3WRYwVA3Q2gPwujPAkZUUy7MG4C9YKx4LkoYN1SmIaMsinnxp4eDm9UUUsE3cTJlCOsvhEUlIt2CHgDdlasJ8g5GMhoDMKkuocRM0dp7huycoXfQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV2PR11MB096109.namprd11.prod.outlook.com (2603:10b6:408:422::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 00:20:10 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 00:20:10 +0000
Date: Sun, 27 Sep 2026 20:19:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v6 04/13] drm/xe/hwmon: Add helpers to validate thermal
 sensor readings
Message-ID: <armyqeTPA83vcjMv@intel.com>
References: <20260924205429.2846256-1-karthik.poosa@intel.com>
 <20260924205429.2846256-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924205429.2846256-5-karthik.poosa@intel.com>
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV2PR11MB096109:EE_
X-MS-Office365-Filtering-Correlation-Id: 99243fe9-c5df-4eb7-7e2a-08df1cf6417a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|3023799007|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vPeVkkoZpy/bUqU5uOAGm0Dk4837YHST5E1fZgEIosoZpUfnoYDpThf2W+id1QIX5wGMODTdkyY3QuXpX4q8ZySYrkMU67NZiJDlZqo4h1EdaM2TVVE4N3G+BNA602CD1vdwKA44rZOdYS7mAM5PZUF7SktEwZLiH42KbfWZX/jjGDg7nPQqAYwkcHW5ZkhD5AHvZRu8Lxmns+br9HRf1HpRsueXTl73W92a4WUFoz5DqqDLuRhQyi2InERqVcNxEa3kp+ZRl9bmHp88ypX69UblN9Gi5yy8NBPOvoUSQCDfTZa2N1nvdU6V+2gzjIGOrN6Pi5sjWwiYsRtAEoQVYMsMzNwC+vyPtrd93PXUC9/myT5UDUN2N1xYTFxYQLBloCPixqLyXYZs3/8RlYT0lUdLGJ+4zSzYaNu1ReZuWETkB2EmQokIvqEp+FkTGmKzycPc9ONhg9f+w+Ca2eGCrqor8vLOvI1C+PpkmI2dNcGfOY08F8PQBdMEu/tTHbQJQzRidASjxrYoh74A2phYBgofdgZMn2vLMwjRYOBBqGfRU7dwwSWtuFwf9dA3lsS9kK6wwaZv8KYVogQQC5nr4axkRuYAlANtKjP1EfjlhRRQ56qown7rjp4jQwGMdNh2lZglxCGqr5tVdmufmrvc4FwLo/nh++CVXYJ4g4H2OD8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BK/wtyAC3dUsfpLJRZ60ty3QYyCdDCsBy2bQ+BNbCF0SraqXlyXamZHt1w9W?=
 =?us-ascii?Q?r9KGS8ICxEudAGJTnf3oVXO5gWdG76bijapsneSRpfheH/HlS4Zh4x1hZhQV?=
 =?us-ascii?Q?NYDVnPtJLMWju+K4hv9EnpsfVBceVPmurWutIGgAhksU5FK09hFlB61VfrIr?=
 =?us-ascii?Q?X8wFmyt54W3ARxoB5p3IDMCgYNKMe3AwEyYcqmdds2VVXAvlLQg+rpPX68UH?=
 =?us-ascii?Q?2UzkNX3aKTg26kff29xqOQqD81dyX2rcURIvm2FUyHXUZMmAKgDr5amK1oGz?=
 =?us-ascii?Q?DuXRhVxJODN9IV2vs7KpZj61WsgqsAUQr/zLjtLODrSUWgheLLp4xDtvIU/V?=
 =?us-ascii?Q?Mo6gAFT5LWZTf61HmTybMgMTKt3LwZdxnnujfInVNBaB1yU9zYfUjDz1a6WP?=
 =?us-ascii?Q?w57T4vXYiGWqAAqOfo4toZj+nipQRiUlx3iFoEA922n/dKXPvnP+BGMPpwTi?=
 =?us-ascii?Q?l0Em9I4VBLZ2tdJokxc3Gg/VuAbJ6fRw3ipdTP+64yUqESuWZs0SJY3utcT9?=
 =?us-ascii?Q?gV/JvGwpx7UFzU52d0Fz5qrc8v6VkdN8EXGPC/mlYEH8qlkZWW2a7/STeZiX?=
 =?us-ascii?Q?xGNJPuumw11maCf8eGZ9YSs+hsA/AjU9SDq3MubrGlAO0bKHqE5i+91vjt9Y?=
 =?us-ascii?Q?cTnu1I/oO4QzhAsv7jDr8sS7Aq6Z6FTuHJzC9D3lcehq2fDQzX03QsC7JHbP?=
 =?us-ascii?Q?Wyenl+8EuC+UYZ4i7w3iw8nXoLlNsnan3EVeS435/1k6/eKHWbQoVqngJOty?=
 =?us-ascii?Q?euecNHKB/eRyRuhaLO84i3hpmSBC4ZqrPWuTYuIPaHzHGBkuNA0MJ7/UnEsp?=
 =?us-ascii?Q?2TnBS9jpW26Km+SEvHrLIVbRCF0x2vAm62c7NThjogADBLx+yRx3Uc+ph5HQ?=
 =?us-ascii?Q?k0tuY7xpHrFgAHGJmnYFwlmaDSB6fZVjWnu3vAo61wNL+OgrcHrp7ndgs9Of?=
 =?us-ascii?Q?fqRXy4jT62uXhy1RfenDxpi6kQ8y9WrV9ZRuTlKPYceFSkIKq9a2nxmJyc3C?=
 =?us-ascii?Q?yObXbvj4zxok/z3ntAh8/wkZvzq2a2rwS0aceAgqL+Ib1qaesmEu8iUHVn5o?=
 =?us-ascii?Q?aK0Ocbbc3WWNoELmekTEl0qB9ik2n4h+vXCj5anq7thYWFdw3xKZbFWkPisS?=
 =?us-ascii?Q?hsYSs2Ztmj5D1zLniJieY+SGw1LypXA5us5f9CEAaaVNyMiEfqB0TsJ4DRZM?=
 =?us-ascii?Q?v3JbFL3hjrwUnUAZU9t5OuEZ7Svg265CEVSNyy0DKEZ6VMHZVkTCuvCFs+VE?=
 =?us-ascii?Q?nEwfnYsBiLwLGbm8wx7YScZyr3LICw0dONVEfdsOAmf4JvqI1qWll7fHbUwB?=
 =?us-ascii?Q?6LzEmM7zThmoK1hsa4XvnNakolTxbfiI67H4aZkUVsKGFsIaMOqreB0rYfWX?=
 =?us-ascii?Q?Cg4tdTPvpDhqMKCAm0NuvhmMMBw+7G1AUVU6WPEEZMOoctL9fx+OF4wVl/dm?=
 =?us-ascii?Q?Kfjx6j6Ng/kBFh/8JQfahq7hOXDxPuIlHPi+h65mI9cu2zBa+W/hVo3jgStv?=
 =?us-ascii?Q?TnkfQDOxEe8hYoMGQsxg3SM2KDhqbB7LBRB5g92jyEij1Bo7arKyl12XIec0?=
 =?us-ascii?Q?Psut5bLbJ2gEc+oQ+pjq1NCHZlpuQLpFAQ6LCpZhhxdE8IzCuFmkF2ODZn+3?=
 =?us-ascii?Q?v33qHOh5DpdUuJ/5UyeQeiL+tQIY92XvSfVmbrmOlE0lbhjh1/sp5MEj8bSw?=
 =?us-ascii?Q?2VWvJm16MeiL3OBbbHjSGNmPb8S4RTOCRTvBQSChCeQ7YTRKh/JjM+mzCznu?=
 =?us-ascii?Q?A+JCfthFp6bc3Yomg0pyo9uAf9VqUC0=3D?=
X-Exchange-RoutingPolicyChecked: iSBB0SfxhKZKFgTLmFRkQ3oTxYVKyY210ykVwaujewRv1SAj8kLR/rk+39IMzEu3XJwaNo/ZKf90ICddRIWRwzY0MTWjyv2kUKRaeXqiOKNB0uNKOV/FRbbqV6himQCK9PBdS+iq6wMXS0kuhvATU//l15M+RYJfOf0mKYUzvMKUys7gimlxNSb8dQPhjmqQzpjtSJhhE4EdY6kBpNTabAaI6/VtUVApWBz0BBn5/cqRmH8yfmJkmIYT8aB62fLUcc0e6bIT8NfxYeDZU0ACMScZNn37xpNP813KmqgE1Xb2+JLzD/9EkXQcFyHh9jf7h7HDqDuwYPzaHTHxkwjhJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99243fe9-c5df-4eb7-7e2a-08df1cf6417a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 00:20:10.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEt1ivYA04BfoRy5S1LYytWNwlII7tqTf7dMBIi0Mcw0FpHeGW2tsq+eqYiKFpNHW2Fa85xZiEB+reDHyzqnxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB096109
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

On Fri, Sep 25, 2026 at 02:24:20AM +0530, Karthik Poosa wrote:
> Add mmio_temp_valid() and mbx_temp_valid() to check whether a temperature
> sensor reading is valid. An MMIO value of 0xFFFFFFFF or a mailbox value of
> 0xFF indicates the sensor is unavailable.
> 
> Gate these checks behind has_mbx_temp_sentinel, enabled on CRI currently.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_hwmon.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4661bfce2f4e..87554605fa41 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -202,6 +202,8 @@ struct xe_device {
>  		 * pcode mailbox commands.
>  		 */
>  		u8 has_mbx_power_limits:1;
> +		/** @info.has_mbx_temp_sentinel: Device has temperature-unavailable sentinels */
> +		u8 has_mbx_temp_sentinel:1;
>  		/** @info.has_mbx_thermal_info: Device supports thermal mailbox commands */
>  		u8 has_mbx_thermal_info:1;
>  		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c743867a2ebf..8a1dbe708828 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -104,6 +104,9 @@ enum sensor_attr_power {
>  /* Index of memory controller in READ_THERMAL_DATA output */
>  #define TEMP_INDEX_MCTRL	2
>  
> +/* Mailbox sentinel reported for an unavailable temperature sensor */
> +#define TEMP_MBX_INVALID	0xFF
> +
>  /* Mailbox temperature is sign-magnitude: bit 7 sign, bits 6:0 magnitude. */
>  #define TEMP_MBX_SIGN		BIT(7)
>  #define TEMP_MBX_MAG		GENMASK(6, 0)
> @@ -822,6 +825,19 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +static inline bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 value)
> +{
> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != U32_MAX
> +						     : value != 0;

_mbx_ seems a wrong prefix now...

And this patch is kind of hard to review alone without its usage...

> +}
> +
> +/* Mailbox temperature is sign-magnitude (bit 7 sign, bits 6:0 magnitude). */
> +static inline bool mbx_temp_valid(const struct xe_hwmon *hwmon, u8 value)
> +{
> +	return hwmon->xe->info.has_mbx_temp_sentinel ? value != TEMP_MBX_INVALID
> +						     : value != 0;
> +}
> +
>  /* Decode an 8-bit sign-magnitude mailbox temperature to degrees Celsius. */
>  static int mbx_temp_decode(u8 value)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index d66d5a0339ae..e656fc012902 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -476,6 +476,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_gsc_nvm = 1,
>  	.has_i2c = true,
>  	.has_mbx_power_limits = true,
> +	.has_mbx_temp_sentinel = true,
>  	.has_mbx_thermal_info = true,
>  	.has_mert = true,
>  	.has_pre_prod_wa = 1,
> @@ -796,6 +797,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> +	xe->info.has_mbx_temp_sentinel = desc->has_mbx_temp_sentinel;
>  	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..0041ec5676d3 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -50,6 +50,7 @@ struct xe_device_desc {
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> +	u8 has_mbx_temp_sentinel:1;
>  	u8 has_mbx_thermal_info:1;
>  	u8 has_mert:1;
>  	u8 has_pre_prod_wa:1;
> -- 
> 2.25.1
> 
