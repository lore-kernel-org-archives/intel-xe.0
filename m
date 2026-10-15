Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F121CC6B34
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C4810EBF4;
	Thu, 15 Oct 2026 13:46:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F2510EBF4
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792072001; x=1823608001;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=plT636g+2sKCuUBWo+rMx/xRClplffjdz7UWKy09QSw=;
 b=F+oduBkX0dr7pAY76E+/4QHBziJhDmxR2Ojt7BUkypZHzLZd7EQDdHY7
 y4mFrX8fedofgOQt/CYF85Yd72nRDHk+20Jolb1jEI6o34GA+1cQu981P
 puMkIfqhIFVh+6uYgQzriwyFUrzQ4LriFh1kXF7v9bIOQ5TpNO8mcHumC
 m3IbXTDCIbzVhJrZh5XIlxYLb8QRpUWfDIFu45E5sWg2lQv2RYhincIZ/
 FRWYzbgCaI8GgTAFfrEIZ4kmjmgi7HC2sH9mAcEqWILEbss28AACOHgLp
 B6tmoatVjwKAtBwNaYxoUSB//Q2wyi2OvvTWhNOrD9bU3xZ8u+p4N3F3J g==;
X-CSE-ConnectionGUID: 1GXr4RubSnyjIxeFIpgNZA==
X-CSE-MsgGUID: HpZvSqx5S1qeaKdJjTRt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="853140"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="853140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:46:41 -0700
X-CSE-ConnectionGUID: dCNVxTe9RSCghTXxa30qmw==
X-CSE-MsgGUID: ckRQGCwwR1aV/GmIqE8X0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1629186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 06:46:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:46:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 06:46:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 06:46:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTQw4VWBYrbwByaWimu56uy8UukBw5VhFNzfgjdGBmgFatUebPnZliVEvzFgSpnT51tAy70DKbI+X4AIoqn63BylmIqVDeHxKrMwEm3le2Rah/yK6BVHHEafJ7I+XNG9839DI351IqqzioM+W6geRLyy/svQZ++tMMy87DO3mqxs5HPVa/9X4wRBxSjf/RdwVj+Pxr3BzOINPDK7eQ9Z4TveMEa5/Z9YrXI9ws9MheSYF5F9KO4k+CNiP0rnBkPsTv/XHcEa/L44swCjXXpjl66AC/fGRrTzpuBl71r4YNrxFy4hl9I67NOp5OE/LAkGWzw0sMdbz8Ey+TgxPiazIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hul0A25CoYa05OXJIInOcj8ma+YVwnJdrgxk8OTAb7A=;
 b=VYfAFJMZsu5iahPjTenoC6LjlvFZ7uZHAuOgZZoQ6p9eIIT4ejR3Db+gkmAafUPd7i4aPFrs7w/7yH8vahIgItI12jlCH2rNH/OasGtxkNgo/CAvAHijnduOiYsPmDLtXv8Ijs9qFExPvlfSyUrXu9DXtq7qeKob0U7IZwg1HqgzMRtn/UtCly9EW4VpDNyjJp0JqhpZJPzSUjemedsnFBc/Ym5iUffuUimUXU0uGUefhj9Pw4Q2rSEQb+sMVKXibAArvj/Yejro3+p26YrgnB//UJVeR2WcWJpt9AzVOVOtJALziy+h3WB0qENbrXTo0CTmYGbon3igwc2CVXoqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 15 Oct
 2026 13:46:20 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 13:46:20 +0000
Date: Thu, 15 Oct 2026 09:46:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v14 01/16] drm/xe/hwmon: Fix pcode power limit handling
Message-ID: <atDZKSgBi-xiKSPD@intel.com>
References: <20261015071434.1063785-1-karthik.poosa@intel.com>
 <20261015071434.1063785-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015071434.1063785-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|PH0PR11MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 30860993-f181-4d13-83c5-08df2ac2b1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|18002099003|3023799007|22082099003|4143699003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: S14lK0LCe82t+mqUqRhozUih9rw3jx2uRAkTqjr0KP04BUqIM66IZ/wvkmPTbZ2p+heks546Dl6tFHMbTMm0A8pmKDKKSGKVhemTDo+/zap4WueQNHEwSRwcCgVtvhsGSQ9XBLyOH6FBSRrG+Dllok1FksNIpkzr/3GAIsIthHtZGbGxn6n4O4uTDanYvjEFC2ES0Q2U0t5dFwXb/VK7o97IMTsWusQC/lFNZDv0ZGZfcw/DgKIBbcew3o7WI1UAHvs0lXNh3nKOFlzNRCFF2av7kgjiOvi+zEu7ZC61Kj6NZCC/q9Gjche9NUvjmOi1XENKSF+wCttoePwZQeiJ5E27VNja8D9hepRd3zMJ211nxYCja/aYcy7G42JxFVBv7VX0lPpBBK5GXmWGuogsenckGZRBGTj/tOBN58ZCnkNDaVxpCA3ALc11A/Pyp9qkLB5a9r+tPUC4R0kJU117unY0Ylqjb2dfcmEGWOdigldo+WqY8d+26gXZB6bYTIrz+WltvMoOuI2fL3BvpfbzUSaLJ22zr4Y8IBIUmVtr91cldCz7jJIM7e7pOfO1x6l58LAgggwd4IpQV+uhikc2XG6e7Zm0L9NXb/uLysfeGMJm6bgxPNwHsqZMznQr0R8/q17FvsjLA1JNJSUvvtV9Wvw30HpZvGyqme9jg4Q2QFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(3023799007)(22082099003)(4143699003)(11063799006)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jF5W7yjW3HzdzAl9UtMDa10CdkVFYzCkC2IyNe6gNBF4ON5qw/xqvZ4aG3K4?=
 =?us-ascii?Q?KN2R6fFm6uRv1G4HKUMK5R3HBvnBOQ8rw4ZQCNcabrwo3NS2epoGiKfEulj4?=
 =?us-ascii?Q?Abc5xYSdOasxSAAu7ko1i9jgd0e7oUyS2wKI6/m/NdVxNIjod8fmdZr79Fs2?=
 =?us-ascii?Q?EKxX6FJ9lW/2gKcXCxU5USk0laGLk4n1MGGJ8fVhbfsxW1brsSQTCf+VfmuR?=
 =?us-ascii?Q?Mw/1mPAYE0kv5tKmScVanKebTSe4jfMjfqd+O6EbOo0pFCf/OiAiBaNB4tQX?=
 =?us-ascii?Q?Li2qzbhSGXwQb3DUzjMp0zzFK4qeB2AN4lS0dWrdIEKK9tR5w44Xc7Wx1xb1?=
 =?us-ascii?Q?tQRDXgLT3j8qSNG3avtUY1bWHs4F++GqhdLvV2sYwNZrOlsUzM/2EeOKGoQL?=
 =?us-ascii?Q?9IPUgjHMXfjyt1At8VNDB33sRtfysZU/M/yrqxhbYRrQCeieplrxQGftd+fe?=
 =?us-ascii?Q?/WnH4n2o8VN/CKBF7zN01AwO58JV6nFQa3qc4eH8O5Eg7ykNAYr3pPmSIDtc?=
 =?us-ascii?Q?tp3gfahgTcOEnbF+KAWqKLqMORtzwLGS6piYyojgl4ap7A2YE7QIXFEPxz2g?=
 =?us-ascii?Q?043apbY5xJhn8g+sSNM5SpTEsyfG8ZBUW0UKUZbfqzkLm5Iy7QMNOr0S5mXO?=
 =?us-ascii?Q?Uv/nJ4fWtgvSdIkkOhYlhcsp4goJeKXpKB+17QgyTDtKQ64Lw25irmkalWbg?=
 =?us-ascii?Q?BwvxzTqHkWqzvjpohPotIsJqGul8TQqnJbuM8Dj9v1D+/rbXJDNasbTssJ9K?=
 =?us-ascii?Q?o3gb9Z2gRddLlJzea726DFy+6TkG9Lxp6Y6U3mwoIgPiAW1y3z4X/1JvGcV/?=
 =?us-ascii?Q?uD3k0ldeskGb9G0LjtKdB7xYAlRb9x7ry5m0dtYs5qZ54e+nc4/fsjBa6zJr?=
 =?us-ascii?Q?aIct3xMh1C/foVwaQCr0PFLlj7R6bcsbxX4qWiQrm+vKj11oR+6dvDHIHP1l?=
 =?us-ascii?Q?g7PAXa9QCspH6EilglrxSZBvWu0vaE5VFFzr+EGeNFOV3aYm8F0lCUEsnvRh?=
 =?us-ascii?Q?3wmv0v/YMhqKJCs1g17+We3f+cpX4YHqYg+yC1H+YEZ5Vhhc1qq1H6f8cT7G?=
 =?us-ascii?Q?8Nbx4P6insO/2oFopFVdjT8L7nLhObiHk5ZI+Ki1oNmM/wHzcksrNy5j0s16?=
 =?us-ascii?Q?YUk0d+OASd/Z5HAOrHw6cxY05YBZHeCtjK5HnYKn5wgrX17ySoKpnzE5vUv4?=
 =?us-ascii?Q?VqkN7dsftOZ/RyhZJiOTBQjXifN+0O2aL1f44mB3AHwEHFiMg4k8YYbgda8X?=
 =?us-ascii?Q?WNoMgyUgRV/diea0gvFn4x9q8qAhtJqW60v2k/7QRINYAgkNQ11GheRtFHWl?=
 =?us-ascii?Q?4u7Gv5e/BmdCA3gnawM1cEsLKVVVniXFOTZ2dsPs74PjxQtzRpcbfqI8poA+?=
 =?us-ascii?Q?bM3YpaPmf4RzBrohOQ4fp6EJNl7oI/kFkPcFQQh93RiAy2fZ5tb95w1O8wMn?=
 =?us-ascii?Q?UEYnqXBzKUfYhyNzmuXouI3ATnnccdlW9WNYiUQd73BobITLwZzEt6boOEtU?=
 =?us-ascii?Q?iPsaG5kS1Z3sVc/4QwSyuvTTKgzBL4fxMDREp3wttNK2xWkZzg7fwyhBQpa1?=
 =?us-ascii?Q?FLMFKHXoxYZTn/UOEfNne1ND+vt8CIRfzNMhmQkijRm/5FT35rim78eJHsRR?=
 =?us-ascii?Q?nkL1qI2Kt3+A88iQhd6+b6FMoHEPlzuVVHzXRksA7O4nr4OFSRczEhd2fNh2?=
 =?us-ascii?Q?H6u5Momb/o6t1Q3z3syriE4shVr8aG686HpNZc6DA1MkdurnwutAjQg9BIJM?=
 =?us-ascii?Q?/MMScc4+NA=3D=3D?=
X-Exchange-RoutingPolicyChecked: WZzYufVYINoCvbD/pG4GjRK698sUTimLed7KKNvRBO/xPO8gWwB4gVuk+33ANH2On+9yReYLt2FTPw9S5CPMMehdF1bw8e53ruybJ651C+XeAT5IVVciaY/HE1Zrf1G6CrHOXvFLWoI4/uWW3xeZIeAwSSlt/VkKbCjlbyz3MUozKT75dR+rOSE9PsQn9M3I+k1JK5O41vvwax+x30fHSy7Bg9ErtYip2A41IrBCh5HBGPimbCJb0PEOMiBMH0YwW0UhyCrQPrwL4aJYR0orz2mgQbzAJjSJh2Y4KbjNthjWvmVAjBGsbV5LI+zTbpTELEXKPSU48Y3W2pFvlqFZmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30860993-f181-4d13-83c5-08df2ac2b1ab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:46:20.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJWRWyWbdKb7lvugQq38sWFIDmmApMCloZcf3ksnBmgiUgBxoi02oYpet+y+iFj+prvbLBpxZZtVc8rqqnM0yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5160
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

On Thu, Oct 15, 2026 at 12:44:19PM +0530, Karthik Poosa wrote:
> Return early on pcode read failure in xe_hwmon_pcode_rmw_power_limit()
> and propagate errors to callers.
> 
> Replace boot_power_limit_read with per-channel
> read_power_limit_from_pcode[], set on the first successful pcode write,
> so reads and writes stay consistent even if the default limit write at
> boot fails.
> 
> Also return PWR_LIM_EN for power label so card label visibility works.
> 
> v2: Move default power limit writes to helper
>     xe_hwmon_pcode_set_default_power_limits().
> 
> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I shall push when CI returns...

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 84 +++++++++++++++++++++++------------
>  1 file changed, 55 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fa5473ed6e7f..bb681d2cf991 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -166,8 +166,8 @@ struct xe_hwmon {
>  	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>  	/** @fi: Fan info for fanN_input */
>  	struct xe_hwmon_fan_info fi[FAN_MAX];
> -	/** @boot_power_limit_read: is boot power limits read */
> -	bool boot_power_limit_read;
> +	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
> +	bool read_power_limit_from_pcode[CHANNEL_MAX];
>  	/** @pl1_on_boot: power limit PL1 on boot */
>  	u32 pl1_on_boot[CHANNEL_MAX];
>  	/** @pl2_on_boot: power limit PL2 on boot */
> @@ -176,9 +176,9 @@ struct xe_hwmon {
>  	struct xe_hwmon_thermal_info temp;
>  };
>  
> -static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
> +static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon, int channel)
>  {
> -	if (hwmon->boot_power_limit_read) {
> +	if (hwmon->read_power_limit_from_pcode[channel]) {
>  		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
>  			return READ_PL_ACCEPTED;
>  		else
> @@ -199,7 +199,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> +						  prepare_power_limit_param2(hwmon, channel)),
> +			    &val0, &val1);
>  
>  	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> @@ -214,14 +215,14 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  	else if (attr == PL2_HWMON_ATTR)
>  		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>  	else if (attr == hwmon_power_label)
> -		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
> +		*uval = (val0 | val1) & PWR_LIM_EN;
>  	else
>  		*uval = 0;
>  
>  	return ret;
>  }
>  
> -static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
> +static int xe_hwmon_pcode_rmw_power_limit(struct xe_hwmon *hwmon, u32 attr, u8 channel,
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -232,10 +233,13 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  (channel == CHANNEL_CARD) ?
>  						  READ_PSYSGPU_POWER_LIMIT :
>  						  READ_PACKAGE_POWER_LIMIT,
> -						  prepare_power_limit_param2(hwmon)), &val0, &val1);
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +						  prepare_power_limit_param2(hwmon, channel)),
> +			    &val0, &val1);
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> @@ -249,9 +253,36 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  							     WRITE_PSYSGPU_POWER_LIMIT :
>  							     WRITE_PACKAGE_POWER_LIMIT, 0),
>  							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
> -	if (ret)
> +	if (ret) {
>  		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
> +
> +	/* Read from pcode once it holds a driver-written limit */
> +	if (!hwmon->read_power_limit_from_pcode[channel])
> +		hwmon->read_power_limit_from_pcode[channel] = true;
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_pcode_set_default_power_limits(struct xe_hwmon *hwmon)
> +{
> +	int ret = 0;
> +
> +	ret |= xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
> +						       PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> +	ret |= xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +						       PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> +	ret |= xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
> +						       PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> +	ret |= xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
> +						       PWR_LIM | PWR_LIM_TIME,
> +						       hwmon->pl2_on_boot[CHANNEL_PKG]);
> +
>  	return ret;
>  }
>  
> @@ -395,7 +426,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>  				PWR_ATTR_TO_STR(attr), channel);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
> +			if (ret)
> +				goto unlock;
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>  		} else {
>  			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
> @@ -680,15 +713,19 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
> -	if (hwmon->xe->info.has_mbx_power_limits)
> -		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> -	else
> +	ret = count;
> +	if (hwmon->xe->info.has_mbx_power_limits) {
> +		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
> +		if (!ret)
> +			ret = count;
> +	} else {
>  		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>  				  PWR_LIM_TIME, rxy);
> +	}
>  
>  	mutex_unlock(&hwmon->hwmon_lock);
>  
> -	return count;
> +	return ret;
>  }
>  
>  /* PSYS PL1 */
> @@ -1512,22 +1549,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		} else {
>  			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>  			/* Write default limits to read from pcode from now on. */
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl1_on_boot[CHANNEL_PKG]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_CARD]);
> -			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
> -						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
> -						       hwmon->pl2_on_boot[CHANNEL_PKG]);
> +			if (xe_hwmon_pcode_set_default_power_limits(hwmon))
> +				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");
>  			hwmon->scl_shift_power = PWR_UNIT;
>  			hwmon->scl_shift_energy = ENERGY_UNIT;
>  			hwmon->scl_shift_time = TIME_UNIT;
> -			hwmon->boot_power_limit_read = true;
>  		}
>  	} else {
>  		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
> -- 
> 2.25.1
> 
