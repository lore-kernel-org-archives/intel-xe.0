Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E99CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FD10E08B;
	Fri, 31 Oct 2025 18:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljwBgpSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A4E10E08B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761936474; x=1793472474;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=8tZla+BiIEShj2f9me2zbpA8rwGxefayTZJe+nInlOQ=;
 b=ljwBgpSc2hUMZDgqez4OiGUymw1lFGfaVh8ko6BjOEs9fenwy/0EuDIH
 Pxm0DIUuDYYdGeUIqmAf/VnaNkxwjWFUO1BVQJmN/xrdbb/Ih4IIZs0cr
 0AWEvIcBz1pHD9nyw4GFQQpQjtNc6piS3ImdxMBh4N6O4U0ecfJI3ScA5
 XwMsbMgBo5+5zXBQYXCxw56kLFdUNQsx0igWGyqZDzgYLr0oLlJsC5YMp
 j4/ickDKkqe2JORJifBGR5R7Su53KTcGZa1wqlEs0YXgJf/5h8oQ+FVKK
 dzdMHr0LlbTTaZ4ioH2nq6Qfgv+Ru77cTuC7qK4SsKJLMp9vKgBPJLBb+ g==;
X-CSE-ConnectionGUID: V7zqLMT/S3+PX+UFU5Pixg==
X-CSE-MsgGUID: AZe7wsxJTtajCxqxW2FvJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="67759156"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="67759156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:47:53 -0700
X-CSE-ConnectionGUID: KVWL0VcQTJWk5PVJMzj92A==
X-CSE-MsgGUID: 9R9nCPjcRserdtusiWs+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="186426179"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:47:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:47:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 11:47:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 11:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eu6RPbTsVOZj9xzTCcpVxPrE9FSqkKdEGPTk6kk7CduBqiH2lQKYX70MtMiTV2CYf7a8NRp/4cUcjiAuo1nyf7ldnjcb39W48pIdXeeLg2Bo7bHO8I4r4X71VSS5vjW9CPvWePFZz7Oj4wjtdnUoZscbT2ys4yd67svlysmbSMpGBuqDx6rC9IZ0ydqzoaqIizCJb1zxFZtMDBxJlkTvsrlr9um1qXhBrepnNHNyMGMv5qEHVGX2lOPY7+mLP3Kv8y2qczR8p8RaYWwRQY+fpG3F/VAUtbwEA+469Z0mTm86E9Ej2TPSdgOf3MWRM2mTbaY6Aosm2VnyuxmWFrXzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSIGpiMJtR3O+rYAaGAIChs3H7uS24h37OiMjPqGvQM=;
 b=dOt6JM0vmZLlxlEFSRwWszwcvXiUqelonDQXKdB0V/02AfLD0c2BxoAnOIbKFQc3XjaKu5UHLZerKBhCZ/fIgqz2dK8hQUxOs1P6dx+jinAe2MbdB2axd1w28NEwO0bDLAniggUW4/h00+WDfRuFZh41iyEfE61M4p9rlXjxLcQ05SCi7rc95ph5MVUNJRLCIG+Nl94M5VXbL4sZ8V+2xirqpCDC/zLZvZ6ifijvNliRGEoVGwhf1wwTA3EvH4BTtj3H3jBeqwscsResAIuuHDh7yoJ3WJ5750VuS/TNuDXZO0RrzOfMhyCh1lvx2T/D6kBE2yew3qav0tRYzmmpOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:47:49 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:47:49 +0000
Date: Fri, 31 Oct 2025 11:47:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/16] drm/xe: Multi Queue feature support
Message-ID: <aQUEUuZcZdcDL_mI@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::20) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad2dd73-13b5-40bf-7095-08de18adfd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jas6tJ1nFOx7N2bCgZlTKhhFoc30voAxWZXdEW46q+PxMpRjkBe+TqxKcDAe?=
 =?us-ascii?Q?0Kyo1AVaQn3eqMtCMeJYfrSfqanl25oPR/+k4O9nUewJWs2hw7x6VdwB39x0?=
 =?us-ascii?Q?qwOBa/e4gv2l5Aa0k7pZFvluxZT7QkNismElE8uLtbQ5hBHFM6nyK9sfKQUc?=
 =?us-ascii?Q?S0tnDm9Ma7jGF+rs5uyXjponxZrI++2Jj9Jjr0BEuej7+N2X5jtld/6iEYCm?=
 =?us-ascii?Q?HxX7AnO6f12PnVGNsMJRhMY4A25+EWpQsBiKvIgvY2lSYok5UtygOjLmaqWa?=
 =?us-ascii?Q?ktJPxjZVxmCOeqJ5j+s0vizdpx8dQZ6yq6/Ey3CZ3AaarX9k5A7Y03DLrag9?=
 =?us-ascii?Q?DNt76PoEwbkFjt+DKWuJtWuITQCIvUyXXvc7tJVRgxIHhzTfdqQjkOljSCQO?=
 =?us-ascii?Q?VD2borrtESK9rf9BMWxw6B6edJSqp3fyRrCBYYtgbvv5vltTpiKa1qrtP50o?=
 =?us-ascii?Q?doYs6TUcs6OVw6R4g9e6N1LENU02A0OV4D5YORMXEo1AkDu2MD7P8Pe4z0jH?=
 =?us-ascii?Q?kA2hbbzvpCP+LaIBtopKfgeSetrfRW8xASapOj9rTRPmYi/Naw+ID/e4HP+b?=
 =?us-ascii?Q?KmIfT3pPBqDGeDdCRX096jWZEl/eUvHBAAyFNX8+u7if4Nn/MnUDt8GrqkVH?=
 =?us-ascii?Q?wRyeNo1qn8pXvDLHRq/NIOOVlL4OLrqabk/6YX4hgE8SyDEkrpOhSwC0uMuw?=
 =?us-ascii?Q?qgM7cK9rLSt2bFwNxkjzxckCgnl3vZ7wSDzFmuL/MWwHiSL2sGQxY8Ml0kRb?=
 =?us-ascii?Q?ZwJ74nIcVxQ22u4LwPCVXVYOzmtm2aDgrb7ZvaD6ZbDaBcxyy341BlR+9O4z?=
 =?us-ascii?Q?s4LMdQzTxB3HXZYVpkc93jkuiSVTZpHY7y9t1irL2R9uXXhepSEyBrvlu96s?=
 =?us-ascii?Q?VCPX/RjV38uo20H64IIrbEWAJVr0zCCBT059E9gWfkLVe6T5b2DCmzSbX/Df?=
 =?us-ascii?Q?L6rD35rAaLMi1PkLfEueHm3T81PSCbzbm26lOGc3jLYmPHPgXILV4PB/Zfyj?=
 =?us-ascii?Q?+wXhgiY0B2lsb4t9TJKAus99RAAYXgYXTxec03unwlo4BJZ6fAeO7S9yfj1K?=
 =?us-ascii?Q?Gk3OduzgvZFB6wrFLS7l/LsNGC/QGl5dHwsXune3lCfOYDpGNjqWKSn6w+a3?=
 =?us-ascii?Q?gTdlqHLeH1dUC2EcjLM9bImy5D7MeS+SxHyzw4HdKgOVEj0fBuWNIa0HZRJf?=
 =?us-ascii?Q?w+5fGoa2elcCsiTwh8Kky/5xbNW7ekjfsmRF+S1yoU9kg6YbUdYYid36WeIF?=
 =?us-ascii?Q?pd4X+qhxWi5NVwB2z7XI60E84cWwUA//qLnWtbGP8tOp81ube1CmmdmsZr+D?=
 =?us-ascii?Q?o82NmIk7hdFTNMngMMPUvE9NszdJn5wMV3lDWTnux2q45TN63Blv2bp2iAwp?=
 =?us-ascii?Q?c1FwXH+7c8vboar1+waWWc+7qLLbOuoh7HSDV9l3k3Mezr+dmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gw3z/jFr1eiz2bJg1La27A3xUExVakjQRvYmOF+z6LuOS/hxGmmq6FnnAkV4?=
 =?us-ascii?Q?z53N4EJourBifDB+rxulvZSGYdonPOtjQzcEx9+te7TpKdBuN1ZCoIOOYfWo?=
 =?us-ascii?Q?t7uG7DUEGSFkplGxikrULfoCSKZl8Iq5p4SR0BB4Pz60E0kEJwGq+Io6iKYt?=
 =?us-ascii?Q?nXl6s0XbQjE8LvWl4ng76ZcTNji/luggUJQUxTcvI0t8olXFRs1R+rTt1atY?=
 =?us-ascii?Q?5xr1tVux/8lbDjIsI8QXDr77VCm77WKPQcrF1grTDkHPWDscpcFM/z+0Eh/g?=
 =?us-ascii?Q?IjoLymWrTP6LxWfacvgwchwzeCWm7F5cCBs8okwXxo4B0CnHCNOuPYalGHeZ?=
 =?us-ascii?Q?R2v1DqREwrDbCLcAo5JiV6QjNtiK7Y2hZY02+R1vinuA07mVJD8k1l6HnzYK?=
 =?us-ascii?Q?BvTmyLsrXcbGOoBTZpRfYmmmugIWKzU2Dj5cm2nHNUFU8Q/IYYoCzooXgtSZ?=
 =?us-ascii?Q?grHo29gbdtxmQPAnS17C3VX4ctwifPTfkfJOjw+6dwKiG0AzoYyjXeG4INYd?=
 =?us-ascii?Q?h+LU4aprHxEqwsjsbreWvyifRGzPBhy+oq2opqCB4YsBAfW0sSMbKqttja1B?=
 =?us-ascii?Q?KUTgHJ0sq5xFrIfM/BJMOSVPD353fKjRqcDqphCUDhl6mc7q4LH8jDsJzrhg?=
 =?us-ascii?Q?czwW5CMeb8sHnQk+p4/9aitOzetfFcUYn4jwzVnkMi8WjoYV0J4Auz4JITTv?=
 =?us-ascii?Q?RbxFkhj2TCD2nuFhRggDhkzO1iv4mBqDkB6wL42nGYKPvteEa8mxbySC6OSo?=
 =?us-ascii?Q?BAOYbbkL2xGZlQ7FQ+UUtKfGKMqFPMjBjqz1QMuK6wVBXdX9G+Z6lGkz8DVN?=
 =?us-ascii?Q?/TcoqtjdxaEX8oX1h9jMxA5vqFPrX+66n6d5kqEIoA9UmGHm/uRdDQJlz5uZ?=
 =?us-ascii?Q?0wQNW1iFxc7QFfvgD+LUOvfNU6AW3TyescM9JTNTEx/p/uXyauVTgZhg+gm3?=
 =?us-ascii?Q?jzdQc0GOnraelEA2KkgG4IQzpppWJBHzKYIpwBjPGMTzl+oqLS+uH7WPhbzG?=
 =?us-ascii?Q?pV/iyKIzAdAthcG+VJYvsb6m3H7ohLpSdL0eE+1zzOtBfzozKWcMXaUk9zio?=
 =?us-ascii?Q?xru6DRDQlp81oZC0eM5hmbdMSsU1DUN1q7JhLPFG0XQwFpXPvwO7Q6MRqf1j?=
 =?us-ascii?Q?J+1wdL/jfD09668dw8ASHoFYb0TpJJgRM8t27HuYlZAnkxeq+R0sF3PS8JyO?=
 =?us-ascii?Q?8VuOMdmkXmxYYKZAZpynnWS0P9tVKmfoLDdDk6wCj1sK32ftgviNoySdKGWH?=
 =?us-ascii?Q?k5Z4yThM28AwWC0wsBEZR/DmrWRlwp0JFZJU2DZiQMniLOGhcHO7ndqLRBUA?=
 =?us-ascii?Q?8zKVcJr/oct/CTjtRgB6PWlC4t5g9qYJbxYCIc4v1rLK+b9yqSt7Ku5we4Mm?=
 =?us-ascii?Q?V6y62kFzN0+PP+0zXWrs7IEN58pS3JW5Gen08FJQN9gFnxIaPCVzbf0EnrVc?=
 =?us-ascii?Q?oPhbKTJ9fh6FGVFDeZ7soaAgNN0wzZHd7qV1JlxA2TN0LVMvD0Q+PIeYWyRv?=
 =?us-ascii?Q?y6Pfk5yv/EqHaQ8sC7/cxZ63Y/0sjR8sx/bNuDx4fAzVbUaeImRx/tbRqzX9?=
 =?us-ascii?Q?8siXbPKQM6I2SN2p5XM7Bf1Axd1m9k8mkSBNrfA98Cp6m9nUvPjJcjBCoI3n?=
 =?us-ascii?Q?W8nBHpCphBSDdQjjsoJ/H/c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad2dd73-13b5-40bf-7095-08de18adfd5a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:47:49.4933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmNmW87mLoaIK/qYbKbqZZpcpSQu6fqdH+i5yYko05WLXkr/6oTuzI/kqWtlaVRogvF2rAPl16Jp0/dkf/pooxjVuklUBCZgy+3fRbkRFpwT2LbqLeiL1ULEy8GheiPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
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

On Fri, Oct 31, 2025 at 11:29:20AM -0700, Niranjana Vishwanathapura wrote:
>Multi Queue is a new mode of execution supported by the compute and
>blitter copy command streamers (CCS and BCS, respectively). It is an
>enhancement of the existing hardware architecture and leverages the
>same submission model. It enables support for efficient, parallel
>execution of multiple queues within a single context.
>
>Add support for multi-queue feature and enable it on xe3p_xpc.
>

The IGT validation patch series for this feature is posted here,
https://patchwork.freedesktop.org/series/156866/

The Compute UMD multi-queue usecase is in the process of getting
posted upstream very soon. I will provide the link to it as soon
as it is available.

Regards,
Niranjana

>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Niranjana Vishwanathapura (16):
>  drm/xe/multi_queue: Add multi_queue_enable_mask to gt information
>  drm/xe/multi_queue: Add user interface for multi queue support
>  drm/xe/multi_queue: Add GuC interface for multi queue support
>  drm/xe/multi_queue: Add multi queue priority property
>  drm/xe/multi_queue: Handle invalid exec queue property setting
>  drm/xe/multi_queue: Add exec_queue set_property ioctl support
>  drm/xe/multi_queue: Add support for multi queue dynamic priority
>    change
>  drm/xe/multi_queue: Add multi queue information to guc_info dump
>  drm/xe/multi_queue: Handle tearing down of a multi queue
>  drm/xe/multi_queue: Set QUEUE_DRAIN_MODE for Multi Queue batches
>  drm/xe/multi_queue: Handle CGP context error
>  drm/xe/multi_queue: Tracepoint support
>  drm/xe/multi_queue: Support active group after primary is destroyed
>  drm/xe/doc: Add documentation for Multi Queue Group
>  drm/xe/doc: Add documentation for Multi Queue Group GuC interface
>  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
>
> Documentation/gpu/xe/xe_exec_queue.rst        |  14 +
> drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   4 +
> .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
> drivers/gpu/drm/xe/xe_debugfs.c               |   2 +
> drivers/gpu/drm/xe/xe_device.c                |   9 +-
> drivers/gpu/drm/xe/xe_exec_queue.c            | 414 +++++++++++-
> drivers/gpu/drm/xe/xe_exec_queue.h            |  51 ++
> drivers/gpu/drm/xe/xe_exec_queue_types.h      |  51 ++
> drivers/gpu/drm/xe/xe_gt_types.h              |   5 +
> drivers/gpu/drm/xe/xe_guc_ct.c                |   8 +
> drivers/gpu/drm/xe/xe_guc_fwif.h              |   3 +
> drivers/gpu/drm/xe/xe_guc_submit.c            | 612 ++++++++++++++++--
> drivers/gpu/drm/xe/xe_guc_submit.h            |   3 +
> drivers/gpu/drm/xe/xe_guc_submit_types.h      |  13 +
> drivers/gpu/drm/xe/xe_lrc.c                   |  32 +
> drivers/gpu/drm/xe/xe_lrc.h                   |   5 +
> drivers/gpu/drm/xe/xe_pci.c                   |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
> drivers/gpu/drm/xe/xe_ring_ops.c              |  68 +-
> drivers/gpu/drm/xe/xe_trace.h                 |  46 ++
> include/uapi/drm/xe_drm.h                     |  40 ++
> 21 files changed, 1276 insertions(+), 108 deletions(-)
>
>-- 
>2.43.0
>
