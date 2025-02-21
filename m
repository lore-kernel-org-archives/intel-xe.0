Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC48FC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 12:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9844210E21D;
	Fri, 21 Feb 2025 12:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ACPcl6xV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFE310E21D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740140098; x=1771676098;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Dd720J3gmBE1UQdL9l8h9mHOG8XpDeB9y6yzmM7yQFg=;
 b=ACPcl6xVNV3gAl5JzW//WjkO8/x6oytxUC/Z7vie7DyocHtsF05jGjmb
 3q0xQ72h2L8Z3dgPdOhVQ2mj6p4RyrIV9PufN2WIfTc23yaF18Gqf98kT
 QSR6dQ9JF8+mEpup0+yRWmbP/kHB4aoiRK8oGf9GMSEwq6tBale0pszAG
 HAhK83waEtdbxE8d/DJCxCiCNGvSbOTHfj0yqFt4AYcGuxdtLdw11nf9D
 hH15ToKNmELCEWYypCc1gY9Ajjo2MU2tdzjEXEZ5t7M/Y3tNcLSvNMo6g
 GX5UaojD9bloS6azF7UapoVjWzG1g9dJBnUmlVt6ZeQ75ide+/tZFdEr2 w==;
X-CSE-ConnectionGUID: WuHJ7ZI+TfeMgr3qjoSOKQ==
X-CSE-MsgGUID: 9kd01XRRSdSMnHqg+BDDfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41080869"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="41080869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 04:14:57 -0800
X-CSE-ConnectionGUID: miZDWu4sT/qNJa7S6wk8SQ==
X-CSE-MsgGUID: cip6d4yzTDKDraSbEPirOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115549604"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 04:14:57 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 04:14:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 04:14:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 04:14:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jx/u6u+88h1t/8Ww7SaKFHdq0isjvT15vwoobcXXkp3myMYSkzockiAb9F7uVeMUFj/TA9hvhHg+DGCRWPkQr22kM1+V3sD7qchrM2Gc1PU/4dlKpydVvw3ENlLyf8c79AEgZvawdFhxd+S8pk9cji1aq2rvOdvm9OvSQmjFczHJZCcaTEMt+LHlej09AXyOZyUucvOa1cV075+jYOujWnpW0UHtAszMKRLUJ+PPxEIH6PC5IySPCfL3VxUDVbMkJQtijMO4GmVFfYVfGxoaeBijsrLuA6/92/joPeg6yexN5BP+bS6LrZBSfkVE8EUXHbXtrTqjzyu6LjvqvOmdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRu2CD8n2bO5/u1IdYit50frvEMgEl/NrB+jwtPqLn4=;
 b=Mf99VRLorcT/ZYksswJTfcUAZIzEarbCe/7ntqVFqGUrJ/1AaKULKaJO6io8iBAIiZBk3ILuo1KzCHe3f/en/83gbAKcjYLI8JNqmQk8NIe0LqnDAx9y5wOAGt2YBkzTmko1fqNC31GwvNhjrFu/JuXAWvfeKxt9Y7MRgseDrm6Pg9ZUTQ9wzVGEFdtxyz5LZUXxbOz6qoceIjKIqOKyGM/BrPrKcl2pI7nv4mo5Q9cpLLylidW2PRWArViAUfk8jjuCUMAVLrkHRCoN76nYBC8/hXC4SqUio2cQ6le9d3oRr4rr0d7/Q3VBmlpNe31/zE+cle/69Xicnm8GXaWUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 12:14:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 12:14:50 +0000
Date: Fri, 21 Feb 2025 13:14:41 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Add stats for vma page faults
Message-ID: <Z7huMRIDb0S7FPKK@fdugast-desk>
References: <20250206134551.1321265-1-francois.dugast@intel.com>
 <c885d759-b9a9-4971-9794-f6ba0202a3ae@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c885d759-b9a9-4971-9794-f6ba0202a3ae@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR08CA0247.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b43e5d7-05f6-4b77-c56c-08dd52715749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cLduhQqxwxfw5Csk0FeSL0agmM9AG/TinFuUPPYEOnQOtm/WADfqEuSu7Ynp?=
 =?us-ascii?Q?AxQ6RZZpZwKeE0j3ki7FqleLKFIGvJB4bLc4Eqg8+zkP/iZ9qse8dYXcKnTW?=
 =?us-ascii?Q?mwG0hP5W9ODOvW6ySySpwfMD4jGMtqla92L0oPHuxNImjBtoM/4v78dGoKms?=
 =?us-ascii?Q?ZPXDTyiSuzQfXaQum9l4QLguCEv3K1DgXtOOkv43onUN+I0ZpCv6tbvy+VFs?=
 =?us-ascii?Q?NlXsjUoH85VV2B9ZjgzEgEugTro9+SY2aX/+GYxOJdLnSiiNd5y3ENa8Z7zc?=
 =?us-ascii?Q?xj33BhLbW19UbC50c4WGnGhFj5jjGSrlCM5dC30nk81L2Yifxq5WEUIJX88o?=
 =?us-ascii?Q?yyb7Fdi7/GiiTpqflrby61/+Mpy2EQm+lByjkliLGat4xmhlHH0uL4mG4KfD?=
 =?us-ascii?Q?xNFLoBmDYpjR23ziSGcWBUhVn3LVWhSYAffUIg3ccjgO+gE8k/8v8/KHRez2?=
 =?us-ascii?Q?4YFC5x9E2uoyS28eRwButCODNEX3ynI2FUS4KvPPegTzHoraQPZVPz2XfFXt?=
 =?us-ascii?Q?O5le0/SCgRQDtpoGwGpBMmPZnkwE9luOTBJBpY2eFJG9VNr9C6dv2gonr2HB?=
 =?us-ascii?Q?+o37lcD4rmXr47dv4+mGkEZ1FqfIPrhoAuKutK48qRkcopY3y9ugBUD6thTY?=
 =?us-ascii?Q?i9CegNcV5Pv2U4hVM0LFsndQNbFSA+coLU6KAdLf2p1GPFLFXcLxYiTPjMiX?=
 =?us-ascii?Q?+MXU/PDHukgR6mW8XugRLI8jcoTDUV03eSby+vnoObzLv9CgDnuozVOXAsuZ?=
 =?us-ascii?Q?wkWpgPxi6xLd+6YX/88/P7iqaOYYnAMLF0sj2pYG59QMDnv7zZNSh1VdkDPC?=
 =?us-ascii?Q?Vzha3QFb2iGwhAEHhpNTRBphUcEpDfI4wcfhohGCA0HgeU7UiAFzvrMh78ZF?=
 =?us-ascii?Q?rW7IdAgYyWpEW9F50hLDbe2Eumm85BVzYt8xW+DLBZwbFJ+Z6kuZ7D1Wxl9z?=
 =?us-ascii?Q?6OlnbPOHDc3INghEm9keXwQMzSb7O/utaPwXN2oHKmJAv6Fgfx+/XxgXH83b?=
 =?us-ascii?Q?Ca6vXciCD+03p+xm6ACzJC+PV8iAl/Y6spJZFXJfzaoIuGwdbO0n0zc9TU6K?=
 =?us-ascii?Q?X++w43g7cVHr5At5gnrRn2+xGQA0Wo277oKAFTRiTIuW0nXFIDXnEq1znFma?=
 =?us-ascii?Q?pDPt7yLIGe//dh4AWhRjoHIHYg+5N4VgyrOcqW4DF+w9NaD3id2v75iGVL09?=
 =?us-ascii?Q?ynzZVNRjyObtA1Sc0ktlSDaHj8WCw8ZuyURve9K7C6xxmsq5VdCUjfWNWHJh?=
 =?us-ascii?Q?aVfkJ2anrX8G7CWFO6U0znVavkWQxXDWiYRGNcwpphwPtJdy5ixX4V/rMS56?=
 =?us-ascii?Q?bCCd04bMJ3F4qBDBvcW2wQ9mocjgwc1PCyDi9+JR8CVGPRFRBoEr+tyffFln?=
 =?us-ascii?Q?ZtZy4hHkWZvJwXoisn5VyiumPpL4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SeRFSU1pZx7iBzPwLotciFy78MjzCYR/ttleEx1SQcJkyV3IwLuL8EM/BUjh?=
 =?us-ascii?Q?uKVziCBL5vDCQq6AIjpYdArtz9/WewYAp5pvDlmFTMGnWgwSiwiracMOFCZv?=
 =?us-ascii?Q?gRg57GxiEEmAEDx6ww5VkVfIzsSaTFW4CsxofMM2SR0uhGkaQiwbLbhL7Qvx?=
 =?us-ascii?Q?NMRiCBhVorN8rxNltu0GXnyYFO3npUE79mrMVjJEkw1w1lPhv71t/m4nPh0B?=
 =?us-ascii?Q?BrcWBjaBXbBsMe5gajRgGB3bfOaOUXwkbk95shE2KumnqmmdTbj3BNWUKJOD?=
 =?us-ascii?Q?JbH8/svj5uT419TWZNHu/uVWYF/73Nh8JJgMsxmZ0W11NlZAuGhG+HDdqi8Y?=
 =?us-ascii?Q?pvsrEoalWIG/cVP4nw/a/okjy1jDcB5o4VDhGARTepE4OmQL6zbSLcOmHeAK?=
 =?us-ascii?Q?L0Nm5m5sToJY57ebSz9amamphvtmnCAOn6p0UdhkuAdwgOuQe9zQ5ASSzgpG?=
 =?us-ascii?Q?73kEHh7OygYLH4+DoeeYEyJGhBsdMd18GgbFl6hygk/ncPSqtTqVdj5rDHm0?=
 =?us-ascii?Q?eRFf1ruiStICacp44r65EQWh80mP9dvKbDo5MOJyJDA+3EE9bKl89x2PArab?=
 =?us-ascii?Q?kiCsKegXF4PXsRXE5cO8Mpfa+aL95mur2zRiZ/Qcml8yW3OzjPxv89ZUrGoE?=
 =?us-ascii?Q?XIYb9CTGL2nAwkjcJTfT1sUo5D081wZOPr/5UAU3ErMQtHgPWzi9gbfKmrJf?=
 =?us-ascii?Q?Ekdv28YoaxSPAPe7wmefcc50y80RBccL+e2nsJORlWwnRDS+SJT3K0ZWTSAr?=
 =?us-ascii?Q?x4iA2llCEArjd4MNuDBQ7WMNBRt/LvXefLAIcGupn9dXGnM+k5D+im+pwyDn?=
 =?us-ascii?Q?3qQXIFOT4Hf8hFk/SnVtfSfjjycoj9EjQw0/IKwmKjka3/3m9jk4bg13fe/m?=
 =?us-ascii?Q?k0vPNyQgFTBcBuqDV52TTgqs8KiacmSqgQ9r5VnSp710IuVuz8pKc79blcVW?=
 =?us-ascii?Q?h3wCqF3AsvFNjrkIeilsdfppvx3U222d+fnSFLlEO6a+JNxRW2qRxywEVv4f?=
 =?us-ascii?Q?T0Vo1j2NfMubhys26td64I6+xA+mlc0AZ17r2YNqK3/gNxtj8HPHnKGqkEoa?=
 =?us-ascii?Q?NjjO5z/v/Hs2298o9fIsr3WQwZWSBOmxLpo9ONSGgKqtDGC/JKbFXpUZao3o?=
 =?us-ascii?Q?VMDFCMhznrm78LPdFDG+PO1UfpBMv3gtbMvhgrzovcRgSd+8ogFd4CegqlUX?=
 =?us-ascii?Q?s1CnPSezOiz1HWO575yRlo6G+6EUfCu6qStm7f7G4DHgZ20FMgCBtfvpe+Kx?=
 =?us-ascii?Q?GTkTJgIazWtznb6QIYpIGmv7RvebE1/Hj9iimsKE1r0deHKjG52KQSc3jDzH?=
 =?us-ascii?Q?YEPkMIEPWlSCwweR27gy3MjdKG772lRr+pfrVMGafcQh5Cst39uKKHlVLulc?=
 =?us-ascii?Q?LG11aZqNwWvpHPbcIoIbj9TIGElovsH+0kp2lotZJb+2LILfsyj2rJY2t3ik?=
 =?us-ascii?Q?84h9r4P2u0mY1N5SIhmLJgZIvv6WOn21KF+cn/R63XOD6tPGN+/Bc5R1rMZ/?=
 =?us-ascii?Q?JjqIKwA2HNyk7JOpTxUf68gLxfmTJJ5V/cACYc9rKVdeI1RFEbJiL5TDlEWA?=
 =?us-ascii?Q?fV1pwZkees31H64dN1RistHWStd6X79mmyruwx7jX3yD+4mKP8YXy7BMkGym?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b43e5d7-05f6-4b77-c56c-08dd52715749
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 12:14:50.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8JAiK1/1rJTXK6M5Nh2LiCkZ08GxLQ3gG5WWvp3C23m0sz51wNeYR4Wpg6XcudyCNmWwbfssSshvgSzZU0YC901C4qot+sbiks2B7pouaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
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

On Mon, Feb 10, 2025 at 04:28:09PM +0000, Matthew Auld wrote:
> On 06/02/2025 13:45, Francois Dugast wrote:
> > Add new entries in stats for vma page faults. If CONFIG_DEBUG_FS is
> > enabled, the count and number of bytes can be viewed per GT in the
> > stat debugfs file. This helps when testing, to confirm page faults
> > have been triggered as expected. It also helps when looking at the
> > performance impact of page faults. Data is simply collected when
> > entering the page fault handler so there is no indication whether
> > it completed successfully, with or without retries, etc.
> > 
> > Example output:
> > 
> >      cat /sys/kernel/debug/dri/0/gt0/stats
> >      tlb_inval_count: 129
> >      vma_pagefault_count: 12
> >      vma_pagefault_bytes: 98304
> > 
> > v2: Rebase
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c   | 10 +++++++---
> >   drivers/gpu/drm/xe/xe_gt_stats.c       |  2 ++
> >   drivers/gpu/drm/xe/xe_gt_stats_types.h |  2 ++
> >   3 files changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index cb92fb5cbc75..46701ca11ce0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -14,6 +14,7 @@
> >   #include "abi/guc_actions_abi.h"
> >   #include "xe_bo.h"
> >   #include "xe_gt.h"
> > +#include "xe_gt_stats.h"
> >   #include "xe_gt_tlb_invalidation.h"
> >   #include "xe_guc.h"
> >   #include "xe_guc_ct.h"
> > @@ -124,16 +125,20 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> >   	return 0;
> >   }
> > -static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
> > +static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
> >   				struct xe_vma *vma)
> >   {
> >   	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> >   	struct drm_exec exec;
> >   	struct dma_fence *fence;
> >   	ktime_t end = 0;
> >   	int err;
> >   	bool atomic;
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> > +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
> 
> Since this can be quite a large number, and a normal workload could easily
> be many GB over some number of vma, maybe we will find that we hit the
> atomic int limit quite easily (only ~2G bytes)?
> 
> Should we switch the unit over to MB/KB and also start using 64b atomic if
> we want to count stuff like this? What do you think?

Yes makes sense, let me send a follow-up.

Francois

> 
> > +
> >   	trace_xe_vma_pagefault(vma);
> >   	atomic = access_is_atomic(pf->access_type);
> > @@ -202,7 +207,6 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
> >   static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   {
> >   	struct xe_device *xe = gt_to_xe(gt);
> > -	struct xe_tile *tile = gt_to_tile(gt);
> >   	struct xe_vm *vm;
> >   	struct xe_vma *vma = NULL;
> >   	int err;
> > @@ -231,7 +235,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> >   		goto unlock_vm;
> >   	}
> > -	err = handle_vma_pagefault(tile, pf, vma);
> > +	err = handle_vma_pagefault(gt, pf, vma);
> >   unlock_vm:
> >   	if (!err)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> > index 7a6c1d808e41..2e9879ea4674 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> > @@ -28,6 +28,8 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> >   static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> >   	"tlb_inval_count",
> > +	"vma_pagefault_count",
> > +	"vma_pagefault_bytes",
> >   };
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > index 2fc055e39f27..b072bd80c4b9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> > @@ -8,6 +8,8 @@
> >   enum xe_gt_stats_id {
> >   	XE_GT_STATS_ID_TLB_INVAL,
> > +	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
> > +	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
> >   	/* must be the last entry */
> >   	__XE_GT_STATS_NUM_IDS,
> >   };
> 
