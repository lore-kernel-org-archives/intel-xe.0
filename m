Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020FEEB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C153F10E15E;
	Thu, 20 Jul 2023 15:56:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B5210E15E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689868602; x=1721404602;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GMEvNmryZMwIYzsPXeb8w9ufr7r6UetFhjKvt4tIJeo=;
 b=lFoINTV/tAo22Y2LvSxJy4uDNtLIGJzkr10+tPLkBQFtfVeLOHvskGnj
 26P+9v8RdTJ8aUSJCVjJ13QjZuuat5ukEOK9Y+5srtCoZBtJM0md8gzlg
 8HEfyw3jeJiOLl0wrT3BkAR/2C4XD3BlxDQrQlhhPeC9BM14iLXQqJffz
 bqIu7UK8uyonxBpjaXpm/AMP7DccVRTLHYyxMsNnckM9TcFc5hi97Sydc
 muC5FMpn6WGtYvBd/UHWNi/8QRDfM/jKohYLEi3330dE3QoFs5n/wGdGQ
 wrrwUyQz7XEbsUYc05ywYIZ7qbxU8EiFOzns24wGlUxiUrvxHQZrrTtft w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364242719"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="364242719"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="789848723"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="789848723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2023 08:56:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:56:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:56:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 08:56:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 08:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfO8J1Y4pL0othtg0rnfeemwQ8CAm6dI2PRF8wi2ggL/fGJzO82DUUt6n60UAyj4Ve21EjFnz9IBMP7U6XX7ue5iwtCbuOK8HC/cRWO/WbFxsC4I+M0bMe+88YXZyBIvyo39k/5IPh6PtbBNLNOa/B11C32f8x7xcgExIy+gDPgFttDNlhSMWBkGoE8Ju0iU/ScYF3P6/ErjbGxKXBFQD4moVIRJ0R8pm/iJsSzlzSd/v08T3FC8/a9tzyrxIjtMi0ZSHQPlK/RPY1aSyCrjqqJgDEfx/zUFSb7r93tfEr1j/99JjzxvTXTCg6hKoo70BZoq34cpDypP1HFKihsWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2todu7Q31KxUKflfBcp/wlGCgBb4PpwwjWj/+Jq6oQ=;
 b=DoYWriavKnGnrJDZ+UhwaDAJBsSxOYUUeSa4fkjFk32Pfb/rCt/5/YKwfOQwGvbo+Mj1Z1UPPlYx/fAHt821goWng9b/KkVWYWauWSRqF8/4mT5uDtGpVXZEsfPxwqsXTDW23YblAdqX7BGoyKGihj4YS82WwA6DBbhvLt/0FbcNH7nk70eSvm1s2qMV00ZQdmwGcS1amlXh5STRGKU3etANEBCBzQ89OQkHrf7YYpRrRYDE2pT4lN/e3+PUpTczE3kk1oMCEiSye/XhxEZlJBrCLF0orRCg6huFMcFfg9YqWb8lvufggAlJE0fbYlTwzxjkPH238lx8BB0E90qCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 15:56:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 15:56:27 +0000
Date: Thu, 20 Jul 2023 11:56:23 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLlZJzyAfEVluECT@intel.com>
References: <20230720041057.112903-1-matthew.brost@intel.com>
 <20230720041057.112903-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230720041057.112903-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a41bca-c945-4033-c493-08db8939e00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fxvqqSUoPMKbkKQ16R7gRyAefi4mTeFPjnKXSHH6GNLWFYLxsFHM6MvOPxGZLmUXf6o6/TtPJYdsLNNrFE3UYatsuZ+Dn6qPYU2RGg7GbIENJwEwP0fHlyvB9egA9vyvhzri+4tZR4MN22zYkSRE8ZhBq+5XZt1ytQkePxMJfTYwz0aRB+7N/kTLA6AgtPzyuiXQg9Vx6ZglO1bRxfB+1Tzw/cT3v1qHgplIOkrwfNMRQAzzmj6oFf49V9BjmAG/51hbydijZQrU4dbiMI9CvufdeadRAcLztWipjPSH+aIzQ1WrWqOYXNuk3IwEubi8iouxzsaeBoTeO00Ees+2ODk5hs0VirxcG+H4E1/02tNXn/ny0uUDPGkKAldP9PPBaytoRC1wSomfCJXgiku6OU5MMJY0VvjFvKP3ataaSwlwtJezd7fVaiHJq1UfHbtORCun+AzXWwKC6PvAITiEbbcnhffzndaKsMzqBoZLb+KwIY/ogNhXkg198NlKU6z8Qxn4l1y5LKFmFzgbbBvS6Yw0pC5sOh0yIBKpRxG4tJPoAbRc71O/NQ5w2MOmfrRSSW+SbrQbK0eWYKLa7eM25GsKa/QFjS+1cweSSqcCKbQEVlm7kRYNCWjWaM7wpEE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199021)(6862004)(66556008)(66946007)(66476007)(41300700001)(6512007)(6666004)(6486002)(2906002)(8936002)(44832011)(8676002)(6636002)(4326008)(316002)(5660300002)(36756003)(37006003)(478600001)(38100700002)(26005)(6506007)(2616005)(86362001)(186003)(82960400001)(83380400001)(21314003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?beMYoklKp4ErZiAaeif5RohYlYJKir7EkLyT3SrnaxFqyErbaLzcKK9hNFq+?=
 =?us-ascii?Q?2xSZkfXJYTytaszCcV6j7hnpvr8STtkoyeFtnIxq2drWT1Co9Up+rPusqv1z?=
 =?us-ascii?Q?68PvCUt5E+mHhcKh6/IwdvuUIqF2fV23+ZGpiO2+6rcsgV+gKZgxcy6pV59H?=
 =?us-ascii?Q?ROJ0RHYwiPsgBUW86Yo34htd6WoAwNPeH7fncxL6/ZRknNPjKR9XxM843gNJ?=
 =?us-ascii?Q?+d2A5vdmqJmVtRVA7B/mcxkmdAHibcLsfw3eHRdyPIqQQiTby/1SOyj8ZfZm?=
 =?us-ascii?Q?5o2mSLcnKfbTdqxUmVEYoF7qM/11g9nLWxSkcM8JwEQ1zR1w6dwoCSeHnPhs?=
 =?us-ascii?Q?hi+C24bFtC7vkpfuqNtSxaD6jUtihBvHAl9TdbLi6I4FfiuFVbYIlFOerDtM?=
 =?us-ascii?Q?DnoU8ifJGskTyYQnzRDbsSuistuC9IYjhAVwxG2UIWmzGsdceyYV/lKmkWOz?=
 =?us-ascii?Q?AORCYKTySwUltKpHOo5dLRGQu++YwpjJYJ1UIYnQY/pitaxZWOFq7175bXuF?=
 =?us-ascii?Q?tGkM8wh/9LHHINa2Bo6cNGDDBIPobwiDLcFcBnPLUeDUMG8pmgLQFcZcX8Ht?=
 =?us-ascii?Q?oeK/LcACBS9cvsxob9UO84KnAcEDGAG39LdraiEU3bSwT56NYn/rl8gVwjhi?=
 =?us-ascii?Q?FILBNy1fqTtW/UvBuArmBO7qm4M2921VYf8ouQI6OJUNLGQHPBVdq/x24wjy?=
 =?us-ascii?Q?9ZqR0FBqtcEAtcUfHgxGNRBeGFoqqEpG+ZdySDJA570N/c0XfqAmKm6lce3w?=
 =?us-ascii?Q?iEOktq/ctH0lBD2WR9B7d+xilA+AtdvnNM1/6SKD1cXnVgxzG28K5PAqIhd3?=
 =?us-ascii?Q?kLhQPZ1OhYCTFl2VmWCcceJ3KAV9F7LKqkTuZol58O39umuqzBoD+GQD1Pou?=
 =?us-ascii?Q?/FyAxPtgdUNgeA9Z4dWSWeUIeFBirBhepDvSMJJ+ko02hERqbx/wHf3uANv1?=
 =?us-ascii?Q?7TPkEqaUSnRpwtppbd/lAzsx187n4lDLp7vRqmWdrxskpJ2WxyrLET7SWiyh?=
 =?us-ascii?Q?6KwvUlEx30bMDBwICdF1S6fMsZ7b6G3lz105TT6rPtqt8QjMn2UHch1mCEbj?=
 =?us-ascii?Q?UvJgwsUntPzc9kqOpqoedm7IDoBZrx8nXv16ZAwuePKzK+IdQGG39FCvO+Ye?=
 =?us-ascii?Q?S190ILh7bOJPlHCoBhwadO4GY3M7pNLHJXjEXZF2AvivPlsSFVsIPM26muns?=
 =?us-ascii?Q?RJBc9V+I7ML9NlS+Qp2p2cZwhx4A9ulDKEroFJx83J5ro8gKBWJvxTgso/OJ?=
 =?us-ascii?Q?O/yBkWpOEFVjuLCJYMeE3SIpn8SkO10TXnzLL9M/0W6M3Ao1anhKsxqhOK7c?=
 =?us-ascii?Q?zEP0aZ73o+xyG23ewHK6JFHQEW9rBwzaW3jqL5t+lHfnMfO7cel+EK67dFl+?=
 =?us-ascii?Q?KkyMh/Wj4/+afCiWU8VBApLr3ZLlzkJGVmbkyS4DBHFlsSgql0X0y2tWdfVj?=
 =?us-ascii?Q?ccYbirZWoEpUzVRqzAl+QtgbzTJQRddAhuDNScAeabPrqCRz7NYwuvtx6i+T?=
 =?us-ascii?Q?FrzAxz704hNgoNDYLgMeGRm+ABETWSdajmWDlF+YtyhypTaoevohEMOFre7Y?=
 =?us-ascii?Q?6dZEN8bUVe2EQab3/ibnTsZ2Tc8tY92Xo1yGSfDRBwuKox1Wve/48P9m16x4?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a41bca-c945-4033-c493-08db8939e00e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:56:27.1946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0TU8sx+XU2zpQEjDB7biL+lseiHpQoDTXxX62CUj0CXIFOHpjFfyX0Bs2T5ppZtLcso4o120ShYUJIcuEkwag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe: Avoid doing rebinds
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 09:10:52PM -0700, Matthew Brost wrote:
> If we dont change page sizes we can avoid doing rebinds rather just do a
> partial unbind. The algorithm to determine its page size is greedy as we
> assume all pages in the removed VMA are the largest page used in the
> VMA.
> 
> v2: Don't exceed 100 lines
> v3: struct xe_vma_op_unmap remove in different patch, remove XXX comment

thanks

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  1 +
>  drivers/gpu/drm/xe/xe_vm.c       | 72 +++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++
>  3 files changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 851ea7c01b91..bbf37e5c8abb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -668,6 +668,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (!is_null)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
> +		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>  		*action = ACTION_CONTINUE;
>  
>  		return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 87907a97a8c3..19ce6b0c6564 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2384,6 +2384,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	return vma;
>  }
>  
> +static u64 xe_vma_max_pte_size(struct xe_vma *vma)
> +{
> +	if (vma->gpuva.flags & XE_VMA_PTE_1G)
> +		return SZ_1G;
> +	else if (vma->gpuva.flags & XE_VMA_PTE_2M)
> +		return SZ_2M;
> +
> +	return SZ_4K;
> +}
> +
>  /*
>   * Parse operations list and create any resources needed for the operations
>   * prior to fully committing to the operations. This setup can fail.
> @@ -2460,6 +2470,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  				break;
>  			}
>  			case DRM_GPUVA_OP_REMAP:
> +			{
> +				struct xe_vma *old =
> +					gpuva_to_vma(op->base.remap.unmap->va);
> +
> +				op->remap.start = xe_vma_start(old);
> +				op->remap.range = xe_vma_size(old);
> +
>  				if (op->base.remap.prev) {
>  					struct xe_vma *vma;
>  					bool read_only =
> @@ -2478,6 +2495,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.prev = vma;
> +
> +					/*
> +					 * Userptr creates a new SG mapping so
> +					 * we must also rebind.
> +					 */
> +					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_end(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_prev) {
> +						op->remap.range -=
> +							xe_vma_end(vma) -
> +							xe_vma_start(old);
> +						op->remap.start = xe_vma_end(vma);
> +					}
>  				}
>  
>  				if (op->base.remap.next) {
> @@ -2499,14 +2530,21 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.next = vma;
> -				}
>  
> -				/* XXX: Support no doing remaps */
> -				op->remap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
> -				op->remap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
> +					/*
> +					 * Userptr creates a new SG mapping so
> +					 * we must also rebind.
> +					 */
> +					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_start(vma),
> +							   xe_vma_max_pte_size(old));
> +					if (op->remap.skip_next)
> +						op->remap.range -=
> +							xe_vma_end(old) -
> +							xe_vma_start(vma);
> +				}
>  				break;
> +			}
>  			case DRM_GPUVA_OP_UNMAP:
>  			case DRM_GPUVA_OP_PREFETCH:
>  				/* Nothing to do */
> @@ -2549,10 +2587,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	case DRM_GPUVA_OP_REMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
>  				 true);
> -		if (op->remap.prev)
> +
> +		if (op->remap.prev) {
>  			err |= xe_vm_insert_vma(vm, op->remap.prev);
> -		if (op->remap.next)
> +			if (!err && op->remap.skip_prev)
> +				op->remap.prev = NULL;
> +		}
> +		if (op->remap.next) {
>  			err |= xe_vm_insert_vma(vm, op->remap.next);
> +			if (!err && op->remap.skip_next)
> +				op->remap.next = NULL;
> +		}
> +
> +		/* Adjust for partial unbind after removin VMA from VM */
> +		if (!err) {
> +			op->base.remap.unmap->va->va.addr = op->remap.start;
> +			op->base.remap.unmap->va->va.range = op->remap.range;
> +		}
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> @@ -2622,9 +2673,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		bool next = !!op->remap.next;
>  
>  		if (!op->remap.unmap_done) {
> -			vm->async_ops.munmap_rebind_inflight = true;
> -			if (prev || next)
> +			if (prev || next) {
> +				vm->async_ops.munmap_rebind_inflight = true;
>  				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
> +			}
>  			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
>  					   op->num_syncs,
>  					   !prev && !next ? op->fence : NULL,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index dbe6aed6d2cf..29ec04fa1e26 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -29,6 +29,9 @@ struct xe_vm;
>  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
>  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
>  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
> +#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
> +#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
> +#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
>  
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
> @@ -336,6 +339,10 @@ struct xe_vma_op_remap {
>  	u64 start;
>  	/** @range: range of the VMA unmap */
>  	u64 range;
> +	/** @skip_prev: skip prev rebind */
> +	bool skip_prev;
> +	/** @skip_next: skip next rebind */
> +	bool skip_next;
>  	/** @unmap_done: unmap operation in done */
>  	bool unmap_done;
>  };
> -- 
> 2.34.1
> 
