Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32211CEACEF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 23:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65EE10EB4F;
	Fri, 14 Nov 2025 23:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHupljkE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1410EB4D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 23:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763164765; x=1794700765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rqEqCYnyqyyZZZyHjDFA6IJjnq86f2ei15zVAcQMWh4=;
 b=AHupljkEmD2pmtwc5l0sBcYRELB4LBMcY+RMCVrQAcfrmtpJWRZyQT9X
 Ci+t304exrzrMlR3zZjozX9JA8DtH87QAgT/g6WhhfZUknyGd7Qhdzf+3
 b+Y3ZfWfR9X4LsZ8iXjJ3epqdGMo/ea/3Sg5UL55oPRqxaUjxukGH4cL2
 7+91rNL0PBwbhyACcfKo3ye6qJutOs2zxLGBZnASohp5D71b7noA9dgxr
 kZfLo2LblK/iKTepkXpIiOz1LVMbhFYEMxgSbcjjEa9JyMr9GyURTn9hB
 X/7eRNiNEATCNyWNWwBHTzFZ11gvEvxcWTMgy3B/uxfKwPSClvMkDPkMz w==;
X-CSE-ConnectionGUID: KQCMUyKiRJm6Pqc26pmTSg==
X-CSE-MsgGUID: mbckmvyCRmOuEWad06nlKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76365615"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="76365615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 15:59:25 -0800
X-CSE-ConnectionGUID: 8XduRf0uRqSn1iPlqzBl8w==
X-CSE-MsgGUID: i7fFHog4SbGH0RUn9up1kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="213309466"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 15:59:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 15:59:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 15:59:24 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 15:59:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnHTxr60bBgMEFyN69B/BkksVF674GUBTXaQRrO2WLrS2pHlvPvz+zF3lh1yn7wJiCYU5UXETcncBcF10LQPgt8N6x/NJFnXSq3OKvTeuGljlj2tnOlA/gnAc0EFStTVFDy2dU6Y+bOIiRU20VBZd7IVAXbJJMP6PvwqP7iG/9TKyxEsur/vOvOcWU6vVOoZJErb2jo7nKLr1t3Ei+nO7yYvJukzSQiWwXpGBGYFiZTJ+KpqTliuoAkYeCyWTL7SrAY1ECTSf6r88Mi4W4wT1tEg/UkPUJ3iKLBS3r67HSKBqqAWzX/XPt7wod0pypfhfqoQEAz7tuZUhlg7npl/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/G4aLYSgCZKyn4tdAImznW/PMMd2p9k1Bvyjs+HYEc=;
 b=oG2J3Q1GM6KVOOyaTfXg8vswhS58cs3pm33EFvOyLBUU/D6C4kaBKvDR0DJuEkZWwJtZE1VRgpxS8ZhhoJyg7aTti1/Yrc/EF/+Dmhndk6OteZ8D6tgjPNuXxBApRAY+Nmos6sD7D5kvFbfgP7UzjtBGmVjBpK3pUZcLVA9Ke5RpkHSnYgzK/B9Vfv/zxJc2WYoPa0pgR++hBPFDteoVSEKeFPTNpwO/eLAlFMB1z48t1YjexKBexFf+CE8ySU8c3nIb9VpGzRy/uvVV/1I0ZEh2CYaUEo0XR5NEF+A0i+cvQgtMrWC0sL2aNRcKW9HlxvxUqwC0lCncty8Z+aac8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 23:59:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 23:59:18 +0000
Date: Fri, 14 Nov 2025 15:59:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/irq: Handle msix vector0 interrupt (rev2)
Message-ID: <20251114235915.GW3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251107083141.2080189-1-venkata.ramana.nayana@intel.com>
 <176264408884.31057.14593020587082181156@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176264408884.31057.14593020587082181156@10055242dc62>
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bae8ad1-4dda-4931-7450-08de23d9d28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tksmlrx/vD2clrkqftRyIFwvPCnzYWp3SX4ArmD1UAlCw17WMmeYarfCfOba?=
 =?us-ascii?Q?pu6Hpaiw+o8oAo4k68SOHeiq/X2BVmBqTCptTedeeCYstWYazSMCwCaT+yNZ?=
 =?us-ascii?Q?cyVQg5w5M93aaqmH/5MFeSA0ux8ThSgrOUpMWBPCun5riUz8+sHTOGYyK1Wb?=
 =?us-ascii?Q?IKEUKTBFdmlYhJts2lRpO0TjoYKNTtKHgKmsoeRGuz39xLcevagTHAxNLJv8?=
 =?us-ascii?Q?yf58a8baG406qWf7AbZtRZ66cX28bMJcTd/kFOFAwfQkpIcfM3TjJJgavTde?=
 =?us-ascii?Q?3HesqqxySSAIO2l4RU4dkPJltWJIOuEm/14Qt7f8pDIUyP6t45ZnlRLgpiRT?=
 =?us-ascii?Q?/78vOir3JSZG/UWUHstrUAVXD+4C8NFwXIidFTXNqAmOuPlgT4ISYeI7Ngom?=
 =?us-ascii?Q?cIlAGgAaqJiIZkbwQEf6X5Hy82mGtv8hEvB0UhvLw3heuznguqTrW0XtjMNR?=
 =?us-ascii?Q?rDQE5xXdVliJgFKGC/J/Fqghw3q+tKZ/QCiKTuXCUn8Z3BxEWCVobrhVoJJZ?=
 =?us-ascii?Q?sew4AsX9W1hPkzBzVql5O4IsTv7wP4ETs22ofGZQf7vB4s2/3+ilZvmJoqxg?=
 =?us-ascii?Q?4ILSBJFeUP9gqzTsRfWe+D9Upw/SK4EEtcFjO75Li1lWQFY+ORvGM9MdSUON?=
 =?us-ascii?Q?/O8PnSzCP4EnJJ4DqtEvuoI1WLF+dvGSVK6vrKoQfK2pHzt95LAacMCAsZ9c?=
 =?us-ascii?Q?Gxi3ExNDwbtpmG8deiJEsBETNxhrqDJy/TZ063uv8LYxZC92XpiqM8SNYUa4?=
 =?us-ascii?Q?yYEPWRwV1rU6bKmvTm0f8toPxxxPliVhE46Y7sCu1185oqMo36YBtP8gxqxy?=
 =?us-ascii?Q?WIJ/9ccMvMjOOLLbZv8O2Rgf7XnQaT5v0aFIfcl+Zl2cmtHQagWXHUY3FMa4?=
 =?us-ascii?Q?AZvvgFUaZWWA0ETzaxgLUM4aaCq6nN/xWxdC6k/NwcfD/M6wxRTp95vS2BzX?=
 =?us-ascii?Q?iPQY0OW3WwrAxIPBawgFC3fhPP/yQGBmskVJ4Utc5VV08y5vKD+OFoj+opum?=
 =?us-ascii?Q?pkgFQQRENi4fU+NJCiYZkI/ZN57kWfif2fxvXnOfUnKNp2FGTIh0toq6LtWJ?=
 =?us-ascii?Q?lO5vxYdjc8y89l+CCSjKvwWp5sXiyo4asAuVGDyHNUJKCJGR08YHmRNGTZC2?=
 =?us-ascii?Q?p6QoyWPPUzFrA6kDIUsKZBeiJ3YbVjOukvaaMlUf490lENpRMSWP5gzoYTU8?=
 =?us-ascii?Q?gKOhxiZMhp/uLO8ptFThK8omrT0C/69jpzeXGEQQMlE/d8lYI7tZZ9tiDUqT?=
 =?us-ascii?Q?+8DbSrsMEN+ToVK8JET0BuPreLPOoySMuxeCTbZDEJoyeOqo5ftEkOWcJ2al?=
 =?us-ascii?Q?5kD9f8a5vsUYC29/eHkHiZUTC4TIhlyM7dPUF6i9ZqITxOsdJmr96XS4S5CC?=
 =?us-ascii?Q?jOMPtspQTKy1iQDOTxk+zg7NnLNkMLihWah0Wn4opNP1KJC+qA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16KPNoS3IFqjOOTbRAeAGes8D9edYItWP21wnAtRxy5/Mz8+VvZxvrh8QW4s?=
 =?us-ascii?Q?Ep4NU8fsvqU3O1IL2W30qlGT5dNvNl1lJJf2nH9eZDl1yREM9zfLu1FCcq+7?=
 =?us-ascii?Q?FDJp2LG7OdGIP6YEWAJkICIU8DEj5nY3VIP8SbHzBhoEglQoMV4+T7d/2hr3?=
 =?us-ascii?Q?PjcVSPC1MzcnG/onWUy0+Qj8OuhXB/4+dLQRM9sBmh0utkRb4tkOimK/Lb5z?=
 =?us-ascii?Q?IwCr4kxKA24ndcuq03GWc08v52CByVsSHSt5++r3NslAhGl9l9AlfTtwtYKp?=
 =?us-ascii?Q?O7kdHkuBGbEy7MPVyFk5mCd1rCcm27VxUI/3H1gFE0ya+DlcUGWGpq9bLcBp?=
 =?us-ascii?Q?SloiZrqEVHEmg0wLbVUVdIYMoJbj7q6FmS6/KYfQk+gvLemW93qpbK5mpPLJ?=
 =?us-ascii?Q?l5Lf7XJwxQUWK5HYUuePUlueNEnroc11f8yoMvGWVNyDWhf4oBD4FcFFW3/H?=
 =?us-ascii?Q?wOr0oAIMNYmXztMAhaT70mAEA3qpWfNybJ9iqMF1XUHGX5VXKFIgZ0n04m0K?=
 =?us-ascii?Q?SPgXB5i7LTC/s+YQp5BscD2+NusgNxrY9exHViyDC3gn/e173mPyuqfokpWf?=
 =?us-ascii?Q?q46ab17/LbnVeB014Pau8/JFvy2sy4cjaBOzHAWe0XYTMdDp8yJKzPfwcUNB?=
 =?us-ascii?Q?rckuXSR981vXdXnglBlBLHldbyuSeGc7Ptj/c0n6m+yopER1AuSKRIPJVy4m?=
 =?us-ascii?Q?Agscb5TVVmIhrW2zd9QlMXJ7y7j3XOBLMW2ZIsJ1AB/kGGOgwRoms+qqQhEf?=
 =?us-ascii?Q?mZFuMZxGyPiTZ03XloIKtR5ZxBb4ULwqE6NBMUr3ZrHjTty+/y0pRL0T6Ncx?=
 =?us-ascii?Q?2DI5lK1EMF5elKPOrAsUE3kYRx40yrhZNDNt/eflY20Ydi0qBMTSws2Z6ofr?=
 =?us-ascii?Q?KbepCoOL2ABhfd/Y9C49Hs94MY563esB6medvRIZAt8J0masiR/+J83va091?=
 =?us-ascii?Q?XyY2WlaqCXVXWC+KL8nuA2XWEeWZ3GEAHbrfPpQFcKUicLKSPwnkHxmpG5X7?=
 =?us-ascii?Q?ivaYe/omjlaB2bIeQ3WS9dzFSqCHsAtT/aqd6Rr9upkJffa4txw9cLGCzktO?=
 =?us-ascii?Q?0vSJMJzd1aCqBNstkl9tgQczGtPpDMbqEVfqBfytU7TMEkjMEt3HC5v7jNk9?=
 =?us-ascii?Q?pXui2SvNtbGTr7ndARTnwWKemZpB7C/f4ez1g3xCr0kvbuE3a9BHtPBQKJET?=
 =?us-ascii?Q?YHRaSXzDrH1BHsGIBJlIq1L1oC2wJcZGCR1zaNYrLe/uQcFxlJjfLpmyZbMD?=
 =?us-ascii?Q?Vv5ao51rFfs9UWA3hUgDu3YpKS/AM/NEXH8zhK0itBuj5StNXw+qTH7BcdVj?=
 =?us-ascii?Q?3wAcyTVqtFitHMOmclD3wPfkWTLPkDHgiWNb4jSs3waTK39oQ6LBc4UuyPvt?=
 =?us-ascii?Q?RWkNamb0XQ5Vqe8v62qkznWDEH3at8OABtPwoY8PY23RgrPRR5AvrVV8xM1H?=
 =?us-ascii?Q?fmaYLjKeqx715zLLxpxrFZpMbnR7rRCHV22Lgn25ouUwec7NUjwIzzCnJjWA?=
 =?us-ascii?Q?7A+6+JC4j1X4wL4VBtuiHezCx7zhs12u6CQBNub9j+pVrIGWucLWOSMO600K?=
 =?us-ascii?Q?IfNhSSW/VgIdxJ+YSbBHQb/PJecRZ3n9JIIHwyr8P10yuee6fQhenz6Zo+6d?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bae8ad1-4dda-4931-7450-08de23d9d28e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:59:18.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEw0WKWC5n5yXWtraExocG3pDJyqofChI6C4JmVeMsnQ33BJmNXSZRSw7F0GxgaJwM4IlMM4WRjTUQaXbshC4hgUKtPOXkRMehzqzRAPfaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
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

On Sat, Nov 08, 2025 at 11:21:28PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/irq: Handle msix vector0 interrupt (rev2)
> URL   : https://patchwork.freedesktop.org/series/156764/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d_FULL -> xe-pw-156764v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-156764v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-156764v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-156764v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@panthor/panthor_vm@vm_unbind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@panthor/panthor_vm@vm_unbind.html

These failures / skips are not related to the MSI-X interrupt change
here.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156764v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2370]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +12 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2314] / [Intel XE#2894])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#2907])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#787]) +20 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +18 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#6168])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1727] / [Intel XE#3113])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +14 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#373])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1188])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2321])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +7 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2291])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#5299])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#4302])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-7/igt@kms_display_modes@extended-mode-basic.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4331])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2244])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#301]) +3 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +4 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301] / [Intel XE#3321])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1:
>     - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#4543]) +1 other test dmesg-warn
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2293] / [Intel XE#2380]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2293]) +6 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6313]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#5427])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#5390]) +16 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#651]) +6 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +36 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#653]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#6312]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +35 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#1503]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_hdr@static-swap.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2927]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2934])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4090])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2486])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2763]) +14 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2938])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-adlp:         [PASS][64] -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-9/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#1489]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#2387])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#2234])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2330])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#3414])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#3414] / [Intel XE#3904])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2413]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1435])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_sharpness_filter@filter-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#455]) +4 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_sharpness_filter@filter-dpms.html
> 
>   * igt@kms_sharpness_filter@filter-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#6503]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_sharpness_filter@filter-suspend.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1499]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@panthor/panthor_vm@vm_bind:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#6530])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@panthor/panthor_vm@vm_bind.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#5794])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@basic-vm-bind-extended:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4837])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-extended.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4837]) +19 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][85] ([Intel XE#6321])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322]) +10 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +5 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2360])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#6299])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#4915]) +67 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@xe_exec_system_allocator@process-many-stride-mmap-prefetch-shared.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4943]) +30 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2833])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#586])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@non-privileged-access-vaddr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#3573]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html
> 
>   * igt@xe_oa@non-zero-reason-all:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#6377])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@xe_oa@non-zero-reason-all.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2236])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2427])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2284] / [Intel XE#366])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2284]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#579])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
>     - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#6251])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#4650])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#4733]) +5 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-1/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#944]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#944])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-dg2-set2:     [INCOMPLETE][107] -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][109] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][111] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][113] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][117] ([Intel XE#2291]) -> [PASS][118] +2 other tests pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [FAIL][119] ([Intel XE#1475]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop:
>     - shard-bmg:          [SKIP][121] ([Intel XE#2316]) -> [PASS][122] +2 other tests pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][123] ([Intel XE#301]) -> [PASS][124] +1 other test pass
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][125] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][126] +1 other test pass
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][127] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][128] +4 other tests pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][129] ([Intel XE#4543]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-8/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a1.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-3/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible:
>     - shard-adlp:         [DMESG-WARN][131] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-3/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#455]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@xe_exec_reset@cm-close-fd:
>     - shard-adlp:         [DMESG-WARN][135] ([Intel XE#3868]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck:
>     - shard-bmg:          [INCOMPLETE][137] ([Intel XE#6480]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-ro-eocheck.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
>     - shard-lnl:          [FAIL][139] ([Intel XE#6251]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][141] ([Intel XE#5166]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-435/igt@xe_pmu@gt-frequency.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-436/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][144] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][146] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-bmg:          [FAIL][147] ([Intel XE#1178]) -> [SKIP][148] ([Intel XE#2341])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [SKIP][149] ([Intel XE#2341]) -> [FAIL][150] ([Intel XE#1188])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_content_protection@uevent.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][151] ([Intel XE#2311]) -> [SKIP][152] ([Intel XE#2312]) +8 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][153] ([Intel XE#2312]) -> [SKIP][154] ([Intel XE#5390]) +2 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][155] ([Intel XE#5390]) -> [SKIP][156] ([Intel XE#2312]) +8 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][157] ([Intel XE#2312]) -> [SKIP][158] ([Intel XE#2311]) +8 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][159] ([Intel XE#2313]) -> [SKIP][160] ([Intel XE#2312]) +12 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][161] ([Intel XE#2312]) -> [SKIP][162] ([Intel XE#2313]) +7 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][163] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][164] ([Intel XE#3544])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][165] ([Intel XE#4596]) -> [SKIP][166] ([Intel XE#5021])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][167] ([Intel XE#1729]) -> [SKIP][168] ([Intel XE#2426])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5427
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#5794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5794
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6299
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6377
>   [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#6530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6530
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d -> xe-pw-156764v2
> 
>   IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4065-d341d1ac99ecd6d4f22b422319e8432771487c9d: d341d1ac99ecd6d4f22b422319e8432771487c9d
>   xe-pw-156764v2: 156764v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156764v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
