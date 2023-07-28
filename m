Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA47C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 18:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D2A10E76D;
	Fri, 28 Jul 2023 18:29:58 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9210E76D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690568996; x=1722104996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=c0gkFIHg+NxxvuwiOvAqxXT3Fn9qKXJEuZq5fDkGY4c=;
 b=h6brgRI1MEgZOhTKQ9q7q5QaexiofN+OBYfsCdSJqgI1fCpxdIHtMzxI
 +8RGkcc4cJ3MjM4uPpQbLiGwDsQOH2q5kTfZ3ujaPRK6swKESCnQVoq1f
 b2Nno14wSVkCQei2YWFqiaFa32ggh0NDj1YSmdG7jhbt1uIbDoX04++CJ
 cr0ODL1ELp9uz7KaOJogkjUfgCf1yQxmS+nGqKJrLZF3S+5z4Ne6zBr3q
 9HWppDziPVa9Ra4rkh1ZmIjFta68NthiMkDVAepweRQa1/cOUjta81WzB
 SYb09JOMUF5u9vhIXtWZhOiy1EyT70HiDPVQQvB9oGHXhFfM5YHdrqRV8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="358682408"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="358682408"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 11:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="974189180"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="974189180"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2023 11:29:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 11:29:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 11:29:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 11:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8FOXsvHc7kVwshTQkWQ+dPBYn66xox/n+YzEaVGuqlZBA/UyahFg4FMWOb0rBtn3LN002FTLy4RCbXzR/JlroIekptqDYdSViOBEKMF5qqxo4/+F1mJA9C/u1MVQN3chT63aCUl1DCMboA5bm7fW+BPZZw8ZDcmU8Dqk/idkWNdXjIMszK85YlBe/FYabxf1bJTzozOoXCyFZs2+dIhyUwARNf+OujEBiiFVyi94jaKRzYiFXAUrH5Go/KOfan4x2eaLR++TLq6VfkFXQj1QdjvkCIhzfLcsT8SH2HxGON5gFy5pEWFsRWNcwsScsB5riTvwcVHp2vPSa/lsrYK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MptnLP76o3QYVfZguwMbAclfxPseoRvB6AOgOIr5gBE=;
 b=mC/3LHVMKLuzLW2n6sKfMqr0LVoleTaL5L2P1qkeNhSt7yLlLmep0BMj62n5Oac4Ryyabu7oXhU5IaZ8azUTrde2MahbRwRnoxHgnAuE6Mb1zfRRwHWLeq//CX9ytDLMRTMlGhmjxNG1zcQu+8QV6+UxeI4GB/Trc/AMWLFMQQCJkWLW40YvSsaQZy0G1+isL72LsksnZWcjkrYGarAPmTNlOlnPv6EDkxKfT177XlvRAYZcxIMw3TaL/NkRThrLMu8pgRUN+JofvVFYB6I3Y4PmXTH4sbl4FK8p7m/KG3A03UwMgYm1v+XeYqStGj84IprphVXWMZsohKQ75w+Q0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6486.namprd11.prod.outlook.com (2603:10b6:930:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 18:29:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 18:29:48 +0000
Date: Fri, 28 Jul 2023 14:29:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZMQJGFp5V8fOsSOw@intel.com>
References: <20230726124916.2291245-1-ravi.kumar.vodapalli@intel.com>
 <ZMFzhWchFiy9OBKZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMFzhWchFiy9OBKZ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ed248b-c34d-4136-1dbc-08db8f989f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3RoAvwDft9bSMFVmGVmKBwUUXzbbjEPoz/UCuRx1iFNmVy4ubgDiCq8P7QqcvW/QPEZTvYBkEib4K0jMd/aZAZyOcrgST1//utHAeQGecOpw6Y7ImeDl6r2JM8a05Q5vVn0YhGUlZ6GP9emddyHjhNt8oiVNJRmxXGbEWQ6hnH1Uerpy3M8dUKskFlJiw6BQK7Ya7ykGAzgR8/9iVWzC8u1B1Yl9BGNTqB2TN8MldUr5wnt5fKA7OVJ3KtS1dYKdSreDpSquGyx0ytet7i//AiJu5WQXPGcynT99UVhhHUclcyRfmswe5ijKtvYpfTCoKJFJREWd/KrIQEh9X8eREKK4xFtWpefhJ8CP+dT44YTD5QJnxaQHR5qKwoli+ubmoDduSCVpubCAKj/03XD7UBgySXlU1/0EWNsg6fZOQxf/oiFTfd9M1He2PZZheMfbNq5guaHKGJKEuXzCxak506etOWUL2o5pKHQVo4YNCDTKLhk3wIyEVZ7+ZQRXqGmSP6xScLQf6GCoXdyb6MAVPiQCMmhbR6ijC9HRtD30zM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(136003)(396003)(366004)(451199021)(966005)(37006003)(478600001)(6666004)(6486002)(6512007)(83380400001)(86362001)(36756003)(6636002)(2906002)(66476007)(6862004)(66556008)(2616005)(186003)(6506007)(26005)(66946007)(82960400001)(38100700002)(316002)(41300700001)(5660300002)(44832011)(8936002)(8676002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NUBz+8Nl8Ynr5vnCVpMXMLYb9YudakuGu+dCF/M9qfYUWaYKmDE73JBagSOf?=
 =?us-ascii?Q?7xQNv3mkzeNSwpE06+FG4xZg6wZH2K9/qQozQ0bxC7va95qD8jJxToqoBhp3?=
 =?us-ascii?Q?bH294zy6bRP5XZ+b+bPQj+KGqA+dtXEl5qlSmhFobyHzN9GqwxHDYUL8u1DE?=
 =?us-ascii?Q?HejXkh6Ex1K5RUs40lr3W67pjI/TY7fcg+FA8tBgqW2b1W2fbLjhS/6HhX0x?=
 =?us-ascii?Q?CmJs0uS2J/yUuS8CRhQGhULoEfJx1XJpzsVyRI9aZfqjetFtR8iXLHH8EJme?=
 =?us-ascii?Q?kST5bE9mXM7V2FYd2yfrXLeQ5/UdX/dVKrAoR2cfcQS3cWbkPkGscOenNB8B?=
 =?us-ascii?Q?FaFqpu2AMZBnzkJxwsj6cG6DlSD7XnrQVe46/bJfBIsvz8Hd7MUuqALgpV9d?=
 =?us-ascii?Q?w27s2BCYFKQvn3TZZb5q7IK1p8WrshT/FYST3H9UiAxlyeIJRnsxrtX5qjJ1?=
 =?us-ascii?Q?EhyvfiqGq/WIdUSpMnMYL3t+kjN3+FEKTHw7yfVd7lI8A2bhVCwi+gSdIaXT?=
 =?us-ascii?Q?WlqNRFu9BAtSv4JuDs4Fc931E+ZOqnmEU6f3xbpvkZPaIcdE0FCHilEvOqsl?=
 =?us-ascii?Q?+cg2VQEgdGYGqRBd561tJkGgt1CpKk6ps3cn1Bgr2/LGRhm6P4MDQLxbXq0l?=
 =?us-ascii?Q?FDWn57wr39mQ5uuJ5i0T3a6vYiA75sS5tpmvxtlxxqZ/2HVjrwEfu0qZ6J87?=
 =?us-ascii?Q?RVOFNWaITZldqYcTDKxA58TsVp9BnfOtEWtHNAkl2uuteDSs4GUlcalFF3mJ?=
 =?us-ascii?Q?ltgeP+oOooud9qBSSxXnIwSccLRD1O4EAw/Vbk6ZELY2JEyUgkkjZRa+vl/2?=
 =?us-ascii?Q?K6F/+/YQF1rH6jZaGcQxdxN/toCN1awT7a0CDD1QQhkdWmYGbyUh2yDWdlo5?=
 =?us-ascii?Q?o2A+jzgmYTVEWnO3fwqD01SrjHn2ux7hzv/698rCTIeOZBT81TEnau5eGU4j?=
 =?us-ascii?Q?sbz5k6vIM3BNHM5M/RYmvjcqxMA5+T1U7/Jnh3rW5wv4+nGdtKXMp5u6Dq35?=
 =?us-ascii?Q?9uv+me+LH1XDBK++3do9g+l5vz3BDr+AloRcqDoGSwDs4N3PpjAD/ZLhdcRL?=
 =?us-ascii?Q?QzJdOExd5NhkWoWawjTFdlaZUTcsE6CCIsPrAo9eggexgEdOzh093SDhes9q?=
 =?us-ascii?Q?raxgjvnHILFtRpFDeugzS24RsN8eO/JA7rJczOvX7J7MnOeKIUUhMEVvDmb6?=
 =?us-ascii?Q?TJZaox70K7iybkcuzB61RBb2wn1d26YrScVBE/UdCMPqnbRx8A9TVO2toxrK?=
 =?us-ascii?Q?h9PoT8Cc35DpVhq3BnfMQS4DMemUzH/A/E3SKsZZDwkbjDG2YakgNJfurVAe?=
 =?us-ascii?Q?ibF++N9WY8kFHYbBEStSiaGZZyn49Gh21zMYF4XBoJ8S8uKhVqZ3zT7Vjr2T?=
 =?us-ascii?Q?uGhug2pqIVnP4vWuFT+38clUqN8mTkIW5COZ5GbarxW+HRSQwKvldkUgAlXD?=
 =?us-ascii?Q?bWS6efdber6uaOsn5AVIncFP3dZEqmT7XQ104kW2MlwREQvDmmG4Q2Lq4qg2?=
 =?us-ascii?Q?9bIDY8Cfg4IAC7Tf8uujmDVVQCJqqvzFB531+s4g799rCkMGeEZNVws815Iw?=
 =?us-ascii?Q?z4J9zM84Ln4fcoY+Yx+yNQFXG8z3hyJmrSO+v5xjBkRsxu07LKQOIKsQAoFV?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ed248b-c34d-4136-1dbc-08db8f989f9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 18:29:48.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jP+JrrZXmOCGTlS7D2/rlKz3qIS6xfnzBXd/GItPm3WMdt/6NlOiP8EFG7IGtkiC4XT1r6qEVWGH+ujVVfkfoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in PTE and PDE
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

On Wed, Jul 26, 2023 at 07:27:01PM +0000, Matthew Brost wrote:
> On Wed, Jul 26, 2023 at 06:19:16PM +0530, Ravi Kumar Vodapalli wrote:
> > Different platforms has different PAT encoding in PTE and PDE format, add
> > correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
> > 
> > Bspec: 45101, 71582
> > Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c       | 119 ++++++++++++++++++++++++++-----
> >  drivers/gpu/drm/xe/xe_pt.h       |   2 +
> >  drivers/gpu/drm/xe/xe_vm_types.h |   2 +
> >  3 files changed, 106 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index d4660520ac2c..09dafb0e47ea 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -16,6 +16,7 @@
> >  #include "xe_trace.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > +#include "xe_pt.h"
> >  
> >  struct xe_pt_dir {
> >  	struct xe_pt pt;
> > @@ -62,6 +63,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  {
> >  	u64 pde;
> >  	bool is_vram;
> > +	u8 pat_index = 0;
> > +	struct xe_vm *vm = bo->vm;
> >  
> >  	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
> >  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > @@ -70,10 +73,9 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  
> >  	/* FIXME: I don't think the PPAT handling is correct for MTL */
> 
> Stale comment, this should be correct after this series.
> 
> >  
> > -	if (level != XE_CACHE_NONE)
> > -		pde |= PPAT_CACHED_PDE;
> > -	else
> > -		pde |= PPAT_UNCACHED;
> > +
> > +	pat_index = xe_pat_get_index(xe_bo_device(bo), level);
> > +	pde = vm->ppgtt_pde_encode(pde, pat_index);
> >  
> >  	return pde;
> >  }
> > @@ -103,6 +105,9 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> >  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> >  			struct xe_vma *vma, u32 pt_level)
> >  {
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	u8 pat_index = 0;
> > +
> >  	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> >  
> >  	if (unlikely(vma && xe_vma_read_only(vma)))
> > @@ -111,19 +116,8 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> >  	if (unlikely(vma && xe_vma_is_null(vma)))
> >  		pte |= XE_PTE_NULL;
> >  
> > -	/* FIXME: I don't think the PPAT handling is correct for MTL */
> > -
> > -	switch (cache) {
> > -	case XE_CACHE_NONE:
> > -		pte |= PPAT_UNCACHED;
> > -		break;
> > -	case XE_CACHE_WT:
> > -		pte |= PPAT_DISPLAY_ELLC;
> > -		break;
> > -	default:
> > -		pte |= PPAT_CACHED;
> > -		break;
> > -	}
> > +	pat_index = xe_pat_get_index(vm->xe, cache);
> > +	pte = vm->ppgtt_pte_encode(pte, pat_index);
> >  
> >  	if (pt_level == 1)
> >  		pte |= XE_PDE_PS_2M;
> > @@ -187,6 +181,91 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> >  	}
> >  }
> >  
> > +static u64 __xelp_ppgtt_pde_encode_pat(u64 pte_pat, u8 pat_index)
> > +{
> > +
> > +	pte_pat &= ~(BIT(12) | BIT(4) | BIT(3));
> 
> Defines rather than just doing BITs.

besides that, this combination is the pde_pat, not the pte.

which btw, I was trying to clarify some of the old confusions with
this patch: https://patchwork.freedesktop.org/series/121478/

whatever we do there we need to clarify the pat_index construction
and get rid of the encode |= 0 (PPAT_CACHED_PDE)

Feel free to get parts of my patch and use on this patch of yours here.

Thanks,
Rodrigo.

> 
> > +
> > +	if (pat_index & BIT(0))
> > +		pte_pat |= BIT(3);
> > +
> > +	if (pat_index & BIT(1))
> > +		pte_pat |= BIT(4);
> > +
> > +	if (pat_index & BIT(2))
> > +		pte_pat |= BIT(12);
> > +
> > +	return pte_pat;
> > +}
> > +
> > +static u64 __xelp_ppgtt_pte_encode_pat(u64 pte_pat, u8 pat_index)
> > +{
> > +
> > +	pte_pat &= ~(BIT(7) | BIT(4) | BIT(3));
> > +
> > +	if (pat_index & BIT(0))
> > +		pte_pat |= BIT(3);
> > +
> > +	if (pat_index & BIT(1))
> > +		pte_pat |= BIT(4);
> > +
> > +	if (pat_index & BIT(2))
> > +		pte_pat |= BIT(7);
> > +
> > +	return pte_pat;
> > +}
> > +
> > +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
> 
> This doesn't need to be export, i.e. make this static.
> 
> Also in general this is a really goofy use of vfuncs vs. if else. The
> vfuncs are only set to 1 function and this function has 3 branches. Very
> confusing.
> 
> It would make more sense to have a vfunc for getting the pat index with
> different implementations based on graphics version. Then non-vfuncs to
> the pat in the PTE and PDE.
> 
> > +{
> > +	u8 pat_index;
> > +
> > +	if (GRAPHICS_VERx100(xe) >= 1270) {
> > +		switch (cache) {
> > +		case XE_CACHE_NONE:
> > +			pat_index = 2;
> > +		break;
> > +		case XE_CACHE_WT:
> > +			pat_index = 1;
> > +		break;
> > +		case XE_CACHE_WB:
> > +		default:
> > +			pat_index = 0;
> > +		break;
> > +		}
> > +	}
> > +	else if (GRAPHICS_VERx100(xe) >= 1260) {
> > +		switch (cache) {
> > +		case XE_CACHE_NONE:
> > +			pat_index = 0;
> > +		break;
> > +		case XE_CACHE_WT:
> > +			pat_index = 2;
> > +		break;
> > +		case XE_CACHE_WB:
> > +		default:
> > +			pat_index = 3;
> > +		break;
> > +		}
> > +	}
> > +	else
> > +	{
> > +		switch (cache) {
> > +		case XE_CACHE_NONE:
> > +			pat_index = 3;
> > +		break;
> > +		case XE_CACHE_WT:
> > +			pat_index = 2;
> > +		break;
> > +		case XE_CACHE_WB:
> > +		default:
> > +			pat_index = 0;
> > +		break;
> > +		}
> > +	}
> > +
> > +	return pat_index;
> > +}
> > +
> >  /**
> >   * xe_pt_create() - Create a page-table.
> >   * @vm: The vm to create for.
> > @@ -216,6 +295,12 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> >  	if (!pt)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > +	/* __xelp_pte_encode applies to xelp, xehpc and xelpg platform*/
> > +	vm->ppgtt_pte_encode = __xelp_ppgtt_pte_encode_pat;
> > +
> > +	/* __xelp_pde_encode applies to xelp, xehpc and xelpg platform*/
> > +	vm->ppgtt_pde_encode = __xelp_ppgtt_pde_encode_pat;
> > +
> >  	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
> >  				  ttm_bo_type_kernel,
> >  				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index aaf4b7b851e2..0ed69abf8202 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -51,4 +51,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> >  		  u64 offset, enum xe_cache_level cache,
> >  		  u32 pt_level);
> > +
> > +u8 xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 261a4b0e8570..fc976e207462 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -336,6 +336,8 @@ struct xe_vm {
> >  
> >  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
> >  	bool batch_invalidate_tlb;
> > +	u64 (*ppgtt_pte_encode)(u64 pte_pat, u8 pat_index);
> > +	u64 (*ppgtt_pde_encode)(u64 pte_pat, u8 pat_index);
> 
> Kernel doc and for vfuncs make this a const struct of ops.
> 
> An example of what I'm refering to is 'struct xe_engine_ops'.
> 
> Matt
> 
> >  };
> >  
> >  /** struct xe_vma_op_map - VMA map operation */
> > -- 
> > 2.25.1
> > 
