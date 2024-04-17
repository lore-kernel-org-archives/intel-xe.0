Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB671C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641210F86D;
	Wed, 17 Apr 2024 20:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLxg3mtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB1A10F86D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713387342; x=1744923342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qbIAqzqTyJxcwPrzDDrcRhdMczvG8OaT0jRADhgX7Xk=;
 b=bLxg3mtqxST9igPPO5kth2F8xRZKlQ98l/oIuF3e68VFSfmRzf/JDBBu
 EAxCPOEhB/VrGm+G+6tcx8eZf/aRdHwGvCY6lzNO9eM2bfjMlJVnH8udT
 RQMVgQ+jK8DHfNcc01y9DcAOmZs1W0Z2ax5sP7VAst4eDjNySIs7E4A5o
 KI2neLHqy1junZo2qMC9rRhtlKa73pleXVLxQd+KkqSpR9pMlYHY8W5S8
 tvWTGdRPqzewBdX4GY1xFGLGtwgBmoQUmWIYc9DKoXsnYNkrm1Wq/mxRT
 lxX/b55xjGXtcCxA7iqNx9deBsHi8bB9giBtrHkwzCgN93JScgjMWUJFX A==;
X-CSE-ConnectionGUID: BbHP+cu0RXiS31Moc/HbnQ==
X-CSE-MsgGUID: rO98X956SqC8rqr8/LDciA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20327203"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="20327203"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:55:42 -0700
X-CSE-ConnectionGUID: 8+8/5VDkTgCjV+tKmExfLQ==
X-CSE-MsgGUID: 1SGSTpoUQMWr97FR7fD+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="22633549"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:55:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:55:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:55:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:55:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TP7PDV/HqSgEU3byC+h/ea5fl/tLE6bi4jazDXFxLXjHqLDJkMQtOv+dCDM0CEoYr6bhkwmyw/2zgNbmzOXPs3xBWd2dGQTTkJslsV+uIMmNJ5mKlfw+/ce6vDqKY2+HaVjFS7b7r8UpITqUsuqpZW2VZloW6UvY4QYy73YTjIfl6sQxSaGsjxIWT64shpu0TrNY0siMjJ2VpiwjomiTlbNM/oeIML7Z2tRFWmFhL/MI9N5G3VvFBgkz90yxXqwBradtbygKM/p8xbpj6t4SyOs6jtUmzsZoAT9cdupSjZhNoCpEXfyhhWwXEEcoQU0+/vSPfCDTaBmZrH4MlQTLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Tr2okvWx9iaLRa8+KlutFc+dFm7XPi+Egkafxmi4yI=;
 b=X9eg9lHaEWK7l9luvXTvsO6R+Sk50ZG2xVTzIyUhjDGVBLYliVLTiwxswnJC0JHQhwqWgjK1lg/ZA1jQp4T9pQ8RHqwZBXb+BX7TDK0+NBeJdbw5+bROeTlMLXdt+lwfiOALb6vuqJnl0VMFYch2nS6NjeLhuRefgvfG25dgaNRL7kBO9FitpQCsCCoG9+I9tzZpy/nJDDqtHHvSJO3GYYdX9jPe0UaTBThm1FvDSZum7WAaCzjL11LOQK8ZCRZkbJCO2wNLt6Qe/d8hQXodgMiKSTMu3BhXBicSoFpqPoO+VanCAqpAq5MhCMuwmgiWMkyhIFZ64oEO0vEihsXlcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 20:55:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 20:55:39 +0000
Date: Wed, 17 Apr 2024 20:55:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Message-ID: <ZiA3QUBKW0N3tK8P@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-23-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c3068ee-58c0-446e-f6c5-08dc5f20bce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YHq9G4CgRxfpiRhJHI1LxzGhfh8z9ih5eV+y5ikGuJri7sIUmmW1wMaBEhiNTSgJeMf+g9sNqgScjsFlLNlHWEZbkzzDEempWZ+HHrUQUA144uA8pkc0hu7rLXa0GgYCb3v4+vp85mM7ZgVlx68tG2MBl6+s5EYn96MPOsaCZMPnmuX4N3pNr2c3ogdZVQwoOxIqdsYMzcrd76R3MsZRXfNwDZgDghkOrp4NFMHuWzz6C1VEXz+Q6DqlOLW1dxIkugHz75/8ebIqTklk3QxzSO4b/yw7fhfWfR2VAuiIESVhxRMrn5vGE1nZNCHugtseiIZkpgn+k8QZ6iln1GPJss6Rwnbq2JSfRUmPtvtunUuuLOVnhgH7+4tdI0kcbmr41Lsu7KxiI37w3C50B8t6jENBuX2//gviqjbdCQwFh5ozfggYApCP4qAcRB54pyfzQ0zIQspGjZgcd7DiKKFIKhFw1AOpI5JtW6X+Uzr3GA794KAo3MyZQM4YpwdjJJe8uLvOjtRr1EZx4gWI6xCYfdkiWh52Ks+d61wq7BDceP98yIFU58TVuSP8yhlQTwLlbhYl385ktgyhAVzQO2SDTBZ6kZUNJVCq7dtkpJxGbtTtMqVidrKNNk+1MEyMUIuWNBNhjx33czDkkzaVpps7DY9PWTWIy6IIsghrSGFxtu8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KXjJQEGB1FiI8eEGg4+Xb+VFC02OFuZKlWzvRFIFpXpznUJRAZ7X5uRoMO?=
 =?iso-8859-1?Q?zXniWTf3LaIvOQi4k5+W/PgrNo14g1NRbBVNycPmtdnroMLABo4OGNrpBl?=
 =?iso-8859-1?Q?k2r3pNI/CekI4OXk0c6gpmdKBlyR0eUNcMWHRtfvizW4cfmF3rH/XM+mTm?=
 =?iso-8859-1?Q?P5sJ+oHzpHzRnqAmiCzbv0TlKUZTm7mcsXExXberaipyfjh0VVyEge5vrt?=
 =?iso-8859-1?Q?aKWXNoLU03k+cDLmLyAWgILB2V+eAnqfJ554Z6e4GI7CvsA9ZGlW39e2QF?=
 =?iso-8859-1?Q?205NeOFfuw7XXXhoHMxoGUXvArsYG+yrhbrR/I1hBRwb0fmeXQY9YaN67X?=
 =?iso-8859-1?Q?wOxSgdjfAtZk7XjbpL557827GxsXML6gW4QuXlTRK3smleIMkiD/sbky4R?=
 =?iso-8859-1?Q?rwqzR07U/2/6buqEjEhDeWE+44ApgKeJIV71g7Pdw1P1Cg3ZPY8DlZcrOb?=
 =?iso-8859-1?Q?Tz9CuH2T/qMvekbLGCW70sNGs5X/UbFhDFCskB1h0wC4KiO/JhlVEE/ddd?=
 =?iso-8859-1?Q?kAKRWn7R0HDfwWB2jotRKdYYBoR61/pXERg7jLxzmgQp3S7NeMgP3tVm59?=
 =?iso-8859-1?Q?3BUZzfVCJ4h2+QNFXmkgJ5BBBwD6AcQ7s0UPb+hmjn1FAof6AT30aNYuci?=
 =?iso-8859-1?Q?kiEMc+xOKHCNqEc/dgUCvrCBokuzeMNMhOd0gj+bvKd/fFmSJPdnZ8wsUT?=
 =?iso-8859-1?Q?6l/v3KQMaJmLBAikkeVDcxD0SHikEr2HifP0cjEwIYeKGMfeRhgFRov6Rg?=
 =?iso-8859-1?Q?bl1RWx2sGa0Jnrqq81iPJw3NjjlqjMDVm5KJ6xlm5ZL+Ka8/6jy1cWzh+C?=
 =?iso-8859-1?Q?pT5l+q80weeQSJ2qm3UccER3sJBS8ErCNXtNXULglWPxvA/ZTb67CoGsIw?=
 =?iso-8859-1?Q?ip4m3cQ30oZgl+aw1qPwQzLIaO7c7H5/+MxxYEh0Auw5rTkRgMWq8joWqa?=
 =?iso-8859-1?Q?toSz9NwX8jxNjc5UgrKTz3DVi9VS70AmHfy5kR8NlvxhFpm+R8Q8uOSGhF?=
 =?iso-8859-1?Q?GqfgddG4c7f1MCqU//MHriNXsto8c/Q75Q72HJR1wwsrIAp7Snq/BuFwSc?=
 =?iso-8859-1?Q?t1TjpxSsx2YegNzuK09wQkmnqGmg0PXSo8/WwkqgslCBdMvDDFxFOspW2U?=
 =?iso-8859-1?Q?AAwu9KBX3O6OU6ZLl3tS1X7aVw6Hc3cKQu3t3Kv/4FTUOWJrqsVa198Uku?=
 =?iso-8859-1?Q?n9TVAnBbA8BB2edo4QwH2WAHBRYj9NVUoPhw7yZ5ixa63g3pM634mZQb9J?=
 =?iso-8859-1?Q?OLbi4EASOERaMCbIJ08/j3OcQyFlJWpZKeoQDkmM6KS6XW3USE/3pvhQIR?=
 =?iso-8859-1?Q?FSZRQVASmnk7Y6UsP3AT1Lou5jXeoD/qzwl5YMFsYIRL7YcTbwXt1KnFt3?=
 =?iso-8859-1?Q?QLSAMkH9f7Z4QG/Jxxk9cCDSdPnvrdDceIdtgsPR766Bv2PVFqoPrYTPS7?=
 =?iso-8859-1?Q?wZhARAbfxa+Ch01dlNERhvRoJ9oHdxPbUri+W8EEH/R2CB6xwziOZuNP55?=
 =?iso-8859-1?Q?53C55mMNPABqQ+0kWjAJ167UPF2l1cvZx3leBZ+huPXoQEqorZt7IbxY/L?=
 =?iso-8859-1?Q?itUpLxyEkB6L73zhuYqwsux1Km9NoOXBqkiES2+HsS6rRCOl1Hv04d8fGe?=
 =?iso-8859-1?Q?6gq5w0sx93tQledryl4vFMWCXEwkWs57U/eP7c026xBIipmaU/YCfQHQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3068ee-58c0-446e-f6c5-08dc5f20bce6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:55:39.3949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JajogrkusTkwbQzdSaJ6rLKs38CydHdsrDXZTaZxOWKrrClwKR51RTxqKaIsc5tig/NSOT1UMYR09yn97bazPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> Function xe_devm_alloc_pages allocate pages from drm buddy and perform
> house keeping work for all the pages allocated, such as get a page
> refcount, keep a bitmap of all pages to denote whether a page is in
> use, put pages to a drm lru list for eviction purpose.
> 
> Function xe_devm_free_blocks return list of memory blocks to drm buddy
> allocator.
> 
> Function xe_devm_free_page is a call back function from hmm layer. It
> is called whenever a page's refcount reaches to 1. This function clears
> the bit of this page in the bitmap. If all the bits in the bitmap is
> cleared, it means all the pages have been freed, we return all the pages
> in this memory block back to drm buddy.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
>  drivers/gpu/drm/xe/xe_svm_devmem.c | 147 ++++++++++++++++++++++++++++-
>  2 files changed, 152 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 624c1581f8ba..92a3ee90d5a7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,4 +46,11 @@ static inline struct xe_mem_region *xe_page_to_mem_region(struct page *page)
>  	return container_of(page->pgmap, struct xe_mem_region, pagemap);
>  }
>  
> +int xe_devm_alloc_pages(struct xe_tile *tile,
> +						unsigned long npages,
> +						struct list_head *blocks,
> +						unsigned long *pfn);
> +
> +void xe_devm_free_blocks(struct list_head *blocks);
> +void xe_devm_page_free(struct page *page);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> index 31af56e8285a..5ba0cd9a70b0 100644
> --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -5,18 +5,161 @@
>  
>  #include <linux/mm_types.h>
>  #include <linux/sched/mm.h>
> -
> +#include <linux/gfp.h>
> +#include <linux/migrate.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-fence.h>
> +#include <linux/bitops.h>
> +#include <linux/bitmap.h>
> +#include <drm/drm_buddy.h>
>  #include "xe_device_types.h"
>  #include "xe_svm.h"
> +#include "xe_migrate.h"
> +#include "xe_ttm_vram_mgr_types.h"
> +#include "xe_assert.h"
>  
> +/**
> + * struct xe_svm_block_meta - svm uses this data structure to manage each
> + * block allocated from drm buddy. This will be set to the drm_buddy_block's
> + * private field.
> + *
> + * @lru: used to link this block to drm's lru lists. This will be replace
> + * with struct drm_lru_entity later.
> + * @tile: tile from which we allocated this block
> + * @bitmap: A bitmap of each page in this block. 1 means this page is used,
> + * 0 means this page is idle. When all bits of this block are 0, it is time
> + * to return this block to drm buddy subsystem.
> + */
> +struct xe_svm_block_meta {
> +	struct list_head lru;
> +	struct xe_tile *tile;
> +	unsigned long bitmap[];
> +};
>  
>  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
>  {
>  	return 0;
>  }
>  
> -static void xe_devm_page_free(struct page *page)
> +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> +{
> +	/** DRM buddy's block offset is 0-based*/
> +	offset += mr->hpa_base;
> +
> +	return PHYS_PFN(offset);
> +}
> +
> +/** FIXME: we locked page by calling zone_device_page_init
> + *  in xe_devm_alloc_pages. Should we unlock pages here?
> + */
> +static void free_block(struct drm_buddy_block *block)
> +{
> +	struct xe_svm_block_meta *meta =
> +		(struct xe_svm_block_meta *)block->private;
> +	struct xe_tile *tile  = meta->tile;
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +
> +	kfree(block->private);
> +	drm_buddy_free_block(mm, block);
> +}
> +
> +void xe_devm_page_free(struct page *page)
> +{
> +	struct drm_buddy_block *block =
> +					(struct drm_buddy_block *)page->zone_device_data;
> +	struct xe_svm_block_meta *meta =
> +					(struct xe_svm_block_meta *)block->private;
> +	struct xe_tile *tile  = meta->tile;
> +	struct xe_mem_region *mr = &tile->mem.vram;
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +	u64 size = drm_buddy_block_size(mm, block);
> +	u64 pages_per_block = size >> PAGE_SHIFT;
> +	u64 block_pfn_first =
> +					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
> +	u64 page_pfn = page_to_pfn(page);
> +	u64 i = page_pfn - block_pfn_first;
> +
> +	xe_assert(tile->xe, i < pages_per_block);
> +	clear_bit(i, meta->bitmap);
> +	if (bitmap_empty(meta->bitmap, pages_per_block))
> +		free_block(block);
> +}
> +
> +/**
> + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> + *
> + * @xe_tile: which tile to allocate device memory from
> + * @npages: how many pages to allocate
> + * @blocks: used to return the allocated blocks
> + * @pfn: used to return the pfn of all allocated pages. Must be big enough
> + * to hold at @npages entries.
> + *
> + * This function allocate blocks of memory from drm buddy allocator, and
> + * performs initialization work: set struct page::zone_device_data to point
> + * to the memory block; set/initialize drm_buddy_block::private field;
> + * lock_page for each page allocated; add memory block to lru managers lru
> + * list - this is TBD.
> + *
> + * return: 0 on success
> + * error code otherwise
> + */
> +int xe_devm_alloc_pages(struct xe_tile *tile,
> +						unsigned long npages,
> +						struct list_head *blocks,
> +						unsigned long *pfn)
> +{
> +	struct drm_buddy *mm = &tile->mem.vram_mgr->mm;
> +	struct drm_buddy_block *block, *tmp;
> +	u64 size = npages << PAGE_SHIFT;
> +	int ret = 0, i, j = 0;
> +
> +	ret = drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> +						blocks, DRM_BUDDY_TOPDOWN_ALLOCATION);

Realized this while discussing ref counting off the list, the buddy
allocation size can be either PAGE_SIZE or SZ_64K depending on platform
too. We store this in VM via XE_VM_FLAG_64K flag.

Matt

> +
> +	if (unlikely(ret))
> +		return ret;
> +
> +	list_for_each_entry_safe(block, tmp, blocks, link) {
> +		struct xe_mem_region *mr = &tile->mem.vram;
> +		u64 block_pfn_first, pages_per_block;
> +		struct xe_svm_block_meta *meta;
> +		u32 meta_size;
> +
> +		size = drm_buddy_block_size(mm, block);
> +		pages_per_block = size >> PAGE_SHIFT;
> +		meta_size = BITS_TO_BYTES(pages_per_block) +
> +					sizeof(struct xe_svm_block_meta);
> +		meta = kzalloc(meta_size, GFP_KERNEL);
> +		bitmap_fill(meta->bitmap, pages_per_block);
> +		meta->tile = tile;
> +		block->private = meta;
> +		block_pfn_first =
> +					block_offset_to_pfn(mr, drm_buddy_block_offset(block));
> +		for(i = 0; i < pages_per_block; i++) {
> +			struct page *page;
> +
> +			pfn[j++] = block_pfn_first + i;
> +			page = pfn_to_page(block_pfn_first + i);
> +			/**Lock page per hmm requirement, see hmm.rst.*/
> +			zone_device_page_init(page);
> +			page->zone_device_data = block;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_devm_free_blocks() - free all memory blocks
> + *
> + * @blocks: memory blocks list head
> + */
> +void xe_devm_free_blocks(struct list_head *blocks)
>  {
> +	struct drm_buddy_block *block, *tmp;
> +
> +	list_for_each_entry_safe(block, tmp, blocks, link)
> +		free_block(block);
>  }
>  
>  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> -- 
> 2.26.3
> 
