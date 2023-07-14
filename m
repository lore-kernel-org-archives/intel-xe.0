Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F714EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 13:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D9F10E88B;
	Fri, 14 Jul 2023 13:42:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562210E88A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689342165; x=1720878165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9QIJfE/RASFZvaBhoOBPxctZ72I7gjLa5ln66iVZaUg=;
 b=d8VBeH/DGr3m4TZOzRDem+42QkZcnKXSLyn0rAtHDi/oYgJl9FkNBn3q
 HqbEAupOClpaovVXtT8Ikhpdikp/OUNYlZ3/mUVa/CRBAVz4oz5OWUiIH
 wi530bszjKNXAGXBOjxIH23JY94cyCiOu3HJm+hkvzwgMIIjEOnu9+oK/
 4pBSJgt1NnvrMm1/T2f1VUmeATn9N1Rs+Bm1QZTPPD/40PA2OFF+u0v3C
 r3PfvFqpZ96cHiqeWqt2U6KfphLU4mymcCHTQyg8pT0prs4JlwsiFKX3o
 RrzK2IRWZfsRPoy9O2VJWnmJyp+FD+f2Ut17gjQxT2xj/e99vDSPao+xv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431649117"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="431649117"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 06:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="787854869"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="787854869"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 06:42:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 06:42:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 06:42:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 06:42:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 14 Jul 2023 06:42:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWDilYrXcaAe5lBNRFrmRP3C3RWCfiALAfBLEX1RT/4yXvoVYkLkdXUcr426oSW+x5t1tH0ascLZ1RqU4A5cuffPtQU3JqURewYQH1vEXvngXCFnF0Rvwj6fY6HbNuTCfi6Fk81wVfkqZCCP52hBWXqmfY0nCqEFATNiUrkV7815ijE5fDWSUWrNWnnLkjBxMT9F8hiCqkJuVud3RVQ97if5xyDG84gT7yfm0bbVIliUjqGU7K/klYpuT0gHXZVBfNRf0o3hZ1cforKXIr31CLo2zv8ueHmt/g3ZOyxSTow2nUY/vhGneqeTKAn3cRvsr+M2k7s6wgXC7c0SQPkmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iOpMaNtBBkMbY0rFnALMEf/GbBLcFgEviTNIyVOTf4=;
 b=oM48YbSM6WthETmQf3y9p6Zz1LOJQO5InW8bWYGUCnDbjt6Ensbm8YQfxf1iMi19fSLnKbneaJ+M4uz6x70sPTl+/EsZUb/tC7V249VyE+wG1yg9Cmr018BpksDrejyJPGlusdXUav5VxPvUOmv6RoZ8921GhtYrEjM7Q/aXex2RLFMg5huMMbO2Hb51kkG4vOwUDfa3q07hwtxrhiPEZ0qcA4Q2GYPXzF4diFwI/WS0/uAod4TdLZmt8SyU8BHQB8T001JzTUooCSg4wSJoXkg7GwjjpXfQt2tjZ3tvkys3kSHumcEzCo+hbDvVSGqkJ/RbWNGroon/p2cfPG72mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5426.namprd11.prod.outlook.com (2603:10b6:610:d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:42:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2677:dfb9:456f:1227%5]) with mapi id 15.20.6544.024; Fri, 14 Jul 2023
 13:42:37 +0000
Date: Fri, 14 Jul 2023 09:42:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZLFQyhx5RQ+NoeNY@intel.com>
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-3-matthew.brost@intel.com>
 <ZLBcDIPK7xT2qANE@intel.com> <ZLDHa2RV07IAZnrJ@DUT025-TGLU>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZLDHa2RV07IAZnrJ@DUT025-TGLU>
X-ClientProxiedBy: BYAPR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:74::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5b3710-010c-4ce5-9cda-08db84702fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q87H+6NJ9MnobW9PVpnTcOSBp5X3iNCc+HRm5a9ejIqobhcidzlt6hD9+xDkzlOp6HxrHQO+UdQJzthbt51mKKhhuriR2w7dkXu/Hqg343ol9ASutbV/gS0G/wh9J9/0KVCcKi/AfF3YnrbysqxteU/bGlROZ7pT7Sv22djms5HZ44tyXGcKQydUt2ZNxHXXyf3bQksIUnd0WyCsaVxLNNWvOlLHKICdVoly+BS1B4HG5AJDWUq4BBLnfnFRzkRnlWUsGzQZmgPdyx8//J5Ipao6qz4AG5G2MU9eTT7zz08d5lE4+DLaVskGqctSG7+WSY1SVQvgDkxudPonE5K8Z+GOsOOEtf9CguknGy1kXs+tyg3fpS0WerLYLMueE3vKyo0GZXaLxw45vtY5JKc2u1qlGxTy/3+874OXJEIRgGCD/n3WGoDdRFiEHhHESK9pjXK34G8/Z51NG2goEQcmaenSYDQ9RU2kCLTUe7V4M6etK3s1Wyhkov+eQTAtMX8YXiXJtu8j7dskGPjrR80xO4DXRkzggPF69LdPSEATEQ0S0U9QWZR1QVBLWpmmO30h3q6XdKUHekGbzbOkGwF+KAVDyCj3ihMjYWQFP+3X+cA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199021)(41300700001)(44832011)(37006003)(66476007)(4326008)(6636002)(66946007)(66556008)(478600001)(30864003)(5660300002)(6862004)(8936002)(2906002)(8676002)(316002)(6666004)(6486002)(6512007)(82960400001)(86362001)(26005)(6506007)(186003)(83380400001)(2616005)(36756003)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFIhlc7kc0l0P3nJ15YItS2DoSsxacSc71BpkPbehMdtm+Mk9m01DUV6PXer?=
 =?us-ascii?Q?fzgB07OFnmZ3PnvJccan9NnekR91B/SwROH77dMMw7GC4PEwtXH9UAm0Z0Ej?=
 =?us-ascii?Q?nO2kUE25e4AaE+VE5ja8g3S8l05ekC3G3sLsSaEEZZmH9eive3pRqG2sQMfN?=
 =?us-ascii?Q?4/xKOvhA1BoTrP5ptchwvxIyeb8a8N0jWGK+YMVBb1FkjM0uVCQlRfGOcTjz?=
 =?us-ascii?Q?0mQoLVkmm/q1doC8aQ91USQlgR7HG7oBU3DwEhh7sw85UQ0f0SrIJnP1VPbp?=
 =?us-ascii?Q?MZxdOOGroZDOYCeCmk+KAB2UwNwdkolRO/Ez1fUCD4MImmlAOZvnjEdWiMUN?=
 =?us-ascii?Q?V4S+Twm2qre8sHiosvpJb6Lmd/oVh5gw0yEWxjE159V6WB0mM51WCCa2BWlo?=
 =?us-ascii?Q?WEvhHPggjJR8FocA9cZeQPhpkXcvVp3YmDI91IA2pYBKbyHuvejF9Tsh8uwX?=
 =?us-ascii?Q?CkHCH7XfhIPQXAvfYB2yxNXDUs8ZHzLWahmX2akusWFHDY38y30+8m2RMtlk?=
 =?us-ascii?Q?m9lKpsT+SqT5Q1DPVAz3AapIsH9b39v+H5yfsKi1uPXQeCOI+i6uAB6AOrw7?=
 =?us-ascii?Q?VuShiRwjIw1GP3J8o0hqHMIIxxFRA2gpXobcH7bJFs93DNMoJkvXLK1L/9FK?=
 =?us-ascii?Q?FppNSCsMdwquA4ZmPMaIySISENp3tPtGR/b5KHkOwDkHA5LH/rY3rWBiAFVt?=
 =?us-ascii?Q?EwMexuT2KByj1h8Vw3N+kojmVFyySWRnZxS9FhXXFAujsrQQBYLNN1AT0gMv?=
 =?us-ascii?Q?FT3gvHZJS/eOIXEbFiKS0OiiSf17i+zdZQEVxYA9wec16C2QTXpl1qXKHRrj?=
 =?us-ascii?Q?rElWzb1YOa2GQRRFCn56DEDHUVC+GPUIIUtnbsHMEjXX5XbYfXx6JNymIWz3?=
 =?us-ascii?Q?ndxO3CzC8dZNczD1TXFu10tCVWY5/IsY/raCsKWerfm0ZwgRzBDZQlaG7tIT?=
 =?us-ascii?Q?ucD6WWjtLBrytO+ZkXYDLRiM21iSlWb0hRnTzECSQuG6oT9rMjxYs92Tilbp?=
 =?us-ascii?Q?0lsB3yaM1O0Y+onaLn5+BI93ei5TKMQWigrFe0/WlZizSSi5I/4nUhxR+t6X?=
 =?us-ascii?Q?OotF4n7g/hy2PFk2nxFNlzvk0KAz/ONJ160VkleP4PFCFV9kx1vxKR6oz4gN?=
 =?us-ascii?Q?H/VxpFSPyeCd8I4ekXRvRGynt3F1dVvfb4SLKvl1pNT1B7iobAz8sH0ErFPv?=
 =?us-ascii?Q?C6MSum7IYr7rUWDJTQyqrLKifGj671HottUe+0T/kw+mAGXPjhrfHlpSRtdN?=
 =?us-ascii?Q?scUmYyODF/cnLRrV+giEuzXGFORoC0ODgiwdRyVRnNtbdDkrXwECSu6NduWZ?=
 =?us-ascii?Q?iHuVSqQJZ6aL0TaAlTJkzz1qzWd67RzHuLVVMc/S6VCji4sWJTMv/RVnGJ/T?=
 =?us-ascii?Q?Quqx5ZSRHPqeM6PBdXDQtY3EYkYsYFWPBksWzeHD25kA3s1QhCPIBnCLS1lt?=
 =?us-ascii?Q?qXUE7prea+7COl6SoHXFdwTVOakgeWyKk5xrVRI0bO/m9U5qSSTgxf8IMTh2?=
 =?us-ascii?Q?dtHG9j2rUPTYk3WwtEIgi2tm/gROe4vu2gn/3RaxTVG6WtvoSDccb9ANxGSv?=
 =?us-ascii?Q?ppViPUacB9LYROYCMA/9pMY1hXZwa1YzrEnpFLY/iKN2849QoRqf8QFPjb6t?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b3710-010c-4ce5-9cda-08db84702fc4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 13:42:37.7763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gU5zzAJPTQA/aFwxFm4E5WfnVq5xTJ4jFqIbkg6Soj83P7J9X0oUGqug6X+pS4rOrbhn5N/RQF61a13FIViI1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5426
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Reduce the number list links in
 xe_vma
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

On Fri, Jul 14, 2023 at 03:56:27AM +0000, Matthew Brost wrote:
> On Thu, Jul 13, 2023 at 04:18:20PM -0400, Rodrigo Vivi wrote:
> > On Tue, Jul 11, 2023 at 02:27:45PM -0700, Matthew Brost wrote:
> > > Combine the userptr, rebind, and destroy links into a union as
> > > the lists these links belong to are mutually exclusive.
> > > 
> > > v2: Adjust which lists are combined (Thomas H)
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
> > >  drivers/gpu/drm/xe/xe_exec.c     |  2 +-
> > >  drivers/gpu/drm/xe/xe_pt.c       |  2 +-
> > >  drivers/gpu/drm/xe/xe_vm.c       | 45 ++++++++++++++++----------------
> > >  drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++-----------
> > >  5 files changed, 41 insertions(+), 42 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 6353afa8d846..ca7f74ecb753 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
> > >  			}
> > >  
> > >  			xe_vm_assert_held(vm);
> > > -			if (list_empty(&vma->rebind_link) && vma->tile_present)
> > > -				list_add_tail(&vma->rebind_link, &vm->rebind_list);
> > > +			if (list_empty(&vma->combined_links.rebind) &&
> > > +			    vma->tile_present)
> > > +				list_add_tail(&vma->combined_links.rebind,
> > > +					      &vm->rebind_list);
> > >  
> > >  			if (vm_resv_locked)
> > >  				dma_resv_unlock(&vm->resv);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > index ba13d20ed348..bc5bd4bdc582 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> > >  	 * BOs have valid placements possibly moving an evicted BO back
> > >  	 * to a location where the GPU can access it).
> > >  	 */
> > > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> > >  		XE_WARN_ON(xe_vma_is_null(vma));
> > >  
> > >  		if (xe_vma_is_userptr(vma))
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > index a8d96cbd53e3..3b43b32f4a33 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
> > >  	}
> > >  
> > >  	if (!vma->tile_present)
> > > -		list_del_init(&vma->rebind_link);
> > > +		list_del_init(&vma->combined_links.rebind);
> > >  
> > >  	if (unbind_pt_update.locked) {
> > >  		XE_WARN_ON(!xe_vma_is_userptr(vma));
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 5f4f6dab270a..b2847be6de6a 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> > >  
> > >  		list_del_init(&vma->notifier.rebind_link);
> > >  		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> > > -			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > > +			list_move_tail(&vma->combined_links.rebind,
> > > +				       &vm->rebind_list);
> > >  	}
> > >  	spin_unlock(&vm->notifier.list_lock);
> > >  
> > > @@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> > >  	if (err)
> > >  		goto out_unlock;
> > >  
> > > -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> > >  		if (xe_vma_has_no_bo(vma) ||
> > >  		    vma->gpuva.flags & XE_VMA_DESTROYED)
> > >  			continue;
> > > @@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > >  	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> > >  				 userptr.invalidate_link) {
> > >  		list_del_init(&vma->userptr.invalidate_link);
> > > -		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
> > > +		if (list_empty(&vma->combined_links.userptr))
> > > +			list_move_tail(&vma->combined_links.userptr,
> > > +				       &vm->userptr.repin_list);
> > >  	}
> > >  	spin_unlock(&vm->userptr.invalidated_lock);
> > >  
> > >  	/* Pin and move to temporary list */
> > > -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
> > > +	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> > > +				 combined_links.userptr) {
> > >  		err = xe_vma_userptr_pin_pages(vma);
> > >  		if (err < 0)
> > >  			goto out_err;
> > >  
> > > -		list_move_tail(&vma->userptr_link, &tmp_evict);
> > > +		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
> > >  	}
> > >  
> > >  	/* Take lock and move to rebind_list for rebinding. */
> > > @@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> > >  	if (err)
> > >  		goto out_err;
> > >  
> > > -	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> > > -		list_del_init(&vma->userptr_link);
> > > -		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> > > -	}
> > > +	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> > > +		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
> > >  
> > >  	dma_resv_unlock(&vm->resv);
> > >  
> > > @@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> > >  		return NULL;
> > >  
> > >  	xe_vm_assert_held(vm);
> > > -	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> > > +	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > > +				 combined_links.rebind) {
> > >  		XE_WARN_ON(!vma->tile_present);
> > >  
> > > -		list_del_init(&vma->rebind_link);
> > > +		list_del_init(&vma->combined_links.rebind);
> > >  		dma_fence_put(fence);
> > >  		if (rebind_worker)
> > >  			trace_xe_vma_rebind_worker(vma);
> > > @@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> > >  		return vma;
> > >  	}
> > >  
> > > -	INIT_LIST_HEAD(&vma->rebind_link);
> > > -	INIT_LIST_HEAD(&vma->unbind_link);
> > > -	INIT_LIST_HEAD(&vma->userptr_link);
> > > +	INIT_LIST_HEAD(&vma->combined_links.rebind);
> > >  	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> > >  	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> > >  	INIT_LIST_HEAD(&vma->extobj.link);
> > > @@ -1058,15 +1059,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > >  
> > >  	lockdep_assert_held_write(&vm->lock);
> > > -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> > > +	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
> > >  
> > >  	if (xe_vma_is_userptr(vma)) {
> > >  		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> > >  
> > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > -		list_del_init(&vma->userptr.invalidate_link);
> 
> This doesn't, will remove.
> 
> > > +		list_del(&vma->userptr.invalidate_link);
> > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > -		list_del(&vma->userptr_link);
> 
> This does.

oh, I see now... sorry for the confusion.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Matt
> 
> > 
> > this chunk has nothing to do with the combined_links, so it needs a separated patch.
> > 
> > >  	} else if (!xe_vma_is_null(vma)) {
> > >  		xe_bo_assert_held(xe_vma_bo(vma));
> > >  
> > > @@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> > >  	}
> > >  
> > >  	xe_vm_assert_held(vm);
> > > -	if (!list_empty(&vma->rebind_link))
> > > -		list_del(&vma->rebind_link);
> > > -
> > >  	if (fence) {
> > >  		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
> > >  						 vma_destroy_cb);
> > > @@ -1443,11 +1440,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  
> > >  		/* easy case, remove from VMA? */
> > >  		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> > > +			list_del_init(&vma->combined_links.rebind);
> > >  			xe_vma_destroy(vma, NULL);
> > >  			continue;
> > >  		}
> > >  
> > > -		list_add_tail(&vma->unbind_link, &contested);
> > > +		list_move_tail(&vma->combined_links.destroy, &contested);
> > >  	}
> > >  
> > >  	/*
> > > @@ -1475,8 +1473,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> > >  	 * Since we hold a refcount to the bo, we can remove and free
> > >  	 * the members safely without locking.
> > >  	 */
> > > -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> > > -		list_del_init(&vma->unbind_link);
> > > +	list_for_each_entry_safe(vma, next_vma, &contested,
> > > +				 combined_links.destroy) {
> > > +		list_del_init(&vma->combined_links.destroy);
> > >  		xe_vma_destroy_unlocked(vma);
> > >  	}
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index f17dc5d7370e..84bf1620214c 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -49,21 +49,19 @@ struct xe_vma {
> > >  	 */
> > >  	u64 tile_present;
> > >  
> > > -	/** @userptr_link: link into VM repin list if userptr */
> > > -	struct list_head userptr_link;
> > > -
> > > -	/**
> > > -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> > > -	 * if it's a bo (not userptr) needs validation after a possible
> > > -	 * eviction. Protected by the vm's resv lock.
> > > -	 */
> > > -	struct list_head rebind_link;
> > > -
> > > -	/**
> > > -	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
> > > -	 * single unbind op, is being done.
> > > -	 */
> > > -	struct list_head unbind_link;
> > > +	/** @combined_links: links into lists which are mutually exclusive */
> > > +	union {
> > > +		/** @userptr: link into VM repin list if userptr */
> > > +		struct list_head userptr;
> > > +		/**
> > > +		 * @rebind: link into VM if this VMA needs rebinding, and
> > > +		 * if it's a bo (not userptr) needs validation after a possible
> > > +		 * eviction. Protected by the vm's resv lock.
> > > +		 */
> > > +		struct list_head rebind;
> > > +		/** @destroy: link to contested list when VM is being closed */
> > > +		struct list_head destroy;
> > > +	} combined_links;
> > 
> > this is a good optimization, but from the organization point of view and naming
> > this is getting confused... if we could at least find a generic name that makes
> > sense for these mutual exclusive operations other then 'combined_links'.... :/
> > 
> > but well, I'm also not good with names.
> > 
> > with separated patches,
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > on both...
> > 
> > >  
> > >  	/** @destroy_cb: callback to destroy VMA when unbind job is done */
> > >  	struct dma_fence_cb destroy_cb;
> > > -- 
> > > 2.34.1
> > > 
