Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE1E77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 20:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916610E482;
	Tue, 14 Jan 2025 20:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhdYhq1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5910E482
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 20:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736886253; x=1768422253;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=92a2sq2OjRoCBfIeMbU7JVHPWsJIEJlvaWrZ9xrKhK4=;
 b=MhdYhq1f2/3qhILXJfyXwbJTx/ztk2Mj0XarDYj1cK0i+Ed/KD30yE0k
 64bddhXxXM69sPRxaifQUcjhxrL6/+hyRl+LVA9b4CHGlF4w8IR9A96nN
 hbmbNfarkphsaednq7qoCREFR1aFGwM0oba+yK+ja3ptVNMffXaGtKdpY
 983SPl4AZ+JxthMBm/mrwfv01jM5z0ec5gjaWWLCyc2jiJLaKrGp6TjIa
 mAsJ7M/dRdJnl+nkJ7u+p6gQSMThVDClyDIgHR4G3+aA5d36anX1GjJ31
 CWb8x2XMzm2D2Sq2RprSHSdqE60HdfNhBIFawJEW7SbBHcCiB/g8FOZJO w==;
X-CSE-ConnectionGUID: hWo3qwUJTBWjcLbeAxrltA==
X-CSE-MsgGUID: 2xw1sIqqRKWfPUCFVnqxmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="48587572"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="48587572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 12:24:13 -0800
X-CSE-ConnectionGUID: cdlCq3V8Qha28ww+9NP8CQ==
X-CSE-MsgGUID: aW0HD/oXQXeRcXNclJIDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108971600"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 12:24:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 12:24:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 12:24:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 12:24:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIs0e0X1zVrt+kxkC7RYiApn2ihCDS/vZJ3LEisBhNKvJvPNTVJnfetI7KrVzgLKRReYkG+WQZZ4hsWg9+ihL0isf92aob7uKqwV8lGaqs8qZDd1SajpAi4teej258zN4lv19aIEB6OOchQ83JamjxyYvJxn2lubNMnorD+IAztF8B2+ne2XaVd0MXwvE+/4B0uU+C625JXmwBvaUIYbl1+I/wM6h9wExLRiEgbYVkD66BZMFRY3zh9gs65PStuK+/TDx65xR7sAw742kOal1JQ3f6+BFCbRCtzHWAfCwSx2ix8oxmyz6iUrVXbGGLV4ecMTgNuA5n0bGbwQAgVTTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLX0ybh0oVirzKr/TESDeIiQ5z0DeTdogQKAc1/6ivk=;
 b=TuVeFz47jRHncNTD60P9zabnpp4JJdRkTmJAFgWT4bI6th76e1YDCiH7iUwDPO7XMQQG8ilF328CezvGhYmIKdWR8Y7l9WQl+vZoS+E6Rn2fnKGvxnDrLq8AUEkJQ9fJ5ZzDPk15wihr64HK1zQTXRDI2wtksH6AtL0JKcpDIdvYdyU7vL91ANNAUwtIjbymL+KCRI+lfy6vXDkWTkr8mRjxx4zsi1Yt13MwlDNe2zO6Jk/7C2ajzLRcDghWk00ByKSkXvDFgJ/58cgQhonSRxAuQaof6I19KmTUdlHjooJynR+X7rPmBdDC+5yNfwdqzSGkQQFPrtxIi20ehCkO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 20:23:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 20:23:25 +0000
Date: Tue, 14 Jan 2025 12:23:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe: Remove unused "mmio_ext" code
Message-ID: <20250114202322.GB5109@mdroper-desk1.amr.corp.intel.com>
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
 <173630567433.1154248.6605545964709945412@b555e5b46a47>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <173630567433.1154248.6605545964709945412@b555e5b46a47>
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0f364f-f765-45cf-2f88-08dd34d94c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PEgLiZRKtqguPXSsjb4ZvewC21KcIkxPvvPutTMFQKZFgnZxVmKyDhyVaTc5?=
 =?us-ascii?Q?QUgX2fIoZumOIjo5oV900cc8r4dor2q6s8y0IkWouiJuOvBTk46AVf/nCsWJ?=
 =?us-ascii?Q?RIs5J8B98OUMveQW2EKh8rasotiGW9w6WYx3gU1far4ZVfq7AZjR3EopX9ld?=
 =?us-ascii?Q?1Rq4EZsF9I80JCTzl/ZzbNGvsSaVAxlxHIJlO8ZiwJkTdJNxAPa0iTFDdQkt?=
 =?us-ascii?Q?QOk2SMx8H7NiAaJIH56K/+sx9oM0egGiiA3TcYgS6OMLALJaXZfveuegCb9+?=
 =?us-ascii?Q?+QJju01wX+BJ1ybMj4uWJaYzWgmacNS/l8w4kNRdS79I7n/cM8ENI7rjbMZf?=
 =?us-ascii?Q?bKbxflmE3Yvh70XBcUc25RUuh1+FbFGqZWP8BrNnCxbUoP8LrznQ82kO85Wm?=
 =?us-ascii?Q?icwZm2cueFxOZdVyewSfGw9t6FdL2lOniW9F+XOwAhzuGt9ad2+J27HhrBa2?=
 =?us-ascii?Q?iWzDjYqvAtpqpFqrcadlv7Ok0Z/nmwTzKA/juRHOZ8TmNe0bmn9Hy99Hx2s2?=
 =?us-ascii?Q?SOXpGPhefcTyIj+LvcMNQL446+s5XuYEUCFs4EZs04lo0TwRtU6NpvY4MoyD?=
 =?us-ascii?Q?zqIeKpcX+22GLpftPsRyuQnmNQAPLQegKJLeKuZFkknwY8SL0F5ahSOEwfv/?=
 =?us-ascii?Q?5n6NuCFRC5TzcfKZgRMrVK68sX5Pnq+nkStfDpRLRR5hS36xiBK6sbahDa2u?=
 =?us-ascii?Q?qBZ+0KPdKhBOO/aXTVqwDvh6MhkZyp0cMjVypUUk/n2cTczX5BqYOodOU0Ya?=
 =?us-ascii?Q?xZY/bzyf1fcDpwrJPNR/wOXGfEvLzalOYA8k+7n5PGbRKspqfL8WoXsvn0hH?=
 =?us-ascii?Q?/Z2Yiixs+ookGZJyO3AHCVK7Buh98dTU71dy/vr98zGaJvFCSk4UE+8yC2wA?=
 =?us-ascii?Q?xLx7q0M659wtlqueRxAz5C6pqDTGuJB4ja/6sYwTX78KEo5nzEZtwajkXxE/?=
 =?us-ascii?Q?oT8j41ci4l7iV1TzEFCZKCQFxzFwTH5RpeqOXn/dt74LQjGzULz5VsCWKTSb?=
 =?us-ascii?Q?ovYvfeu24uHMHE2E+IiEPPnFsmdcPWumpAwYvzJm/0RlA3WtvPKEmt7+uncY?=
 =?us-ascii?Q?iU9gZ8qetnYKcieFnEmlLwvhmuBdlbMrezZRBhu3OvMMm6CM8nFsA003+i0g?=
 =?us-ascii?Q?U6DIWO3QrRzJ4VuwQU1oTQtMqHfr9JRnyIFj7P8M9Ivzuc2NwM3L/DfJzpEA?=
 =?us-ascii?Q?A3+7HjRKjQu2c2wmtlA47dRBOALgmsBqh9xMtkr0zfohGdmfv4ImfHwqOXP7?=
 =?us-ascii?Q?g1/gwzhX3Zwi+5zBwtrTOFrHdFpNslCu6SbgxbTTQfxnTeQCEP6V8a+Bu9ND?=
 =?us-ascii?Q?n3dUHut8mmnqvY2AAViOhbz/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?smIrbc07Az9MuWZRpDy1qrRwW/O63Q/Q/Qj5zf7Kx2FwCyqGZWARZ8trdVTM?=
 =?us-ascii?Q?70sLMN8+F7UvVP8/vdu7+xs7FRZvFUmJNE7xkhzMb42vVlW8W0t65mfFnWrz?=
 =?us-ascii?Q?PJ87A5bfDw50LFuU+yeyLgKOe2uPI45Eod7AD8AHaulvcHOnASfelGxmbdHd?=
 =?us-ascii?Q?InJHLR2aw0+IbPpcQlRUYUNx51LN74Kx/NSUB053l4epShTJiSS9lkemr8J2?=
 =?us-ascii?Q?jQLPdmYK/i1pexRMwrWneqzoLL5dtVG+LIIyaMi1cHHz2fL/lc2+Au+PLWnO?=
 =?us-ascii?Q?9tLxFZXkU8Wf4gqvuGLONWaI6JQukbp9p7FUehjBaT5nLttFd7fyp3mgcWd9?=
 =?us-ascii?Q?Ch6q9ZS/oEQfeVa/oA/Hn2OwK8rrRO5KTK68mKQKrRw3gUHM3KLKoPZLxoMQ?=
 =?us-ascii?Q?5bH+gzknP/P3bA9tqRgsoOZZQQCff5gRRYlBcICuApEFEybyf6JJtzs2+mU0?=
 =?us-ascii?Q?j3Wocq9qnDsUVUfc17xCWH7pO7/U+8f2ts/qLjHvfvPQKV0++kiEC7U3o8uM?=
 =?us-ascii?Q?SUlTrGwTd5F1ek82vu7skRMLYNcYsgkGAYCA2cfpVf0JTyeqjMl7WTqeq36n?=
 =?us-ascii?Q?MebtPZsB3bFLX92N9Wts6QqLBguIK8OabFw5HLUPTkkkdi528ml3ePD5FURG?=
 =?us-ascii?Q?4j3zAEYrlI42LxWBCwT2AckWMTe7wcfzz0oyY8PZLYoSstzw2NTbWob/3EPU?=
 =?us-ascii?Q?7woEtmgkHfjQYDGIIDa/kcAEg1G2Y5+mkbxT8SNOdAA5Mkes/nmGD1arS/dA?=
 =?us-ascii?Q?2wk6cB+PSwf72Zz0YJfny+0HL+EAUxZDZs1hlvNFGsm7aQwlwH8zJ2z6J4rO?=
 =?us-ascii?Q?863ux//R6KwQP2X5i968QMw5xkS9YqUKCOzt4ptLkt4uukjcbgpkjns9yUkl?=
 =?us-ascii?Q?0+hKPLp32KdJnuU1PD5KcnREosZaHIlTOCEEalBEni2mh3TlswEhtNoqZxmm?=
 =?us-ascii?Q?f4J3rA9Tr8Z1wiAZCjxEtFYv1sXDCgTc0cm2q9bcEgUHG4/+BgB/Stvi+b2O?=
 =?us-ascii?Q?HJZQcANMhItx7KVbEdBI6td7Wb6i/z4mO0/i4kCUUSqpWw57dyZO2ZughIAp?=
 =?us-ascii?Q?PNKqLx3ikm3BRKZUJIZ/Pisxvs+hF+56Qq68pPvoc+C7ROfy9LdiRgR+wdSx?=
 =?us-ascii?Q?Zi4mjkwvpVv3x5gMjRGNqEDd/Lwg6FS8ZwZIR4VjMrlK771ssVWHPL77Ebzd?=
 =?us-ascii?Q?mEg1XiZi5EEzekttbJLchHSZ++GAFfkFt/alXtadWI9T8uxOROU2Z1rrzksf?=
 =?us-ascii?Q?ls+Y8CbRqDn+8HWiQqyow3PpW60uZ0B4rZisEhXPvxjP0khhuF+0ELXaHLOT?=
 =?us-ascii?Q?J6mx8rEWYKRY0pI6mSrBya9eb5pTme/Xy43YnN3j/V1aRQOJ3XXRT/xaCiFI?=
 =?us-ascii?Q?f13klzhdEDqakBPmq4eAxuLqdVVGSmPRTWDOPFDMUO+kN4lBTfzea0ZrgAJ2?=
 =?us-ascii?Q?BIclyWQkp7Fl6mkqsYXO+7fgIIYXUA0/7+9AcbuIbzdwdEwwOK9wxSSTSsOw?=
 =?us-ascii?Q?5VXasi2fR8tZrm0jqy9rG6s8vwC5TF8w1jODsP5OyjP+OZO6VOeD1EULbIz7?=
 =?us-ascii?Q?0+C1xbSg8d6GSoiY2WjyV/pD00iznaSKpKZTM8EJCga3CHIzuOohqS/K5C00?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0f364f-f765-45cf-2f88-08dd34d94c34
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 20:23:24.9857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgDa9tNYOifNycdouL7inWV0xosgKKCUqceonST+T6OUcXFlqQyPAoSvz9eLWuQIxwH8nBPZDShYztmklQNMOZ/2sPMxS/rQxf3juDyaTNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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

On Wed, Jan 08, 2025 at 03:07:54AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Remove unused "mmio_ext" code
> URL   : https://patchwork.freedesktop.org/series/143166/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421_full -> xe-pw-143166v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143166v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143166v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143166v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@busy-flip:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-lnl-1/igt@kms_flip@busy-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-6/igt@kms_flip@busy-flip.html

Seems to be a CI glitch.  CI thought this was incomplete, but dmesg
indicates the test did finish and pass successfully:

<7>[  405.461626] [IGT] kms_flip: finished subtest busy-flip, SUCCESS
...
<7>[  406.587452] [IGT] kms_flip: exiting, ret=0

> 
>   * igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][3] +12 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_vblank@wait-forked-busy-hang@pipe-c-edp-1.html

<4> [433.585238] xe 0000:00:02.0: [drm] GT0: Check job timeout: seqno=5820, lrc_seqno=5820, guc_id=0, not started

Appears to be https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3876

> 
>   * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][4] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

Another CI glitch.  CI reports incomplete, but dmesg shows the test
actually did complete successfully:

<7>[  568.664506] [IGT] xe_spin_batch: finished subtest spin-fixed-duration-with-preempter, SUCCESS
<7>[  568.678951] xe 0000:03:00.0: [drm:drm_client_dev_restore] intel-fbdev: ret=0
<7>[  568.679296] [IGT] xe_spin_batch: exiting, ret=0

> 
>   
> #### Warnings ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-bmg:          [INCOMPLETE][5] ([Intel XE#3663]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc.html

Seems the system failed to enter S3 for one of the subtests.  Not caused
by this patch (and possibly not caused by graphics at all).


Patch applied to drm-xe-next; thanks for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-143166v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_getclient:
>     - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2423]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@core_getclient.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@core_getclient.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#1885])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@core_hotunplug@hotunplug-rescan.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#3453])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@fbdev@write:
>     - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2134]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@fbdev@write.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@fbdev@write.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][15] ([Intel XE#3781])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_async_flips@crc-atomic@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#3908]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1033]) +1 other test dmesg-warn
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1467])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +83 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +9 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2252]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2320]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2953]) +3 other tests dmesg-warn
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#2423] / [i915#2575]) +77 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#3226])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#877])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2286]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2244])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [FAIL][47] ([Intel XE#1695])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#2882]) +1 other test fail
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2597]) +1 other test incomplete
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#301]) +3 other tests fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
>     - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#301] / [Intel XE#3321])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][56] ([Intel XE#2597])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#3879]) +2 other tests fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
>     - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#2882]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-8/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:
>     - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#886])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-8/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
>     - shard-bmg:          [PASS][62] -> [FAIL][63] ([Intel XE#2882]) +2 other tests fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886]) +2 other tests fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2293]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#455]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][69] -> [DMESG-FAIL][70] ([Intel XE#1033])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2351])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@basic.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +16 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#2333]) +4 other tests fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#2136]) +29 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2352])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +12 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#656])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#3374] / [Intel XE#3544])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2486])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#3974])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#616]) +1 other test fail
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2763]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#2763] / [Intel XE#455])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#870])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - shard-dg2-set2:     [PASS][91] -> [SKIP][92] ([Intel XE#2446]) +3 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1489]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2414])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1127])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#899]) +1 other test fail
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2168])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1499]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_vrr@flip-suspend.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2504])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2905])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@xe_eudebug@basic-vm-access-userptr.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#3889])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2905]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#688])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_balancer@once-parallel-rebind:
>     - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1130]) +159 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2322]) +3 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2459] / [Intel XE#2596])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126]) -> ([PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [SKIP][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146]) ([Intel XE#2457])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-5/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-5/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [PASS][147] -> [FAIL][148] ([Intel XE#3546])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@xe_module_load@reload-no-display.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#2284])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][150] -> [ABORT][151] ([Intel XE#1358] / [Intel XE#1607]) +1 other test abort
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-6/igt@xe_pm@s4-exec-after.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          NOTRUN -> [ABORT][152] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze@gt1:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][153] ([Intel XE#3088]) +1 other test incomplete
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt1.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#944])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@basic:
>     - shard-dg2-set2:     [FAIL][155] ([Intel XE#3440]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@core_getversion@basic.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@core_getversion@basic.html
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1885]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@core_hotunplug@hotreplug-lateclose.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@fbdev@pan:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#2134]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@fbdev@pan.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@fbdev@pan.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][161] ([Intel XE#1033]) -> [PASS][162] +1 other test pass
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][163] ([Intel XE#3862]) -> [PASS][164] +1 other test pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-bmg:          [DMESG-WARN][165] ([Intel XE#877]) -> [PASS][166]
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [FAIL][167] ([Intel XE#3321]) -> [PASS][168]
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp2:
>     - shard-bmg:          [INCOMPLETE][169] ([Intel XE#2597]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@c-dp2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#2136]) -> [PASS][172] +21 other tests pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [DMESG-FAIL][173] ([Intel XE#1033]) -> [PASS][174]
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][176] +6 other tests pass
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
>     - shard-bmg:          [INCOMPLETE][177] -> [PASS][178] +1 other test pass
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][179] ([Intel XE#2953]) -> [PASS][180] +1 other test pass
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#2446]) -> [PASS][182] +1 other test pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-180:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#2423] / [i915#2575]) -> [PASS][184] +75 other tests pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][185] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@twice-virtual-basic:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1130]) -> [PASS][188] +130 other tests pass
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@xe_exec_balancer@twice-virtual-basic.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][189] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][190]
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-adlp-1/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [ABORT][191] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@crc-atomic:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][194] ([Intel XE#3781] / [Intel XE#3946])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_async_flips@crc-atomic.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_async_flips@crc-atomic.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][196] ([Intel XE#316])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#316]) -> [SKIP][198] ([Intel XE#2136]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#316]) -> [SKIP][200] ([Intel XE#2136] / [Intel XE#2351])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#2136]) -> [SKIP][202] ([Intel XE#316]) +3 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#607]) -> [SKIP][204] ([Intel XE#2136] / [Intel XE#2351])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#610]) -> [SKIP][206] ([Intel XE#2136])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][208] ([Intel XE#1124]) +4 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#2136]) -> [SKIP][210] ([Intel XE#1124]) +2 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1124]) -> [SKIP][212] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1124]) -> [SKIP][214] ([Intel XE#2136]) +8 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#2136]) -> [SKIP][216] ([Intel XE#610])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#2423] / [i915#2575]) -> [SKIP][218] ([Intel XE#2191]) +1 other test skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#2191]) -> [SKIP][220] ([Intel XE#2423] / [i915#2575])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#2423] / [i915#2575]) -> [SKIP][222] ([Intel XE#367]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#367]) -> [SKIP][224] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][228] ([Intel XE#2136]) +11 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#2136]) -> [SKIP][230] ([Intel XE#3442])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][232] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#2907]) -> [SKIP][234] ([Intel XE#2136])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#2136]) -> [SKIP][236] ([Intel XE#2907])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#2136]) -> [SKIP][238] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#306]) -> [SKIP][240] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#2423] / [i915#2575]) -> [SKIP][242] ([Intel XE#373]) +8 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#373]) -> [SKIP][244] ([Intel XE#2423] / [i915#2575]) +12 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#307]) -> [SKIP][246] ([Intel XE#2423] / [i915#2575])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#2423] / [i915#2575]) -> [SKIP][248] ([Intel XE#307])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#455]) -> [SKIP][250] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_content_protection@lic-type-1.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [FAIL][251] ([Intel XE#1178]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_content_protection@srm.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#2423] / [i915#2575]) -> [SKIP][254] ([Intel XE#308]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][256] ([Intel XE#3226])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#323]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351]) -> [SKIP][260] ([Intel XE#455])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_dsc@dsc-basic.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#776])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#701]) -> [SKIP][264] ([Intel XE#2423] / [i915#2575])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#703])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#1137]) -> [SKIP][268] ([Intel XE#2423] / [i915#2575])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#1135]) -> [SKIP][270] ([Intel XE#2423] / [i915#2575])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_feature_discovery@psr2.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [FAIL][271] ([Intel XE#301]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
>     - shard-bmg:          [INCOMPLETE][273] ([Intel XE#2597]) -> [FAIL][274] ([Intel XE#3879]) +1 other test fail
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#455]) -> [SKIP][276] ([Intel XE#2136]) +5 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#455]) -> [SKIP][278] ([Intel XE#2136] / [Intel XE#2351])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136]) -> [SKIP][280] ([Intel XE#455]) +1 other test skip
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][282] ([Intel XE#455]) +1 other test skip
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#651]) +6 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#651]) -> [SKIP][286] ([Intel XE#2136]) +19 other tests skip
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#651]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#651]) +16 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#658]) -> [SKIP][292] ([Intel XE#2136] / [Intel XE#2351])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#653]) -> [SKIP][294] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#653]) +18 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][298] ([Intel XE#653]) +5 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#653]) -> [SKIP][300] ([Intel XE#2136]) +21 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#2423] / [i915#2575]) -> [SKIP][302] ([Intel XE#455]) +2 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [FAIL][303] ([Intel XE#361]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575])
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][306] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [SKIP][308] ([Intel XE#2763] / [Intel XE#455])
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136]) -> [SKIP][310] ([Intel XE#870])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_pm_backlight@fade.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][311] ([Intel XE#1129]) -> [SKIP][312] ([Intel XE#2136] / [Intel XE#2351])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#2136]) -> [SKIP][314] ([Intel XE#1489]) +8 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#1489]) -> [SKIP][316] ([Intel XE#2136]) +8 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1122]) +1 other test skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][320] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-plane-move.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136]) -> [SKIP][324] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-blt.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][325] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][326] ([Intel XE#2136]) +9 other tests skip
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#2351]) -> [SKIP][328] ([Intel XE#2850] / [Intel XE#929])
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#2939]) -> [SKIP][330] ([Intel XE#2136] / [Intel XE#2351])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#1127]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#3414]) -> [SKIP][334] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#3414]) +2 other tests skip
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#1500]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-bmg:          [FAIL][339] -> [INCOMPLETE][340] ([Intel XE#3864]) +1 other test incomplete
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#2168]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@kms_vrr@lobf.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@kms_vrr@lobf.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#2423] / [i915#2575]) -> [SKIP][344] ([Intel XE#756]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][346] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][348] ([Intel XE#1130])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#1130]) -> [SKIP][350] ([Intel XE#1123])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][351] ([Intel XE#1126]) -> [SKIP][352] ([Intel XE#1130])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#1130]) -> [SKIP][354] ([Intel XE#3889])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#3889]) -> [SKIP][356] ([Intel XE#1130]) +1 other test skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@sysfs-toggle:
>     - shard-dg2-set2:     [SKIP][357] ([Intel XE#2905]) -> [SKIP][358] ([Intel XE#1130]) +7 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_eudebug@sysfs-toggle.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_eudebug@sysfs-toggle.html
> 
>   * igt@xe_eudebug_online@basic-breakpoint:
>     - shard-dg2-set2:     [SKIP][359] ([Intel XE#1130]) -> [SKIP][360] ([Intel XE#2905]) +11 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@xe_eudebug_online@basic-breakpoint.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#1130]) -> [TIMEOUT][362] ([Intel XE#1473])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#1130]) -> [SKIP][364] ([Intel XE#288]) +18 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#288]) -> [SKIP][366] ([Intel XE#1130]) +27 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#560]) -> [SKIP][368] ([Intel XE#1130])
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_media_fill@media-fill.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#512]) -> [SKIP][370] ([Intel XE#1130])
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_mmap@small-bar.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@invalid-oa-format-id:
>     - shard-dg2-set2:     [SKIP][371] ([Intel XE#1130]) -> [SKIP][372] ([Intel XE#2541] / [Intel XE#3573]) +7 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_oa@invalid-oa-format-id.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html
> 
>   * igt@xe_oa@map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][374] ([Intel XE#1130]) +6 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_oa@map-oa-buffer.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_oa@map-oa-buffer.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][376] ([Intel XE#1130])
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#1130]) -> [SKIP][378] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][379] ([Intel XE#2284]) -> [SKIP][380] ([Intel XE#1130])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_pm@d3cold-mocs.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][382] ([Intel XE#1130]) +1 other test skip
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][383] ([Intel XE#579]) -> [SKIP][384] ([Intel XE#1130])
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#1130]) -> [SKIP][386] ([Intel XE#944]) +2 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][387] ([Intel XE#944]) -> [SKIP][388] ([Intel XE#1130]) +2 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#3663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3663
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3781
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3864
>   [Intel XE#3879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3879
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#3946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3946
>   [Intel XE#3974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3974
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421 -> xe-pw-143166v1
> 
>   IGT_8176: 5e65135d3d7cf5298a58bcd6137c77205704bcf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421: a322fb77281fc52ebad7363980fc633a76bc6421
>   xe-pw-143166v1: 143166v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
