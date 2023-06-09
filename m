Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135C1C7EE25
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 20:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34B310E6DC;
	Fri,  9 Jun 2023 20:16:47 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E28910E6DC
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686341806; x=1717877806;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3k/2wMWuBs5lqxraXC5yXdxT2GrOZwYwy/mDrSGt248=;
 b=jdFAHVLiq6YtRkxi+nR+tNoepkjAwDj7WsLDkBk6jVSDei744MtPXYnh
 X8V/j8hZbmTPgZPNgkMzBsS6wW8cdOaZ7PptAuI6Qrlf29JVguVxfm/Xg
 MzCDPgeAINUrQC9e7bUzGNIVuHaMsvkgScwD10DXxR4feF+ebQMEMxz4E
 VJLXmaLo1EvuUVO2NlqX5WZkWfCksxkdYriCnJPTfWVmIHN4U4aDDIl2g
 lmwdBpMsbRuZWxZMH11lvXhN/cm37mRkoW1luWS3mxQOMbw+Nf179r4x7
 OieHGkMXRnjeVb73hVkt+om5MTFWRXLAr1EduVOEGOW3vVW8lSfWHHRGr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386048626"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="386048626"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 13:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834762148"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; d="scan'208";a="834762148"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 09 Jun 2023 13:16:45 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 13:16:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 13:16:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 13:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntAf6RcQx68hdfV6N7fEfDM09d8SYxUIPV0ltw9J347LX3LXoP6v0Ha618Bt/gAkkoPIKmZo2WBmIiLxhMZ+s8UqwOYmmpxL7KkxOwcHhdSNB8QfUZU7zsI9+cmwxuVMeE5LssaBS9/aM78H2POfyD9Hz9oqsOxRE5TBnk/zWynh1ON+cnEeki5BMeYccizTFSEYpbaAJgWPZZTy1thIlcvAQ/zkNUUEDn6vAqlPr/7h29Fuatrlqey7taMGIMfOFvWNMNTg45vUJ0F8BtYYFEU6ZiWy3XYQL21CBLEYv6AfxvMBsnxFe0uQxu41K/iDyrO/tmpN+KGsSebV5ErUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhOETSqNnXrgs6woqm3WPdXV51NGtxrNQUPex7WSxgE=;
 b=id10ab7skcUM1qthJbvf2ZTfNaa39tMuRK8LmyCc4sNYuBXlutQqlNZOWNs9e7iLTBAjerJu9njI4eFWKoZbIpYsSYbecj+dxxWqG6JHe/CmU9aB6MI9N0OElikthM6sZ+J+GriMxhvxH20LfOT99h31iUAK5HEovccp6colFuOsrNQuMQ6bbyLVS739Czt2bozeUOhzTeBHEhYhhFxL0wKZPR/YVs0kr7Q+bLJPkUy7CP+3NNv5bFRTxn2UQOtZ3fyTxavokBfvsp0ZKm9+eJWQl5mHqtA0A94tjvX9YrH8q0fIGS710K2wq8t3/uSAXcmIrgwcMk5mFosB/31UGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7632.namprd11.prod.outlook.com (2603:10b6:8:14f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Fri, 9 Jun
 2023 20:16:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 20:16:44 +0000
Date: Fri, 9 Jun 2023 20:16:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZIOIiQePDAtHBuTo@DUT025-TGLU.fm.intel.com>
References: <20230609182627.143150-1-matthew.brost@intel.com>
 <20230609182627.143150-3-matthew.brost@intel.com>
 <e2ca5771a74135ab434e812d19c0a897a78d2449.camel@intel.com>
 <8e0681eb3bc88ff8dda8ea9636e6a4a330fb623a.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8e0681eb3bc88ff8dda8ea9636e6a4a330fb623a.camel@intel.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4624a8be-da73-4326-1a03-08db692671b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpPi/bY0DPFrzXEdde4rOLhCWt0yhCkmjhiR3jFz8TVMAFg/SiZQmDgGuVqCWc4jhxP53irjy1Cmr9IvzF1+dJeW0LT69ZAU2lFW5QPmXP1sBlb0yk5KR0Ax4zv75AGq9FN8NWt2EbyNdiGS7owzAUdU59ZhGTsygy9/fVtywA0b4rwXSPh1Ps/FsTXvDY2WGh9HWORBXj2vpEJ986mwSLe6XSW3d0a0NzCebq+0FNPTljhiXaSgAdWxX1+vNhIkbCMLx5giH7x0IJSwJPepqgghGNxWmDhGy4SxQMqZBxLHYw964HNVl+gvjjRjomHOkipmQbUbDi9lBIiE6L1RcIDdfqn9WRbN0enOUWfxnOFLMkEv/huagG45TRPJjchb4E2OLlaWUnhkSQSHdbSE5SuoUsLVnyQJeiMGO1oHuw7HbvLRToA65lqJvMA8kSQkzybfXAIhe6vyTaUJ9YvKrRdxjaHIW2tPC/L3L0VVkEFP8ur9wIzH3M8pynto9BlJNp6bWbU+afz7y33gNLO9TTNaiS74OEHaAoATQejo6F8Nz36lR3/9zBKq6DBB2ifq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(5660300002)(41300700001)(316002)(38100700002)(6636002)(86362001)(66476007)(2906002)(4326008)(82960400001)(66946007)(66556008)(6666004)(44832011)(478600001)(6862004)(8936002)(6486002)(8676002)(6512007)(83380400001)(6506007)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NgmFnUo4uX2zWcJPnl1nbnZVsAQPV/W4IxmmscLOx0wQ19TlnTHKe7AA8SId?=
 =?us-ascii?Q?Q95PZm9Q/GFLUD0FW3wGSoCsguhYUOhmLVYIQrxLF67dVdCfEIqLzoiDIiUO?=
 =?us-ascii?Q?9LJUxyxTpOAJ6zGIPot56KNZoqTRI4A9nyW7ZiGGhqBBz4isSOW9p2kfhgFP?=
 =?us-ascii?Q?mdcrOZXKHKRvweP0DKv980bGLLKMvKav9iRuvRLfSMPNpHKUr6JAxy5SgC/Q?=
 =?us-ascii?Q?0g0t/9+tq9mfZQemz4Cs/kKyz2wu8vR2Sr5ZEdaoyBipdvSShP7rk4P5M0mW?=
 =?us-ascii?Q?omtuOeHiY+hinB2jicidzrXVx+01hufr652/MEDk9EyjvVHPD73nMK6scYIU?=
 =?us-ascii?Q?IPin/BpK7LbeRXMP424nX1NgQp3j5RIczNPUfasNPdjkIWg0xXhQIlL2T7Fa?=
 =?us-ascii?Q?1+lr2fqX+XNJV9NQSVEXK9FLOaKpyNmT6+d4/SJagviSYjHhnlnSfSfb8hDC?=
 =?us-ascii?Q?uZ6ApDaue5biURXw4NwdLMioIzws5ZnwkvjpdAqJWXRMplPmcjsgDrJ4xvkw?=
 =?us-ascii?Q?dsxzdJDDl4hIBIDXP+yHQO29S5LtlgVz4ZQqdjhgsFVVb5HcsjRCZu5esDHf?=
 =?us-ascii?Q?AYO1l2qjsP5NH2i1y7Zl905Qnr8E01fmJZBqdQgxcYoASxYhnMaH3B0Zz2Js?=
 =?us-ascii?Q?A+MBCQiZR5BrCFMcSOsBd+3JXv8jJYbu5XIKc6uxu1AJz67WODAggatyvkW0?=
 =?us-ascii?Q?8iQmqXry8DwXkMxbG6DnL/0POrVHtXjh3FH0qQOy/Y27IQrKG44f9uF2cdKU?=
 =?us-ascii?Q?YD1oCSGk8qVbpbWVZS6/CO2fWoIUPWsKA2KFTs8kjpi7huAdDLnu185nLibh?=
 =?us-ascii?Q?1alLpUlWF7O9Ux4C7OB7LYZZNSxWVMLh9XQ5VlMK6ULX9ceG/fIjTM0I6td+?=
 =?us-ascii?Q?PY+uR1PRPYOniu7H/VAohL3vMG2j7MprgN1I+3Ipo0m5kU1QWgNZ1naVs+iP?=
 =?us-ascii?Q?xubEbttLKbzc38P9J9FFvVR9WVDvs+ZxmzdubhplG7Yr2UrM/AbJ2viDVb09?=
 =?us-ascii?Q?dedkN/feP1lTJHcPwt+/ioPlO0j5ypZdLI31Tms9tRo8FQHD+gQGWnOTcVbP?=
 =?us-ascii?Q?OER+6pZk4UNNWF5hutVz+J+fYh8oKqjADLJKfXcb3izbmrZM/H8+67l0H8m1?=
 =?us-ascii?Q?juRuV5BI9z1qu6AScdOmBP4K30fMXTiR4YLIoHpLo0InBeOr38uRLO8G738e?=
 =?us-ascii?Q?XXzHaKcFT/H3VRjhoRY5ousRyVESsIyWH50tgDrMl8ZNytIpALnJXtaSf01V?=
 =?us-ascii?Q?ihOK3ftTGA5rzeWH/cw352aXUvkvRL7xTZdZ9blRqgS2dqSsuA6XgRQSugZu?=
 =?us-ascii?Q?5lbTFUIV3ZKVOa5jTLpEXfdiGXkHzMwIq/N5uFeg0T9pGTAPSP2CZz9uKVvy?=
 =?us-ascii?Q?g/V6MSTZTyGOJ9lF7KGfmi/fklmeKTXzZPldw7qS0qMzHPwD3CBUqO6N+oE8?=
 =?us-ascii?Q?IkMYEoo+RcQ+uUynTj07qgR652VDdaJo54NCDoB6N0OXjpd/DEEsNqJam0NU?=
 =?us-ascii?Q?cpmNIzOBxLC+jeNlGNttCH8WwTMd9RoKbDSusP5wmSJUqmhFJwGd+4dYScuq?=
 =?us-ascii?Q?0bvNlSGx59cCgKAHHOTqOJPtfFwnrxYaDYh/t2gDK2106Z8gf9LflzQNFh/l?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4624a8be-da73-4326-1a03-08db692671b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 20:16:44.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMyas5A9DvPB2CQ9rY7iigirBRozTA4tmqM0bCyDj33YRTk0j+dgsXb5h6g6GrNGcHu6SZ6N3e4IGaqCsuPhng==
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

On Fri, Jun 09, 2023 at 12:42:22PM -0600, Souza, Jose wrote:
> On Fri, 2023-06-09 at 18:34 +0000, Souza, Jose wrote:
> > On Fri, 2023-06-09 at 11:26 -0700, Matthew Brost wrote:
> > > We cannot recover a VM if a rebind worker hits an error, ban the VM if
> > > happens to ensure we do not attempt to place this VM on the hardware
> > > again.
> > > 
> > > A follow up will inform the user if this happens.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_engine.c     |  5 +++++
> > >  drivers/gpu/drm/xe/xe_exec.c       |  2 +-
> > >  drivers/gpu/drm/xe/xe_trace.h      |  5 +++++
> > >  drivers/gpu/drm/xe/xe_vm.c         | 27 +++++++++++++++++++++++----
> > >  drivers/gpu/drm/xe/xe_vm.h         | 10 ++++++++++
> > >  drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
> > >  drivers/gpu/drm/xe/xe_vm_types.h   |  5 +++--
> > >  7 files changed, 48 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> > > index b3036c4a8ec3..b1f808c08dc5 100644
> > > --- a/drivers/gpu/drm/xe/xe_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > > @@ -597,6 +597,11 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
> > >  		if (XE_IOCTL_ERR(xe, !vm))
> > >  			return -ENOENT;
> > >  
> > > +		if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> > > +			xe_vm_put(vm);
> > > +			return -ENOENT;
> > > +		}
> > > +
> > >  		e = xe_engine_create(xe, vm, logical_mask,
> > >  				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
> > >  		xe_vm_put(vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index e44076ee2e11..27c11812d733 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -294,7 +294,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  	if (err)
> > >  		goto err_unlock_list;
> > >  
> > > -	if (xe_vm_is_closed(engine->vm)) {
> > > +	if (xe_vm_is_closed_or_banned(engine->vm)) {
> > >  		drm_warn(&xe->drm, "Trying to schedule after vm is closed\n");
> > >  		err = -EIO;
> > 
> > When banned it should return ECANCELED like:
> > 
> > if (XE_IOCTL_ERR(xe, engine->flags & ENGINE_FLAG_BANNED)) {
> > 	err = -ECANCELED;
> > 	goto err_engine;
> > }
> > 
> > About how to notify UMD, how about add a DRM_IOCTL_XE_VM_GET_PROPERTY?
> 
> On top of that, we should have exec documentation saying what are the error cases like this one and engine banned.
> 

Can add some documentation too.

Matt

> > 
> > >  		goto err_engine_end;
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > > index 2f8eb7ebe9a7..eb89ac934394 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -472,6 +472,11 @@ DECLARE_EVENT_CLASS(xe_vm,
> > >  			      __entry->asid)
> > >  );
> > >  
> > > +DEFINE_EVENT(xe_vm, xe_vm_kill,
> > > +	     TP_PROTO(struct xe_vm *vm),
> > > +	     TP_ARGS(vm)
> > > +);
> > > +
> > >  DEFINE_EVENT(xe_vm, xe_vm_create,
> > >  	     TP_PROTO(struct xe_vm *vm),
> > >  	     TP_ARGS(vm)
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index e4311c48cc54..1966a583b761 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -514,6 +514,24 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> > >  
> > >  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> > >  
> > > +static void xe_vm_kill(struct xe_vm *vm)
> > > +{
> > > +	struct ww_acquire_ctx ww;
> > > +	struct xe_engine *e;
> > > +
> > > +	lockdep_assert_held(&vm->lock);
> > > +
> > > +	xe_vm_lock(vm, &ww, 0, false);
> > > +	vm->flags |= XE_VM_FLAG_BANNED;
> > > +	trace_xe_vm_kill(vm);
> > > +
> > > +	list_for_each_entry(e, &vm->preempt.engines, compute.link)
> > > +		e->ops->kill(e);
> > > +	xe_vm_unlock(vm, &ww);
> > > +
> > > +	/* TODO: Inform user the VM is banned */
> > > +}
> > > +
> > >  static void preempt_rebind_work_func(struct work_struct *w)
> > >  {
> > >  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> > > @@ -533,7 +551,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  	XE_BUG_ON(!xe_vm_in_compute_mode(vm));
> > >  	trace_xe_vm_rebind_worker_enter(vm);
> > >  
> > > -	if (xe_vm_is_closed(vm)) {
> > > +	if (xe_vm_is_closed_or_banned(vm)) {
> > >  		trace_xe_vm_rebind_worker_exit(vm);
> > >  		return;
> > >  	}
> > > @@ -662,11 +680,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  			goto retry;
> > >  		}
> > >  	}
> > > +	if (err)
> > > +		xe_vm_kill(vm);
> > >  	up_write(&vm->lock);
> > >  
> > >  	free_preempt_fences(&preempt_fences);
> > >  
> > > -	XE_WARN_ON(err < 0);	/* TODO: Kill VM or put in error state */
> > >  	trace_xe_vm_rebind_worker_exit(vm);
> > >  }
> > >  
> > > @@ -1127,7 +1146,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> > >  {
> > >  	struct rb_node *node;
> > >  
> > > -	if (xe_vm_is_closed(vm))
> > > +	if (xe_vm_is_closed_or_banned(vm))
> > >  		return NULL;
> > >  
> > >  	XE_BUG_ON(vma->end >= vm->size);
> > > @@ -3048,7 +3067,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > >  		goto free_objs;
> > >  	}
> > >  
> > > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> > >  		drm_err(dev, "VM closed while we began looking up?\n");
> > >  		err = -ENOENT;
> > >  		goto put_vm;
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > > index 372f26153209..858207a20017 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -49,6 +49,16 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
> > >  	return !vm->size;
> > >  }
> > >  
> > > +static inline bool xe_vm_is_banned(struct xe_vm *vm)
> > > +{
> > > +	return vm->flags & XE_VM_FLAG_BANNED;
> > > +}
> > > +
> > > +static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
> > > +{
> > > +	return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
> > > +}
> > > +
> > >  struct xe_vma *
> > >  xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > index 0f5eef337037..76458f8d57f3 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > @@ -313,7 +313,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> > >  	if (XE_IOCTL_ERR(xe, !vm))
> > >  		return -EINVAL;
> > >  
> > > -	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> > > +	if (XE_IOCTL_ERR(xe, xe_vm_is_closed_or_banned(vm))) {
> > >  		err = -ENOENT;
> > >  		goto put_vm;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 76af6ac0fa84..566b67abe1c3 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -178,8 +178,9 @@ struct xe_vm {
> > >  #define XE_VM_FLAG_MIGRATION		BIT(3)
> > >  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> > >  #define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > > -#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 6) & 0x3)
> > > -#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 6)
> > > +#define XE_VM_FLAG_BANNED		BIT(6)
> > > +#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
> > > +#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
> > >  	unsigned long flags;
> > >  
> > >  	/** @composite_fence_ctx: context composite fence */
> > 
> 
