Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1AFC369C7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 20:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D43110E112;
	Wed, 16 Apr 2025 20:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WStOD06T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9610E112
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744835703; x=1776371703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RPY73QWLoM8tWaz2i0VYGSNmxXCeyUCHHVThec62BdA=;
 b=WStOD06TvaGw9fhAbsY7EH4yFikjQ0/uChMjgrTeRJPpiar7VREqoKLu
 Zqgeai0ANwnZ+7Z6sqWTstOI57n4kT9eWD2ZNRgdQb7TCjjiKbZdW/Sxp
 qCYCb2cr+3Vm6OYOHdjcVAOcd5eSZF8S8VRPEq+pViDicLbWw2efp6E5q
 vdFz+y20ZsOSt+ZeIaE0if9cVXoZlKSwjP7TCZKJYqBq0K+POwAdGt/Hk
 mO/Xxf/YF2R/ovaqTGz6EpIo1TwUNIG0DYUDa6FH8ZRAft5zjLlYrZqPh
 ggLDNkGUxM+SKHGJjZsJZuegP8xdf88bhPZa1KcQbjOxoRhp45uDkcodR Q==;
X-CSE-ConnectionGUID: Hiil64dmSyKnijk0KCl+QA==
X-CSE-MsgGUID: 9p5kkKpERG2jgRQXaxxLxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63813394"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="63813394"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:35:01 -0700
X-CSE-ConnectionGUID: cnHOrv6/SheOFjGZZzkouA==
X-CSE-MsgGUID: RVDufT1VSzePnw+zgzPEEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="130544959"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 13:35:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 13:34:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 13:34:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 13:34:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dfcp9bumCFBHnYvOoLL2p8Qgfh7oWdxQZsrdlfRY0icrWpv5y0rjf2SNEzi8SRN1IRJSjfMCY+WkIhtksJWtW/6Gj2g6SOicidMu0yMA4k6sqJiwWhmJBdZcxx7BwMkiY+5SUbfU7iXxVRTpiRZIxrbgz2o4ayT7bjh2oHfuQ2uvzcbz+xRjhzL/CeFVTo8fcH/5Il9zm4R2lom+SgDVF217nXdpl8SwkH0lKhrSLL5rrPuXt903McBv4XrAJdb4vml6Fuof7gzCFsMtiVxKhsw1BqD5KU70rr76noNDOS/dnoDrTGCbVH/rXS89MC5KwcU7uirwCvUYCtd70eS3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyP2GvDgc81A6eFwd10yYy5wQjpXpMDwN5jRDKt38KM=;
 b=EdAFu5nuZXbFmL7eJIitMp+ILmbbW8UNtOxFCYt4QNfLPgKdeP4M8wsy4x2UnKFPn/3kAVMI/aKCaf3io0CKYXQzF8gbBXXc8eg1EkLTIpZd+NKWEI8xIQIlzlO3gOGzCgaQad6kAoD9qwYZ/CbcMz75V3pX/yFdJLCgIyxyjJQkwRIYukKrwkiYaAlRpuWKP9O+5VbhPbamozHGhK40XyEsIyN1C18aKSyRmOcV7xu3P5ya6x3ZsYfduEjohC1cC/aCOKt2hRrY95TzJLvtmoIaRlBUzCGOnkLuJmr4mAahdrKVxcccqUicYy/zav53HbvoskerBDVYXqmh7IQ4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Wed, 16 Apr
 2025 20:34:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 20:34:21 +0000
Date: Wed, 16 Apr 2025 13:35:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] drm/xe: Add devcoredump chunking
Message-ID: <aAAUnDb+EqjPFQ7M@lstrano-desk.jf.intel.com>
References: <20250415183916.332202-1-matthew.brost@intel.com>
 <20250415183916.332202-2-matthew.brost@intel.com>
 <9aa30608-7a74-42de-be19-1c3c6e0a7e5c@intel.com>
 <Z/9DyT1rzA2tOEOo@lstrano-desk.jf.intel.com>
 <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b0634792-f2e3-4402-8b48-58b83f773426@intel.com>
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: b4cd1b68-41d6-4e1a-bc34-08dd7d261140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iv70h0uQPEmO4oi2tj0//GUntwpviCuyKgHFNSyHztHo+cW8EJkGG+ysfUx2?=
 =?us-ascii?Q?JFLKlbX6e+6eQj413cC4ZYvIngEuHuoY3ew8cUukfyubaV4qdtNvlmc9B0lH?=
 =?us-ascii?Q?sid2z2qyr+25cCP9SO4V7scZOnO4eSqsBcHXty2SqVaoW5igICtdgopIUDFN?=
 =?us-ascii?Q?ZpN2Sk+VuCr7VR6/+TylLzR8wg+uvM9Te9DvUC8JnxVxP7TV6MMEGwiqdzn4?=
 =?us-ascii?Q?wOoUR4cGye9VlOr6OnJ78N7Y5aCcuBaztHRkuLqF7lInTjcjUgmshQaDefGR?=
 =?us-ascii?Q?5ShNdPN/krlbi3yydG5HeFpqWWCmUehVLluHJskDQXxwsYU857x9pItIHso2?=
 =?us-ascii?Q?l/CudlyNQp/YL2WK7rkEwJZLBb9Mmc+XKAVaAMPg4Jgml1o4ridmZqQtQLOJ?=
 =?us-ascii?Q?3vD2JyuACx3LVvqMdAoDAEx3LWrutPbflozmFQzTeSZockD7iQTfUoO+lYSu?=
 =?us-ascii?Q?Ef3QeD9ByrhC+q6eG2IxC/4uMtHS0zAgbxg06EYXp5ZNKHhbTVxN62x+mirO?=
 =?us-ascii?Q?400IfECDp8xq0rL3LX1dr/ddkzooRnz24h9v6jWrJ2E4thCKhxYQWhvtDO2f?=
 =?us-ascii?Q?A6cMlwu8pBkNPYV1Pu3aZAzvvKKobRO0dc4nvaYhlYAZ+NzfIn8cfauKTBLn?=
 =?us-ascii?Q?Zfg2SRoLdkg7E99og15SQ/I70lajYQ+XOcw8/Z+xy6VGbXSyQlGjRT+OITOz?=
 =?us-ascii?Q?wxIANXBy2ulSHvOibNvcGL8x8T51Wp8WyjwBDwMVLwKCIFTskZXxVu3zCy+K?=
 =?us-ascii?Q?DQPV27q/G8YCw4GNcjU5E261YrsxkqcETw3gZ1GRiNKcpFOi1Iy9PdC1ot23?=
 =?us-ascii?Q?vpxB46694GPfDydoLi1Z+0citR2hGE7MUEhrw8li9JSDTZttbwqMWJLUZg4f?=
 =?us-ascii?Q?+76TkPtY/IX/qH+DRf+Q8N0Lnk8WikSoieT2gsWEvWlm0X7DP1Zv4r5Bppvh?=
 =?us-ascii?Q?efOqLBT4PVaMFCMQRyLzbJfnOea8mxo1YyOBsE+KRS29uYt6w7VWGIpVPWx5?=
 =?us-ascii?Q?1BkQhz6XW70xWw/Nz/Vga/Ol8kFnXjrpUrE+rSQ+MxCeMpGiRI0xx/uO0lGp?=
 =?us-ascii?Q?qK0QJsMJb0tC4eePI75M7DlWX4uJCYLHtA1hwJARnUaeAiK7TU009JkuTfvM?=
 =?us-ascii?Q?jHq6QhaXneU3Gg9OEmQcmUIHw7TZBWuzsOnGYsKnS959We2+lKFrAJLMDnaZ?=
 =?us-ascii?Q?fft9gqON0GgJAMj+UjG43OgTInJU3fFhe55tcSZLzEpJ9QPQ1VVo0Eey7Mve?=
 =?us-ascii?Q?UxR1K27LyuUJ9CkkYnQct+93lQsMbCWu7+03mi+AlqMF47wPSyS9PI8hjglm?=
 =?us-ascii?Q?ShD52s+ChsMty3WzONHh3xwM7PE8ldJXR5CONrG5i2w+j+NlU8ob01YCVeBc?=
 =?us-ascii?Q?rhZQPmM2JsfK4+IGJ3GP3zD3VVqmC56Yqm+CPcfs6lViHo2hRFfSq/PAw0yK?=
 =?us-ascii?Q?XlfOr8JGmvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5hjR6peOGgLvdlCyrJDdwTOW7z10FHx6QCdiq1lgS0IcvobaIC4MYzzYaAi?=
 =?us-ascii?Q?SQXNswxq6nyn75Vg4U8/VtTFmnvFsn7+cfHMci7CDQV6jxJu0ycPbBhRG3Me?=
 =?us-ascii?Q?wtp9PjBZG3UamUsjv1WqT0YOpKrlhUq/U7NB11D9jyMwAvRF4gb07MvbW4te?=
 =?us-ascii?Q?IZIGi9oxDzxUg82QAD9E5dbOzc8u0/PAxBrRdIrHsIL9JUOu5TZYfT/tL1u9?=
 =?us-ascii?Q?w9uVJDzL1yt6z2eQ4rhuaVTH70vP4ZYIYGzQ78o0nhp37oBEOkpHt0GcalvQ?=
 =?us-ascii?Q?7tcNnYFRGEd5xqrK5BmnksPxrHZpa7AakPSpv8aF00I/JfyQ43kq3LrGG4Rb?=
 =?us-ascii?Q?zk3N3WDuI5BKdYCFOmqYpgDXYZJu6j3fPn6IAlrGL0Et97QpskDs8XNNidoz?=
 =?us-ascii?Q?y0JroaeMVYawQr33/a0M6WE2zs+DWz+zKGO2AUSQrjt3hu9hJl7vSvdFV9z0?=
 =?us-ascii?Q?/ERFIVbEqcrJ70Zk4safv7yI+kcCI3EUwbYmTjO/TzsqBOjm5nif5Tnx8+C0?=
 =?us-ascii?Q?viigFkf5pZEHggUC+iPWyso3XuLebg8CQYrzdAHkOYMK7ZGP3FEH+OFbuIvm?=
 =?us-ascii?Q?J3ehA7HKCwu3v8vWDyWO/rWSuqz+zTCDH6jrJv8zVfof/XZH/Eg+wy2rQiCi?=
 =?us-ascii?Q?mNsFtOea0hK/FOa38Aj6o5tVgcKl+rZJaTT4JmsH5tK5wej/vMH+Vq8+h3rI?=
 =?us-ascii?Q?9ViRUoOKbCquTVkX5Xwbfps3on0+q3Cg86U5+4chBrDmRQrBkukqSt+j+yW0?=
 =?us-ascii?Q?45PjXwdIAk9uM8AMYktd2E2Y9jKuEfqf7UL743Bpoy/r2PfMSfIqjPjF03FB?=
 =?us-ascii?Q?gmUKBlHeoDsRT+DS88YtU5mQfTLX4VneJOygLDAoLTbIMuZ9hh1pRuLfx8Ig?=
 =?us-ascii?Q?Sak694M5uR7C27GEqg2V7SKFUXzIQ6YP4QHLiLzNab+1NCZ1KhDhZg4eFl2Y?=
 =?us-ascii?Q?f/ZWZAH3wF/HziY1Tklw50xy10dFQPUzCwHTvRldYiH+5lL2cAAmc7LLZyw/?=
 =?us-ascii?Q?diJHer2ZIDixQqlo01E0cK4548wTysnTKcTvu5YZ6J2f5hHxBGFThrt/LJHS?=
 =?us-ascii?Q?1GUWWW2P0ZV7NBk4msXr+IxRdDQ6yrHHyF7wUVrJZhF/UggAx8MebXQIY1JR?=
 =?us-ascii?Q?FwMDNpaxS/3rDmmPy7wo1ZQ9POG5oDxrnmlVRM+biUvR1889BZmGNitFYz5y?=
 =?us-ascii?Q?3MBwayMcVwiVb3E/1aSbBqAJ0gx594N5ok+VVtrZtQqM00rOOlBHyalaJ4X9?=
 =?us-ascii?Q?HIZhaE+xpMrdZ8GU9ILQ4Ur5WjkipVXtMsQTYxoAlcoz0B6G6QeBCRgMnjDR?=
 =?us-ascii?Q?1lbj+IxsJqRNPZP0lgsNDjK+p5UuWCWESEP9ub9tu4oOuypvIcsTdgLR8ogT?=
 =?us-ascii?Q?XoiAeYFmmQwM5ZcPy7ISMlfRI5MUOHQE3R5rTBALlQFJim22YaHMM46+KNwG?=
 =?us-ascii?Q?hpbZWdUTXABwhs+RxMDJlloWi/HdrMyKY2YeHV+e774EUvrg37Ohm0sL/TSt?=
 =?us-ascii?Q?UWA2rNfhonidTUQkdOCrhHM6NNTY6QKgXkXjvTVMMfi0PI0l5kVFO4aJvnwA?=
 =?us-ascii?Q?bDJH7b/2V2e/Yxix39SFJ69JqALz3N42luyW/+o7qkTOAZg25ntKi+987yMG?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4cd1b68-41d6-4e1a-bc34-08dd7d261140
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 20:34:21.0075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWzC9d1b9inaAm9ZSa8kfEzrxcuxRIfkuM56MsAOhvSNWHBpHLger4BwmHgtGydkQdmJW3nlGvRu8QM/82k/qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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

On Wed, Apr 16, 2025 at 12:30:27PM -0700, John Harrison wrote:
> On 4/15/2025 10:44 PM, Matthew Brost wrote:
> > On Tue, Apr 15, 2025 at 04:18:29PM -0700, John Harrison wrote:
> > > On 4/15/2025 11:39 AM, Matthew Brost wrote:
> > > > Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> > > > of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> > > > callback as needed.
> > > > 
> > > > Some memory allocations are changed to GFP_ATOMIC as they done in
> > > > xe_devcoredump_read which holds lock in the path of reclaim. The
> > > > allocations are small, so in practice should never fail.
> > > > 
> > > > v2:
> > > >    - Update commit message wrt gfp atomic (John H)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
> > > >    drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
> > > >    drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
> > > >    3 files changed, 50 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > index 81b9d9bb3f57..a9e618abf8ac 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> > > >    	return &q->gt->uc.guc;
> > > >    }
> > > > -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > > +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> > > > +				     ssize_t start,
> > > >    				     struct xe_devcoredump *coredump)
> > > >    {
> > > >    	struct xe_device *xe;
> > > > @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > >    	ss = &coredump->snapshot;
> > > >    	iter.data = buffer;
> > > > -	iter.start = 0;
> > > > +	iter.start = start;
> > > >    	iter.remain = count;
> > > >    	p = drm_coredump_printer(&iter);
> > > > @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > > >    	ss->vm = NULL;
> > > >    }
> > > > +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> > > > +
> > > >    static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    				   size_t count, void *data, size_t datalen)
> > > >    {
> > > > @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    	/* Ensure delayed work is captured before continuing */
> > > >    	flush_work(&ss->work);
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> > > > +
> > > >    	mutex_lock(&coredump->lock);
> > > >    	if (!ss->read.buffer) {
> > > > @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >    		return 0;
> > > >    	}
> > > > +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> > > > +	    offset < ss->read.chunk_position) {
> > > > +		ss->read.chunk_position =
> > > > +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +				      ss->read.chunk_position, coredump);
> > > > +	}
> > > > +
> > > >    	byte_copied = count < ss->read.size - offset ? count :
> > > >    		ss->read.size - offset;
> > > > -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > > > +	memcpy(buffer, ss->read.buffer +
> > > > +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
> > > >    	mutex_unlock(&coredump->lock);
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> > > > +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> > > > +
> > > >    	return byte_copied;
> > > >    }
> > > > @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > > >    	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > > >    	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
> > > > -	xe_pm_runtime_put(xe);
> > > > +	ss->read.chunk_position = 0;
> > > >    	/* Calculate devcoredump size */
> > > > -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> > > > -
> > > > -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > -	if (!ss->read.buffer)
> > > > -		return;
> > > > +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> > > > +
> > > > +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> > > > +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +					   GFP_USER);
> > > > +		if (!ss->read.buffer)
> > > > +			goto put_pm;
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer,
> > > > +				      XE_DEVCOREDUMP_CHUNK_MAX,
> > > > +				      0, coredump);
> > > > +	} else {
> > > > +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> > > > +		if (!ss->read.buffer)
> > > > +			goto put_pm;
> > > > +
> > > > +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> > > > +				      coredump);
> > > > +		xe_devcoredump_snapshot_free(ss);
> > > > +	}
> > > > -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> > > > -	xe_devcoredump_snapshot_free(ss);
> > > > +put_pm:
> > > > +	xe_pm_runtime_put(xe);
> > > >    }
> > > >    static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > > @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
> > > >    	if (offset & 3)
> > > >    		drm_printf(p, "Offset not word aligned: %zu", offset);
> > > > -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > > > +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
> > > >    	if (!line_buff) {
> > > >    		drm_printf(p, "Failed to allocate line buffer\n");
> > > >    		return;
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > index 1a1d16a96b2d..a174385a6d83 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
> > > >    	struct {
> > > >    		/** @read.size: size of devcoredump in human readable format */
> > > >    		ssize_t size;
> > > > +		/** @read.chunk_position: position of devcoredump chunk */
> > > > +		ssize_t chunk_position;
> > > >    		/** @read.buffer: buffer of devcoredump in human readable format */
> > > >    		char *buffer;
> > > >    	} read;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > index af2c817d552c..21403a250834 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > > @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
> > > >    	if (num_dw == 0)
> > > >    		return -EINVAL;
> > > > -	hwconfig = kzalloc(size, GFP_KERNEL);
> > > > +	hwconfig = kzalloc(size, GFP_ATOMIC);
> > > As per earlier comments, this should not be happening while dumping a core
> > > dump. The only code which uses this is steering related. That implies we are
> > > reading EU registers while printing out a previously saved core dump. That
> > > either means we are unnecessarily reading registers during the print or we
> > > are not capturing state in advance and only actually reading it out when
> > > printing. Neither of which is good.
> > > 
> > Ok, I don't have bandwidth to fix that. I'll let this series die then.
> > 
> > Matt
> Or maybe just add a FIXME comment? I've been meaning to take a look at this
> myself but just haven't had the time.
> 

I guess that is a better option. I can add a FIXME when merging.

> If we need the large file support to allow people to debug issues then we
> should get it in. Your patch is not causing the bad register accesses (I

Yes, this is an ask. And no, this patch isn't causing bad register
access rather exposing it via a lockdep splat.

> don't think), that is something that is already broken in the driver. But I
> don't think you should make this change with a comment suggesting it is all
> fine and happy. The commit description should be more like "FIXME: This
> should not not be happening, but until the unexpected register reads are
> removed/moved make the alloc atomic so it doesn't go boom" and add a similar
> comment to the allocation itself.
> 

Ok, can fix commit too when merging.

Matt

> John.
> 
> > 
> > > Rather than making allocations atomic when they don't need to be, we should
> > > be fixing why the coredump is not doing a clean separation of save versus
> > > print.
> > > 
> > > John.
> > > 
> > > 
> > > >    	if (!hwconfig)
> > > >    		return -ENOMEM;
> 
