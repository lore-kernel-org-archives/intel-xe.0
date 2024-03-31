Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED27CD1284
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 21:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E310EA87;
	Sun, 31 Mar 2024 21:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpGH+bor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5794310EA87
 for <intel-xe@lists.freedesktop.org>; Sun, 31 Mar 2024 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711919061; x=1743455061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJBZa+S/Ic16MbO7Y96XrAFfGHgwE+JnzOssW08c9Yg=;
 b=BpGH+borXYD7W7PqciMU5XnT/93xAhxB2MTk8yHHAqJrp1RGk8Jcu+Sp
 za1zpFzMKvDa77GqPkzbFM6ZXluhWzHqXD2Kq8Zx/XfFUBEeSwiSvtYXO
 JBDhdP+bV0sFfzdedd345Hm5EotvFGHebku2z3CvZwYdvsm79W+U8phRY
 JxPfF5Oad077NXDdYfAvhCGZVLDnlhZLAEUz6qME5YCu69Xn4Y59C2zx6
 CbW3W7Ip7v+y+9H28WBD+timTvtAAoYjRT/FJDQhi1egrrrSXUCaHvvDM
 tefxersBIEtwDWKvFvO9AWcdWvhJdnoO4ZCheUEvy64l/Uw1HYTxQjcJM w==;
X-CSE-ConnectionGUID: yHXzwMSpR7O2GueyfP+5OQ==
X-CSE-MsgGUID: v5OOHEPCQ+CEAcY2BBswMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10868590"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="10868590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 14:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="17593503"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2024 14:04:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 14:04:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 14:04:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Mar 2024 14:04:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxAzaW4mjG4jBUWmvSs9d7xkysAg9m4Nh0WWpuNL9tYhVUV8wuh52XmOMS5bssXzgfj/FPlqh4GdkRgP9+kg4gJ6k2Y+6iz/QQ8VNX+k50C5YxrsZhAkWHUemUbh8NUEZLQV78i7ne9DZaeP/g28LvoMrAC9Q/AH+RrOKon1dostLJ/ewqpTEYjTcGfez5UUSBuTc72vOs5y+ceoVoHB1i4+6bBmRbByzy41Us/iR5d/zWjnOK7WUY7kMYJ0szbXLGkPRikPyZp4NAKXS8DImdfbwm1esQPb6kIgy88pYBDR9/EYU6G90pDLSbQL5NtiGqKGLmJXf0m065V4QicGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmbV6UB7AzvcFty/qMS20fcAvl7+aj9bFkkfiayUx3Q=;
 b=OCojYyfkBnVI0Zk95VqGFUhEUur9lDX9eV0sRtV9CyDJiEavjkkKnWbkLyzv0os7cUcEzclExYw8owpc9p9JybHn6Z2xUZNpSd+HlsIb7U03+G3sV09VOYksMdfDBrMEbqlgSvKPo8rCoT2aCspiZTu39RfGYVBQFOI0tp/C3r/qFL71F6DDmp9/0MP70Ky1NMy6J9fpsS+D7e2RWQ5r5L0bUrZ/m7Gi5triuqxkun6uQGz73tAq1wAel8Jk5BzAebdIA6aguN4xn+qcFxy7h19VN+aQ+QSDkzRn1AOK7Fc0wzjxxfvasLe/uVLgmSa6XSV+KjDuMjI5HzLBTpoW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8356.namprd11.prod.outlook.com (2603:10b6:208:486::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.23; Sun, 31 Mar
 2024 21:04:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Sun, 31 Mar 2024
 21:04:16 +0000
Date: Sun, 31 Mar 2024 21:05:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Janga Rahul Kumar
 <janga.rahul.kumar@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH] lib/xe/xe_util: Creating the helper functions
Message-ID: <ZgnQC5U913pbe4gT@DUT025-TGLU.fm.intel.com>
References: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240331185949.110269-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRljjoQtp0pou6+AetQBkRAIcfukvMyQDN5/RNoqypnRoqGnwjj4iubSazUdtewHW3q9E0MDN1UKQ2Diau3XTil7dv0sdnZEC7upUzryZKCnObooL6eg/ai+QMrdNczB7Ip1a500jhLaDs1LGQ9sf6QsZddPDOIdbU4swyHPcnEyIs8zOQTkq8yHzcXEx6kI2MjulP13Kgv1IqmohfR/IXq9MrbyIFIoAgbGaBKV1X+GCsgaxsXlmRYm5qc+fSCiG7feoTb94V2g1D4UtBXUcCPgI3StAO2uP3ejRfjUWBdkede0jzX2CSdehz5eKbyeYkuQM94e3zQTTxM3Nf2PPkmaf8mXhSllpWSTGO/wZds4eJqw41DRfaQQeRKVcai+yhZOFmcNLOxnL50s5aaeCC0lvt99yOoOltbR92JWTv5yd539ini0cYkaYgvdUcA9J0+4FfCzAnA/UsKjBnM0kNv74JZMbEiZJzHyta1MlENMFCFaUfFlrR2bJzJw+uO86OGDZShPJGWvhHish45aQbeHDoXVuDjB6IGiN7aS2OpbHkGTlcpeJrKwF/MGCwK42qMWCjkELnsDQB1TtcqEMF3wJmdKUxH+A9UKX6gG1ZHe7f49WfAmWLqUYfD1vcI5Sa32OpfCJMw8Af3vdHGqofxY7q3L9G6oNgp1LX80KNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uqZcO0sRsCbe3fkZ7qCvjwYn5tKmV6EfLAsqAoerEB0uGvckKg9CfC/S0WXI?=
 =?us-ascii?Q?fVcq6K4RSWN9mDgkq8fBevSmLGYc/DOZHSw3AdTOJM+0jKctjtTUUG7d8C1d?=
 =?us-ascii?Q?YcZ0CJR4CnSN/3VCQAPEOGjC9P7WpxXp+PwS0mbC+M+gyNGOC8s9aSzuGJyh?=
 =?us-ascii?Q?yXtkEqLkM9Ps7vvd/wfKMHVxtCEbMyIh4OjgtaMz7LTR7Pij6Eh3kXoGfxcZ?=
 =?us-ascii?Q?5uNTlFhEdSaqyQS1TitcPoHXSM+vnka9If5Oq62ERw8cuTQ+9KaBt5ON1ZW3?=
 =?us-ascii?Q?z8DOf/cmcJH+Lr7ycoMsijMS7qxQ1fLyCn/egSjwVwuT2OtSDtW7UpANO1km?=
 =?us-ascii?Q?KJmkJQoIVsdRRzuf4vurJmbh5sF3OHRpVhP24XZXHDi9Wbt9bdylNRADxj1G?=
 =?us-ascii?Q?bieSDbLat3Cf5+mpyBocDcW6A+p8inA+yj5RdCUn/D4r0x4Jh1gCOFH9ehOz?=
 =?us-ascii?Q?9urBQcEuxkEmu94yytJHrGgDQ4EE7sD2rt2OhwK28HyHursXKzLVueQ1O5Oz?=
 =?us-ascii?Q?dLJiuEXAUGByRma3xXfZCZ2Yy7XIEHUAA+MtbgiE633t++i5dGHuYbiosAKh?=
 =?us-ascii?Q?VinpNhTTZP+l2hXdv91X9iYN4FwKQqpdrWsDn7LIVfqMwOJtGKD67HW34an+?=
 =?us-ascii?Q?n16UAHx/YAwS68FoRKwZCltAB6TzeFKHpLt0agNqfInWlh6/ARMv28sPUCUo?=
 =?us-ascii?Q?A8MrtvZbmvv133kCqjiPvcIsqev3c9WPUYYNbqMBQD8cMo1248WXbDoJb1SB?=
 =?us-ascii?Q?al8ZX/rlqpDXaKrD3xq3jCzxvBdDbB28P23nus9p/2ChAz7R4hZG2UV2GL5W?=
 =?us-ascii?Q?Pd/lYCfvd9VZV9HEBCdOnzxMGXIgFmg8qGOvc5ORGX3cI85aixT+rcKb4UHu?=
 =?us-ascii?Q?zdSl+D/ExrCVSvLMcQ04C11htg/9D8n3eHKtEeII4CQwKDY/KZNlXVgj648i?=
 =?us-ascii?Q?3FDIU+q0yaWCwCuZv5g/89C2QjuFCZWk4cvehuoffcGh+QgNTM/dhSNZNTrU?=
 =?us-ascii?Q?kBTDo9Wj+gPED7WdUc0qZy0RVx45AvoB3EXccmEta3fJ4okwG4Uo/uIOH2Xq?=
 =?us-ascii?Q?3aRa/j+V4DQQprWM8On7peVLFWbdnaJugcgQqIE1Qyw3l2p4U4Cm3m8mKIZK?=
 =?us-ascii?Q?l3HjeRX+Y3VFh+JEf7hualTF+qWMGeWXmnViyTRr8xagAPjCB1m/Ln5M3ojY?=
 =?us-ascii?Q?XKYICfREMjcE6F9NFw0Rrud57CBFtGtOJVL2OSEtTCJCXu64hthui/GrM2iY?=
 =?us-ascii?Q?FBaodZv5xEjkPwzWumpNDR28vdQnCtWm58X57UmGZA7mEQaWmaES/iztlY2/?=
 =?us-ascii?Q?1LVcnxgxH1Jl486lJ8126VI50EZrDbcIQoqUvQMPWK7DPzOmvyHZnlCDsSsq?=
 =?us-ascii?Q?7Vec8SthzOgEidTQcNfH/OoHyNs3wWXPNvSEJSPYa9ZpiumKTtcmKay7tdDD?=
 =?us-ascii?Q?9EOvAiXoD9S0Yv2LyoCnvoJb0svfjGWOMcEnYTpXqwiPNAms7MleyL9EJVfa?=
 =?us-ascii?Q?y7VMofbE79D07r/b4XWGelTHRxeyNglOf84ZTkWuqeHjRTTsryZAHFPNOQd2?=
 =?us-ascii?Q?uDIVCk0tKEpL3/Ot0YZ6YArcwmv3DI2zgAWKjLwMZaaGuOPEG94mDOrepNLa?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10832b02-02f1-49cb-23bf-08dc51c62007
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2024 21:04:16.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWz0ZfhXwqNSrAzpgR0nRUUIWCi3dp/lT/lHruu1Nf4gKI6LrmiFQGt293nVnifcZ+8ORr3GQ49CyVf/pa2heg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8356
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

On Mon, Apr 01, 2024 at 12:29:49AM +0530, Bommu Krishnaiah wrote:
> Creating the helper functions which can be reused by many tests,
> as part of this patch xe_exec_compute_mode and xe_exec_fault_mode
> are used this helper functions.
>

As the author of most these tests and IGTs, I can say while not great to
have copy paste between tests I much prefer it to adding helpers to try
to jam the needs of each test into the helpers. IMO this just creates a
headache in the long run. e.g. Let's say I want to change the behavior
of xe_exec_compute_mode but not xe_exec_fault_mode, with shared helpers
this gets harder.

I'd much rather leave this as is.

Maybe I can buy a helper or two to program the batches, i.e.
insert_store LGTM, but certainly not the logic doing bind, invalidates,
loop, etc...

Matt
 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> ---
>  lib/xe/xe_util.c                   | 194 +++++++++++++++++++++++++++++
>  lib/xe/xe_util.h                   |  48 +++++++
>  tests/intel/xe_exec_compute_mode.c | 190 ++++------------------------
>  tests/intel/xe_exec_fault_mode.c   | 179 +++-----------------------
>  4 files changed, 282 insertions(+), 329 deletions(-)
> 
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 050162b5e..17cd45e45 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -255,3 +255,197 @@ bool xe_is_gt_in_c6(int fd, int gt)
>  
>  	return strcmp(gt_c_state, "gt-c6") == 0;
>  }
> +
> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement, unsigned int flags)
> +{
> +	struct cpu_va *data;
> +
> +	if (flags & USERPTR) {
> +		if (flags & INVALIDATE) {
> +			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ | PROT_WRITE,
> +					MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +			igt_assert(data != MAP_FAILED);
> +		} else {
> +			data = aligned_alloc(xe_get_default_alignment(fd), bo_size);
> +			igt_assert(data);
> +		}
> +	} else {
> +		*bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0, bo_size, placement,
> +				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		data = xe_bo_map(fd, *bo, bo_size);
> +	}
> +
> +	memset(data, 0, bo_size);
> +
> +	return data;
> +}
> +
> +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags)
> +{
> +	int i;
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> +		if (flags & BIND_EXEC_QUEUE)
> +			bind_exec_queues[i] = xe_bind_exec_queue_create(fd, vm, 0);
> +		else
> +			bind_exec_queues[i] = 0;
> +	};
> +}
> +
> +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags)
> +{
> +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	if (bo)
> +		xe_vm_bind_async(fd, vm, bind_exec_queues, bo, 0, addr, bo_size, sync, 1);
> +	else
> +		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues,
> +				to_user_pointer(data), addr,
> +				bo_size, sync, 1);
> +
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +	data[0].vm_sync = 0;
> +
> +	if (flags & PREFETCH) {
> +		/* Should move to system memory */
> +		xe_vm_prefetch_async(fd, vm, bind_exec_queues, 0, addr,
> +				bo_size, sync, 1, 0);
> +		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +				bind_exec_queues, fence_timeout);
> +		data[0].vm_sync = 0;
> +	}
> +}
> +
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i)
> +{
> +	int b = 0;
> +	data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> +	data[i].batch[b++] = dst;
> +	data[i].batch[b++] = dst >> 32;
> +	data[i].batch[b++] = val;
> +	data[i].batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +}
> +
> +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags)
> +{
> +	int i;
> +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> +
> +	for (i = 0; i < n_execs; i++) {
> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr = addr + batch_offset;
> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr = addr + sdi_offset;
> +		int e = i % n_exec_queues;
> +
> +		if (flags & INVALID_VA)
> +			sdi_addr = 0x1fffffffffff000;
> +
> +		insert_store(sdi_addr, data, 0xc0ffee, i);
> +
> +		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +
> +		exec->exec_queue_id = exec_queues[e];
> +		exec->address = batch_addr;
> +		xe_exec(fd, exec);
> +
> +		if (flags & REBIND && i + 1 != n_execs) {
> +			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +					exec_queues[e], fence_timeout);
> +			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> +					addr, bo_size, NULL, 0);
> +
> +			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +			addr += bo_size;
> +
> +			if (bo)
> +				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
> +						0, addr, bo_size, sync, 1);
> +			else
> +				xe_vm_bind_userptr_async(fd, vm,
> +						bind_exec_queues[e],
> +						to_user_pointer(data),
> +						addr, bo_size, sync, 1);
> +
> +			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +					bind_exec_queues[e], fence_timeout);
> +			data[0].vm_sync = 0;
> +		}
> +
> +		if (flags & INVALIDATE && i + 1 != n_execs) {
> +			if (!(flags & RACE)) {
> +				/*
> +				 * Wait for exec completion and check data as
> +				 * userptr will likely change to different
> +				 * physical memory on next mmap call triggering
> +				 * an invalidate.
> +				 */
> +				xe_wait_ufence(fd, &data[i].exec_sync,
> +						USER_FENCE_VALUE, exec_queues[e],
> +						fence_timeout);
> +				igt_assert_eq(data[i].data, 0xc0ffee);
> +			} else if (i * 2 != n_execs) {
> +				/*
> +				 * We issue 1 mmap which races against running
> +				 * jobs. No real check here aside from this test
> +				 * not faulting on the GPU.
> +				 */
> +				continue;
> +			}
> +
> +			if (flags & RACE) {
> +				*map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> +						0x666);
> +				write(*map_fd, data, bo_size);
> +				data = mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE, MAP_SHARED |
> +						MAP_FIXED, *map_fd, 0);
> +			} else {
> +				data = mmap((void *)MAP_ADDRESS, bo_size,
> +						PROT_READ | PROT_WRITE, MAP_SHARED |
> +						MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> +			}
> +
> +			igt_assert(data != MAP_FAILED);
> +		}
> +	}
> +}
> +
> +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data, uint64_t addr,
> +		uint32_t bo_size)
> +{
> +	int64_t fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> +
> +	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> +	xe_vm_unbind_async(fd, vm, bind_exec_queues, 0, addr, bo_size,
> +			sync, 1);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> +			bind_exec_queues, fence_timeout);
> +}
> +
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues)
> +{
> +	int i;
> +
> +	for (i = 0; i < n_exec_queues; i++) {
> +		xe_exec_queue_destroy(fd, exec_queues[i]);
> +		if (bind_exec_queues[i])
> +			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> +	}
> +}
> +
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index 6480ea01a..aa1b0dcc1 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -47,4 +47,52 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
>  
>  bool xe_is_gt_in_c6(int fd, int gt);
>  
> +
> +#define USERPTR			(0x1 << 0)
> +#define REBIND			(0x1 << 1)
> +#define INVALIDATE		(0x1 << 2)
> +#define RACE			(0x1 << 3)
> +#define BIND_EXEC_QUEUE		(0x1 << 4)
> +#define PREFETCH		(0x1 << 5)
> +#define INVALID_FAULT		(0x1 << 6)
> +#define INVALID_VA		(0x1 << 7)
> +#define ENABLE_SCRATCH		(0x1 << 8)
> +#define VM_FOR_BO		(0x1 << 9)
> +#define EXEC_QUEUE_EARLY	(0x1 << 10)
> +
> +#define MAX_N_EXEC_QUEUES	16
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define MAP_ADDRESS		0x00007fadeadbe000
> +
> +#define ONE_SEC		MS_TO_NS(1000)
> +#define HUNDRED_SEC	MS_TO_NS(100000)
> +
> +struct cpu_va {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +};
> +
> +struct cpu_va *create_xe_bo(int fd, uint32_t vm, uint32_t *bo,
> +		uint32_t bo_size, uint64_t placement,  unsigned int flags);
> +void create_exec_queue(int fd, uint32_t vm, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues,
> +		struct drm_xe_engine_class_instance *eci, unsigned int flags);
> +void xe_bo_bind(int fd, uint32_t vm, uint32_t bind_exec_queues, uint32_t bo,
> +		uint32_t bo_size, uint64_t addr, struct drm_xe_sync *sync,
> +		struct cpu_va *data, unsigned int flags);
> +void xe_execbuf(int fd, uint32_t vm, struct drm_xe_exec *exec, int n_execs,
> +		uint32_t *exec_queues, uint32_t *bind_exec_queues,
> +		int n_exec_queues, uint32_t bo, uint32_t bo_size,
> +		struct drm_xe_sync *sync, uint64_t addr, struct cpu_va *data,
> +		int *map_fd, unsigned int flags);
> +void insert_store(uint64_t dst, struct cpu_va *data, uint32_t val, int i);
> +void xe_vm_unbind(int fd, uint32_t vm, uint32_t bind_exec_queues,
> +		struct drm_xe_sync *sync, struct cpu_va *data,
> +		uint64_t addr, uint32_t bo_size);
> +void destory_exec_queue(int fd, uint32_t *exec_queues,
> +		uint32_t *bind_exec_queues, int n_exec_queues);
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 3ec848164..e8d82cc69 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -15,6 +15,7 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include <sys/ioctl.h>
>  #include "xe_drm.h"
>  
> @@ -23,15 +24,6 @@
>  #include "xe/xe_spin.h"
>  #include <string.h>
>  
> -#define MAX_N_EXECQUEUES 	16
> -#define USERPTR				(0x1 << 0)
> -#define REBIND				(0x1 << 1)
> -#define INVALIDATE			(0x1 << 2)
> -#define RACE				(0x1 << 3)
> -#define BIND_EXECQUEUE		(0x1 << 4)
> -#define VM_FOR_BO			(0x1 << 5)
> -#define EXEC_QUEUE_EARLY	(0x1 << 6)
> -
>  /**
>   * SUBTEST: twice-%s
>   * Description: Run %arg[1] compute machine test twice
> @@ -88,7 +80,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>  		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -99,161 +90,38 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		.num_syncs = 1,
>  		.syncs = to_user_pointer(sync),
>  	};
> -	uint32_t exec_queues[MAX_N_EXECQUEUES];
> -	uint32_t bind_exec_queues[MAX_N_EXECQUEUES];
> +	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> +	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo = 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	int i, j;
>  	int map_fd = -1;
>  	int64_t fence_timeout;
> +	uint64_t placement;
>  
> -	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
> +	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
>  
> -	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] = 0;
> -	};
> +	if (flags & EXEC_QUEUE_EARLY)
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues, n_exec_queues, eci, flags);
>  
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data != MAP_FAILED);
> -		} else {
> -			data = aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		bo = xe_bo_create(fd, flags & VM_FOR_BO ? vm : 0,
> -				  bo_size, vram_if_possible(fd, eci->gt_id),
> -				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data = xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> +	placement = vram_if_possible(fd, eci->gt_id);
>  
> -	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXECQUEUE)
> -			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] = 0;
> -	};
> +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>  
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
> -				 bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -#define HUNDRED_SEC	MS_TO_NS(100000)
> +	if(!(flags & EXEC_QUEUE_EARLY))
> +		create_exec_queue(fd, vm, exec_queues, bind_exec_queues, n_exec_queues, eci, flags);
> +
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data, flags);
>  
>  	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
>  
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> -	data[0].vm_sync = 0;
> -
> -	for (i = 0; i < n_execs; i++) {
> -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr = addr + batch_offset;
> -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = addr + sdi_offset;
> -		int e = i % n_exec_queues;
> -
> -		b = 0;
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] = sdi_addr;
> -		data[i].batch[b++] = sdi_addr >> 32;
> -		data[i].batch[b++] = 0xc0ffee;
> -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> -
> -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> -
> -		exec.exec_queue_id = exec_queues[e];
> -		exec.address = batch_addr;
> -		xe_exec(fd, &exec);
> -
> -		if (flags & REBIND && i + 1 != n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -				       exec_queues[e], fence_timeout);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -			addr += bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -							 to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -				       bind_exec_queues[e], fence_timeout);
> -			data[0].vm_sync = 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 != n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE, exec_queues[e],
> -					       fence_timeout);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 != n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data = mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE, MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data = mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE, MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -			}
> -			igt_assert(data != MAP_FAILED);
> -		}
> -	}
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd, flags);
>  
>  	j = flags & INVALIDATE ? n_execs - 1 : 0;
>  	for (i = j; i < n_execs; i++)
> @@ -264,20 +132,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & INVALIDATE)
>  		usleep(250000);
>  
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], fence_timeout);
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>  
>  	for (i = j; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
>  
> -	for (i = 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues, n_exec_queues);
>  
>  	if (bo) {
>  		munmap(data, bo_size);
> @@ -492,14 +352,14 @@ igt_main
>  		{ "userptr-rebind", USERPTR | REBIND },
>  		{ "userptr-invalidate", USERPTR | INVALIDATE },
>  		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
> -		{ "bindexecqueue", BIND_EXECQUEUE },
> -		{ "bindexecqueue-userptr", BIND_EXECQUEUE | USERPTR },
> -		{ "bindexecqueue-rebind",  BIND_EXECQUEUE | REBIND },
> -		{ "bindexecqueue-userptr-rebind",  BIND_EXECQUEUE | USERPTR |
> +		{ "bindexecqueue", BIND_EXEC_QUEUE },
> +		{ "bindexecqueue-userptr", BIND_EXEC_QUEUE | USERPTR },
> +		{ "bindexecqueue-rebind",  BIND_EXEC_QUEUE | REBIND },
> +		{ "bindexecqueue-userptr-rebind",  BIND_EXEC_QUEUE | USERPTR |
>  			REBIND },
> -		{ "bindexecqueue-userptr-invalidate",  BIND_EXECQUEUE | USERPTR |
> +		{ "bindexecqueue-userptr-invalidate",  BIND_EXEC_QUEUE | USERPTR |
>  			INVALIDATE },
> -		{ "bindexecqueue-userptr-invalidate-race", BIND_EXECQUEUE | USERPTR |
> +		{ "bindexecqueue-userptr-invalidate-race", BIND_EXEC_QUEUE | USERPTR |
>  			INVALIDATE | RACE },
>  		{ NULL },
>  	};
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 40fe1743e..7b2fef224 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -16,24 +16,13 @@
>  #include "igt.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
> +#include "lib/xe/xe_util.h"
>  #include "xe_drm.h"
>  
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include <string.h>
>  
> -#define MAX_N_EXEC_QUEUES	16
> -
> -#define USERPTR		(0x1 << 0)
> -#define REBIND		(0x1 << 1)
> -#define INVALIDATE	(0x1 << 2)
> -#define RACE		(0x1 << 3)
> -#define BIND_EXEC_QUEUE	(0x1 << 4)
> -#define PREFETCH	(0x1 << 5)
> -#define INVALID_FAULT	(0x1 << 6)
> -#define INVALID_VA	(0x1 << 7)
> -#define ENABLE_SCRATCH  (0x1 << 8)
> -
>  /**
>   * SUBTEST: invalid-va
>   * Description: Access invalid va and check for EIO through user fence.
> @@ -99,7 +88,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  {
>  	uint32_t vm;
>  	uint64_t addr = 0x1a0000;
> -#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>  	struct drm_xe_sync sync[1] = {
>  		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>  	          .timeline_value = USER_FENCE_VALUE },
> @@ -113,14 +101,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
>  	size_t bo_size;
>  	uint32_t bo = 0;
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -	} *data;
> -	int i, j, b;
> +	struct cpu_va *data;
> +	uint64_t placement;
> +	int i, j;
>  	int map_fd = -1;
>  
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
> @@ -134,144 +117,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = xe_bb_size(fd, bo_size);
>  
> -	if (flags & USERPTR) {
> -#define	MAP_ADDRESS	0x00007fadeadbe000
> -		if (flags & INVALIDATE) {
> -			data = mmap((void *)MAP_ADDRESS, bo_size, PROT_READ |
> -				    PROT_WRITE, MAP_SHARED | MAP_FIXED |
> -				    MAP_ANONYMOUS, -1, 0);
> -			igt_assert(data != MAP_FAILED);
> -		} else {
> -			data = aligned_alloc(xe_get_default_alignment(fd),
> -					     bo_size);
> -			igt_assert(data);
> -		}
> -	} else {
> -		if (flags & PREFETCH)
> -			bo = xe_bo_create(fd, 0, bo_size,
> -					  all_memory_regions(fd) |
> -					  vram_if_possible(fd, 0),
> -					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		else
> -			bo = xe_bo_create(fd, 0, bo_size,
> -					  vram_if_possible(fd, eci->gt_id),
> -					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -		data = xe_bo_map(fd, bo, bo_size);
> -	}
> -	memset(data, 0, bo_size);
> -
> -	for (i = 0; i < n_exec_queues; i++) {
> -		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> -		if (flags & BIND_EXEC_QUEUE)
> -			bind_exec_queues[i] =
> -				xe_bind_exec_queue_create(fd, vm, 0);
> -		else
> -			bind_exec_queues[i] = 0;
> -	};
> -
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	if (bo)
> -		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr, bo_size, sync, 1);
> -	else
> -		xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
> -					 to_user_pointer(data), addr,
> -					 bo_size, sync, 1);
> -#define ONE_SEC	MS_TO_NS(1000)
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> -	data[0].vm_sync = 0;
> -
> -	if (flags & PREFETCH) {
> -		/* Should move to system memory */
> -		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
> -				     bo_size, sync, 1, 0);
> -		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -			       bind_exec_queues[0], ONE_SEC);
> -		data[0].vm_sync = 0;
> -	}
> -
> -	for (i = 0; i < n_execs; i++) {
> -		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> -		uint64_t batch_addr = addr + batch_offset;
> -		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> -		uint64_t sdi_addr = addr + sdi_offset;
> -		int e = i % n_exec_queues;
> +	placement = (flags & PREFETCH) ? all_memory_regions(fd) |
> +		vram_if_possible(fd, 0) : vram_if_possible(fd, eci->gt_id);
>  
> -		b = 0;
> -		if (flags & INVALID_VA)
> -			sdi_addr = 0x1fffffffffff000;
> +	data = create_xe_bo(fd, vm, &bo, bo_size, placement, flags);
>  
> -		data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -		data[i].batch[b++] = sdi_addr;
> -		data[i].batch[b++] = sdi_addr >> 32;
> -		data[i].batch[b++] = 0xc0ffee;
> -		data[i].batch[b++] = MI_BATCH_BUFFER_END;
> -		igt_assert(b <= ARRAY_SIZE(data[i].batch));
> +	create_exec_queue(fd, vm, exec_queues, bind_exec_queues,
> +			n_exec_queues, eci, flags);
>  
> -		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
> +	xe_bo_bind(fd, vm, bind_exec_queues[0], bo, bo_size, addr, sync, data, flags);
>  
> -		exec.exec_queue_id = exec_queues[e];
> -		exec.address = batch_addr;
> -		xe_exec(fd, &exec);
> +	xe_execbuf(fd, vm, &exec, n_execs, exec_queues, bind_exec_queues,
> +			n_exec_queues, bo, bo_size, sync, addr, data, &map_fd, flags);
>  
> -		if (flags & REBIND && i + 1 != n_execs) {
> -			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -				       exec_queues[e], ONE_SEC);
> -			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
> -					   addr, bo_size, NULL, 0);
> -
> -			sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -			addr += bo_size;
> -			if (bo)
> -				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
> -						 0, addr, bo_size, sync, 1);
> -			else
> -				xe_vm_bind_userptr_async(fd, vm,
> -							 bind_exec_queues[e],
> -							 to_user_pointer(data),
> -							 addr, bo_size, sync,
> -							 1);
> -			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -				       bind_exec_queues[e], ONE_SEC);
> -			data[0].vm_sync = 0;
> -		}
> -
> -		if (flags & INVALIDATE && i + 1 != n_execs) {
> -			if (!(flags & RACE)) {
> -				/*
> -				 * Wait for exec completion and check data as
> -				 * userptr will likely change to different
> -				 * physical memory on next mmap call triggering
> -				 * an invalidate.
> -				 */
> -				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE, exec_queues[e],
> -					       ONE_SEC);
> -				igt_assert_eq(data[i].data, 0xc0ffee);
> -			} else if (i * 2 != n_execs) {
> -				/*
> -				 * We issue 1 mmap which races against running
> -				 * jobs. No real check here aside from this test
> -				 * not faulting on the GPU.
> -				 */
> -				continue;
> -			}
> -
> -			if (flags & RACE) {
> -				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
> -					      0x666);
> -				write(map_fd, data, bo_size);
> -				data = mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE, MAP_SHARED |
> -					    MAP_FIXED, map_fd, 0);
> -			} else {
> -				data = mmap((void *)MAP_ADDRESS, bo_size,
> -					    PROT_READ | PROT_WRITE, MAP_SHARED |
> -					    MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -			}
> -			igt_assert(data != MAP_FAILED);
> -		}
> -	}
>  	if (!(flags & INVALID_FAULT)) {
>  		int64_t timeout = ONE_SEC;
>  
> @@ -286,22 +144,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  							       exec_queues[i % n_exec_queues], &timeout), 0);
>  		}
>  	}
> -	sync[0].addr = to_user_pointer(&data[0].vm_sync);
> -	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
> -			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -		       bind_exec_queues[0], ONE_SEC);
> +
> +	xe_vm_unbind(fd, vm, bind_exec_queues[0], sync, data, addr, bo_size);
>  
>  	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
>  		for (i = j; i < n_execs; i++)
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  	}
>  
> -	for (i = 0; i < n_exec_queues; i++) {
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -		if (bind_exec_queues[i])
> -			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
> -	}
> +	destory_exec_queue(fd, exec_queues, bind_exec_queues, n_exec_queues);
>  
>  	if (bo) {
>  		munmap(data, bo_size);
> -- 
> 2.25.1
> 
