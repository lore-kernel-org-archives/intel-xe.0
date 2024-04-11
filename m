Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EC5CD11C2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 02:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716110E7F4;
	Thu, 11 Apr 2024 02:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS+ETw5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3136F10E7F4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 02:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712801325; x=1744337325;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=P9iFsK9L430lhGJlAqjjtp3OtyVPSScLtGcHYi2QaoA=;
 b=LS+ETw5cIuT0TZ3k1RA/DHkVnwAvcr5ONAMmq2br5WFxC72gOutprL2C
 wSagvTyYmaIt4KCEuFBWrBTIeA42Bvk7rOTFyeYp4Z3yLB5UxLwJ875vL
 TXi6IEhIdKO37V6G0f8UOzSiYfAMaKRBD0OZqz+gplI+xX7GqNPWRwuxc
 EQgp+QYlZSNEABY/dQGomN7mLutdypITrfp5UtV5FoNQLKRtIm1qxznkn
 ojZtqiMVtsBY9xYPb+X4SvBIspi4TeO8iYwlWZRDcHGBtS5J9gBRDNvDY
 bwpE4rUIBAnMTyWpHpM7Ugi3XnzSb3HwypppOrpGIPKTy5Uu/hoe2czH3 Q==;
X-CSE-ConnectionGUID: 6UOCifF6SsaBMPIxbTZ7UQ==
X-CSE-MsgGUID: nd9/c5/XRlSlPRKUAfrx7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8415565"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8415565"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 19:08:44 -0700
X-CSE-ConnectionGUID: Z+XpAu8DTces5y11SCN5qQ==
X-CSE-MsgGUID: 5vVOfRK1TRKcPXTAxQQ/rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="21344142"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 19:08:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 19:08:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 19:08:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 19:08:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOrz5yPBS1Ox/rF5rVd7yzm+bChco1RYPkDOXVGM1wkLbk4nNpCLqoylLw4/avLpVl7otUXB81Jm9L8SjfyFJCHcmoo1SIgdv14Ra2zYOjTBYupunx8IGku5ah61hYbaNimmei75zUFBvlIX2LBbC2LqySCWHMo3U8zK9EoBlVwbjkQZmZgssCjp3S2I1LBDBEd+MVjAQI32PEDHNR6Iuc/V7fnYBQlKcaLbs4O+h0FydCyduJWNcMWiK7eghyNO1t/JaqJRuhSUrLxj0rsWdC0wMztKfRzh3pcj0CE1YR1V9oeCt6hLHBJmTOQQSWjvnn+wGQAHASe2f+v11ipKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BybEW80pMOeBZOJDz92JklRrgHqfJZgx3H3dYTKT6fg=;
 b=RIpptbWUgUe7yUwEGuEzLBmEFXiCCSnFoTarJJCc7EmGDjH0jhxye7JQkYUd5O7GjAZv/SfZwsbSc2Wh8hXA3c2myD0P8nb+AhlFwdROSJeiqyDQtwixYtTtG8Bo23zNBMKLb+ZA5dMF8G9lZZq0T42GNFYxazMrE0LdUuDuaoious159pujTMilN7YUVVYSXwdGdoVpcXkfQjomjFJ+7nuoOv+Bku9ojV4ozsssKDd2RpTrB45AXeRPxSRE04NWXQLhmTLO0FvvnE3rJNtzPf2OtJE9691ymMForDameDkC9sxHOsi5Q7lfM4WA11TGRIVZYUXMYo/HyQ0yC4wFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 02:08:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 02:08:35 +0000
Date: Thu, 11 Apr 2024 02:07:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
Message-ID: <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-28-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7005:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VHPhxegJjIAnZOU05SJS1OnyNTT5CRYLkZFQVxv36ToIbBjnvlJcgEam0hGnnq/vetPDw6gOv7A9vlceoTzFjWCeCpYSnc0jqC8kYYIOT9Hk+FlqGKQp0QJjUqk/VKFWVFqcAQx/kbQFTvRNoVj6sMt8Gb0MsCZA3r0Knbu4ttWpsc2YcJQu0otet2D2E3E3GYlhRcqB2iUK1TF5aFFe4ktbztFqtPTS5MDGQPF6e5NaSTm7gkg5I0otY1fQFSAoAcfADKAvuB4TYFEMY5xfNrlCTz0ydKaEWCtbrscDQldAsbgN+F4Al4v/qtTvYtg15NsbqIrncDY1htB4Lo1AwHU0g4zjpubjeGeqtGbpurk7GLYj8iZlFpWImeYjvSR5Gryi9IBQGMfX8R6k3ZAp/ILdiJ/5rBkG9u5ri4sPPsR+GVWOAUxNK62aNi/q1mqSyjucOozs619Y/Eg6mFWPiyn7reet2yhCw13Xx38o5Iam3nFEuoicnVZK39mBNTcpJJfMzm8bamLFnNINGUJT/7G9BfYh7MFDYqgMgX3zhOK69LpHQG9hnK4hDMNVwqF5sSEXU5yHfnIO4l048QKZkoSzvnhMAOMZFObhFBusPmRF1PJB/zoTt5HHbjGUEuq8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gOjPpB7n2C30KJG5W7yrDf05CSRDWt9LkQJffk6MeHSFk9yMOp1+EgSsMT?=
 =?iso-8859-1?Q?XHlddzFix2RXz7i1iqcHEEZt1Fph5E4+bVDYLbTwVCtKduZIWxtiEdlNrL?=
 =?iso-8859-1?Q?AV5+L/HuWLWpjW5DB7EupybOBgZSCk84X2jRtIJV/zwqkVNX2nBW6vuN9t?=
 =?iso-8859-1?Q?jqPKzQqExhVRPwmMsH0Hgvz18TlbaPAAxowMW/qbvOdO/er6t02Wwn1oEa?=
 =?iso-8859-1?Q?fRJBgpg9ojTtUOJEtEZqLIZ1HN9kM8B2IFyCU/aEO4BoiIgKP9qB8OZN6K?=
 =?iso-8859-1?Q?R73N6fmtTjNEKnywZRwct7L9Re5rjwK7lGeMXT820BEa+vYwEdU3yObPi0?=
 =?iso-8859-1?Q?FpOg7Y90SWeCu+DyMbNQgtfBc1S55CWW1r4OP28XO6csw5d+x40wRlDy9R?=
 =?iso-8859-1?Q?Y92JENdMzBnCMrO9YybX5qoaozIi4114amnQ8XcDEmEcedrgLeDF+4O2o9?=
 =?iso-8859-1?Q?PIQPUlSUPG/7wldNihn0EPJMGCkNpOyOLFWgG1OzbpSgYBOp5mgDATH6Qy?=
 =?iso-8859-1?Q?cLeV4EGYNkyz/xUAv8wPff8koLjC3LZRgHHG62fo9Qdhg3X0sWV4xDVuLA?=
 =?iso-8859-1?Q?q5qwDGVYywLanWwR4B2pE044WKAIWxnI6myOW4/DyOdnXOC87FeClKngSD?=
 =?iso-8859-1?Q?hyO2ireVwVY8jyO/lKECbOo1DTEJKOO/BbU10oOWScIk2ktD4Fs+tCaJWj?=
 =?iso-8859-1?Q?Dwxo24ocKvF1h7/yFDfV+5rItJzIEHEu+GgkIGA1+nq5zuFaA2glpxwDjL?=
 =?iso-8859-1?Q?Ho966NP2eZi3cPRR5p0xNkyDmVDpusiECyzJwuUe9ClS/N8MstXYCzC+4n?=
 =?iso-8859-1?Q?48ct3ZRTMmelu7q1w6up67fvicc/g+Eq7MxyJ91mCZS46JHrqFg94S5nzC?=
 =?iso-8859-1?Q?OLA3OVgQC6Z6IuWvQJUL3zg1FeyufukY7u1pmJiQaXApKAfHzkMZzEfuGD?=
 =?iso-8859-1?Q?gyeaN7ScbvLiLJUceR64qTfn3+jMgy786tJ2nHA1DqTFXmAkWLnGNsWKRM?=
 =?iso-8859-1?Q?4N38VKdusZSoE9BrHkVw+eBCoxWB/dES0GA+AR/uzj4EBQ7N2PrKMjKHuN?=
 =?iso-8859-1?Q?/T5q2eTYw1rV0ud+ME6SFxFkJziMKnz9WQtlUWv9PHAX7BFd7JLbBrSlRx?=
 =?iso-8859-1?Q?pNtEhHHnRSEzEIM9t6TrYDV1kV1dKRt1vVPyX/nqIGlxMebi+u359ShR6p?=
 =?iso-8859-1?Q?+oXKZ3w5wGOFw1KkaddP6Yi9vmHQ7Kq7YpwwstiCn8XhHAu+NM4K0CnnD/?=
 =?iso-8859-1?Q?g3c00g6cVCEognpSZbn1KiyywoGqaPxQx2xPM3IrgQsmtm4RDmVv9BOV93?=
 =?iso-8859-1?Q?yXXhryXWYNwVanaxD737BmSULt10/hYLu2XN8C6vNQS5kyBkVt1utIHy4I?=
 =?iso-8859-1?Q?8XmHbIIfkV97aGgnLXXjdTiW3r84/H9Fp83gckkUnZNcT+/BIajQFHK+J7?=
 =?iso-8859-1?Q?kxvGskKf8pRAk/QbHVCwTxVsrz2fnnYZOiizKbxcrIclkLHycaBUxuYyI2?=
 =?iso-8859-1?Q?bgRpWVY35Rf4DlrvkzrKYw4/OmuekfYXunjRIU/ocxDX1Pv2evBrXqpXt8?=
 =?iso-8859-1?Q?MUwOGLySP+G5o2Xxjf4c7yWUcASEzIp1mYXzEVWPuHhIDZi/YHQUqq4JSB?=
 =?iso-8859-1?Q?d8M/zZuS/9O13t5LbUoCx5C1bf66Xs8mYDNm5u2CYzdGiAQd2oJ+IZmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6487bc05-a0a5-4758-3396-08dc59cc4b5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 02:08:35.5207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OmTyBdeOQjt33JXsrmYu5kxU7qHQ/673xg2z0UwlQckU60f8s24tvdZz3tLq8abn3D6Flk9/jJhYawvb/23JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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

On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> Under the picture of svm, CPU and GPU program share one same
> virtual address space. The backing store of this virtual address
> space can be either in system memory or device memory. Since GPU
> device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> Any CPU access to device memory causes a page fault. Implement
> a page fault handler to migrate memory back to system memory and
> map it to CPU page table so the CPU program can proceed.
> 
> Also unbind this page from GPU side, and free the original GPU
> device page
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile         |   1 +
>  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
>  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
>  drivers/gpu/drm/xe/xe_svm_migrate.c | 222 ++++++++++++++++++++++++++++
>  4 files changed, 230 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f89d77b6d654..65289acdd563 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -131,6 +131,7 @@ xe-y += xe_bb.o \
>  	xe_step.o \
>  	xe_svm.o \
>  	xe_svm_devmem.o \
> +	xe_svm_migrate.o \

See comments about file org, same thing applies here. Let's put all of
the svm implementation in a single file.

>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index f601dffe3fc1..c9e4239c44b4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -7,11 +7,11 @@
>  #define __XE_SVM_H
>  
>  #include <linux/mm_types.h>
> +#include <linux/mm.h>
>  #include "xe_device_types.h"
>  #include "xe_device.h"
>  #include "xe_assert.h"
> -
> -struct xe_vm;
> +#include "xe_vm_types.h"
>  
>  /**
>   * struct xe_svm - data structure to represent a shared
> @@ -31,6 +31,9 @@ struct xe_svm {
>  	struct list_head vm_list;
>  };
>  
> +#define xe_svm_for_each_vm(svm, vm)					\
> +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> +

Don't think this is need, see below.

>  extern struct xe_svm *xe_create_svm(void);
>  void xe_destroy_svm(struct xe_svm *svm);
>  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
>  
>  void xe_devm_free_blocks(struct list_head *blocks);
>  void xe_devm_page_free(struct page *page);
> +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> index 088ac209ad80..32ada458f1dd 100644
> --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
>  	unsigned long bitmap[];
>  };
>  
> -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> -{
> -	return 0;
> -}
> -
>  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
>  {
>  	/** DRM buddy's block offset is 0-based*/
> @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head *blocks)
>  
>  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
>  	.page_free = xe_devm_page_free,
> -	.migrate_to_ram = xe_devm_migrate_to_ram,
> +	.migrate_to_ram = xe_svm_migrate_to_sram,

Again single file so this will be static function, no reason to export
this.

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c b/drivers/gpu/drm/xe/xe_svm_migrate.c
> new file mode 100644
> index 000000000000..0db831af098e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/gfp.h>
> +#include <linux/migrate.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-fence.h>
> +#include <linux/bitops.h>
> +#include <linux/bitmap.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <drm/drm_buddy.h>
> +#include "xe_device_types.h"
> +#include "xe_device.h"
> +#include "xe_trace.h"
> +#include "xe_migrate.h"
> +#include "xe_ttm_vram_mgr_types.h"
> +#include "xe_assert.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +#include "xe_vm.h"
> +
> +
> +/**
> + * alloc_host_page() - allocate one host page for the fault vma
> + *
> + * @dev: (GPU) device that will access the allocated page
> + * @vma: the fault vma that we need allocate page for
> + * @addr: the fault address. The allocated page is for this address
> + * @dma_addr: used to output the dma address of the allocated page.
> + * This dma address will be used for gpu to access this page. GPU
> + * access host page through a dma mapped address.
> + * @pfn: used to output the pfn of the allocated page.
> + *
> + * This function allocate one host page for the specified vma. It
> + * also does some prepare work for GPU to access this page, such
> + * as map this page to iommu (by calling dma_map_page).
> + *
> + * When this function returns, the page is locked.
> + *
> + * Return struct page pointer when success
> + * NULL otherwise
> + */
> +static struct page *alloc_host_page(struct device *dev,
> +							 struct vm_area_struct *vma,
> +							 unsigned long addr,
> +							 dma_addr_t *dma_addr,
> +							 unsigned long *pfn)

Weird alignment, also I don't think we are want to allocate a page at
time...

Beyond that, can't say I'm a fan of 2 arguments being return and
populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
haven't seen a lot that style function in Linux.

Probably makes more sense to have a function which allocates pages,
locks them, and populates the pfn array (migrate_pfn) rather than doing
this a page at a time.

> +{
> +	struct page *page;
> +
> +	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
> +	if (unlikely(!page))
> +		return NULL;
> +
> +	/**Lock page per hmm requirement, see hmm.rst*/
> +	lock_page(page);
> +	*dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, DMA_FROM_DEVICE);

The device is writing to these pages so I think DMA_BIDIRECTIONAL is
needed, right? As mentioned above I think this should be broken out into
a different step too.

> +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> +		unlock_page(page);
> +		__free_page(page);
> +		return NULL;
> +	}
> +
> +	*pfn = migrate_pfn(page_to_pfn(page));
> +	return page;
> +}
> +
> +static void free_host_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> + *
> + * @vma: The vma that the page is mapped to
> + * @addr: The virtual address that the page is mapped to
> + * @src_pfn: src page's page frame number
> + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> + *
> + * Allocate one page in system ram and copy memory from device memory
> + * to system ram.
> + *
> + * Return: 0 if this page is already in sram (no need to migrate)
> + * 1: successfully migrated this page from vram to sram.
> + * error code otherwise
> + */
> +static int migrate_page_vram_to_ram(struct vm_area_struct *vma, unsigned long addr,
> +						unsigned long src_pfn, unsigned long *dst_pfn)
> +{

We definitely don't want to copy 1 page at time. I touch on this in [1].
Basically this going to perform poorly unless we use larger copies, the
migrate code supports non-contigous sram addresses, and vram addresses
will likely be contigous due to the buddy allocator.
 
[1] https://patchwork.freedesktop.org/patch/588548/?series=132229&rev=1

> +	struct xe_mem_region *mr;
> +	struct xe_tile *tile;
> +	struct xe_device *xe;
> +	struct device *dev;
> +	dma_addr_t dma_addr = 0;
> +	struct dma_fence *fence;
> +	struct page *host_page;
> +	struct page *src_page;
> +	u64 src_dpa;
> +
> +	src_page = migrate_pfn_to_page(src_pfn);
> +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))

I'm going to say this is a bug if !src_page ||
!is_zone_device_page(src_page) || !(src_pfn & MIGRATE_PFN_MIGRATE) and
we return -EFAULT (or another error code if that makes more sense). We
are migrating from the device where we know we have backing store from
the original fault.

> +		return 0;
> +
> +	mr = xe_page_to_mem_region(src_page);
> +	tile = xe_mem_region_to_tile(mr);
> +	xe = tile_to_xe(tile);
> +	dev = xe->drm.dev;
> +
> +	src_dpa = xe_mem_region_pfn_to_dpa(mr, src_pfn);
> +	host_page = alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
> +	if (!host_page)
> +		return -ENOMEM;
> +
> +	fence = xe_migrate_pa(tile->migrate, src_dpa, true,
> +						dma_addr, false, PAGE_SIZE);
> +	if (IS_ERR(fence)) {
> +		dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
> +		free_host_page(host_page);
> +		return PTR_ERR(fence);
> +	}
> +
> +	dma_fence_wait(fence, false);

Even if we did want to migrate a page at a time, we only need to wait on
the last fence due to the ordered nature of exec queues.

> +	dma_fence_put(fence);
> +	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);

With above, will likely unmap all dma pages in a single function once
the last fence is signaled.

> +	return 1;
> +}
> +
> +/**
> + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU page fault
> + *
> + * @vmf: cpu vm fault structure, contains fault information such as vma etc.
> + *
> + * Note, this is in CPU's vm fault handler, caller holds the mmap read lock.
> + *
> + * This function migrate one gpu vma which contains the fault address to sram.
> + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i.e., create one
> + * gpu vma for one cpu vma initially and try not to split it). So this scheme end
> + * up migrate at the vma granularity. This might not be the best performant scheme
> + *
> + * This can be tunned with a migration granularity for  performance, for example,
> + * migration 2M for each CPU page fault, or let user specify how much to migrate.
> + * This is more complex due to vma splitting.
> + *
> + * This function should also update GPU page table, so the fault virtual address
> + * points to the same sram location from GPU side. This is TBD.
> + *
> + * Return:
> + * 0 on success
> + * VM_FAULT_SIGBUS: failed to migrate page to system memory, application
> + * will be signaled a SIGBUG
> + */
> +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> +{
> +	struct xe_mem_region *mr = xe_page_to_mem_region(vmf->page);
> +	struct xe_tile *tile = xe_mem_region_to_tile(mr);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct xe_svm *svm = xe_lookup_svm_by_mm(mm);

I don't think this is needed... More below.

> +	unsigned long addr = vma->vm_start;
> +	u64 npages = vma_pages(vma);
> +	struct xe_vma *xe_vma;
> +	vm_fault_t ret = 0;
> +	struct xe_vm *vm;
> +	void *buf;
> +	int i;
> +
> +	struct migrate_vma migrate_vma = {
> +		.vma		= vmf->vma,
> +		.start		= vma->vm_start,
> +		.end		= vma->vm_end,

So I know in my PoC I had the fault user pointer (xe_vma) == struct
vm_area_struct of the GPU fault. That is definitely wrong. We likely
want to allocate sub-range of vm_area_struct for the xe_vma, we can call
this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, and
finally 4k in sizes trying the largest first... The chunk sizes are
trivial as we likely can just have table with values, the key here is
the vm_area_struct vm_start / vm_end are not what we want to use here
rather xe_vma_start(vma) and xe_vma_end(vma). I think we get the xe_vma
from the faulting page vmf->page->zone_device_data field unless you have
another use that field...

I also comment on my patch with my suggestion implement chunk sizes too.

> +		.pgmap_owner	= xe,

Again helper for this.

> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> +		.fault_page = vmf->page,
> +	};
> +
> +	buf = kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
> +	migrate_vma.src = buf;
> +	migrate_vma.dst = buf + npages;
> +	if (migrate_vma_setup(&migrate_vma) < 0) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto free_buf;
> +	}
> +
> +	if (!migrate_vma.cpages)

This is an error, need to set a return value.

> +		goto free_buf;
> +

We probably should check migrate.cpages != npages too as I also think
this is an error.

> +	for (i = 0; i < npages; i++) {
> +		ret = migrate_page_vram_to_ram(vma, addr, migrate_vma.src[i],
> +							migrate_vma.dst + i);
> +		if (ret < 0) {
> +			ret = VM_FAULT_SIGBUS;
> +			break;
> +		}
> +
> +		/** Migration has been successful, free source page */
> +		if (ret == 1) {
> +			struct page *src_page = migrate_pfn_to_page(migrate_vma.src[i]);
> +
> +			xe_devm_page_free(src_page);
> +		}
> +
> +		addr += PAGE_SIZE;
> +	}

I touch on this above, this should be reworked to roughly:

- alloc pages and populate migrate_vma.dst
- dma map sram pages
- migrate a chunk of contigous vram addresses at a time
- wait on last dma fence from migrate
- unmap dma pages
- unlock and free all pages

> +
> +	xe_svm_for_each_vm(svm, vm) {
> +		xe_assert(xe, vm->mm == mm);
> +		xe_vma = xe_vm_lookup_vma(vm, vmf->address);
> +		if (xe_vma)
> +			xe_vm_invalidate_vma(xe_vma);
> +	}

I've touched on why this isn't needed... I think one of these
migrate_vma_* functions will trigger all MMU notifiers registered for
the range. The notifier owns the invalidate then.

Beyond this, maybe I'm confused about a few things and how this fits all
together. Doesn't every user process have its own unique mm, fd, and vm
(e.g. own address space)? If a user want a shared address space then use
threads with a single mm, fd, and vm.

So even if we had to resolve the xe_vma's here and do an invalidate here
very confused what this is doing. This is this the case with multiple
devices and each VM points to a different device? Again so that case I
don't think a xe_svm structure would be needed, on GPU fault we should
be to detect from the faulting page zone_device_data and pgmap owner
if the fault already has a physical backing on another GPU and resolve
how to map it into GPU with a fault... Jason suggests this in the
following thread [2] and I think I agree with him.

[2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com/T/

> +	migrate_vma_pages(&migrate_vma);

This logic is going to change but ... 

On an error I think we only want to call migrate_vma_finalize to revert
pages back to the original state (i.e. migrate_vma_pages commits the
page changes which we don't want to do on an error).

> +	migrate_vma_finalize(&migrate_vma);
> +free_buf:
> +	kvfree(buf);
> +	return 0;

I don't think 0 should blindly be return here, if there is an error
return VM_FAULT_SIGBUS. We likely want a high level error message too.

Matt

> +}
> -- 
> 2.26.3
> 
