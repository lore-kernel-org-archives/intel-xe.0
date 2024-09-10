Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC86CEDE9AF
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FD510E167;
	Tue, 10 Sep 2024 18:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajBLP6iL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEAD10E167
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725993876; x=1757529876;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lrChNxAmHo5YqNBVht/9d5K9JH5WwhfG7S7qHVmFVaU=;
 b=ajBLP6iLsOikZND7s7wd/MDNmMyfuCN3fziRWaFc8bN8uZ7q1tqKLxrt
 owXDFM9nKU+W0vZ6h7SoLaw2Pm2Q+oY35/iiaNgQQdYahTG8GyQc2QD//
 JlL8BOeAfY7t/92NyQ6RRsJdcKByYRPDrQ4K6JvYQsymKpG6BvJikzbA6
 qRlVY9jw1SROP4Ph8c9b9dULtbSftizuQr5igy0qzG1KuD2H6363yygTp
 FcRYO7LMBAAmiNswq0sEsJ6KVbRRzwnQQKqHbm/LbYYsapiNyJCSgAL3s
 enIr+Fcmr+iYU8KVi3nefphBTT6E8Uz6pp+94HKj8xgifwf6deetAucu+ w==;
X-CSE-ConnectionGUID: 4gRK4UhPQFGrMh+iGEXg+g==
X-CSE-MsgGUID: K1nbwvVTRwyBpHETO09oog==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24907578"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24907578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:44:35 -0700
X-CSE-ConnectionGUID: 9HC7HpKrTCKVPMRJIiWBEA==
X-CSE-MsgGUID: FkjnN/loQTybxNWxMDocAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67638393"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:44:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:44:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:44:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqZ/ufZoRTseW5aw+m+jk2/7tjbYHFFo0fPwdz7IZs/2a1Vp5APdgfcCMgs/GEW2TGsXWZYT/mEk1DCIjvST80W4hClNw9RA/+cUlj3f1V1S8Z7DC1iC7dlUVdt0lGGCCNrsVnqWgj7YxlDWOdr64PQF00zyOa3xEbOOPmx3VLa1KMwqw4fJvG+FhtlJe4NRFlLLPdTXM1UoEJGJUbnxXpZCELsNA8VZ1Y/yq6Yat9tWbwZI9G50CA9VMh81tloyokUhS1WsvdYKmvKM+rwgG/C8YTDQrn4Zuv9S9KvvY7p9jqvNWC0J3p3JGZThswekAaoLl7N3yrQNqSn4DvvLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sLDrgUMBrnuvAF4G+2B2w9DVRKAFvgzZAiaZcAmXUM=;
 b=TxskWIp/0gOHH40aEIiWoVONQi2ngcgt6DSgVvD0ujOljmkbnLpHS+2fueBXaRlSwR949jdkSRX6qo8p71OBHejbKDELsEDv60EWnt5v47vU91rvJboZfFrI27q/rmJcAQKXOxpZbcAM8PbsxJmmM+gqHRz6qQvdi/lYyUcpqJhMNOFI4CRIlRbgkneVjw5XnV70VtbpAVyPjJq1xU+sAue2XdGCLE+Dt3JP26i3fmBLfivptumCCmZsGJkSA/O6QRvldCyQVa9koYq6ySl3M0pdvPKOjQciQt1N+OpJ9+dOpI5gSDrLKhKNbU55jZLxDRxbPbhGyWGbuKoM18gg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:44:25 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:44:25 +0000
Date: Tue, 10 Sep 2024 14:44:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 24/43] drm/xe/query: Convert register access to use
 xe_mmio
Message-ID: <ZuCThXVCy2nryjA3@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-69-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-69-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW2PR16CA0055.namprd16.prod.outlook.com
 (2603:10b6:907:1::32) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9147e540-0b3e-4d4a-7496-08dcd1c89731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ORIttPA140BSLB3gkPfwyEzL1UprycwhaMtsXnJpZjtsA2A9y5RHwxu1reW?=
 =?us-ascii?Q?S9jJwjlV1WGg+ZvwBEoXoIZoGMRNIMwPPOYYsR0ruexffeCFGscaubsi6ZD9?=
 =?us-ascii?Q?2ZPIiQDssedxU3aABa3Xbn4MCz2dlh66GQO2b55AnfFvh1Pjq7xrA/sUu44x?=
 =?us-ascii?Q?vwSK7Q6sacD1+RtHaew4HD6oM3NtyYFqqDfv9f3TxgMFOvDtkG/GOjE0emej?=
 =?us-ascii?Q?X5fC/rRQiLUWE+0+JmUhkChyXRemWWNLR65j9KUO+qv9QGD14cGRfdgppF9o?=
 =?us-ascii?Q?5fGgIo34gWDwDqwAnKnCQzLYR0NKpTNYl5POKxDLSF5Zen520hNMRtnSzeoV?=
 =?us-ascii?Q?srjLLxSQqH6lemRaq0wHShWSPUMusc6M3zMb/jKwIKyxpAnWDYZxqAkTqD0t?=
 =?us-ascii?Q?P+xcsqnM2lAB/1Qfi3rww+cFyFwUxrkCC3LucYC13ea7VNHOfybl0ZXXjsJy?=
 =?us-ascii?Q?ETN6ZDGJa82/OGm30Y+u7/aPLfgfKXDhVnlYgxvWKNLSJAuIlvwydq3LMSmV?=
 =?us-ascii?Q?PCqiIprUF7JDkvGGl16pT3giobzttm2cu+ac3VdzQPgb5aqaPKY8kRBPBTde?=
 =?us-ascii?Q?Uem9DCodAQuixZmXiF2S/aHTQXnCuHlg+6edcN88G+qAr8i3PDIjizf50apM?=
 =?us-ascii?Q?9bucBKNQ62XeKQ8cenR47c0dSLeyfvfAaSvqLY8zGx+bNNYKwItoR1Ob1IsV?=
 =?us-ascii?Q?ifCX76ZGNhNaCufT5LVG1w9yKX5W+5OZPHZkD8FFZ2dsVGcPM7tk5VqZkgPb?=
 =?us-ascii?Q?9f5l2zoDDnH8RE3l3nm5e8HbkyVQIE3bQMm1/KyCFXaADuAQ3zotrEJk0naz?=
 =?us-ascii?Q?eE8Z6u9F6wz3VMtkwesGVcQaBEGMb7fWCl9hJZVpRdG+FeNQkSocJ6Uqn7mr?=
 =?us-ascii?Q?LlJzVGScLujUwl5RS7gndr+bHq1S0uijxRP2GsdEz+aEO+fQ82XY1Mz9YE4B?=
 =?us-ascii?Q?zlzqSyArPZKtT+qLx866vODwDnRlbEoUPdKm4iUkj8D6jYMYXA11FpPTNkVK?=
 =?us-ascii?Q?SMPeXeDAmaitmN+56Dw4WJfRsgkTFluLtQRK/2KNuB79/m/bdyW/JhXpRc9k?=
 =?us-ascii?Q?pBS5PHgvDJbRC58rFynQ5poxi5RSXXrJokoc7TN62T3a0CAed2SgctK/ZR0j?=
 =?us-ascii?Q?j5MboyPqoO0WqgRMzi2HJYlJiyDnvyw2+TWKu3HjRUv3++78QzzCEcSx4LSc?=
 =?us-ascii?Q?7Xu9aYo3FgesVrMt7wZBNzx7eQ4sP2qBX4IJGa8PH2ggS6Bi0RXU96s70MFN?=
 =?us-ascii?Q?m7EYyymU3vUXlqa5jqgijFgKLdSaITbBd5ZRjrcrcBX2uODaQ2faKcJpL7+p?=
 =?us-ascii?Q?QQdfdMw1jGMN3ZQBKAnfYwgvJpNbZPGVjFAucOwX/lEGYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fTxKeVjJo1NCeWHjzRB/h6OO4XTgq8GwNgvxHDlsqELGQhciWViAFLDIAEqS?=
 =?us-ascii?Q?Z3jwOlmU0rwm6kzgKgCqYCBOA/0D2wex/4wKXU1rfjOEQYZq/S2MR5waRtV2?=
 =?us-ascii?Q?koWj22KNHsnK2qiGTPQQRoh4d+M/bZhYJKe2qpBBsAoqstOjZ2/C2zz0uKbX?=
 =?us-ascii?Q?EIPgaZ4aXAe9Vmg7WBxVrDogkuwmnsihvFj6+oHk2v6tFjJUs2y7yCFYyRRB?=
 =?us-ascii?Q?HxgRiMuKhx66GHHT412x56p2Z3vmT6409rPMgRVILJCFLAMo8Kqkcz4niTZg?=
 =?us-ascii?Q?aHvzsLboZJqk3yTrXihB5eYabfoOvOB0p/M9dvlUIYJ07IRcEzJc7Um73EYw?=
 =?us-ascii?Q?kbhZR19oqwtS/xHSOeXbWZbWz1tKKGQFXBb4+0r7rkGvC31zIxo4DcyvICYE?=
 =?us-ascii?Q?9HpQVx1AZxU+YsEze5UrIpFscyG9OW28v5HpQjRwPSKt3kpNOpqioqVk89N1?=
 =?us-ascii?Q?F1pfqBlE65T2+aR+oCp9cu1O4LnJvzL25g8tBLQaWtsUZV1d8tPtrJeBTmbo?=
 =?us-ascii?Q?s8GExPdYsbeCMJkcW8H8YvK8gaf73RsSN1C/We4WurKVbENqeFUkBoPCpObY?=
 =?us-ascii?Q?n8FXd9vBgRnqcf0Aa6Scebxy5zmRmvKGcAeErl8RaC2gBaKAqsAbdGobYMq5?=
 =?us-ascii?Q?PDy9BLw/NJdpGrroQJ1LzgPnvCNbMChTt8I5xedPmInorNVQjnI8Yiws93Rg?=
 =?us-ascii?Q?InBf3RerVSGq7k/36UP83YFN5ZPxSE1hQScvKsI4kEM1DM3BN22XWWdwPv6x?=
 =?us-ascii?Q?TBRS81ggu4e4sVteKxjF56BiL/9Q9WXBCupy1VU54DlDsJflK2ogAYFj3rep?=
 =?us-ascii?Q?sr4yqgrPkwtcFrrllQDhbwu9gVwFsxOAwGZF0MoC5+xmLqRyFbhVMLW8xzax?=
 =?us-ascii?Q?lCUx+Wf6zjY7Aq2FThJltjjyQ/weSd6feu7LoWYk+A6YACHZKKQtff4uJ+wR?=
 =?us-ascii?Q?MG7Gtu7Y6xJfzBO+IRD+nlRD935o3kvNEuwU4CMRG+8ptUJULNuqcaQFfIAo?=
 =?us-ascii?Q?ID+3vVPdaZSMxB97peTJr1s/2ngjWRYHotO9nwLxTCfiPoR0UJzTqdn9cXxz?=
 =?us-ascii?Q?z4Na9jP/2Zgu/7dxiG4VnK6izTwLXgm+1uodumP4T1atYbY31wAJ74ig1Ad3?=
 =?us-ascii?Q?1HfeuE3WfRs7ML0AArCcvfbyDWeD2redRlDBz+nWNxl5qe/WIY6ym2flFaWH?=
 =?us-ascii?Q?lRTC130Env0EptE/g/6wcuOhbRJa/uE6+WHJBq4ZOl6baTaubjGxAURyo50T?=
 =?us-ascii?Q?H463pHTiWx72jxjxCgSod7+bnZwEft4Q8uQeESBYBwi3fFz6IcEZPuf1cczJ?=
 =?us-ascii?Q?RnecflG8NLkSrvlaRR6DWRhBzcH5Wg21+WSEbZnymrSSKCdVohMaU2LN8oK8?=
 =?us-ascii?Q?/SBNn0QMdC7QuSWF2e9z2iq04k/YfTGI4+XVyFKmkXayPUmDgYAAEhw5G/04?=
 =?us-ascii?Q?JcZBu1jQ47Gckex1dHTk1WNU9whLcex2Tb0YNvqQayM0Zt4b4V9K7XU2fa+4?=
 =?us-ascii?Q?3vHUpDer2x1Y8uLS14/AphepSvty5N01OR/I6RMGj9WDcc43gByBwD2wgQbE?=
 =?us-ascii?Q?lZuy972PlTiTtUtWkOBv6OMs2sAQ21Q9C2oJiCG57Qcrc53SlRT48tRMn3aV?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9147e540-0b3e-4d4a-7496-08dcd1c89731
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:44:25.5808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmrf11/N2Aus6j13Nmgs+loZvw2xNnVEVJzGc+wj2vCLW5GMQsU9NTiVbx9eqgQskq36iS3UN0fQWxq7TVl7Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

On Fri, Sep 06, 2024 at 05:08:13PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 28d9bb3b825d..5246a4a2740e 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -91,16 +91,17 @@ __read_timestamps(struct xe_gt *gt,
>  		  u64 *cpu_delta,
>  		  __ktime_func_t cpu_clock)
>  {
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 upper, lower, old_upper, loop = 0;
>  
> -	upper = xe_mmio_read32(gt, upper_reg);
> +	upper = xe_mmio_read32(mmio, upper_reg);
>  	do {
>  		*cpu_delta = local_clock();
>  		*cpu_ts = cpu_clock();
> -		lower = xe_mmio_read32(gt, lower_reg);
> +		lower = xe_mmio_read32(mmio, lower_reg);
>  		*cpu_delta = local_clock() - *cpu_delta;
>  		old_upper = upper;
> -		upper = xe_mmio_read32(gt, upper_reg);
> +		upper = xe_mmio_read32(mmio, upper_reg);
>  	} while (upper != old_upper && loop++ < 2);
>  
>  	*engine_ts = (u64)upper << 32 | lower;
> -- 
> 2.45.2
> 
