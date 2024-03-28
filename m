Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142ECD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 18:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA474112520;
	Thu, 28 Mar 2024 18:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghAt2h/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B080112520
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 18:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711652392; x=1743188392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EryLK8UOtOAGn5+p5/8Dj1JRsW7GFxpJw6fdLrHxVq0=;
 b=ghAt2h/gT8J34jEDgISFEHDQRO6xEVcjWyG1eu7DXWcEIHuKDu3sYQkG
 MxEZmAt7/jptp8Jd4D17SvbmCxfMpoD5hFwk2zLAQkRjpkLacYEoIUMgQ
 Vskqq2LK3zSnNf1aYDqlNuGVycH7A83krLMuovJ3suVepj4oPF28qDzns
 JxOzTlCPfo7f37NEb9wWfUm/sSB0l/CVfOpxend32GTIMWI3xuEd/pb5e
 gX8YF9hwxR79KxnETLzCrrjeV8SAgPSemQubpFxT7t32+qFJru8kGJ7OF
 I3kEa9Tf5ANmXrz84OQ6pA6mfC7wJABzyQclB1X7U9zrrWN1LAq7I0uQW g==;
X-CSE-ConnectionGUID: T6C6q1VoQIKVgEyl0AMUKQ==
X-CSE-MsgGUID: uvA4lO7KQjuylGFnUB/G4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18208412"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18208412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 11:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21245775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 11:59:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:59:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 11:59:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 11:59:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 11:59:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmZhrkaQZEtmXdI1u/5xVvGAwXx0bd7hDzsvBikMbakAEresZezZrYe9D9mEHrBWWxVRmx257KdbruyJtuX13CI1c9suTWC6+CdwpgL1uE/hd6wOffFVxYeYQ4erhg3xTFmQAJZaezlpfPgmJ/S64oKY1CDtXCqR74L89toZzU4+dYWunktruO6TR4cdPjhQwXXCNhcnAYEH7cEjEVAj8/ftnNiPYrCRrzjMky/HM30t59M8nGoSYoGgTqG/8NNKzN08BMDN/tJN2IXqj9AKbc9ceAwYMmdxKSZMAHujbkd96HcykRBdF5dBdGB7YfU26JIDvJCxRacDraM3Aij+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mWigQTH2i2JPFWrvCkNBhq4syycptgmLer4v/Z1tW4=;
 b=G4WgMy0wvTCsWO119uAODTD+CxCzgBNCPY3BeBGTqogzYPaBbsmxvdVrTWCpZGcS0HNhXPZS8PnbnFWK8ZOUwt9Q7oGydrZSLY0xoQFjZMKzTQckZUTTnqB9iT+HwrqjdTOukl2i4hDH+Nqf5CqJbr4kJ4N+zZhbj04wu6zwQhJpYGc7Cg/4byCtXb75lz4leIu63q08EKCfD/7k60HvDsBraBRjort1EmCONeV8VhH2q5aKEJ64otTTG9qZzV0fZV6CDoLWyE3dUygakD9R5QKTbnd6kSLcEru52xuDjE3DjE3kKeKbqKcacU6TMqm6hojI/mVqo796Aq5zxqqCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 18:59:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 18:59:48 +0000
Date: Thu, 28 Mar 2024 19:00:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Use ordered wq for preempt fence waiting
Message-ID: <ZgW+a4AV0vd+Klop@DUT025-TGLU.fm.intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <20240328182147.4169656-2-matthew.brost@intel.com>
 <20240328185648.GJ718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328185648.GJ718896@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW5PR11MB5763:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjsTagzcW3zoOeFH3ebUSkA2OWCtWFOYSNq+Jr3pLFQ4WsKJQ1PxVX+s2LawgBf+rfOAnjHdrQndfRTxvZRqjdBqsK1/kZalBLYjHxa8ScCKIdqd7bJEbUldhUvP7uReI21HfwpkNCUQeRRx8L1O4V+wR28ADQ8WUfhdWuXiVxuBTzFtBMPSDQzTsAiDvFDgej/0+Ttzrhvla63n1JGbgUf1+xtxSEDLS+e8VKkjFHJOdJBBXhoW11JupiILcNHNCzWkjvv7jo0LMfe3SD6RWSRDEq7wgJuuPfSQRawiOO7XcJ8AclJ5TC87rGEc1mngtptopHO+uegIrnZVw0yQPABMzY5QjFjV/TzWzatWZTMQXoyeoqQ4vZeDMzszkWuz5OfXxT2hUXegoUQAgio8QWWWkRPQeHiIGos2JwAnMy7FC4xiAgVLkxb2UC4xqf7t+4XhGzDesrVV24PpIftDX4mX0K89A7+oCUd5nKL46TofiQA7v8yB2agMr9iBUibCJ0PyD/7JvokHwW6rV/GoS2sL7glp9nB5jLTGj+QziNfr+lZ8bRgNuDbp0vKcSZIF/If4MAmtVtu9IF2I8xX5fk2UWe2201vNWLmwa/89ExRhnYHj9x1jXxE7gh3xdIFj/OUucZ3rwup7mK3rRzFBZvXmJQE4ATR+TMlOGAFsDiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2WXHcYsTB3xr6R9iKX4ZMsv3LzTIvUUfF11HJTHqlqfpdo/knmwvc4JgSaYc?=
 =?us-ascii?Q?1Uks9blDg8BOeu+s+MbfX7z2LN3xuRTsUr/UJjoFhU91sC7owPMHg9sWQX77?=
 =?us-ascii?Q?oaSb1SNRFe8pRXPT9hEN/E+XPdGls26tbYHJmCYTifzuwlylYJ1MqRisdplS?=
 =?us-ascii?Q?1sl7zvWxRcykvX/byWElZX9NaLzmEE8byoe7goybVTgHuX8NNsCBAd4oO7Hr?=
 =?us-ascii?Q?GcDBrsnLkyes+85eIKIpvHIUPSE7oOqYuwVBVydk5xxIa4l8tRh44paD0bmo?=
 =?us-ascii?Q?nLIuWByOw/3WPbB8094lu4dyx02La96ttgQEHLZYOu6bZtgJhZW4l/0rfONe?=
 =?us-ascii?Q?oyTjNzVSBTF9u0AAJDFfBxiU6J1fKHjLJeno6ps6KlBJpXiItNUBCk0y1p1l?=
 =?us-ascii?Q?dzjEGgfeHhhMXY0cygKvlpbh/3b0wjpqRKf5TPDGoHrklk6zQXZ4Xnz/F4T4?=
 =?us-ascii?Q?sxCZ65pKDmTYPa1rGxd4uiOdqKwSZKyLfW2RN0eM58lY9lOV7nLAvf6u3z5b?=
 =?us-ascii?Q?o7qOxU66NTsCyBh2nT7JsOEPpBzCzQhwXiW4PY3xeyCBQdPsjjrVsDXiO+wi?=
 =?us-ascii?Q?qg76yCTBFqwfBmEBg2nJR8KtE5l0I7hRKQfZoVLGDuPq5V8CvVrogzeaKd25?=
 =?us-ascii?Q?8HtbShsDf327rmtGYmtevdu0BYsL54R2ClRZCtd+b1+mm4bECawI1D/Qw6it?=
 =?us-ascii?Q?t6gA60fY7Id3epwL94GzuqpqTxDAgVsTdI168TBTt8GwXPjI4wdQs/qkjnJ4?=
 =?us-ascii?Q?TClkUOyX6FPC1KxrAVGsr7NOFdvdXp46efhABqzzUDopE8zHmRr6n34dyWNh?=
 =?us-ascii?Q?jRhZ3/MAthmjaxZCm5AuzjdhAbTYEjzQY1quz2xCIaqKdoOPn5PuDNVAQgi/?=
 =?us-ascii?Q?hHH3fVPBFhAbRfoQdDnf2NtGge1pr2ocok6p2jijg/N+dkxVeeBVpUc+Hrhg?=
 =?us-ascii?Q?rtVQzKtPBwFtZ82vqkH8pmdqeXk9woVyuaV7a7TGQF413EFcKyyoZp3CXbnE?=
 =?us-ascii?Q?A8lxZgiNyAURiZgyVC/bB/2TplMu13UZlJWisIB+D/9lRCIcvE2VAyHYo2lO?=
 =?us-ascii?Q?/Bk2Jv/oFAo4iGm+kLIZ47J4yVGmOdg7ly8OCCBcK3m6HYTGqZyaowlBG+q1?=
 =?us-ascii?Q?0a9ZAXrXFSGKYgtuTHwduZ5dYKuXzB+VhGBbdAh9lqXs8a/WSixSvyXdZ7vE?=
 =?us-ascii?Q?CeXF4pvRKA7fb85ojaXcoAfrsZbMNZtSqVDwn8f6jB/iurU5BA/tH93vzHXa?=
 =?us-ascii?Q?SFOBpBejo5WqnVGFzLSbyq9XlqW4XnLTerLxqdx1ekUb5HodARhUsmwjxWWh?=
 =?us-ascii?Q?t+6LchoP/rLfMfiLC9ACWd8xQSM/X4s0heY+AIiPX/uYHmN0ARAi7UkRay1S?=
 =?us-ascii?Q?8y4zfOLZT4audM84NgCTmGHEvY8RYAjshJoufV1VQXX1rU8Y8YvyeryfOCT1?=
 =?us-ascii?Q?tpuK/dxePVe06rfTNp4jP1sdop4REfhBJ54/4F6+FA78ZvgmhihM6AnCJGbh?=
 =?us-ascii?Q?PI/G/ioQhF5rq0WeSjwqfxCzvnyZSIbE4i/oGiq+qVjpkN8DfmMd54exMcxf?=
 =?us-ascii?Q?3KNjTPCfietHReXytLaiQh2GqyFDmM2STqCpn0A71LyA3Tc4ThqCyektWSah?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5b7bb0-c32b-4d29-1dce-08dc4f593d57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 18:59:48.0960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsJM9NBazH3m/6PiBrWRb7FcBwhaen7oBQKzTgKxFcZ40pRAKnNXByXAD1CC/Y0bp6507aG4MFh4GKwdKZxb9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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

On Thu, Mar 28, 2024 at 11:56:48AM -0700, Matt Roper wrote:
> On Thu, Mar 28, 2024 at 11:21:45AM -0700, Matthew Brost wrote:
> > Preempt fences can sleep waiting for an exec quuee suspend operation to
> > complete. Use a device private work queue to avoid hogging system
> > resources. Even though suspend operations can complete out-of-order, all
> > suspend operations within a VM need to complete before the preempt
> > rebind worker can start. With that, use a device private ordered wq for
> > preempt fence waiting.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
> >  drivers/gpu/drm/xe/xe_device_types.h  | 3 +++
> >  drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
> >  3 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 01bd5ccf05ca..559bd72fde57 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -226,6 +226,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> >  
> > +	if (xe->preempt_fence_wq)
> > +		destroy_workqueue(xe->preempt_fence_wq);
> > +
> >  	if (xe->ordered_wq)
> >  		destroy_workqueue(xe->ordered_wq);
> >  
> > @@ -291,9 +294,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  	INIT_LIST_HEAD(&xe->pinned.external_vram);
> >  	INIT_LIST_HEAD(&xe->pinned.evicted);
> >  
> > +	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
> >  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> >  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
> > -	if (!xe->ordered_wq || !xe->unordered_wq) {
> > +	if (!xe->ordered_wq || !xe->unordered_wq ||
> > +	    !xe->preempt_fence_wq) {
> >  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> >  		err = -ENOMEM;
> >  		goto err;
> 
> Not the fault of this patch, but in cases where some of the workqueues
> are allocated successfully, but at least one allocation fails, is the
> error handling in this function correct?  It looks like it might be
> leaking the ones that were actually allocated?  Same if
> xe_display_create() fails later in the function.
> 
> 

I did notice this as posting, put this one together late last not night
quickly. I suppose I can fix the work queue error handling in patch too.
Let's make sure we are that the actual fix is good first, then I'll
respin.

Matt B.

> Matt
> 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 1df3dcc17d75..c710cec835a7 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -363,6 +363,9 @@ struct xe_device {
> >  	/** @ufence_wq: user fence wait queue */
> >  	wait_queue_head_t ufence_wq;
> >  
> > +	/** @preempt_fence_wq: used to serialize preempt fences */
> > +	struct workqueue_struct *preempt_fence_wq;
> > +
> >  	/** @ordered_wq: used to serialize compute mode resume */
> >  	struct workqueue_struct *ordered_wq;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > index 7bce2a332603..7d50c6e89d8e 100644
> > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > @@ -49,7 +49,7 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
> >  	struct xe_exec_queue *q = pfence->q;
> >  
> >  	pfence->error = q->ops->suspend(q);
> > -	queue_work(system_unbound_wq, &pfence->preempt_work);
> > +	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
> >  	return true;
> >  }
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
