Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA064C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 16:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7109F10E045;
	Thu, 23 Mar 2023 16:14:54 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E610E480
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 16:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679588091; x=1711124091;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w8HvA5MI1BDd0kRp8ulUaenJqsVhfUhCTr1WY7xuvmU=;
 b=oIakdEh4WoTPqivhZjWQ9C9V3WLp6k+A2zK6AJaA4BwGL9lhdVQf91xQ
 wv3c+h8hYa+YDfD3h/jo+9VlUwok2xtbQFRm/wVjED2v0k97LkFWFplqj
 FxdeRQB0xlv2Vhg7iqgnoFE+YAob1WRkXOBknwo1mI1uH7UnJSmtcoaEh
 YAuqt3mo83FwzQPXw08XR9Mikh4I8eQlZNpVbF1byMr0ObWP2bx+dCVtz
 rJ9Y1RgOpwgMlbx5PK9SgR8vqYJzvZEmNIzu7Y+2ituau0Xu95sGpZly5
 l6uOCmBRnk0Ym+hrSdiVLixHPXjLDUa4Jq54LNQHfG6BqV4NNKfCO95Gk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402120332"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="402120332"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="1011871973"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="1011871973"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2023 09:14:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 09:14:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 09:14:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 09:14:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx+wvJfWEJ9omn9W+2y8G+upobnm3sE6oFgEgN9Kx387mAuYy+IPjCba1ilxHBiu0W50NAaDTmoHNBYAejaxm+4Ei1tPzTi4B3vUhK3ebS8VGHSVnofLmQP2LNPotL6Nmq/+dh9+FYIfPYK3oOUl6OlPhaCzOWPxfvEc7i4UM/kExwxn6VFu+0J09/TkqQo3p2j9BuOrQHK7F9sxvUSAdb7+LBpjegZxhC+SIwmoKziB17TIWKP3f1z/DQQt84rdHGHYdHXa8vPtjEzxf3NakN8O/MZvlERzcU9Q2h2N3QHXfOlV68g6q9L2JB9jhgPLOMSrrpvEP09Rl19kxpC6tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii8HVFqNLv7uc4uZyuribAgFTTtbk/dJrIJCb3u7AK8=;
 b=Rx1FgN5OEFIg9dUyv4k9HwnzcyVR/DfaFh/y+7qSBILkALjz42BY97MJFICu9hpSZOjUfZksxzOxX54DPJ1lU0/S8WYuHF5YUwiiqUIuB9BsevFpuiwubTSyVGhr73s9Bn5MvzFUmTjp3KnR67Kx7+Fl5Te70VO8dBMRSQVTWUoWC4GJs34EV+v1mBkei18q+XpQMsRIJ2XpJ4idBAQgnkjo6Xh7qMp4mHUuz5DcdeSnMQ3kBOb5s/lo5FtjF8uQJrOJc7vcyj5zTI84Eu1kHZHm5UYwqtVri99WDygzWqBkpPMB2f9oZDLPYo19ynlubRPy5LQBRbYTAzVqUWYbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 16:14:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 16:14:13 +0000
Date: Thu, 23 Mar 2023 16:13:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZBx6qIqgr8vFNHo0@DUT025-TGLU.fm.intel.com>
References: <20230323081546.1014414-1-matthew.brost@intel.com>
 <7263840f-3315-af68-c5bb-db8074bfb41b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7263840f-3315-af68-c5bb-db8074bfb41b@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: e8065510-33ba-40cc-5629-08db2bb9a430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JGUDWEb5QTG5Pc5BUAf/Ak69j4Uck6Pk8Mnq4eF0yFLuG7iYU072hnXsCkLMaQyqgAI0OFmdULB+v+ae+teaQ76yeWnGepeRk62ODccTXy83keMoZMmD978kMcWLkWtWQ+p7LX+goUjtnR5J+wYMiDpm7hHDumnFjLYGRp/8K+JU31mtZAHqZEx8T8i274yznIQrQvTzw3DRkMjRovuI6Nf0l/aIh+MFILrlrupx8yqZGhGl+fnVaJan70QDldMgmZKThX4g8p5ivffrN3rW0G0OmHfhE+NnrjA61MnVOMmzfGUMpwU+yq9to37VSik4WJm0WV698+60gwqHBXTUHnqjvCOe3aToC13ZlFzhOavfl91asu/htKinIIFjSIGe0bvQ1m/5eeYL+RHMSPKv8vCFB3/ycb0AY44PlbwY+CR+Rvba07/ajKrgALuVvxoJjo2V3O+6zO8R7iynoS4Gc0PxCFXSTyaA9sStqK/QFYpvrsBd65TxeWYBTo9Isc4esa+GEyTe775A0YCyqGcrny/qsn+6kP0SH4ckE/2wtkkE9gna6T5SxdHgKZZEknRNLbwp0LMU9QTMsrDIkOUduH0H+XMZW18w14iEclRyTbzXA0Vy8Zrg1s3BL8SruP3juog0tsGqZE6TqXGCA7ltiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199018)(38100700002)(2906002)(478600001)(6486002)(83380400001)(186003)(86362001)(316002)(66946007)(6916009)(66476007)(8676002)(66556008)(4326008)(8936002)(66574015)(6666004)(6512007)(6506007)(26005)(53546011)(5660300002)(44832011)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0oz0j1vDi9Ta2/vCvec5FqXJ7VDEidVeljuZoCpkaYrSGLc/dQi34uYKKe?=
 =?iso-8859-1?Q?3Vcbjy/M3a9sl7LsIDM03pKR0I1KCIwdPXzmtRdJJeVPnw0frpd27yg7mn?=
 =?iso-8859-1?Q?ZvmltRZiu3GjeP+pR13oqWC+cj6OIbIT82qxnAtoCZSMS8/HKvTC8iDV8W?=
 =?iso-8859-1?Q?W269NY6cm6w2VzATZDw7GOJ2r1ah3NA5SjDOxxuWyw79Mi8bT7zf1yD6cc?=
 =?iso-8859-1?Q?OO/TTJnhInYnz22MQflPteJa3AdltDGwRDHO3+j13nzUlIl41KBYvYFyIF?=
 =?iso-8859-1?Q?CHBxLUDbzZQShhNEJenGsnP1qpgQaHEKmJW92Q60UpssLwkcU1Mzn7Tsby?=
 =?iso-8859-1?Q?+q0rkx7kDLhGPaWijxp9EYxTRdESb2JtFqY41wfB6SpEkV6h4BmsZ7g55D?=
 =?iso-8859-1?Q?H3q9fcaaC5flWMDOu1SG3uJADoXbrGL6HTD7VF11RLnbhVp/xHRs5/EBO1?=
 =?iso-8859-1?Q?MrZXJkxfRHkZWTUg5zc1awtJPsbKij/OxXM7hNoGPx2F+2rrVZwS2QJUdP?=
 =?iso-8859-1?Q?C93I7P03q8RCnAU0oo1hPnuhfxvDyz7gQgP8aC0t9ANUy4TNhqP8NCuycS?=
 =?iso-8859-1?Q?bzc0Lngez32fYvT6yXU57jj69+T9DeYo93rhHqkXtE4TJ/U7wG0/V1Twml?=
 =?iso-8859-1?Q?G2wN6qV2S6BFEV46LyLOZDGoXpYKph3d8yEixEIds7g2hiq0B11DSQUQdA?=
 =?iso-8859-1?Q?KNTiTntMRIch+tVo3J0ne4dImUgRqbeCbCNMU47dTOyoXTqKDe1/VwQ77S?=
 =?iso-8859-1?Q?0LAYXuQlprT26KtXnHvhNJ7r1xe/Z23JdjniOaKfG2xIquB+HQRE3Ir66L?=
 =?iso-8859-1?Q?1nRvzsG5oSoDWl9oQ8+GtWCUQzaKtP/CGTuVsva8UCEvwWGDYmZ4uuOR+5?=
 =?iso-8859-1?Q?H9MB14fD5b+kc5tRs2usDsvV91/4hQgVmwqiAWxuRYWZxsnPi0fQmjXRKO?=
 =?iso-8859-1?Q?siX/j/9AhKa/eSOkOB92mSEbX76UlJYyJoAWJ08MoEP701EG3OaxgdqqO0?=
 =?iso-8859-1?Q?Cqrkv3+xOh2YWrT8bmSPLoZNxSmaDJCSaDDqoh8jiJb6BAd/rZmGVp7DVl?=
 =?iso-8859-1?Q?i7/+LoqdEBWoaf1Wo4/7y0wXBUXw9xF8H0D3ny5Bq29yylapr6otr2vmBp?=
 =?iso-8859-1?Q?vVXxOU6ky5T+r1SIBrkZRtyHS5U0sIDPwQudLb93Tw/0a1c1LnWfmOQRDg?=
 =?iso-8859-1?Q?5vMNRCFJvet/fXUeIvDpUpKR0M5kRtV2LEnIkuhx8y9V5tHKMObQpgo52o?=
 =?iso-8859-1?Q?9fLXv378aIdCp1aBQQjhX4iyOlY4qn4hvaRbwx5aJ7qE6vCcO0ITdsBqHS?=
 =?iso-8859-1?Q?mLXR1k2uPyKzjy5hcs75lZUgEUow1EnznLkMizRdL/F+cJsUwGIex198fs?=
 =?iso-8859-1?Q?BjGi1k9Xj2eBa76q/13lMS0T97vLAm2yUa3auWkUupgfIDeHGfQbKdptsY?=
 =?iso-8859-1?Q?WM+amllr4atKg8z4M1ugQU2j4gim+kagP3FJ1XliTn+SoAkecsObcqaI2o?=
 =?iso-8859-1?Q?Jlh0nfCIUrVhHgPAiBb1wy0zLNt+TkjU3pBGuNCFSYL32FSO+6RUqhcXmD?=
 =?iso-8859-1?Q?bbzadj3hQqQaG+rNPQRCqQCV1LRR2fxf1x3s5vqwzceagjDmmRBdMQVlrt?=
 =?iso-8859-1?Q?MsW8qhMXhnwUWvufaWjSnpSwdwQj+VanF9prjhgf7Btj9zhYPu0i/Khw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8065510-33ba-40cc-5629-08db2bb9a430
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:14:12.9756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy3/ukSLb9lMLDGNG6E+TrsxBK74+C4vapw39+sVNG3EVOQU4NPTi7iGYCb92APRkyCfJJSsm9Q8btKkI+EbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use BO's GT to determine dma_offset
 when programming PTEs
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

On Thu, Mar 23, 2023 at 10:21:12AM +0100, Thomas Hellström wrote:
> Hi.
> 
> Good catch. Some comments below.
> 
> On 3/23/23 09:15, Matthew Brost wrote:
> > Rather than using the passed in GT, use the BO's GT determine dma_offset
> > when programming PTEs as these two GT's could differ (i.e. mapping a BO
> > from a remote GT). The BO's GT is correct GT to use as this where BO
> > resides, while the passed in GT is where the mapping is created.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 5 +++++
> >   drivers/gpu/drm/xe/xe_bo.h | 1 +
> >   drivers/gpu/drm/xe/xe_pt.c | 4 +++-
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 764b3ca9fff7..8beb35aa6f15 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -79,6 +79,11 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
> >   	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
> >   }
> > +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
> 
> Kerneldoc.
> 

Will do.

> > +{
> XE_WARN_ON_ONCE(!vram) ?

mem_type_to_gt has a BUG_ON for this.

> > +	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
> > +}
> > +
> >   static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
> >   			   u32 bo_flags, u32 *c)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index f4303810f213..f9abd8036417 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -105,6 +105,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
> >   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >   			      u32 bo_flags);
> Newline.

Sure.

Matt

> > +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
> >   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index a2e586ebd9a8..6dc31b030687 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -792,10 +792,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
> >   	int ret;
> >   	if (is_vram) {
> > +		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
> > +
> >   		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
> >   		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> >   			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
> > -		xe_walk.dma_offset = gt->mem.vram.io_start -
> > +		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
> >   			gt_to_xe(gt)->mem.vram.io_start;
> >   		xe_walk.cache = XE_CACHE_WB;
> >   	} else {
> 
> Thanks,
> 
> Thomas
> 
> 
