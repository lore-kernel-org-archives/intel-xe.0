Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00433CD8CB2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 16:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D9610E41C;
	Tue,  9 Jun 2026 16:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgL62F3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6EE10E404
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 16:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781023881; x=1812559881;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WRAdw2MR8HO0IDXgwKT+XbIWLqeYfKAMlgu7XsU+V8E=;
 b=LgL62F3BSdUF2r5w/JuvdwC6bbbt0k5iwXKIUQUQRqdhR3ItLV0r65i1
 jt7eG4hPx+rQwLNknK13FbVdL0r1NjrgHW87gRLzMJsG/WwEzyC/+kw3w
 b3oiKoQGoARynDwnwzQlLebN3R/HTPdUAH0yPUNBDMlvI4nFgFF50ZIOp
 j7qwjLnJX839pomU3vtJlsfpJeuHCdnhQvAmR4NFGMRqBHLynP7vJ0L1R
 13N79uKpRH1CtbrseWI+Q+1yS6q2pR6ua3E58VQBCj/3lAqFH81PYzWH2
 pPsRYkekS8nudQvn6r3McLs/g6VqbBCnilg3DKGdLv3C0U07kEHlWwYGs Q==;
X-CSE-ConnectionGUID: jgP2crnMQlqJfWm+esLn+A==
X-CSE-MsgGUID: vbFKos9fTrGqOlcqCxPdIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81699972"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="81699972"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:51:20 -0700
X-CSE-ConnectionGUID: aUpGu0dPQeyqOYQUNZDshA==
X-CSE-MsgGUID: f2CmTz5iRSWDAJ3j890rcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="245773456"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 09:51:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:51:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 09:51:19 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 09:51:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4j8I6KF6sOSdWU7dGXuHzEp83DpiZM2qFxL8XogVRCMdz8MkoY+tkK35kuMMFn8jXPVdjMxycb9efdqderrHD4sgK+PsYEt6yklSjrtBIWbt2OairqvXCryUkxtnx8OBxGs6R967OzHU1iBh85JBGzGLSsakVL71JAxlmy6czoOGrPUpClP4z2VqEy3yxaMCuMKB2vAwURkAL3nGsQjkkd7omE3nfTy2ys8ezKRHIg5WIqmyAOc1KcVHElzeg7a81KfY9ecw4oy4WLsJtTUtWS5Rqpct6bjkYZEq/dN6BMnDIsJZhGg7KjErgdadlVqKSvceK5dWfgsKhoB/VjvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAsQNBWCSAuGGDBG+pH1PYOMhWUB+OsUExDrFEOBz5o=;
 b=ftC2obxAgwlWnwjpAoLqfZ3VzXsW+NUIO1o73LyJ0cbdhciKvLB0snmPLeOLCI3vd5TfhwoQWXfJF7NrXMbxIXfXDGeFxW+XRVfKoXe94KfmUrMEViOro5FKWpmdXRgPYAv7oUuTb0MWyzm050dXWFcZj+R9FYCPsZ3WFS1Eqj8TYyiEi0Z+q7m/96sbB3ZwPi1/Ub8gFWglEEZBC0bzIeL8Fl6UxPw411xulmJiC7fTbU7clnQnsK/Q5RjUzCNC3u52azNFi7tQRWV7n/MEUuYt+9qMGFIT14KiEjr2hngNAK/ANoyO8PH03hGKGzGFubMg7cgexDZ/j1UnqaiyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 16:51:15 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:51:15 +0000
Date: Tue, 9 Jun 2026 09:51:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for DRM
 RAS Fixes (rev3)
Message-ID: <20260609165112.GF6214@mdroper-desk1.amr.corp.intel.com>
References: <20260602044919.702209-1-raag.jadav@intel.com>
 <178040599795.35116.13335907156174806278@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178040599795.35116.13335907156174806278@6beec6c84f66>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: d91c89b3-7c8d-403a-c19a-08dec64751a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xD0VY+qZ8lTCFeJXai0foRd9uveJGx4Hh6YCliBPjCPVg8QP5U9wsLsDE8hckmBFd74Lbqb4jhvR7WAZPuCn9T9Aj6ST6KT3MSbjzsMugJdR3r+K/+SwU9VL9+x+tgo9ssjSzg6QPHXKSP6KNWqZWEMhQW4eJSx5aJ3A72VPef4v44PDgXu5eAuvK5SQ9pVfJThMbUTMax22JVJzwt6s61Ko7jZNZgwh84T4yPQ4AKZAwKC8obAwEdwV3EoZerE8GxkQii3OjhLaAn7SsF+7VQJmhF3VJ6Lg4yfExnBC7X9j9FL7HqPekl5S+rNDFKxceuEAYGQUMHgSheo7VxDbBYB4QiDnaABTrsbNrmr+yctxMIF6wEZo+Ba0L+laXjKNwxTm43cNVwDsZGOJ+KDZJA2bN/in5hsJ3NOOX4DLSXVh8Vt2xdbMj6PaSFt/3GdbkdQgZkZ9si7QxdbDnhYcaM3Y1tFulxTDXLfm1Vizxvw8tKL8ATWqlVr3VOY+ncAxJNeohutJ0tbOlCjK0byYQcYHoItRw2Jyq5YfHc5iigzz72DmE70M6u1wyR06ST/oSLYuIQBk3bvyqjQa2YcRCC72G32yW8Fi4kT5fPJvGhMGDusVQcWq3iD5ylxEyRgL30Le7OBTDwj4M3Q0V8Zyxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F0SEvuC6tSm7BGqD7wNDei0qRSNHM0JSirdADeFULgnkaGh3b+dEEAnNrDOj?=
 =?us-ascii?Q?YL3fCHM72eJXRQoRC1Oz2I5aJ2JUofjz6b7iVJUxxbhGcWmC5QuGk7+Wfeuu?=
 =?us-ascii?Q?yub4mdxflBCl/eKGmcOcOn7pSt6E/oC5S+w8CxEd5Tv96WW2vukywQH45DMx?=
 =?us-ascii?Q?d4zjJOpe9aeFlxcpIc0DMnQh3mIIOEg/w5jNlO3/FVOsgQKg5NBllBKMiKfp?=
 =?us-ascii?Q?72ZhdtvP2xb3yA1gmG1Xepl5Wd3J8YVcX996wdmtoUh+KjDdag5AkAK86R/4?=
 =?us-ascii?Q?ARZeYiAG59WWlxWgmspjS5jNXnekqzOYoKYJ04hHoNydhsFIxsm0+9xm8BH0?=
 =?us-ascii?Q?ujal/2DNCPXeYHZRcSE6zUbKkpqmeenPJBIWe5ebUFllgesbeXv4Ar0+7N6b?=
 =?us-ascii?Q?0opc0SJOBDyUhdp+tg2vLCax9VMb7pcq5w3PN7CCPwiBIkTOFovja/Lls0y4?=
 =?us-ascii?Q?GjEgrrdIFxwhukKCtgyo0PSku1VUWdssuflJDzge23MoUnZ01fuf9J6NW7nT?=
 =?us-ascii?Q?DSa4YdjFpHEe+wV2HvY6xrJBCehCT7BCdhCO9238+Zo71k0/tiDdNkPAKpw7?=
 =?us-ascii?Q?5S7j5izlAznUA13DnnQhAHLm1O4OmPJI0jzehpQDMm7TjUIHlvVdNuPLzrTD?=
 =?us-ascii?Q?9WPYj9qPwBJ0tDuOQRElRtrmFcfNDjc0sTu6L/5K/TUUzOXC4SuwwHJCh4Io?=
 =?us-ascii?Q?Re9opuVoyDzkyDuC3tWVYmyspSrrK25qvaP6dxYeuZk+OKj+udwddbnc0obB?=
 =?us-ascii?Q?xMuu/x4gVWEzcQ+0qhkNrZ4lSGLLNipLAH9dTmxds9yTx38dICDyMnb9q9sk?=
 =?us-ascii?Q?fLUZPV7t/0odkoObpX/ehQ8d1bEobGsGn00mqMWc4z/Ki8HUKEVnHdh0mvP/?=
 =?us-ascii?Q?1Wfj7fw41Sz8UhcFTr6zpzG9rRzmMdImYlJPx5XlxYDN7DrvOL+ocyXFXyfr?=
 =?us-ascii?Q?lYc7Ma1ILJxU2hqzIy5+GfS7eNW5TotYYeF316/5zN5giBj3LowhAjNbSDrF?=
 =?us-ascii?Q?ZH5RYTipaeF5dMobDYgqjvKoPjDKubJxyLNI/pjTJYhPusvwwBYnmKeGd/zs?=
 =?us-ascii?Q?zRoHmLczpvI/OTQfVqFvbL0YV1VM+N9SKzPMOhjRc49D2VRPdfK0eO24C/Zo?=
 =?us-ascii?Q?ntjhe8kXSpp8oSmJTUuusROVxlyZEdrEQ1TLDdkX2F5pPerwb/GHNXTu4MMB?=
 =?us-ascii?Q?2BBX8IayVF7N2rraeU+fAM9gYBRTS/jDdTgOZj+byBmVsgnJ1Vy69No1eKgR?=
 =?us-ascii?Q?ErVwXJeXFsrkTeuThabV9KMIsqA5jgSDhioCKMzRtY5goK3ZDcLNh2A1mRWX?=
 =?us-ascii?Q?sRalLgm0vMz5odC93q+33H328/7bsOV8KjzhK/ZuGaw/2Fj6Jw9H2dJoVnBo?=
 =?us-ascii?Q?cZHpZDUtIqgx+Wmvqlv/7Dr2Tisu76qt6RWIhe0LWe0YQKJdb72D+cv9LHmm?=
 =?us-ascii?Q?PcsTprLzeBrBsq66pwv8+mOLi1Y3H0mJphTrhTcWyOtq776178JI3uH4Rl1D?=
 =?us-ascii?Q?UG7J0ZFcbvUrhTyovYy0I8x9xwsuXrTOZuz9C8RHTv7GigP1WJ6a07BeJd4e?=
 =?us-ascii?Q?abhyaTkerQXxVeLF71JD9/d4Q+uTy85/7FLAArOc2mbE3zVp4rSIavpHrYAn?=
 =?us-ascii?Q?t6oJH/s6lsM9QlLvrf6DmxRuk7wMObGb16hv0OdTbUiuKawOkpuhaAh/dWrU?=
 =?us-ascii?Q?v6B4t1O1GSoxgi+8Z6Kh+bZSAYN2rkJAMAvfORXB36Rbi+kGrGU6/YTDijwR?=
 =?us-ascii?Q?AAPn8NiG9JNAwzQ8g1074Xq9bBCkIPA=3D?=
X-Exchange-RoutingPolicyChecked: XXQ7N1Qiq4LHumJjzkHACzx8QTpy1VyZy5ccRi70+ysdrwOF6ri6oGMTQIv7agpoxaSUqF30sgPOVLGf8/8iKrlXAr7p3s551tblXaKCK5qrzW7ZdYN1Ej8bRuv1lhkptoxM7YsGSIqv9AJExtcmvXG1kyqxK6def0xHfADVe7XopmWi9GtyxFy7wlm4XwhJPs54IU/h1u8sE84xpMuw6Vfeo5T9ZtQyFfJVeROcAjvbYdheYhotP3ARFm0kKs38sqqKAX+rELlcOhtjaWHeAxkAz9OG++TlenoLRuJZWoukiBfhwhTVx47ZWnE7y8i0htqVQ0Eb1WbCJyRAeKYmlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d91c89b3-7c8d-403a-c19a-08dec64751a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:51:15.0824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GdqrAt5cw+AUuDmQLEbOoETNHjpMXUfqVNmFfimT4n9I3EhpFVAXz2n6v23WIYdqpschIanLQrOnGL4MRICVqlTCAama8OTDpi/Cd+mXgAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
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

On Tue, Jun 02, 2026 at 01:13:17PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: DRM RAS Fixes (rev3)
> URL   : https://patchwork.freedesktop.org/series/166595/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5177-a980196655477a8f5067112946401fe52e510664_FULL -> xe-pw-166595v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Patches #2-4 applied to drm-xe-next (Raag indicated DRM core patch #1
will be re-sent/merged separately).

Thanks for the patches and reviews.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-166595v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2370])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2252]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325] / [Intel XE#7358])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7642]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2320]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6126] / [Intel XE#776])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2375])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][12] -> [FAIL][13] ([Intel XE#301])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301] / [Intel XE#3149])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7178] / [Intel XE#7351])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +23 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +16 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#7915]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7283])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#5021] / [Intel XE#7377])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#5020] / [Intel XE#7348])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1489]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2330] / [Intel XE#5813])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sharpness_filter@filter-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6503])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@kms_sharpness_filter@filter-suspend.html
> 
>   * igt@xe_eudebug@discovery-empty-clients:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7636]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_eudebug@discovery-empty-clients.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7136]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6874]) +14 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7138]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6281] / [Intel XE#7426])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6964])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html
> 
>   * igt@xe_page_reclaim@boundary-split:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7793]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_page_reclaim@boundary-split.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2284] / [Intel XE#7370])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#944])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][42] ([Intel XE#5545])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-bmg:          [PASS][43] -> [ABORT][44] ([Intel XE#8007])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-bmg:          [ABORT][45] ([Intel XE#8007]) -> [PASS][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][47] ([Intel XE#301]) -> [PASS][48]
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][49] ([Intel XE#6321]) -> [PASS][50] +1 other test pass
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][51] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][52] ([Intel XE#309] / [Intel XE#7343])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][53] ([Intel XE#301]) -> [FAIL][54] ([Intel XE#301] / [Intel XE#3149])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][55] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][56] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
>     - shard-bmg:          [SKIP][57] ([Intel XE#7916]) -> [SKIP][58] ([Intel XE#7915]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][59] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][60] ([Intel XE#2426] / [Intel XE#5848])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][61] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][62] ([Intel XE#2509] / [Intel XE#7437])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5177-a980196655477a8f5067112946401fe52e510664/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
>   [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
>   [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5177-a980196655477a8f5067112946401fe52e510664 -> xe-pw-166595v3
> 
>   IGT_8944: 8944
>   xe-5177-a980196655477a8f5067112946401fe52e510664: a980196655477a8f5067112946401fe52e510664
>   xe-pw-166595v3: 166595v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166595v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
