Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30930C77B7C
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 14:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E410E386;
	Tue,  9 May 2023 14:48:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117610E386
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683643726; x=1715179726;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mbM0SfgT3j95FvBZHMIMyPN19PQIm3sVpWgAhIrJc58=;
 b=lHGIUcrfSEgzNHERhBBqfGtEZsqob7Aquj+FmubmLU69700srm4n4H3r
 0rBOo9u/iK07z9Q3kBE8LB3XjNKvuRbNXjQ5XpRT1vqrzqA0nFOVSXKJr
 AIUZmQOMbWVY4dwsD8zzn0SsqLnnCepTY1buevVFqNVMCZj/ejRtjqp/Q
 l28YFfe3XvBlA5WQPOtO7eOLz+6PIE+y/gdHJ48SidJhlbxGf9cf19Qz+
 4qHdRi9hpUpNgGyfuSl25hZpO5a6k3Obwj+nAut2buXVGTf5aLQzz7oLG
 XuUbwttkjzUOUBPWxS1juf4orFL6fVA9JNuhgR5SRqOrOZkD+7ILMymYz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436264406"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="436264406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 07:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="676492030"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="676492030"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 May 2023 07:48:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:48:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 07:48:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 07:48:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 07:48:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRY74bBJv6DKbf0p23EV5ytLIMHj0Oa5hnJE4Dmkx7lQr9AQrsDXktvqmn0eEF72see52tGlD4Xx+jshLSESpw9vha4mGu7V1dpkfE18dc0+CmPn6KniY4S8rSzeBlCoj2By8eL/fMWwJysFKCb8dxzgNAVQaFgZ/qnE9M0X6amXzfdL07odTsXSBPu/uOLP/QnjrBA0RONFqlf9ZoPsklduAD+05e3o5f982GNpry0hJTPEKMzlxyoPzLq8rSQ3jdjUOSiBrozqDl+OWWzsOFaIxV8hM3ErEMhFR3O5w3BRPgADWTduE4OC4cY/0asRjdmwmgYUTMUFv8oVEKsIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QXTrrSROYOwNDPWfAHQJ8xsj/E0cIVcSyx1lqGpGD0=;
 b=TDr+jcuCCBGatXRH99IOAcixr2nhPtEZ3QFIIhv1nuL26pW+Vi/0dJ0hYm4lQV3Jyaoqgt4w4MQgPYxj3MsTfYhF4ZLrQ9yHSXjFD3ECDoScc4JE/E9iboV9VPYVj52sgzoio5ms4uB1suUUJpPbl65C/52PtS1m3hDTNDRQWdjzX4ahiTJjj7YBCffz+039jYy2idTHXAACP641p4vJM/p3Jr1j6DXBPPNvH+wiB1RrRsWabsQRARzCcNKano34QZz7Ig7h0dzPtP6n7mDpMRqsmqbt3IZe6MeUPDbFEL8+BmHuIodIslkSxJw0QWMZtfTa+NosFcnuI+vcOuCUuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 14:48:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 14:48:42 +0000
Date: Tue, 9 May 2023 10:48:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFpdRrAGkp3v3kuL@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-19-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-19-matthew.brost@intel.com>
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: 11db685d-a1a0-4ad3-dc3d-08db509c7b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHqfgOxQQit2oe/PQDjYRfhPkHDbFnFeegFSmpqAOzTBx6mTUpfj4p2N8NpbdM1DqwzRsUk9bwHFijO1u/wcXzz1qOsor7KwocuvplQ2dJ7yrN55rNfLz4mtQg6n82ZlEkf+owR7Ghj7QzhG3XwAsLzZn5OpOf5DASgKAS5PPEAF6MOFT8dGecP+TzEkyl5Pb5TfOdKdlZc5O+UIH4V4hmYoATzH7OuD7bUveyUtHH40ki9B9q3gocokjg88j7aJ7UCZuw/Yuq8O/ODNrjhLHdV05N3jhjDuWKwCEAC5POtrWbSC4PSf1Z5dpNGrxg0LhBU17rVLJe5hcODuTh5i2X90SaQABLeyTL8nULGtW6nhYYJAhtWigMxUbJmqeuslz71XnnmYT5INMk5P4d/lWQWWPsLCNICkvzWTXl7zvKD2/qxr57NlgtwdoIWwQqR9UJ7oXc+2+0PscO4lBOp6ws/eBn1n8y5Csa9aVqcjwdd/l1o5+RyiGW9g4bUhucMVEEhwWV2NBUoCcKMTLLNL+wLpE0hhFRk/GQLSvYssgi7J3YxoNsg3r7cfmulVMtL6MMe3gjGyz+oA3zL8LDob9vc+kWWLANsZsL8a5Z5l0oGLdI4lAqKG05QBkI+zgZu/gj+O+CLc6fwzPKUvMqx/4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(36756003)(83380400001)(2616005)(37006003)(478600001)(6666004)(6486002)(26005)(186003)(6506007)(6512007)(44832011)(2906002)(66476007)(38100700002)(82960400001)(6636002)(66556008)(66946007)(41300700001)(4326008)(8936002)(86362001)(316002)(5660300002)(6862004)(8676002)(21314003)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XH/x1NVGv2amUxPH29nSRs1g0NRjLnZ/Jg7k+xaNmJblzI3fAOhlBzzM1j07?=
 =?us-ascii?Q?vl2y3AqY1pNu0Z3NVzP4ycGEGCqe/BWQ9NisyQwz5WTZFNwn9WmtQD+yvDLl?=
 =?us-ascii?Q?Jp7rJjZr0xEdvNUgkKM5W1TZeVIuUcSwTd4m0qFvcZaJTFSXFx28BHmiLXku?=
 =?us-ascii?Q?LRfSd62rUuKYOSN+9+gnx589YtUVJVUGSUXWEJtORwe25JCJc+VEKv3JfT2B?=
 =?us-ascii?Q?xIaMpfxbHbjoXj/7wXyad6l40pgLfRVQqhF9pBFaRpd4JLby5SUh9EiLMr7K?=
 =?us-ascii?Q?i9JA+Y2jRMVEuAXZsMejGL2MPOwlwRBwjy7JX+Cb6euOPH4tx6DKjx4hV3l+?=
 =?us-ascii?Q?F/9r/ROPFkaRv+Gshrh/3WK9YQ73DAeDWn5qI+pwdA1L48ThjK3uX4yeuzWg?=
 =?us-ascii?Q?pHZRS7CZLSF5sUqD7yb6OT6JiRvNv7Cw/r6G+KpIOuxkpyUGjBnuXjf9/lC5?=
 =?us-ascii?Q?/UpeFNgZqwdf5b5j8Ad+jhHiU7zo/ERpm82w89zONDbXngwv8xbmQgI5C1rz?=
 =?us-ascii?Q?LyyglT3RFPtpNQzdVX2MOqefYRqWiw2J7yzAl7/oU9ufwY/BpBvYoN1VYIge?=
 =?us-ascii?Q?KFPs0ln5pdbpaY84rm1Rs7i8I15NtDppfhcjtKCXxFNRuCKuxG7xNf7OL9Vi?=
 =?us-ascii?Q?GhLM9DZIX58mZEDZW9tsjYqvVBjZG8FjLRPCwmmNNXX7U430Sr9PXpbyFmqi?=
 =?us-ascii?Q?7bchJAhiM4o3dYRFaAJaDRjwoZe4ddXi7VYQEJPmPZY5X0VmhiLU8e9MffIk?=
 =?us-ascii?Q?MvVilQkP26kTEbjW2M1xTR+ixkqk15qdIqbGki5yE6F4oRMVL7mkSafHzcZ2?=
 =?us-ascii?Q?iVLP+bbFZDVEteVDtiRSiLT0TZL6vBfMWEXZbZwImzHhtbrox42iP5xdhxMy?=
 =?us-ascii?Q?crl2sWam+QqPRYoQbpAFDBtVqAIOF5FtmzrtI6gxot6etNf1B+c9SE6G5h/K?=
 =?us-ascii?Q?os5COTDDelc51aaOvdu2jf20KPLqNKSTXIKBTnUFPSeLqEh6RoqO6eYO7x2X?=
 =?us-ascii?Q?jqxeSUyZwxzAiNzniqduFe6EDDGQr1JZvU4zScQped/h/7wZpxjaVqTfOAXI?=
 =?us-ascii?Q?nWechihc4Uuo7/lDvbe5LE5AhcEaWdS1ymQTy0E1srkIqCnVJi7lokeggF22?=
 =?us-ascii?Q?HUv8HSeVrnZfYYbxMu5hzoGu3r33Hm9crMLK30s8A6FiGjualEhEkke/FxE8?=
 =?us-ascii?Q?0tw6rY77dSI0vp67ZZP0aPbvvtnQLfb0Sxsf2oJvsT3SXJjwfgfDpieqY/X9?=
 =?us-ascii?Q?dVrNIX9haqLCJ1WXLJzoK5ni5TTrLGIdyX5dh0fGCsFJHXx9q7WV26HwwAqb?=
 =?us-ascii?Q?P9E0u7k21soAxG3WcSjcI/7KTb2h7/BEcjD9/rzlUqe6RihqP+DxMfH7T38w?=
 =?us-ascii?Q?YSXyWIlG2EUfbG0P+1Clyml6VJn2gombdEhqJCe7wOvi8axqI2mFErjqbVvQ?=
 =?us-ascii?Q?3ng6AS4Ti+ZPGhJQb1bkNQ8R5wMJrMmlZcvGGPL1YY7qVulP6POgV+BtEM2+?=
 =?us-ascii?Q?2AbxMjK+LmPsvSs9/MHXiW3Y6L1ShP3H3uZRGhm76uP4+HV4sKOd+BBc3vgA?=
 =?us-ascii?Q?qautX3Wb5NfKwTxZtjW03+P0VrsNMsixjXFy6Wt8CbE9Pux8zKAxElOyhf3x?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db685d-a1a0-4ad3-dc3d-08db509c7b9a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:48:42.4715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHNHU8RmOZMPgnRrAPgO7z0Dob8rdzGrniCr1ffsW1mU7zxbzGUPoCBA7bg2SiiFPwqeiOJEwkIM5Wwy4uZb6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 18/31] drm/xe: Avoid doing rebinds
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

On Mon, May 01, 2023 at 05:17:14PM -0700, Matthew Brost wrote:
> If we dont change page sizes we can avoid doing rebinds rather just do a
> partial unbind. The algorithm to determine is page size is greedy as we

There's something off in this phrase...      ^ around here...
maybe s/is/its/ ?

But about the rebinds and remaps I was not able to follow the changes
below... probably if this patch was in a smaller series or if the code
for the remap that this is based on was already merged that could be
easier... or maybe someone with more deep knowledge in this area like
Thomas would be the best one to review this.

> assume all pages in the removed VMA are the largest page used in the
> VMA.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       |  4 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 71 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h | 17 ++++----
>  3 files changed, 67 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index b4edb751bfbb..010f44260cda 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -412,6 +412,8 @@ struct xe_pt_stage_bind_walk {
>  	/* Input parameters for the walk */
>  	/** @vm: The vm we're building for. */
>  	struct xe_vm *vm;
> +	/** @vma: The vma we are binding for. */
> +	struct xe_vma *vma;
>  	/** @gt: The gt we're building for. */
>  	struct xe_gt *gt;
>  	/** @cache: Desired cache level for the ptes */
> @@ -688,6 +690,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  		if (!null)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
> +		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>  		*action = ACTION_CONTINUE;
>  
>  		return ret;
> @@ -776,6 +779,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>  			.max_level = XE_PT_HIGHEST_LEVEL,
>  		},
>  		.vm = xe_vma_vm(vma),
> +		.vma = vma,
>  		.gt = gt,
>  		.curs = &curs,
>  		.va_curs_start = xe_vma_start(vma),
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a46f44ab2546..e0ed7201aeb0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2276,6 +2276,16 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
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
>   * prior to fully commiting to the operations. This setp can fail.
> @@ -2352,6 +2362,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
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
> @@ -2370,6 +2387,20 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.prev = vma;
> +
> +					/*
> +					 * XXX: Not sure why userptr doesn't
> +					 * work but really shouldn't be a use
> +					 * case.
> +					 */
> +					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_end(vma), xe_vma_max_pte_size(old));
> +					if (op->remap.skip_prev) {
> +						op->remap.range -=
> +							xe_vma_end(vma) -
> +							xe_vma_start(old);
> +						op->remap.start = xe_vma_end(vma);
> +					}
>  				}
>  
>  				if (op->base.remap.next) {
> @@ -2391,20 +2422,16 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
>  					}
>  
>  					op->remap.next = vma;
> +					op->remap.skip_next = !xe_vma_is_userptr(old) &&
> +						IS_ALIGNED(xe_vma_start(vma), xe_vma_max_pte_size(old));
> +					if (op->remap.skip_next)
> +						op->remap.range -=
> +							xe_vma_end(old) -
> +							xe_vma_start(vma);
>  				}
> -
> -				/* XXX: Support no doing remaps */
> -				op->remap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
> -				op->remap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
>  				break;
> +			}
>  			case DRM_GPUVA_OP_UNMAP:
> -				op->unmap.start =
> -					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
> -				op->unmap.range =
> -					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
> -				break;
>  			case DRM_GPUVA_OP_PREFETCH:
>  				/* Nothing to do */
>  				break;
> @@ -2445,10 +2472,23 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
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
> @@ -2518,9 +2558,10 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
> index b61007b70502..d55ec8156caa 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -30,6 +30,9 @@ struct xe_vm;
>  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
>  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
>  #define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
> +#define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 6)
> +#define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 7)
> +#define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 8)
>  
>  struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
> @@ -320,14 +323,6 @@ struct xe_vma_op_map {
>  	bool null;
>  };
>  
> -/** struct xe_vma_op_unmap - VMA unmap operation */
> -struct xe_vma_op_unmap {
> -	/** @start: start of the VMA unmap */
> -	u64 start;
> -	/** @range: range of the VMA unmap */
> -	u64 range;
> -};
> -
>  /** struct xe_vma_op_remap - VMA remap operation */
>  struct xe_vma_op_remap {
>  	/** @prev: VMA preceding part of a split mapping */
> @@ -338,6 +333,10 @@ struct xe_vma_op_remap {
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
> @@ -395,8 +394,6 @@ struct xe_vma_op {
>  	union {
>  		/** @map: VMA map operation specific data */
>  		struct xe_vma_op_map map;
> -		/** @unmap: VMA unmap operation specific data */
> -		struct xe_vma_op_unmap unmap;
>  		/** @remap: VMA remap operation specific data */
>  		struct xe_vma_op_remap remap;
>  		/** @prefetch: VMA prefetch operation specific data */
> -- 
> 2.34.1
> 
