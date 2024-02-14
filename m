Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F290AC48BC1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 18:05:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2110E8E9;
	Wed, 14 Feb 2024 18:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfGhZ99D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DFD10E969
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707933917; x=1739469917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TVn968niyS1EeT0T31frTvc/Jma5h397W+0QdZHjCdg=;
 b=TfGhZ99DKv0NbMrjUYtCUMaQFbYp2M7dqBuRD5SeslA/mkBouuA+dJPU
 49u06HI6LBUU0KJ/JqMEEj57KPPUe0YWRKGpDRo7LlsR/ZYTLuKoomQbj
 ej/PM+J3W9cwi3+2MXlSrRpCP1Dc8hgdl0SBJ6OnHHPRaCnCdAJXeMUKU
 I8NCrZxRwLuD4xII65nZ4UERWAS5xl7frrNJ45KN14LhaXdCkSHvcxZXF
 7pBgAeA6IgIcvBghVUsQRIczzmFHzPDR8Sb8FzWLtOToWueONX+D4pU+H
 jdBvfLycE9xPwawt5IW6+7FdV+yOA67Frfxy9Vjfbc/pSm75JnOH0S3b+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2137332"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2137332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="7924733"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:05:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:05:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:05:15 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:05:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:05:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVCB/ilb4PDr62RvV2BopQUfYDsnk8IWZH6ccYxDYjAFZf4WQvkN9tXy1RI1RLWLtbn+srlFGs72OpacJquYpi1hNSrAEFfb2ZqC+bzLu9EFlJ3OAftfQ+35e4okje/O7l0uSvS6jfRxGofc93bMTUbsu6vQAXDnMxt/cWJZrubiuKSz7Q6w5N8Wme4CHqmUNrlVD0fuspiCJeG/j7m0Jn5KcrGigkZAC6t2OSZnmrngXbVQPrFZYk9E1ErmdHs9u+HuePg0ugepUa2hUTN1mlOvMb6DGJWZ1i9ozdsZsW5ivb7uFxXkNw17NqI03bU2ByzLes0ZyI987HGqMm/2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXRRJiHy6pmKrnRhj6n3izWMMUafZz6Y/qtH45Ie2qc=;
 b=RlrNFX40UDoifK9/Y+ZMT23XzWTCqE+KmLJvxCtWLeqfkU35QzZD6sAL216HLgSlHVj7Zqnj+bWRRRIKqW2VdGTBAI4MJ9zICL048jK45NaMxbNo9zYprdJWLvFwVKdwnKGEZ6Osj+Ff4+OrtLk6mwtt8xGiefX5+FMbV6yNEMi+eIBE9sEP+lRHOqU9kYG41pXeyY4Z4NBri95/+a49/1qHPP0FfbtkxGO0W93bBiZPTOq45BWwCvNxm0JOf7VuDNGOLFzJak8+MN757PPdJFREsGKNoAoR54JmEzdu7EMmxoIRnAyBOJ5m6Lwt0+m3kKtqNr1iYQmqhhq5BqIq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5645.namprd11.prod.outlook.com (2603:10b6:a03:3b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 18:05:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 18:05:12 +0000
Date: Wed, 14 Feb 2024 13:05:09 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC 03/34] drm/xe: Fix display runtime_pm handling
Message-ID: <Zc0A1fSxFFtJ0uVk@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-4-rodrigo.vivi@intel.com>
 <ae9804f0-8188-4cb4-b4e5-c50a1a5101d6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ae9804f0-8188-4cb4-b4e5-c50a1a5101d6@intel.com>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d86d981-de2e-4512-1952-08dc2d877d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CN01NGB02HTImC782cbWZ89+2wtztdSwSB4tj5ob0MW1XeRkilagTrZ+Z83yGqa7jWo/YnqDpWhiHF0n6POOYaWeBpPAFMzv7VpTBK8oRp956ryBIDRoR+I3EFXtVu+rfJeGeLU2lx5KaD+LHY3/QDAWRxIZknBG+xKaj69ysu3PFErQKendCA/eqYt2zTG1nROob0EOKtVwxSh4P54BfQGz56FsL8mPn5Ee6QsW/XkMe0U8c5ffnuZ2dPwgqbQDiN2uzZKZCXLeqhUrypKANeGygYQHQnJIdYXQvGLaChm/EH0sUfOEkcRRSB2ntau1/sJNfgXs/7pbzODVojpVKzw8eRzcTeaIdzA67jSs4elkKr7t6YIzVzmZl4Cmo6TYQ0xVBDuJ7lgjxXh7si90mnYEVkbQ7u2/B2HgDcEpDpywoqW304wesNK9Dqm+ZdZwj4O2x7NKPMfMclZli12Bo689wHTv3R3tMkmR1RNI1W/HJPrU9YRZ2anr3daRXTHCl1fi34hEmP+JKqhOcJI3Rgf3jBOglZjee6UTqLAoTUUd3qz9QaVs2A27eelr70ox
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(6862004)(316002)(37006003)(2906002)(5660300002)(44832011)(4326008)(6636002)(53546011)(66946007)(66556008)(66476007)(6666004)(8936002)(8676002)(26005)(2616005)(86362001)(83380400001)(36756003)(82960400001)(6486002)(6506007)(6512007)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1BoMxh2+5qSKx3n5zSbjPCWCGmefJ71wNgmD6yWG4CnWm7jbCxiH8DM6+L9?=
 =?us-ascii?Q?52HoXjjrQCJCfraNALARBVQJy+gmoLNuEiESgWTTcIQ9UO+ugLC57l3vKr4s?=
 =?us-ascii?Q?ug6lyHjvNbYW8csZBu8R4ZnpmzfjaxyPkannT1q7afstBWlFT88sPU6yZX/3?=
 =?us-ascii?Q?p6L3t0hkZj6WlkftkzVaRbA1IOHB2PCCSM2z0OSz1COr5n0TnukDi2RtQtaP?=
 =?us-ascii?Q?IDRITslhWz2HadDdE1coHjADB1L2Gyvr9MY7em2C8U+Htyqxf7pe8+m3bw8f?=
 =?us-ascii?Q?Kjdv02+cIJjh2hnJowRcw+95G8ctw0HKAa7LAYya7gvM6MF2/YQFW9UhlFpp?=
 =?us-ascii?Q?XHszvereXFsVpYDVeMLSAgOPvA+eE+i/Xx1n3qSsCi2Wlwn9xEG0/GDrQC0K?=
 =?us-ascii?Q?iwJryd0nl24YoqupjVNoXIEfZk8KkvkfeTf/9F1oqA6el8J6egz63hyIQjnd?=
 =?us-ascii?Q?E00kYBdVAd2dIB3vDvQKp5oJ52ZZkefE32ogoARxiYrf43pbRLyriag8v1sN?=
 =?us-ascii?Q?GXaMq3DTqbvyD2LGHB/44xy8aNjSyKRnohNZDSPcueJgfn/QBsWb3Nw6xdTg?=
 =?us-ascii?Q?c7AFkQgxvwpRj2NuebS59F1tutdJVe2nsWvoEpkN6M9gqiuaYqbmZU1ZhkMY?=
 =?us-ascii?Q?E0zzq8r810JaoeDFbB8HXbXiEi+gRpE4UhpKlBqowr+NFLNqI79gDYWUfSOF?=
 =?us-ascii?Q?d/m8jWnzjBL5PipMbP1aRv6huo+ZNrwKJ4ha+/F1p2ooKtEVOpqI0bSWcDJo?=
 =?us-ascii?Q?hoi7ZYIw8MTD7Cb5yjyIMnjaAFLpDI2WjoZ2VmeVMbEtvM6U6X6mfWRlEEOC?=
 =?us-ascii?Q?dDXR8VM5WznkziAhbzfCGVTtPNWP+GJKauprRFXYj0UaSsyqZ+4rjIq2UWbl?=
 =?us-ascii?Q?cWG7b1A4VU6JMyad/Wsk3axrmcjqgF7V2oOBza69Yjx0MB0l+uiqURhkvArk?=
 =?us-ascii?Q?/SXXrX+pLQmBsuG9m321iwbotTMLKUHDyx0akt576qFdtH/K6Xp3BoZCHFCj?=
 =?us-ascii?Q?Jc2S77HC36R+BJCReMovANVUiQWzJPWIwImLnXuZ2/qZGG/XjSgKsLlWBW7K?=
 =?us-ascii?Q?gpo660v7yUtdgXfhbm4rm+1pgBhS2xGEFNjE6NxMJ4khT1YaLBCOZENt1mUR?=
 =?us-ascii?Q?5NVNxnQ5gQ2iUYCnYwlQTq30qLHvbqD+qjdsLJ6Y7HWOBLrFiCpx89HMvy+u?=
 =?us-ascii?Q?79ZDy825KVxj0JvcB9ecadlDk+cxLoVIDnA7MF2SFteRalPcgtR8uKK/+R5q?=
 =?us-ascii?Q?uahKItpuxP1wTCqiBJwFlY7JD4YdA1YQh6EmQT9pNSQ1w5rM8ZYhQAlWYDPQ?=
 =?us-ascii?Q?RlVPuTy1vdQeaLvRknDP861+rJU5mxTd/yjlijjEVq0xjjUNEcuoB/nafMYd?=
 =?us-ascii?Q?7PlNT4Ln1i89fbso3et2z4aFbutkdoN8PoE+a9FAPdEjYtJTLfk70HxUtagV?=
 =?us-ascii?Q?jU3rlxdt1gOKrntm1bwtVMpul4poH226fSjyOuoRZs7mEgvrFCvh3MdKSblU?=
 =?us-ascii?Q?xEyntvWZgNuteVvK2LT3r8UPjKBs4BUj7BxQ+4a5+Kw3ngu2o7RWb+L5b/XA?=
 =?us-ascii?Q?qHiKcu0AmnuFT7TY18tcEN4RLlCR0t7FkAU/R0um?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d86d981-de2e-4512-1952-08dc2d877d30
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:05:12.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qiYZEkDXGng9aD/q7tCyyCZGtKMdioC4zK4SReffBf3R7uZepfgRL71Ru0pzqAG/ZBIL7VumUchlmGs3PDvxXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5645
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

On Mon, Feb 05, 2024 at 09:11:37AM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > i915's intel_runtime_pm_get_if_in_use actually calls the
> > pm_runtime_get_if_active() with ign_usage_count = false, but Xe
> > was erroneously calling it with true because of the mem_access cases.
> 
> Good catch.
> 
> > This can lead to unbalanced references.
> 
> Is there an actual imbalance here though? Is it not just a case of being
> overzealous in keeping the device awake when it is not currently "in_use" vs
> "if_active"? If the api increments the usage count we will still decrement
> it later, regardless of active vs in-use, AFAICT.

Indeed.

s/This can lead to unbalanced references./This can lead to unnecessary
references getting hold here and device never getting into the runtime
suspended state./g

> 
> > 
> > Let's use directly the 'if_in_use' function provided by linux/pm_runtime.
> > 
> > Also, already start this new function protected from the runtime
> > recursion, since runtime_pm will need to call for display functions
> > for a proper D3Cold flow.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   .../gpu/drm/xe/compat-i915-headers/i915_drv.h   |  2 +-
> >   drivers/gpu/drm/xe/xe_pm.c                      | 17 +++++++++++++++++
> >   drivers/gpu/drm/xe/xe_pm.h                      |  1 +
> >   3 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > index 420eba0e4be0..ad5864d1dd74 100644
> > --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> > @@ -177,7 +177,7 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
> >   {
> >   	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
> > -	return xe_pm_runtime_get_if_active(xe);
> > +	return xe_pm_runtime_get_if_in_use(xe);
> >   }
> >   static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index bd35fe9f6227..19f88cb7715b 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -417,6 +417,23 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
> >   	return pm_runtime_get_if_active(xe->drm.dev, true);
> >   }
> > +/**
> > + * xe_pm_runtime_get_if_in_use - Get a runtime_pm reference and resume if needed
> > + * @xe: xe device instance
> > + *
> > + * Returns: True if device is awake and the reference was taken, false otherwise.
> > + */
> > +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> > +{
> > +	if (xe_pm_read_callback_task(xe) == current) {
> > +		/* The device is awake, grab the ref and move on */
> > +		pm_runtime_get_noresume(xe->drm.dev);
> > +		return true;
> > +	}
> > +
> > +	return pm_runtime_get_if_in_use(xe->drm.dev) >= 0;
> 
> This is doing atomic_inc_not_zero() underneath for the "in_use" case AFAICT.
> If the usage count is zero it doesn't increment it and returns 0. Does that
> not lead to an imbalance? Should this rather be > 0?
> 
> > +}
> > +
> >   /**
> >    * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
> >    * @xe: xe device instance
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 64a97c6726a7..9d372cbf388b 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -28,6 +28,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
> >   int xe_pm_runtime_get(struct xe_device *xe);
> >   int xe_pm_runtime_put(struct xe_device *xe);
> >   int xe_pm_runtime_get_if_active(struct xe_device *xe);
> > +bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
> >   void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> >   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
