Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F245C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 03:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F89F10E012;
	Thu,  6 Apr 2023 03:44:46 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFF010E012
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 03:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680752683; x=1712288683;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oG2Tiu2cjkdPUYDThC73G70GUkMJ6/FeG7HoLb/jebI=;
 b=fqLVJnao9qvW7eBShQ6IqUsRjyP7hz1sKXVOnc7H/BUH5mKZ321k23wj
 wu68yhazuIcLWcuF9CwIuAdO8k1kcyfeZXUs7t93IWaQavF4jANpUkmo9
 U1TtrIjP+b9apzOr9LQBKjhrVo8wUBwx2eEf4+DRKw6xTxq72jg7c5JG+
 f/+WgS5+V/eAPOqEAYrjaXGoe1deZKs2ZOp8tnhI0QTHTr/PwY1VEZuEv
 oqPmillgRHbS14AQwnr/zQnFBW0tLjYECTgm2pkStDuHGIZMEIyfNRdgR
 6p2/Z03KDiyyrR1I9xkIrxPKwl76nUeolfPCdXcmQFDlbhikZN2wq4tYw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370465916"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="370465916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 20:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="776300894"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="776300894"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2023 20:44:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 20:44:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 20:44:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 20:44:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 20:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDWSXpeHF8X8jMYVTjpHVLboRyJ+vWLn03zzhmfjwhDASs1SgTsAKANfXoudqi/9F9a+kwWqK+Skk/ErG1n5cq65snyUBV6Jj2/hb87PLJJOp+7ZHtR0qNAK/Sy66Hrpg7CkRuzOafIYVHbDQgft6ka3qxHwwi+Hm4LmC0IWWdwV62lHCl0mTubsQI87pf1eD3+BaSfoqFKSUTsC0kgYh67gbIeIaOP/ycxHYMZ/zh3L2FU31Rr7q5vDmEJKxNnu8mQ9i/EKY/o1TnCGijZHlIE0RXCasPpS9M91n9hucpKe0ayyTvurTy36wdhLMMDzOqHAxugLlZqwEUpjJV1AZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHgTi8+QLE27+C8Ie4PkMo0Z1QKSujMdZDWkhuXcB9k=;
 b=gulxrAukMnpI7FXBkm5sO7XldwZF1GdHopFqllHTYqIIjCHOuW7oyuevMLHdNReQ2yzptdCs/8edTQm17orU5m5B2h+BBafClBPHad7RPcjhV7JFyklhZI9R6DFn++bJZrwR1FfKe6DKL0zGAjkNN3Qi4SWm3egfqaUZ7HVmLkCcxiHVa9Mfxg00PGF4b4Pevy3xp/FSpNX3EpdP3OKO0JUWNHT4eS3R9LfF+N/J51+eImH2Yo3vT/eSAo8wIARq4J3bgqjKeEf+pyft7obq8xNg4u6gEXX1pbJSZJw92wl++aTxNRkVLgAHE4PTRrKb4iCzT+6KkHndiF2gPR3zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 03:44:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 03:44:38 +0000
Date: Thu, 6 Apr 2023 03:44:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <ZC5AIY7zIQdm2z3v@DUT025-TGLU.fm.intel.com>
References: <20230405233403.151088-1-matthew.brost@intel.com>
 <20230405233403.151088-3-matthew.brost@intel.com>
 <ZC4/rAOBkwv6z2Ed@nvishwa1-DESK>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZC4/rAOBkwv6z2Ed@nvishwa1-DESK>
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5918d5-cad1-4e85-c4ed-08db36513f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Ku22sXjYajuIfvFZjGdojM3hrtV32EvYzLG4VNIi3zpsPKHYy9hO/5J2aD+LAU/p6iwwWCzBAYlyLhPsGxn/tDFhKj6ocrJioxv5T2k8MsTl8y9H5nJd2slwRj/90XoR7iwsfSqy9wdBFvGeeUFwHY9/6sxSPFvaPmUsmg4BUVUr88VavsNVwsP8OkGlGlW2JUEmlWonXchKt+b54eBL50J6I9eEx6dGdzE2LxpgSI1O9ZBkeBYI/kmpQKYCIN1epJO9Xxf4QQiGGOu/isfrUMlb+zkehKKwYa2+FG1zItM4H3rKu4lJdFQC0Y1T7z2AhrScqZCuWDH6saF8OB7vOH0x9DITpQzUhC7dQ+dKwMc+ouz8VNWyw/pKCgydG82ZnqcMjxTaGxdeu/ZlXwe8+osfuc7/on57iaAD9CXeEWH+uPEqeea9sXIP0jfz/d/TF+R7gRP0EUr4Gg8flQa82n2nCz7D0hIPkMgqm57wrcFZ3I+rZrEiYMmeSmY/XN3oPeKHelbAyYfQy7jtoT80ff/JwTfA8oKN35Jir76u3GBVR/UtcjQcdW1vuIn5Xbo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(2906002)(6666004)(83380400001)(6486002)(6512007)(186003)(478600001)(316002)(6636002)(26005)(6506007)(5660300002)(44832011)(38100700002)(4326008)(41300700001)(66476007)(66556008)(8936002)(86362001)(82960400001)(6862004)(8676002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsZqulTjcjtrLswouKevztZiQGIsLsVn9ykG/s/SRsBj0YqzoyrnhuwbJo8T?=
 =?us-ascii?Q?t5ThDHs/TqiKmYcjZBXV5GAejiQYze98Ew3fzMVxwhFOlZrElCbc80seJPp1?=
 =?us-ascii?Q?XP6deLocTDZ3CX6kTHY5VG4A877DUpfKq2pW/FJTso/9yN18sfdIgGJUcYl8?=
 =?us-ascii?Q?hNjDfnbkp7mRgExGohZdQceSGeWV4aZcyvhMKn3QAZlJvEKnFVGXuaJC1x/n?=
 =?us-ascii?Q?EePHtOlpGTvbXTvMmXDEzh4XhElGMMKvLYyIXbRyECKX7D0DMGvlYMMgW8/U?=
 =?us-ascii?Q?Ekfauj6T4nPwFO337IZ2ySbnVlsrsd9l5Aj7Whjyep7nXmSLAPOXM6FcdeYD?=
 =?us-ascii?Q?LSXepf/JwG61LKSfzpYnXeQ1QUguPSbf1ww4dw5g1zLrc5UWFJzbP/qfAh9S?=
 =?us-ascii?Q?tPfvQJmfVzflEcq1v/KU8PrcTuUDU26mTn5rhc6b7e33qFDSyH6Xtj1/6azF?=
 =?us-ascii?Q?7ou+ELh/BAGpdhPDhqVdS3k6LrjuiIU3gBuL7k/tMGvnqNakGSAFaBhmbNnh?=
 =?us-ascii?Q?6Zim86c7AqKSuqUKE0/57t2EK0RZTaDdtVOBYRk9goq+Q6p9tf9GTVvtRfhV?=
 =?us-ascii?Q?vPf/CtxXVr28SOvk3W0ka0xWMPH41f/BjqhbhlpgGbnGIocZxx6CvoCG14Zg?=
 =?us-ascii?Q?SqdngwDEZMYfqE414UZeaw581uTYIxNeeEWyc3J9Y12nI86P2t63wsi8U5Li?=
 =?us-ascii?Q?ihRnxzEJg4hpQ5YSHlGU0erHZNj9p7e9oeeNqSZSrUMoluFnDPA6mLHOJItB?=
 =?us-ascii?Q?ZJd3TJEJQwG3MNehTfU7SwTThJakZl0n4AetX8reAAcnz3hATykLVbAB6coG?=
 =?us-ascii?Q?gAo6LLZdFSNlj7lgeADM23js3YptQ3ReYlKQKymFx2ZmHVTr9J8AhnG6JF3D?=
 =?us-ascii?Q?bePNblZHc+9Gd/HfBDXCjcQVhAFtuxnfN5CzUFDpbYJR5sCUkWlGSSWNS2L/?=
 =?us-ascii?Q?gyZ3JY566qApIv72TanEYsYY4yMveojlqtmhGgsYZ++2AU/x9BkHYyfLv7W7?=
 =?us-ascii?Q?hIdRCkVipr3Z7EODLwuBbVK/I1s63/WwR4cIDrSm/cenA8Kq2mebAZuBcjaW?=
 =?us-ascii?Q?awGVoHJzHkyFq3vwufm/Vvx7g9DBHg+G9/R9f6xTsrL1E11LJ0tJVs4NgSWD?=
 =?us-ascii?Q?KAC9B5c9/MQM/s+rbv1Er2aUTikZKlQ/PZ43p5/8sXFCtAEuvtSS3KGNAEhs?=
 =?us-ascii?Q?YLwg5GSlmcfkCswZJXXRzXnTApF+VgRQNTYjDD5LOtTLNzHSOefjawoOfGvP?=
 =?us-ascii?Q?6Px68lD6Tbh05NuYTRKNXh2YJRAKdcfLUjHRMBfcfbPA1pGTLZ6KTwWpQGxc?=
 =?us-ascii?Q?KzRh6qhNLBiiKBlMvC0QkrhLwvKETmSo/u1bFmpTCnd2M39fHP72h/ddX8j4?=
 =?us-ascii?Q?wiuLDhiqH+HJ1CvUwj1XxcxAkKiE9xNIc4sQiB6hJ845pOSExOLDD1h3wQ6r?=
 =?us-ascii?Q?T8cCrUfwULzy8aHkw1wByVbOGlFBKsk4w6ydB6x2TofGmt6WhNyeLO5ooHq7?=
 =?us-ascii?Q?gvbY3R9A/l/ddzMOeToq83Y2QTqS9Xf0tdMaWYfQEvJ/g4eU/xEtNEiymyJr?=
 =?us-ascii?Q?TKwYa2HAJwQ+DBJ1Z4gsmybssj4+3JoVkvqp2dR+D3NiOukJD4HOsZAG0vXn?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5918d5-cad1-4e85-c4ed-08db36513f24
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 03:44:38.4150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTJL1kLUN7FOovdk3wOh1qr2xnImM8LyDh9mI6aj/b0nVNaGykMUD1kabmsR4bek3Cbc/z61WyuHtZgiF711rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop coalescing of GGTT
 invalidations
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

On Wed, Apr 05, 2023 at 08:42:36PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Apr 05, 2023 at 04:34:03PM -0700, Matthew Brost wrote:
> > Causing a bunch of hangs driver load and in user space. Benefit is
> > rather small too, so just drop this for to stablize the stack.
> > 
> 
> Looks like this should instead be revert of following patches?
> 
> drm/xe: Coalesce GGTT invalidations
> drm/xe: Pad GGTT mapping with an extra page pointing to scratch
> 

git revert conflicts...

Matt

> Niranjana
> 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_bo.c         |  1 -
> > drivers/gpu/drm/xe/xe_bo_types.h   |  2 --
> > drivers/gpu/drm/xe/xe_ggtt.c       | 25 +------------------------
> > drivers/gpu/drm/xe/xe_ggtt_types.h |  2 --
> > 4 files changed, 1 insertion(+), 29 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 5460e6fe3c1f..c7f175a149be 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -975,7 +975,6 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > 			return bo;
> > 	}
> > 
> > -	bo->requested_size = size;
> > 	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
> > 	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
> > 	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index db217500a970..6071611a2b29 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -23,8 +23,6 @@ struct xe_vm;
> > struct xe_bo {
> > 	/** @ttm: TTM base buffer object */
> > 	struct ttm_buffer_object ttm;
> > -	/** @requested_size: Requested size of this buffer object */
> > -	size_t requested_size;
> > 	/** @size: Size of this buffer object after alignment adjusting */
> > 	size_t size;
> > 	/** @flags: flags for this buffer object */
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index a430d1568890..93f78aba2c8e 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -273,15 +273,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> > 		xe_ggtt_set_pte(ggtt, start + offset, pte);
> > 	}
> > 
> > -	if (bo->size == bo->requested_size) {
> > -		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
> > -		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
> > -	}
> > -
> > -	if (ggtt->invalidate) {
> > -		xe_ggtt_invalidate(ggtt->gt);
> > -		ggtt->invalidate = false;
> > -	}
> > +	xe_ggtt_invalidate(ggtt->gt);
> > }
> > 
> > static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > @@ -302,19 +294,6 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> > 	if (err)
> > 		return err;
> > 
> > -	/*
> > -	 * We add an extra page when mapping a BO in the GGTT so we can coalesce
> > -	 * GGTT invalidations. Without this extra page GGTT prefetches can leave
> > -	 * entries in the TLB pointing to an invalidation GGTT entry when in
> > -	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
> > -	 * to 64k already have padding so no need to add an extra page.
> > -	 */
> > -	if (bo->size == bo->requested_size) {
> > -		size += SZ_4K;
> > -		if (end != U64_MAX)
> > -			end += SZ_4K;
> > -	}
> > -
> > 	mutex_lock(&ggtt->lock);
> > 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,
> > 					  alignment, 0, start, end, 0);
> > @@ -344,8 +323,6 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> > 	drm_mm_remove_node(node);
> > 	node->size = 0;
> > 
> > -	ggtt->invalidate = true;
> > -
> > 	mutex_unlock(&ggtt->lock);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > index 8198aa784654..ea70aaef4b31 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> > @@ -26,8 +26,6 @@ struct xe_ggtt {
> > 	u64 __iomem *gsm;
> > 
> > 	struct drm_mm mm;
> > -
> > -	bool invalidate;
> > };
> > 
> > #endif
> > -- 
> > 2.34.1
> > 
