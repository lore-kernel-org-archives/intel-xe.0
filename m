Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C428C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 18:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0392D10F1EB;
	Tue, 26 Mar 2024 18:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbzRdIlv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8927A10F1EB
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 18:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711479023; x=1743015023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RSizS0jcsM//OUUg91eah0tVh6mdVGlwj6D/m/vK1NE=;
 b=JbzRdIlv5M5FJGGSPZt438tIDsk1A8bLCHqrFZQF5jWMq9vP8fgLV7+R
 +HS/i8NAfTqjHIJADYLu85j1fMnPpKK3c18fjeykzidbGO2TYu+20oLDr
 UwLU8IGVDd9BvijGkxDHlqQsgKoQu1uHShorrKnNYwMzZ1Rd+NG/RCvYe
 lC5S/jzlGPhufGneqKQf5JnKri+ZkLL3fRbYrbNkGEMNwPg4DuQL2IZOZ
 fzqYUjMHDw7gBG+ZF+ipgahP7DhcmH4TVfb6QRSdgvUwt4rclHsIgCOkZ
 W4qDyM/QaImsoUrH4XeQFkGURKK7bMj145hAfuBjN+oX8Z1YPqZacKRi0 w==;
X-CSE-ConnectionGUID: Wp6noEB5Sm2ePKvQxkpvlg==
X-CSE-MsgGUID: //I5/CQ9TkmFPYVPtFQdKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17279215"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17279215"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20534021"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:50:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:50:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:50:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1lvs9A81Dq1xEZUN8RllX7gR/TkltTo+R7LGTmZyQG+moxA0uRnyb2jhSjnSqoNzkxjbiv19h7yr2DuRouL1bqm/5tO7dvR2IeOw2YA+r7NofoW0uqTHasTqbOZDNJJng8j1V+zfDlR/C9FDAkI1F6go80+kFNsk2kUQ2cQfBEwHP3x2O+cPxWKi0qAT83tsl15dWngaWStXZIkcN+fnlU6h0ThybF8kUl2SvYcLon0jOqHkrySO4phsy/cHH8cWgI/0eJwrXEUPQvnVqjbVqYMDuRMylS95qurSAYjkV02YSOnTxVtbjirQhwcj9e6N+f5yHXmg+BnLPN87Nsgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDglOfGpl1x8GQLAC9W79oVECOrdQF8p7j/sT+EhhvQ=;
 b=BPVGkesMvZySOkrxX2haNh/fiFMc2GANRJf8Y/IB/iu+VEBDcNuB0aKW8mnttQyMh9LICeEL2NZAhcbv9lksGNlMiJeVVA1OdLYm2B+Q0wtGiOhcFjtP65zGyOIwEgP17YwYRLNw+09KBC4kXvC0p0y2cpRGkCbiyXajNILdzuC43MkXVcOgr0WLClKQLF5WdRcl2ffEv3fnArsAN+uFAcJjL8Ym2kSx5stWN0MbThv1U6+3ouAGdIrWNF8yxDAdPiXRMkWusqKUEHJ3sa0+9WvZnbsDceu13ASMtcsiS4/6UqrThqnFnztlPxFH3vFmFOKlsjvHRkcjgCSdg/CAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 18:50:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 18:50:20 +0000
Date: Tue, 26 Mar 2024 18:49:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
Message-ID: <ZgMYobhZZn9dhAkQ@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-13-matthew.brost@intel.com>
 <SA1PR11MB6991D7D3A5598E5F6492C1B192362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991D7D3A5598E5F6492C1B192362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0353.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6712:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcOxzoUEJO2XY3pi/emeHhiLXrbX5BpMDe82QSFg3JGskcxQVxt1BtgsvVKBABmHEX4Pdxx0Ho76rA66nJ4guUFxmu52TLGGWquZ8+ukz6CRGDi5FkpnMJstQ6T4/KQd4WPecOrnpVqfkkRcsXjYUxaCbVdqZ/juvTDNSi2kilE5rm+DtoowGJRG7ygnBXpNQSNVCWF7ROkhOiwVuX9WyxJpd8xTro5WkaC9PUpjlPzN6h2V4hpPF1QiA+99uMQ6IDOVXTDuvzM6auspJ4wwPZIXw0cpBISL/vIU6mAdmmvJytzmhbMg6qFb66xM8T95Oh3pjWhe0gtBWfMEnHHjcr7g+PbH8o3n4I2lw1Am2u7TL7wIrof+eUYY1ZTRhF+kNjnG07UejZzYgerd7WtSwWMgAzKpZ9YFy5yfRjEA0hbdpCaAhxrgq5aWhVSoTYDdEkprsMpL5t4paElHXCB022Qj4jAiWMVkY+ulX32NHmTKVFofmBY91qx+CUVkjkZKgKOo7UFnw4ExgzMTFSYx04f6NMQ8BqJHqAOLHiOEoZcni+8zDIJNQDTS6jzAuvPcCqboARhAPTpjlns9jVs3mGIWIkk4t4zNd6Sq5hGq5s+qVJAEEeB1W8UtazUd+Iih0kDJmAtsaub2tM5qwz7vrLmsMq7Zl3WsmgLPpMMbgVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ns10VfBmtOHBygV1SoY8t8IYcx33115HhUy22srDYOEQ9cxucELRihViGTHP?=
 =?us-ascii?Q?qeh+IWFfOMtGNpmSwy6z4xb7sT7LKPeMzogIgzswz4L587CPoBdvjHbiFXIE?=
 =?us-ascii?Q?Ks/UmBkMpqtam/R9A6yTSloEIHT+x/Y3L0KHmdHUCaDIepOBTjdke3yQZGr2?=
 =?us-ascii?Q?c8TUkN33VAhwT1J6OttsLaIxXJYTkG6CPBFSfySRx0RqEMEsyfdfqHapppIQ?=
 =?us-ascii?Q?6+7OCXMnRM3nbVyhDkSMSjnM8wIuWo42OwA0RvR4PHPaZvdvzKp6nlQnE7Dg?=
 =?us-ascii?Q?rjM3p2NO8BevskXq0pRxOg6eQK3+F7klpE+KCAKFOewIBSO9VZN/OVwKZCA5?=
 =?us-ascii?Q?e2jRBfUyVJ2VygcgGckXDo/x4PxK7pb91nnZnJS2Q5CBF2xODLpmR24ISdxn?=
 =?us-ascii?Q?gv+ZA1/UI+6V3C8Bkx8juMdNt4eCkTclw4/tiPM8XpVH3k5AOlHUwxGPZOcz?=
 =?us-ascii?Q?IyVNzFeXaZZmCPj/NdfPXMMx0nWIu3y9c2X6VOa2VkAF4i0Cfn7RxDvBmoRI?=
 =?us-ascii?Q?gpInXBpAQYQ76u8GDSnXF9GrCR69vbWg1HiB3W3kkek5b71n8b/BoOT0rDWB?=
 =?us-ascii?Q?BtN7aOgbL3Zyq/zYm0p8CokkpxbD4Pjh8F1fF+PTPr0g97lJJ3E8QouGMHyn?=
 =?us-ascii?Q?dBdPuCyjJ5gPSDxyMZaMEXJTjyxwPUYC8lzB4jZm4RUk02VBDgFZ8HqMlcme?=
 =?us-ascii?Q?PHLriaVm/M9ygNBdkNTrAkzJsiZUjP/ZEuGqoLE1h6DCO/m/tLNC4OGHlbSz?=
 =?us-ascii?Q?JvbsOVkNou3QB8BY5AiJL1ERErAbszs9XxzhcjxOWkA+uSJbgb6zM+GgVa9z?=
 =?us-ascii?Q?qwOeAhkiZVJAHvGpZV2R3XzCNfM4Jdmlegp2zttJNn4p8viPZk4+GcLdDhEw?=
 =?us-ascii?Q?59LArfvMANaFwJtqjNKN9U/Vyl6nkX7DEifM6EjVtNyQcx/4NAaZ9N2DJSgW?=
 =?us-ascii?Q?e+O17dinxv0Ki8SDsUEh2lbyQYd2NJoYnYu4W9pTDOPF6M8gYl2nd+AV+pVN?=
 =?us-ascii?Q?matJkk0JWpg/R92qGIUWqhx6QktVVn7qo6os20yPhPlpSR3PcfcjzaTdgiGK?=
 =?us-ascii?Q?047m5yxHWu53hXptQK/TeKe5G0HGNfeNip5YLHosHQ9rC8H1RRhXw51a98Ic?=
 =?us-ascii?Q?cL1NwSdf5/xLQtS122+hCmbCmUwsn499bmFP/kfqdFJhjTcXbFAorAxCa7oW?=
 =?us-ascii?Q?ydiRf8BxAFNp+xGeIjG3tVABXE1X7HUNyn/LKbi0VWUKmnRUAgMNxV//u2iY?=
 =?us-ascii?Q?z0CUezTDQSnU1K4en9HHZmUT8oxhePDQxsiplSrbJM/TVASqr/zy8nMTttxy?=
 =?us-ascii?Q?L4jqYmkT8xIqCGFZ/ctLIYL6SLfXbUJt0wGTpC3GWw4fjYW2DoimFmphWvut?=
 =?us-ascii?Q?7Nq2vwneYLqYqX5lTzam6xq5UXLHWEAk4GSd2eMZemoTwXWeDl/IXxtcyvEO?=
 =?us-ascii?Q?O9PRxLPsCOnVafVMj9oshQatDg8D6z+L8nZ3pOhCwKNXG/tlBl38uBnHmLvQ?=
 =?us-ascii?Q?sit0GtDC6jZyb2CDELdlx2U/Ew3TdSxHl98WNnj5ZmChBD0vqR9qoadjAu1V?=
 =?us-ascii?Q?oTsegBTJj6RQm3b4X8UNRU7tXaCKgRIlxo/EjBNuvtzeqY+OPgzeHbGxwjDF?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 513f64d3-9858-4c66-a59d-08dc4dc595f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 18:50:20.0882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlSK1Hl92q3R83kL3TXjMnOj0JG9wzMlgCGMbabcw1+At8EZt7o2Lx/snzr08Hiu0Ga/iKXcR5zONwja3GAgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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

On Mon, Mar 25, 2024 at 02:37:28PM -0600, Zeng, Oak wrote:
> Patch makes sense to me. See one comment inline
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 12/30] drm/xe: Move ufence check to op_lock
> > 
> > Rather than checking for an unsignaled ufence ay unbind time, check for
> > this during the op_lock function. This will help with the transition to
> > job 1 per VM bind IOCTL.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 33 +++++++++++++++++++++++----------
> >  1 file changed, 23 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 4432531f39fe..5767955529dd 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1665,16 +1665,6 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct
> > xe_exec_queue *q,
> > 
> >  	trace_xe_vma_unbind(vma);
> > 
> > -	if (vma->ufence) {
> > -		struct xe_user_fence * const f = vma->ufence;
> > -
> > -		if (!xe_sync_ufence_get_status(f))
> > -			return ERR_PTR(-EBUSY);
> > -
> > -		vma->ufence = NULL;
> > -		xe_sync_ufence_put(f);
> > -	}
> > -
> >  	if (number_tiles > 1) {
> >  		fences = kmalloc_array(number_tiles, sizeof(*fences),
> >  				       GFP_KERNEL);
> > @@ -2721,6 +2711,21 @@ static int vma_lock(struct drm_exec *exec, struct
> > xe_vma *vma, bool validate)
> >  	return err;
> >  }
> > 
> > +static int check_ufence(struct xe_vma *vma)
> > +{
> > +	if (vma->ufence) {
> > +		struct xe_user_fence * const f = vma->ufence;
> > +
> > +		if (!xe_sync_ufence_get_status(f))
> > +			return -EBUSY;
> > +
> > +		vma->ufence = NULL;
> > +		xe_sync_ufence_put(f);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
> >  		   struct xe_vma_op *op)
> >  {
> > @@ -2731,6 +2736,10 @@ static int op_lock(struct drm_exec *exec, struct xe_vm
> > *vm,
> >  		err = vma_lock(exec, op-
> > >map.vma, !xe_vm_in_fault_mode(vm));
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> > +		err = check_ufence(gpuva_to_vma(op->base.remap.unmap-
> > >va));
> 
> This is another reason we need to rename op_lock...
> 

Agree.

Matt

> Oak
> 
> > +		if (err)
> > +			break;
> > +
> >  		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap-
> > >va),
> >  			       false);
> >  		if (!err && op->remap.prev)
> > @@ -2739,6 +2748,10 @@ static int op_lock(struct drm_exec *exec, struct xe_vm
> > *vm,
> >  			err = vma_lock(exec, op->remap.next, true);
> >  		break;
> >  	case DRM_GPUVA_OP_UNMAP:
> > +		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> > +		if (err)
> > +			break;
> > +
> >  		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
> >  		break;
> >  	case DRM_GPUVA_OP_PREFETCH:
> > --
> > 2.34.1
> 
