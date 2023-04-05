Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD88C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 14:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7AA10E0B0;
	Wed,  5 Apr 2023 14:28:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E584210E0B0
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680704928; x=1712240928;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Cdvwx7MyWCBMmfxDRSfgvmRbXA21xXAr0Pqyxbf/VIM=;
 b=O24Tf2zDVMZia8F1n3UgbfQAcOIy1ggOdFcO5iXGpC3aHFjluLF3OnWv
 n3zP0y5qsevEPmxN0vj1YYnpA8+GEivDTwVZX3HEpHODyPkLNoOgwb2x7
 g0VsZgVtP5H0BZtq8QZohI3aPagcrmyjVglg1zMj/reanYY0Tys0yeB1m
 YRHXDg+H+2hbNdxhRB5stotZLVLJKIsdctJv7ki9dyg9hmNXdMAlZA2sw
 GjZELlUa70NxsGvlpTEq3EiVknVbIk/KVPK3LbeC5cvuRY8aKnjJkpX+v
 HHIYQ0vhNS55mVPw5xeAGGEp97NW9g7VOY5IjBtdBuR+XE7Xr8kp5+mbH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342482373"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="342482373"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810657146"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="810657146"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2023 07:28:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 07:28:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 07:28:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 07:28:23 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 07:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJLBhYkX7ixgiTW4jLgOuqVrgVWezG3yT4iIGRHoPW3eWwZXRm4Gab+AhTbchRR08+uN5LkdVJ2MsJUfbI0kXZ2zSwNDQQGMPvkxFijNEwWiuS4exQw0/Ou5M34+bk/HAJQUrulBUxdvoccXD9AxJ6kf+AuQOp5GapN3cQ/jbCEamo6oDT/lRYi0SKCAW5K6Q9RHKD8fT9KPKZMY7xWht4fsJzREwbq6SVsoXjpq3qYdyohFn05aLmAz8nkhRa1x5rf3Ohpp/s7E7kUnYbhlj1YflECNEB/F+XKtjL+b/PTRG7sQu60gXxPNIrlIp5VXk1L/QP1hTVv2XQFaWIS0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anWX3xGbV3cOO+UaeTPAtPmyHNYIjy4vdjqdFZPwzcI=;
 b=lFEdLt2K8qbiHxXqz+IJWblhzzEbapZU1P+Jg3nD9NevBfh+r3jj/X59dDPe+BvnuVqSnlkzetgT+GZk/JqYC8RVP8PDl9Yg5XqpGcmyAPZEEx8xDJlz14cb5JQtb0234I1fE/Lk3AkyYm44Y77v8BtIpQERA0LJaRbbho6+FVBbMYUyjCK5FTpe0Gysx1ANu1ThTm0ZUnSNMlxXft4fyxSCc+34wpDF9P25XDh9EtGh8DfR82+F1VZAKuWwn4T+Yy3DVZ3WxWD2jojcBRKEw8qk6zscC6blNEC6W1cZzrEldDlHvaE4WCQUK/rZ176+Ht3sBTkLna+fZxchF22mZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 14:28:21 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 14:28:21 +0000
Date: Wed, 5 Apr 2023 14:28:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZC2FfgbxUJpI+FEI@DUT025-TGLU.fm.intel.com>
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
 <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY5PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e60805-62e5-4bfc-d4c6-08db35e2019d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KanMTy9K3GopT0FJTxUEinCpxfv3yb82hVFAZqUJ0+Zs0VNcrpizkMK41PtTVPw3iO2uWjQhisU0DjoWM4ppNK/OB3n7lmGvbQRnYymrnN33Ok3QK4IBhWYQ4NXSedv3tgec/ECw0ArPlZq67NBbT8yKSWg+zKpwHtCpR4X6aeNUYRolXk1z4fKnbKaWLA1w0+aunV7ObhIHN0lt0BClAiu9peauGWG+UZXVQv34EljaBbnl6XVuTM5WGrE0LMahOjaesfF0MnLSmRr3XuBSefbtsAz/wB/9W+J077inm0AmJHqKn3qUa3s4OnDr1f4OFVhFd86ph3fAj3o8Dle5ZwxMaUC9Hu79sv1kaXkTiigwTNq8UGB0hAYHH/DOMApq6rK1cAYGeCVGf5ZFAjQMhMD6wsUkAYl4th4s5pSS+gQga0f3RDgzxQtN1erUmxLuJDa1yRG9VmYqzJakEXO8EtZ+9h1aN/X/Y4TAEqbL7bbVacv0KTsQFEEMbHJLiG8Ul+6NY96axdGQ9LLB3Iet3uof6kXI9RgGLyEgrgEZZ57JpiVMXUwMj7Xdv+lt1ZQQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(4326008)(478600001)(66556008)(8676002)(66476007)(66946007)(5660300002)(6916009)(316002)(44832011)(8936002)(82960400001)(38100700002)(41300700001)(83380400001)(966005)(6486002)(186003)(6506007)(6666004)(26005)(6512007)(86362001)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAQNA3FWDzslVl8DCSGSIrfTZX5BKaXiKzU2wAUQRi8eya3c7NBHjJkwErfM?=
 =?us-ascii?Q?AlJ5QRDDCRkikJE4aVQbA/uDTK1ELRf3PcA0FjCQ7EUYY48kg6hrJ95o5CPT?=
 =?us-ascii?Q?mCUf2BimoxqqeQV9H1Omwl6UwBd0ZddDdo42Dxeni+YunpsB0WtB9TLqMv9L?=
 =?us-ascii?Q?ezZLSUyVYi0oUgLGQTTTgxbZpegCmrVj6pm08bO37+p33j7GFf+bgbLqxt/Q?=
 =?us-ascii?Q?NStOZnwnneyfqdqM3N4CjKddy4CiSCvsBqrvMu+iLudi4hOCxgTqdPXCpttr?=
 =?us-ascii?Q?Ujipsz4d3ZZPZ3DYQlQ5JF0+N9lC8YZptlXiYTB4nXl0+px0O3WWPfsaRAkY?=
 =?us-ascii?Q?nWWnK9EHXPjFfUSpHz0BJRcumEHZI4X5zbgXIs3uftT9nLkIb6cjHQDsyXZ9?=
 =?us-ascii?Q?7Xy57f8YyY+CfgvVoMJREyYyGY3Ywviqcy/ZOigdw1z6lqvMlE0m79kCvD0X?=
 =?us-ascii?Q?E/LG7Y9cRNVeWb2zpzbFJy3CeRROj/aMRQHRfG7NasIe1C0vKWpR76SOVjAU?=
 =?us-ascii?Q?B5Fh3goS0XvlFy3gXXkCMx1vXkexloozQw1a0kFqCHH4vsh5eaLIg7cGl/A3?=
 =?us-ascii?Q?WfPzd+Djo8JDgcLh7QKx4xCRTFBktflvZCW1+rgmypnd6Kp32ngjTFzfeq2l?=
 =?us-ascii?Q?U0J6cl1DfvvnQdHy4vCUO4+q0Sp+O/IcqS+5gd346ELxuirtZsgl4qZnBzNY?=
 =?us-ascii?Q?XmyDIuIRSSMfPG/1k7b4kikhFiQS5xsozN9qcajKCodq+Kc9+qbzasqQKpbQ?=
 =?us-ascii?Q?7qZ7/ZoArXO2/Rmc1/LfoI7B3ui4+Zq7ZtSxX+26JbWZfRY19/8+QHUxb3HC?=
 =?us-ascii?Q?ript8I4qNGU5qijJrKpT4X3yQ0qA3b4Aym+VtFTYxlf5HWjD9zdy6YJM/EvG?=
 =?us-ascii?Q?JfCSGsdFXe9f53SueNL8/os98qeegs39vxPRe4odiMzf+HJ9Awigt5ZZFXMS?=
 =?us-ascii?Q?oEobaNDUpP311ilGIaxDLmwj15SphO4uOcjP3dU7+Apy+w8iLndfrLxsdz6F?=
 =?us-ascii?Q?ExBl/ef1QPDVP2IwEGWQJQ6gXBgqq5IYDZL87nagggsljnhqnbK5ASJpn8EB?=
 =?us-ascii?Q?+h+Uqc1lfAG3ICD5uUQKd9kbG1DgzvbzltnK9MaVYEJQVNjCwnnVouAg3Mtz?=
 =?us-ascii?Q?vRfHMl5/3OyYm6RIyqnFj9xjL4gnYSLVUoFVs1IC5Loatz76uk0gMCHsMCpc?=
 =?us-ascii?Q?cP5B1Mka6i8D9HzpK3iJ8NIFlMkcBjJKL+qUmUq5SQpG1hyBc8yxh2njEY09?=
 =?us-ascii?Q?8pp6lrJ0MOzzy8Qr04gNuFW72vFLkgOFcoo1lMWZZELL4V1k8wPxi+yIs/80?=
 =?us-ascii?Q?NsrGv7ifpaEklMznCYFzjKOme9hCQA4dLFEmwVLtqVISoZ8eYkTo8TMLB+LQ?=
 =?us-ascii?Q?aTlGl9wyWlauBs5/66lquw6lioS1elxem1evhgKjiuZgdrj5CFCwIqtmb7eP?=
 =?us-ascii?Q?JdYhuMzt7UNviXgC7Pc+y30lwJonwXEpdS+4W4LZyXlmmO2niOcTW/+aekr2?=
 =?us-ascii?Q?P6jmuOpY5dw4jJEMm7ibQvj92+szlwZUjbAF4/qa6uMpc98fjUEreI2ePIju?=
 =?us-ascii?Q?bWfU3aTRzyfJLoRI4YlXq6Lq3y/aeV/AEpJr1aZVwMMKm5zRg73I+RZzoNnK?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e60805-62e5-4bfc-d4c6-08db35e2019d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 14:28:21.0618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xwr3jEiisGKAsapBP/7hvDI/uQ1uEdU5fby8jAM45BUoUhEukOFKhZvDddUImqanPmgDsVWIDBtzuwf9Mwa4/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use Xe BO pin / unpin functions for
 FB pin
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

On Wed, Apr 05, 2023 at 02:14:22PM +0000, Matthew Brost wrote:
> On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
> > On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > Need to use XE BO pin / unpin for suspend / resume to work properly.
> > > Part this fix too is too allow xe_bo_pin to be called more than once.
> > >
> > > Should fix:
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Change makes sense to me, but I think we also need to update xe_bo_unpin()?
> > 
> 
> Yep, thought that coded correctly but was looking at xe_bo_unpin_external().
> 
> > But I must be misunderstanding something here. AFAICT we can have
> > various pinned VRAM objects, and xe_bo_pin() still adds them to
> > pinned.kernel_bo_present, where during suspend we evict everything on
> > that list to system memory. But as these are all still pinned, suspend
> > is still going to fail with this patch, given the recent TTM changes.
> 
> What reference recent TTM changes? This all worked at one point in time.
> 

Oh, I see:
git format-patch -1 f87c1f0b7b79b

I would've NAK'd that one as this broke us. What you think is the best
way to move forward on this one? I like the idea of using TTM to move
the objects...

I know we could just hack this and set pin_count=0 before calling
validate aand restore it after? Horried hack though? 

Revert the above patch + post upstream?

BTW, this patch is needed regardless with the fix in xe_bo_unpin().

Matt

> Matt
> 
> > What am I missing?
> > 
> > > ---
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
> > >  drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index 65c0bc28a3d1..c7c849be288f 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >
> > >         ret = xe_bo_validate(bo, NULL, true);
> > >         if (!ret)
> > > -               ttm_bo_pin(&bo->ttm);
> > > +               xe_bo_pin(bo);
> > >         ttm_bo_unreserve(&bo->ttm);
> > >         if (ret)
> > >                 goto err;
> > > @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >
> > >  err_unpin:
> > >         ttm_bo_reserve(&bo->ttm, false, false, NULL);
> > > -       ttm_bo_unpin(&bo->ttm);
> > > +       xe_bo_unpin(bo);
> > >         ttm_bo_unreserve(&bo->ttm);
> > >  err:
> > >         kfree(vma);
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 3a482c61c3ec..25c696bd380c 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
> > >          */
> > >         XE_BUG_ON(bo->ttm.base.import_attach);
> > >
> > > -       /* We only expect at most 1 pin */
> > > -       XE_BUG_ON(xe_bo_is_pinned(bo));
> > > +       if (xe_bo_is_pinned(bo))
> > > +               goto pin;
> > >
> > >         err = xe_bo_validate(bo, NULL, false);
> > >         if (err)
> > > @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
> > >                 }
> > >         }
> > >
> > > +pin:
> > >         ttm_bo_pin(&bo->ttm);
> > >
> > >         /*
> > > --
> > > 2.34.1
> > >
