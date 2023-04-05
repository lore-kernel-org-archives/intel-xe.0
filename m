Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029DCC7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 14:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA7210E989;
	Wed,  5 Apr 2023 14:15:32 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C2E10E989
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680704131; x=1712240131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CE7teKcdovIlW6ORVz9XdYNygMSfU3F2zjhJbkSwo+c=;
 b=VuUBAzlvhsm+iambzf/39v2RoQDqg4PzYQzpl8ocumqCc53sOrIN0hYQ
 ktsV9i/PcF3Szyuct6+fP03TuFdj/huGr3Z9T9E7fVRYDdYkVQqDI+6mt
 0VKjiV1pQtptxMGaHYEoT6mfqbqXHL1vZ/qP4W6gksQ5tFoxQMVeVqucQ
 kudMvmy/usxlvKqKWCVTBMzNZU+YrUGXHXOTqupQfL9M3VXotOew1gCS8
 roXzpPe9NOkgwMu0gFnZCO4jBqujzTn4QlVFEQgMmRwqQUR92K20OKqkP
 NH222UPZwLOlDqgCBXdCnp4CkgTxUxEli5ZFOjqaflMlF3AsWnGEOi8ra g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370289268"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="370289268"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689307203"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="689307203"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 07:14:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 07:14:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 07:14:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 07:14:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 07:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPlH9FdXmlooUWopmsZQlhtLp6MQg38w92e3naVTm0XC1ca9XqfCP70yGwK+07BOHICPOFt7oh/PzJDis96E31KLZiufn+MhtX4xmL/7B6xslTrnhcdppG/XahTxu3iTZ4tMVx1n6eLM6Y4nOzZqC6jasVNMsYgWEc0i520pcCKk8axJc2/5d+oeaei+sfIKZWv2XRUFQfAlvpJT0+Eqb1FojxVBHUMHc/NHmYsZbLItmhR14s3+BAcOta6v9mzSWfmw7QadwbB0M/PBSoRz9QAC1KCDVRVhaEbS1vliEMLPlP9oa//vmmcjk88tnkurua8IajA0hm0W5GGiTpBwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAf7Uf08jOMyF0kjq+s4BnBy30pn4FwqRbE2sfNBMIQ=;
 b=lKo6B9yuXWhlFVVEtNnBbCerfYHq2JZQLHAW4klhb9+URv9yYb17SkJ66g7R3u8ZAwzAnofYxw+FAHHOX03YobPC00lNnUQOBGVcWegJwGhGNAcbjorVHCjkXImxX4xS4+I24701/yezfQfvclAU/xwhM+hpHTYgevjiAU9C7oCW/RXjHrY8jooc9znTjPt2IMDBTI4RngQrWbjMWBiRQjWGAqv1iswU59Rv9kEIqk7J2aR6qPEAZAd0kYVKyLj+jUme6JtGNoT20FH52RiyH8tKb1VyUvSZjVDviqKl7bDv22Mjuk8aCGcAbJpmQxxweeHqS4AsG9fYF6mmBDLCuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 14:14:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 14:14:28 +0000
Date: Wed, 5 Apr 2023 14:14:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <ZC2CPlIIHjdfSvZI@DUT025-TGLU.fm.intel.com>
References: <20230405041943.3980167-1-matthew.brost@intel.com>
 <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM0jSHPRBXz4Vk=A0aTGh0wt=kFvncE-PNchvSCoc8dnHoFPQA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO6PR11MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: c50052fb-6808-4253-fb0d-08db35e01141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNVBtKBJ6LLF7gcHCuCuWM0vGS4kdz8vG915JWJt+mnf/0LAAJsy/4BSOotdSvDeeKObRUD1UvOPMH3P3HbXJVffqueVkw5iXvZKSTqHmRvD8HhMUOoIcduEsx2MWRDZxBfqvzPFA1bYGPS104+r+hNDsx7BurusMYUPFQyGQrZk0LzSqu4eSks8bQT14FENuHEvO4t/YrYnutsdlGCNb6mK8e5wkyXp4z26hCIT5SYyPtQBUOaTGHjjnP0b+eZJJoYy+aFp3JuAEeVMnVX7tp+7kr1Pay8qTF46NRbCZDwOowI4O79QISgOW1MHdCRGfqGLedaloy5GvYuFD0ncR6qtR4vW2E5O2BZxtkpUsXxsfQXgO3iexo485Z55EtMDjtCBNzobzwTmZ1f9K4Fi+3lomRrhULlMGwt7TruATCzH+EtG4wEkvrlVqapjc4sXj6LJl4pTd2GEn8+fjlgps3hzPQAcEyYGvyLBcUjomB2KMEAiT/53845gfJcRLffvGlRmwQ3w/limPlv5bfCR7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(38100700002)(5660300002)(44832011)(6916009)(66476007)(8676002)(66556008)(41300700001)(4326008)(66946007)(82960400001)(8936002)(86362001)(6486002)(83380400001)(966005)(2906002)(6512007)(26005)(6506007)(186003)(316002)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QCnTROzHET7jh4JM4J32fMVr6oRjH/CMqR21nU8WuYHvCANrlauxh6SsEr8C?=
 =?us-ascii?Q?eDL56Ky/8cCq9x/JhQqZW6WTJHyRscND8zvYFisBuiFVtFosKp0ba1aBispn?=
 =?us-ascii?Q?dak1JaegXvK+01WY/zBA1fxEtXvPjld6xkv4cS8AyLKe7cqUKrX3vMdG3ERe?=
 =?us-ascii?Q?t8lz9+RW/J/1SgA7A0YL/mFUNU1Ifr+IlfX4I0pUhql2VT7cFZlpRJBw8XOV?=
 =?us-ascii?Q?mlG0/Ss48Kc4Gq+SH+gRs2KC+RStvCdWQfWglQ5VFkz2TK2+v858M9iDl1x8?=
 =?us-ascii?Q?xQ4Pr9TD488D3HT1SXV3NJbX1UjJeQfHQsZ/KB1+JUWQU7lg/bzMYWK7OmIZ?=
 =?us-ascii?Q?iq8NwCnajg7NzJiWzPwuGA0OdPPnqHyOOcT0kdyhsTr5adg94VdPtNCJy2x9?=
 =?us-ascii?Q?D2ZGwkSwducR9Sov0fk68n1j5S9EmJ2CF3dWF1kut9bZ2WYjJT0dno5Dy0Ry?=
 =?us-ascii?Q?hVweldKoYTSegHnxYH39Uq7VvmSdW45q5C8fPFrk1rX73HHg4fQRsQYRg4ek?=
 =?us-ascii?Q?3uCHs19Qqbo2hOtWPSRWwH59NLUzo+TTtktQK7odmyyn0Wk+3Xd3mvmVtszb?=
 =?us-ascii?Q?8xSVHHwgjElcUp0gDwV/KTUWJfpsw8uAxRbbq2Kz46aTVeJ+mQdaOlhTFmY4?=
 =?us-ascii?Q?0NtGkLq7UDnaZT7xdbPQJFj0sZwX0AnLtQ7RPsWrIPQGa+6BVWiWzDpC1t7e?=
 =?us-ascii?Q?Prspv7TO6RSaCok4A2en3W7MDNRPvaRG5Yq21yTAfrE4n9Cog149HgYnJZZd?=
 =?us-ascii?Q?TAJ/XWeHP85qr/UsBPwO2xU3qoQgNxcLGJ7pnFWbGzDz/s8Q0fcxLs5cu40C?=
 =?us-ascii?Q?57og9QuQYnxcfXQzW+6wYupZ5+6BgXUimR+uLD+DdIOkIfSE0dzIZ4xpPmZK?=
 =?us-ascii?Q?rMbM+ekG8/wnEUlhQfvIL8oN6V5d+mCqabU8IOtvISZ4Q5DiM988MdB1rNBX?=
 =?us-ascii?Q?3XCBjCCUZCtrcrS102oa5vHWcpkCW+YxlgREH3EVbmQuR+J61UJ8riV6MhYX?=
 =?us-ascii?Q?wFgZ+8nNWd3uXbRDn+RHtcEzSHDen9m2SBWVLcx6ZiLrAxCE8caQq+Holado?=
 =?us-ascii?Q?2p7fx8H0pydz5ldzF2LDjLNJW73tXJvo7xgijb8PJHOX8AjRQG9DJGD2lVoB?=
 =?us-ascii?Q?AKd24Ohvd0VOAvOaxwky62j6MAIq7K5HKJHByO/82ZsQM/Z4n7UGV3U0qVze?=
 =?us-ascii?Q?E3l93UJ7xmfbDsyUosQnFHUGspGz4fptYTIjMLSsV67VRVqdbZJ4rwD5Ttsk?=
 =?us-ascii?Q?uPPAHUcsNB9s3KE4NK64NJc7hYMJUpuM/Xkb5+6r6kQotYX+t6MVZXTa3LFV?=
 =?us-ascii?Q?z3boy+zFmsM6yKXbKrL4GZ9EIalBGeVQ5k0s8oJmCk8Vi4MK9oRYoI7/lMPN?=
 =?us-ascii?Q?OIajHKjjRKwpixpVkECiaHhG0p8VbzeOtPXsR2uSnnEdN/9b/3dd+RLwxgl9?=
 =?us-ascii?Q?ziZZmQ7hQ6r646nSgwpbqfmJz5+yYsJrp4si3t6VXi/zi25VxkoDHL1iMXqi?=
 =?us-ascii?Q?sQ1HdWP3iRVqMYfoDSIs5x983Mm9xbe1FqZknrR90c158DgFU0T8z3WFQ1Ft?=
 =?us-ascii?Q?XpbmMVJyu/Cu6vg5eW4AGMUUEFu0Cr9TexNVqzuYsiESKVS89SniaJHuLl/m?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50052fb-6808-4253-fb0d-08db35e01141
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 14:14:28.2782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LicvxYe/UdFL2597ATVMocMW/erEqQGbW++593JVAo6PLXLy08uRToAuIqX4P7edjdaB582v4ghPhYWSVv4H3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
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

On Wed, Apr 05, 2023 at 02:19:35PM +0100, Matthew Auld wrote:
> On Wed, 5 Apr 2023 at 05:19, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > Need to use XE BO pin / unpin for suspend / resume to work properly.
> > Part this fix too is too allow xe_bo_pin to be called more than once.
> >
> > Should fix:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Change makes sense to me, but I think we also need to update xe_bo_unpin()?
> 

Yep, thought that coded correctly but was looking at xe_bo_unpin_external().

> But I must be misunderstanding something here. AFAICT we can have
> various pinned VRAM objects, and xe_bo_pin() still adds them to
> pinned.kernel_bo_present, where during suspend we evict everything on
> that list to system memory. But as these are all still pinned, suspend
> is still going to fail with this patch, given the recent TTM changes.

What reference recent TTM changes? This all worked at one point in time.

Matt

> What am I missing?
> 
> > ---
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c | 4 ++--
> >  drivers/gpu/drm/xe/xe_bo.c             | 5 +++--
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > index 65c0bc28a3d1..c7c849be288f 100644
> > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > @@ -205,7 +205,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> >
> >         ret = xe_bo_validate(bo, NULL, true);
> >         if (!ret)
> > -               ttm_bo_pin(&bo->ttm);
> > +               xe_bo_pin(bo);
> >         ttm_bo_unreserve(&bo->ttm);
> >         if (ret)
> >                 goto err;
> > @@ -222,7 +222,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> >
> >  err_unpin:
> >         ttm_bo_reserve(&bo->ttm, false, false, NULL);
> > -       ttm_bo_unpin(&bo->ttm);
> > +       xe_bo_unpin(bo);
> >         ttm_bo_unreserve(&bo->ttm);
> >  err:
> >         kfree(vma);
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 3a482c61c3ec..25c696bd380c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1278,8 +1278,8 @@ int xe_bo_pin(struct xe_bo *bo)
> >          */
> >         XE_BUG_ON(bo->ttm.base.import_attach);
> >
> > -       /* We only expect at most 1 pin */
> > -       XE_BUG_ON(xe_bo_is_pinned(bo));
> > +       if (xe_bo_is_pinned(bo))
> > +               goto pin;
> >
> >         err = xe_bo_validate(bo, NULL, false);
> >         if (err)
> > @@ -1308,6 +1308,7 @@ int xe_bo_pin(struct xe_bo *bo)
> >                 }
> >         }
> >
> > +pin:
> >         ttm_bo_pin(&bo->ttm);
> >
> >         /*
> > --
> > 2.34.1
> >
