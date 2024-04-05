Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC8C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 21:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1711110E576;
	Fri,  5 Apr 2024 21:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbCZX/3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263310E9F2
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712352578; x=1743888578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mqnzu/7zDpchuCwe7VkQ+svq54OXMY8XM/sc9aLTdcA=;
 b=IbCZX/3PmfwDmcEOYTGSJ4/EV5GwgFMC8qdBGbHhGxgbQRjknhfPIDxP
 zpsWnyzfKyQeDs14/WCfxiZwiLHda39VHPqo9RmRfUEVcFh48fYeNOsAL
 /k535YPsGp6Nk0vIGLOF/EUu40esyKCymDMqWD71DFrnjutGXTRjMEJC9
 3Zul5Curp1/b86fQR488b6UYsvf1BRgd+Nhc+YqXMb2vqHweZGwKnzBw/
 STtUS8E50Z0RxQZ0kHC1bRFdaPK+onhTHWd3aVvSP9lzmDYQwYAr1Sy/a
 1aCJlbqRHfZXps1JmaLMj1KUD3++W6scRybT04/yuk+PTlXF3/84TEj/e w==;
X-CSE-ConnectionGUID: kegMpvo2QMSOV9uJrZjy4w==
X-CSE-MsgGUID: eWnRBj5WQpKkwU/x/FXxOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7794647"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7794647"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 14:29:35 -0700
X-CSE-ConnectionGUID: twXtMXikTxmQi37gSyehag==
X-CSE-MsgGUID: aEU25sCtSFOCOBYMD78Oxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19820289"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 14:29:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 14:29:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 14:29:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 14:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYuX2HfZXKV0MAcq/tUIadU/Rl3+tC3BO80j/w4jFL5D8DitMPd0ipfNzUfbTNznR6yo4K0ORVJ+ri7Xfc63eqI+qNYyIzZ+VP1O9ctS+8jwjpZ68TdStq42oKdS9urs1rAKoNCyPYS8UJpxpl3r556yDhy7WCO0DBOyNjbMsFD0l8hO7mlqBrpvrhFzL+ZsWz27Gy3Clo6+PNZPW4u0yCuKcBfrDEJjJ8Fvud6yGeOfmbb7hNFg5Djrg/PWXRchPz7IuCapfZg52XuCq0o8RHWWSYVckkSr3TqiGSbOJm9rcfhY1zl8mr9Oyz/isTtDUc5Ze1PMPq9YPnHS4GwjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l9L51+v7qpbY0w9lpR0mYS3xM/9HUD51oCtMNAvXck=;
 b=baf1AGE53uHDV2lQvHkMgRKBn5Nj8J2H9igFcOuzf8vJbppN8SiHFoF6BWkV858wJsY0MQCe1ujxB1IkJde0jl8QwKa2OhA/4NBCxxLUgcZUuzkKZ1c++Ak6n/9BGQbmv9ExmCKXq1yV/fdfPRId7dWOYQIYY3ZJdy+WnVPZbRh/oHIIGeuf4r5l9Q0QdaKas4KUqHkDogRKwLK0/zVJiYFRnKsZT0rmsACjvNqrH5+6+9dPO7ybboQD+6kCnM0JYjjXtKpkEm4EGlg+27JobyWZZOq1S6pq9yt8Eii8OgDe9cFKLh6Mc2MpRWuSQn2hgyTC70QVxiXW/W6Zn7XxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 21:29:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 21:29:32 +0000
Date: Fri, 5 Apr 2024 21:29:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>,
 "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>, Brian Welty
 <brian.welty@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Introduce helper to populate userptr
Message-ID: <ZhBtKA7YDQ3Q4W3L@DUT025-TGLU>
References: <20240405190508.244177-1-himal.prasad.ghimiray@intel.com>
 <20240405190508.244177-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405190508.244177-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR03CA0363.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4974:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dR1Bfc3dcuZMo3Tf6nQHnzvhlHhJUNMqx4uG5HrNUANkyVJw7CBGH2svvJnL5IJW+n2hjRq22E41EuD77VWYjwpeqlyIfTJJOHp/Er8HyO5b51DChCczFUfrfu8O6SlAheh3Zbpj0iLviENGcxgpHLijyaz66h5vGu8EUlU2NJNOKVvSpc3dGMmemLCQrSCVsIkpiyBZrn71xelj18XNK6PPbs2dhbLE1DuIyu6R5X8Zen14hl15LljqC9Bz3EjR3QwgpNQDmD1OcgxNOenJPgejoxOkS2omxKTe4+NAAqfJikAvbW5bpYqL1hQfYdJwWyvdnL3nX0kFQOy93oOjd6hCy0OKYCwDdJ5C9PcOclxfnn4JCl9vmVqn8w0ShZNg8+smD8A85P3pAQcivh/5j5+y98EMz7WOLXBPbTSAbB17I5fbkIfy1bHlqwg3tSnV6XxxjmNXMdAT/3JmxMbHbEqp4f9YgtHTPMo0421vReX9eDgp7X/r1mbBbV992A/iUfP9BpPfcLgHz4gwmu7O6wcSGx9H4QriXd4wf8sCRVn47Kqao+RH3m2BKeFhSR6zKAFnYOXVuNkrD3ZM5HBZ2MZntUDRPFDS94Uk9LBKiD5X0S6h9T7ucVQC3nobgyNqS/oaft53+5hkszCzhmz2AlVKCTS01I7g5L3ULPLLfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?o6yMVRlofpy/EvCSWpyTTqRvJEXr9U4Ck5WLlvgUwlhIEMXYPzZsbnk1Ld?=
 =?iso-8859-1?Q?CDxv1ow5AYrzZ8Et77JrHubgdokc6XwTllPPrXI80yhIJtlQoMKIyIBEHX?=
 =?iso-8859-1?Q?UXa/w2yOtvsukcwiKKjMToOSfIjaWWn6IlnZZ1vLf/53X9fJoz/tq9q68E?=
 =?iso-8859-1?Q?H5EdXW86W+Ys6gVhKbkuBl7uwx7RXNcERUxPCMQNcTPDO48nBxjbqZS5oi?=
 =?iso-8859-1?Q?VeKLZz2WvSbt7opydMZ9eunTEvsSpMBFTxBOD4iFCZ27E/z9EMJaHunTBD?=
 =?iso-8859-1?Q?rr+10SGp3v5vZ22dsKMEGRFth9eVaJUHnClAdSynpilO/xnLxMjeGApnZC?=
 =?iso-8859-1?Q?UV/V1wEaqoRm8OTq1VtZRjvygNfV9nGCbj1AdZJPLqS8HnzzpISuS/VAGh?=
 =?iso-8859-1?Q?WLPOKUMl6iu45Hq+Jb+wVwpPCjdwfRCBJm/M0UhDFZ4zePY0J7C9Uc8Nih?=
 =?iso-8859-1?Q?LBqIf1VSZr50/nqtF9Jes0loLpR4+wREQI/iRirFyx4amKshbpC+zhytb9?=
 =?iso-8859-1?Q?psM2ITOvJvGzCbNYXAC8L/JBV+eFTU88j/CxnA67EwZAkvii6Cv72zp7W1?=
 =?iso-8859-1?Q?MerWYeTW5jWHgDoEfIwn/o6M8DaIJ6OyBx2qHBAW85pFaYouUwneQGOil6?=
 =?iso-8859-1?Q?ZYyE1Opa4DGN3rzfc9H4AhwZgcFI/W7TnKx3PQd4qE6q/hVZgeRheFJ5Yu?=
 =?iso-8859-1?Q?Mik6p9M+ok8HBvLmkkfIXWRXSyOzLiDTUJ7QSBvRorzdgGJ7ePBq7mymcY?=
 =?iso-8859-1?Q?uoXw7ZHAQ0+1DFMb9avYyyGDi7QUu1KJidnBRkfhO+pCgBbzrSwPSwbZpk?=
 =?iso-8859-1?Q?YCKLRZTBCe+GCuELSCHyuJgdaqYju/AjVePKOGR4EWFsa4ghmdFvfvWNsH?=
 =?iso-8859-1?Q?jH17lQCVCCYovUZorgQjL8qMG2mbXVipN/vyG44kFSNeuie/LNnUEisiVW?=
 =?iso-8859-1?Q?zUbxfrSaO6u8KmqD12MbwMG+vrUQWF+/hGfVb8lySqxRow2ALXgR/PS4aS?=
 =?iso-8859-1?Q?06i7G+K7pMGCpyEYH5jP43ivZp3LGQJ3VVH7zjdCvPGKVVGPlZwlZc+XJv?=
 =?iso-8859-1?Q?KfKqq3T9ZaErqqVN5P+sV+ecIYpiF36JmVVGRnYS5J1GWg7VnJHznNy9cp?=
 =?iso-8859-1?Q?4FLqfQ8xHq6j+xNsG5pkhBXLP34SPHOJavRvjmn/AI4xjAQlz0P/FIMRxe?=
 =?iso-8859-1?Q?e4BdM6Q4/di2XwszPYqLiV6tcRIHd5U+h/AAdBFRU3+KhQUIBzjQc+QLae?=
 =?iso-8859-1?Q?G/ZwZ3bd9AY7ZWOWo5jNHnjyKnKjTC11UqAitj/S6uhb92Jsl/vhbzOwPK?=
 =?iso-8859-1?Q?0ILFjfA7ulbdyO70K0haYNxo62CruVm1+K61MXEdX5nA2noIw/K9/BgXXk?=
 =?iso-8859-1?Q?3PwwbAKLGKRhoXZMabuqTtttsxr1Od7qB3Z3bi91gv6EN+69ooMey58XZP?=
 =?iso-8859-1?Q?ZMTYtRmPVgkbAqTHyDszkvz8A2MzoEruG1OfiVCj2lZ7HAgmgkV4gOofbv?=
 =?iso-8859-1?Q?55cdTFdgmSD2/Q36JOrCx5cUGrWiKMcCTTKy3DYOp1lf2FcXBLiVrzqA+n?=
 =?iso-8859-1?Q?Zpmfzmri+8jdVlxI6C5hNiGPzC9z7jPLjmCHwjXlSe3QKpDrmukA41z1A+?=
 =?iso-8859-1?Q?qW3wmZIyMvLSPGznUvkz3TmpblDkj+TeJCz72AYJIvho+2zggbOjctjQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bae827-c355-4fcc-f8aa-08dc55b77b7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 21:29:32.0628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ed6/rY7CMN2+furP6VYQBE0EZXOi8V8iDIghmo/MGmNDHBjLcNkBiRTEGhqMqWHd27vM2PzydyMIi5OwYiGcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

On Sat, Apr 06, 2024 at 12:35:07AM +0530, Himal Prasad Ghimiray wrote:
> From: Oak Zeng <oak.zeng@intel.com>
> 
> Introduce a helper function xe_userptr_populate_range to populate
> a a userptr range. This functions calls hmm_range_fault to read
> CPU page tables and populate all pfns/pages of this virtual address
> range.
> 
> If the populated page is system memory page, dma-mapping is performed
> to get a dma-address which can be used later for GPU to access pages.
> 
> If the populated page is device private page, we calculate the dpa (
> device physical address) of the page. This will be handled in future
> patches.
> 
> The dma-address or dpa is then saved in userptr's sg table. This is
> prepare work to replace the get_user_pages_fast code in userptr code
> path.
> 
> v1: Address review comments:
>     separate a npage_in_range function (Matt)
>     reparameterize function xe_userptr_populate_range function (Matt)
>     move mmu_interval_read_begin() call into while loop (Thomas)
>     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
>     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
>     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> v2: Remove device private page support. Only support system
>     pages for now. use dma-map-sg rather than dma-map-page (Matt/Thomas)
> v3: Address review comments:
>     Squash patch "drm/xe: Introduce a helper to free sg table" to current
>     patch (Matt)
>     start and end addresses are already page aligned (Matt)
>     Do mmap_read_lock and mmap_read_unlock for hmm_range_fault incase of
>     non system allocator call. (Matt)
>     Drop kthread_use_mm and kthread_unuse_mm. (Matt)
>     No need of kernel-doc for static functions.(Matt)
>     Modify function names. (Matt)
>     Free sgtable incase of dma_map_sgtable failure.(Matt)
>     Modify loop for hmm_range_fault.(Matt)
> v4: Remove the dummy function for xe_hmm_userptr_populate_range
>     since CONFIG_HMM_MIRROR is needed. (Matt)
>     Change variable names start/end to userptr_start/userptr_end.(Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig  |   1 +
>  drivers/gpu/drm/xe/Makefile |   2 +
>  drivers/gpu/drm/xe/xe_hmm.c | 253 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hmm.h |  11 ++
>  4 files changed, 267 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 1a556d087e63..449a1ecbc92a 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -41,6 +41,7 @@ config DRM_XE
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> +	select HMM_MIRROR
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 21316ee47026..07031b5ba977 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -146,6 +146,8 @@ xe-y += xe_bb.o \
>  	xe_wa.o \
>  	xe_wopcm.o
>  
> +xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> +
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> new file mode 100644
> index 000000000000..2c32dc46f7d4
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/scatterlist.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/memremap.h>
> +#include <linux/swap.h>
> +#include <linux/hmm.h>
> +#include <linux/mm.h>
> +#include "xe_hmm.h"
> +#include "xe_vm.h"
> +#include "xe_bo.h"
> +
> +static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> +{
> +	return (end - start) >> PAGE_SHIFT;
> +}
> +
> +/*
> + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> + * have such information for memory eviction or write back to
> + * hard disk
> + *
> + * @range: the range to mark
> + * @write: if write to this range, we mark pages in this range
> + * as dirty
> + */
> +static void xe_mark_range_accessed(struct hmm_range *range, bool write)
> +{
> +	struct page *page;
> +	u64 i, npages;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	for (i = 0; i < npages; i++) {
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (write)
> +			set_page_dirty_lock(page);
> +
> +		mark_page_accessed(page);
> +	}
> +}
> +
> +/*
> + * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> + * and will be used to program GPU page table later.
> + *
> + * @xe: the xe device who will access the dma-address in sg table
> + * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> + * has the pfn numbers of pages that back up this hmm address range.
> + * @st: pointer to the sg table.
> + * @write: whether we write to this range. This decides dma map direction
> + * for system pages. If write we map it bi-diretional; otherwise
> + * DMA_TO_DEVICE
> + *
> + * All the contiguous pfns will be collapsed into one entry in
> + * the scatter gather table. This is for the purpose of efficiently
> + * programming GPU page table.
> + *
> + * The dma_address in the sg table will later be used by GPU to
> + * access memory. So if the memory is system memory, we need to
> + * do a dma-mapping so it can be accessed by GPU/DMA.
> + *
> + * FIXME: This function currently only support pages in system
> + * memory. If the memory is GPU local memory (of the GPU who
> + * is going to access memory), we need gpu dpa (device physical
> + * address), and there is no need of dma-mapping. This is TBD.
> + *
> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> + * memory. Add this when you support p2p
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */
> +static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> +		       struct sg_table *st, bool write)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct page **pages;
> +	u64 i, npages;
> +	int ret;
> +
> +	npages = xe_npages_in_range(range->start, range->end);
> +	pages = kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> +	if (!pages)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		pages[i] = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		xe_assert(xe, !is_device_private_page(pages[i]));
> +	}
> +
> +	ret = sg_alloc_table_from_pages_segment(st, pages, npages, 0, npages << PAGE_SHIFT,
> +						xe_sg_segment_size(dev), GFP_KERNEL);
> +	if (ret)
> +		goto free_pages;
> +
> +	ret = dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> +			      DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> +	if (ret) {
> +		sg_free_table(st);
> +		st = NULL;
> +	}
> +
> +free_pages:
> +	kvfree(pages);
> +	return ret;
> +}
> +
> +/*
> + * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> + *
> + * @uvma: the userptr vma which hold the scatter gather table
> + *
> + * With function xe_userptr_populate_range, we allocate storage of
> + * the userptr sg table. This is a helper function to free this
> + * sg table, and dma unmap the address in the table.
> + */
> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
> +{
> +	struct xe_userptr *userptr = &uvma->userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	bool write = !xe_vma_read_only(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_device *xe = vm->xe;
> +	struct device *dev = xe->drm.dev;
> +
> +	xe_assert(xe, userptr->sg);
> +	dma_unmap_sgtable(dev, userptr->sg,
> +			  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> +
> +	sg_free_table(userptr->sg);
> +	userptr->sg = NULL;
> +}
> +
> +/**
> + * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
> + * address range
> + *
> + * @uvma: userptr vma which has information of the range to populate.
> + * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
> + *
> + * This function populate the physical pages of a virtual
> + * address range. The populated physical pages is saved in
> + * userptr's sg table. It is similar to get_user_pages but call
> + * hmm_range_fault.
> + *
> + * This function also read mmu notifier sequence # (
> + * mmu_interval_read_begin), for the purpose of later
> + * comparison (through mmu_interval_read_retry).
> + *
> + * This must be called with mmap read or write lock held.
> + *
> + * This function allocates the storage of the userptr sg table.
> + * It is caller's responsibility to free it calling sg_free_table.
> + *
> + * returns: 0 for succuss; negative error no on failure
> + */
> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
> +				  bool is_mm_mmap_locked)
> +{
> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> +	struct xe_userptr *userptr;
> +	struct xe_vma *vma = &uvma->vma;
> +	u64 userptr_start = xe_vma_userptr(vma);
> +	u64 userptr_end = userptr_start + xe_vma_size(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct hmm_range hmm_range;
> +	bool write = !xe_vma_read_only(vma);
> +	unsigned long notifier_seq;
> +	u64 npages;
> +	int ret;
> +
> +	userptr = &uvma->userptr;
> +
> +	if (is_mm_mmap_locked)
> +		mmap_assert_locked(userptr->notifier.mm);
> +
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +	if (notifier_seq == userptr->notifier_seq)
> +		return 0;
> +
> +	if (userptr->sg)
> +		xe_hmm_userptr_free_sg(uvma);
> +
> +	npages = xe_npages_in_range(userptr_start, userptr_end);
> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (unlikely(!pfns))
> +		return -ENOMEM;
> +
> +	if (write)
> +		flags |= HMM_PFN_REQ_WRITE;
> +
> +	if (!mmget_not_zero(userptr->notifier.mm)) {
> +		ret = -EFAULT;
> +		goto free_pfns;
> +	}
> +
> +	hmm_range.default_flags = flags;
> +	hmm_range.hmm_pfns = pfns;
> +	hmm_range.notifier = &userptr->notifier;
> +	hmm_range.start = userptr_start;
> +	hmm_range.end = userptr_end;
> +	hmm_range.dev_private_owner = vm->xe;
> +
> +	while (true) {
> +		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> +
> +		if (!is_mm_mmap_locked)
> +			mmap_read_lock(userptr->notifier.mm);
> +
> +		ret = hmm_range_fault(&hmm_range);
> +
> +		if (!is_mm_mmap_locked)
> +			mmap_read_unlock(userptr->notifier.mm);
> +
> +		if (ret == -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			continue;
> +		}
> +		break;
> +	}
> +
> +	mmput(userptr->notifier.mm);
> +
> +	if (ret)
> +		goto free_pfns;
> +
> +	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> +	if (ret)
> +		goto free_pfns;
> +
> +	xe_mark_range_accessed(&hmm_range, write);
> +	userptr->sg = &userptr->sgt;
> +	userptr->notifier_seq = hmm_range.notifier_seq;
> +
> +free_pfns:
> +	kvfree(pfns);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> new file mode 100644
> index 000000000000..909dc2bdcd97
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +
> +struct xe_userptr_vma;
> +
> +int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> +void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> -- 
> 2.25.1
> 
