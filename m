Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1D9E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 19:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A392310EF80;
	Thu,  5 Dec 2024 19:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8YmqoWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2CD10EF80
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733426758; x=1764962758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Lp2+9Ju4ZlU1QXBtntY6/nprZXj400ySLLCak04F1go=;
 b=T8YmqoWoju5p3E0P1LVnNVI1buub9wwa/1aJqiuVaok6/LXGLy/GQF30
 mZWvh+bkvnwele/JPTpLHZ/OLZdZ+xaqJqUVaSLShTbpgAKRkI0CFMlLp
 CTnRKJRwErnfh55LM57qz+MgXeHpsUwrGZL1wjvYRe3ju9V9jc3sxUc7v
 WLdNSN22k4SKIxNwjMN12rfDkdQTfonTiWvS62B5aXW7WLwK8HHaJtGTW
 E0l5KR+J0u5y29CuVtKLAD2bJXtt/WI7p/ad2HLs986uhPNkV6nZP+SWc
 hNRBIdAo1FMxGCemp4pLgubLcIs5MujZG+djqCIxl4ljENM3z6oL4Ttzy Q==;
X-CSE-ConnectionGUID: 3Qb9hh6sSXWTiI5VSpul7w==
X-CSE-MsgGUID: yoyC+OIYSs6DRGYb+XypDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44235586"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="44235586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:25:57 -0800
X-CSE-ConnectionGUID: RbwsfTg1QiK6wejFYmJt9g==
X-CSE-MsgGUID: vOjRHE0jQ02FgD0vnt7srQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="125104018"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 11:25:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 11:25:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 11:25:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 11:25:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPmW+632qvHqrPf4S/SYD0OM4arkZddo+sweHfObo/69QcH9U2S9LO5iZnZqybpM81OdWi/7JGImb/XwhEQ1SsrpgX6PJ33rBk1iaYZLEvjRfo7twrD4PxO3WIP7Ow3LKK3ZTmDVEti7cuo+7MEM+wo6DVf5bhXmzSUVn5u0po68WaR8plMCj8uTPFGuVso5TwE99PAVzCbk4IZi3r9O83TEDB2ZDJ3Dd8QMu5Uttf4qD16KSrAyUdN5l0FpPVgqfkJa53hyVn85MjXWBiNqvuJ345hYQVxfvScYouE2AbfPnqLfGbn5acPPB8XW59ChBV2j8tUaKF2oDg2zzTVqHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PTF6TPHSpbNe2QYnAlPPtDqcg/bhAp0VuLXO0z1Ck4=;
 b=EEZafV7GFq4m8vcb87GdDBVY1bpu8hHyy/TeP1EZzk23CVK0o2q1rKaHbEPisMW7TMGGcDggQNsJZHghTEZAz3hH01nYU38f7CdhGyXcCL1Pfe2QvV2+vMrDbJh0f9KUihyzT6cZXh0lw2uMzDVNoPuQxyc1Bq4/NXCUfZgYkh0BqbSuFi+HrUeKItLyq5Q3+kCS51ClJCSY6aYUK6xC0vo+YTpGJG89UkU+rWOGcHTYv0Z+Kq9N+eYhseHbKhIrJfILOmgtISDCIQRMZZd9dD/svAHJ06b572/Rc3sFfZ4l8AgjrYAqE31HxULlxt6Nx2aTVd9dwNNkGqDjop1usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 19:25:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 19:25:48 +0000
Date: Thu, 5 Dec 2024 11:25:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/reg_sr: Write all whitelist slots
Message-ID: <20241205192545.GC3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205182240.3463027-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1550e7-7fe3-43e7-af5c-08dd15629f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pqHmrFXOHOs8rpf9jLMg2RoXyWA4T8+7ZK93gt/bzqtc3j3Ib3bc0lLXeZwc?=
 =?us-ascii?Q?nDAm4dy799jkWyTk64RjScZB39s7J4ttWln3M1kkMfNVbpoUuKHHnV6TtcNy?=
 =?us-ascii?Q?Flt4T3oinvx8QQvPzDlY3sgOlV+31CGuie7XKjvwY/595nrcB2iMDMvW/0md?=
 =?us-ascii?Q?eGpXFlY6CEgx0uSnIoWuu3Rz2pbDLDG/tONcoyBe3Fx4HRN1rhsNPd+zxcKb?=
 =?us-ascii?Q?jEK7Y0mBzkelw5WVqWvf6LCs9oeN11liTLyCg2fV7VzOP4qcMAMl3dGYITLI?=
 =?us-ascii?Q?ZuWwPmq0hHQWu89pD24AkfSWNFIsEwa1tfOGxP5abhNSfzGUa0tTgB2OzVVZ?=
 =?us-ascii?Q?5Egk7BoihBr9//6/rcQf9stS7WNXsyl4l/oc6lVc+GlOSi68/BfVyVwh1Ucl?=
 =?us-ascii?Q?6iMK7AkDqDukr9b5dnplvU5fMtyGGLG4VOANfoKwKwrfyWKTSGexLkPXikY9?=
 =?us-ascii?Q?iCI/7IfowlVBeMvbCCNvKOMiA/9t3qYR8rRqKALNiC5fnz/jG+Uyygyq1lde?=
 =?us-ascii?Q?9k6upFNoBspsOe3IhK3INX9bj+KhMRoCqmL//6gGECe9xwmncGsIx361o9k/?=
 =?us-ascii?Q?NNYxCp/AcfGFt9tQkN+Jw71+WT4CMCT1t7UmhJCCNLEAO+W1anwn6co1614L?=
 =?us-ascii?Q?G18GuD+jNExVkDif5ReqShzdXfMADQkbb1EQ2RE5LQcAZaD5u04z9beFfH+i?=
 =?us-ascii?Q?Qp7J4VR6SALAQ+livWR4NYfFFQNx1WmtFPuPLIlixdSm6qrcg3iH05bZNoZH?=
 =?us-ascii?Q?zhyIv8kxJq/PJNG5wg+GjOJpORKNgW6mVgwvp0P416GyVM4a2E2upva5Ysz6?=
 =?us-ascii?Q?hCbhv2RHPmacwbxPS/0I/T1lnradBppW6mjY+IIQQ4U69FW8xxnmd9l/Exby?=
 =?us-ascii?Q?YZeFq7734Ut2ZZmmUIcMFMQKqyyens50thyysUgveVa11hjFO/8kN5j706TM?=
 =?us-ascii?Q?6fiMQcC+fY5IQ5jz7Z0LSxitYQrizVnjyWCeXYtVFMnEfOOgEwP2/5Hk7Lb7?=
 =?us-ascii?Q?lFhhPGdP+dWgiDy+Jear9NyQYd7GOsnl4gHgqx+BRVBSjBENA3umfoGEcZEn?=
 =?us-ascii?Q?0wBKYLR63FGUbRL1+YaefNPKBlmYfEKGwpSNfZkiW69oa/JsdbG1HlPtpWVG?=
 =?us-ascii?Q?aYLKV0Li1KH429O0QxNAZPnj/14pUeJLmyD/vQjyf7dgfBRehkxH/2xSwV/t?=
 =?us-ascii?Q?iEbV2CwQql/5iPOwst3hWA07ULOia3zjURx6tCYHSNxEj4YjuxMOX0u8AmK8?=
 =?us-ascii?Q?cZt5xGDOGyR8uPdUOD9FBJOztY4uYwThj5ZCqURcxgO6yd/lvAQ4cRRnM90q?=
 =?us-ascii?Q?Fijd/QZbw+nMtYeLRBM3v1fqp1Qrit2eNOVeuqL+itEKeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iQlLiNG6xWrKSim+kkyLUWutzv9nLXxwz9mNFeMx2/Fy/nHxV8pKlQhf/Db0?=
 =?us-ascii?Q?hmHmiSFRDvqaV8recYCfWFOhsdmi/qiCf85xZzgIurmgk/BG2ajAglWkuoTm?=
 =?us-ascii?Q?Qok9rkCEbJ6t66JexzVbgWC1OJw3ZHiAns/XWtQ2kRsVqZRLIegBK1xCHYfT?=
 =?us-ascii?Q?G2m3gA9K0/XnWcYA5YFw1+Ia3r71XYBwOBZ/oGYrEcU92Ady5g97mWthzeM3?=
 =?us-ascii?Q?11kczPdrM8KTYxO3mEEyOlGsL8L86BSRjDI0tKzq/esSzQLgsM+y8Q5wmbVb?=
 =?us-ascii?Q?q0usqHL9haKNyi4CaSrQU74CyYbuxS6cXtjjMgsaKzwYKIK47qOdiM9Hhb+e?=
 =?us-ascii?Q?Mn5QNgIzuZfVV2aqB7bR0Hoz50ZsBpYGkf5svzPyLsBtRwe5MF+jkbV05Kjn?=
 =?us-ascii?Q?JwnuqPX8Tfz2lSGr5NBblAzOzpDTnkeaBvbmdr+KGB7X+xNQc9nlk6qJOYoY?=
 =?us-ascii?Q?/5HGLS0Ff5+WHykNhHlly8xFL54Pr6Ge2LrPFeCfOlWCYa6valI6d7yAbbuP?=
 =?us-ascii?Q?9sY5Kit9Ta5xazT+20Canq2Udpck3KXld1SqUn8b2CsOouXBHsQ5I4cuLiwy?=
 =?us-ascii?Q?r9cTHdkeFh7REO+Kn0Gcv15j34FEJvdOAs9HI7xdjiE/aHQ0BHh7Wd8ZeeoI?=
 =?us-ascii?Q?a3vp0QWsBo7GIILlDCYZEkyBra92gxbLB3QBH+uNSwGrOrtxqyLBN7imM47+?=
 =?us-ascii?Q?rsRvQCXRaQgXv526OHRW2AWkb6TyyLiw4Len8x01SP1i2kitTA0Fg+Cl7XVo?=
 =?us-ascii?Q?JI2EWGdsVZ5v1Wab4BSt3paVRRSmcBL44EBrWeJ9yR2VDDmNEMTeDqo4OkA8?=
 =?us-ascii?Q?E9FCemD56rDcr7bi3sTOvqww2Q1LkjaGyIGcELsE1Ej14NYafZmxEDRF3POf?=
 =?us-ascii?Q?ka8R5Kvfixx/a0jDApNMpEiGS3GZ3J4p/1FfMP/X4/SQXWe/sCv37RYVjF7K?=
 =?us-ascii?Q?vEbG1Mmd/nmaZfm6mDiHAMtEIQc6+tZWXRjP07DjTDMr/b5NRu1RjWocOfo4?=
 =?us-ascii?Q?mA4bQOv9CcKNN8QZyFex/XFALkcY/iZyCsJjmkT4TzUIW4ME5GdWebMczZlo?=
 =?us-ascii?Q?qc4IfQinfto3QkwYwUcIQNyHDre1CtZNGnrUAFSpKng9DD9XBgt5eYmwXiQJ?=
 =?us-ascii?Q?mX4yq/OlgGqFxuVGXCQL4nMMmquaqvlHOmC3iyecXUZN2t13Jya7k99jUKYT?=
 =?us-ascii?Q?p8nQC1yHOZ2IzE0yHL1zjRpFvMYLO8CcJHCV5dTt6sKGvv7yWhBVOdyRtTr7?=
 =?us-ascii?Q?wzgaPLjtxKum4HuFvW6P3aDosLI44D5w4wIJiyhKH7zbejo95CBNpqd0pkJ7?=
 =?us-ascii?Q?VVKQIcmthWT3eg+xZDoD0iWYl0iu/ZAT9m9yDa3ZRdlRaIMx4U4rovegSTtC?=
 =?us-ascii?Q?EYaMeVsP2/1NCsZ3/ZqDsaScV2rIq5oC1H11xuY4KrICOl6MRof4bzhRCxwz?=
 =?us-ascii?Q?8MDu1zzsW1RK2RKvRspcOfJ8BnNlZTN/nKcH2TCkKOZtjDPM0K0NxegjDN9Q?=
 =?us-ascii?Q?+gIMrbGOW1OjM2Uc+TygrM6KnsngRiqq4bzz+B8Y6xRrfd5N9rAWGl6mgXcs?=
 =?us-ascii?Q?w6GY2WWWyMwW/8CiSC2Qhp5bAS/xIxwmPU9aqGO0aUMROuVsxcy+MGUAOC5d?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1550e7-7fe3-43e7-af5c-08dd15629f50
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:25:48.1472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/pbyd2Lc+jghSFP8VgLlkYIQurEtFFiHXveTvnGfCDU4qyuDr3TgpYbHT1LgLzw/nLfaxc4x3pjO+gJCWHMMsQxVaGZK2IQmmTcR0XJdM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
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

On Thu, Dec 05, 2024 at 10:22:37AM -0800, Lucas De Marchi wrote:
> Currently if there's 1 whitelisted register in the engine, on slot is
> written with that register and all the others are written to a sane
> value. For the free slots, there's no reason to change the behavior
> if there are 0, 1 or slots occupied. If the default value from HW is not
> trusted, all values should be written to.
> 
> Also, later on all values are passed to GuC via ADS to be restored on
> engine reset, so make sure they are also written to when probing the
> device.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I don't think it really matters too much one way or another.  There's no
enabled/disabled setting for the force_to_nonpriv registers so we
replace the hardware-defined "garbage" value with our own "garbage"
value for the ununsed entries, but what really matters are the ones that
are set.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index c13123008e903..f982c1cdb369c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -204,9 +204,6 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	unsigned int slot = 0;
>  	unsigned int fw_ref;
>  
> -	if (xa_empty(&sr->xa))
> -		return;
> -
>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
