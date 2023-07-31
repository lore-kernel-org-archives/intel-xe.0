Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA294C001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 18:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591A110E045;
	Mon, 31 Jul 2023 18:44:48 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A01210E045
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690829086; x=1722365086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=u9f7g0QFD0OFCKpvazHN7fCUYc3pJRetTVEHTmuiE/A=;
 b=KaeuIKIN5OqyuqHyeDqaeV46LZZ3mlQhWTtwt+Ydi93PPN1k7U2Ybqmt
 Z5QSq2Tgz15FlTG0cdzVlsnXUz30K25G2vccEJcBfSUsmo8tydxbCFlgy
 JJHF9Axx4Mu8WD4OWWFdDFjQxyzcMlzcgKvQTHVyRz/MMYs7urolp2Y20
 aNNZ1K9Oadfei1QqEgfavOn8O5cYx3TkE7EmeZSVYaD4hgcNunmDRDyeR
 VhH/ykzQNXofrxiTbyfm7r5NL3NQBzmyqHjER4/1a7fifmyycDiF0Tpmn
 av/xh1vroVOOE6XX+ZKEzoDxm/v4mmtplVNWX9J8XyOXSHTsCJ+MzOJiV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349397207"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="349397207"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 11:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="842397859"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="842397859"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2023 11:44:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 11:44:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 11:44:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 11:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bx9iX1e51atVHj6ZNi2qkTvFQti07Uum5/UYefu3e+m0aahIml1rPQiMzxA0motf1Q0SHn4PbHtuXYwnYnbUVRuBcpByFSnAV/NVXr7SyvcBN+vuZTCaIcXGl4YvX+SPG1EOlHaD2+WP7Ev/ryEwO8Ss/DGy8QALX75SSBxE0YAMbNsj1vELmQFBKUMv2IrqWHOOdl26Y3hBcQ0JKiC4LK9kb+m6oxPHykw/Ru59QUMZ2Vy47/wmPGDLjSxVdK+a8o0n0VUS+oTxX3n1n9YCfMTf+7bOku09NBYGF8wKYyxZDET51bfO4q7C4LjKV8Sw3XniPoaq6d2eVz74SnfpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+oOJIDyXYl5tQ03J5p5FTE8apjpqU7aviatzzZayz4=;
 b=OagQ4bSmdeuo+Ms1ODkIRSWzCz0TXxzNJxR+KYLnn+ozumCSRd4FTzq1qayyA8Wd13glY0xTaSQgmnK5xNMI9vG2ld4TiEU3A6QpREKJOTFinDM5rq0OJil87x7H/YOslySeS/knyeUsEVsf0/iW8us2VIX0zpERXEsUMPWlUhvrKBNWohcD4JzIx7Md9i6ZTpeUhPZm1vWsXCRrbo+64ROJlqQ2RYvbyc+FMxoQyLyncrcpcApadMsW8w/ElQ+b1TIFTIrkqd0u+wOVvWntdRn9Jnjv+VKWKfYmKq5+5ychZlgRwWgfEPo3qjMtYhgrmUV13PrhVRqLUOWVWDduYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 18:44:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 18:44:43 +0000
Date: Mon, 31 Jul 2023 14:44:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZMgBFyfdnvrptmu9@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
 <20230719083801.182123-17-matthew.auld@intel.com>
 <20230728210524.GL138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230728210524.GL138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 147df5f8-da16-41f1-5d18-08db91f63485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6p6avwvNuik8/KEwbIolPs0ZC2sWl02d1ggewtHWzdujOEk7E1I4LluS8cmCwHY40nhQMK4ZDaVWreZB2PU5x3eTP3THVWDOrhVpqfdNRGb53zHkbuPueSheAhjZv2OaJPNq3wR2qN2+g6ZqkR2ULQIXLaEaKVngnTL0DBSt4V24agD6wEB1906ifGeiNON4CPqNZZ5t8Bduud8vFw5ykkYJ5CoTuFOUgm0rnCvqREejmhtyRyWNhryaocVdPhcTKQTTEqvtB7/Pwb/E67XTY8W1Cmo0zqI9yx8rtEaWD/Mu2qV5mWsLXrF7IvcY87xY/AkJxlPSgNRtpHCTKJxa42Sx0E4tzZssl125SKV+tYDDrSc4ozgy5/OBMnldozxkuzc8vSw8/fzznGDt2WIh2aTklQCn2GTXBgSJwTy9MNurHr8flFyOuEewNFPFx9YJQPZrrSKC7QFn3dQ1DpQ6nbUOyNLTmG4ICxxoTkkaj3C830Jm9GAU6F2yrBTRxAY9/+0H7khQKA+QQwcm+e4tcRhSlZEYsI1tCYgU/kT62Ln9JaR5K7o0S5EDiG3xhkU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(478600001)(38100700002)(82960400001)(86362001)(36756003)(6512007)(6486002)(6666004)(2616005)(186003)(8676002)(26005)(8936002)(6506007)(6862004)(44832011)(5660300002)(6636002)(4326008)(2906002)(66476007)(66556008)(66946007)(37006003)(54906003)(41300700001)(316002)(66899021)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8V0yFpzzBNm9F2zRD8lPWg8izsFkK+YiY9RV5proc+HLSBqW4NwoFjzKYMyD?=
 =?us-ascii?Q?Hs+tN1S/XKdqviRz16IYX7oewBwmh4AkxBLt3c9zK7sHNIj2nARUnp/Ffofb?=
 =?us-ascii?Q?+3idY6gmjXeOAJsGVHB/B/FaEMeFTkVWkTe+jkjsBITuDWmcGxil+6vHyfeM?=
 =?us-ascii?Q?zs/Osma1nSm2k6o84b46wJOhTIwI6milatpM+rPYzBvCSyPhpUt/dRWtBPUq?=
 =?us-ascii?Q?iqLFeytPR0EUfxjvIciVPGRuwJN24HxW6cYAjHIwjXdfnRWIQtaNfHBkPbRl?=
 =?us-ascii?Q?j2XtGpoSg3QiRXeHg2n3sF/Sk6RApo1h+HCXNzT7gWsoxYQalP19dbCrqINj?=
 =?us-ascii?Q?jS+lOdh4akAb/tk8+NCr+uf8lmZd9DaFWMcTcXi9FIvd8hqAp66bjadDXC8R?=
 =?us-ascii?Q?npMp2vhGjNFG8G0UWSuBbFHHem6cUpxJioeOa407ve4ukqW6/uQtEtO+i+yP?=
 =?us-ascii?Q?hEWFxFUAhfRoLpo7ng+uSzU+zhYe4t5vKi1Xg/31Dc7RI+Pr2C7lfMeZ8hQo?=
 =?us-ascii?Q?dqFGEXlX8lxwobroT4O0pCEke3L/bRMEBUW7C83nNyALu0b1C8H3qhgtoGWy?=
 =?us-ascii?Q?C8VI7N88p5M9aYVPC8E2btR8B4m2HSFFyIL06Vj5wxymHMULC/BofIeQ66SE?=
 =?us-ascii?Q?V6+xWeGAxa07fUWMDxvPHCGJLBVbhzvuTWhp8jhgaK25IJDbZLAYkJhLK61w?=
 =?us-ascii?Q?ljpuT0QDRfCA9LQF0o85g7RrKIrmU/006gxIlVlp4mt5cGgoPB3j7x2BbFiQ?=
 =?us-ascii?Q?M/PX9dpZnfjbQKw+1VJbvvPlm0UvK0eCoEwy8eiVcnjIwBoRVtx+y0dvMGYl?=
 =?us-ascii?Q?NBl82KX00uVHrSJe46+3epn5drMuxsYVEWyuHuoG/NPgRJVYe8Epf2sGPghj?=
 =?us-ascii?Q?bV3ITlsVoPDb85kVb29XRwnDELhFZ39cWLjVi6ndW0/kMwyZVjAGCI6eiQZL?=
 =?us-ascii?Q?16gtIp67eFtsSqMwYREGw6aFhsJkXtQ1QNuZ1dha9+hxRhse6nQKHIKIyCj8?=
 =?us-ascii?Q?WpAApaMPJYJ085+4ROOC6WR/CSPHMNNHCgmUIWmGQWNu/urf2y/4uhdIhmI6?=
 =?us-ascii?Q?ltLrOnidNFwhOiFOAVlTUZnWwVPwa6CRs9aWJefS+hR24++kUOE/kA3km1vE?=
 =?us-ascii?Q?ryTy8zAk0a/N8dfsbGVebMVWJdMaTxl6YFbVcPTacT9/gnq9oKmAIyoC8Z6t?=
 =?us-ascii?Q?rVfiFoC4b9DueAp402rj2eB5VGXWisF62icDUntOMK+hGnh6QW+XcAZ9VFHK?=
 =?us-ascii?Q?kHQ8DloGvxqVcJffLa0gyFlBLUpfQVkOkQn/inc87ILvrRJyZgcs68QZ4JEq?=
 =?us-ascii?Q?wVLKueqfC/1HfY5gBOjti3hc2pimFP7QR8EBqu9saUuU/nCTGKulJ+Lt24iV?=
 =?us-ascii?Q?mwSg+XIts+J0WtQF8taV4r0eqkttpw/Gs9+CEmnwCTauRpgnbXszR1ALs3/n?=
 =?us-ascii?Q?0KLfqfD9K/dSRglcLs9hTH45Vpc/7KK3RZf8sKA35JZODvAfHne2wY9K2/3E?=
 =?us-ascii?Q?+Y8jbSGoMFPrnONgJ0ht1jqPwxDjpFSjVIT1DtPNWYoIze1XLGqm1pIwQGpg?=
 =?us-ascii?Q?uv7O5o5sdkmWkJqRpwNAWwdve6fkul04J62ldr4s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 147df5f8-da16-41f1-5d18-08db91f63485
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 18:44:43.6605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kj35iFSHuPFCCmwl8zRttPRyksUBxHMExZX45U8BumcbNM5AA8ngxKc1MA37d4TzpE+3kv6+iDmdQVGy96gRXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v15 05/10] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 02:05:24PM -0700, Matt Roper wrote:
> On Wed, Jul 19, 2023 at 09:38:07AM +0100, Matthew Auld wrote:
> > Any kind of device memory access should first ensure the device is not
> > suspended, mmio included.
> 
> I know things already went off track quite a while back, but it sounds
> like this is taking us even farther down the wrong path.
> xe_device_mem_access_get was intended as a place to hook in things like
> the ugly workarounds that we used to have on early PVC steppings where
> we need special care when the CPU might access VRAM.

Not actually. mem_access was created with that PVC case in mind, but that
was not the only case.

When dealing with that case on PVC, we couldn't easily answer the question
of how to ensure that we take the action A on *any* kind of memory access?

Then the request that came from Stuart was to design the driver from the
beginning where this type of question could be easily answered. And that
we could trap any kind of memory access.

Runtime PM is another place where we need to track any kind of memory
access and ensure that we are resumed before any memory access happen.

> Although we need
> to be out of D3 to access VRAM, we shouldn't be using
> xe_device_mem_access for general D3 management that's unrelated to VRAM
> access; we should be using actual runtime PM for that (and then
> xe_device_mem_access_get should either have an assertion to ensure that
> runtime PM was already grabbed at a higher level, or it should grab its
> own wakeref).

Well, it is true. We can do it like i915 and spread the with_runtime_pm
wrapper everywhere along with the mem_access and force_wakes...

> 
> As far as I know, we don't actually have anything that needs
> xe_device_mem_access right now (since we're not supporting old
> pre-production workarounds for PVC).

I was the one that removed that workaround and decided to keep RC6
entirely disabled on PVC, but recently after discussing the possibility
of keeping PVC ready on Xe to remove the force_probe protection I entirely
changed my mind and I'm planing to restore the workaround and to enable
the RC6 on PVC.

But besides that, if we end up removing it, then later we cannot answer
the original question like we couldn't answer on i915 for PVC.

> In theory we should be able to
> just rip it out of the driver completely with no impact as long we're
> handling device-level runtime PM and GT-level forcewake properly
> everywhere.

We do have a big impact in the runtime if we entirely rip that out.
One of the most difficult part of the memory management is that any
eviction/restoration coming from inside the runtime_pm cannot grab
the runtime_pm reference. This work is one of  the main reasons why
d3cold is not supported in i915.

The mem_access infra is allowing this in a very easy and neat way,
and taking care of all the locking, thanks to the awesome work that
Matt Auld has done here so far.

> 
> If we're too far down this path to fix things now and want to just
> repurpose xe_device_mem_access as an alternate reference counting layer
> over top of runtime PM, then we should probably rename it to something
> that more accurately reflects what we're using it for now.

Yeap, okay, this is one of the things I am considrering to be honest.
I have a todo item on my plate that is to spin of the mem_access from
xe_device, either to a specific component or embedded into the runtime_pm.
And then add documentation around it.

One thing I like about the 'mem_access' naming is that the purpose is
more obvious. If we are cooking a patch that we know it is working with
some sort of memory access we might take a look to the mem_access
component/calls.

In i915 there were many many merged regression on many cases because we
were always forgetting that we needed to run some memory access
'with_runtime_pm'.

>  And then we
> can re-add an actual memory access layer independently if/when it
> becomes necessary to deal with future hardware ugliness.

As long as we are able to easily answer that original question easily
I don't mind the name, or location of this infrastructure. But we
definitely need it.

And we might just go with PVC now anyway.

Thanks for the comments here and let me know if you have more
thoughts with this perspective in mind so I can adjust whenever
I get there to change the mem_access layer.

Rodrigo.

> 
> 
> Matt
> 
> > 
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_mmio.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 448b874c7a3c..8d0f07261bfd 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -483,6 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >  	 */
> >  	reg = XE_REG(args->addr);
> >  
> > +	xe_device_mem_access_get(xe);
> >  	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  
> >  	if (args->flags & DRM_XE_MMIO_WRITE) {
> > @@ -526,6 +527,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
> >  
> >  exit:
> >  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	xe_device_mem_access_put(xe);
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
