Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF3FC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 20:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393210E6DC;
	Fri,  9 Jun 2023 20:15:54 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1954F10E6DC
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 20:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686341753; x=1717877753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1+XZsbGfKsRq6Hu2i91k8D5YICOgdX6VMDLhqngL+TM=;
 b=ZObtOYqPgyYKfaHlXIGKp2qLx+SWz+faXkHC7SuN9nw3QFJTCf9QQMJE
 IoQrMenTBDZmPD2AysM+IqQCBgf3E4M1y0WuaBsMBQL0ta9lEXCoOGoeS
 Pj6X7tOI46dWZo+rfcvRr/W4gcv0lxzw1zY8i2lhseY9EfOIlmpPLDWdy
 v88w23E8tcNvlOL1odxSCK4BBFBA5Im0uVU2LrkoAiiEm5P0ua9snIYbZ
 2H/ya4xh8T+6cbA9Us2oReB0D9hqzmnCF9y9DEaBSZoeabfAW3RfcsawK
 dc0Q/3emftBXq4Apl/5zYaWm0vpe+Lq5Qw8+Ac+niAQu3IH3rT6c+7krL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386048412"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="386048412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 13:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834762039"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="834762039"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2023 13:15:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 13:15:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 13:15:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 13:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXH8SUkI1s98Bnb6ZXGwhkvmz3N4QItpVx9w+BnPEzH+BPNzBg+rbJfYHDQ0fJMQMmeUrV04eN/ezQyfvHQ+BxYJvnyn5PGr3JO75yushFhSQ6PMpMJXc26dyRU/gZJCPdulsn8ErKvOP5lbj1kkNhwL7pjh1DZqYRn0siVyLNepjLJHmbyZRJZNT9NXwTKXGLX7fqWHhvp9kTdoOnEFOJ4R/UaRj5XH2irwvYyeIGwdEGkpPIle+57vklTFNiTSFEYAQdfM6mc0ilFq5D2F9IeXiGqI6Er/O+xs1AJwe5H3Rizh5qZWzv0zKS7BYoSXTXkpon3WV82zyyf79bEhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQCe5glehRCq+LikwlbpfHiHmQmIONXBg4W/YnVrt4I=;
 b=A80T6Z4WHoUr8emrHBNbd0Ysar2Sgx6xYlIcwYEQPa2JtOlfop+0VxGKsXjzV1JsDkNWy/tLR32IOJqN0PP7FC5TZ8wx95GkbieG8bG3d+ufJha+e4trB6FGyxEh/35zWIYz+h/ZwchqDsok8R4L9+ZqYNdnMVOvooPQCAYJAJnt6FotLHcuxBF9dqtHzG1rmSBvWifYCTC1LXIfdoKlnExbTw5qSaMetrbLMKNK7z9ssPaao4lpmxC2H9SNLrUUc5gFjwTJjoDzt/9Aa0vwx9Q+jgdr47kr9P/MeiM1Oa/ymng/mHkFXYt2AuT2EdgTsQS10nUFsM23qlxAIyBhzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Fri, 9 Jun
 2023 20:15:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 20:15:49 +0000
Date: Fri, 9 Jun 2023 20:15:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZIOIUnJrijbkLcwv@DUT025-TGLU.fm.intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
 <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 503e5b5b-b2c0-48c2-14fb-08db69265111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTi7fn3zot9p6CX+fVQIoS8BfYmwXTVQ21c/ndJ6wBDSwyA2z0NCdK+LRvEKMB7XcNM/7OQHfyChIE+PrOeEohCSpdNYpAfegqQS1BTb7vU6okO4OX21YWJ4nK2+gCl0uXTqVBL9GWL6N8rLz44XlZCBH+zYKfqlWR+9tQuxfwkjDJJELp4hYlTs2HYlvEkS/DbMRtZ6lX2g6Z/EwRtUKVHjvFZFbpY/Fdxw7T3Q/aBkUfIUXSDDWW0GzdDC+DZRirVXkNHmLOjFXIKzQUnS2kB4qhgqN+UL4l6f5h0dw1XMYBDW0SYmqg55BsodupxxtnOdlfZLXQMqjyylmhOnHwREs5C7jzwI88t9gJDgmnXRG7zDFRuUwe854Yn/IidjeI4V3yTZ0ahSKAgbpilTvjWOiwpCnU1wfk7YvYAvYJgEe+oJ1+4TlbxraSh0wDO5wdKj/M7OJMcAiLQqfoilZ78xOPLF1wx66ZHV6Czwj7aeXRfXuN4yrjQF4EO6lpJEjk2AVbV3i3Og6ECyix02rQQGB6PwceoVHve8Zwfl21xVrvrr8LrISLCdekKACri9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(5660300002)(41300700001)(316002)(38100700002)(6636002)(86362001)(66476007)(2906002)(4326008)(82960400001)(66946007)(66556008)(6666004)(44832011)(478600001)(6862004)(8936002)(6486002)(8676002)(6512007)(83380400001)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q7a8CAvVCDUQkFoKXagwmxpPi7K8dAabONS4swjXZNLuFfKD9VNNrHIaeyPh?=
 =?us-ascii?Q?KbBIzTBMnaj9lw/z2I7FxaG46K9bgbbqzSAGlHOcPvbKBS61DKptl+QipsTB?=
 =?us-ascii?Q?w+rjEo6EGYk/KLsnzw+T6gB3DkFa8nUM7oxKPrpOoSNaOkBIYPTpsAIHLYgi?=
 =?us-ascii?Q?S2JalUOaUMLt9OQMGCw8P2dB4iGxoq9krSP03yGhg/rBHu0QV6+UFPrl4Hsm?=
 =?us-ascii?Q?Z6ueOc0bzqIhY8imQUfVBX8XY84P7U3eG6PNGVL+KlEMJaA6Nf0MIlKLbOaN?=
 =?us-ascii?Q?dwm0bYjqNVy06oN5wbaZzWlR+4n9JRRNb1TAYDcPeXxQV/JZbuoHroSuwMUf?=
 =?us-ascii?Q?64+I0B1YiNJjuISPjyWRwxBKuYwWSU9SmX1ZBXyB50aCV4xYHzzjrKMgWsPH?=
 =?us-ascii?Q?fgcbopL6UyhOXws4QlBnSsGl4FZMPUGbnqvKkov1TMLZqcT3VktpRHY9y43d?=
 =?us-ascii?Q?zslRhwfxjCaWHaBIiKW7TE764FIipdYHUk/fINELwrFfsmSZ0CYhbibt2sWv?=
 =?us-ascii?Q?YngTL/Ivr0Nl3z4qcuhMRWRPbu/1pDH15WcyC09YaYM1UJEp/EAYAUN6QEuG?=
 =?us-ascii?Q?/T5USjCtb93qPgCHEoKE7DOqUUFQnXt7IHY36Zae7q8bkHZHAe+jaGTevTPu?=
 =?us-ascii?Q?o2ChhmMYxLkZfMHlOPhb6NWSD18KWA+h2wTht3ySFmgN5RYoXHfj+HLOFk0s?=
 =?us-ascii?Q?osxiQ1UK0w5hufy7Cd4HzAqCeY+niOpSGsGXW0WOyoa0ol6ThkIrqaQSf683?=
 =?us-ascii?Q?FyDtFS6AjMi05J3uQNBLY+AfCTwsyi8peIPK9K7ej/un3ComBjW4/cwhhxHX?=
 =?us-ascii?Q?+vUtaJg3OPoE9Lqgtgj0S5c0hnpPoNkhfcxaj+p1jnpY/23puMiJ2Bc19CnW?=
 =?us-ascii?Q?yQSQX7+WUU8HfOPkHyE7ojK94II75EqzBha+CiJ3xrYk7OynkJdShTm0dKaC?=
 =?us-ascii?Q?nC2Dxk6otRXPmXeWx4tILlVc6ccmMuGID1L2ZG2pgDiuQyk87ptPnxGCFOr+?=
 =?us-ascii?Q?VQzFKrRwkM8KHNLu14hHU6XwbrBnMALEnaoeUHrZU8qzgnH7Nle9kvQ0VCNz?=
 =?us-ascii?Q?Fs1tx+uof2a2CT9IVRwuUgZEZKkU1E/3aOW+wb32paYaYSmZyNBvQnhBWZf/?=
 =?us-ascii?Q?bJcdFHGCcmTnJ8iE0Xlhp+Qnq46AzJbu8ixqOzqhfw29oapmSlW4i7vyuXBx?=
 =?us-ascii?Q?9UyO5UIYHrderyYo3ELPA3bzohu1e0IcKqxXoDhi6N2hDwp0IaVq8iKOznQe?=
 =?us-ascii?Q?x2hC1ACuGnEC51RM49hsX3mbgdHEZdVdW9gVAQtZXJdX1uaZQnwXyH088qVy?=
 =?us-ascii?Q?P5sUL7gLcmWziZ1qPAJpiiHnLZqbwFcJc/tRRkwYwg8angajeDq4JoBLg+3P?=
 =?us-ascii?Q?3MYh2F49P7SjhsZNnmWobFQwJh7GgRJOyZSSxc+M2gJ508qnNSdhE4vrrz3Q?=
 =?us-ascii?Q?iq3/XOfmkBDNRnLGnBPaeAbHkcy0FzNmJr7xoe201m+jUgq4dGceL89jiSr2?=
 =?us-ascii?Q?9UBfcDxaR3FaNT4dpWMXp8VC21wyHRxTub2JV3MdKh+FMgrtwdH0GGj/DZoC?=
 =?us-ascii?Q?E//9bpF0q0D3CFhsrQjiUaJhYKIKa2Q4VSt1uv4yHmtkWdZGV4dIF/tdQQax?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 503e5b5b-b2c0-48c2-14fb-08db69265111
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 20:15:49.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUy50sUpCQcq8f7M+ykdeP4OGEo3njX6pmzcj95LaEoi0iu7ayGFUz2htmvb1gBu7tlRbzaCHasrrsdjJ9qqgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7632
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Ban a VM if rebind worker hits
 an error
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

On Fri, Jun 09, 2023 at 12:34:33PM -0600, Souza, Jose wrote:
> On Fri, 2023-06-09 at 11:26 -0700, Matthew Brost wrote:
> > We cannot recover a VM if a rebind worker hits an error, ban the VM if
> > happens to ensure we do not attempt to place this VM on the hardware
> > again.
> > 
> > A follow up will inform the user if this happens.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c     |  5 +++++
> >  drivers/gpu/drm/xe/xe_exec.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_trace.h      |  5 +++++
> >  drivers/gpu/drm/xe/xe_vm.c         | 27 +++++++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_vm.h         | 10 ++++++++++
> >  drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h   |  5 +++--
> >  7 files changed, 48 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > index b3036c4a8ec3..b1f808c08dc5 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -597,6 +597,11 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> >  		if (XE_IOCTL_ERR(xe, !vm))
> >  			return -ENOENT;
> >  
> > +		if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> > +			xe_vm_put(vm);
> > +			return -ENOENT;
> > +		}
> > +
> >  		e = xe_engine_create(xe, vm, logical_mask,
> >  				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
> >  		xe_vm_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index e44076ee2e11..27c11812d733 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  	if (err)
> >  		goto err_unlock_list;
> >  
> > -	if (xe_vm_is_closed(engine->vm)) {
> > +	if (xe_vm_is_closed_or_banned(engine->vm)) {
> >  		drm_warn(&xe->drm, "Trying to schedule after vm is closed\n");
> >  		err = -EIO;
> 
> When banned it should return ECANCELED like:
> 
> if (XE_IOCTL_ERR(xe, engine->flags & ENGINE_FLAG_BANNED)) {
> 	err = -ECANCELED;
> 	goto err_engine;
> }
> 
> About how to notify UMD, how about add a DRM_IOCTL_XE_VM_GET_PROPERTY?
> 

Agree on both. But I think at some point we also probably want some sort
of messaging interface to UMDs to send notification when something like
this happens.

Matt

> >  		goto err_engine_end;
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 2f8eb7ebe9a7..eb89ac934394 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -472,6 +472,11 @@ DECLARE_EVENT_CLASS(xe_vm,
> >  			      __entry->asid)
> >  );
> >  
> > +DEFINE_EVENT(xe_vm, xe_vm_kill,
> > +	     TP_PROTO(struct xe_vm *vm),
> > +	     TP_ARGS(vm)
> > +);
> > +
> >  DEFINE_EVENT(xe_vm, xe_vm_create,
> >  	     TP_PROTO(struct xe_vm *vm),
> >  	     TP_ARGS(vm)
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e4311c48cc54..1966a583b761 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> >  
> >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> >  
> > +static void xe_vm_kill(struct xe_vm *vm)
> > +{
> > +	struct ww_acquire_ctx ww;
> > +	struct xe_engine *e;
> > +
> > +	lockdep_assert_held(&vm->lock);
> > +
> > +	xe_vm_lock(vm, &ww, 0, false);
> > +	vm->flags |= XE_VM_FLAG_BANNED;
> > +	trace_xe_vm_kill(vm);
> > +
> > +	list_for_each_entry(e, &vm->preempt.engines, compute.link)
> > +		e->ops->kill(e);
> > +	xe_vm_unlock(vm, &ww);
> > +
> > +	/* TODO: Inform user the VM is banned */
> > +}
> > +
> >  static void preempt_rebind_work_func(struct work_struct *w)
> >  {
> >  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> > @@ -533,7 +551,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
> >  	trace_xe_vm_rebind_worker_enter(vm);
> >  
> > -	if (xe_vm_is_closed(vm)) {
> > +	if (xe_vm_is_closed_or_banned(vm)) {
> >  		trace_xe_vm_rebind_worker_exit(vm);
> >  		return;
> >  	}
> > @@ -662,11 +680,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  			goto retry;
> >  		}
> >  	}
> > +	if (err)
> > +		xe_vm_kill(vm);
> >  	up_write(&vm->lock);
> >  
> >  	free_preempt_fences(&preempt_fences);
> >  
> > -	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
> >  	trace_xe_vm_rebind_worker_exit(vm);
> >  }
> >  
> > @@ -1127,7 +1146,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> >  {
> >  	struct rb_node *node;
> >  
> > -	if (xe_vm_is_closed(vm))
> > +	if (xe_vm_is_closed_or_banned(vm))
> >  		return NULL;
> >  
> >  	XE_BUG_ON(vma->end >= vm->size);
> > @@ -3048,7 +3067,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >  		goto free_objs;
> >  	}
> >  
> > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> >  		drm_err(dev, "VM closed while we began looking up?\n");
> >  		err = -ENOENT;
> >  		goto put_vm;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 372f26153209..858207a20017 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -49,6 +49,16 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
> >  	return !vm->size;
> >  }
> >  
> > +static inline bool xe_vm_is_banned(struct xe_vm *vm)
> > +{
> > +	return vm->flags & XE_VM_FLAG_BANNED;
> > +}
> > +
> > +static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> > +{
> > +	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> > +}
> > +
> >  struct xe_vma *
> >  xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 0f5eef337037..76458f8d57f3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> >  	if (XE_IOCTL_ERR(xe, !vm))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> >  		err = -ENOENT;
> >  		goto put_vm;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 76af6ac0fa84..566b67abe1c3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -178,8 +178,9 @@ struct xe_vm {
> >  #define XE_VM_FLAG_MIGRATION		BIT(3)
> >  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> >  #define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > -#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 6) & 0x3)
> > -#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 6)
> > +#define XE_VM_FLAG_BANNED		BIT(6)
> > +#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
> > +#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
> >  	unsigned long flags;
> >  
> >  	/** @composite_fence_ctx: context composite fence */
> 
