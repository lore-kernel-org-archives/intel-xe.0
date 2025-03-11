Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34292C28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 21:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2B10E2B8;
	Tue, 11 Mar 2025 21:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOdIjIsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EE710E2B8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741728790; x=1773264790;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GEn45lJNKBAyRRAERdQME2v888vKUvkI//8QdjDA7h4=;
 b=MOdIjIsPZMNdLgl+hsRcYDyQ2Y4o2FvyxRy9YSriA6RGmcw8w7CaTm1o
 Am6aDLdiWWe+36FxZtvUGHD1hfWp309qBRZUI3A2cqS5zKPCrbWwSzxXj
 3L5yWNmu0PMz/c5+K/spco6vqGpCyTmCUBqC/keCWGJLD4NCdJdK82IIL
 pdXMZS4Hgcy2gECsmggnG3C5hoSYIpQEWiD6dgD5NSQNTF5TEy6xOIYiC
 ECvYkm1Dm6VzjYc77kdyFDwfFPUQL939ERMPEIpWwy58dPv5jKv0Eh4Rv
 ypddUpOFwCdrYa7hI/PFq42RE2TgnwUtYXxP3LTZfCWMPf0jQ41sNLZcm g==;
X-CSE-ConnectionGUID: 9fEm8foJQ8mMj+nH4R1afQ==
X-CSE-MsgGUID: a+86O5GASnq59w8PPY72dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54172396"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="54172396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:33:10 -0700
X-CSE-ConnectionGUID: ozgeZ/VGQD654F2tJJd09w==
X-CSE-MsgGUID: EO7GIIv4S9OyLeO99Ia4JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="121126637"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:33:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 14:33:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 14:33:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 14:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQELFm6BY+bmMzrfTNnd8AKgGQFDJVeD+SkqjesrAZoRRIDGjCTIgKDD+QbVfXGm+Qb5nYfVqTsJFTguJj6PEYFpSZiNJEWs4vZMSmgSgPYzJrATAmzQBqJ0ZUtVbrTXiRxze28NsIbHonTc4jAQvsW8obHEJ2U2en2yiPxwpcJ8txJQXHZ2wmUFl3aIExzYb13Gs7V3OEnowDpnjsTFYQILCZavySKerK2QKzY5AU5bbPeZGHZYS7jm8M6+ggPS5zz2yOYUAioK8KRE7xgpK6j1wjhjdKdCJpGlvl149oEGeSamiKPoBDEBBmXRNOJinhL6V9BVsn/fMeduz9h76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjxDdubLmrZwojHOez/Cw/SCqkWp19PxZi/leYT99BA=;
 b=gkUXkntfEeH5f4GwnxsD49ArdmwHvKfSY+FjU06dGrHyVh+lZ+vIaYzOP0mV0cvup20Ed2TlwXWijC2xhz58TwLfdCPDC2hiVk3tE841dDw5pN/63S34PGCNjidIxlaUfxKlaLL5clwrZAZ+iUyUBzqHQoxP56Wq2pFeXxGzm9E09M3SUv4mrP9blwBYakHLYyU/oIR9jLP+T4pAnHxALln769vytv0+igves3HvV1mtsLB837t7mG5Xqilq1B2KH265hOz6arnlNQBRXE8pDmwjpzN/1kzmNsYqv6PXuNOcqBaVYNFjubsWdmW7/8D4vou7aTwXQUS/6408bd+w7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7113.namprd11.prod.outlook.com (2603:10b6:806:298::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 21:33:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 21:33:06 +0000
Date: Tue, 11 Mar 2025 14:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v3] drm/xe: Apply Wa_16023105232
Message-ID: <20250311213303.GA1439735@mdroper-desk1.amr.corp.intel.com>
References: <20250310185552.352350-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250310185552.352350-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: a54dc5b7-f01f-48c7-aa39-08dd60e44f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dKDvPVWO4E/v28t2fXcq+NOZW8xwmKjbx4qqvSaXrO1XVtf+bLqEeAa1WMxc?=
 =?us-ascii?Q?U2E+FBxFUHaz/7M0YwzJP6AJb0mkneYYIl7skVaet4wbq3xpMVmckBmNKdgQ?=
 =?us-ascii?Q?ZHgcPgVO3+FEQuh1W5Tj2i0DyW/hhi4zH713kkKPcgA6s8ilqCpMoOKl0l4b?=
 =?us-ascii?Q?EhntDJ0N6XbzfXdBLy8S7J0uQHxcvR1PS3jK5tg4oeosEqgNjvccFOu6Mn8c?=
 =?us-ascii?Q?dH9CgTkXdzFQD4riRQEKWpxGaoN+7hbKFC+03C+z7JkBkNh+Ag6+yhdr3Vb6?=
 =?us-ascii?Q?E5zQ5nw6DarUYujP6Tc7wLvXuHeJOPQq0GLP+CR7DHUcAKzYslRleKnlulfL?=
 =?us-ascii?Q?XQaODw94A1NIAVAKgR0NgSFN4l4Y4xBs5TM9fhq9w5bj/GDWc8/j4tPwAFQ7?=
 =?us-ascii?Q?tpviL8qnL4/SkIXoPbNmD5di39eMnf3GxIEJ0rRpY0IWeY6kUMkLKy9RWNKa?=
 =?us-ascii?Q?lxwEySG+PChvtrvuyjBevVqf3rvKsVrZX3Eyu+tzQZ2ufwZESZKBfEt5Txu8?=
 =?us-ascii?Q?1aXz/ftLNNlzhYmWRBH71mS7FKVF99DFwsKXDZ7KO1bHoeiYsYOtXShiG/fw?=
 =?us-ascii?Q?PtX1G451DfELBg3Zl/thaUMlHKwHEEh96BwXhyoJt/+U9xvFGpDOdWc9nLAr?=
 =?us-ascii?Q?Fu0IQYJXYxkmPsE1lwxQ7ZoYc/D8VgEMu8zlmgxvcP5FiO9Qump+6JNmbkj3?=
 =?us-ascii?Q?f+zzc2ay8IdLK9kplCX+O8YGo5UtMdSbkDk9kf3KqVcxicNkWL1Sx2xfXQYI?=
 =?us-ascii?Q?HYMyL8PiZV713mX4gCaPeyVH9Gq00jjVACy43dzIz17Dm+LWZZKjRr7zbk2q?=
 =?us-ascii?Q?fVAZs7s1vlQlUEpWEhQ8aufmof0xWYkTFRU/HflVy72oLXP5Cr4xHqDD8OxN?=
 =?us-ascii?Q?UNNJ2yDmgoqn+y65eoiTXKCCjGGg7+f5tIlYuZ6gyt1DubxLgFuSh1MWXg3W?=
 =?us-ascii?Q?2EvLVtv4IxsU8usnHLmYhpu1vGWHXCel/Eda84EFmvF2jF61EohVrko8AX0q?=
 =?us-ascii?Q?ijfzezRvWk7KVfoUfAt2hjbopE4iSXaHRcMr7JGlpuBZOJHdtTTSg5nm0K6N?=
 =?us-ascii?Q?qdpmxuJLg8SqgWE/nxiDk5c+f6L2ZVNHqi68D+Rjt1AMrY1tcM+o560wrVWF?=
 =?us-ascii?Q?4ciOJ+ycfG7WVQyQ3kthdX2f+y3iQ7nk6sZd4ZQpWLOgckem/FDsn1Dy4id1?=
 =?us-ascii?Q?61srXxYBFqNVyNO7XMZnIHPN9pL9W5Zcs5y5reqoRSpX/jp+HEMJ3iGNFl/B?=
 =?us-ascii?Q?P3Oo7GJiEOtbJSnWsTasI5MoPTGPhcAPLKa+UgUbdVsSCF1LMmoEpJa7cQkq?=
 =?us-ascii?Q?6yZ2D/g2k+dPIpMTR8cNGyu9QDOa0TL4ir6ioWC2thmKvfhaKMx4RKaOPGIW?=
 =?us-ascii?Q?vJJsnoSm2Pn2E/HkJXClqS4ao8s4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+pKI/j13zhfFiWn+e9+JZPEPp+yS/pTl0g/eH+5sRrlpr0BPpG+u9sHkqgJ?=
 =?us-ascii?Q?qSf8W9LzBwFQk5ybrCE+KLaztmXfOgZ+YWWT9Sc4qijDwo5+tiPdApeFwDxJ?=
 =?us-ascii?Q?RpccCetylrT1rnRZ/+Prt2niJvwzUSRpDqyDxqYscTZ44ZhH2lXRmuzg1Yeh?=
 =?us-ascii?Q?Z+SzskjJV6xopx2QeJDZWp/Ic0pswvwwUQO6k35rJUm/au3G4qk1G2UkAPs/?=
 =?us-ascii?Q?RkF3QiVJOubQD/XhdLXUfwWfllI/hDqJv3Gw2SbunLMbFk+Ycq1WJnAVfXFT?=
 =?us-ascii?Q?RSfhSFYCnUlYUaFsmZeHVqsEQ6iwH8OYcyb8bBEvh6r4kxxdT/Ue/A8l2TxA?=
 =?us-ascii?Q?xQ8sdG5K0VuuC4G8W7ViJJaQVbv7Mz/CxvZ7UbW4xTGk1UF3A7Q61XoqDHD7?=
 =?us-ascii?Q?2o8vylbKCD/6NsLc/TvtXwoZ/dAd+YloWvjO3v/7QiwN78Xa4P0umUWXBvPJ?=
 =?us-ascii?Q?0Vt8ucUO74wKvfZtTBDhjeqfWWDpPPV7CYTCBsK/mLuemhXSBpjZzTipFz1L?=
 =?us-ascii?Q?ZpZ3A3ECcoWBXf+590AEdZIOoBDGDvWzsQWXGrZiNthPuqOdfWvLPA/Vc5Zc?=
 =?us-ascii?Q?z3FCC51QCmZckAM8TEVAvLTvkNe2k3lcZy57M6iA5Be1LpKlXHF9aaqmH6is?=
 =?us-ascii?Q?FysvrUkSWoOPQdQyKF9vSRGOURiNPi2j1JlUA0EOzqa9106JWcEQ+I7Xcw0H?=
 =?us-ascii?Q?lMMYgLHgvCw1zU6xAgKjvO7zNlmYyUsLzO59dGoGBX8MyM0YzpeN/202vgXw?=
 =?us-ascii?Q?ElcFL3lTtVTuUMIgmgIJ38FlYeLPwlPXvq4LASZDjiV1k30bWrstyJh0czb/?=
 =?us-ascii?Q?pVilOx5EsfVSjfd07JGXXAab+csQAKpJLdeek/vwkXUQBtAo2CCpDn8BboaT?=
 =?us-ascii?Q?s+x8K8sqYML49s6Ku/iLmchupu2arH2aVJX+lOJAsfR/zSDGMDeip70a8iUH?=
 =?us-ascii?Q?G05UglYjA3f3hGHse2ns+eLd3IZvyT7oIM6gC/v2kvhcevVKcl/BKzhO8P4M?=
 =?us-ascii?Q?8MFVirn1ivZncmGv9MxXGsfQJ/KQaF5GNty6S55MNjzFBHCFS0sfOlZeiWKA?=
 =?us-ascii?Q?A/cgZI+CX1vcTpQvuHikJndfF1JzBJw3gm/XjpR44HobvzKhcKn8/683JaAX?=
 =?us-ascii?Q?TCP8tsnl5/xMzT8PIpbquvkRmmBzhrNl3HN0kMgghAc56vvfKDnAyD0nAbqO?=
 =?us-ascii?Q?Ohe+XkcoRx/JLx6vxw1HPVqm8SgqE7AW9MbhoyZ0IY4NticwqGgLvnB+t1nx?=
 =?us-ascii?Q?6FpZwjrVnVZLyBbSf9UV6LuPJbwzRp7A/20ZnY94oP9rHRLCMgz5x4+1gNkD?=
 =?us-ascii?Q?PshfGotV3EQ65ym/7z5sS4cOE1Nr/9mO248QFxc+6ZjNIL9slrumA6Bk9GcD?=
 =?us-ascii?Q?LiGnOURX4LWqw08A0yaDHxDgCIQIlgF3dFAwKHEY8M0lRi4VUprrIYkNy2c9?=
 =?us-ascii?Q?bcULZ/QSjldw8ncDfoVgsCf9e8gUfyT9u4OBX4760wN9k44yCQGoIGTF/We5?=
 =?us-ascii?Q?P3D/5TEXGgnWQBeDvQnJe3mc+bujVbLqPais+MdABTsK/G+KL102Ku0qU6OB?=
 =?us-ascii?Q?NdpUh1xpIBXxXPukMQwzPJe2OBcaRRB6otTOR2LMEMw2h5pHMD4GAujTq9oT?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a54dc5b7-f01f-48c7-aa39-08dd60e44f64
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 21:33:05.9430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WYvDP6jnuf5rHEODBUo2OOfoK+u8fcj5olauowwX2Gy6AXS1LtCrcA9eiFA3xnD8QHJ+mEf9L1SG0067jIT7ThDRGVnMdfbpXDsxWHD+yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7113
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

On Mon, Mar 10, 2025 at 11:55:52AM -0700, Vinay Belgaumkar wrote:
> The WA requires KMD to disable DOP clock gating during a semaphore
> wait and also ensure that idle delay for every CS is lower than the
> idle wait time in the PWRCTX_MAXCNT register. Default values for these
> registers already comply with this restriction.

I'm not sure about the default value statement here.  For 0xD00, the
default value is already correct for Xe3, but it is _not_ correct for
Xe2.  For the delay values, the default for MAXCNT is ~6us, but there's
no default value documented for IDLEDLY, so we can't really say whether
it will be higher or lower by default (and it may even vary by platform,
SKU, or firmware version).

> 
> v2: Store timestamp_base in gt info and other comments (Daniele)
> v3: Skip WA check for VF
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_clock.c         | 38 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 31 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>  5 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 4f372dc2cb89..067468c62adb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,8 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23C)

Nitpick: for consistency with other definitions we should use lowercase
hex (0x23c).

> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 2a958c92d8ea..0394292e777e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -16,12 +16,13 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> +#define f19_2_mhz	19200000
> +#define f24_mhz		24000000
> +#define f25_mhz		25000000
> +#define f38_4_mhz	38400000
> +
>  static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  {
> -	const u32 f19_2_mhz = 19200000;
> -	const u32 f24_mhz = 24000000;
> -	const u32 f25_mhz = 25000000;
> -	const u32 f38_4_mhz = 38400000;
>  	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>  					  rpm_config_reg);
>  
> @@ -40,10 +41,37 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
>  	}
>  }
>  
> +/**
> + * xe_gt_timestamp_base - Return the GT timestamp base
> + *
> + * @crystal_clock_freq: clock freq from 0xd00 register
> + * Returns: rounded down time in nsec
> + */
> +static u32 xe_gt_timestamp_base(u32 crystal_clock_freq)
> +{
> +	const u32 ts_base_83 = 83333;
> +	const u32 ts_base_52 = 52083;
> +	const u32 ts_base_80 = 80000;
> +
> +	switch (crystal_clock_freq) {
> +	case f24_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
> +	case f19_2_mhz:
> +	case f38_4_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
> +	case f25_mhz:
> +		return DIV_ROUND_CLOSEST(ts_base_80, 1000);

Do we want to truncate these values down to full nanoseconds here?  It
seems like that might cause a small amount of unnecessary rounding error
when we later use the value in multiplication.  Maybe it would be better
to leave this in picoseconds for now, and only convert to nanoseconds
later after we're done doing the math?

> +	default:
> +		XE_WARN_ON("NOT_POSSIBLE");
> +		return 0;
> +	}
> +}
> +
>  int xe_gt_clock_init(struct xe_gt *gt)
>  {
>  	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
>  	u32 freq = 0;
> +	u32 timestamp_base = 0;
>  
>  	/*
>  	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> @@ -59,6 +87,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
>  
>  	freq = get_crystal_clock_freq(c0);
> +	timestamp_base = xe_gt_timestamp_base(freq);

Would it be simpler to combine these two functions that both read from
0xd00 into a single call that returns both values from the table on
bspec 72056?  E.g.,

        read_crystal_clock(c0, &freq, &gt->info.timestamp_base);

>  
>  	/*
>  	 * Now figure out how the command stream's timestamp
> @@ -68,6 +97,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
>  
>  	gt->info.reference_clock = freq;
> +	gt->info.timestamp_base = timestamp_base;
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e3cfb026ac88..7def0959da35 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -121,6 +121,8 @@ struct xe_gt {
>  		enum xe_gt_type type;
>  		/** @info.reference_clock: clock frequency */
>  		u32 reference_clock;
> +		/** @info.timestamp_base: GT timestamp base */
> +		u32 timestamp_base;
>  		/**
>  		 * @info.engine_mask: mask of engines present on GT. Some of
>  		 * them may be reserved in runtime and not available for user.
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 223b95de388c..47dfc403b71d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,9 @@
>  #include <linux/nospec.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <uapi/drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -21,6 +23,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> @@ -458,6 +461,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
>  				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		{ XE_RTP_NAME("Disable DOP clk gating"),
> +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
> +			       GRAPHICS_VERSION_RANGE(2001, 3001)),
> +		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},

Since this is part of an actual workaround we should put this in xe_wa.c
rather than here.  Also, this is only needed on Xe2 platforms; on Xe3
the register already has the necessary value as long as we don't touch
it.

>  	};
>  
>  	xe_rtp_process_to_sr(&ctx, engine_entries, ARRAY_SIZE(engine_entries), &hwe->reg_sr);
> @@ -564,6 +573,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> +static void check_wa_16023105232(struct xe_gt *gt, struct xe_hw_engine *hwe)

"check" makes me think this is going to be a function that returns
true/false and has no side effects, but that's not the case here.  It
would be better to name this function for the action it's actually
taking, e.g., "adjust_idledly" or "set_idledy_lower_than_maxcnt."  Also
we should just be able to pass just the hwe as a parameter since we can
obtain the GT from that.


> +{
> +	u32 idledly, maxcnt;
> +	u32 idledly_units_ns = 8 * gt->info.timestamp_base;
> +	u32 maxcnt_units_ns = 640;
> +
> +	if (XE_WA(gt, 16023105232)) {
> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +		if (drm_WARN_ON(&gt_to_xe(gt)->drm,

We can use xe_gt_WARN_ON() for better GT-specific output.  But why do we
need a warning at all?  This is basically what this workaround is asking
us to do --- reprogram IDLEDLY such that its value is lower than
MAXCNT's --- so I'd expect there to be legitimate cases where this isn't
true before we apply the workaround, otherwise they wouldn't have needed
to create the workaround.

> +				(idledly * idledly_units_ns) >= (maxcnt * maxcnt_units_ns))) {
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> +					((maxcnt - 1) * maxcnt_units_ns) / idledly_units_ns);
> +		}
> +	}
> +}
> +
>  static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			  enum xe_hw_engine_id id)
>  {
> @@ -604,6 +631,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>  		gt->usm.reserved_bcs_instance = hwe->instance;
>  
> +	/* Ensure IDLEDLY is lower than MAXCNT */
> +	if (!IS_SRIOV_VF(xe))
> +		check_wa_16023105232(gt, hwe);

As noted above, we can adjust the name of the function to indicate what
it actually does, and we can also move the XE_WA check to here:

        if (XE_WA(gt, 16023105232))
                adjust_idledly(hwe);

I believe the not-VF check should already be handled by the XE_WA check.


Matt

> +
>  	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>  
>  err_hwsp:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e0c5fa460487..0c738af24f7c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
