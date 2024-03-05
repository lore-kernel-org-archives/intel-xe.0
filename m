Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC65C54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 22:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7BB112D3D;
	Tue,  5 Mar 2024 22:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKZ4MRLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E45112D3D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709677798; x=1741213798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UddfGs6AlmjH1ltiOpa+SoXCLzWQuKp+E1r9KRUzgs0=;
 b=lKZ4MRLHeY9JLxXkq9mvOADYGUVGRbXOy9aqwDiJfskUU9WV1rv4V6Ee
 umlUceUt56vSBvZb8rNkUm3PkD5wkBJ/fW651Rc6O9w4i0QN/1SkpIjY+
 LMRQuHUgy6DLIl7Rve7kjy5q9/RGb1zCLlayJgAPZ3XmzrnEhAF2vbSKw
 FVA7Kgfhxm2G3Jn+0f8wtjqTvMB6+qbHVyOGETynjET2fkEiesfLZHz63
 +ZMxvA6O3R0hzQTUNPCn+QllIu/654eq1i0vx8PKe4TXmLecWvOvQlMPn
 jAJnNQA36SSSE08KwSN5MuG/QEtASjitFuINutayENzEVuq9DEHQUo7Fz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15404593"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="15404593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 14:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; d="scan'208";a="14185612"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 14:29:52 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 14:29:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 14:29:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 14:29:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyGV3r3qsqqwmoVU9sgcyu4XpYhXRo3978HgKmIzu2oKZAxbAhvwARvPciGLfZGxxDIzvywm5oWnbbq8Abqcl1qz/X0pN989VRCdn4meFvkXZlLsQgVddS9Lj3nGladPxL8ye+vA7OFM4Lmwbd59aQboggx7iORD/Tf5qkpSPhbcq/vhXmCUhO16oJjwz4YOP3mAjybmALp/LpPitjH0s7p6Mu8mhfcQal7py2SBMvVsqH/tbyZj0+whdtIw2PwNS9hSAioqd38e71M1GwStnTuZ9foVK7wPDanuPb0Z5U6uaXa9AUm/i9Sk3BhzknnSghn1xh5NOt29hsiHh0aniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrHNYIfpc1oLOHurGXJRVLJg5gBxg54a8Ik7L3e69wk=;
 b=FsO96PmWV/uZiS8z/mxnfcKrDb6jpwdVjZWH+688Jvwc1NA0G4QXTljaigX7ySJ0nm0QzuMfA91HzDqS+H+ytvmW2a3it7eIel6Rw9aC/b/xJjg2pPHGizNxrMZXG+O6lv3pSupgBpYI8D+kVYYLL3wJ50dZ9e+6z+x6jN52kkdw1QX0YIJcbOoelkrQBdNxjkbhOY8XiQVSJeGxk8NONDFWFcxobFAVfpHIOvN7bRmCtD7ce8j1cQYxV7EnvCmXB4jKSvReYuiyAfLvORACp9WBC9gfxIdPaDi6p9loyoDrftM3OSsVgO/Sq2JA8jnGSuGnbH4qGTpJSH8U9BkupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Tue, 5 Mar
 2024 22:29:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 22:29:45 +0000
Date: Tue, 5 Mar 2024 17:29:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe: Convert xe_gem_fault to use direct
 xe_pm_runtime calls
Message-ID: <Zeec1opYgnXMuJEr@intel.com>
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-2-rodrigo.vivi@intel.com>
 <d5af5b39-75a1-47e2-b41a-23d6c23b62ea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5af5b39-75a1-47e2-b41a-23d6c23b62ea@intel.com>
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a09c97c-382e-48f6-7d8b-08dc3d63c239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wcDo6xBpZoFtpdFSmIsZcxqa+EpiHdc06QNSpe0sx8T4nMmy7IHdoZ/zTo0hz6aYakH9lAk/1LG3Pqh40WFhxFGkdmJhVdpqDGJySLwPGL1fZrvodcvhVrFl95dHbsYVGzlAAyCx408g9lyerySWcztccXmMd4HVxD5Y3GK+S6UkRposCLCUksNj3b6brv5LkAq7nOLfo3VY2O3dsV2qrXuSFQFLjsECsumOBkosJyzq6mPoWX90LfUSl9uiubJIoydw2VQV8JUOFFX7P2jbH9uHOd5ne59+JYx5FajcXT2Stn2I2j+yoiPaxKK+5umL0xY8QCegO/zE+U3SUuUmu6cV/l+h+8BGTwD/3Vquwyd1serbOpOP8sK5twMeh0x9mzVPvPaVxcOP18ool2XZXyrzEfLDXnBbGm6SyVjI+RXRHmUI42aKPq2r6I6/wQw5Ay88u3W7h4P69nRkC6kwGhKfxPTGXPpyo8s9ooV0t31HelyvYSI1pUBkYeISoBIdyR6j+UZ7Iue293cmA53Q1NVqJX4JjQq8rb5eYLzHYb+4w44Kit41Tod2ZUy87J+MBbDh/W58aBv1RBUyRNcxHpRBAu1t3mVlIXdSa5Rd4jaH6oyckEJI0sXnOtKhRvT3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVhbBleRhK+zee6qNh909hgiWbqFGkYOaa65hegK3j7afc+B2WJvqjB8bLo3?=
 =?us-ascii?Q?ZYZNNvR/GoXzP7+mp2PzKgyM3awe9drv+6xn//vg3c2t/OS89NY7insnnsKm?=
 =?us-ascii?Q?P1DFR9i25TJ7B0wLjHuLYqFD587cbyVTpwoaSn7xCGXDj6ND7P6HwPhYb9FO?=
 =?us-ascii?Q?WF6VQWMLwdjhQN8JUmuDkD803oz/6sVAPnW0+gsMueb9McFOzaaM56bCpSQs?=
 =?us-ascii?Q?WgnzJtevsge22LF5SkQldjncdleLzHp64ph+U340VPMQKhoPmfWSugrO7JZM?=
 =?us-ascii?Q?l4zqQQOtS9w+UlSM6TvhiMN3cn36y+RZ7U7S6OBZxg17ZXWB8ObGOgzdXdt5?=
 =?us-ascii?Q?xdjH3ktR9EVl9jPWOVIaPC0lPK4PQMym0gjbW2J3C0ppHnziCkvmxl7fKzts?=
 =?us-ascii?Q?OZSlvTYwmC4BpCQBIuzE0TnGmfPa0qJNtnLGZlpcRLsj6mjgIVzQWtZGjD4Q?=
 =?us-ascii?Q?GkYYCvE5pJtPM1tFOaaVHL9wD3SwuM0BL4vhgRIivEFqIKlW/Fr7tURviiNy?=
 =?us-ascii?Q?tqv1Esr7RJWHm9XW0iEc+EqK42AgO6ham2mtNitEjp/VtsrjDxSIDCRNt+tv?=
 =?us-ascii?Q?hhPL/gSrF3K9Zr0qee4dEAU5S058E452MY0YFYgQ8fdy694mlIEQ+fse8rTv?=
 =?us-ascii?Q?h+bwWH4GiPyfH14mY/nYuzUcessHxy+g3gg9Xen4FAK7EQciSW5hAQbSuk2R?=
 =?us-ascii?Q?T4Al1KUmQfq4zfQie1vhOyT4Z3LgJQy4MfhoDnDFtR/8Gqu7KakGxsDe40js?=
 =?us-ascii?Q?nkiXJ5hw7zDItM/nbzBm1qo8p5U3M4bfAHbAnHWUtTSwBlaw7HYPSLivow/j?=
 =?us-ascii?Q?OiEK2GrDDHickFWld3R1SEfWRRmRtn4Q3nWhH2wWBcXauXqd25rK0vvjwZbl?=
 =?us-ascii?Q?MPsaHv1t/6d261FzJmM8nzBsZrFSJqz8DM9LqsHMNBgJtIs1qICQI62JP4b+?=
 =?us-ascii?Q?8NJao8LvYnBZWkoYpYuSMQnFdaB3uKDGfupNBh/JgWMOXHXJDbMWiF2K2pgA?=
 =?us-ascii?Q?Deih2dKGEqxlWG5IT82IbDtZ6mpOUa9R4yI3e8jcq7j+9KxRHWP6+zvl/c26?=
 =?us-ascii?Q?IkTAwRh7X4mfD01PgNkTjocKIecMM1au7XXfN7TDOOk4q5rt9ckeld4XZF44?=
 =?us-ascii?Q?KFGwmzph7TwDgNrIjnEVNDVXPW36KYHia5nwJbVg8/ZXMncJSVtUvln9W+de?=
 =?us-ascii?Q?+8snvnlmiOrleXSebZzIzsC2R638StUygaW4w548QMRIuPay6zS1LLDWfYXu?=
 =?us-ascii?Q?gQI7BbNaiB5gTe/Gt7ZyiXzYmdKvnp89cUPNccG1nHpE53ivWExF4nvjeoHS?=
 =?us-ascii?Q?YNbpqMz4d/YmIbsteZ2TJFRExWTbflaqzQnaYHJXlgGRnyoEcEe8yTIMz2jE?=
 =?us-ascii?Q?CS16MaADQNnL3qvOx3xgKxf5Dd0CKjXoqgPtOYMKOTLBDpr6CdEvRPSmKWS6?=
 =?us-ascii?Q?bL6POFfj/nA59qaY1ZjJsee764yyecbE79ANXsb/q65zkPEe+3ZWOfqnMC3J?=
 =?us-ascii?Q?1rsETXeiVPnRMAD8ZCbbM93mrVoTvhP7aeU7HpT+RNsJe3xQTHsZOA7s5tRt?=
 =?us-ascii?Q?DH9UdoCNrm3Csbwx8s/NyhkEMlyCJt1CNEbWLzA0S4yMwqYBrfig6X90EBv6?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a09c97c-382e-48f6-7d8b-08dc3d63c239
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 22:29:45.2671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz3MmiurdccnIO96xOpmErhHamcxM+TIPgwCZGTPXSgbANWOwjVLCvjbS9xGCkfTnHbOCGX4IpJD0rWGa+GvnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5979
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

On Tue, Mar 05, 2024 at 11:29:22AM +0000, Matthew Auld wrote:
> On 04/03/2024 18:21, Rodrigo Vivi wrote:
> > The gem page fault is one of the outer bound protections where
> > we want to ensure that the hardware is in D0 before proceeding
> > with memory access. Let's convert it towards the xe_pm_runtime
> > functions directly so we can then convert the mem_access to be
> > inner protection only and then Kill it for good.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Not strictly related to this, but FYI there is:
> 
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1100
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1300
> 
> Which is on the GPU fault path. Looks like VM is maybe nuked before the
> worker can process the fault from the GuC? In that case there no RPM ref.

not related indeed, but a true issue. Part of that is the guc_ct
refactor that we need to to...  on the g2h processing.

one idea that is crossing my mind is the to perhaps queue the interrupt
job in a same ordered queue, right after the get_resume one... with this
we could have this g2h and perhaps even enable more irq cases and allow
display hotplug for instance. thoughts?

also, for this patch itself, are you okay with this if the lockdep is okay?

> 
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6603a0ea79c5..def68528cd40 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -22,6 +22,7 @@
> >   #include "xe_gt.h"
> >   #include "xe_map.h"
> >   #include "xe_migrate.h"
> > +#include "xe_pm.h"
> >   #include "xe_preempt_fence.h"
> >   #include "xe_res_cursor.h"
> >   #include "xe_trace.h"
> > @@ -1144,7 +1145,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> >   	int idx, r = 0;
> >   	if (needs_rpm)
> > -		xe_device_mem_access_get(xe);
> > +		xe_pm_runtime_get(xe);
> >   	ret = ttm_bo_vm_reserve(tbo, vmf);
> >   	if (ret)
> > @@ -1184,7 +1185,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> >   	dma_resv_unlock(tbo->base.resv);
> >   out:
> >   	if (needs_rpm)
> > -		xe_device_mem_access_put(xe);
> > +		xe_pm_runtime_put(xe);
> >   	return ret;
> >   }
