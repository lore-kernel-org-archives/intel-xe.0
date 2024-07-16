Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F79C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 15:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B010E7A3;
	Tue, 16 Jul 2024 15:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b5PAu3ls";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A423510E7B0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721144776; x=1752680776;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LgARYqs5+/Ws6XOu7ZXUNTq2/yOzyGmkiCpqidLWgH4=;
 b=b5PAu3lsSAAU03d0xv6UQ8BjcQrQ6jyBI73r8YdD1OMwITXd+iFzfcPb
 jYc1JR3zE92Xh6we289QP0L8EgI/jwF4fsCTwwrrO+JaJ4ArYFys//omu
 4HIKCNlypmW/BwkOU9BGn2kk14MA1DbHuio3d6d1vrwiJ8gM3uYcwIw+D
 POhKnhHVT0sXCMIQ8SBEu1Ry3UAt9aprFavlLKQW8My+TYvHD4xfN3StC
 ssEQb3fAvoQgDjzKnBT5gcnMqV/ZpQjQTRZ5CPhoPajwwsFPAJ97ITu7J
 yP2PU/97Dl5cZPLmoecm5tHhWyuOom1X5mIUZKc1iTxHAVdCUp5t1WW8W w==;
X-CSE-ConnectionGUID: b5PLHDVnQMayqJKRnYV+kQ==
X-CSE-MsgGUID: zqNix0VxSzm69A9jB/MhJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18463416"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18463416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 08:46:15 -0700
X-CSE-ConnectionGUID: 29YkNB23TkqnTxMt5L1fqA==
X-CSE-MsgGUID: w5iuB6G7QMuGvRj0/EI4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="81107911"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 08:46:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 08:46:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 08:46:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 08:46:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8xLLfoKoBQ+1xWH4HtWdMSoNPiMHTXguZI2dyezs1MGrsGc2Lg+tQsHOu/UVGpzhfk6IEtamJ1+8aZ9tSWCQXX/osCnhHpqGocSwiSZy3E3s3TTMna0Y6S/OD/t0KDpmV1HKKxAn1/Aztf2qM3pVAD1xPxpvAXTTblgHBduT4LCmCDPBrsy8N4Y3fD5LK53HY+QT13Q7sZ5vcCJ8uABReM+VzW2ebleR0x3mvi6MoNQeb/a3FC3rPJFQxVdPbXQc3vRgS3uNY3Tn8Ip2GWM82as9m2Y6pnARdr7tzw+lYs3qHyaSeSZkIhSfpHULV3SssuF8t67ZP4SXNGuWZrcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF1N8lxz7YFAJmBC2+Q1R4Qe9KCHbSiSTBritEVKdcI=;
 b=qVHbVvfl56NiPEgpMxtSPg188fA0h1bxtywwdae9HSxVG96LuKefkBcGKJYK0pVkskY8OEfawH8+GDUUukMoH2PVoYOgjOimURnwTQLjUc6nUQMMF2mkyBX3mV9ZcIHACz1vQq6L4yYl4J/k9r0Lp9a2CqolqoGs9ldzhy+1Jqn5Cu7RYoEa6HrbAmLllUSqQcrDcnL9XGx+t9cRLt5O2+pchOjJZGVPoQKp2QNyJ0IwOYZtheXC0oXyS+Q3AXEMgOz+nCkUwDUiBd+TF6aAHL6S98ACAa+IsV/P5mSx1ZFxvOJMkbLiwo+GSKaBfsySS+FGgcK/PzeezzCQSsOILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 15:46:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 15:46:11 +0000
Date: Tue, 16 Jul 2024 15:45:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/vm: Keep the device awake for TLB inval
Message-ID: <ZpaVlInvZh0XRUMH@DUT025-TGLU.fm.intel.com>
References: <20240716133855.12015-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240716133855.12015-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: c344839f-64c1-4277-02d9-08dca5ae6ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m4n6VVbrhDU0d1U26asrL0zbA3dcFHt4zEoCoBVVE6XxYGN2K0xYukYZ25SA?=
 =?us-ascii?Q?E8LrnBSR3e3WR1FOlLhvllEKT31rEgnHwgtgas8EVD1gETKdEiU3+T2mtSKl?=
 =?us-ascii?Q?UNzX99D64X58DE4/AwVs/ZXR9A9WThhCA6TwulPzdsiZCW8IBgxBmnXNOwh6?=
 =?us-ascii?Q?OzqOZgsxu8AaA3eBph67UxJK2Xqq4Yj9/sG+6oM5t0ED61e/Kow1Zv0I+Ja6?=
 =?us-ascii?Q?qYWn7I/kx16VBla0L7NJPI61J4J50dWG7uGuAaHdNdfKHxvPbESLJJnhLxtI?=
 =?us-ascii?Q?DDbpC2VUiETF0pAjxg3VvYxWpFwHBSCAXcI5j4+IGzDpa19OLL33Y4b//P9J?=
 =?us-ascii?Q?B5M20y0NUyWZtDP0Ks2HghBzKRQAhM/UDAOo3/fxlu736/CVKY092TGkl7Cx?=
 =?us-ascii?Q?VkEDKyUedQhEkyuRnJh9UY0mT+GoOoDb+M+iVqotAAR8OlyORmXmDXY7wDjM?=
 =?us-ascii?Q?umC81vjibX31ldq2dFgnUV4AsoYVZjiK4i9E8J7P6gQ7midBxjqcyiGgolzx?=
 =?us-ascii?Q?T0ViO5wPWkV8D4hHFqnjJf+48gNHaA9M+x3Yd0aqi8iX3vIHOeNETj9FLzpO?=
 =?us-ascii?Q?uPSDX0Qt+mjxochkoKcrBcFHVjuvBEthPEt+K5duv7ZFo5CJ6k3G1hbjzLjO?=
 =?us-ascii?Q?4AWrw0wUzUIjKQPqotlpsAhW1G3mjMyURnsHPfPpOuHtQKsG+LeJAEFXrQsu?=
 =?us-ascii?Q?oCHSapHzyG+elyunm/3gb1cZo01VSTjSRhHjtu27mvGI0gMz/pFnMg2ekJIl?=
 =?us-ascii?Q?8eYC9R4LC3Md0ymkRNBxgR90yQIH3xA6KYzh7OgtmRWGRyIvQF4CIvC9GA8p?=
 =?us-ascii?Q?xhtGGCU/cjFWIWJN93s60Hyt2Xvje55PZmZScAYHZOhD/e2Y6tAmmbJ98Wa3?=
 =?us-ascii?Q?O6zuxwo2OzHrgqw9Jl60M89xrcxT7Vo+ltLR7+7PLSPMa/PbR7dX167+kySC?=
 =?us-ascii?Q?EZLD+lsHUY2zwb1MW1hlwhbC6bQwC/Sdbdtd4SdsyNyBoiW7tzRx45kkypKh?=
 =?us-ascii?Q?vDto1HJVDK4sAeTZdoUcqEbfg0XHOheX9cC2SInyQ+VYzlV6VswrkEC8G+D6?=
 =?us-ascii?Q?CDBNpsao/ZO/sCy3rHNyP3b7gv9x0bRrQWDfgdrILmNIS3P3+bnQA7/8FT2x?=
 =?us-ascii?Q?I+l+r3DKMQPwa5zYj6InRjaz4aui4z57hjZXBYzw6x1YkBcUA/+B2pmMU83C?=
 =?us-ascii?Q?Fu30JVF+0R0DfrxLBTZIuq+8cI+OgkeCmo9xVjFCtUlYHbFw3gWsUepycW6h?=
 =?us-ascii?Q?bNv0VsmFx6GNEpZvrmOttt6aq63+cPpizHqCM4us4SC8YTeQcGSvc3waZSzH?=
 =?us-ascii?Q?ooQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oqk26956qLB3LCT5bXI3LKPjDIkjjPyStUKtdrkSk2Mb2g6nkVbAEpwt1Qhu?=
 =?us-ascii?Q?vNwJ3BGHFxLLO9keo6V1xvMxpyHA87LjewSjTQC0VboD+ihPUdMVvhFxq/vU?=
 =?us-ascii?Q?93yeCqwg5i1F6rnNM8cfvEhyFkz1U6h82sXSHYjoA1k+trJQE9FeqKgbC0Ix?=
 =?us-ascii?Q?4yDIiUJoagBn94SLTRzQLzqM6emFxaAbipBVboxnsgiRj4fo1ycRwLKN6KlV?=
 =?us-ascii?Q?jEmPSb6yfx2aL5IYcRImQa1lWKMietVPU2RMIMT5LD6lfex7IBg9YO/X6CUZ?=
 =?us-ascii?Q?Sv87rbPURLgjyWZoR01IgOVLOcwqIBiy/d2CbQd1hdygxC3RrfrehGwvxF9B?=
 =?us-ascii?Q?4nXw6Qpu2D7i1TlIPDh+cyWMR20XIefWV5evQgt4UerkoweRZMaTTzFd9WQu?=
 =?us-ascii?Q?H7OBScBBz+RWJnvQFq6RxRKITTghnU+fiTqZnQEbF7EDydUVT3qCTR7NQDuO?=
 =?us-ascii?Q?uucrHvd/AlaINtXpqCXNdEgpp7ZLzJh75OXr+fsHNF60zmZ6TwJ+1ZxbKCdZ?=
 =?us-ascii?Q?8hdBTMZdLSzMuD5hDNlGGddZPha6WYqnU/A5vL/4x2PBvvJdjgW4x7Y4HQFs?=
 =?us-ascii?Q?Vi0ZSmTCTsiqiym2dHYQO1qtgRMkj3p8hnj9BtXPUaPyv+CoNmrwDxMo6BDY?=
 =?us-ascii?Q?/9Pk+Bzg7inRLpY31SKOmTItM8fyKU6iWEFOOO6ZHiVSwXfaCVystq7/sWAS?=
 =?us-ascii?Q?reb42z3TCV0Bk98cIToQniSmufzUTR3uqlLC1UG2krPVJ5tcncga6aNehrMo?=
 =?us-ascii?Q?K1eqOVGUFRdZlxHwIgYkTfMJkgZ6Uz+l1Sfvt7uZhtwfkjpgFtJ7IDQQvNih?=
 =?us-ascii?Q?zdJ/fzcTmUsAYqXuxaNBrM2NhSo4iZRFfdLSDNlGZhbl/nruqpjuR0pGFP1e?=
 =?us-ascii?Q?9eUpZUVGlD/6xHfT5T6o51RINCroBcQ61YWvmIBdUSVu0mhwoFgIJwf68yjO?=
 =?us-ascii?Q?ApK0J7Vf62sGAjy6Ch/TbkBMT+SHPMxpjKjmBCeMKLZi+9AYBER1cV/j8I3O?=
 =?us-ascii?Q?mL3ntGHg9MCLFLw0kF9pz0pZjqL5zhb/6UQ58OrCMPwfiEH4OHNo0S5o7T1Y?=
 =?us-ascii?Q?XYRiJPHvhllB+gJXmAkZ9pgrWBWQo9lsBHFde6B55vqbWLI+lX8uUJFQDiLU?=
 =?us-ascii?Q?Eb0358kdZQ7ItP+k0DDqc7E6iNR9rjhQ5Y9imZhIG8s9M9wKzxHNXzqFJaLK?=
 =?us-ascii?Q?ttJehwycz8m5ADEf9g82pc3CSraQj2NISMquU5Pe1IYFemRravxFlbhw2fXy?=
 =?us-ascii?Q?1mAah+ludUN+AFVM1gDs4716vFz+CfytnrLfP8FrhlJz/pgbIXKnVachDTlh?=
 =?us-ascii?Q?IoVIltWQgI6CACbmgfwZcs7sMF2SEbW7bcjkRW3oJ7zFSlIpwACEDIQ+SZQW?=
 =?us-ascii?Q?kLaT/AbuLzp7ODMCVgMVGoXG9/DG4Of+Sx7Z+4fIzIz1F6iwGfs7vztJs5Zp?=
 =?us-ascii?Q?Zu8uXVfhSssHEQ0LJUYgXbTCxS7Sy92qKJLxFmudyK8NS8reTafvx1aHBdgY?=
 =?us-ascii?Q?iN9u9a4ibs/Qo/6gxALRfXwsFnUMpehXYEfvchn6R9o95r70zTDB3JkJ7Rbm?=
 =?us-ascii?Q?VNtWHSJ9gKbzcyKQ0V0xQpXVnLKbROG4l4Ny2VlZMvogH3npNelA7Lt2mjIf?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c344839f-64c1-4277-02d9-08dca5ae6ad5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 15:46:11.6012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMWZsNPOzh04vOOmkb5byHT7RQyP4Ze7vY+qc4NUSZCOFKfxuoeuPKDf1V1WYUhjRDit1wMH48c2T2UEYWDZpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

On Tue, Jul 16, 2024 at 03:38:55PM +0200, Nirmoy Das wrote:
> GT can suspend while TLB invalidation is happening in the background.
> This would cause a TLB timeout when that happens. Keep the device awake
> when using fence which doesn't wait for the TLB invalidation to finish.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

+ Rodrigo our local PM expert.

> ---
> Adding strace here for more information:
> 
> xe_pm-18095   [001] .....  3493.481048: xe_vma_unbind: dev=0000:00:02.0, vma=ffff8881c3062b00, asid=0x0000f, start=0x0000001a0000, end=0x0000001a1fff, userptr=0x000000000000,
> xe_pm-18095   [001] .....  3493.481063: xe_vm_cpu_bind: dev=0000:00:02.0, vm=ffff88812a00d000, asid=0x0000f
> xe_pm-18095   [001] .....  3493.481093: xe_gt_tlb_invalidation_fence_create: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
> xe_pm-18095   [001] .....  3493.481095: xe_gt_tlb_invalidation_fence_work_func: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=0
> xe_pm-18095   [001] .....  3493.481097: xe_gt_tlb_TL_fence_send: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
> xe_pm-18095   [001] d..1.  3493.481097: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x7000, len=8, tail=44, head=36
> kworker/1:2-17900   [001] .....  3493.481302: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x2, gt=0, width=1, guc_id=0, guc_state=0x0, flags=0x13
> kworker/1:2-17900   [001] .....  3493.481303: xe_exec_queue_stop: dev=0000:00:02.0, 3:0x1, gt=0, width=1, guc_id=1, guc_state=0x0, flags=0x4
> kworker/1:2-17900   [001] .....  3493.481305: xe_exec_queue_stop: dev=0000:00:02.0, 0:0x1, gt=0, width=1, guc_id=2, guc_state=0x0, flags=0x0
> xe_pm-18095   [001] .....  3493.756294: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=5, head=0
> xe_pm-18095   [001] d..1.  3493.756470: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=10, head=5
> kworker/u32:1-17912   [006] d..1.  3493.756535: xe_guc_ctb_g2h: G2H CTB: dev=0000:00:02.0, gt0: action=0x0, len=2, tail=2, head=2
> xe_pm-18095   [001] .....  3493.756557: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3003, len=5, tail=15, head=10
> xe_pm-18095   [001] .....  3493.756559: xe_guc_ctb_h2g: H2G CTB: dev=0000:00:02.0, gt0: action=0x3004, len=3, tail=18, head=10
> kworker/1:2-17900   [001] d..1.  3497.951783: xe_gt_tlb_invalidation_fence_timeout: dev=0000:00:02.0, fence=ffff88811bf3d000, seqno=93
> 

How do you know from this the device is suspending? I can't tell that is
happening. I do think this raises a good point that suspend / resume
should be added to ftrace as that is useful information.

>  drivers/gpu/drm/xe/xe_vm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b6932cc98ff9..241b7ea00d5f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2700,6 +2700,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	struct dma_fence *fence;
>  	int err;
>  
> +	xe_pm_runtime_get(vm->xe);

While I agree the device shouldn't enter suspend while TLB invalidations
are inflight I don't think this patch will help with this.

This code path is called in various places in where we should have PM
ref (VM bind IOCTL, exec IOCTL for rebind, or preempt rebind worker). If
we don't have PM ref when this function is called, that is a bug that
needs to be fixed at the outer most layers. Beyond that, GT TLB
invalidations are async and pipelined (e.g. they can be sent after this
function returns and completion can returns sometime later).

With this, I believe correct place to fix this is either in the CT layer
or perhaps hook into GT TLB invalidation fence (Arming of fence
takes a ref, signaling of fence drops a ref). If we choose the latter
option I think following series will help as we will use GT TLB
invalidation fences everywhere for waits [1]/

Rodrigo - I know we had talked about something like above but it doesn't
appear this has gotten implemented. WIP or did this get lost in the PM
work?

Matt

[1] https://patchwork.freedesktop.org/series/135809/

>  	lockdep_assert_held_write(&vm->lock);
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> @@ -2721,6 +2722,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  
>  unlock:
>  	drm_exec_fini(&exec);
> +	xe_pm_runtime_put(vm->xe);
>  	return err;
>  }
>  
> -- 
> 2.42.0
> 
