Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51C8E7718B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 16:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729BD10E4A9;
	Thu, 19 Dec 2024 16:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mK3vXf1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61010E4A9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734627422; x=1766163422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g7xGFXWEvum70L8/J4/FJBh3D6DjfzZQ/icouhslQdk=;
 b=mK3vXf1LAiluXY1BjSXNZIpl9mm75WBxTwKF3sVI4GtDNF755A+inbeO
 0Zdf47tkdIQsV18JhBhzcyCoAqlXpAQq2OZhevxQGgTWQRt0/4l1IwXff
 fPoc687PzrpONgeOSrOF7grge6jcKMBYMn5sfwBaYm2206v2ni8HUCSzf
 hmnJqlOh9llGJSwxggNQ1rFrPy3dtRQbA5l9LjIACu+vJqbIG1tBdfvrY
 Xa+TNS08O1xvNApyA+qHIuoAtsYDg4FD++jP5Ptzm31kjQF4KIGVOFcMI
 +JJJA3EFXlYPP4MVvA32yv9bUah7DxtmfssVAik0q4rgDqF9VjGF/+YUl A==;
X-CSE-ConnectionGUID: Cp92ne58RAmjL8m3y2USLw==
X-CSE-MsgGUID: pXnR7jJ/TCyojSrAvEXawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35315694"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; d="scan'208";a="35315694"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 08:56:54 -0800
X-CSE-ConnectionGUID: 5rtxbg9PQh6KrG03J1FXhw==
X-CSE-MsgGUID: 4z6UBG0/Q8qrYRB42jhX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135576605"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 08:56:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 08:56:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 08:56:53 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 08:56:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiIShZGL8Ihmi547wICRhQbtPDLNfsJdot9kB+O84S5s4GyzYujAuurr92S9wOIHK2L7c1j+vp9c8iw76DTumwiBu5QnsZLV+G8YZQ9r5dXJlJ1C7h2o4vnDkFxcTC4Gws/TV+TwNo5tCtaX4VsQVLyxxoHl6y6cppsOXZoilRBCUGlMRGTXOYgPACksS5EpqHXtvtcVtU64SgUct5qRCIziY4KoddeO6IjEbpcLNk+XB6CKaXiQ/d3VctdGeb5/FGVC57gjkD7qR1kimJ6bhtzl+jzdYfzyZ2YWD4rIRvw/0oZD8PVzlKgW4dl97u/pXy3Rn2dvR03d4fLyPiVflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veiukzFPjWD50csHou0ShVqC0F6HquAKt+mJe+3YwmI=;
 b=bDQakH8X6NlHufxGKmpim9FNBbZVd1pPOz/iRdHx2G2RS09Qv1m7gGzCHAkGZN6ECLjSkiuWiTCju7hz0ECazVQCWGZ0kpTSBOrqg6l4ZiX1OBfQkLEdeW+pN2i8tfzdU6MfkEXJ8MRoLGpFneKbfZXStP/zhY/vtRJAwn88dex+nEwEvF80fS+LhaBxNcEfL07nDBTFzrX+aSciJ+nl0p480oxOV/eit/kYfWejnG3nhLvDpkstAxSUbwQUmquEYTOGSi/3SiGvuC4kTWco4VoGfpg7Pr3dC6t4X2BG1ZaFEdZAV6tdpyx8nTYR8/Odb8UKAuYZ4fCFfrjEDlpmeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 16:56:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 16:56:44 +0000
Date: Thu, 19 Dec 2024 08:57:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
Message-ID: <Z2RQeMoXByoOU/+w@lstrano-desk.jf.intel.com>
References: <20241219064932.25145-1-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB54444C11555ABE33E9EC8D48E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54444C11555ABE33E9EC8D48E5062@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da900a9-2712-47c0-ec90-08dd204e1e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ar94aVj1WAh1SdJex4C/au4yzjjuBsM7sProyTKDDmIU/LNadFlJIq/j683?=
 =?us-ascii?Q?hErY4PoSHBBj2PQHzOoybihAPMaefUud6rMlVesdkzkozPrVZBUa6Ln8Yq+B?=
 =?us-ascii?Q?zuGuGGp4As7G3YIMO+0yycAEQxjuHG6CwhqE4eJb/sfOl4SzIqIOFGsBAcKa?=
 =?us-ascii?Q?YnYBzYd+f1qTzmiS/iUo17RmkNhZgrULJCCpflPgUkDGBm8mTKcaz3auYWAV?=
 =?us-ascii?Q?t+WYiohVOX85g08G8msVZLE+OGbHBuod5nNnkLfI2NNHou7EqVIUP5Vet8Ca?=
 =?us-ascii?Q?cGkiQdV6J3Q2VhfbUYQdS3YV/lzaxaQmUM4HTFZgSSAoEFaquTxGDVHheug3?=
 =?us-ascii?Q?tcKO36cX6QTWZaLPg2QuWoDcCs5hv2iTS9LMuRv5fWPp7jTfbWFBqq6JRUzS?=
 =?us-ascii?Q?Ge3Hnzs20qlHsWInG+5QhvAvdGgpoYCjg1AWnyGmsJFyFqR6/nZklwSkxOyx?=
 =?us-ascii?Q?SYxY6TluKTbsM08pD1N2o3RN46KrmrFkP7v+/KU12SOLo7CG9qOg/KktG0ew?=
 =?us-ascii?Q?/zTaHARCgEKToC1htiB7xE79IbxmU/ErAFcXMWohm+WCtmT091qO99Po216T?=
 =?us-ascii?Q?PpzkfKI0ahQkVKF+1kPXIMHlwl/3D/+jtQ0qvQYTSn4yhXyQjkAm6SroLJtG?=
 =?us-ascii?Q?HvcrXZTKiD7Y1m0Xrq6S5yRmO8LuktK8rbPko3JZUZauijGoC2FwaUtVAZXI?=
 =?us-ascii?Q?1Ehu5oe28Jn5t+IMqpAFGCGQLpn0w4K29DzEQ9NI+NjkPTPybmiuLq5m4sYp?=
 =?us-ascii?Q?7lD8ixrbdDYWjxr7uYTGa2mu23uv8zY8aHI+ht85N2O9F6fFBrWxNTmmT0FQ?=
 =?us-ascii?Q?MOxcTOq8C6vG+GOUDTSR7CUq+bgdRuFunhAGtxjKVdz5gh3g9YMqlC5p4bpx?=
 =?us-ascii?Q?aO2QV1mFqP2eRB5ucZaFlNrMHdQ1hFFYUBI3E2ZQ4L1X4PHL0iRjl2a+SKI7?=
 =?us-ascii?Q?rcAtC9BRwy8EWqyb9zSZSCpunlZ3A+KT37xw+B3QUTAvmqkm4EJWoyFkxECo?=
 =?us-ascii?Q?OshSZtFWZ7UhaE9U8mWHQkcIGE7jq3YmI+QCNHVM5B5SYamcHMz1Ca+NMtQy?=
 =?us-ascii?Q?QA8WKyjcOfZpKIIyjIG1osxzB0AnseLauWbSzqDMNvL9WPkrnX1fyNklL0Zs?=
 =?us-ascii?Q?akxja/Rv1xNvjBvkszRG8m0kDdO+h+MAkkAJgHDw4vxZvfZTTuHm9Gu5MB2k?=
 =?us-ascii?Q?hHw/A6l220aBBUdf6v/qYsdmEH3AKoPm5MH0GC2f6OQye97F3W6PWFTfld66?=
 =?us-ascii?Q?rufjy0HPcs9qCxK99WanjYqRfqnW+3yU9JCVhpw8g6rNqQj7vN2oz0UxyFhJ?=
 =?us-ascii?Q?YG1W8TphOTSZH0Ur661VRKzi/vj9W14/e40zRAEZgl91AA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kv49FQvWDVQX1Vjb27NGYxvC+cQbYvyPmatuhJRTer+0sTcY9IW1crV4fmhp?=
 =?us-ascii?Q?Gsrf1nYWne6wGM2DvLYrWzwtU8pM2rBH45t8HT0wnsm6XHbKmlwR72nUfjDF?=
 =?us-ascii?Q?mIcpC1QQQpjyoAAXZD7mVelBAc8OrFtvnUAfrf5b1bF996RnJizYbUZzLTSm?=
 =?us-ascii?Q?P/xu3GXeYPd/3huGhUXR2zyjx8Ua83qHNs2WJjxdl1ommOayECqf/gqSEhm4?=
 =?us-ascii?Q?Y81b8KxlIQLyfIWkRmRgWH05ieNvjRNWQvUowYMZhqGPUgvaHFMQKRabxCQn?=
 =?us-ascii?Q?v0H+CPd+ATlSkHjHQLhX0syd87qFpnm6/BvVoo2zVV7a2NQeK6KRa/CzUzkR?=
 =?us-ascii?Q?DrW7nQzXiKrBVvkFdNPSHtgoGl951LcSGmhXkTj7dL2dMfSNArmoeK6IrikD?=
 =?us-ascii?Q?4oyCMWe14jAiSt/Bg+JdZmQhDb4D7rVYpKt6ur0RbNm+VPGESQ3zJpzdZPYv?=
 =?us-ascii?Q?kh4YZ4NZuni9QcheGsKbU0MmplzSqsbRaAW17vSXAebBSCD+g05EP7PkXoyD?=
 =?us-ascii?Q?+SYImW44A7V9E14A5RfwM6VaHDD+Kd4TIN7pjH0EVhKA+qwVILubYu7vGw9V?=
 =?us-ascii?Q?EVQd5eKJpHTtlS2Z48hR7nh55mQg5vtxMTZ659Miz0jRm3l67Cby3Ihvu+NG?=
 =?us-ascii?Q?J0NdP4R2/pgLtMsnS5ex4lGe04dMyS8b9/xm0bn2dONYJbGDYff8tIYGw7lh?=
 =?us-ascii?Q?eWSyqrlFYqymhNsM/2qF+GUpkl5OxzH4q6+MkJywFJKuW5t0NuGhKNnvntZE?=
 =?us-ascii?Q?ZHrTuhvPtJDlwUUfZvnAD4Ruv2jt9z63omzVidSFepTC+8vQ5R+8EEmqmtgK?=
 =?us-ascii?Q?iuH1D++eL03hHujc9Ifecol+O+sI0AF6WLay4bQggpY5dwJl0zQIJc/9vvBp?=
 =?us-ascii?Q?XT3Bi+w0PJH9ZgOQkJ5732DzgVzkcVho/nAAH+MshvpRTmU/3iCF+LgZ9zha?=
 =?us-ascii?Q?hrgD/c88npSK/+q2Nn+QZdjBF65u58G5qbCfmj2y0hOz47p40FZMKYQkQrr0?=
 =?us-ascii?Q?SXuFMQh3/GnngGvElfo7j+mF51YRW4FplWIMxcC8fwEEOHPCz2BxHUtJHjHh?=
 =?us-ascii?Q?sxSlF0CP0QRPysNw50+QJDyMx1PArH8PLIMQWDY1hvH159MQecxsoq+VYl6P?=
 =?us-ascii?Q?kbXQ171AX0ZI+X2HG+XcWMkw+LYXYuLuirZ0LwXelrA4J/KPqYZ3YWTHdbTH?=
 =?us-ascii?Q?z4/TFn83KOQqhwNjaBT8ByTlZTJ7MhpxJKrKzCAqWXYF9/P0mlixHyWKfRSG?=
 =?us-ascii?Q?qRPsMPM0cIqOL4EkIPN5x1CRZ+CVpjglZPwDyncxpJ/7huhpZ87a4OINPPE3?=
 =?us-ascii?Q?baHN61JtzuGEvbS4BPPjr5+eAF83JpWn+nmJq6ea3/25yjjhb/eeyPVAidC/?=
 =?us-ascii?Q?9W4XsJUYybSLryzVITTxohlYgT9/mpVrTGKD1AX4kclYi4AD1cm4Bu7D+qGr?=
 =?us-ascii?Q?DP722PMffW2B2wfXIz+Piy6gNlcCTf3p34aveICf345rpatEowwpGeMMM7C/?=
 =?us-ascii?Q?+xzqN0CeDP+1TXoVD2qhN7sFiJZhfeaMt9rCWTwmEkoQK+QnXwooYeGU+RzL?=
 =?us-ascii?Q?mkiYvQsFEqwwKh/l5dOGV8BPjMFEf5S4OPogkhLHhO/qPqO/wDVHgpID76yK?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da900a9-2712-47c0-ec90-08dd204e1e58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 16:56:44.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZUrY8ayRMZyMy+l0EXLpCcijqSs3UntfLcWjGUoKNW+rWD5mugFRhdM8IpTH0gfEJ3K3ubyNFPpy/zKBdrLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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

On Thu, Dec 19, 2024 at 09:01:57AM -0700, Cavitt, Jonathan wrote:
> It might be a bit difficult to get approval for this series if there isn't an associated IGT
> test ready to exercise the added error injection.  Namely, I think the functions
> xe_guc_mmio_send_recv and xe_guc_ct_send_recv need to be added to the array
> probe_fail_functions in xe_fault_injection.c in IGT before this can land.
> 
> Once the tests for IGT are submitted for review, you'll want to use Test-with to
> exercise the new IGT functionality: https://intel-gfx-ci.01.org/test-with.html
> 
> This isn't a NACK, by the way.  I just figured I should give a heads up.
> -Jonathan Cavitt
> 

Agree with Jonathan, we should have an IGT which uses these injection points.

Matt

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Satyanarayana K V P
> Sent: Wednesday, December 18, 2024 10:50 PM
> To: intel-xe@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH 0/2] Introduce fault injection for guc CTB & mmio send/recv.
> > 
> > Introduce fault injection for guc CTB & mmio send/recv
> > 
> > Enable below Kconfig options.
> > CONFIG_KUNIT=m
> > CONFIG_KUNIT_DEBUGFS=y
> > CONFIG_FAIL_FUNCTION=y
> > CONFIG_FAULT_INJECTION=y
> > CONFIG_FAULT_INJECTION_DEBUG_FS=y
> > CONFIG_FUNCTION_ERROR_INJECTION=y
> > 
> > Fault can be injected with below steps.
> > FAILTYPE=fail_function
> > FAILFUNC=xe_guc_ct_send_recv
> > 
> > echo > /sys/kernel/debug/$FAILTYPE/inject
> > echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> > printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> > 
> > echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> > echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> > echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> > echo -1 > /sys/kernel/debug/$FAILTYPE/times
> > echo 0 > /sys/kernel/debug/$FAILTYPE/space
> > echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > 
> > 
> > Satyanarayana K V P (2):
> >   drm/xe: Introduce fault injection for guc mmio send/recv.
> >   drm/xe: Introduce fault injection for guc CTB send/recv
> > 
> >  drivers/gpu/drm/xe/xe_guc.c    | 1 +
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > -- 
> > 2.35.3
> > 
> > 
