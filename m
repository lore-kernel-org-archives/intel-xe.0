Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF33AD2A54F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 22:18:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1C610E9DD;
	Thu,  4 Dec 2025 22:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeAb1/Vq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63AB10E9DA
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 22:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764886723; x=1796422723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yluGiwy9YFDCV4u+TbbSS4Xop4M19nAJdzNg+cTLLT4=;
 b=FeAb1/Vq3vGNBa1d1U0kFAPRshGip1yAx8eY91jSdxgg9JKeVRXivpO7
 iY3twS5OrStUjLpQQmhw30okwmYL3+OJzPIH8kak0N/1PRYN0wemabK1Y
 usDUDrEqDayDgQK42HCdaZ/y/5gxRsHrWz9Bvvv/7lbxwRn8HcUgKsLAP
 ChcfjKszgqBmyGvRZo/qRLy3JQ6Jpy8LC7lpalBwZ1fkBMWk2QrJCpTuE
 fUSHZIx8taAFSetw0Fi0P9pA+lfoRAp18MV3fy2mKqTodhwGk5fmmYdeV
 JbZKgKGT26ZMybekRg26cB3dG9p6xji70cl71tr2+cCBiVA9aQpNJtW7C w==;
X-CSE-ConnectionGUID: R+NmZVBeQNC3erFf/7G6GQ==
X-CSE-MsgGUID: yCQ2gcWLSe6WiL1eowoDaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84526649"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="84526649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:18:43 -0800
X-CSE-ConnectionGUID: Qt5nvZfZSuWQHxIlNe5h3Q==
X-CSE-MsgGUID: YEJshZHKTnKVvtfIGxpehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195530736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 14:18:43 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:18:42 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 14:18:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 14:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPcVE1ryFT6zA+V2QxSmAjZREOIy5Ash636S1iRBaiTr5EQvkVI3adv//x/xKo0GlWMEM4XwKrchfAqEB+7dQN7/fWWRrkCLENt73x/NVduOnSlrHsxoNGTfibCHy7zkaBMAWiXJ+W3i1nTqGNEwJYTZj3bEZzeb8tC62j+fon52qxCUwghMNXNhtc3PtZ8Pi4k4O4RmMGBhQZKML/5ySrzOlaEPcu6axMr/LSbIj2BouVIJh1JfVfpLT8Tg2KacwxTUdWKWWPEVMNuu8/sdHiksfkeNOQccSyzVfjZ7VlO/uQOf01oVVEeIhPxpAlxT8ClT42X/ByrBl5EzgKWXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WElOelmbdURpdkP7feB3AokxcyLCMtZzXZxMZtvy+7A=;
 b=A50iChD/K/qS3YYz2itC1Rm6bbB0kAzDKrkiWsBq5y5k2+91ZNnN4tUD4fDr9RJpfGvwbXrE8iIXDGVVk7h1YckusGlEmp2WYAp+UHXnQDXdYIZ4Hg5a4IMbxuOmex1aP77i0mJULrCw6tUWjKSmJiUDwff+E8Z74rn+k0s29yAsJC7QJkI7XeS7/0ckodqbN+X60rj5BOeNweowqslUxw5aLIfkVhV8BWSuan6EJr59RXqjzU3F79GwGs9tN/jVNppM4MXu8DsaVQ94VEutlXlzPEOZF2+ILVNUyKa4zukIHR3Z/2y/SMiYO/tOLiqO7MaycufnEgDc1gJOqa6DFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 22:18:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 22:18:38 +0000
Date: Thu, 4 Dec 2025 14:18:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v1] drm/xe/vf: Stop waiting for ring space on VF post
 migration recovery
Message-ID: <aTIIu/1i+9lpq4GL@lstrano-desk.jf.intel.com>
References: <20251204200820.2206168-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251204200820.2206168-1-tomasz.lis@intel.com>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0baaca36-f603-4477-cee3-08de338312f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZHykY+TKkcFxEmhB267zDf4LtYXDY4CEbAXiBayoo7/ZBgTXBMzGe6clBLCN?=
 =?us-ascii?Q?jOF/8xKILi1yDLA1ADGwdZIkF5n3svltheNrydvQ1JBmLC/VemlWMlx3fujn?=
 =?us-ascii?Q?bat2jmlpQKpQw6S4LCXrH7wEDJQn6RtpOl/VO4C2YluBnZvB/MIOd4fdBhq5?=
 =?us-ascii?Q?OLc/KvM0Bu3AsQHHBTVI47sKlPk8hOb7REmwUaQ+FmaG7REYhUGO9t+iImwk?=
 =?us-ascii?Q?cOAPCQFD1Smile1WzWksjMFJ7xPcq1LimA7wmvOSOSM6K5zCXKIKDD2G2asn?=
 =?us-ascii?Q?G/OGzV6pVBLJF/y6ID85ZLk8+2i6/MxisjC4Fj5+s6/MGuNJPzfLoJf2Mrar?=
 =?us-ascii?Q?Em3iG2ThAKFwMpmRQLAyvik5G1X+MnXgd6NWgj7TlW2FRJsAHh+f6nRJj+eX?=
 =?us-ascii?Q?EffC1Ol3uv9nhNMpRIqpDQXIBclcmUPDCsbIZZUdubu9l0iTdho62Ldwo1x2?=
 =?us-ascii?Q?vzbUC8VFDr99W8jFnW57jjYZj1OxhsGrL7Ar8X6y89kaBeDJWSvhwP9UVAMV?=
 =?us-ascii?Q?fnXZt9tdzYhtNGJ8Xw8yrJwZIGHIVUuqDO2JzN+mR3AmZhJXJqlKg8xjM61A?=
 =?us-ascii?Q?v0ApdXbs+Y+ivnW2tfNey6Da06npI5xaVFTA7W54iIqKVZZLdQUV+ZSu9P1c?=
 =?us-ascii?Q?Qdx/8veYb5tvT2IjyXmb2foD5QYtT+j40htF5rX1LF5gNhM3Sh1+fiDChH5+?=
 =?us-ascii?Q?zh82MN7yop5cSSJaAwSKp2JIb4TQsujqUWo8QZ3VFXiId2C6WX/ha56thW5Y?=
 =?us-ascii?Q?PbjNlu3LHtM+D4IYlpdob59BiyZ86Gz1TNjxbCk1Ttjb8Z4sTovxN9yrgmh9?=
 =?us-ascii?Q?Vy3xISocd5A7CkOXocRPKTntYtNVRa8JYqPLvEzeNdMxXZF8ENOn90D2yPLO?=
 =?us-ascii?Q?je+37By2r867/O6MmqLUVAG50rf7H1Km2R8FxHkpGDj4w+SDzBX2DgezsA3G?=
 =?us-ascii?Q?QVpcO6ttrqQbNv81fZXmIiuG5ZEZvSOBJp+arzYj7CdwDfbvXoW9Gm7TQ0mZ?=
 =?us-ascii?Q?hZPiH9RpbuMvvoIIV/qGBYUr+yAIgsfnJ2If9FuELCMzmgljH9Ndjo1Caahy?=
 =?us-ascii?Q?/UtNeAj8HlWBW0zn64RRxPZf9WSX8obY1sHFGlb2DR4qJXQyPuw9jOlqUyN1?=
 =?us-ascii?Q?BvSbGARFjtuIhrWBRVVI2hDcD9Q+OkQjzRMtFdl9Tpg8xX4sWQyNGXxnld2a?=
 =?us-ascii?Q?QmUz6bzEb+GqYPsfmXdciU8tZX98w/JcjMOlH0j4IoILHOpNvMtbcmyGeOQL?=
 =?us-ascii?Q?4q/yeXEgmU2nEvM2j8qbjjPkgE9rp588rhcbnB+oClbqTxmpYztq5toythXL?=
 =?us-ascii?Q?Qoc4DAols3xBqpIAFuePNiLjOlkbZUe1F+TOBj3ulPQiHjZUAwmo06UJP5sy?=
 =?us-ascii?Q?uge03q+KZPdCBNd6ejnwOIW6Rr4BbGX5ogyHb7glS4cOviPKhG6EnYHZs3vy?=
 =?us-ascii?Q?Ury8PLhgUVySUML14tId5TdVe3PTM0GX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUxQVO+xXJ/CWSquhPpsqu838uHI3zy554032bGEMUonoQyqTYpEi6ce/ovU?=
 =?us-ascii?Q?PYX7J+OE9PljyDvlmmD/NWDbWsSm3oz5s4onQu3y0B0p7jaAkNprVLd63O/b?=
 =?us-ascii?Q?xMQ6PhJ3TGrQKxU6tEYtn2tDgPvxofkjtnXIggtaQdyqhArA+R3h+c3hzRTS?=
 =?us-ascii?Q?Sp4tQJnsT55NTT0Xrnq1v0Aau25AJQ9PZKMoYJKhiXU0R11beR2oyO41lc9d?=
 =?us-ascii?Q?PLDu5jshqLtBkiEr6WbMpH1aTBc5yXn+UoZKL5AYdlVTkMpH6zTtCWH0ORvr?=
 =?us-ascii?Q?A4p4lxlsSKjzcGlsuNMBRyAK2tTXTMa21aRhrhCkoqojdX69vLYUafW4B2GH?=
 =?us-ascii?Q?KLyEHTH1Sry3rMZ/fa7KbOQWBGB15b5W9++G8cMosh2ACkPzOG6lthvZ2OhZ?=
 =?us-ascii?Q?0Z3UKEJcN49Ph5e0RWbTd92Xe9YNcREwhEr3oNqp4ldI4ST7Phxctta/4gIh?=
 =?us-ascii?Q?9iKlBHI7OCfDmU6EAlqmZ25/UeLEW1Wun8H1n9byYHE5NLZpgtVgl+2Wn8Q+?=
 =?us-ascii?Q?pmncvowJnhpO9a+xJ2bBdI6Lj5StCRzqUqSLT69xUU2fKjp6IX20wsNvIvMZ?=
 =?us-ascii?Q?R03StjvJQrPlVgvB2etipEmPmB4hlQaS8yGSObjzpOy+7qZqpZ/RF12Y1Ed2?=
 =?us-ascii?Q?aijLpeKOBHdU2N37CeKg326ALCb60NWshr3AODY6f9tWFoXuEjiHRz/xXZAh?=
 =?us-ascii?Q?hSyC4him9/5xqtm6iaPLGct4jFrlFl2h2Pc5aDDsddEB6eqzOvC5IkTaEZpk?=
 =?us-ascii?Q?9IqN6KFo4FARZwGL4VKkldq5DSpSGqRuK/gRe+luZb36dm7gFjJQguYzIM6S?=
 =?us-ascii?Q?w2i8m3Cljo693+rzX6MynHL784mqzbAIFwFf6zwEnACQ7YTEcNcS7mqPKEfF?=
 =?us-ascii?Q?fcGTmDYaIr5kZRZzRX2ag0Nre1Zh+BjXQgrVz7dV63WStAqx0OO7XSCtpsHU?=
 =?us-ascii?Q?fP+9RbGmywIN98l+PYLHp/M1DmN3fJ4IeoQSKhVMwZ0rwRTlM5ZQcI/8ONqf?=
 =?us-ascii?Q?zWG0CyPN8nNvXXumJBRPrKgnBBBkKEnq4hCet6Glaj9/wEpAUKHcucg2Vfkj?=
 =?us-ascii?Q?djKyc6gh2GENDIUzmL09lho3/NYPlAo3QW9rGWYsTcvpwofKitomUGXohTiU?=
 =?us-ascii?Q?cV8gawumPlspDfxQ7D+KlDl+zKxq48AIZ93t/g7pkrwXVsoBvGy2RIM1F7BV?=
 =?us-ascii?Q?45D2yDqKKWoCyFg1MdhlHci4KufDBVOvnThgSqS0Gb+Urb0vrNN7SQKHijeu?=
 =?us-ascii?Q?JlCmfKO8byT4DJwGIt+Wl1QZa1kkUsEqkCW3jDnM+G180wtfE1pZKwVdq+4F?=
 =?us-ascii?Q?eTCIuNuxLpVBih9NGQHxUsepd76QJGcYEtmBfOr0x2kjiRZh0rYcXGLmG2UJ?=
 =?us-ascii?Q?q33F0IQiZP2PmPdne7qrC+OwkHvF88SsR1lAnB/758WKV4ldZu6GWCsLzsoY?=
 =?us-ascii?Q?bP5HFUZabf6gnor3cwxNEh+deuT8I4yKGuxvt5t07Mt/abx63KGIrSaPloCC?=
 =?us-ascii?Q?zVmLfNGYK03Go7JOWNigVNyq0OurEvGNzPP08f0Rjj8A+VmrAzlWMw8Yg5Pw?=
 =?us-ascii?Q?qAPgN11nebQjkSWMVA7KHThvWrmOFcqGeh4qqlbFcMExMCBlBRU/ydYngbCU?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0baaca36-f603-4477-cee3-08de338312f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 22:18:38.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj0OcierrovVFYr6LUAFOw5sz9HpokX5JUi0ReH/Pa6LW2452R4vrWvA2kH9rlt6cqR0cIQ5eTWwa7hm8p9VVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

On Thu, Dec 04, 2025 at 09:08:20PM +0100, Tomasz Lis wrote:
> If wait for ring space started just before migration, it can delay
> the recovery process, by waiting without bailout path for up to 2
> seconds.
> 
> Two second wait for recovery is not acceptable, and if the ring was
> completely filled even without the migration temporarily stopping
> execution, then such a wait will result in up to a thousand new jobs
> (assuming constant flow) being added while the wait is happening.
> 
> While this will not cause data corruption, it will lead to warning
> messages getting logged due to reset being scheduled on a GT under
> recovery. Also several seconds of unresponsiveness, as the backlog
> of jobs gets progressively executed.
> 
> Add a bailout condition, to make sure the recovery starts without
> much delay. The recovery is expected to finish in about 100 ms when
> under moderate stress, so the condition verification period needs to be
> below that - settling at 64 ms.
> 
> The theoretical max time which the recovery can take depends on how
> many requests can be emitted to engine rings and be pending execution.
> While stress testing, it was possible to reach 10k pending requests
> on rings when a platform with two GTs was used. This resulted in max
> recovery time of 5 seconds. But in real life situations, it is very
> unlikely that the amount of pending requests will ever exceed 100,
> and for that the recovery time will be around 50 ms - well within our
> claimed limit of 100ms.
> 
> Fixes: a4dae94aad6a ("drm/xe/vf: Wakeup in GuC backend on VF post migration recovery")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3f2c8556a66..ff6fda84bf0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -722,21 +722,23 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> -	unsigned int sleep_period_ms = 1;
> +	unsigned int sleep_period_ms = 1, sleep_total_ms = 0;
>  
>  #define AVAILABLE_SPACE \
>  	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
>  	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
>  try_again:
>  		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
> -		if (wqi_size > AVAILABLE_SPACE) {
> -			if (sleep_period_ms == 1024) {
> +		if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {

Ah, yes this was mistake on my end. The intent was to bail out of the
wait if vf_recovery was in progress.

The wait / sleep logic looks better too.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +			if (sleep_total_ms > 2000) {
>  				xe_gt_reset_async(q->gt);
>  				return -ENODEV;
>  			}
>  
>  			msleep(sleep_period_ms);
> -			sleep_period_ms <<= 1;
> +			sleep_total_ms += sleep_period_ms;
> +			if (sleep_period_ms < 64)
> +				sleep_period_ms <<= 1;
>  			goto try_again;
>  		}
>  	}
> -- 
> 2.25.1
> 
