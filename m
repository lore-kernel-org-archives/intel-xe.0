Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36412C8303F
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 04:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16CA10E6F6;
	Wed, 27 Aug 2025 04:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guOOl1yP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C3E10E6F6
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756269339; x=1787805339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XgU0zg0a7XWw/TOyWv6PvZr9n6X3hxvtoH88kOeFxj4=;
 b=guOOl1yPk5cmeCy6tp0Is/C+J8qy0B5/OZkmLBZTujXT7QTq1dzqqdfh
 S4G1PbMwGznsv8ZO03k1XeyYKhMHy3M0KJ3z4ld/hW/4ZG2UaeltqK4V8
 BB8LP8vOBNb0nxkL3jVH92LrjtzlVonwdtuNuihxxNzdzvmIcuajDD1EZ
 faOT/EXVb/U6OZecuMuQAZZRflOaUMvU7sxz4n/mY0Vw7JrebUW6Jc3zB
 iPLaQJuggREwqTOoT83DOCHC29rBB+1hAO3N4cOgVl3c3vfz689Be8o0o
 oM5e21E/49rSiJKksqS7ITkPTvESnzB2IhrP9pWEpbhM2rb2qUqss4k4j g==;
X-CSE-ConnectionGUID: EIf2J7x1QwuZJ69gHNivyQ==
X-CSE-MsgGUID: ht2A2eatRni6Phevqo2srQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="75969397"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="75969397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 21:35:39 -0700
X-CSE-ConnectionGUID: HLgiUXJpSxqrt12ZdE0YTw==
X-CSE-MsgGUID: mbehqrN3SnqXAMTdwAY1XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169262819"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 21:35:38 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 21:35:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 21:35:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 21:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cy7756FJ3p06D9OZPrwo3SFzql9hVzQ1lVKmRZBRJeaTv/fufQXbqfi9/1NgmPN7e3K7gV9wBwqAhz5dQZIO1U0IHUgj61qABsbTnWCPKjWDpR0fYXMfsvos8RD8UpwP0+ULWE4hXV18trpuKDQDnLWQ8op7F1mC9s/HOOhgH8+bnz1Ih34tqGTumr+7DdSS9bXJx0Fm72h5GPgB8vJqSf2HqVnqwIQrQfOnYS8AYVD6P6WPUmOXpCT035iZ03AlIJp+C0PnYFqFhQ/zw6v+6queIZmpGEpPYLwUAju5hUYgW24ZErPYj8A71X9mkebS2+JTFjy+Yt9j33TvsOFDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um04EbBuA2HCn/WGSp4SSvBw/HZkiCKak5Zb8Wn9kwg=;
 b=oU4R1Lyg446YKsaal1Nu1tuMWZRAKLAkpwknt4OMyVElA37OWOuRUxmyYQ/Db0Fi8HySBsbRraey2eNUtmPK1C1ID5mXoHBhvxGIZkW4S0U7HUo+WB0l4r+PimX1RXVvlaoH1kAli/oGfziqc025y/2w+Y8wUFjf5Idlgm7UoSkoowN5ZBc6kvhyrFwOhSAYzJcC3qKbjiY42iQRUcFqFG8Us/+7oa5GKt77bMrWEOecKntQonHYid7NYVoSq9C0deZeKER/AUrBUifhG1QGLEGNpkU5UGMhWTjmA3NEuiz0dTap2jojlTgIp7B6PPlJJeeEX0pi69uOiTHH1zTtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH3PPFE80710477.namprd11.prod.outlook.com (2603:10b6:518:1::d5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Wed, 27 Aug
 2025 04:35:30 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 04:35:23 +0000
Date: Tue, 26 Aug 2025 21:35:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Sebinraj, S" <s.sebinraj@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Badrappan, Jeevaka"
 <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <aK6LBmxZdtD3MRhv@lstrano-desk.jf.intel.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
 <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
 <ikui4bvcsit4tigoywf5xfjimgh2sxbceqe5dqayyaqzfgpsgg@pza2islxnte4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ikui4bvcsit4tigoywf5xfjimgh2sxbceqe5dqayyaqzfgpsgg@pza2islxnte4>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH3PPFE80710477:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e41bf2-f171-47d1-20eb-08dde52322ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LEVFmxP4WMQ5BP1XTbgTdyIgThFhWF8W8RfoSr7cm0a2VRMiI9XKYV6SmPNF?=
 =?us-ascii?Q?s8pEq8mYK0UoTbv8oCtmOcRP5YMqxXQQMk4j4bwzXjMNmkhlgedk/bbkr++m?=
 =?us-ascii?Q?AR236Qvjqdotydjf0QDfYV+gJFv7sNmdpLFj7lPXT+KDoh/lvxLucFSN2TpL?=
 =?us-ascii?Q?7QBqIqdnrww0JZW2RUq5nTGVVJ47R8do6JaaTNuVxlZojBDRGS6BiMvxhn0o?=
 =?us-ascii?Q?Hd0rtehX/fdmx8dui3ol56I0colZm1LzDMBhF3uASLH2iD+bXeVH6BOYMAIp?=
 =?us-ascii?Q?Gbroa5e7ib5lSAp/wIGmddyXvkF5Nn/PWdbP+YeyfsDqpNc8Uz+d/jG6vCQ3?=
 =?us-ascii?Q?ZJ9Bd6JMuquKPbzdjrJwtmRu7c359LrdC1aqFW/DyqcIg8jA+YqKRz54kWHX?=
 =?us-ascii?Q?42DTgIY7MMM5ssVaznzmbExocDazKsr04NpCRzT2RGElirhotzJzfgP64xu4?=
 =?us-ascii?Q?53pGb0RMdJ1zQRFzci7GVOLXUXIN2+OBsudtQFZBMmTMWGcE7hWLJ8tyhvxS?=
 =?us-ascii?Q?IC81P7w8YeGlYPmq8K1Vhq8kPLOquAwpVsEmrZJGbB0IG/GxFh+jxTS6hnY7?=
 =?us-ascii?Q?tilUBpP7e5pWK5lP1ypeNUPHz7fi03XrQXbM6afIj7y1SzOrJlyRF4t5I/7m?=
 =?us-ascii?Q?sWAFCtI4tF1/ka+68+16Dph9HU1vnBWmXBtdhitPuOCslS9Lw28AdH0IkpWZ?=
 =?us-ascii?Q?HXpn5RUx07MPcd+IlFgGXZYf0yeSHe0Zy7BbD97U7NyX6i84sgFxtIJ2YGyQ?=
 =?us-ascii?Q?Xt1ZPc1BBL961RXiY12qAso+L9HUvMd8l94FFViMy7G5XgjAear7LHESSTx6?=
 =?us-ascii?Q?WsUZkWr951qcjLVsxjiSqN80GA0N7cO/r0p44K219NGcUZtmYLfVKkoYtkcw?=
 =?us-ascii?Q?nb2TjhFUdc63jOAxXQz4855dTj05H2rNBGZSwfeAKEwagFzklIzwQGywjYYe?=
 =?us-ascii?Q?3YrAbLLGkPogVUO8VHlEYSItyJwt5wF8zndkaOFIgYHAcctmlZiAF6AVzaZc?=
 =?us-ascii?Q?fTrMW3Rumov1fyhED2S8zAPoAUsrIa+kYBqFF+zW416mueeLryMZsO+tzRNL?=
 =?us-ascii?Q?ovmNoCyos4DjRj8iRynTh6NinqfsJKJ/fphszppHtg/u32nk10Tu3MF1rjH4?=
 =?us-ascii?Q?frHIgsGFsOlUgsjYqPNK0Yp3w3JiX+vJmFyBJxRFcgwBSxzqvC7tquwpNVUk?=
 =?us-ascii?Q?mNirKmGpKbzAxB02tHPLHVhKLQJpUZcTkEIDDRhHhXxzwjZ0RKiIqaKSYtPp?=
 =?us-ascii?Q?0ybCpocsoUAhs7RyqOQigfbtotuxOe2tpLenttyUh7uRJoG3Sh65X/HwLoTx?=
 =?us-ascii?Q?S0idQzTo9aDUHgkOZc8GbsS+ECxr6lzKl/1XVvNIz021P4kkkX80JVrQQ686?=
 =?us-ascii?Q?4cR+owg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SQJ7nMBGcgV58TLhUNUxwqIVWMHubQ07zWaxhWHkU4Y74hpbnIpVuI2ws9/B?=
 =?us-ascii?Q?I3ucTIk7dsMcEqzVpihC5ByrE1DwiBlLhZuxkiXSKS8e2SRGwPgaSoA07oXm?=
 =?us-ascii?Q?9E2+4fHxtfVPn9s+B6ZsNsHvuZT6U+BSLrDIO8iF0wlgqCZB1apu+SXLng0j?=
 =?us-ascii?Q?0AoX724FV/PRea5S6bmvkDr2mB1AGYM8VeJvClETmAZzBRAMi4Hv1REO8tqS?=
 =?us-ascii?Q?O70jJPF0flcSE/0ocLMqgwUy/LnazA+RxtDrD7I/+jAW8/eHcaVPq8WTYtD1?=
 =?us-ascii?Q?6qOMW0ZxDPX3p0okgjnmFqSXiPifnOt2TWpZDr/LMpRtm07GOu6S/H5u8Gcl?=
 =?us-ascii?Q?faApKLj1Yk8n1NNltbM7VSozGaLF5aZpzh0qy8RG19P8wZTl5sPAtRxmgNRP?=
 =?us-ascii?Q?10BOHMoE7crRKXqDnGAVRXG6v+Xi9m6yvY6ktaVdwOGp2+rG/FGtxDTY3Zk8?=
 =?us-ascii?Q?gvlr3EM6WauNNDfq0YTOF+3pdr+jzOhYEPpsdabysLI3qOLDfatp7CTKinkv?=
 =?us-ascii?Q?Yi8cPdoZ75nMVenDiXQbi53O6riZNFmfJ97LjRTzTV7uktm1W9NP8qHjuDB3?=
 =?us-ascii?Q?9SPRJgV0LuGmNpvHwuW4PKj6DV5s1iWJm3h2PTjdirtOgw1VBqJBT/UotMnq?=
 =?us-ascii?Q?BxP0GC4c/2yd3bKNDgCtfnB3GzwAmetFumzDCBr9mV4BQyQOijEWsEU3ab6M?=
 =?us-ascii?Q?SPPo1ccK6Af1JEAMSL+Pf+DzJ7zdCvIrX8e2gaG2cCk1qsy7uAsLQzsBixMw?=
 =?us-ascii?Q?UK7nyw5Vqf8Y38J8pSVsGhErdPfwCXrmp23S6OroffK9nq8Tp31O8AaJy3tk?=
 =?us-ascii?Q?K6axUC3WEX1rpeL0YCQznlY5NpgwjXtZitGOmRKYxWiVL0FtzwjKz5VGwcez?=
 =?us-ascii?Q?k+++JkFd7zdKZXsaJtPnjWY9bGU3d7HglytwIJEFbRQQRJerPuyv+oKiQR7V?=
 =?us-ascii?Q?ZqxUaek4iDgmRX0uvmC26vluPeL2QtqYZYBk71cZmoi/yO7478YAloQL4dUZ?=
 =?us-ascii?Q?Iz9PGtNvfVwDhT2sowP4lMo6XfJt7IUtUgs35g3h2dLd+VMXJoBD8dCKHrsi?=
 =?us-ascii?Q?QDeJ+LGpav9+11Qm2602OiF2Ahjz9DS5907utHh+Lz53ffanZEO2UrD5/m3T?=
 =?us-ascii?Q?53469vE9Ws8qQjTQWUg4tS5nBQyLLvr0M0Nd6hNwjHVa/384SgOh5sxzOgqG?=
 =?us-ascii?Q?k90S1qksYeb4ifIE8PVEfKtMwURnHiLFimoAbc+UGnEhH3NkWuIbX7BSWzww?=
 =?us-ascii?Q?lmgSLzkpvXaQ9MFbyblSDcXwwOtEUlah0pKFODUBug3KQ8q+Dhc+q0i9eY7d?=
 =?us-ascii?Q?doO7xaIjuUCZMV4Q4L511CWtJ8d0NV5IkAqsuP4tCbyB4DhO9n2HVNNG5JXP?=
 =?us-ascii?Q?cUJnyHepLOekfW8atAPtW5lMSwneDvYZjCMOT1Eoz4goBuPcWLrEls//9f1C?=
 =?us-ascii?Q?c7112pG9L5I0qA534bY27oTwqqoTgA5B0oP4G27PXktHYxXVeKDQBBgejvD8?=
 =?us-ascii?Q?Q2JSProFNm3q1htjeRc9urp6ALAsYX1bawS48Br3oAikzj0Xzhu/QJlYsORm?=
 =?us-ascii?Q?KQRHIh1bDXj0hPnQTKzzgssKoG0cAljSRC4C++xNjOI4/m8mMriSEgZQoBjq?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e41bf2-f171-47d1-20eb-08dde52322ed
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 04:35:23.1410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msGn7OKLclG8VC1HY2EN6qrhkPclv8ZMIycgM9Zj2idXvzC1GIgMmkgXhu5t3J1lb1P51CSeYfvnBbdfcHr7og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE80710477
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

On Fri, Aug 22, 2025 at 02:30:19PM -0500, Lucas De Marchi wrote:
> On Wed, Aug 20, 2025 at 04:25:43AM +0000, Sebinraj, S wrote:
> > We went for this addition rather than the one in xe_pmu (via perf stat - user space tool),
> > as we have a requirement to have the trace point available at d/evens/power/gpu_frequency for Android xTS.
> 
> sorry, but that's not a good justification. We should add code that
> makes sense overall and can be used by *any* downstream. What am I going
> to say when another downstream distro request the frequency to be
> exported as xyz/events/power/gpu_frequency or with a different
> signature or with a different sampling requirement.
> 
> The interface is not even generic enough to be useful elsewhere.
> 
> > In this case the user won't be triggering the perf subsystem for gpu frequency for gt0, gt1.. even if we add the trace points in xe_pmu.
> > Other comments from Mathew have been addressed in the next revision https://patchwork.freedesktop.org/series/152701/#rev3
> 
> I don't think they really matter much. Until we figure out how to
> fulfill the android requirement without poluting the codebase like you
> are doing, we can't merge this. Sorry, but we can't maintain a
> perf-subsystem-inside-xe for that.
> 

Not arguing for or against this series. But this series does differ from
xe_pmu is one way - it won't grab a RPM ref if the device is asleep
whereas PMU handle holds a RPM ref. If the use case is continuous
monitoring without affecting RPM, it might have a case.

Matt

> Lucas De Marchi
