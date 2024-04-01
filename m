Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD1DCD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 19:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8473C10F441;
	Mon,  1 Apr 2024 19:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6wtH+To";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFD110F43E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712000222; x=1743536222;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SbSRtMGJpp7BxiSnX0JwrtY+cjtzNv8WaCtv8saey2Q=;
 b=b6wtH+ToOJEOkWXTjue0fzZRRRD31RNorK+q7HutZ2iCy/oFtlaM5GEm
 Nt8jh5ITY/jS0yTVK+CtQk70wdrcE+zrQZOuQ36wYTTItyEoyV/xm1QZ9
 WZ8rhNTlLQ0HrrymdT258yjMsvd+1PLVCJD5FJqFrne3QpuYOlbBUdOly
 kmvihdQaC6tOxggxNtdY2e2MUf417l9jbRJlidUF45f2/rQA+faIl67/L
 jXxTdfZZfC8xtNMPrvfTXByDs3YHtPxurhgHluruVxhVC4Y/dY2rkjTne
 ZiZLWiubv2Fc1bdeiC+9NpzTlusb9MECR6IlTFGU4JNWJqHVvfpOVV/WZ A==;
X-CSE-ConnectionGUID: 3KRJAeP/SR+5kiJW5HkChQ==
X-CSE-MsgGUID: yTZ0NvNFRoKsoCxbhcEX2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24637582"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="24637582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 12:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; d="scan'208";a="22273998"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 12:36:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 12:36:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 12:36:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 12:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sua5iHonvFvqQ/N/Ff5V5uvwcyFG4mZMLNuKhHiO0y84JVM+FRf8hB+1jCtdjycqIoaz3jFQO2v6KtYYMwOZnih78bQjznNl5QmbiUdXjyd8UlpZoB3nz5+MeRoO0R8FZok3xU0cqy0jcrwkh1rana6eCMUlJsrOZXpnFsbW0OfyLH/ZiYyktKB/LUU780M3lz6Bg7lx6D9dDiK3TAMsEOwEr090jmSa+FqhKsbt4HyVGb2B/2J6Lui5db6TPXrM3AaPaMtT4tJOPzeNNm7Za5rD6AwqwMZaJ9RAIgWov0YH9Kia2emR6MmSS6CGHRAmVS2DaBCu0tKuyLI8LW7zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z6cEe+5nV6W5lD5e3aDxcbqxgmE6dWzbmcMTkUdgZc=;
 b=micYFEgOZ8y7CYqXsgnuvX1SV5N9dpZN7z8bVckREzWR2mwFWV+FZLvQ8DHFew0Gm2s1zTe2oNxXeUSA8eGmDczST8gN6gRY+8jENAX37jwqUCVPp9dpIjyrkS7zFHgwdQDW/UVklAoc1KjXAw2COOV9wWbMB9go//q62eMF+y4nasNNZ5cmIdHJ/2hEIx1C2Qzw2kEuZhZ2j8OllqJxL/JWH6hHJteIpUi6ksndaL9/yRKs7Bw4r+VcHlkYUMqXkfqXyQZxLgA7ZKDfMqhGl6fLHiVTbTR6Ic5vyVAI79lV95mZlgT3c1yL5o78cdN8ZCYIjLmpcf6JO8zpQLvJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7168.namprd11.prod.outlook.com (2603:10b6:510:1e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Mon, 1 Apr
 2024 19:36:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 19:36:52 +0000
Date: Mon, 1 Apr 2024 19:37:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Use ordered wq for preempt fence waiting
Message-ID: <ZgsNC3oP5x2SpNO/@DUT025-TGLU.fm.intel.com>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <20240328182147.4169656-2-matthew.brost@intel.com>
 <20240328185648.GJ718896@mdroper-desk1.amr.corp.intel.com>
 <ZgW+a4AV0vd+Klop@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZgW+a4AV0vd+Klop@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0129.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7168:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cC+8czKJrLBqj7s6VWWxkiyerguD+aYT6L0YthiwH2qXav1OuZZbYTMMUthnFxir+iIl6b6n4VGJkAYh55q3oUMzIAVegYJXee/gnaMuwL8Cof/9rUvrf82CE9Y+bUUU00NcwUAmAlBaU3Apx2wMTJueDUafI7gIfR/V6i/M4YhN4lf3v5PobaRP6aGe1px1dIJpltoqV4PEaQd+wlsWqDy3Kcue5+yAB9xu0g1/myjcfJREeL/Rsy8L/XgsmNNhBfLdu2CcuT9trbH3cb9I+73BbBl3g0EfWiCsm9gxPnEXj9SzasbaIGLBVsUHvGezhtY0w+Izbpgfmk6cT9nFgnBMJiV+ds7tGpFc0iv2ExIR3P0CLNc34EK3eVKNFbQnjcbDRquO1BgbXHMLJuTsxDLDWPo6W/N9+nZdvZh2oDUg4BO4uRuF7zHsCfFQhHFOSH5D6qnQBuXfazNlp0z96PtVKjhH9icUUI6VHWBzxQ4gfT3P7B+I7d9/40R4CwBL22Fw3cXrBetT9kcIEpNr5uXaGsIhCj0TxxjkNl5KVVTHYsC7OA4C+JEkL70Lk+f/Mm7Wj2wO5teUa2mDeFlHn0CC7MXdXAsWex6XP9FDAJuBYeSkFmBEMkixRlpmOokvYTP+21KO1sAS8Fslx8MUFUjLldPisrhMa9iSgqZ78vA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pZI4vhbLsL9sLEUgVIzKuufzASl012PH2cN/vTwgTTeCYMqaekhlA+xXt3Hf?=
 =?us-ascii?Q?7KmYWaTjAcKl9qT/cv4U43lSiuP4vHDDvkuTplJmttSmVHfyoyjO9Q8+9EhK?=
 =?us-ascii?Q?Oxp5uqts76Z8JWSCA/CZvAEZbqZRAUDNFIAkwJLUYKm4zUFmKBUe8aRGwPXM?=
 =?us-ascii?Q?52MbpRl8iiFr0VA0GNA3BtXNJmNYaijbaYBJbD8ijJtQwYGiep2W7FoSIPsh?=
 =?us-ascii?Q?LS87yYSJODCLfVvP5kfO+jDKaEx6y7koXNIIq1xATTF11pXmCbFFTJB0jAs1?=
 =?us-ascii?Q?Ufxk+QS027gMr0XDIJ/NgobeGHli2s95TjMQUFNOvI89khTp5opjo2W6PJur?=
 =?us-ascii?Q?w9sRxtTJPxF4Bc7QltMDRcSHadDqN2bdDV/TQ3lG2IdJLBg7cYcmLygcyncn?=
 =?us-ascii?Q?sYg/L8J0Zyr4maPno1sLe4pbPC9p4xd8Gz8diWEVb4xExTrsH5MwbLxWrQuu?=
 =?us-ascii?Q?eSlRojpq0bsW9zK1REEKP4nOq4VACetE/En12miDHBQZKa8Kf6rbr4FrVlvL?=
 =?us-ascii?Q?atdEEHNkyMUUM5LkaHVfkTMeyhoov/femX0PwKNJOq65Lb6fltqZUKWn1AlR?=
 =?us-ascii?Q?kTxFgHmdBWu/B2ylsYiW//t9EVJhF/RQBKiHPdgRuDEkuUnK+ye7HR5cT6r1?=
 =?us-ascii?Q?z4GGvBPhVEDv/C4PRHzfnjb+Fb/DB9qhWid/oW2VvOUDk3qTWDjaIF7bGmBj?=
 =?us-ascii?Q?x56nLECH3QP5u3Du4gnEn13PZOzj8huhuzpiWJJqqUshn3Oic6f8GTpT+sRb?=
 =?us-ascii?Q?9i6E1rtD+6ZzH9bd9Jq2p0g6MxIPzFtKfL3rMQJk1JhgtDubZd1XnWndj8Rr?=
 =?us-ascii?Q?3AUJeiLw9wRofkDwyw39Kc7VAx/yVfTNHG15tS7Rkauk5gbv9Ss6XOpVGn7I?=
 =?us-ascii?Q?KHn1T3Ma6DWcS15SHTPwFYkW1Tsiuhonm3QAikftiWf9TPAvYwPEF8pwsK5g?=
 =?us-ascii?Q?zFD7rQHB9DBbj5f+8/6iMw75VVDIv6MK+lolLHOQrl5d9wNqQnXPBjiBI0kV?=
 =?us-ascii?Q?4ME0Eqc0cmS1uj9Zp9OJZeXN/l1//CDwkyX9XJpLMATapAXY4VoVp2Zw5y5c?=
 =?us-ascii?Q?GJLR+pwl6Cbb47OrhnCiKThH7hZzlAXm52eBKZ8brhOKCVz1asjTEFavSJUK?=
 =?us-ascii?Q?pIkjswaepV3CwfrKOVo7+P7r31o6mTEXWbquEgTwqGWb/bBxceaU91cgntU+?=
 =?us-ascii?Q?9IOoVoynIhOrdu1D3KGi4A8kD4nayaHxUeTf5Jmuhg8iGfojWqBwgd4jWASy?=
 =?us-ascii?Q?grjrF/XR0/tbXqNeotLmFLfbCSFRnGYXG5c/x5zlDMV5Dqa+yuHozx7OmuMU?=
 =?us-ascii?Q?lfOfmZF/91mXIsifH2OCWhKQojEZZKyVJsYVzO7nc5iYRltbdB1s/bNkUNSR?=
 =?us-ascii?Q?zFbGHt81YwBF0IDeSHlAllLE5+d2t/fdU2TDgTThCK6HnKwRlnne2cty8iOk?=
 =?us-ascii?Q?dXFeF1Yv629G/dCPDwzbH+dG6mS2eil5Nr8/ffoiRcuFn2LmkK8vagezvjzd?=
 =?us-ascii?Q?R/8oI04eoK8g5l5LUCZR+H6KzirOh6dxjCOBsAY/iSBuBuB7ve546FGpiyiK?=
 =?us-ascii?Q?THB0Hz7Hik05d2SR+xtMxsFZTzzxS0PdypTSmA7owOU//MwLwUtK2gfX5iq8?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 755a97fa-4940-4d42-5aa9-08dc528314b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 19:36:52.2729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTY/JhrhCV0lxgyWNOfKvf/M2ECyUWJeGslddVLGQ/fIdT+Odc0hUp087lzS3qatPLOIRFhqP7uR/PLk13zEcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7168
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

On Thu, Mar 28, 2024 at 07:00:59PM +0000, Matthew Brost wrote:
> On Thu, Mar 28, 2024 at 11:56:48AM -0700, Matt Roper wrote:
> > On Thu, Mar 28, 2024 at 11:21:45AM -0700, Matthew Brost wrote:
> > > Preempt fences can sleep waiting for an exec quuee suspend operation to
> > > complete. Use a device private work queue to avoid hogging system
> > > resources. Even though suspend operations can complete out-of-order, all
> > > suspend operations within a VM need to complete before the preempt
> > > rebind worker can start. With that, use a device private ordered wq for
> > > preempt fence waiting.
> > > 
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c        | 7 ++++++-
> > >  drivers/gpu/drm/xe/xe_device_types.h  | 3 +++
> > >  drivers/gpu/drm/xe/xe_preempt_fence.c | 2 +-
> > >  3 files changed, 10 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 01bd5ccf05ca..559bd72fde57 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -226,6 +226,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> > >  {
> > >  	struct xe_device *xe = to_xe_device(dev);
> > >  
> > > +	if (xe->preempt_fence_wq)
> > > +		destroy_workqueue(xe->preempt_fence_wq);
> > > +
> > >  	if (xe->ordered_wq)
> > >  		destroy_workqueue(xe->ordered_wq);
> > >  
> > > @@ -291,9 +294,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > >  	INIT_LIST_HEAD(&xe->pinned.external_vram);
> > >  	INIT_LIST_HEAD(&xe->pinned.evicted);
> > >  
> > > +	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
> > >  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> > >  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
> > > -	if (!xe->ordered_wq || !xe->unordered_wq) {
> > > +	if (!xe->ordered_wq || !xe->unordered_wq ||
> > > +	    !xe->preempt_fence_wq) {
> > >  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> > >  		err = -ENOMEM;
> > >  		goto err;
> > 
> > Not the fault of this patch, but in cases where some of the workqueues
> > are allocated successfully, but at least one allocation fails, is the
> > error handling in this function correct?  It looks like it might be
> > leaking the ones that were actually allocated?  Same if
> > xe_display_create() fails later in the function.
> > 
> > 
> 
> I did notice this as posting, put this one together late last not night
> quickly. I suppose I can fix the work queue error handling in patch too.
> Let's make sure we are that the actual fix is good first, then I'll
> respin.
> 

This actually handled by calling drmm_add_action_or_reset with
xe_device_destroy above.

Matt

> Matt B.
> 
> > Matt
> > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 1df3dcc17d75..c710cec835a7 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -363,6 +363,9 @@ struct xe_device {
> > >  	/** @ufence_wq: user fence wait queue */
> > >  	wait_queue_head_t ufence_wq;
> > >  
> > > +	/** @preempt_fence_wq: used to serialize preempt fences */
> > > +	struct workqueue_struct *preempt_fence_wq;
> > > +
> > >  	/** @ordered_wq: used to serialize compute mode resume */
> > >  	struct workqueue_struct *ordered_wq;
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > index 7bce2a332603..7d50c6e89d8e 100644
> > > --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> > > @@ -49,7 +49,7 @@ static bool preempt_fence_enable_signaling(struct dma_fence *fence)
> > >  	struct xe_exec_queue *q = pfence->q;
> > >  
> > >  	pfence->error = q->ops->suspend(q);
> > > -	queue_work(system_unbound_wq, &pfence->preempt_work);
> > > +	queue_work(q->vm->xe->preempt_fence_wq, &pfence->preempt_work);
> > >  	return true;
> > >  }
> > >  
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
