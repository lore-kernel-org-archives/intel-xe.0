Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7C9CD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 22:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C6311343D;
	Wed, 10 Apr 2024 22:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXVRewkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B5E11343D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712787990; x=1744323990;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8RgQXVBgMEOcudJc9r7ls7QiMLwPqEgm2X5zwEY4fC8=;
 b=SXVRewkgrWaDHE+0AroBl67dfjadwY881OleRPLYwFHFy1yht3PMS4vK
 uWZuJN78IQN7vAX58pb32xE87BhEdlVLrI7KYvHdrProiMkWgS0eKGoto
 I7fUNTR/z0RzAoko2D3C01dtyzhqh6t0K45RkScnTjLTIc+29c829TPE4
 YUC2LNU27anmiga3O1I/a3P4hlqRsae9Srw8XMh3/Vc/bDuPIwb+GzAPC
 Ldc9xZIiUIrU+Ho/+A72PsHjvJIiP67yCArWaX+NwVaVNfWj79agFKenN
 U+g+qUsEHzuR4xnSRFc80Lvz+5Oy65okF2pBNMgUM8Fq8TtLjUNemqt+J Q==;
X-CSE-ConnectionGUID: yZv9mGjESa+2Jztkj+2nhg==
X-CSE-MsgGUID: ZJbvFDptS9eDf0DveWNgcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25633003"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="25633003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 15:26:30 -0700
X-CSE-ConnectionGUID: MVvMKhIWRoWXFWeqZDEIqg==
X-CSE-MsgGUID: 7F/S8NxcSQuJ3bdoAv7/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="51906468"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 15:26:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 15:26:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 15:26:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 15:26:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo9QCV+Kand5RJcl0URYAW/rUzl6Yb5Pa/8IN4IoKvLebqiQxyYpfMCXuThKLh51yeWSOVKpMCwxlqzQvRcIZ0hFBo+s+ORJSfvYYmxluzpTdXNfUbYXIVri2meGQbuRSnPWOnICiTzLZ7K1waY+DuYVNp6DDrPrRKaZ/Q5oxGTdFuWIlpfwHseCsbZVWCzeZsO9ZabL8lH5OARqJTqdxoeAhbMltbGMUu0LQjepiyJXP/Vgr0q++fdwJdGkzwMZ8sT+QpAuyIk6ZJPJEjquVg0usMVSQnU5EaoyE20qye1sXEdjmjE+vIyBpv0AuP+EemNC2nh8Acy8La0ZGmIIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUG+gdRJuOxB7sElmEesN+6JkSUBG1qKQJwyZNL8m+4=;
 b=jyZTSZwNCgc92T6+t63NtmAcq/73K5771qfx+AoM4ljiPO7ow8iWm1G5Xg5LmyWUDk88hsjoHMedWBs9nFYTpYsQJiEu8Y4B/tqwlh3y+6aECLEu5wUDWBLt0QSCs6tzDNmtiRpG+uUh18+CMkyz4n1pfmhBvAHfgN2eCf0ic1iefLf151FnXTLLJdrVWTzP8zu8sVROE5pwURqGzMBZeE3l7SwlwOY4VSv2F6ib1AXwc4Ar9jez73q1m4UPGb+ZvZ+Qt50S8Uyyh/mIIHsVpLrUnGxNAK1i1pfRxl6HXDyqXk93+A3njKMGFoET141xuNZCfEDtHKpogwD6vc2Z8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Wed, 10 Apr 2024 22:26:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 22:26:26 +0000
Date: Wed, 10 Apr 2024 22:25:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 24/31] drm/xe/svm: Create and destroy xe svm
Message-ID: <ZhcRz7p5/HYShFww@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-25-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-25-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6374:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z8B2L03MqFSBWSa8vzT8GpvpCwjCuIURZmTLsBW9FU7kyoAayE1awdwiSWgLLBT/bWWdqr2GlBWM1QJd4Oma9ShPgFkJ2KxVtrBzbFGapY0zvvO5zSiP8CWkoM0qXpq4fLCcvP+BoN7x+96b6n1ZJJmOPwUAXXAe0cOssZac0zw5+zWJHVhHtsOokSv+9nW5d6VHWeosr55JbSkJddWxcLljtuoNdGUJoj7PXWMkHJ2i0KZJ/EKI9BiWfdU6DUQRqwYlmeGhNnT3ZzeSfvowygjmBATsdmWKJ5ezEKASwdsrhEU7FMB8mjyH5oKwtr8MwnNq1CZwPBWpHPXwFh+rE0hCd1GfHSM5pjuLLxrBp5jTB2LEsDsfuMQN3wkPOFx+W9CwjX4LSWQe37yqTXdUzBWbLsOq0hst2DgDW43DqPN67TE+I7iotgut+mDYr5SfbIknPQ+Rez/E8norjnUGmslTIMxiK5SHIRVLa5+HspjJV2Jl1DJLevqHKeHnl2F6G9ruTZH/yNm/giirU+uVabjhy4PuKmwyGzuphck1VQbUr9N5BOhbNl2mrZYMQp6o2gPcpAT0hXb4CTHLNq6EwPM4P0eBNXa3FdW6sBJM5IKdhMSYjsf1qHlGe2lA3IPPKXhj8kqrIQQZDSeeu7jhrsvNZplzf0mLZw3yA3gJ4pI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kNU46Bwa9MrEtol4NWg4bxcwlupNZ7HOfFKuGTAQd5Ln8HWLdsDv49jePS?=
 =?iso-8859-1?Q?EuwwmuXfpfVhdo+4+lu5JuUN9uhdprwBQjK6SyU14nCpWgzx/ZPPjTWgRy?=
 =?iso-8859-1?Q?1EWGhoV84Pksbv7yBSxB5wA0qACJQjF+DeUOPxLwzEFHuNx2SjArTxBh4+?=
 =?iso-8859-1?Q?7nUCLZ+g9GXTy66jrDYvmRmI7Ywxcxwivh8FhPoGn/HFHceJZT208eUK2s?=
 =?iso-8859-1?Q?vlbFTM/YyRslII/Ej5F9GoZvJ0nZT0QLzL6EDPvqSBzRkFMjwsJvpN+shx?=
 =?iso-8859-1?Q?d57EEXWULgkmBQNnnvWMYD4AZ7CPVNqqb50pwOMW6Yk1o6hfzoGWFxOZjQ?=
 =?iso-8859-1?Q?cNFC9BFcsQNTuqIqvsTgQBnKgJKkYE96CCBT/bbiazSFFJeGxHKfb/EDwl?=
 =?iso-8859-1?Q?V52X1aQ8uKCiJj4cljcdB515MQ3CiSjpbSz8bpzQRuzKSVxseyNuRHhYV+?=
 =?iso-8859-1?Q?8eg088RD3Rr53aTWLq4nrZLj4JVSz/WkNnkWEaOjuFOJQODaicPHpoOCTQ?=
 =?iso-8859-1?Q?uyECZFmiP4sD+rHl61MqVIeOMx5U2XN05uHLKIgb38MIV6jT5QmwN4TOBT?=
 =?iso-8859-1?Q?0e0S0tSMXoxTnCKhyOZFgjhHGgHcj728c96n1wX+1PENgDhkrbvFveiPzN?=
 =?iso-8859-1?Q?O+cbC+gg9c/n5mFHXVLBZnlCSRI+vAiyQ09Ws2h6672fmc1kJiGQtXJdyV?=
 =?iso-8859-1?Q?dNq6yn1zB2R5w415lBIZ4tWfjnTyZ5AzTS2a34SZPApI5iGb2IBugUY9IC?=
 =?iso-8859-1?Q?PHKdYxoWZTl2IpLBQg1yFRnmMKIC/reobxyhbrbZ85M3BAIT10c0/5OFco?=
 =?iso-8859-1?Q?mWuXHdQ92v4RsFaJUBHhMebU/+n/lcIln791vawhCupGoKlcvWNRToXxXH?=
 =?iso-8859-1?Q?aHdmqcPjXKNSCl1GXg25oTJzjwhvqHTeqyvCdkI5tWS+ZThjF2CGYwYNFr?=
 =?iso-8859-1?Q?vOhajo+yHyvukGaztvjw/AL/sflKUdKZM/aXw4mCfgngM14LVqpBgYNyaU?=
 =?iso-8859-1?Q?2hDEIYZx5r8u/RmadZXljL8XB0QHcElqTxo1hsuQjDVqJaySOua0yJK8wp?=
 =?iso-8859-1?Q?fCNm2pO5k5GMHTQ2yHWVgEiMrxg8O7jA444ncj3La6fjT2omNNRQXg9M4s?=
 =?iso-8859-1?Q?XKuZh1v604WEgIJlmKUsIT77+6p6aNWa2HDUd6JSPKxMojqSmvg7Luhsla?=
 =?iso-8859-1?Q?KjPOwYFiyhcCXaGGtGyQrVSl+R64CZKM/wTXGOMcg8zewmA9WLRIvRtq/8?=
 =?iso-8859-1?Q?61AsF/uYWZjsnV4w7wDAVb1UiwwTXLnwCpYgdX1uqPPxEZYFvk8kw+fcJF?=
 =?iso-8859-1?Q?uVc1gCoBCeOJNQw0vSDqhDyVKcT7cE1owM9VQZ0ekiCj13057WfzHMPEsY?=
 =?iso-8859-1?Q?KII2aU7S3rameRSdpOBg4G/oqoRt4T9qRmavfN1wWWr0gCr1nBdsZ46bGr?=
 =?iso-8859-1?Q?fiesqlSkxvpqJYrXYyKsPjr0DXHkps3sos2E2EH1QrC+JDOqnLhtzmleJT?=
 =?iso-8859-1?Q?ys9ttBFdnoXYKllsWbYOpr0hmrK/zsOv+mgLn6HIX8jg0fELioIVfSo8qn?=
 =?iso-8859-1?Q?OpTqYQgWuULtV0VvSAJUV+nHn2rIKKDTAPAWiL0E4F0iQaTZpy2BvpSzt/?=
 =?iso-8859-1?Q?KslLTZDwSL5rb4nTkLy/h13kqQYovcAL0GSYOXDDzrOBm7dyaUXOLs8A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beb95999-c7f5-4e62-916f-08dc59ad42d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 22:26:26.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2WtB9qPhAAgThYVoVph+lIfplmkTvOHBnmGxjQ1Gz43tluzayWNgi3PMC6n6iDy7YeUpkGrQddhB+N4JrkbCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On Tue, Apr 09, 2024 at 04:17:35PM -0400, Oak Zeng wrote:
> Introduce a data structure xe_svm to represent a shared virtual
> address space b/t CPU program and GPU program. Each process can
> only have maximumly one xe_svm instance. One xe_svm can have
> multiple gpu vm.
> 
> Introduce helper functions to create and destroy xe_svm instance.
> Once xe_svm instance is created, it is added to a global hash table
> keyed by mm_struct. Later on we can retrieve xe_svm using mm_struct.
> 

I don't think this needed at all, will explain a bit later in the series
but quite sure this can be droppped entirely.

Matt

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile |  1 +
>  drivers/gpu/drm/xe/xe_svm.c | 77 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h | 23 +++++++++++
>  3 files changed, 101 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cd5213ba182b..f89d77b6d654 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -129,6 +129,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_svm.o \
>  	xe_svm_devmem.o \
>  	xe_sync.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> new file mode 100644
> index 000000000000..416cfc81c053
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/mutex.h>
> +#include <linux/mm_types.h>
> +#include <linux/kernel.h>
> +#include <linux/hashtable.h>
> +#include "xe_svm.h"
> +
> +#define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
> +DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
> +
> +/**
> + * xe_create_svm() - create a svm instance
> + *
> + * one xe_svm struct represent a shared address space
> + * between cpu and gpu program. So one xe_svm is associated
> + * to one mm_struct.
> + *
> + * If xe_svm for this process already exists, just return
> + * it; otherwise create one.
> + *
> + * Return the created xe svm struct pointer
> + */
> +struct xe_svm *xe_create_svm(void)
> +{
> +	struct mm_struct *mm = current->mm;
> +	struct xe_svm *svm;
> +
> +	svm = xe_lookup_svm_by_mm(mm);
> +	if (svm)
> +		return svm;
> +
> +	svm = kzalloc(sizeof(struct xe_svm), GFP_KERNEL);
> +	svm->mm = mm;
> +	mutex_init(&svm->mutex);
> +	INIT_LIST_HEAD(&svm->vm_list);
> +	/** Add svm to global xe_svm_table hash table
> +	 *  use mm as key so later we can retrieve svm using mm
> +	 */
> +	hash_add_rcu(xe_svm_table, &svm->hnode, (uintptr_t)mm);
> +	return svm;
> +}
> +
> +/**
> + * xe_destroy_svm() - destroy a svm process
> + *
> + * @svm: the xe_svm to destroy
> + */
> +void xe_destroy_svm(struct xe_svm *svm)
> +{
> +	BUG_ON(list_empty(&svm->vm_list));
> +	hash_del_rcu(&svm->hnode);
> +	mutex_destroy(&svm->mutex);
> +	kfree(svm);
> +}
> +
> +
> +/**
> + * xe_lookup_svm_by_mm() - retrieve xe_svm from mm struct
> + *
> + * @mm: the mm struct of the svm to retrieve
> + *
> + * Return the xe_svm struct pointer, or NULL if fail
> + */
> +struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm)
> +{
> +	struct xe_svm *svm;
> +
> +	hash_for_each_possible_rcu(xe_svm_table, svm, hnode, (uintptr_t)mm)
> +		if (svm->mm == mm)
> +			return svm;
> +
> +	return NULL;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 92a3ee90d5a7..066740fb93f5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,29 @@
>  #include "xe_device.h"
>  #include "xe_assert.h"
>  
> +
> +/**
> + * struct xe_svm - data structure to represent a shared
> + * virtual address space from device side. xe_svm and
> + * mm_struct has a 1:1 relationship.
> + */
> +struct xe_svm {
> +	/** @mm: The mm_struct corresponding to this xe_svm */
> +	struct mm_struct *mm;
> +	/**
> +	 * @mutex: A lock protects below vm_list
> +	 */
> +	struct mutex mutex;
> +	/** @hnode: used to add this svm to a global xe_svm_hash table*/
> +	struct hlist_node hnode;
> +	/** @vm_list: a list gpu vm in this svm space */
> +	struct list_head vm_list;
> +};
> +
> +extern struct xe_svm *xe_create_svm(void);
> +void xe_destroy_svm(struct xe_svm *svm);
> +extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> +
>  /**
>   * xe_mem_region_pfn_to_dpa() - Calculate page's dpa from pfn
>   *
> -- 
> 2.26.3
> 
