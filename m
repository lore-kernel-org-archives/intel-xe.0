Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03722C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 17:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7930210E217;
	Fri, 28 Jul 2023 17:56:17 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F8510E213
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690566971; x=1722102971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7l9svmG1VRPR5O4BvI4LwrRjxKp7cRoNlC4s/VaCUMY=;
 b=HW5cgN0rzWQeAion8ufpBbk869vimvI3G41bJukRCEHkA2z31+xYOw7r
 TCC7SbfpyfKk9+I7wgle1vx8CMsK/AUrOP+6h0KYCBmzdkbgIxNPaqt4E
 QtNM5PoqvXl+QkTCez3+OP0eZ5BdqewF7Gl4X3n+6m8Gf1msCm4N+J032
 KIHnDyotSp9RXXHaVHakf8svwCsmifpSe+kPyISJWz16tl/nhHm8Xdti3
 XmeeXBkRjlHm/El+i+Xbh1yKMROJ4zWH66y6MsJVIXiHD/bBwQMP/Tkhy
 djL6curCAI+hEve6U9zHfP2uF5UVIWtPaWPjaIXFot3fA8jVmXGXbASOj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434937742"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="434937742"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 10:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762675725"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; d="scan'208";a="762675725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 10:56:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 10:56:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 10:56:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 10:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2gDx/oxR1kvE0e/Q+HtAmGd81JkQF9Ph4KLRIajbE3G+BC7lZCCzuoyjZl3Jz4VFtd9WSC6rOP9dif6bSh6OxTgT2M6wCa3NkYoButJW3wGto/vG7BGsNvx5JZX+BffJJRJ+I4gwvfPSkpMou7daU0bR6x28Y/5UHBj6icyO3HbY3PvvUXEK7OvJ5Z5KB5+8/y8bm4Ash6qDmWJIHU1UcGZ5XaaJoYXEKIgoWV3swalAHU40iEFouz4hC/zDdaCSfnrlEW7gmu79mhfPCfhn4HQVpXuCisdllOb5PmG+nqrp4kTsiSIZROOVs9SqdMvEycFjpsrUnYmZQENSrV7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6OO1+Hkyoo7LnBSznmtYgxQGniksvn4kRyJM5m1SOY=;
 b=TZFnIB+jfetLKxgACYjbuKyXLEV0GchKMhT94mg51L8KlEBDyD3tzIXEjrdes2NUU8Jn3dIeXS5P1YROcZ7dStALx5rJHAsGxrJRBnX7zfgs4+jjuGzUKVUVg096wYrILsPDrOajkZ1ZZ4uKuiVNwIqMAgmJgIkAtarrsapDPsuK8wDbNeujvKSUV6awcH/eotKblhRSqFYdjye9/Bzh/brU7WAaZV6Kgrd4z0ozMicvCSZ17abfO126VVL9Aw4vtQASXcSEQn0LwrH2Q2mcutwFgqUhfGK2dafZYTNjF5yiPEIUJ6VDx+w7sJDDA46+mbj319QVtpZOyQBny3GbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 17:56:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 17:56:08 +0000
Date: Fri, 28 Jul 2023 17:55:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Mishra, Pallavi" <pallavi.mishra@intel.com>
Message-ID: <ZMQBB41YR0JPoobR@DUT025-TGLU.fm.intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
 <20230727013958.456502-3-matthew.brost@intel.com>
 <PH0PR11MB578228FB488A05EB8EEF5CD28206A@PH0PR11MB5782.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB578228FB488A05EB8EEF5CD28206A@PH0PR11MB5782.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:a03:54::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae8298b-106b-4908-0012-08db8f93ebcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myA4rRG43JQkN6Kl1z97ojwIWwwclBK3FwGeo8zPsvQomB/UT6nDjd4virp8BLE7Qfolb8RqCOQIZ1JM9iC1FQVW7oqG4aURRCV0htE7WFMks88+5pXrGrWlB1SHqH+/4gyEDZOIZguCJPlsygapCZPggh9mZ6mqNDzWT6b6eyb5ApKAr1w+RcfdvenuGa1fUnotYYFKdqx+SoJ5fbUMq5V9GtnxM+SchlcjfPE6kKHYaV+FEwCUBMw3qnOzaLSpqc2As9EeWdzqCp4KzqA8KgoGdI+DC+K86p+zAVJADZwkUkCMH0ye82AvHro/cFNzUnsVQTt/U11IUnhQIeh0Vk3xCsbmEV1YoqqLHO29bUUF0L2CHOoeUlzyFLw1K1TnJFdSg+BG9jW+VBiOUoUhsa0Jn2g+ChG1R4DDKaDlosqo/Jfy/cw65DhDoTbiYi22h5rPdo+6etda4YwW0Ox+d0v7Mi1RYntUv/i1vP0aJqfnNWDECGjnhzTS5xRk2VbBTzMjGYujdMygjHg9yrmAtUzW41RcRIg/lxJjgVUcMD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(478600001)(6862004)(5660300002)(8676002)(83380400001)(186003)(26005)(44832011)(6506007)(53546011)(86362001)(8936002)(6666004)(6636002)(4326008)(316002)(6486002)(41300700001)(66946007)(66556008)(6512007)(966005)(66476007)(82960400001)(30864003)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7EDZo4tfIrwK/8oQDbXk3thkHkQe1yCjC0jywBCEvR/jf3fWR63dF8wfH/9?=
 =?us-ascii?Q?JJHRYvZrnDGtcJ/VX7gSHrleY0FfqMODQHdCc7Y3ZLKmEVFQfbsy3OVVSmuF?=
 =?us-ascii?Q?/T1nMlMKsmALF9NPUTU3MeyH3U2K9WSS6FfFmBzaPcJludfb00la7QPsMfgg?=
 =?us-ascii?Q?/ZMErV7L7STc3VEAnBupXZdqKWbC0dff3bvn8DbH7o5MlkPaz/SKjxDsx1HF?=
 =?us-ascii?Q?8MtORWMsUlZEaAFBO3gcwiUOuCBM7Dx5yCQQhLSeGFn3YcaAtqTf9IM1fI4v?=
 =?us-ascii?Q?ld+K5OK3zkAIStET+n6zTh6vanmDNqricnT0tVawmpf7Ij+BXNHSUrs7Lg2i?=
 =?us-ascii?Q?jx0N93Gs70LiaM0iU6cz9d5kTXOus6+yTUAdam8Vn5ztow7JAABKlrM/Zvjm?=
 =?us-ascii?Q?i81HSDg6HzwEX3r8Z+YX0JIgTgzlZsqhZ6Ci4ma2FA2N+/AXoDJJueQq1arj?=
 =?us-ascii?Q?TJtBT6FYh5aATsCoyI1nBjvYIWrZVmIMm3mRIE5fXFsEnvW2OIB/09d1V0N0?=
 =?us-ascii?Q?1Yus5HYqGq8vgkxghHGk4oa7UwVtU98B5eh49fUU/j+HSyIBPRy9MCZSM2jX?=
 =?us-ascii?Q?ZALHt4HapyJwFDcA9VnaJ2kswgsSaTLclFT/elScdKE3J3+ofC5aIXhT6+Ij?=
 =?us-ascii?Q?4l0Ni3TOk1VnOv+LcYkBlUfeZf5HIFqc0B7eJ5IQgqfBPExy6bkJE4YgaTq+?=
 =?us-ascii?Q?5RLnAOeqZsDs6H6OAamNGV2aJmRh4kGE4xJFevw+DOLxBseuUwLf3ApvGz5N?=
 =?us-ascii?Q?TH+sn6vXBL9xYcMElsK9R+fMjrfYd21TTg34tqzZ1pPNpEnCHwtNbPA4z/T8?=
 =?us-ascii?Q?C597Xt3+eIOHnjKELOXW2C2ax482ADA3NdPIKnoFzvWWJbAFS18qpXG0kMov?=
 =?us-ascii?Q?Zr+GcppwSGYfq2jAcAj+7nOpgvtXWb00QoXXZajvxnjwZhuTa4sWjxfGohYX?=
 =?us-ascii?Q?lg4AZhJCgBiWZCracpBQnNWatCIC64IHJ1lETLCb4ko+Bykgo7ahUDl9zOsd?=
 =?us-ascii?Q?SbgAAqz3xNzirrjOAXX3yKUa6iJRilGuRfD0CtSRxuEjXozF0HCcOxSApZoG?=
 =?us-ascii?Q?Sn3UcUUa9Mq/biM3SqWXgPlgpBhZP//Ysc7mxu8D23ng1Bm560MpMRLT5c1F?=
 =?us-ascii?Q?bGItgai9oolZ16VAiyNeKW0XMLffJf03prYrBg/NN416gW254Jn5iPITuTYR?=
 =?us-ascii?Q?erjIpZS5aORmeQIW/rAaLhILIrCFLJYo+ROteqjbLLKHrs3SWuiA46A5xfdJ?=
 =?us-ascii?Q?SH4DYYWWEdNHELNw7Dr/vTVj68Q95TWp4TgTihE8eAWgoPDMzU9nRUbpwR6h?=
 =?us-ascii?Q?PzLQHAOX4JCK4djv66R3s+0c29pt/2sKByeL9oaiImChgQmU3Cr/JzUicuLf?=
 =?us-ascii?Q?nJoq7TA4QEtd+QKU6keSY2J4p61Vk8v+13HXeIrr3QJq3628kZTpMlrlu/We?=
 =?us-ascii?Q?/WLzXtsgu2vZqLHkb6OXtGPSvOeEkNTdhOsJLE0C7OFoR+6BlmbH5FUZcbFv?=
 =?us-ascii?Q?OtlKjIZkVQvQmjo7KgQoY173UEpGhiRmxQ86rZd7G3XSuQZhcBLuyJ9XRj+q?=
 =?us-ascii?Q?FyMs+onwAiLU+/rYLAgYU+UJJgwqO7edRbc2qWXdqzzdL2Fx+GzQzCqktcL/?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae8298b-106b-4908-0012-08db8f93ebcc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 17:56:08.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2L2hk6XY839HxXy5Y4bhpjIGm/o6DqJ3iQWMbtCsHXQuo9jaEgxdFdcgkepXMufLaet5PEFNFkeOArJ8AtaWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
 ordering
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 11:32:58AM -0600, Mishra, Pallavi wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, July 26, 2023 6:40 PM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
> > ordering
> > 
> > A case existed where an out-sync of a later VM bind operation could signal
> > before a previous one if the later operation results in a NOP (e.g. a unbind or
> > prefetch to a VA range without any mappings). This breaks the ordering
> > rules, fix this. This patch also lays the groundwork for users to pass in
> > num_binds == 0 and out-syncs.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c       | 75 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_engine.h       |  7 +++
> >  drivers/gpu/drm/xe/xe_engine_types.h |  6 +++
> >  drivers/gpu/drm/xe/xe_vm.c           | 44 +++++++++++++---
> >  4 files changed, 124 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c index 1c6b84f32823..bef82b40a097
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -135,6 +135,7 @@ void xe_engine_destroy(struct kref *ref)
> >  	struct xe_engine *e = container_of(ref, struct xe_engine, refcount);
> >  	struct xe_engine *engine, *next;
> > 
> > +	xe_engine_last_fence_put_unlocked(e);
> >  	if (!(e->flags & ENGINE_FLAG_BIND_ENGINE_CHILD)) {
> >  		list_for_each_entry_safe(engine, next, &e->multi_gt_list,
> >  					 multi_gt_link)
> > @@ -834,3 +835,77 @@ int xe_engine_set_property_ioctl(struct drm_device
> > *dev, void *data,
> > 
> >  	return ret;
> >  }
> > +
> > +static void xe_engine_last_fence_lockdep_assert(struct xe_engine *e,
> > +						struct xe_vm *vm)
> > +{
> > +	lockdep_assert_held_write(&vm->lock);
> > +}
> 
> Why do we need to pass xe_engine above? Do we intend to use this later?
> 

Yes, see patch [1] later in the series. Also goofy to have a function
xe_engine_* that doesn't accept a struct xe_engine argument.

Matt

[1] https://patchwork.freedesktop.org/patch/549491/?series=121401&rev=1

> Pallavi
> 
> > +
> > +/**
> > + * xe_engine_last_fence_put() - Drop ref to last fence
> > + * @e: The engine
> > + * @vm: The VM the engine does a bind or exec for  */ void
> > +xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm) {
> > +	xe_engine_last_fence_lockdep_assert(e, vm);
> > +
> > +	if (e->last_fence) {
> > +		dma_fence_put(e->last_fence);
> > +		e->last_fence = NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * xe_engine_last_fence_put_unlocked() - Drop ref to last fence
> > +unlocked
> > + * @e: The engine
> > + *
> > + * Only safe to be called from xe_engine_destroy().
> > + */
> > +void xe_engine_last_fence_put_unlocked(struct xe_engine *e) {
> > +	if (e->last_fence) {
> > +		dma_fence_put(e->last_fence);
> > +		e->last_fence = NULL;
> > +	}
> > +}
> > +
> > +/**
> > + * xe_engine_last_fence_get() - Get last fence
> > + * @e: The engine
> > + * @vm: The VM the engine does a bind or exec for
> > + *
> > + * Get last fence, does not take a ref
> > + *
> > + * Returns: last fence if not signaled, dma fence stub if signaled  */
> > +struct dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
> > +					   struct xe_vm *vm)
> > +{
> > +	xe_engine_last_fence_lockdep_assert(e, vm);
> > +
> > +	if (e->last_fence &&
> > +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &e->last_fence->flags))
> > +		xe_engine_last_fence_put(e, vm);
> > +
> > +	return e->last_fence ? e->last_fence : dma_fence_get_stub(); }
> > +
> > +/**
> > + * xe_engine_last_fence_set() - Set last fence
> > + * @e: The engine
> > + * @vm: The VM the engine does a bind or exec for
> > + * @fence: The fence
> > + *
> > + * Set the last fence for the engine. Increases reference count for
> > +fence, when
> > + * closing engine xe_engine_last_fence_put should be called.
> > + */
> > +void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
> > +			      struct dma_fence *fence)
> > +{
> > +	xe_engine_last_fence_lockdep_assert(e, vm);
> > +
> > +	xe_engine_last_fence_put(e, vm);
> > +	e->last_fence = dma_fence_get(fence);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_engine.h
> > b/drivers/gpu/drm/xe/xe_engine.h index 2e60f6d90226..0aae12ed06ef
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_engine.h
> > @@ -60,4 +60,11 @@ int xe_engine_get_property_ioctl(struct drm_device
> > *dev, void *data,
> >  				 struct drm_file *file);
> >  enum drm_sched_priority xe_engine_device_get_max_priority(struct
> > xe_device *xe);
> > 
> > +void xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm);
> > +void xe_engine_last_fence_put_unlocked(struct xe_engine *e); struct
> > +dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
> > +					   struct xe_vm *vm);
> > +void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
> > +			      struct dma_fence *fence);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_engine_types.h
> > b/drivers/gpu/drm/xe/xe_engine_types.h
> > index 4949edfa0980..9ca19942d72b 100644
> > --- a/drivers/gpu/drm/xe/xe_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_engine_types.h
> > @@ -52,6 +52,12 @@ struct xe_engine {
> >  	/** @fence_irq: fence IRQ used to signal job completion */
> >  	struct xe_hw_fence_irq *fence_irq;
> > 
> > +	/**
> > +	 * @last_fence: last fence on engine, protected by vm->lock in write
> > +	 * mode if bind engine
> > +	 */
> > +	struct dma_fence *last_fence;
> > +
> >  #define ENGINE_FLAG_BANNED		BIT(0)
> >  #define ENGINE_FLAG_KERNEL		BIT(1)
> >  #define ENGINE_FLAG_PERSISTENT		BIT(2)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 77723f680f37..3e420b2c12b4 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1366,6 +1366,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	if (xe_vm_in_compute_mode(vm))
> >  		flush_work(&vm->preempt.rebind_work);
> > 
> > +	down_write(&vm->lock);
> > +	for_each_tile(tile, xe, id) {
> > +		if (vm->eng[id])
> > +			xe_engine_last_fence_put(vm->eng[id], vm);
> > +	}
> > +	up_write(&vm->lock);
> > +
> >  	for_each_tile(tile, xe, id) {
> >  		if (vm->eng[id]) {
> >  			xe_engine_kill(vm->eng[id]);
> > @@ -1518,16 +1525,22 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm,
> > struct xe_tile *tile)
> >  			     XE_CACHE_WB);
> >  }
> > 
> > +static struct xe_engine *to_wait_engine(struct xe_vm *vm, struct
> > +xe_engine *e) {
> > +	return e ? e : vm->eng[0];
> > +}
> > +
> >  static struct dma_fence *
> >  xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
> >  		 struct xe_sync_entry *syncs, u32 num_syncs,
> >  		 bool first_op, bool last_op)
> >  {
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_engine *wait_engine = to_wait_engine(vm, e);
> >  	struct xe_tile *tile;
> >  	struct dma_fence *fence = NULL;
> >  	struct dma_fence **fences = NULL;
> >  	struct dma_fence_array *cf = NULL;
> > -	struct xe_vm *vm = xe_vma_vm(vma);
> >  	int cur_fence = 0, i;
> >  	int number_tiles = hweight8(vma->tile_present);
> >  	int err;
> > @@ -1579,7 +1592,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_engine *e,
> >  					     cf ? &cf->base : fence);
> >  	}
> > 
> > -	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
> > +	return cf ? &cf->base : !fence ?
> > +		xe_engine_last_fence_get(wait_engine, vm) : fence;
> > 
> >  err_fences:
> >  	if (fences) {
> > @@ -1678,6 +1692,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  			bool last_op)
> >  {
> >  	struct dma_fence *fence;
> > +	struct xe_engine *wait_engine = to_wait_engine(vm, e);
> > 
> >  	xe_vm_assert_held(vm);
> > 
> > @@ -1691,13 +1706,15 @@ static int __xe_vm_bind(struct xe_vm *vm,
> > struct xe_vma *vma,
> > 
> >  		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
> > 
> > -		fence = dma_fence_get_stub();
> > +		fence = xe_engine_last_fence_get(wait_engine, vm);
> >  		if (last_op) {
> >  			for (i = 0; i < num_syncs; i++)
> >  				xe_sync_entry_signal(&syncs[i], NULL, fence);
> >  		}
> >  	}
> > 
> > +	if (last_op)
> > +		xe_engine_last_fence_set(wait_engine, vm, fence);
> >  	if (last_op && xe_vm_sync_mode(vm, e))
> >  		dma_fence_wait(fence, true);
> >  	dma_fence_put(fence);
> > @@ -1730,6 +1747,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  			u32 num_syncs, bool first_op, bool last_op)  {
> >  	struct dma_fence *fence;
> > +	struct xe_engine *wait_engine = to_wait_engine(vm, e);
> > 
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -1739,6 +1757,8 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  		return PTR_ERR(fence);
> > 
> >  	xe_vma_destroy(vma, fence);
> > +	if (last_op)
> > +		xe_engine_last_fence_set(wait_engine, vm, fence);
> >  	if (last_op && xe_vm_sync_mode(vm, e))
> >  		dma_fence_wait(fence, true);
> >  	dma_fence_put(fence);
> > @@ -1875,6 +1895,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  			  struct xe_sync_entry *syncs, u32 num_syncs,
> >  			  bool first_op, bool last_op)
> >  {
> > +	struct xe_engine *wait_engine = to_wait_engine(vm, e);
> >  	int err;
> > 
> >  	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type)); @@ -
> > 1893,9 +1914,12 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct
> > xe_vma *vma,
> > 
> >  		/* Nothing to do, signal fences now */
> >  		if (last_op) {
> > -			for (i = 0; i < num_syncs; i++)
> > -				xe_sync_entry_signal(&syncs[i], NULL,
> > -						     dma_fence_get_stub());
> > +			for (i = 0; i < num_syncs; i++) {
> > +				struct dma_fence *fence =
> > +
> > 	xe_engine_last_fence_get(wait_engine, vm);
> > +
> > +				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +			}
> >  		}
> > 
> >  		return 0;
> > @@ -3028,8 +3052,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  unwind_ops:
> >  	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> >  free_syncs:
> > -	for (i = 0; err == -ENODATA && i < num_syncs; i++)
> > -		xe_sync_entry_signal(&syncs[i], NULL,
> > dma_fence_get_stub());
> > +	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
> > +		struct dma_fence *fence =
> > +			xe_engine_last_fence_get(to_wait_engine(vm, e),
> > vm);
> > +
> > +		xe_sync_entry_signal(&syncs[i], NULL, fence);
> > +	}
> >  	while (num_syncs--)
> >  		xe_sync_entry_cleanup(&syncs[num_syncs]);
> > 
> > --
> > 2.34.1
> 
