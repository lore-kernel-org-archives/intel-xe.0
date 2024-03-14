Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09BAC54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512510FD7C;
	Thu, 14 Mar 2024 20:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2OJ5qYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3794510FD7C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710447961; x=1741983961;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BrzycgCX3L0JtiUll1bGMhPLqVmiGrB7j3WKs/LqWFE=;
 b=c2OJ5qYaT43s+Fc336TpMR5FJHfcqlQ3izU1KzOhMOs9p5z9N31gvo9t
 lbjRe2yKPLKjqStd0R2UCMakYawUJNLKAqrN44+O17oaw/yBx5eWw8s0h
 tDH/QsRm2QzmSixzlpVj0tCFj5WUDPLy3liYZL8oNUFARu9LMZwyhVxXO
 uBEa6lmyIIJJIwLzteZG2aVtYvUFQEq7/tmaw79XVLwTx9rhGx8gQcdmU
 HjhyWeJPjxAAkdRMb4CV/6u1gKI6iJX/Nmi2viTPi89lskPbQ8Y8YCjj/
 +pBqXjvHljz9VAdKgUBdF+XG9r4U55pYGiEjl1pzIhd+TZPfCLQQtYEO+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22812869"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22812869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="43327444"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:26:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:26:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:26:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4UW8mPDfON2NE9JLgQEgcs7JWZFxsFo3/X6CCtFEJyiRdGo0KSFrIQ6ckDG7zfdmdQ48Xkbyygv7MLS3xJCPo2CuQVoi4S8aKq9p/pmN2pcqPnjxdSRzy7EjMBUESPOs9/QHJmrp5Dowh+YxVKi2AlSeyz16ALLz5M9AlPT8hL6gs1E+wVQfWRxDwcyDsuOipbR8CNV3ZpEhQ6SqaqIKB+yJhZ0U3ujD7/0XYhSKMbXZx2lbEROxZikeqn+QO0+00deCtbuJ0V+duR+zn8dqYlnyc+F5c9AeIyqGQgRd9XdD42SaeH5n12q5KLOJA2ZdsbJjBJW9P+lmG26LlCHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orNLyymcyWAPuMU+M8FbgkTAiCjT6yUXMAPOn1A9CAA=;
 b=fdr3MvHE4uD5cAR2hfgVy55Hg/U2rxYRaFR6/G1d9NHPHQVWjaa13InSsibmrP7mwYYmkX5RwnvIQSkSQK2LB3yV31km16cFyCOYRpNOSrRTJoBS/THoysZw50N/K9g0sBpwOadtwm+NMYQlb4KM7KqtOA8eQp8iZR1Ons+rr8giHKhRV35vRlp9hcsefYeob6LIFo+p6DMSXlsX1Hll1ksQ3aSHT0QcJTq7HYBqYhbAYAiLAUWv5bNpJ/45BhiMKfaZ7J5rTCyeiLB9QHyJg174OxVh7RzDWKUxcBGQ6o0zNUaZp5/Vk76gFqn8ZtrRp6T6iwqq6yAgflAa6SdZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4932.namprd11.prod.outlook.com (2603:10b6:303:98::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 20:25:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:25:56 +0000
Date: Thu, 14 Mar 2024 20:25:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
Message-ID: <ZfNdHSODk7eNLA5X@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-5-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314033553.1379444-5-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4932:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab561f4-fc46-4639-de7f-08dc4464f415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zokW6ZHQ486Ootc/vBhiwfoUKwnPXqjKcss27wSsOytfWyybmHEqdf66Aeyw7OjnHZ5WR2sIUM/PMV/yY2b4Nbf0bdJuGHwGdhwVev9UHVf0pkNyaFR2MxBiGBGvmL248kKChv6W8waUIXiy3WhpYfPtLkTJi3DJkRW4aVBoHWEH5mFZGNJXrpkz+BBYykO8jrS7OfNUpR081vzcQTiSoKVmHbiHNw5/XKvdDv5DADoadMCymhZUd0vPUEYsJ3pW5CcDnuxojI5OgGYqNoCZeyG+i0D9t9JD57J81Vz4PzO25DakSt/MrmbZ9+n5qbRKgCEtDUrnqO+AvXkTlwVdPzE/ZEUcBSQaWuB52BOPyFRKVLuTYey8fpjJzWszcGyKO00TZIsOrUIlKkTAs9o+shimUWnJgcVWZaEKhayoDDCcDmT68ijGEOojxT6+luMSjbnv+REJsi3KikUi//ptX+1hSA409WcsbmBcw6YxpjlIJXVUtLdjAGYMdkpppM5xdadAFPFv0yVwceqlKhC6mXIgYQopbaeklcc54XbXh0IyE/ZyjSt1zLNcOtMgGKXBIpvOW+me+lMnvH9C+uA+f98kF1ZKPQzeyJB/PYjM3meI4bhb/IpPmzWDHxcyougkdyl8IoUYSdvmWzfec/xdHSMghhyUdnxJgRh1IG35qi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?byQmoZKK1SgQtf2I41oR0+u7clPeGCKXlTyHdVx5m8LVQkNJizk3N8JyVw?=
 =?iso-8859-1?Q?X4O9dsqksVRahvfVH2WDAOfpGDHlwDiy5g+w1iPU3E5omVIhzFlqT0q9nE?=
 =?iso-8859-1?Q?CMzR7dBgasMtJ9yarrUDJMqLjsnT2hhJp+qtyj0ztoCefPxDiFT3VQNka8?=
 =?iso-8859-1?Q?QFQZ9hafcX7HITEbj3WDV3NQKf7W6sxIDii3pdHWP20IM9PMeUo8YRFgdA?=
 =?iso-8859-1?Q?BGYzMNomkD/1fMI6CnAjcdLGaURYJLXFbxJQ5IyL2zEdZA5WRaMa/WRisL?=
 =?iso-8859-1?Q?8ZpaMxJ6KfepcD6lfFRlAFJNdebpGZ5kIws+98+7WcmZUAx8gpFjzN19Dc?=
 =?iso-8859-1?Q?Xh2+SIJWbELnmR1tDSC36NW0Fy0v4AVN+jDbeNBXAj47vjtLHKXHgD+x5L?=
 =?iso-8859-1?Q?r0TQ5a2VqUURpKbYeTB86cnJlEXcGDSeis5ce7w31XEzFfvyGcPeN1OGCp?=
 =?iso-8859-1?Q?gz7ixni1dmZ2WcF23Wl59fxIpQadoN3UJ+VbVl7vwDjp2fmNKYGu9tj8Fa?=
 =?iso-8859-1?Q?s8anwAlDcbCkh2ZarBzOfy9ljNAxIiM3piOOCQRod7Su9Z7g3E7DsyU1gm?=
 =?iso-8859-1?Q?0837ocIqwRb+y7Ku3/uu1fBTtgaHPv4kmlwBoHoDJIaSRjvjGdsI2erNSg?=
 =?iso-8859-1?Q?fV/kefmjVTM+Yj3Mgg3wTKopr2ub7A/IuhB0RV1Znoru49zzmPTgHocehX?=
 =?iso-8859-1?Q?aUYKhharZpKZw7tmjDjFygKF01aGq1nc44CpAeBzfx9rOxSxhoMJ7Jai1F?=
 =?iso-8859-1?Q?6O9X+3lr7eINcTZ6tpZNYu5Abvd5qzRj2wDMLxkt5kjJBH87j2Jp5TIu5L?=
 =?iso-8859-1?Q?+GDLNFgNH3aTOg0umGUaP6fEqlitekV9i4tvmyUMSldpEBIo6fqxslVWx9?=
 =?iso-8859-1?Q?rs6Fq2hDeZ1ZkHOhPii4SRP56immMxRM2ot8UqeCpb6HYxRHLNQvGoDavH?=
 =?iso-8859-1?Q?k0CHbznmuiQkVQqEc4jtVK+JloWxV7srMBqHWolGBM/wf/9yhxI2261X8P?=
 =?iso-8859-1?Q?p3UDRCIrN221fmHhMVC/uaQu6Q03tJ9lnWwtcmxs3iHdbL2JF0gCfaRSfD?=
 =?iso-8859-1?Q?Xh8iopDOC7UAs86Z/8+Cqi6wzCHNiUKRzVD5ACwxS+DOuUke+ZOVbDaFvi?=
 =?iso-8859-1?Q?K5YGcwuS+GIVeT4iMcxVtYOVW6OnDAczHQP7pKUM9/WPrCqmJjWli08ERu?=
 =?iso-8859-1?Q?NOnwAhxM87AVzlHFS3MjuylZVelU1RW3u1pENi2kou3WcZoEQxbY+Rgztt?=
 =?iso-8859-1?Q?6isbUKwfKSrVzAo0fiBp3EjrCY5n6KqEPOWqrJh6PRFbXN6UJzxLy+SIm4?=
 =?iso-8859-1?Q?/g2zXMrjqFtYfhpvsveDauwm9Bq9HLuzf0CRz8nneTMQ8QQc1jXfzU95Bt?=
 =?iso-8859-1?Q?fXk/kJNY1jE/qsmoHyNeLsQET5ZtfyQls0W4rAVTeocJBHarRc7naNQHqA?=
 =?iso-8859-1?Q?JoguRKL02wOr/ytCeibUAgu3eIW+JnqRl75LBVnp8gHYp+wbkcB2/I68Jw?=
 =?iso-8859-1?Q?EcxJOvfa+3QniqOlF25gzkjgderELm5gd79wYQCe2E1mD/5KMUZzy1TUNc?=
 =?iso-8859-1?Q?WAMeLWOFNyDzhffq0BVc7A1JbUzon2NJSK5r9YWxyVBOCSjjeLFG3emhPT?=
 =?iso-8859-1?Q?ej3HB8TuQ0X+zwbNUL97o/kZ/fP8uX8mIFejqIYY+ulDmHLK2U1HHgtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab561f4-fc46-4639-de7f-08dc4464f415
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:25:56.4275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVrI5kbgmcMJy4XjqMqH0ybWB12UybDfYkpQrlUSpW6YBq/gSlyZtoD7SZvySbRtwxCgzmQ4RtGk7x16n22uLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4932
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

On Wed, Mar 13, 2024 at 11:35:52PM -0400, Oak Zeng wrote:
> Add a helper function xe_hmm_populate_range to populate
> a a userptr or hmmptr range. This functions calls hmm_range_fault
> to read CPU page tables and populate all pfns/pages of this
> virtual address range.
> 
> If the populated page is system memory page, dma-mapping is performed
> to get a dma-address which can be used later for GPU to access pages.
> 
> If the populated page is device private page, we calculate the dpa (
> device physical address) of the page.
> 
> The dma-address or dpa is then saved in userptr's sg table. This is
> prepare work to replace the get_user_pages_fast code in userptr code
> path. The helper function will also be used to populate hmmptr later.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile |   3 +-
>  drivers/gpu/drm/xe/xe_hmm.c | 213 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hmm.h |  12 ++
>  3 files changed, 227 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 840467080e59..29dcbc938b01 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -143,7 +143,8 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
>  	xe_wopcm.o \
> -	xe_svm_devmem.o
> +	xe_svm_devmem.o \
> +	xe_hmm.o
>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> new file mode 100644
> index 000000000000..c45c2447d386
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/mmu_notifier.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/memremap.h>
> +#include <linux/swap.h>
> +#include <linux/mm.h>
> +#include "xe_hmm.h"
> +#include "xe_vm.h"
> +
> +/**
> + * mark_range_accessed() - mark a range is accessed, so core mm
> + * have such information for memory eviction or write back to
> + * hard disk
> + *
> + * @range: the range to mark
> + * @write: if write to this range, we mark pages in this range
> + * as dirty
> + */
> +static void mark_range_accessed(struct hmm_range *range, bool write)
> +{
> +	struct page *page;
> +	u64 i, npages;
> +
> +	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
> +	for (i = 0; i < npages; i++) {
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (write) {
> +			lock_page(page);
> +			set_page_dirty(page);
> +			unlock_page(page);
> +		}
> +		mark_page_accessed(page);
> +	}
> +}
> +
> +/**
> + * build_sg() - build a scatter gather table for all the physical pages/pfn
> + * in a hmm_range. dma-address is save in sg table and will be used to program
> + * GPU page table later.
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
> + * the scatter gather table. This is for the convenience of
> + * later on operations to bind address range to GPU page table.
> + *
> + * The dma_address in the sg table will later be used by GPU to
> + * access memory. So if the memory is system memory, we need to
> + * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
> + * is GPU local memory (of the GPU who is going to access memory),
> + * we need gpu dpa (device physical address), and there is no need
> + * of dma-mapping.
> + *
> + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> + * memory. Add this when you support p2p
> + *
> + * This function allocates the storage of the sg table. It is
> + * caller's responsibility to free it calling sg_free_table.
> + *
> + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> + */
> +static int build_sg(struct xe_device *xe, struct hmm_range *range,

xe is unused.

> +			     struct sg_table *st, bool write)
> +{
> +	struct device *dev = xe->drm.dev;
> +	struct scatterlist *sg;
> +	u64 i, npages;
> +
> +	sg = NULL;
> +	st->nents = 0;
> +	npages = ((range->end - 1) >> PAGE_SHIFT) - (range->start >> PAGE_SHIFT) + 1;
> +
> +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npages; i++) {
> +		struct page *page;
> +		unsigned long addr;
> +		struct xe_mem_region *mr;
> +
> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (is_device_private_page(page)) {
> +			mr = page_to_mem_region(page);

Not seeing where page_to_mem_region is defined.

> +			addr = vram_pfn_to_dpa(mr, range->hmm_pfns[i]);
> +		} else {
> +			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
> +					write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
> +		}
> +
> +		if (sg && (addr == (sg_dma_address(sg) + sg->length))) {
> +			sg->length += PAGE_SIZE;
> +			sg_dma_len(sg) += PAGE_SIZE;
> +			continue;
> +		}
> +
> +		sg =  sg ? sg_next(sg) : st->sgl;
> +		sg_dma_address(sg) = addr;
> +		sg_dma_len(sg) = PAGE_SIZE;
> +		sg->length = PAGE_SIZE;
> +		st->nents++;
> +	}
> +
> +	sg_mark_end(sg);
> +	return 0;
> +}
> +

Hmm, this looks way to open coded to me.

Can't we do something like this:

struct page **pages = convert from range->hmm_pfns
sg_alloc_table_from_pages_segment
if (is_device_private_page())
        populatue sg table via vram_pfn_to_dpa
else
        dma_map_sgtable
free(pages)

This assume we are not mixing is_device_private_page & system memory
pages in a single struct hmm_range.


> +/**
> + * xe_hmm_populate_range() - Populate physical pages of a virtual
> + * address range
> + *
> + * @vma: vma has information of the range to populate. only vma
> + * of userptr and hmmptr type can be populated.
> + * @hmm_range: pointer to hmm_range struct. hmm_rang->hmm_pfns
> + * will hold the populated pfns.
> + * @write: populate pages with write permission
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

I'd add a helper to free the sg_free_table & unmap the dma pages if
needed.

> + *
> + * returns: 0 for succuss; negative error no on failure
> + */
> +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
> +						bool write)
> +{

The layering is all wrong here, we shouldn't be touching struct xe_vma
directly in hmm layer.

Pass in a populated hmm_range and sgt. Or alternatively pass in
arguments and then populate a hmm_range locally.

> +	unsigned long timeout =
> +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> +	struct xe_userptr_vma *userptr_vma;
> +	struct xe_userptr *userptr;
> +	u64 start = vma->gpuva.va.addr;
> +	u64 end = start + vma->gpuva.va.range;

We have helper - xe_vma_start and xe_vma_end but I think either of these
are correct in this case.

xe_vma_start is the address which this bound to the GPU, we want the
userptr address.

So I think it would be:

start = xe_vma_userptr()
end = xe_vma_userptr() + xe_vma_size()


> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	u64 npages;
> +	int ret;
> +
> +	userptr_vma = to_userptr_vma(vma);
> +	userptr = &userptr_vma->userptr;
> +	mmap_assert_locked(userptr->notifier.mm);
> +
> +	npages = ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;

This math is done above, if you need this math in next rev add a helper.

> +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (unlikely(!pfns))
> +		return -ENOMEM;
> +
> +	if (write)
> +		flags |= HMM_PFN_REQ_WRITE;
> +
> +	memset64((u64 *)pfns, (u64)flags, npages);

Why is this needed, can't we just set hmm_range->default_flags?

> +	hmm_range->hmm_pfns = pfns;
> +	hmm_range->notifier_seq = mmu_interval_read_begin(&userptr->notifier);

We need a userptr->notifier == userptr->notifier_seq check that just
returns, right?

> +	hmm_range->notifier = &userptr->notifier;
> +	hmm_range->start = start;
> +	hmm_range->end = end;
> +	hmm_range->pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;

Is this needed? AMD and Nouveau do not set this argument.

> +	/**
> +	 * FIXME:
> +	 * Set the the dev_private_owner can prevent hmm_range_fault to fault
> +	 * in the device private pages owned by caller. See function
> +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to the
> +	 * device owner of the best migration destination. e.g., device0/vm0
> +	 * has a page fault, but we have determined the best placement of
> +	 * the fault address should be on device1, we should set below to
> +	 * device1 instead of device0.
> +	 */
> +	hmm_range->dev_private_owner = vm->xe->drm.dev;
> +
> +	while (true) {

mmap_read_lock(mm);

> +		ret = hmm_range_fault(hmm_range);

mmap_read_unlock(mm);

> +		if (time_after(jiffies, timeout))
> +			break;
> +
> +		if (ret == -EBUSY)
> +			continue;
> +		break;
> +	}
> +
> +	if (ret)
> +		goto free_pfns;
> +
> +	ret = build_sg(vm->xe, hmm_range, &userptr->sgt, write);
> +	if (ret)
> +		goto free_pfns;
> +
> +	mark_range_accessed(hmm_range, write);
> +	userptr->sg = &userptr->sgt;

Again this should be set in caller after this function return.

> +	userptr->notifier_seq = hmm_range->notifier_seq;

This is could be a pass by reference I guess and set here.

> +
> +free_pfns:
> +	kvfree(pfns);
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> new file mode 100644
> index 000000000000..960f3f6d36ae
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hmm.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <linux/types.h>
> +#include <linux/hmm.h>
> +#include "xe_vm_types.h"
> +#include "xe_svm.h"

As per the previous patches no need to xe_*.h files, just forward
declare any arguments.

Matt

> +
> +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range *hmm_range,
> +						bool write);
> -- 
> 2.26.3
> 
