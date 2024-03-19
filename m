Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAB4C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 16:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF8010FBDF;
	Tue, 19 Mar 2024 16:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nuQNvDL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E790710FBDF
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710867037; x=1742403037;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=18gpO4FODeqw+g9kBWJoKqCg/HqJWJBzca44g/XJ3bE=;
 b=nuQNvDL4Arbe9Vu+Q2wT6kctdILMjotazDPcm6SIlpVAlVa6tqm+EhpC
 u+V1L0+JH/jQv41E1ViyUX0XX7hasuRGztuUnmV4Uew2vOUv0WX/eCJCj
 h/sLK2Z6bOYcl1vPrFsK/+JHQ9BtMBp8h5y2jgFoKMRM1vwA29Fwsjiec
 pGCDObtHk0QeyOZMAtQ9/Tvbr+eikaYOskm1xW6KcjUQp4+o3vhhTBykz
 mWR4m+xUg/OW87g1KvPkZKV0KnMiFOWjMjVDd2teo89PbN1VBt7oygsBd
 dSi8UJTx2tfo8O8v6OGEJ3bHqUShwYDeyActpFGkciazwZ9qXYVFfU0p4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5873534"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5873534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 09:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13935867"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2024 09:50:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 09:50:33 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Mar 2024 09:50:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Mar 2024 09:50:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Mar 2024 09:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw4O5FcPZvM8Snojv96uSEbTuWl/T7dX1gaQZYH5jEQzRTWH/JP38DWMomC+QVjNZvDCMzqBg5DktAmbt1GtgL23d7SS7prW3eKtu35+Panu4GTpQwwR21+5I7Mxe6Af1zzJPwB+SCUYlkuq/tkfEMc4NSS7EYYgc7QfTlKvrIvE7KYzEvoyI6WjcM/wIukuc+XA6qM+AIGufSQPpRnjmWhzE/odPyFiJ0nfO8NC5B2KQGdb5Zx5S/TDggs+yBgZCoq55RP6eR4z5mqgd3DpS7NQSDcsXAdT97t5FYqTGv6BFVbbc1AWIKbaAGXmfh5D+yDyASLBRpifzAWqdTR8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkFKytKdN2zf/Qi0vz9A8AkdpTvZdDFWmTnnGO8hzVs=;
 b=edt7tz40x7TbEeGh1Uo8gPlFen1Go6GMXrYhxGZ5Odbdkq8ZUMwifBRImYxK7eNNb4JSb/KnRitSVdGpLL3hDInol6yLkpK7hdJc3w8ejd0eBG+/Yhie9bwh42vxA2DszSodfkb3K1Y6rVeNywOkltYdm8bFxFp9k77cQxsNKSpcKQI0iD5lKOlmUpIms+ZtSHWTD35nQqCs43QiutLlQ5NXS4cUwsPOikIg2hQAGnN9BBLxICtfNM26ak+PkdItlcKKjcegrrGM0UA56gS7c4ZuPpG1uYLzFlPtP52Zdn4vvbTF0LyVA1aGsZRsvveGQ5FSg0gWBPgv2VA1YHz+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 16:50:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 16:50:31 +0000
Date: Tue, 19 Mar 2024 16:48:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Zeng, 
 Oak" <oak.zeng@intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 6/8] drm/xe: Helper to populate a userptr or hmmptr
Message-ID: <ZfnB5RMGfzAVPwoR@DUT025-TGLU.fm.intel.com>
References: <20240319025511.1598354-1-oak.zeng@intel.com>
 <20240319025511.1598354-7-oak.zeng@intel.com>
 <79823ba6edcfeed9010ef2d390e4cc9765e7191d.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79823ba6edcfeed9010ef2d390e4cc9765e7191d.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 7975375c-4e1d-443b-e0ef-08dc4834b000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxUImom/yMNXO5pFLFg+0WgHY+qHQ5EywHpvt1g0IwADhMGbL1DyhRJqiLgC0RAU8fQ4jcOLvpvK8E0ZS5IqDylDh5WrFIg3q/9wOF081Bki5AOD6fjt+pwWOqC4qzR/1fB0UAFJ7/h0dKTLzh8LL7kr6/wz/0/u9GxTHiCY9kMQ97iGALS9WtaEnlXCr8bquNxVAj8p9wRoDzht/gcYqaHk0aiVHajwjRIwTdC0ZdnBxvLtqHGV8uMrDuhQoBvWA5VHKe8LIFnAKkVgjHUoqikKUVVIX3vJaq13SWAXkunFZBXONdJYIj43pKpTHYxgiUKFSBGh0pentGgoOgczbU1Pngnw/WBAZlu/Invr6a+TxmZCxZjiiOxDWhbmAnvfRXIx8GbGV3lugSFeaU85YlS7cRlO8y/1sVUjP4CYpjN19pbINlSanXKLJT76NsmILJ0Hs5A7z4l/orK/iRzWgQdV/kg88FhWDpLM2GVK1LORu2kzcpvkPfDceJiDrocFKZUGUa8jJTCqzetTm9P0wCPqiSJwfJXFbsmUgsCYtEaGooH3mbnexgRx64y1LnNk5DdM3M4AnETaXg1No+ziLufv2+bzPywEvm+USeQZugs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?swsVJtTDy8Zq/UIZ/Y/LUa79zr0wMQTjLMWf3lEOzPfHu4zCiOJh4N3MiX?=
 =?iso-8859-1?Q?T2FNm/sHFYA6KBR8uuIa0dG6gnjhqGuc7xLYrEenMoroIFOkTWci+j84ON?=
 =?iso-8859-1?Q?UUjXd+5UjrzVqBlBmYlK7ixiROQuvswX/o4wNQ4TeHogJDRavy74jrbTt4?=
 =?iso-8859-1?Q?7MRZBcBFH4LHqIsdcsu75q9j7FqrRr9nYYJ+z2H2msSRtmEs+xL7z/vOuw?=
 =?iso-8859-1?Q?IiTHTBVMMRk+62npKu1vIhXnK/gs6avtOglekhl00swdJow0K1Rj3cdxX2?=
 =?iso-8859-1?Q?WjYLIuDzJjKsKUl6h1J1hiCe4Eam4KY2rjOH4hfsOcRDaDp/YiHdu7U67n?=
 =?iso-8859-1?Q?rm09z3A0OH96kK+mEVQQykNbvlczlThBkhYU9v6jzciKI7tgH6GSVa06HU?=
 =?iso-8859-1?Q?6bZPIUG/f7olEfrS8MmjJuI7CgOUyG1UI7aBNWtVY2iuAZ3NgAcw5AYFla?=
 =?iso-8859-1?Q?qLNycAQkAm7NAtmnXw+a/TkzwzqeTE+R78D3D5JDjaSvc0OS+L164ADc1D?=
 =?iso-8859-1?Q?zRTz+1uROV6YxwS1IitwuiDLk2c4/jpPXqfRLdD2cy8mTdX8krdBOImpUj?=
 =?iso-8859-1?Q?CL2yyETbK64mWM316IVxs+t8YsbBhU+oSJZZaMoGwqZwhbYAgyqsfkMKBT?=
 =?iso-8859-1?Q?c85pZPJD7F7WqyGUVrpIgJR74s5giLRc5+xmbIqZJHZKKwsnMFqBxie/jl?=
 =?iso-8859-1?Q?JswZ5bpKxmZEyTiZdFrLlkbZRZ0XVSwYM3/ZihX88yXkg8mvTbLSjwZ258?=
 =?iso-8859-1?Q?l+0g1HONd0x1nque69HMqonwsl69jiyXNURIJKHcoiZkteAPrU1z4yFtAo?=
 =?iso-8859-1?Q?ywL39i6NnSOErHZTNkuicYwb3nHurbmISso9FLxriyhIjBNHaLN2wR1ZLt?=
 =?iso-8859-1?Q?JZgdJJCd5t2l1bzfovFVXAqukmvF3buaLSDRysAlXQikdnluCtgWv7jMnW?=
 =?iso-8859-1?Q?IonYPI3p97mbmoBgRcQC5fs6nZ2q8VkVp1SsrfYZ8GUG1L0ZmFJtMdF4Zm?=
 =?iso-8859-1?Q?PHrl71/DZSpmHHYzQUkCxr+uXVzjAON6OPLOfuMVH5SiZD6r+H2rSN51fG?=
 =?iso-8859-1?Q?2jXsBTfDaSCw0BX5wR+Lmnja7ZmhOqIlmFIT+plHxyzBezU0BqGSisgC+3?=
 =?iso-8859-1?Q?MJezaxCcJPPho0GzqiApIRBJgIrdpU0zcuXFwry/mqVHl3tg7Afq0PBEsY?=
 =?iso-8859-1?Q?eAhMk3sVp0O4i4MakA75qDhY/o96lU6lJ1KpGu0F+WbtrohT9Np3dZQigb?=
 =?iso-8859-1?Q?bT7tAtYsW1Euks46oc6pj/xA0SGTORKPvH3l61ajlGd4viHW9aoCA9Y2za?=
 =?iso-8859-1?Q?fi0TLXBNohOA5yntMyl/Us8Sy4u8omSksZB5zphRt3ZkaBdmOej79nbJGa?=
 =?iso-8859-1?Q?P91CyNiL7noDBIGFA/IBqEzrXroXMlaLk8+exjDjgrXIw2WHpBN+mqbF3z?=
 =?iso-8859-1?Q?sSEgJgBj+RW+taahezubKowvd+6pU/pFY7eZKH1oFMKmtOdKnDV0tECPZ+?=
 =?iso-8859-1?Q?KiPNHN0901FpqFfF7DPuKWd5YQRxFEpHs0Nt9HNLowXLhHRE/2M8B6C/Ua?=
 =?iso-8859-1?Q?601+iClZN0RSGcLH45XQLcyQCjRly69/Gu/zKAdoqptYFhUqhjgA6iNeGR?=
 =?iso-8859-1?Q?p2vqzuk8qJQf5QPmfxrfynvX6ftnlaXfByGKesmKCM6fmtA1zzgcIDIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7975375c-4e1d-443b-e0ef-08dc4834b000
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 16:50:30.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkXRKrOa9tJ1HRTskymwaP0vYhwKroXaDMVhusobIpnG7dT+Ubn2CXdey8qcXwe2b8pE/Kh9LAXF2bVQvV8YvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
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

On Tue, Mar 19, 2024 at 04:33:39AM -0600, Hellstrom, Thomas wrote:
> On Mon, 2024-03-18 at 22:55 -0400, Oak Zeng wrote:
> > Add a helper function xe_userptr_populate_range to populate
> > a a userptr or hmmptr range. This functions calls hmm_range_fault
> > to read CPU page tables and populate all pfns/pages of this
> > virtual address range.
> > 
> > If the populated page is system memory page, dma-mapping is performed
> > to get a dma-address which can be used later for GPU to access pages.
> > 
> > If the populated page is device private page, we calculate the dpa (
> > device physical address) of the page.
> > 
> > The dma-address or dpa is then saved in userptr's sg table. This is
> > prepare work to replace the get_user_pages_fast code in userptr code
> > path. The helper function will also be used to populate hmmptr later.
> > 
> > v1: Address review comments:
> >     separate a npage_in_range function (Matt)
> >     reparameterize function xe_userptr_populate_range function (Matt)
> >     move mmu_interval_read_begin() call into while loop (Thomas)
> >     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
> >     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
> >     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> > 
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile |   1 +
> >  drivers/gpu/drm/xe/xe_hmm.c | 231
> > ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hmm.h |  10 ++
> >  3 files changed, 242 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index e2ec6d1375c0..52300de1e86f 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
> >  	xe_guc_pc.o \
> >  	xe_guc_submit.o \
> >  	xe_heci_gsc.o \
> > +	xe_hmm.o \
> >  	xe_hw_engine.o \
> >  	xe_hw_engine_class_sysfs.o \
> >  	xe_hw_fence.o \
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.c
> > b/drivers/gpu/drm/xe/xe_hmm.c
> > new file mode 100644
> > index 000000000000..305e3f2e659b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > @@ -0,0 +1,231 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/memremap.h>
> > +#include <linux/swap.h>
> > +#include <linux/hmm.h>
> > +#include <linux/mm.h>
> > +#include "xe_hmm.h"
> > +#include "xe_svm.h"
> > +#include "xe_vm.h"
> > +
> > +static inline u64 npages_in_range(unsigned long start, unsigned long
> > end)
> > +{
> > +	return ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) +
> > 1;
> > +}
> > +
> > +/**
> > + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> > + * have such information for memory eviction or write back to
> > + * hard disk
> > + *
> > + * @range: the range to mark
> > + * @write: if write to this range, we mark pages in this range
> > + * as dirty
> > + */
> > +static void xe_mark_range_accessed(struct hmm_range *range, bool
> > write)
> > +{
> > +	struct page *page;
> > +	u64 i, npages;
> > +
> > +	npages = npages_in_range(range->start, range->end);
> > +	for (i = 0; i < npages; i++) {
> > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (write)
> > +			set_page_dirty_lock(page);
> > +
> > +		mark_page_accessed(page);
> > +	}
> > +}
> > +
> > +/**
> > + * build_sg() - build a scatter gather table for all the physical
> > pages/pfn
> > + * in a hmm_range. dma-address is save in sg table and will be used
> > to program
> > + * GPU page table later.
> > + *
> > + * @xe: the xe device who will access the dma-address in sg table
> > + * @range: the hmm range that we build the sg table from. range-
> > >hmm_pfns[]
> > + * has the pfn numbers of pages that back up this hmm address range.
> > + * @st: pointer to the sg table.
> > + * @write: whether we write to this range. This decides dma map
> > direction
> > + * for system pages. If write we map it bi-diretional; otherwise
> > + * DMA_TO_DEVICE
> > + *
> > + * All the contiguous pfns will be collapsed into one entry in
> > + * the scatter gather table. This is for the convenience of
> > + * later on operations to bind address range to GPU page table.
> > + *
> > + * The dma_address in the sg table will later be used by GPU to
> > + * access memory. So if the memory is system memory, we need to
> > + * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
> > + * is GPU local memory (of the GPU who is going to access memory),
> > + * we need gpu dpa (device physical address), and there is no need
> > + * of dma-mapping.
> > + *
> > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > + * memory. Add this when you support p2p
> > + *
> > + * This function allocates the storage of the sg table. It is
> > + * caller's responsibility to free it calling sg_free_table.
> > + *
> > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > + */
> > +static int build_sg(struct xe_device *xe, struct hmm_range *range,
> > +			     struct sg_table *st, bool write)
> > +{
> > +	struct device *dev = xe->drm.dev;
> > +	struct scatterlist *sg;
> > +	u64 i, npages;
> > +
> > +	sg = NULL;
> > +	st->nents = 0;
> > +	npages = npages_in_range(range->start, range->end);
> > +
> > +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < npages; i++) {
> > +		struct page *page;
> > +		unsigned long addr;
> > +		struct xe_mem_region *mr;
> > +
> > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (is_device_private_page(page)) {
> > +			mr = xe_page_to_mem_region(page);
> > +			addr = xe_mem_region_pfn_to_dpa(mr, range-
> > >hmm_pfns[i]);
> > +		} else {
> > +			addr = dma_map_page(dev, page, 0, PAGE_SIZE,
> > +					write ? DMA_BIDIRECTIONAL :
> > DMA_TO_DEVICE);
> > +		}
> 
> The dma_map_page call here essentially stops the iommu from coalescing
> the page-table into contigous iommu VAs, and stops us from using huge
> page-table-entries for the PPGTT. IMO we should investigate whether we
> could build a single scatter-gather using sg_alloc_table_from_pages()
> or perhaps look at sg_alloc_append_table_from_pages(), and then use
> dma_map_sg() on contiguous chunks of system pages within that sg-table.
> 

Yes, this was my concern as well. I suggested we continue to use
sg_alloc_table_from_pages_segment + dma_map_sgtable with only system
support for now as device private page tables are still unused at the
moment. That suggestion, among, other seems to have been ignored. I'm
referring to my reply in [1], it would be nice to see those suggestions
followed.

Thomas is right about huge page-table-entries in the PPGTT. Add some
printks if you need to see this in action (xe_pt_stage_bind_entry,
xe_pt_hugepte_possible returning true).

Make sure the IOMMU is enabled (intel_iommu=on on kernel cmdline) and run:

xe_vm.large-userptr-binds-16777216 -> This will use 8x 2MB page tables on tip
xe_vm.large-userptr-binds-2147483648 -> This will use 2x 1GB page tables on tip

With your series it will likely use 4k pages for everything.

Matt

[1] https://patchwork.freedesktop.org/patch/582859/?series=131117&rev=1#comment_1064237

> /Thomas
> 
> 
> > +
> > +		if (sg && (addr == (sg_dma_address(sg) + sg-
> > >length))) {
> > +			sg->length += PAGE_SIZE;
> > +			sg_dma_len(sg) += PAGE_SIZE;
> > +			continue;
> > +		}
> > +
> > +		sg =  sg ? sg_next(sg) : st->sgl;
> > +		sg_dma_address(sg) = addr;
> > +		sg_dma_len(sg) = PAGE_SIZE;
> > +		sg->length = PAGE_SIZE;
> > +		st->nents++;
> > +	}
> > +
> > +	sg_mark_end(sg);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_userptr_populate_range() - Populate physical pages of a
> > virtual
> > + * address range
> > + *
> > + * @uvma: userptr vma which has information of the range to
> > populate.
> > + *
> > + * This function populate the physical pages of a virtual
> > + * address range. The populated physical pages is saved in
> > + * userptr's sg table. It is similar to get_user_pages but call
> > + * hmm_range_fault.
> > + *
> > + * This function also read mmu notifier sequence # (
> > + * mmu_interval_read_begin), for the purpose of later
> > + * comparison (through mmu_interval_read_retry).
> > + *
> > + * This must be called with mmap read or write lock held.
> > + *
> > + * This function allocates the storage of the userptr sg table.
> > + * It is caller's responsibility to free it calling sg_free_table.
> > + *
> > + * returns: 0 for succuss; negative error no on failure
> > + */
> > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> > +{
> > +	unsigned long timeout =
> > +		jiffies +
> > msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long *pfns, flags = HMM_PFN_REQ_FAULT;
> > +	struct xe_userptr *userptr;
> > +	struct xe_vma *vma = &uvma->vma;
> > +	u64 start = xe_vma_userptr(vma);
> > +	u64 end = start + xe_vma_size(vma);
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct hmm_range hmm_range;
> > +	bool write = !xe_vma_read_only(vma);
> > +	bool in_kthread = !current->mm;
> > +	u64 npages;
> > +	int ret;
> > +
> > +	userptr = &uvma->userptr;
> > +	mmap_assert_locked(userptr->notifier.mm);
> > +
> > +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > +		return 0;
> > +
> > +	npages = npages_in_range(start, end);
> > +	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (unlikely(!pfns))
> > +		return -ENOMEM;
> > +
> > +	if (write)
> > +		flags |= HMM_PFN_REQ_WRITE;
> > +
> > +	if (in_kthread) {
> > +		if (!mmget_not_zero(userptr->notifier.mm)) {
> > +			ret = -EFAULT;
> > +			goto free_pfns;
> > +		}
> > +		kthread_use_mm(userptr->notifier.mm);
> > +	}
> > +
> > +	memset64((u64 *)pfns, (u64)flags, npages);
> > +	hmm_range.hmm_pfns = pfns;
> > +	hmm_range.notifier = &userptr->notifier;
> > +	hmm_range.start = start;
> > +	hmm_range.end = end;
> > +	hmm_range.pfn_flags_mask = HMM_PFN_REQ_FAULT |
> > HMM_PFN_REQ_WRITE;
> > +	/**
> > +	 * FIXME:
> > +	 * Set the the dev_private_owner can prevent hmm_range_fault
> > to fault
> > +	 * in the device private pages owned by caller. See function
> > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be
> > set to the
> > +	 * device owner of the best migration destination. e.g.,
> > device0/vm0
> > +	 * has a page fault, but we have determined the best
> > placement of
> > +	 * the fault address should be on device1, we should set
> > below to
> > +	 * device1 instead of device0.
> > +	 */
> > +	hmm_range.dev_private_owner = vm->xe;
> > +
> > +	while (true) {
> > +		hmm_range.notifier_seq =
> > mmu_interval_read_begin(&userptr->notifier);
> > +		ret = hmm_range_fault(&hmm_range);
> > +		if (time_after(jiffies, timeout))
> > +			break;
> > +
> > +		if (ret == -EBUSY)
> > +			continue;
> > +		break;
> > +	}
> > +
> > +	if (in_kthread) {
> > +		kthread_unuse_mm(userptr->notifier.mm);
> > +		mmput(userptr->notifier.mm);
> > +	}
> > +
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	ret = build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	xe_mark_range_accessed(&hmm_range, write);
> > +	userptr->sg = &userptr->sgt;
> > +	userptr->notifier_seq = hmm_range.notifier_seq;
> > +
> > +free_pfns:
> > +	kvfree(pfns);
> > +	return ret;
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.h
> > b/drivers/gpu/drm/xe/xe_hmm.h
> > new file mode 100644
> > index 000000000000..fa5ddc11f10b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > @@ -0,0 +1,10 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_userptr_vma;
> > +
> > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> 
