Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F888C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 19:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D974D10E2B6;
	Tue,  5 Aug 2025 19:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgJNg+41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B83810E2B6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754422234; x=1785958234;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tB+BvZiS+6I56+xBx2S4Y/jvX0f5zGDbmtRs6oyk+WA=;
 b=EgJNg+41emIsyHPvVWCW5rA2K95G3M8h2erLrcTXvxQPknvcY918ZrzS
 RQseSV4PK+jMv3wGzFh/FgStXKkIqRORp53qYrN48WqwwrTwCtf+Xn9Rl
 NClsCwzTvVvHr/n47efvjXSQso8ow9J1V2bH+jr/YR43Tm0CfHYDJ1leA
 3z69zbQ2aoet/MVT5MWDrsiO2gb6Is8WaZu2cF9xp8zwDdchVtm6WfGqG
 DjsIDa8etsGnls0X0cUtdonOxXO7SPe/j1q41m7kcwK/its+nIoLDRAb4
 dDM3AI8hNL5Ly6KkmTZ/50DehrQ/9LH57M9k8WBh7WnUinPp8ZZ5T89U3 Q==;
X-CSE-ConnectionGUID: z72t9gaLT0aUXHolSVvnWw==
X-CSE-MsgGUID: oYQpoeorS/y/PZJCnlsDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68184477"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68184477"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:30:34 -0700
X-CSE-ConnectionGUID: f+3j+5TvSI+MkMKjZFeGKA==
X-CSE-MsgGUID: BGqrCCCSQzO12Auiq2UKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169953478"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 12:30:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:30:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 12:30:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 12:30:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u86OTmCYaHdq3CIPp220lk1FoqMYd/Z3t/2mUjJjYhuh5wkg96d7/bHpRD6vybDOm8FwxJm2krjnK0MnM2d/SVOZPsCWHMro40zVNR2lrURfPAv/N8RtJQJJh/EaB/FeNXHP/8qDPYwOzw3Ss48rHN7cGEgmq4DY7TOEvs6a4vHQ9+V30VzCKU0jxyj344cxAEOX+Lnmizt42l1uN+vLe23yaXsaMH0Ujo9pwUmf/LpGSgRGBa7eL28xjP9coYAaXZ+Dcp5J/jxMQ/6f/YderjQ+TvaJiEpDlibLuHaarR1SFi2FBdV/GbfjZq2JPzdg8lp//CE02nuH9iE/6IpcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AbgkmQ9eFZqiAPpUj7wDdV+O8dZnc06e5S1aGhP0dc=;
 b=HyMJpolSjXn/PQjET0+cHm8nmV1ZI9reeYkw5wgAV80OJx7+UF9e2YHPAGnG2qFV+eR8GQHx4PW+GJmeywOX4ENAWNd8d2cwQvrktMIUaxaTYeVD0NvttRoqD0N4AXh5Afe/w5SphWBZYD2eZVtEcbdIqadYzmbTp3HsSJ7ssZXZlKqJDmvz3ThSrzFaqOi2PexcRRl1wGcqlsnf5xEKXMrOgp5O0OsdxyB4AU8ofKHdv2yuLrDck/2cfz0xqsd8H4w9JekecsEz3K30S3sLz+74+jZuZTQ9Sl1XOQPvai2l90nCDMr7UfwZeOFxPDX2lchbvzhIm7+jbqrqeImYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.19; Tue, 5 Aug
 2025 19:30:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 19:30:28 +0000
Date: Tue, 5 Aug 2025 16:30:23 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v6 09/11] drm/xe/configfs: Check if device was
 preconfigured
Message-ID: <2etfvrw5naiwpragohjcoyywilmhqgdvvfsnniqkxgjitkv7e5@dgynxcaowgjj>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-10-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250731193339.179829-10-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: f74645c8-2046-4a68-e3b3-08ddd456889b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OU/OyiJT+LpBCW69JQ0wyBctlfF7NdX9gNa+jhSQFhGeumN/gLoGsoavsTtv?=
 =?us-ascii?Q?7ynd0RZQ0r3nkDzTRGBKO96BkLmwb1P+mlYI+w613B3ApX0+yy80mZC5PEwk?=
 =?us-ascii?Q?hNHAloNOXLA7fJUtY/NiDcrpFmzQ/P9JjoRSN3Ok856pYhwdO3A84CyEVvZR?=
 =?us-ascii?Q?rjpbFauNOJOHgoqWjCpb0obb4v/d+AuZEP4AzA+uh9pN8DAO3Iu6wO16ETb5?=
 =?us-ascii?Q?LtxrXYwKKCoyDthJqz0GbrY2li9fqsMOurgxHNQx1DOJbZQuSWIWHcmL+x9F?=
 =?us-ascii?Q?o580q8s8jvvV2pCz7Gkwe+8FRieUbYQ5vGJjCM7BaytlQNSARzP2j+XzlnOr?=
 =?us-ascii?Q?kLXE20Jmvzi6MlNQ9Z1xUHlVrOQ5ppq9DNo6p91B9OpMroJQZTWY8KMMRE+l?=
 =?us-ascii?Q?JeEf8JKmaW/XDzsOrL5I2jtsYXckDUQfUwPP4ctmfLsuBstJu+Ta1w4wvht6?=
 =?us-ascii?Q?UdN7OPCAqqhiIGJdboEpFpEwByVYs55kCY5VM3LVvAIvGBHpnz9yigxGv1qS?=
 =?us-ascii?Q?FvprvFFFxlsbQ6jw/+Yaa7Ht+sayL0PSbkkIzMxMTg6nKSNzrSlfat8ynM4V?=
 =?us-ascii?Q?LhReTzbWDKlUnrPr/8sirS+pZSwG5QX4UrJHYZdNtfI1kai9xplKmXkVr8Uz?=
 =?us-ascii?Q?rZwrXXH5CXEqL7RptnjfiM+JGSG3MhNTO/APeLgjcRd114mNyVfp2oOo/S0M?=
 =?us-ascii?Q?5AEeeai9A15itZCkbNIC6u1aLGtTUdoA+K8tsWRhF0+mYxWvWEgEx9Gg2ma9?=
 =?us-ascii?Q?oANfTyWDwvw7ri0vLSos28R0KxJFyF1K49of30Avtkpeach/0u0/7eGFizvZ?=
 =?us-ascii?Q?QhRniCu0jFmmRP7Uy2Xs88SEvu2eh8E52luQIH4c2lg3izxhgKOJBmKtffy6?=
 =?us-ascii?Q?TMpTZwKwMP5+yMnCw3G1vTx0UWUbq7fRJhd+k7Pcysexoai8oebVxMXsV6Ca?=
 =?us-ascii?Q?DDYee9LfkQ23dm9Bdgc332JnCrSEdj8m24CzeMcz+Tagn104msZ21SgM4iXZ?=
 =?us-ascii?Q?rQZBxSSEV+Whv0SAB+kvtWPOElpRl3LfmhWMe/AIrcoOuz6SCKMt1S6bQXWA?=
 =?us-ascii?Q?b+J4fZv24eS+CMGLcokaUrmv0fNP3yiK8mqJd0StZHuBTX5W6yrD1tAVmtQv?=
 =?us-ascii?Q?cE/DI/cW6/AcfpZnhGZZoHbtGEsBsUlhP3f7KqBzPVZ2A1XLCZo90nzvYGam?=
 =?us-ascii?Q?iNiZYMHCeMmoc5QWMR6xk+a6MlpL+ETBougHN03BgY7zrKFg/vAL++3RIxch?=
 =?us-ascii?Q?s5PVrMllqEHhBpOBq/68TAdMRiCsTWI0GCdNPSIjGSLCAUBILX7TCB6N0MG9?=
 =?us-ascii?Q?OGBaZ1JHi2W2xpPQNDetf3AJZVhGAiZYhVw/hitnbxU4gVgzFmdPWBQXl01w?=
 =?us-ascii?Q?KRH8wh1crh5j8R2Mj2O4VWEcuF9xHHxNQuNpLypS7qjuvwTbO153VCbiHmSo?=
 =?us-ascii?Q?hSOHHcceMJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5Fsn7d49MUsxiur0EpLyjVL1sN+MA8Owp73QYkYgcKodqBrvoSHGTs0WY791?=
 =?us-ascii?Q?sMZE57WbSgwIn9w5I1Va0ymUmP7/mdNIQq6Tss75zzqE8YpFJCujOwcGG1ba?=
 =?us-ascii?Q?6U//9ei2jvfOcVaijXFIqeYXC6iMKVvSXpxpRCFEAevXQsVNFS38gvMbiPhI?=
 =?us-ascii?Q?FNf/TbdZxjsfkB2OgmAPHFx+CfQ0ut+K11IPRAAzriI2/ptuI877yUZNVT1t?=
 =?us-ascii?Q?XNvOWrVPnGvbYFZa/0PVjuXKmP7a54Q5IBPQRhN0thxbgHNrfRgtn+NSgT/l?=
 =?us-ascii?Q?5wwHKMYsFYekMiF8dKywL5qOdsoLgcqPNso7Snx1c1Poi8QHm4LEsXk4kijo?=
 =?us-ascii?Q?u7gthCHdeTC9Z5qd0tQpNp/NqZnA67bPw5cseiffHiSE74hhdobUSLn4yCCt?=
 =?us-ascii?Q?lYBUnA2dkgR1RXsgaM4iepVIzWAJQFL5+Ack3TcvUYOzp5SvQG8plggrrzFE?=
 =?us-ascii?Q?wemnbU7m4LhbMopo4dXrYBN7dLwuDtGKBTEbpKsAFuB6BlLWcijlFctbkfeT?=
 =?us-ascii?Q?1gpMOW2WrYk+5MWPf5q4wQyZjrfS6iFjUDoktdhc8/gm7GjgzF5AlXdOMoCs?=
 =?us-ascii?Q?MpxmQc9RbLManpbyr8OfqBkrmz9sBcO/ncpVUzr1ECk9IbWqLGF3bj9StoQN?=
 =?us-ascii?Q?yQV0Ig3a9savPoSLd/DgnYSr4xiyyYzb0qv7LI3k1I61loKUDJpVUZ3ogbEK?=
 =?us-ascii?Q?y8FZRe1129mJS+V56BUYWDv8+grZtrjzarVRmUSMim5cZtlu66MemUPAMDlG?=
 =?us-ascii?Q?PNfgCazJtVKiQrH+ubbNxwMA+X5KKaJZlNlgakChM6R3rDuSqQzNM7ndgOIm?=
 =?us-ascii?Q?6w6EX+IwPI4cplIraEyB1TXH6rX1jrd0nhDl4zDfyqXRCHNCPxvfURP3Iskg?=
 =?us-ascii?Q?ltlTP1VG7LlPXYLVnqTFKN6bCAxQclXQnVUtkblVdyp3BVGtw1DyK3zBqbUy?=
 =?us-ascii?Q?nWauXnaZI99vmTCd1zEUcYhrc0Ti82qH1o921inRAeLvs30BGMOc/mE7Nis7?=
 =?us-ascii?Q?Gu/9IoiLj7yg1ojWO79LR3xbHFa/KBNFaBKe5LUPuPl49ZUZYymtgkj4IJPo?=
 =?us-ascii?Q?5ZRjomw/Gnl1WQzisyYwc7z8hgOMCzjVQ3EKNxJV/esx0x1XDcpQDavMGFYw?=
 =?us-ascii?Q?H0jy+g2sSWxBOtJ/UH4VOVpl4mr48r+aM70qxFVg0tMW0ANA5A5Bi3ZErxqR?=
 =?us-ascii?Q?B0vheHY0utfYvFanlIYExysLXrps9Pv7FdDLO+TyHlDR7eqRWO7eEV/NYv29?=
 =?us-ascii?Q?52Nt6MTrATad5OatdlqV5tQBwsx+PCilemRt2wuO698j3NGuEToxB2NE6v5l?=
 =?us-ascii?Q?kgZNz1euiujp38BkpU8dqlCaWBOYJYaXuc22MyS3yLMXD/mzdvxP3z6DBasG?=
 =?us-ascii?Q?QAPFdn3l2/aD/X+orLKT3bfZHxDO2YbZy3WgdciiLwR4e1S93PNCHgTQRCJU?=
 =?us-ascii?Q?iGCpWTonLG62SOpNMQc5fq3mr059yFuFBhg/rFSy5qHmomHzJiVHqqO4k8su?=
 =?us-ascii?Q?CwfIRXyGBPodNvbotZcLdZNmC+id4A5wFiPcVJmBIbxhEOo9IFqlQtV5qbaf?=
 =?us-ascii?Q?0VEAyS06yfbg6VIccJFWizZTnSaVHnkuyQyTHA9Z9cE/Xal+cSU5R4U2gA91?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f74645c8-2046-4a68-e3b3-08ddd456889b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:30:28.4156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIB+WoG3X91oCYlIfx8T9EW1+ZhPlwZmUsssqXVKD2I58h3WRVpLLmJuAtWcxf2KjvXC3guLiWX+DEvBrYt47SMzxQoM1GiUMUXuPI7f4kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
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

On Thu, Jul 31, 2025 at 09:33:37PM +0200, Michal Wajdeczko wrote:
>Since device configuration using configfs could be prepared long
>time prior the driver load, add a debug log whether the current
>device driver probe is using custom or default settings.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>---
>v2: make function void, rename helpers (Lucas) and rebased
>---
> drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |  2 ++
> drivers/gpu/drm/xe/xe_pci.c      |  3 +++
> 3 files changed, 30 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 150e7f2becc8..5f145ccdf535 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -107,6 +107,11 @@ static void set_device_defaults(struct xe_config_device *config)
> 	*config = device_defaults;
> }
>
>+static bool config_device_is_default(const struct xe_config_device *config)

this isn't exactly safe and as such shouldn't be a helper that can be
misused.

$ pahole -C xe_config_device /p2/build-drm-xe-next/drivers/gpu/drm/xe/xe.o
struct xe_config_device {
         bool                       survivability_mode;   /*     0     1 */

         /* XXX 7 bytes hole, try to pack */

         u64                        engines_allowed;      /*     8     8 */

         /* size: 16, cachelines: 1, members: 2 */
         /* sum members: 9, holes: 1, sum holes: 7 */
         /* last cacheline: 16 bytes */
};

>+{
>+	return !memcmp(config, &device_defaults, sizeof(*config));
>+}
>+
> struct engine_info {
> 	const char *cls;
> 	u64 mask;
>@@ -339,6 +344,26 @@ static struct xe_config_group_device *find_xe_config_group_device(struct pci_dev
> 	return to_xe_config_group_device(item);
> }
>
>+/**
>+ * xe_configfs_check_device() - Test if device was configured by configfs
>+ * @pdev: the &pci_dev device to test
>+ *
>+ * Try to find the configfs group that belongs to the specified pci device
>+ * and print a diagnostic message if found.
>+ */
>+void xe_configfs_check_device(struct pci_dev *pdev)
>+{
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>+
>+	if (!dev)
>+		return;
>+
>+	pci_dbg(pdev, "found %s settings in configfs\n",
>+		config_device_is_default(&dev->config) ? "default" : "custom");

I guess comparing dev->config and device_defaults is safe because both
will zero-initialize the hole (or padding if we had one): the former is
allocated via kzalloc() and the latter has static storage.

I'd just remove the helper and do the memcmp explicitly in this
function.

Lucas De Marchi

>+
>+	config_group_put(&dev->group);
>+}
>+
> /**
>  * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index fb8764008089..fa4ea7f0c375 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -13,12 +13,14 @@ struct pci_dev;
> #if IS_ENABLED(CONFIG_CONFIGFS_FS)
> int xe_configfs_init(void);
> void xe_configfs_exit(void);
>+void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> #else
> static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
>+static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 52d46c66ae1e..9ce6e6dca5bc 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -17,6 +17,7 @@
>
> #include "display/xe_display.h"
> #include "regs/xe_gt_regs.h"
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_drv.h"
> #include "xe_gt.h"
>@@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	struct xe_device *xe;
> 	int err;
>
>+	xe_configfs_check_device(pdev);
>+
> 	if (desc->require_force_probe && !id_forced(pdev->device)) {
> 		dev_info(&pdev->dev,
> 			 "Your graphics device %04x is not officially supported\n"
>-- 
>2.47.1
>
