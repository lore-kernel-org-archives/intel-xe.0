Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B858CC54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 18:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A91910F1EB;
	Tue, 26 Mar 2024 18:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHN6WXbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C4A10F1E9
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711478895; x=1743014895;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Mb/PDqFuNkosyOZ3jek9pnrfI997tEmhJYAPEMtysI=;
 b=jHN6WXbKv8S+5P9EDnNyS8RZxHhRDFvcxCM9nrJ4qQaB7ToT8xJhb1Pp
 rgEXN9Z4o5lHGcA2i2xBeCBxFUJK8/qTpD5qYqxfYI70ea/D0Ord8psYd
 MdS3cp/sk4pFN6SKhauil3Lwakg44yhlcIxj30OmCBflTkyzeqGwvQ/3D
 WVVIlf2sBV95hdQjvAAgmimGh4Pn4gA4Sg3u/WGXmPlHk3ntc1lVfT1yy
 ObHRY251UGkJLtF1IUNQLKG2CLveCj8Ep8889RypgwHrzWsCW/xpc7beg
 LjDLJYqS+bSDgLAIdRAEAbGPLa6yukSNOzALdqnuQ658UZZ390JtIdhFD g==;
X-CSE-ConnectionGUID: QoPBoeFCTQCyRZS4TFRxIQ==
X-CSE-MsgGUID: caQoj7uTQZe60361BuLEqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="31991189"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31991189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="39146391"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:48:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:48:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:48:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqxaNGYlupjXMeP2Zdxoi/UbswD9CLi2HUyWYZpKA5if5HDUxqFyHs+4aTjO4izNUvxxYda5wldi5HF3q+kPu0Lx/+sk0YVsFA/oiiqu4vGY1fSFsEm86uYNYn5a7qPCMHz83dsX55yTvjmAXCK/RTJfLlUECqa0yDfWvzU8IMEFGGc1beAaQwexmvQlEwpjr+brlN8WpBgqsAGabnlPiTKog7b6Nrrqk8CyC+Uy/oA/gR5RjYSvTyNL5AIHz9DPulzgqNebc0kbFBO0na0TK7n0/KSnQ+3d7ek7LgZhLKteSLTHiUYQn+73JEKgPnhcJ4/NQxoZQdv+1vX7R2G0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMgTNtfJuS0aXd/XX0A1Sk3bb/XipYCyAILymTU7i0E=;
 b=gHzKCFHJx3zWtDgHFylRfFxfhEgDvgF/1gK2O0KQz51KqUCupP1rF0weSHUbD9qeOYzkmkpXCS9AjR3GZ6LwwGeYfJ7FZPOr63MDoTzFY70YxSoMd80oi+5lsP/B6rDLORiDBvq7QiT9gE5+BOoXYs8hvT0A4/QAxQNrjyQ0hY7VXvxKC/4ejeKfc/UELGtTaopWlc8lAWGZ1islMJFVS3OdbNvF/oPkBx/8EpyPZ7/TYla65Cezy9kB2QhEOnxPqscA+6AM+Uemhv1mRg+0/NqPfcIj9/iB95nz5a2SFO85cug49PfHMkVwD+yTUq3SJjyTx4ih8c/9MuhOk36G1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 26 Mar
 2024 18:48:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 18:48:11 +0000
Date: Tue, 26 Mar 2024 18:46:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling
 and cleanup
Message-ID: <ZgMYIFKCCP76Nvcn@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-7-matthew.brost@intel.com>
 <SA1PR11MB69916B4E0EEF26DCADA88E6392362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69916B4E0EEF26DCADA88E6392362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7444:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GJRvyHb+OPV7pPplyPElZA4adCrwCDNtzTqO80EkYYjR5ti2fzg59B0ogHLPAFFXfbdLBpufFtbcneUGn7IIhnbABQLtIyktUzyiwhKZR5k9GcLrJP6LTGcfo2asDKR63CuoIoFJEY1GLpLzsxK3rpEitI+75Y0DCAN3kvrrqToUnP8fhwv79fr/JIex370Ht1h9aTHuBZUVsY33JDfAMPo1VAv6LMeZkZFYsiWVCPI/Xch3vsFrd2f6hQqiNeRnxHjmULPSZjktLmOqM9KUuYEmjkX6nIEUJFm5XM8xRsRXv2vGI/c4k3akpdKwJrInpD2qAlZUSi0T0n+rXp2wNaEJ/W1zG5LP9esSBA/ojgM2W3hU1pXD7blCzl7akJlFsfJYM6STH4vLpSyO3b+MkvMZ6h8H5sX4wV+3X522xH+8f/NHmw7SIPvCkktj+B6OpinNsh5ZD1gQP4yECI6wgDwB/Lvm4CR17v3hhI9cr//cfftXkmb9k/kUCmGZzjII0noOL8mA1/99Uwkf+TpKCLgCe8eapqFY0Qfw+++ITAncwrrzPn/DY9Nj3kJlpwOYt4jyS4fd97SN98t+CKG0su6WiEYXJ/lK0cWlFE9felVyi06Axb1KtZ1kcv5TkSzVnH7GtyGKYcdOX3cfQDR7y3PUVRVKNfaXAbzXkpRVnsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+fTTonQo/RMLb/+S7xUBaiEwvAum2AUUNMsdYD+o3QQn23VSm5sEwJdsSKiZ?=
 =?us-ascii?Q?qiro6zo2XshStq7RvPI0120JWx/Ei3iSSWiu9OawCal4tpZbSxTk9KfwzLiP?=
 =?us-ascii?Q?OPRxdHFW8aATgUPbRvx2hPaVdTeG2aBY6D/6Z6PYBInmvi0axMK+pB6FTa7w?=
 =?us-ascii?Q?ijWCuhrPykAuUenSO/v88WZyE9y3gJINB3vBrJJbdUf7xf/PybIdVyUcTFP/?=
 =?us-ascii?Q?irkRyOiOJG8F3KDvot2W9tQ2x4JhFl8yr16ZkMAYHooI4P6jjT2QueV8XhjW?=
 =?us-ascii?Q?9tKTnkxtft2w1DBX01WWCWb+Dw2AEjo5dB2mOvnwOzkVwbLTBz5wjFDTkmgm?=
 =?us-ascii?Q?Oz1EiPFQx0V2FQAK3SlmcNZ2lxe4QOik56OJn1KEYExz03trohuihf1Gvsey?=
 =?us-ascii?Q?xch1bUWTd6mrIWF/6pWWsawLVEKA4sB5EPGMhFm+Q3wl/iPGjRkEE+s4ljPn?=
 =?us-ascii?Q?HUsxcj3Mkx+WfNoHJ5lv25E94uJQ9T0ZMRyq1557YTwBBPmOJb2IfQpB2sOx?=
 =?us-ascii?Q?qSJCz4JVTZo8F4mFGvIQmaAhQGyJ3M8jFpt+Nd788coQpArfVlKfwgFKkPQl?=
 =?us-ascii?Q?KotYtQ7CfySKAtNXZlVOOrdDU9M96UZnITpMyUriLia8wlk87xMlGmjRZWxO?=
 =?us-ascii?Q?x8Q4EOV3Gm3KSH3q53uj1Aca/TwR5LUJwRNEOLcCIlyFZCANo/LRPtmDUsf6?=
 =?us-ascii?Q?Dp3AMb2lIzz0W6asJM6dnpJqYT/IDekL2PXs8HdZcyAX7nXMb6yJEyylsY9/?=
 =?us-ascii?Q?fH9RuSDTjrRU7WZRmtfEbGgkiJAqe2qy64joKuIywcQQvPwDTpImpIjM3kHC?=
 =?us-ascii?Q?Ywo7EszfWeqKKnqB8zf86dwXjmwwkybdVz7UFnpeCNwaxaMqzoiTzXNMsKWR?=
 =?us-ascii?Q?2Ed7KvClGmzYPtWpxayPAmusNjv0hcdzNaq2MBvKf/vQNfmh5ftYL7XjVTLR?=
 =?us-ascii?Q?kJpuAf5fyrowLgnOPYygO7nlU68MPe47zWrbO/Zf9S8fWpfXh/7yGc0h/Y4V?=
 =?us-ascii?Q?Sld+bwMzIUvDQ2WU2irq8KGJygIWos9M/A8umL8XQALwUuDjU5NwE6Z3GjUq?=
 =?us-ascii?Q?U7G1atw6fhedRJ2jjt0PKZXZLvQuNO6QwCZOCcYMKWjWTPw8xqdljDKrUYfV?=
 =?us-ascii?Q?TSPGRIs1a/fhXUoVeNDV2sddljR4S3M+w6Q2u7+JBcny/7KS1lD7hlpy/YCS?=
 =?us-ascii?Q?5bTDsHorbrapoNKjN+NWiDRqqJMWdIFRSgD4O6J9KCrpp39i4pUYJ88ksPC2?=
 =?us-ascii?Q?uEbplzlMWur/4+uEeQ4j8aG82n2CypTPQ0ZZ3tea/MaHXULxqgGYuZI523vC?=
 =?us-ascii?Q?ZiEuJ1yc48m4dyOyed5fPrcYLbi/P+oogzQAa/YJTE1o/Ub7QbH4Spw3cMjl?=
 =?us-ascii?Q?I3jz9BUcP+Q7b1I8kpenscWSLTZO/tQrvTuurm9z+kvrXWQwRqDoScqxnGJ4?=
 =?us-ascii?Q?3abZ1Qyr6AOnCMMjZyR8EEQ3pYRSDCLyApy7bToUT8qpVu5gO1oBWhTNk52k?=
 =?us-ascii?Q?SNrBvcpZkEpjXbtZ0XD3a7DPET5feNcacAONiMHLAVtgffwvNF4LW44FtB1e?=
 =?us-ascii?Q?4mYjO3bdONsFVthk2JB2d0Hu+i+xlR3LyXKmz+nAKEot7PWKUUYg7n103CMj?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 827a07ca-f6b6-4b0b-3f9e-08dc4dc54967
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 18:48:11.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G2u8t7p4vcNe4NnzH44KH0COBhYqixWKJnKInLhjni160GWZnuwkKcm2z2Ob9E30Ynhlx3uMmjQQSHd0+vExyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
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

On Mon, Mar 25, 2024 at 10:03:27AM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> This looks like a nice clean up to me. See one comment inline.
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling and
> > cleanup
> > 
> > Clean up everything in VM bind IOCTL in 1 path for both errors and
> > non-errors. Also move VM bind IOCTL cleanup from ops (also used by
> > non-IOCTL binds) to the VM bind IOCTL.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c       | 60 +++++---------------------------
> >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
> >  2 files changed, 9 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 0bb807c05d7b..dde777c807cf 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -769,8 +769,7 @@ static void xe_vm_populate_dummy_rebind(struct
> > xe_vm *vm, struct xe_vma *vma)
> >  }
> > 
> >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > -				     struct xe_vma_ops *vops,
> > -				     bool cleanup);
> > +				     struct xe_vma_ops *vops);
> > 
> >  struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  {
> > @@ -794,7 +793,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm,
> > bool rebind_worker)
> >  			trace_xe_vma_rebind_exec(vma);
> > 
> >  		xe_vm_populate_dummy_rebind(vm, vma);
> > -		fence = ops_execute(vm, &vm->dummy_ops.vops, false);
> > +		fence = ops_execute(vm, &vm->dummy_ops.vops);
> >  		if (IS_ERR(fence))
> >  			return fence;
> >  	}
> > @@ -2474,7 +2473,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm,
> > struct xe_exec_queue *q,
> >  	if (!last_op)
> >  		return 0;
> > 
> > -	last_op->ops = ops;
> >  	if (last) {
> >  		last_op->flags |= XE_VMA_OP_LAST;
> >  		last_op->num_syncs = num_syncs;
> > @@ -2643,25 +2641,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> > xe_vma_op *op)
> >  	return fence;
> >  }
> > 
> > -static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> > -{
> > -	bool last = op->flags & XE_VMA_OP_LAST;
> > -
> > -	if (last) {
> > -		while (op->num_syncs--)
> > -			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
> > -		kfree(op->syncs);
> > -		if (op->q)
> > -			xe_exec_queue_put(op->q);
> > -	}
> > -	if (!list_empty(&op->link))
> > -		list_del(&op->link);
> > -	if (op->ops)
> > -		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
> > -	if (last)
> > -		xe_vm_put(vm);
> > -}
> > -
> >  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> >  			     bool post_commit, bool prev_post_commit,
> >  			     bool next_post_commit)
> > @@ -2738,8 +2717,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm
> > *vm,
> >  					 op->flags &
> > XE_VMA_OP_PREV_COMMITTED,
> >  					 op->flags &
> > XE_VMA_OP_NEXT_COMMITTED);
> >  		}
> > -
> > -		drm_gpuva_ops_free(&vm->gpuvm, __ops);
> >  	}
> >  }
> > 
> > @@ -2818,8 +2795,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> > *exec,
> >  }
> > 
> >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > -				     struct xe_vma_ops *vops,
> > -				     bool cleanup)
> > +				     struct xe_vma_ops *vops)
> >  {
> >  	struct xe_vma_op *op, *next;
> >  	struct dma_fence *fence = NULL;
> > @@ -2834,8 +2810,6 @@ static struct dma_fence *ops_execute(struct xe_vm
> > *vm,
> >  				 op->base.op, PTR_ERR(fence));
> >  			fence = ERR_PTR(-ENOSPC);
> >  		}
> > -		if (cleanup)
> > -			xe_vma_op_cleanup(vm, op);
> 
> 
> Now with this cleanup code removed, do you still want to loop all the ops in the list when xe_vma_op_execute failed with error? Should we break and return earlier in this case?
> 

Yes, this loop gets rewritten in patch #18 but for this patch to be
correct, lets break the loop on error.

Matt

> Oak
> 
> >  	}
> > 
> >  	return fence;
> > @@ -2858,7 +2832,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> > *vm,
> >  		if (err)
> >  			goto unlock;
> > 
> > -		fence = ops_execute(vm, vops, true);
> > +		fence = ops_execute(vm, vops);
> >  		if (IS_ERR(fence)) {
> >  			err = PTR_ERR(fence);
> >  			/* FIXME: Killing VM rather than proper error handling */
> > @@ -3211,30 +3185,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >  		goto unwind_ops;
> >  	}
> > 
> > -	xe_vm_get(vm);
> > -	if (q)
> > -		xe_exec_queue_get(q);
> > -
> >  	err = vm_bind_ioctl_ops_execute(vm, &vops);
> > 
> > -	up_write(&vm->lock);
> > -
> > -	if (q)
> > -		xe_exec_queue_put(q);
> > -	xe_vm_put(vm);
> > -
> > -	for (i = 0; bos && i < args->num_binds; ++i)
> > -		xe_bo_put(bos[i]);
> > -
> > -	kvfree(bos);
> > -	kvfree(ops);
> > -	if (args->num_binds > 1)
> > -		kvfree(bind_ops);
> > -
> > -	return err;
> > -
> >  unwind_ops:
> > -	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > +	if (err && err != -ENODATA)
> > +		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > +	for (i = args->num_binds - 1; i >= 0; --i)
> > +		if (ops[i])
> > +			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> >  free_syncs:
> >  	if (err == -ENODATA)
> >  		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 7ef9e632154a..f097fe318a74 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -181,11 +181,6 @@ enum xe_vma_op_flags {
> >  struct xe_vma_op {
> >  	/** @base: GPUVA base operation */
> >  	struct drm_gpuva_op base;
> > -	/**
> > -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> > -	 * operations is processed
> > -	 */
> > -	struct drm_gpuva_ops *ops;
> >  	/** @q: exec queue for this operation */
> >  	struct xe_exec_queue *q;
> >  	/**
> > --
> > 2.34.1
> 
