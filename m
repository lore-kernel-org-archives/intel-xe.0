Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ED4C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 19:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A724B113F56;
	Thu, 18 Apr 2024 19:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNELorj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BBC113F56
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713469031; x=1745005031;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oeDoT7Y3fdDsq24aPn4R8e0wNceP05H8X5Ao0mNO3q4=;
 b=mNELorj4luCFSe656SJlUORcajWlArGbkIyutjy+7wI2MjsvV4qg54G0
 4CRjc7zPDW8RFrRHHvkMRlfCFt1WP50TwfvEAV6YxFoUOu2kzBicrSA7O
 xhfETyYYdWl651f2f70GVWxIJwcEI31ASrwOM53fFmnzy5QstqRO385YP
 6+EHZNqZ/eTzY/NZu+Sc9BrUmt0IXRBciSqJIUgeYQUBYJUzui2e78+wu
 dOt6rM9mLmBRUlt3bp7TOIunCbCCLSXT05ytYW2PABhDWC8O69BjUU7I1
 Iy3aoAjOOhYBCQpVU38gXTdj+bL89FIezX73ElvCimuFfQcpbracNSPAN g==;
X-CSE-ConnectionGUID: BjzavZTgR8eVO7oM4jNhxQ==
X-CSE-MsgGUID: gLtpHCaRTAiZRye+mlC3zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12824258"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12824258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 12:37:10 -0700
X-CSE-ConnectionGUID: SRLzd/PoSTKFr1DyVBk90w==
X-CSE-MsgGUID: nt3wdoknQuGD+SMQXcEoiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="60518177"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 12:37:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:37:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 12:37:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 12:37:09 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 12:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CimOW3IDIU3+JloM87fZfMDvzDL5TZ7dbHJHQd0ctHVvf4qtlJN8nk9251zP/Nx5CVi9i+qfQyWIGs7Mo1AqOkRqr+j8scfrFiMwfte838yhBKb9ndeSuPyeu8/ubchM4Q+5jHx7PG7EI9QhYaEn+NEZ23nGLaoPEATUvcQeWJJQi6hJdGZhfjOing34hoLrR/rtCCdlwrDu1fC5TV9zeZqZgpS/e4FP5sU4ezYQF1uCX8nnTbhZm+/gZnv2FvqjeGpoAcL/nmtdaLxv1dNMC6ni/bGetq4WFfE6R9zhmJmYYoqe69aSIgc+/PWSxs+VMLh7coQ3R0Cgq9eGzlwdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/v8ycJXqtDXjeVjKjjyvYh+bVXGHVu6K7OMfiKYr78=;
 b=AdiQkMXn9qvWESPF6kwtfKu+J2n8YnQKZ4XeMaoXhENVJHlcw8lmxgeUkSVe2AM9e81EU49qNm4CUEsGennLSU3L0amP1jsYyCTToeBMdspbjJfaU4o+owqqW6f0yd/nkeLR+VRVf28fzFTDAnXspOzjgaspKUBpEPTyzQiyPiKKsohaHPUQfb0cTD1sV1JSyKcfgAAyvfrt1P7E50OFpnL2i55uC1l8h9GLIAcvyEvdSS9CuSOixmAsd8kf3PSGySFgvrMU+VNdpJ7XG5tAFBS1mcwN44jEx3FRX2td9rH1WAb1z2btrGqlnaLwg9QhzfeII1mYD/bxCkYv53slFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 19:37:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Thu, 18 Apr 2024
 19:37:06 +0000
Date: Thu, 18 Apr 2024 19:36:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
 fence
Message-ID: <ZiF2VSumpZTbIN+z@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-3-matthew.brost@intel.com>
 <SA1PR11MB69915478598B96B5553FE726920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69915478598B96B5553FE726920E2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd3f404-04b5-45c1-5f10-08dc5fdeede1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xy0mezlNhJ+llVDjYXlYZyH7ETmzYJTsLT6lc1wYEZ+/gHoHbFcBujmEA16dxfQ8pTBMwJ866Q6VOxujyb+t1HuWpb4BN6Zz/ilWk97jxZOOKVQIsm/84hw+4iIY7WZ9ykaCkIldRD4XzMSzVEg4P3Kp957kfdyrXfi1/g5enGOiZrWeucB4OFxkPvaEM/8n03L7vrzRn0dTBI5e6MIG0H1i7OkLnDOdz4F4m2Qh5ZgpTXq/utsIc9ql/7N8AyRpzr133fyNFGHvdK/4Dyp9gZi9hgkGZwtsDvXhYfEJFVmyb5umKzGoYlFVN049GIXFLqttWtOwPfd3i0vYwPxZ9FqA8qtu5rhOR4OsQQM43nrLlHFxuoNQE+VmNxqDyvKkb+d9BE/GMXsQ6aXte6FXWckBCz2b5O9rcqoug9K3zs0bCO912VUf3iAL2v56FaqilLR5gFsjrFbzi2syZARCyltNJByRPPD2BhJFZk+MIVGQq/cbkwkdJEtFMPnB5aXq9Q6nMnPA2ld7vgLkcRh9HJeyDUeG1UNbjOF5Q2EB9GKPYgXXFMymTgwjFGuld9/fc+Y2IMRLMINd+tOLMJqb4amb9e28b9MUBQMFnoeZun3cLAYjrx4YfpRx788hDB+f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lwla/NMkeCSG4kwhfM7tSh1E/fc3tJdOuuhBEVmxTl0ziOPA2fUt3nfbfmfB?=
 =?us-ascii?Q?g4vvubVIf8+l00v4koB9SzowegIAbbim2vE/fpkxXegEQ28MaueeO5VKr19G?=
 =?us-ascii?Q?Ulk8xRwQqWNLYtegIOucKeUcbQvoCLovGEOtAVEbNgQV5LowIBreDKIb+KCz?=
 =?us-ascii?Q?d+O/TnhT/4qu7sDMjDUwEHfREek7gHqLwZy2NByUMRHDS0GblYSWI2PZraqC?=
 =?us-ascii?Q?1PZlQZkmAimNFkM02TOTIGqrU1Vc5oJ/vx02NRYjgBJ8fcrd75uOu52aW5oR?=
 =?us-ascii?Q?VXznzKpEtIWTmKYt2mtb63aULBPauinOywWxE24V6WV46hfbDjpR1/V8STVk?=
 =?us-ascii?Q?U2Nf8YCP2rW4zHlSLXLKGBm++XmW1m9pAhBGasfBvbxrUxWe3ON8g7sMItMb?=
 =?us-ascii?Q?1qWpPq8BIoUFsh6a9ANx7LCVfGS56EDQ4wK+2DzmWygKJLttjZ08P8Z6gB+l?=
 =?us-ascii?Q?ZBqF/5rFAD0qHO+3cQscUA5xrywuqCrtBKic/PuS7N63ufkVa/ZlKDUoIQMn?=
 =?us-ascii?Q?+WSSdfNhZdGi6I/PCcRvHhI6wxWOIk2xQ3xQUEDV2jbggv+Ti+rWvptr7icm?=
 =?us-ascii?Q?7wk5vUi9tZyTrx8+QjKEyYWc4P2nw9URmGiiZOtDRawm+4kQo+NvPE1FfXOq?=
 =?us-ascii?Q?ReMjtXV7LTZQ3jE5eUpwlkJ8kMDHHnlZvlC1W18suvwU4lFtDl9rnFMJO5OG?=
 =?us-ascii?Q?lOfIMr1w5HaLFchZsmng5ikMmZR7Mvhg4L2f5/R3p7P0N0/eNi9sfkssVV4a?=
 =?us-ascii?Q?Rb+hIeP8oRAeaMpQYD6ZA8YsLDUSP9h4ny+w49SnV9WkghB0aI+Ojwo7ASkN?=
 =?us-ascii?Q?FRpjHla3btVJVv153Q2JgwbtLI5irkKal+CehhOk56mpUu6drHAGIBSUV8iO?=
 =?us-ascii?Q?xHFp5tZwdN5ulmVYCHXmqgA6hzacuJih+GlThaCe5KUyBWMaDY5f5smZWBhl?=
 =?us-ascii?Q?/UQR7cWzmaXhhFOWKqVG2Sk2OH61gZSxAXxtHy1CJtgKUUl0OQIigjCODBfb?=
 =?us-ascii?Q?m2GvU+Cz83nETK9PV9IK4cyiityoGJ0a2rw5A7fAhcQ1d+qJ+9x97SD3HjsY?=
 =?us-ascii?Q?6xxYiJcUUG1xGZgBScbiAsGLA+6dKafw9PFeoSZVowwAp3+YqoIjRz8nZuXM?=
 =?us-ascii?Q?d10g9D6vb6IGzS7jzIIG1BcZgwe0PUEXpzJGfGWWiQChSpHKMduYX7AnAdF1?=
 =?us-ascii?Q?Wtrmgf8+ylcQYynvD27a/K6hqf2kc2ZUlh+IoYZv2ZA8GJFKDg3ZCF4vUigp?=
 =?us-ascii?Q?3rOsEFhW7pxBANn2wwg9edJHhro4Bg7Ncm28FEqHbjmw6gGvytQ5Wx6d5ah4?=
 =?us-ascii?Q?WNyvo51lq5rIEUyit8h+XJV0JTYQwnjSU0wWOrYk9kLJCpP0bUlhqcrae8mj?=
 =?us-ascii?Q?z8Hokk7PH05DaUjsfIMO4nbpIvr9wyH+g8W/NKRf3qEcWgw6haBpb1dnTwbx?=
 =?us-ascii?Q?vchkKDhTSm2OrT3S6MAOVBkX2OSiKXzq8bGjQFvtK7TC/7A30Nl5Qd6bRRVH?=
 =?us-ascii?Q?d3CJ25OclBSr44rUzdupvb2JsBEBXFqD+pghBvbGwpv0o7cdlMxfW8SDpjJG?=
 =?us-ascii?Q?cTnX17o7cAhxEmZ7gIWntOY8WyoBt6CbaCeSKLviH00M66rXw1rz7vbiMYxI?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd3f404-04b5-45c1-5f10-08dc5fdeede1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 19:37:05.9649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giHXu2OvIVbRBKvx2yrongelvf7e/w65iEMbK0tePN9t1she/v4dYyI3qFcrP3loDsNfYUcoY0hP83n+ykWxiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

On Thu, Apr 18, 2024 at 10:16:15AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: [PATCH 02/13] drm/xe: Add ops_execute function which returns a
> > fence
> > 
> > Add ops_execute function which returns a fence. This will be helpful to
> > initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> > preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
> > Returning a fence is needed in various paths.
> > 
> > v2:
> >  - Rebase
> > 
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++------------------
> >  1 file changed, 111 insertions(+), 100 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6375c136e21a..84c6b10b4b78 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1834,16 +1834,17 @@ find_ufence_get(struct xe_sync_entry *syncs,
> > u32 num_syncs)
> >  	return NULL;
> >  }
> > 
> > -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > -			struct xe_exec_queue *q, struct xe_sync_entry
> > *syncs,
> > -			u32 num_syncs, bool immediate, bool first_op,
> > -			bool last_op)
> > +static struct dma_fence *
> > +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > xe_exec_queue *q,
> > +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > +	   bool immediate, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> >  	struct xe_user_fence *ufence;
> > 
> >  	xe_vm_assert_held(vm);
> > +	xe_bo_assert_held(bo);
> > 
> >  	ufence = find_ufence_get(syncs, num_syncs);
> >  	if (vma->ufence && ufence)
> > @@ -1855,7 +1856,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs,
> > first_op,
> >  				       last_op);
> >  		if (IS_ERR(fence))
> > -			return PTR_ERR(fence);
> > +			return fence;
> >  	} else {
> >  		int i;
> > 
> > @@ -1870,26 +1871,14 @@ static int __xe_vm_bind(struct xe_vm *vm,
> > struct xe_vma *vma,
> > 
> >  	if (last_op)
> >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > fence);
> > -	dma_fence_put(fence);
> > -
> > -	return 0;
> > -}
> > -
> > -static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct
> > xe_exec_queue *q,
> > -		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> > -		      u32 num_syncs, bool immediate, bool first_op,
> > -		      bool last_op)
> > -{
> > -	xe_vm_assert_held(vm);
> > -	xe_bo_assert_held(bo);
> > 
> > -	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate,
> > first_op,
> > -			    last_op);
> > +	return fence;
> >  }
> > 
> > -static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > -			struct xe_exec_queue *q, struct xe_sync_entry
> > *syncs,
> > -			u32 num_syncs, bool first_op, bool last_op)
> > +static struct dma_fence *
> > +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > +	     u32 num_syncs, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> > @@ -1899,14 +1888,13 @@ static int xe_vm_unbind(struct xe_vm *vm,
> > struct xe_vma *vma,
> > 
> >  	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> > last_op);
> >  	if (IS_ERR(fence))
> > -		return PTR_ERR(fence);
> > +		return fence;
> > 
> >  	xe_vma_destroy(vma, fence);
> >  	if (last_op)
> >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm,
> > fence);
> > -	dma_fence_put(fence);
> > 
> > -	return 0;
> > +	return fence;
> >  }
> > 
> >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > @@ -2049,10 +2037,11 @@ static const u32 region_to_mem_type[] = {
> >  	XE_PL_VRAM1,
> >  };
> > 
> > -static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > -			  struct xe_exec_queue *q, u32 region,
> > -			  struct xe_sync_entry *syncs, u32 num_syncs,
> > -			  bool first_op, bool last_op)
> > +static struct dma_fence *
> > +xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> > +	       struct xe_exec_queue *q, u32 region,
> > +	       struct xe_sync_entry *syncs, u32 num_syncs,
> > +	       bool first_op, bool last_op)
> >  {
> >  	struct xe_exec_queue *wait_exec_queue =
> > to_wait_exec_queue(vm, q);
> >  	int err;
> > @@ -2062,27 +2051,24 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	if (!xe_vma_has_no_bo(vma)) {
> >  		err = xe_bo_migrate(xe_vma_bo(vma),
> > region_to_mem_type[region]);
> >  		if (err)
> > -			return err;
> > +			return ERR_PTR(err);
> >  	}
> > 
> >  	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated))
> > {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> >  				  true, first_op, last_op);
> >  	} else {
> > +		struct dma_fence *fence =
> > +			xe_exec_queue_last_fence_get(wait_exec_queue,
> > vm);
> >  		int i;
> > 
> >  		/* Nothing to do, signal fences now */
> >  		if (last_op) {
> > -			for (i = 0; i < num_syncs; i++) {
> > -				struct dma_fence *fence =
> > -
> > 	xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> > -
> > +			for (i = 0; i < num_syncs; i++)
> >  				xe_sync_entry_signal(&syncs[i], fence);
> > -				dma_fence_put(fence);
> > -			}
> >  		}
> > 
> > -		return 0;
> > +		return fence;
> >  	}
> >  }
> > 
> > @@ -2535,10 +2521,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  	return 0;
> >  }
> > 
> > -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > -		      struct xe_vma_op *op)
> > +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma
> > *vma,
> > +				    struct xe_vma_op *op)
> >  {
> > -	int err;
> > +	struct dma_fence *fence = NULL;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > 
> > @@ -2547,11 +2533,11 @@ static int op_execute(struct xe_vm *vm, struct
> > xe_vma *vma,
> > 
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > -				 op->syncs, op->num_syncs,
> > -				 op->map.immediate
> > || !xe_vm_in_fault_mode(vm),
> > -				 op->flags & XE_VMA_OP_FIRST,
> > -				 op->flags & XE_VMA_OP_LAST);
> > +		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > +				   op->syncs, op->num_syncs,
> > +				   op->map.immediate
> > || !xe_vm_in_fault_mode(vm),
> > +				   op->flags & XE_VMA_OP_FIRST,
> > +				   op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  	{
> > @@ -2561,37 +2547,39 @@ static int op_execute(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  		if (!op->remap.unmap_done) {
> >  			if (prev || next)
> >  				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
> > -			err = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > -					   op->num_syncs,
> > -					   op->flags & XE_VMA_OP_FIRST,
> > -					   op->flags & XE_VMA_OP_LAST &&
> > -					   !prev && !next);
> > -			if (err)
> > +			fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > +					     op->num_syncs,
> > +					     op->flags & XE_VMA_OP_FIRST,
> > +					     op->flags & XE_VMA_OP_LAST &&
> > +					     !prev && !next);
> > +			if (IS_ERR(fence))
> >  				break;
> >  			op->remap.unmap_done = true;
> >  		}
> > 
> >  		if (prev) {
> >  			op->remap.prev->gpuva.flags |=
> > XE_VMA_LAST_REBIND;
> > -			err = xe_vm_bind(vm, op->remap.prev, op->q,
> > -					 xe_vma_bo(op->remap.prev), op-
> > >syncs,
> > -					 op->num_syncs, true, false,
> > -					 op->flags & XE_VMA_OP_LAST
> > && !next);
> > +			dma_fence_put(fence);
> > +			fence = xe_vm_bind(vm, op->remap.prev, op->q,
> > +					   xe_vma_bo(op->remap.prev), op-
> > >syncs,
> > +					   op->num_syncs, true, false,
> > +					   op->flags & XE_VMA_OP_LAST
> > && !next);
> >  			op->remap.prev->gpuva.flags &=
> > ~XE_VMA_LAST_REBIND;
> > -			if (err)
> > +			if (IS_ERR(fence))
> >  				break;
> >  			op->remap.prev = NULL;
> >  		}
> > 
> >  		if (next) {
> >  			op->remap.next->gpuva.flags |=
> > XE_VMA_LAST_REBIND;
> > -			err = xe_vm_bind(vm, op->remap.next, op->q,
> > -					 xe_vma_bo(op->remap.next),
> > -					 op->syncs, op->num_syncs,
> > -					 true, false,
> > -					 op->flags & XE_VMA_OP_LAST);
> > +			dma_fence_put(fence);
> > +			fence = xe_vm_bind(vm, op->remap.next, op->q,
> > +					   xe_vma_bo(op->remap.next),
> > +					   op->syncs, op->num_syncs,
> > +					   true, false,
> > +					   op->flags & XE_VMA_OP_LAST);
> >  			op->remap.next->gpuva.flags &=
> > ~XE_VMA_LAST_REBIND;
> > -			if (err)
> > +			if (IS_ERR(fence))
> >  				break;
> >  			op->remap.next = NULL;
> >  		}
> > @@ -2599,34 +2587,36 @@ static int op_execute(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  		break;
> >  	}
> >  	case DRM_GPUVA_OP_UNMAP:
> > -		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > -				   op->num_syncs, op->flags &
> > XE_VMA_OP_FIRST,
> > -				   op->flags & XE_VMA_OP_LAST);
> > +		fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > +				     op->num_syncs, op->flags &
> > XE_VMA_OP_FIRST,
> > +				     op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
> > -				     op->syncs, op->num_syncs,
> > -				     op->flags & XE_VMA_OP_FIRST,
> > -				     op->flags & XE_VMA_OP_LAST);
> > +		fence = xe_vm_prefetch(vm, vma, op->q, op-
> > >prefetch.region,
> > +				       op->syncs, op->num_syncs,
> > +				       op->flags & XE_VMA_OP_FIRST,
> > +				       op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > 
> > -	if (err)
> > +	if (IS_ERR(fence))
> >  		trace_xe_vma_fail(vma);
> > 
> > -	return err;
> > +	return fence;
> >  }
> > 
> > -static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > -			       struct xe_vma_op *op)
> > +static struct dma_fence *
> > +__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > +		    struct xe_vma_op *op)
> >  {
> > +	struct dma_fence *fence;
> >  	int err;
> > 
> >  retry_userptr:
> > -	err = op_execute(vm, vma, op);
> > -	if (err == -EAGAIN) {
> > +	fence = op_execute(vm, vma, op);
> > +	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN) {
> >  		lockdep_assert_held_write(&vm->lock);
> > 
> >  		if (op->base.op == DRM_GPUVA_OP_REMAP) {
> > @@ -2643,22 +2633,24 @@ static int __xe_vma_op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  			if (!err)
> >  				goto retry_userptr;
> > 
> > +			fence = ERR_PTR(err);
> >  			trace_xe_vma_fail(vma);
> >  		}
> >  	}
> > 
> > -	return err;
> > +	return fence;
> >  }
> > 
> > -static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> > +static struct dma_fence *
> > +xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
> >  {
> > -	int ret = 0;
> > +	struct dma_fence *fence = ERR_PTR(-ENOMEM);
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > 
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		ret = __xe_vma_op_execute(vm, op->map.vma, op);
> > +		fence = __xe_vma_op_execute(vm, op->map.vma, op);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  	{
> > @@ -2671,23 +2663,23 @@ static int xe_vma_op_execute(struct xe_vm *vm,
> > struct xe_vma_op *op)
> >  		else
> >  			vma = op->remap.next;
> > 
> > -		ret = __xe_vma_op_execute(vm, vma, op);
> > +		fence = __xe_vma_op_execute(vm, vma, op);
> >  		break;
> >  	}
> >  	case DRM_GPUVA_OP_UNMAP:
> > -		ret = __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > >base.unmap.va),
> > -					  op);
> > +		fence = __xe_vma_op_execute(vm, gpuva_to_vma(op-
> > >base.unmap.va),
> > +					    op);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > -		ret = __xe_vma_op_execute(vm,
> > -					  gpuva_to_vma(op-
> > >base.prefetch.va),
> > -					  op);
> > +		fence = __xe_vma_op_execute(vm,
> > +					    gpuva_to_vma(op-
> > >base.prefetch.va),
> > +					    op);
> >  		break;
> >  	default:
> >  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >  	}
> > 
> > -	return ret;
> > +	return fence;
> >  }
> > 
> >  static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> > @@ -2861,11 +2853,35 @@ static int
> > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> >  	return 0;
> >  }
> > 
> > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > +				     struct list_head *ops_list,
> > +				     bool cleanup)
> > +{
> > +	struct xe_vma_op *op, *next;
> > +	struct dma_fence *fence = NULL;
> > +
> > +	list_for_each_entry_safe(op, next, ops_list, link) {
> > +		if (!IS_ERR(fence)) {
> > +			dma_fence_put(fence);
> > +			fence = xe_vma_op_execute(vm, op);
> > +		}
> > +		if (IS_ERR(fence)) {
> > +			drm_warn(&vm->xe->drm, "VM op(%d) failed
> > with %ld",
> > +				 op->base.op, PTR_ERR(fence));
> > +			fence = ERR_PTR(-ENOSPC);
> 
> There is a comment before not addressed. Copy as below:
> 
> 
> > > Once error happen for one operation, you seem to print the same error
> > message for all the rest operations....because fence = xe_vma_op_execute(vm,
> > op) is not called anymore after the first error
> > >
> > 
> > Yes.
> 
> Is this problematic though? Lets say you have 2 ops in the list and op_execute failed with op1. You will print as below:
> 
> VM op1 failed with xxx
> VM op1 failed with xxx
> 

I don't think that is a problem and changes later in the series once
xe_vma_op_cleanup is removed from this function.

> 
> 
> > +		}
> > +		if (cleanup)
> > +			xe_vma_op_cleanup(vm, op);
> > +	}
> > +
> > +	return fence;
> > +}
> > +
> >  static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> >  				     struct list_head *ops_list)
> >  {
> >  	struct drm_exec exec;
> > -	struct xe_vma_op *op, *next;
> > +	struct dma_fence *fence;
> >  	int err;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> > @@ -2878,19 +2894,14 @@ static int vm_bind_ioctl_ops_execute(struct
> > xe_vm *vm,
> >  		if (err)
> >  			goto unlock;
> > 
> > -		list_for_each_entry_safe(op, next, ops_list, link) {
> > -			err = xe_vma_op_execute(vm, op);
> > -			if (err) {
> > -				drm_warn(&vm->xe->drm, "VM op(%d)
> > failed with %d",
> > -					 op->base.op, err);
> > -				/*
> > -				 * FIXME: Killing VM rather than proper error
> > handling
> > -				 */
> > -				xe_vm_kill(vm, false);
> > -				err = -ENOSPC;
> > -				goto unlock;
> > -			}
> > -			xe_vma_op_cleanup(vm, op);
> > +		fence = ops_execute(vm, ops_list, true);
> > +		if (IS_ERR(fence)) {
> > +			err = PTR_ERR(fence);
> > +			/* FIXME: Killing VM rather than proper error
> > handling */
> > +			xe_vm_kill(vm, false);
> > +			goto unlock;
> > +		} else {
> > +			dma_fence_put(fence);
> 
> I don't get here. You introduced function ops_execute to return the last fence of all the operations. But you just put the fence here. Isn't you intend to wait for this fence somehow? What is the point to return a fence from ops_execute?
> i

It is used patch #7 [1] and #9 [2] in this series.

In [1], the returned fence is used wait on ops to compelete before
signaling page fault complete to GuC.

In [2], the returned fence is used as an argument to
vm_bind_ioctl_ops_fini which attaches VMA destroy to fence, installs
fence in IOCTL out-syncs, and sets last fence on the exec queue.

Matt

[1] https://patchwork.freedesktop.org/patch/588594/?series=132246&rev=1
[2] https://patchwork.freedesktop.org/patch/588595/?series=132246&rev=1

> Oak
> 
> 
> >  		}
> >  	}
> > 
> > --
> > 2.34.1
> 
