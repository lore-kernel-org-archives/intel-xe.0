Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FC7F428F0
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 20:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5854010E1C5;
	Wed, 15 Apr 2026 20:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xy5craAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276C210E1C5
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776285689; x=1807821689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bYOTWCjnJ3phgZmA3kV/Ve9YAub+55aO8b6DAJv7WCU=;
 b=Xy5craAdAI/yUFJSdcrTNG8i842GIOy19xqlB5rVHYMIR2JnC/mFtqkx
 uZcBGTzZ9nlcpY2s/i8nQXZWNEQ+F13EcmPoezErSMD8GaYkFL6biPLS+
 3n7YqH1qOyLdbR7KQSw9HczWJYlVyEdfNstQSkxH4jaT9PPtT70VQG7u7
 dKxYXevHOtDqy85ZiamKv3IbJ9g1huG9O5DGsIRSGTF3N30Nbb9wgq61n
 9z2cbzI0KOxJ8/IZZDFt4w9c5nby2hZhErKSaFtugSXdmxT1QMLDN4lXF
 WwM3dJAUWZi/+YQzNekzDoDlXdcqJc+/3RVrO8rQXGcYibGyyYHLj3CKy w==;
X-CSE-ConnectionGUID: g8t4c6EbR7SuNTA163h/rQ==
X-CSE-MsgGUID: KE++GgoMQO2UdAOCGY7/Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81156507"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81156507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:41:29 -0700
X-CSE-ConnectionGUID: 5SDUvu5ZRp6CgaoHW6VUHg==
X-CSE-MsgGUID: FmHoz80RRpCJUl/PBhHeug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="225824929"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 13:41:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:41:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 13:41:28 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 13:41:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr3peiH6LCkzYusc6PlcGfk+hC+HbhoQomWL18eJUXCQJMpRACO99lC0xJWhVZ5K79ewf4A0Ti+xtWD4HWxL1J46K4uQ5ZGEAD+Rq3yMxQ7Yv/SO3ur7bBQ4WEliz3LTksPqxhYiYDmtuM9NWo3e+OgioQr281LuWEkSlfd2DviRmESaprAnNZhwUO6aH6vZY48fPoVG6OLcHFp+lr2Ntdy2Uw1yeNKh/hClcGLc0e8Ji+DSDmhg2NbdoehQ5WDu8OhBvl0pe7qBY8GV6L0xJw9um+++chlv/d0qz/hkgiUdXlcqvaFc4twARMW3bI+chA4oZ6Evh5qNkLFrkn4/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJboD6oCO0jcsP9Ys2kTzgPSAMN54wVo2eCq1AAlPRc=;
 b=INyZaxtEYKKDlWV1apiQM/xLm8Q5C1xPwFHH5cvggzH/SDxa/ohQojurM9yq5iN+GD4c65HPVUy7cPTRmpToOJewasJ797raektPL9XH7PAa26lmBQzOWtWJ9IlEY7Nh0glSY2k7QPTPd94jp5T6bCGLpZ4rxmPmUUZYXKo3XUs/l3hqjf3ZXOK7JJoow+FNEEhZo6yJ+i/VmLdqFyNvOU7dZOYC93QDa+Oih5usHG9cDmew0F6X0J+Gm616CDf9ec+ZpMk8PCTGXD7qA1suYSbO68EMEQfKZo5soRYiLgH6IpovL19yVLKsIj57+JzzrgkayfO2z1/3p2XIo4Luvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 20:41:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 20:41:24 +0000
Date: Wed, 15 Apr 2026 13:41:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Clint Taylor <clinton.a.taylor@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Apply WA_14026810691 to engine (rev2)
Message-ID: <20260415204122.GE755471@mdroper-desk1.amr.corp.intel.com>
References: <20260413200825.4054940-1-clinton.a.taylor@intel.com>
 <177612223532.459650.7562693023443829868@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177612223532.459650.7562693023443829868@a3b018990fe9>
X-ClientProxiedBy: SJ0PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 0662ca7c-6abc-4ac5-56d2-08de9b2f5c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IxZqLffDW1NGJqz1i9Y5HGtphqk+G/CQw3ehnEKHXg2FaQtDMgwO7BRzrFs3DQUSnstwUurxz8t8MLRZRXLpiyoOtJ8iC6I+gwSlfoSPDK+P6nXu6/STncaKUv37xhNVwCPStTmr9PxnnwVc4iHFDpWc/bsF2ZZfAefjda2SHg7aDQc0zgtTitXDlws33IqdJGTNKFuQVscJBtr3MD/dqdALwO3MmFi/y809MF/Ltrv/xjvRJY5uofR2OY9YldYb54KENBD5eRtfJveebzO8tTEU3x+i1ou1II53ipaSr01r25vF1HHFcfUUVbbUcQG+KqgQM5cxwZG9g0ZJjUiM09wOWdddoPBFw8Q25m7pOYS95DigsE+xS8iB9eI+NB/umWW88kMZsfppu9Ao+rxgsdc0XnDJvPpDodwc3LHCr17iuGOz685E/cj0Qy0tQPAFPnMwvLrDZ5b2YuHuhgr+nsnYSKFLW1qRpFD+qO7f2nWOchExLCyxfTaTQpL1hCQSb/T5+J7YeXtIZ1iky8WFl1n1359xueDX4bLLT4d+Bx2EbhD6i4qmSoA+DryC/pmgrx0ESmePqgeOZj367a5HPvoiqa6BZc4QgbkUjQGZ2iOef7cM2oQlHcWcs9KVFNDMVGqf6c330al37xSOyMGuykRl3NOsu1yMbWPRs+aA+wvoFY6o6HklK4moFkpqlUMy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5UDMBDpSKIJEvPD6nTwj3egLwWxmbNfO3ls28+HxGYhsxxcpdng1YsaEb/dX?=
 =?us-ascii?Q?q36DW2RL99xM1dZOUUCR24maPivNPrHD7SpOx+N3oLGesrY08uE6BgAzkTyg?=
 =?us-ascii?Q?zJspv4xGb4BZYNZp3JpFNLTVUGdR3XjOitgjPjqRazaVryE6btUhbSyyPeKk?=
 =?us-ascii?Q?RJqbde5yMn2We9eDYoOKH3VionT8WsIv9IZFPM8rEKs6W9crXJqdDo8LCquy?=
 =?us-ascii?Q?ha0CxMT9CmVZYRauSewjFpTJiOHiQAEktobKc6LBuuEWBJYwPZqffiDXp1IU?=
 =?us-ascii?Q?rNG52RUV3N7tYF5iE/OWoN5OaVSmjhmS2MQA1hJe/F7VGYLoKitDWVl+g1CW?=
 =?us-ascii?Q?MBPSF3+SkPcRGFzOu1ld1kkESHlRTnOHBAnOIc/NNMXHw3wmuyZwjeb+NzPq?=
 =?us-ascii?Q?o7anb03hDHGAbeNmfSi9PeKXVbdpDEibRb7enXp0ekVGI3UQrCU28vnLhQXm?=
 =?us-ascii?Q?oq+s0MHiJI7qFCD/xtZPiJFLn5+TCXRYkGnNAhUZq/FPAGBrzOmsxND8aHRj?=
 =?us-ascii?Q?GL7XVcy9VJMMuYM+5EGvYE2EJx1F1CWNL+hhIBDvTenp01zsIlWla0NKMZuH?=
 =?us-ascii?Q?3HG0ZNtIBIh+tyNITgBP5+2JBmafbPoosZutN+icZej7vdij6taUyBO+55Mc?=
 =?us-ascii?Q?okY8rODZbUzJ4vrVTNLIq8uqjjO+5/jWOukCvkzHZ/cqvLMofJAXyKJ8jDJI?=
 =?us-ascii?Q?tj2fwJ6agigS73Mb5rVmAAL43MizXgnb14Uxhudx4WMwPaQx8pmyKl9DDxxx?=
 =?us-ascii?Q?0r8rW8VuOdCuSwrL6VuyTKHAuOT9zAq3V0aaqj9UnH3n+fK8fC1iWmeJRIXl?=
 =?us-ascii?Q?6XjxBHQigKrQBP4wAc2dbIZNFPwv+2UHRItoJGUEahoI3L0/b6537/RI5y0r?=
 =?us-ascii?Q?y89OKtTG6U+FB6y9PRSkgeLDKvvFzY+tOpRh8Lq4sRgeeAhKxHSvW5uV5rXL?=
 =?us-ascii?Q?9CNLNmsCAzAbx43OHxA3UmMo0IY+qmdfmugt9W+ZowzcNBS/lAXTnl1SJf19?=
 =?us-ascii?Q?AUaqGmKDVGxxy1ZWSsDMvWJxzes5TU1aC8TT95s/UsDqXDfhTDGLxHDWgTYY?=
 =?us-ascii?Q?9LHYQDXQhiMObSOxs2nmcuuDi8EIveh1IixNlkzkit6pzANd9XeBf85GKxVT?=
 =?us-ascii?Q?YhQ6BnCRuufht0bB5puWbGlmkZ+gBcJptvO+YIt8bAXhevpjSJmny3ojYnKY?=
 =?us-ascii?Q?JLPqL+aiHBAl1jT4rEBGlkq+zO6sxjjuPEjVOeVoAP/tcAvsFKWKPj4i5mjq?=
 =?us-ascii?Q?VXmnTzL4+cflDSjbnBCub8N2uX0J/dCY04FVaXG+sdlDIRbw17a6gvXnYh+I?=
 =?us-ascii?Q?2XiTbFLeilZgc8dzEVavweEWRTmV3NzvyNa8uDS48VHzyGI1hsKaORbUCRE1?=
 =?us-ascii?Q?hiEWFKLXkOhLwMU8k7VHbwxRP0Z+87Wcv8KSdVkFQZi8d6ncY+tluOPfCUuG?=
 =?us-ascii?Q?joHsbtaOjk+X8pCnIWuLMAnokn/0bCzo0+eKBcbyLsb30aNQFxoYfsaa4/CE?=
 =?us-ascii?Q?FN16xdMcDq50Cdn4r9H2qj7prJMedCE+EaI5YwWyQfQB0q5xc4KpklJ2+qDm?=
 =?us-ascii?Q?6ahQwv0UFCAo6No7ndNzjJY0uyiwiBcYPpw3/j0tF+u/HuN21kL74HmvA5Bm?=
 =?us-ascii?Q?bH69lElKxI/UJnP3rIS1nL645fgE4Uva/8ITfGAT7jCNboNm46xk+P7YcJCC?=
 =?us-ascii?Q?chM7Knj8Il+k5SZPg1nuzA1WNOh0/S8atZy6fOSRh7P2TCihI4li1Bl8gAtw?=
 =?us-ascii?Q?CLUUnKSs0xm9bmUZ3ez4Hi0AgZ3t1cM=3D?=
X-Exchange-RoutingPolicyChecked: fD79cLaxtKAGEw+UVqXHptW/2w00oImLyNtHicOXRp06PAWA168LKdyK7HqAd7gOsvMVsjnGRz3MZHmV2331pB/X0MfcW1f+u9qZarkCcjTLgLfqiMm+7MpMkUutJSD6Qo75/Kkkwhl3bCVs1tRAcqa0YhcHYd0JBowlaT7il9RYBaB/ypyyaUBebXUor3KecM4fyuxQBFsSd/0Tl4fTAf0gZDmIPig3iMVOi1YmAJfhzUqLfK71jSaJuHvU4sa1uXL6VlqrfBRSDHWVu1HaGi0CKP+rAu6+4uj0Ela0ABCZ/Ev0CXdmRheN/xk8ieWnF6TVab+CfGCU2XhSkoKx1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0662ca7c-6abc-4ac5-56d2-08de9b2f5c49
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 20:41:24.9142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Bu5YSb9zvIkJtZpUbn+R0XsKLsSkDC8uLACsoDtvDAaSuKCIwkqirj5J7C/uv683DboqpmDixXKYs6EdqVccnjQK5VNo7Tx8p3FzIb5pT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
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

On Mon, Apr 13, 2026 at 11:17:15PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Apply WA_14026810691 to engine (rev2)
> URL   : https://patchwork.freedesktop.org/series/164657/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4896-773e7de886203adcc760cdb23af43037995c69b4_FULL -> xe-pw-164657v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-164657v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-164657v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-164657v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>     - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/3321

Not related to this patch.


Applied to drm-xe-next with the commit message / subject tweaks
discussed on the mailing list and offline.  Thanks for the patch.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-164657v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +6 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +21 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328] / [Intel XE#7367])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607] / [Intel XE#7361])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7621]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#7679]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367] / [Intel XE#7354]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +17 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +28 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2724] / [Intel XE#7449])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +13 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6974]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2390] / [Intel XE#6974])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7642]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +10 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#7571]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
>     - shard-bmg:          NOTRUN -> [ABORT][26] ([Intel XE#5545] / [Intel XE#6652])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2286] / [Intel XE#6035])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1508])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1340] / [Intel XE#7435])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4354] / [Intel XE#5882])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4354] / [Intel XE#7386])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2244])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4156] / [Intel XE#7425])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6126] / [Intel XE#776])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2373] / [Intel XE#7448])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2374] / [Intel XE#6127])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7179]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +56 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141]) +26 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +58 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2350] / [Intel XE#7503])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6911] / [Intel XE#7378])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#6911] / [Intel XE#7466])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7591])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7130]) +5 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7283]) +6 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2393])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#5021] / [Intel XE#7377])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7376] / [Intel XE#870]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3309] / [Intel XE#7368])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1489]) +14 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2387] / [Intel XE#7429])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) +23 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#3904] / [Intel XE#7342]) +4 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2330] / [Intel XE#5813]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6503]) +5 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2426] / [Intel XE#5848])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1499]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6599]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7636]) +26 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_evict@evict-small-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7140]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_evict@evict-small-multi-queue-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2322] / [Intel XE#7372]) +16 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7136]) +24 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6874]) +54 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7138]) +17 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6964]) +5 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_pat@pat-sw-hw-reset-compare:
>     - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#7695])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html
> 
>   * igt@xe_pat@pat-sw-hw-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7590])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_pat@pat-sw-hw-suspend.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2284] / [Intel XE#7370])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_prefetch_fault@prefetch-fault:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7599]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#4733] / [Intel XE#7417]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#944]) +4 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#6569])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][82] ([Intel XE#5545])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-bmg:          [SKIP][83] ([Intel XE#6779]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@core_hotunplug@hotreplug.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@core_hotunplug@hotreplug.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          [SKIP][85] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][87] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][89] ([Intel XE#1503]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-bmg:          [FAIL][91] -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][93] ([Intel XE#5625]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset:
>     - shard-bmg:          [DMESG-FAIL][95] ([Intel XE#6652]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap:
>     - shard-bmg:          [SKIP][97] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-remap-dontunmap.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch:
>     - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [PASS][100] +113 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-prefetch.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
>     - shard-bmg:          [ABORT][101] -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
>     - shard-bmg:          [ABORT][103] ([Intel XE#7578]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
> 
>   * igt@xe_render_copy@render-square@render-linear-256x256:
>     - shard-bmg:          [ABORT][105] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_render_copy@render-square@render-linear-256x256.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_render_copy@render-square@render-linear-256x256.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#2327]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [SKIP][110] ([Intel XE#1124]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#367] / [Intel XE#7354])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2887]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2252])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#2390] / [Intel XE#6974])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#2320])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2244])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#7178] / [Intel XE#7351])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2311]) +6 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][127] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][128] ([Intel XE#4141])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#4141])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#7061] / [Intel XE#7356])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#2313]) +6 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][135] ([Intel XE#3544]) -> [SKIP][136] ([Intel XE#3374] / [Intel XE#3544])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#5021] / [Intel XE#7377])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2763] / [Intel XE#6886])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#2499])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#1489]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][147] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][148] ([Intel XE#1729] / [Intel XE#7424])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_eudebug_online@set-breakpoint:
>     - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#7636]) +3 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint.html
> 
>   * igt@xe_evict@evict-threads-small-multi-queue:
>     - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#7140])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#2322] / [Intel XE#7372])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
>     - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#7136]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@priority:
>     - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#6874]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_multi_queue@priority.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_multi_queue@priority.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race:
>     - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [SKIP][160] ([Intel XE#7138])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-invalidate-race.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [DMESG-WARN][172], [DMESG-WARN][173], [DMESG-WARN][174], [DMESG-WARN][175], [DMESG-WARN][176], [DMESG-WARN][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184]) ([Intel XE#7725]) -> ([PASS][185], [PASS][186], [PASS][187], [PASS][188], [DMESG-WARN][189], [PASS][190], [PASS][191], [PASS][192], [DMESG-WARN][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [SKIP][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-8/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-5/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-3/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-6/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-9/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-7/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-1/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-10/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-10/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-6/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-2/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-8/igt@xe_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-9/igt@xe_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-5/igt@xe_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-3/igt@xe_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-1/igt@xe_module_load@load.html
> 
>   * igt@xe_pat@pat-index-xelp:
>     - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#2245] / [Intel XE#7590])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-bmg:          [SKIP][213] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][214] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_peer2peer@read.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-bmg:          [SKIP][215] ([Intel XE#6703]) -> [SKIP][216] ([Intel XE#4733] / [Intel XE#7417])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4896-773e7de886203adcc760cdb23af43037995c69b4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
>   [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
>   [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
>   [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
>   [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
>   [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
>   [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
>   [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
>   [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
>   [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4896-773e7de886203adcc760cdb23af43037995c69b4 -> xe-pw-164657v2
> 
>   IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4896-773e7de886203adcc760cdb23af43037995c69b4: 773e7de886203adcc760cdb23af43037995c69b4
>   xe-pw-164657v2: 164657v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164657v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
