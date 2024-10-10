Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855DECF11F5
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 13:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DF210E0BB;
	Thu, 10 Oct 2024 13:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URUPVxIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519FE10E0BB
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728566711; x=1760102711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GFE7q7v4aIzBdza5KeHl6mvF6MdutV6CL+xa61/aMd0=;
 b=URUPVxIxTZRhWagESS/1aCZgxoGWgEHJzI4lZ32Vzu0HqXQo3j9X3OZB
 ddrdBY8e3YHaBg++jVtTJ+xtb1FPS/kwalRrtsfm+fNsxSceRkOjxFBF7
 6DWIXZw2rc+bHd0peNxMYnu7OT+oB6NfP0H9z6zSzKoG/lVELcfGECqAN
 YKQLxbpPN5z600INHKP2UhfP93wbh9m5qgHp6vJjLr6HbkPuLQMKr7zaz
 I8voBjII0OYhS4CjZbLlrV9Khc48tPsSYdWlrwvO+sFptimwcsJ2mKlHB
 nS45a7PL6FopawGrR1X3yLwwIWJ2ssrKGXAyd2IjH69k4jWCxVeLOXo33 A==;
X-CSE-ConnectionGUID: 5QXJhTz4QjCewhleBhflRg==
X-CSE-MsgGUID: c1SYw+lJTfiU3opmn5sHcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27866928"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="27866928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 06:25:04 -0700
X-CSE-ConnectionGUID: tBletyCQS7OB54n6H3IRQw==
X-CSE-MsgGUID: i3fOHp3iT7K3VPiuRKtBlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="76499212"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 06:25:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:25:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 06:25:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 06:25:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 06:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SryG+PH50ES7T/lf+SIvnEhWjbjmRASLVn/tnqzVjTAFc0klKrse9gyHyAe8efx72J3I5mGqWoB/igvek7NaFplsBHkhNZv737w67Be/ETB8XB6v3cWLbmC1TcpV4wOhmydxWatrVqMh9yZ7/2qfC0vYCAd+nYAaxNlAOM+RwIMINx77lFg+4v7ZKEmmG9VdT2J1+MIJ9wsT0LJgL+Jf394d3qKObA4HVo1DXds7daziUgWSR3ktvQVYR1iuG3XTc+3Xp8a9VMEBt7Gw01MmRGMSm4zhcBLZMaJ47BUIPubJrO71ZwJoEIJYHpucYhRrLyZ5TpfRUjeepIn+Mfr1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z21zyYzl8KRPqY4EsJKM1IatF0LsDnXl5LXhqgepwcA=;
 b=tWUpIQGtPyKfGr8zj6KodTtbpgT6HA0C7K1ACw1KRH8fZOOtfeRKgWYA6YhdeYUpYj4Wmw3/HMIJiccc6bTXZkYupDbtmrGO31q7kweBIPIYFAoFFnZv2trrFclEL+6W/9cjHCDHkCuVrQwj3Tapgl8yQN1DivVGZTxuo0u8KkiW32PEIGBK20DdMVvMSxa5OmBohhVhWIYug5gmMMQIOcYJ2sFAhN40d8lzE26IeuHoTUqkFJNJNMYkTJrmKReAUTA0Yoxc9kHJC6yOPgpRywq3JDqQd+zZU57FAh3ZloZSJ46QLvSbfUiQdyNbbFzfotIIJT6osLZQvhwdEdJOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 13:24:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 13:24:54 +0000
Date: Thu, 10 Oct 2024 08:24:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
Message-ID: <zaxzdcbqiv5exdurw2spwllsps7b3rs643ponf5prqux4xdbb3@xf3quz2pb3sv>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <20241010034847.389734-2-lucas.demarchi@intel.com>
 <88778cd7-c165-41bd-b892-e9f8e3dde8b5@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <88778cd7-c165-41bd-b892-e9f8e3dde8b5@intel.com>
X-ClientProxiedBy: MW4PR03CA0173.namprd03.prod.outlook.com
 (2603:10b6:303:8d::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: fa910ca3-52ce-4bed-6432-08dce92eed60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Le7oiAhk31iiYC5pu7IXZLZ2JIdwFkgy4ApmrT8L6p6MJ6c94QwnhvxmskKx?=
 =?us-ascii?Q?J61hKT0SXdWsaiYIC0H2QAInAmY+2be8Pt34B2o165M29o/SuOszllAu3SKM?=
 =?us-ascii?Q?lxLiuDqoWTTlIxA6O/aMv11vFRXapP+aMr7eRSp/po3zTDxcM71VHQQvQxVd?=
 =?us-ascii?Q?tYKko4NuSQ79MLxCGLcSuMkfPY1ayx4hkg80GS8VQqZsqjfR7yowiVparFx4?=
 =?us-ascii?Q?uPJIubByrClSi91NVtDXNVQuXPJk55ierJwc1b7cJmUljKjlIEw/mEDnAu3L?=
 =?us-ascii?Q?WjjpBWkOAE1wryYPbXQRmPfpOiFPg5aZszdVRtCRGKwBL+2Vmb3WvFuf28UC?=
 =?us-ascii?Q?yRjehqlPJbeIl9/JkGwOBAsv2QbFyseCDg62vQGud0kZ//PonS1JeDv8g/nm?=
 =?us-ascii?Q?ibAajJgQQfJ6OlnvqIpkQ9Rukp6ZUHXXEkzunbogUpMCz+v7aiV6xgodYP9+?=
 =?us-ascii?Q?TTZ/51Z2VEoPzKlzW/dzUtt9EgKk8P4bo15o9TDdQUNkR6LG4GiRwce7U9UK?=
 =?us-ascii?Q?7YabSyfoQP/Xmhb7RZwrF7pY4CagYJPsg7ncb6sBySy9nMKKXu87hTNXdNkV?=
 =?us-ascii?Q?05MTH0bSOF/iSUbFQ9tOST1ZTwEDMGhY3oS5KmHCKvW/i5YKu/UzND22fCWr?=
 =?us-ascii?Q?V6n25cTQBRcMkNOnapOfIZBpwH7958T7O0QSaHAbqAMK0aQY2hgdSH2Ij82R?=
 =?us-ascii?Q?R5oFkcgwEJAPwzwGwkDHTNd8bj8TQgFu8H+t8vGajedPYALTrPwku/8M9PBN?=
 =?us-ascii?Q?B0pVOi1OYjUtq3tJn+I7BDNuEcRKP1jjHF1qngFXkGuWwQH+icveN4dd5zMF?=
 =?us-ascii?Q?TgF3dsunvcdvewwBtkIlLXLQTJmMZySetZKwWyvrgQGjYDCmTidj0AbS5qUB?=
 =?us-ascii?Q?/ou0aXyzduGT/JxetwnDmm3oqkgvAIV5DXdUI8RnrQYyr8NbJZpHufwBjNVn?=
 =?us-ascii?Q?+VvaHcL3TO8HxiAFamdc1p72DAern0BHZR7EiOGngDZvO83PfSSIZ2ebTXuG?=
 =?us-ascii?Q?7MqbM899xX8EQJ5mDtwjDjiCPz4hzhBT8K3CvZRZb2kVBxlA/a4CrIq6wogK?=
 =?us-ascii?Q?AhsoS8DKYutyvwTKQ/Zne7nNL5mxaOV1RfXQn4ra2qJFwyWBnVSxPl2DIfRJ?=
 =?us-ascii?Q?TpIkiuoWUzQ23Pi+ApJKdJ2w/UkZBbb9l9FemUVZ5EI/AEdgS0Tqnhv2lkzQ?=
 =?us-ascii?Q?phiT6PhsNfk1p0cwIWQsYFC2HsstklkFhkbn3pxUeWoN7Lz9q3gJP9XMz6Dy?=
 =?us-ascii?Q?z8AUlZ5OEuS91LW/rU3lGk7rVa17SIPRVF00rSepEg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3tVBVEmFrzwnSSnmqqaMXzm3hJhiUlbCzhCt5ziuV/FBToiUIW7LysBd7Man?=
 =?us-ascii?Q?Z9tWxB5Ng3GhPJoUWIH9PibdNZhPRni4tgDfP692mo2H06XPZm0BVuOHc/Dv?=
 =?us-ascii?Q?wwXBZMvUkIuawyV25m1BmXheP89aeErkXmS7hd6HDgOTSqJL1Ad5R6Mrr+jj?=
 =?us-ascii?Q?wyq6UUGJRKsUlHu0DEYJ0zhMurR5FOpRLQ9fmhsp76CHdpHHJAdDbMxdgygt?=
 =?us-ascii?Q?nAdhbUuVYH8G8eUDLjci5gwRB1AwjhUQxyD9/nov7c7xgwQa2MSQISh8CCnN?=
 =?us-ascii?Q?I82HmkFqlUhyUIKwULoMH133uoYTEIcNeBZ9EQ4BDDPVDuDVmT3kBCAU1TDE?=
 =?us-ascii?Q?PPhLE7RfM5hEjm4QZPJExEGlUsNtxtdDp3yb/Ih/9l8rbWWObsdJ779ItPHb?=
 =?us-ascii?Q?J4y0FFBsgn73r87HKzPRXylEgWPBgCQddfhy7y9t6DWeXSrvIZidSQDrMNnu?=
 =?us-ascii?Q?gIJqzuRvXZaowjskO5vNYKwJqfDWuNheDwOWdBhm9S4dmjsU9V9zUYARGiDZ?=
 =?us-ascii?Q?MjfJflcwb73gp2DwR4OJKYwm+FAQZ0+xomZEZgNP4hMauUoT0EwZKXb1hRp0?=
 =?us-ascii?Q?XRbGnjevtSI+E6LBAHhzAZwqiNvI92gZ2KXpJ1Gz2go6SxX8Ypi9OJiVVXRH?=
 =?us-ascii?Q?Xyc2iqt+aTQZSI7iy/NK9PhQR/PW1NkgWZXCkzdag7w3DmfV4DD9PGPKrlz7?=
 =?us-ascii?Q?SYFwA7qq+I5mdumKcyn9n7E0yDVJK8YX8qFDRY4UeCrDK+EBTvkikFrMItsZ?=
 =?us-ascii?Q?/zvf9PlwVq/kxb72ckVY6bOjMFpEE353gkKcrwM2omsIy+qWBRu+pbnLf2i3?=
 =?us-ascii?Q?PAS/UPRML7RXL8bNcio/fIBq8ZPCJlCYXOjw/KVFHIrkB0iD87U12uasjBnE?=
 =?us-ascii?Q?CBhXczGmDRROSEq9gevlT8nNi4oQuMJAlVew5b8sHJ773O7IIjdiKfpX6Fee?=
 =?us-ascii?Q?QTMzFxt+cczbP43aAyzrc/XW4j/IzqCt1t5oHX9OeDuDqVZUqN5/CGB3R7OQ?=
 =?us-ascii?Q?uk+WT6GDCm/e9rW3Uj2jRvRs0hj7KNW3yUgzkZA+y9HXZY9otRj28iB7IfQF?=
 =?us-ascii?Q?MwRX96ZHMWLmQRw0NYEkQxlES7bQsnsvGPaxiMEsejlXlbwDPdYdhjRvvdfy?=
 =?us-ascii?Q?T6bY5vuFTzihTWGjPyfy9MsRmxi3YTqURG+OErBDs3j0Zh1zJh9mj7cuYiuw?=
 =?us-ascii?Q?eLihuDKSgPBUJN/RbRO6GUJ7uQvvMw5tXKblBOnezr0wxTVyYHEKLtwudUQO?=
 =?us-ascii?Q?pC/qSOp4SOESI62j/Y5GjmzsJR9dbg8wd7hp11UdApP8EPCmTFsTEKyRI3n4?=
 =?us-ascii?Q?JEppPLWJ722rOfh1R6ac+ZaCEeVHPZFCMkhNfrjMCAQg+j8yQNYhIjEOeiH2?=
 =?us-ascii?Q?WeksPTY/RAcM9iB5Z0Tw8gS71RDnkxYlF88adEFsmIHMM8XdqVFAm0GOHdaj?=
 =?us-ascii?Q?SNHR6gfOwZ2fK8ZG+4PAcqrAcB74tL1GtZcVA00qQGVo7E6QPTww/CzUvYyu?=
 =?us-ascii?Q?UgwvbM/iOTgDJZU4DnfLXSJ4YJrx9qHoT+48KY9UGfLcb3dEgczM0//BHO6e?=
 =?us-ascii?Q?SlkegpMx/+JtW/J85fe96wyrtzuBpX86CviclcGFRUe9MjFg1VX3EBT3b+vP?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa910ca3-52ce-4bed-6432-08dce92eed60
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 13:24:54.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AHybaiOn4KNWCgOEtdF6OxQ/xnAks0PCHuW/p+KMia45y8OKcBpWvC1F4dnEcp1m8DZtjOjKfkI7orjVL+VAd56l2OvShagVE3WKxa4N+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
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

On Thu, Oct 10, 2024 at 03:33:30PM +0530, Pottumuttu, Sai Teja wrote:
>
>On 10-10-2024 09:18, Lucas De Marchi wrote:
>>__read_timestamps() is actually reading the timestamp from a certain
>>hwe. Use it as parameter, move register declarations to be inside that
>>function and rename it.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
>>  1 file changed, 7 insertions(+), 15 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>index a1f4cc25bea68..d86959076b078 100644
>>--- a/drivers/gpu/drm/xe/xe_query.c
>>+++ b/drivers/gpu/drm/xe/xe_query.c
>>@@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>>  }
>>  static void
>>-__read_timestamps(struct xe_gt *gt,
>>-		  struct xe_reg lower_reg,
>>-		  struct xe_reg upper_reg,
>>-		  u64 *engine_ts,
>>-		  u64 *cpu_ts,
>>-		  u64 *cpu_delta,
>>-		  __ktime_func_t cpu_clock)
>>+hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
>
>Nit: Probably the function name should be hwe_read_timestamps (s at 
>last), just like the previous name and also as its reads multiple 
>timestamps I believe.

I went back and forth on the name... this function is actually reading
the engine timestamp and the additional args for CPU timestamp/delta are
only reporting "how long did it take to read the engine timestamp"

so.... the change was intentional.

>
>With that LGTM,
>
>Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

thanks
Lucas De Marchi

>
>>+		   u64 *cpu_delta, __ktime_func_t cpu_clock)
>>  {
>>-	struct xe_mmio *mmio = &gt->mmio;
>>+	struct xe_mmio *mmio = &hwe->gt->mmio;
>>  	u32 upper, lower, old_upper, loop = 0;
>>+	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
>>+		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
>>  	upper = xe_mmio_read32(mmio, upper_reg);
>>  	do {
>>@@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
>>  	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>>  		return -EIO;
>>-	__read_timestamps(gt,
>>-			  RING_TIMESTAMP(hwe->mmio_base),
>>-			  RING_TIMESTAMP_UDW(hwe->mmio_base),
>>-			  &resp.engine_cycles,
>>-			  &resp.cpu_timestamp,
>>-			  &resp.cpu_delta,
>>-			  cpu_clock);
>>+	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>>+			   &resp.cpu_delta, cpu_clock);
>>  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
