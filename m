Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7073C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32210E203;
	Fri, 22 Mar 2024 17:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyl7qata";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7816A10EB84
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711128738; x=1742664738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J7ja3dAtmeyI6HruNWT9YCZlEip1FQJzg6MsbFGgqaM=;
 b=kyl7qatacVleEB2Hy+i9KhT/AETaffD97lHpwHJyYR/E2E86zjzUU85y
 7pkkeO3e8TSvfZoSpeVnDoiPJJ82roPdjCwZ5c9pZVxmQEYVDxdtgp0HM
 9PmhseFIVe7dH5e85NFEYtjVa7n0XFr5iB3gBHjfA9A+cyCd1nbA3zDWb
 QKpSul7NnIZlLFkmqWUs2Ri6cQmeN2tk/s/eUBGHww1rjENG8kXVKE1ah
 +EmsSjV+f7up96mDWheojt4MYwvGgFBVvepudf2YZyNBU4eQs7nP/Rudu
 E5SiMKpn6GctnqWQ2HEZE035IYOFlzFOnwwdDGYneEcIwTeTeLPBdiltk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9139602"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="9139602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 10:32:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="38113783"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 10:32:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:32:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 10:32:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 10:32:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 10:32:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/5eAlHFZuPhLvwIeSArWzzPhLHOAtUw3zV9t6xppLdvikPV6XAuu78aS32u+1UrGe+HBTq+D3QwWsvJWBemKDcAPp0Tch7KQ76ym2v+FPu2XiGaNbGejBAAPU4DTmiU9cpUAcvJLKpCfbJZhBiT0aJnABJ2c84ZL+8VbIKwztKwik4/SshXvmrsSj0Mrpai0TdZQ2AE8NkODeuh1GUsjPAz7UvA9qUQQPuatgUXIYt3k3Ew6Du/RL+U/pTf7GJ7PpIC/a7CwITUFO31R8mnMHnI/EscEG7QzpnWZec/GcxL29Y+NCgIVebLP0MqZ8Dth+ChaOWECRymqfvPxCS2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zceK0a8aGEUIT7FzR/+Ph8AZM5hQb24DfLpv28fhSso=;
 b=XwQ1ZQAzYB8VvwBCpoR1owSDxw7a0jcSUSNyx+1aY3C/tYUkpYIOuXrzO0jz0YrG++WMwMFKo1muBYcjPJhAcsHRi0rtvtGhLIlOOT0PPBWmo3ilTU5kDpK4UO1i92w5R8mdt/5dWMQHkw0CD51P40WTVvz69avLq+RyrGu8IyT2jySzHXR3J6jepd4Abz5zaYs+BD3sxlao0gICChBFD2otDtOuSdMrKBMM0BKLOwwz9Bd1mwjHVNu5z8g4/PsY1n/TbpIH4lrWptz47Evy6gXg65q1cnA2RqRXJkms8raU4WdSmdfxno6lLmdphyVQP/uLdVjNfX3EwGG0Ja1rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7244.namprd11.prod.outlook.com (2603:10b6:930:97::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 17:32:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 17:32:14 +0000
Date: Fri, 22 Mar 2024 17:31:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns
 a fence
Message-ID: <Zf3Aa/22uOZyFs9q@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-3-matthew.brost@intel.com>
 <SA1PR11MB69911B8FE510C66BEBA9F32D92312@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB69911B8FE510C66BEBA9F32D92312@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 640b749e-081e-4ed6-d7b3-08dc4a96031a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qmI8GUG6gKcjWheVLYKtvZgYuBqIQWGz1rJ9tL375r1taBISUMo5GjVhTNQNAmukmN2OZ7wAAwWqH6B/skSkBD18+BpcQDpQdrfvie8rQG3dUe7Yq1CJBWNKaTyK63m5/HlZSAKb0Jaz5TpDridt3X2lCBYdAj8Uv4TY9nt2ugCBfdvKXyEo5kUslr3GbS4KFkyrdWFvqqVfhy0ZbUh4J3AZPYQAYMh0qda/gCL6JqhRWSVtTTjkNTPkWSbY+stLOhe84tRhrc9giY5gSXnrU/KHGQKAKX4X79VGotYAFis133tW8BaKVZc9Gl4RZqpJnw+lCswuIey5F6vV1GR7PRynBDikntdcMYnH0m9alit/LUblJOBBxDfLXP1vH7I8P5WPXSdaIadAG5bxZjthSTgZhkdFLnK7I/OjK3tZUcXDNqPDSZZWCawtf0VOtWlKjmnnm+MiYtconqDzGkudIqiktZCn69WXHloMu3Weh3QvJrXXz6kQqSHTiFjQ8mtLhrP2D4zW5EUtYJmtF7OyeIrx5aIVp26Y6tQRTL4om0x7umAK3YSioBmp7+2DCqHUIGFsxCzgs0fSec/Kx5xMK9rq+yioLq+6Lw7d/xlt3iwoc+XX9XFSAXo9kDNG99KndzqMyeE0o4m9f38MbMW/7tNWLMqNIOedzAvi76rygc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBY2QeeYs8VyQwktLuFPk5p7qwcRwELjrIUDnL4gVOfFV+uECTGKzF0rIkJD?=
 =?us-ascii?Q?kJrqB/QHr1fm1I4XWGbsNwAoMaZOlCZjvpKmbIO0NAnRdZETkT145nP52ejf?=
 =?us-ascii?Q?h2XyR/w++cZhXiT1o11q2tlEAtvmrocMQpFsmcWs6W3dV0lg2BcvTXxXZntu?=
 =?us-ascii?Q?y0h5DPYMpmaUb04kbVu4XmNKah9KAMjHwNK7WpW7A/hvq58DLg1Ijz9NdCNI?=
 =?us-ascii?Q?DLHm2oV5vRb+IJRAsAyLsgXIMYY7ayMPP8MbzjSDKx2DNYCq1rzZgnlQPALL?=
 =?us-ascii?Q?dR4U1dvfv3j7JdOSmpBFWElmRGLq8oVdmdsHhqVT88xvg7N2UbVPjbx+Ka1r?=
 =?us-ascii?Q?+6oSRjCNlMygGAudgv+N83jCo9DY7O8UNcvNvqdjSDHS0d+pUfXCr+vOYANl?=
 =?us-ascii?Q?wrYt0hSOSbNbeNlja9bboK29vTJdH6Lmz4AFukqbQiUyZkQexkD/MXN6MPRs?=
 =?us-ascii?Q?Qmngk2iaYq10Zi2sQHct3eU0W0TRsueZv4Vt3A+QatALUMwtoGyUhs4j3a8z?=
 =?us-ascii?Q?ak/6aDPgQf5JwBIOMPiiqW+ipMuYZrY/JqB1NCgbhkPtnTXHacTTgGVZFc5J?=
 =?us-ascii?Q?ArAaRwziyfoSaXmH5RXosCnrvuT4HeeQ58nyxrNhISydCKFItgwiEKI10VFS?=
 =?us-ascii?Q?4SVbWQatftUnmPv+t0lBnJGkLJtMkd7NhQTJctMWWh8LULWL1SYFPIEkK/Tu?=
 =?us-ascii?Q?WY4H2z0aLqzVeFnoaM7ndyeBQ9VtBVXuUIRaj8Z96KMKUQZcg4NzAebB+wDH?=
 =?us-ascii?Q?PkgZVq79CHxqHyrc7REHGlAqa7ou7wJrWoyNFBHjdFr8Gk+yYM/2ZFPReZdj?=
 =?us-ascii?Q?RvtpW8Db8b8bTcA8vMwBdQTJoJXQ3M8PFlOIkWUYXiiL3P9423E8dLJC9Uph?=
 =?us-ascii?Q?ZW8YNYcGu1/G6oTYGjPycCTuE9p5gCX2TxFbpodW4gbQo2FZ1nLtuUiomYAm?=
 =?us-ascii?Q?XwkvGkG0fZ7QFzQSrXlANNYTW3PGOqCjrFbp1ztxh8CMzlI6UniLo7nar0Jv?=
 =?us-ascii?Q?0bIpT5VSWT7LZCbZ6uWf/+VSyRzmFPk5F9GgF5UoSn4u6dk0KTYgaoZHxGXx?=
 =?us-ascii?Q?3085UhQ4v5vHCqefS9qmJML+s6BiFW14+psMwdKQ0TrU3lAOozB6k0GYLAm7?=
 =?us-ascii?Q?+DI/0kxlvkhpQWwl6JFB1p7kPEZ0b/8T1847WAQ85QJWs+0BJ/sv2cb0jm04?=
 =?us-ascii?Q?b+mvtRHxB5YwoOJRDS11I2eneo/f1EBK5EeO2vg2wBIuEm2+ceFJQRjwR7ak?=
 =?us-ascii?Q?bRfVKMYHLwhWlRb10AWWhH5/cNAGP82LEZ8/r7o/KX38qLIx9hVHsKs97b9G?=
 =?us-ascii?Q?upjbWMW38GRxwFXLCC2BMj5el0U27qglyE4Cwuk+N0NDJ5M2KD4ZmEZBoicw?=
 =?us-ascii?Q?2EDWHesoxfSfxF2zDbhCA9zDmII3UY2oHR8/Y6IxCgbUa98AP3YhK7HCOOmP?=
 =?us-ascii?Q?zMUnalvOhF6PoX3kBd91amkHSuLR0GJXjCX5S8mfi8K9be2Pxr/nHdbETdFM?=
 =?us-ascii?Q?U9YPqkWDSJTM7Ei1kCNWm+RGY+IW/0XxjOCBR4p7kpCWnvDdhyCFWutWdYZl?=
 =?us-ascii?Q?hzTLBEP0kW9d/gkymOeCTSvFsvlzy8hwUvdLX1AT7KVORKvtcIsuToBrdSmE?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640b749e-081e-4ed6-d7b3-08dc4a96031a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 17:32:13.9318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXNq+DquKKp2kIoNqGJFDVMgiriDh1ALas+HP87tdvapesZJhh3JDl3mpmF+kx5K0GtrNRcJiFQihNEBFCUk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7244
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

On Fri, Mar 22, 2024 at 10:11:41AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 02/30] drm/xe: Add ops_execute function which returns a
> > fence
> > 
> > Add ops_execute function which returns a fence. This will be helpful to
> > initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
> > preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
> > Returning a fence is needed in various paths.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++------------------
> >  1 file changed, 111 insertions(+), 100 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 3b5dc6de07f7..fb73afcab3b7 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1789,16 +1789,17 @@ find_ufence_get(struct xe_sync_entry *syncs, u32
> > num_syncs)
> >  	return NULL;
> >  }
> > 
> > -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > -			u32 num_syncs, bool immediate, bool first_op,
> > -			bool last_op)
> > +static struct dma_fence *
> > +xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
> > +	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
> > +	   bool immediate, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> >  	struct xe_user_fence *ufence;
> > 
> >  	xe_vm_assert_held(vm);
> > +	xe_bo_assert_held(bo);
> > 
> >  	ufence = find_ufence_get(syncs, num_syncs);
> >  	if (vma->ufence && ufence)
> > @@ -1810,7 +1811,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
> >  				       last_op);
> >  		if (IS_ERR(fence))
> > -			return PTR_ERR(fence);
> > +			return fence;
> >  	} else {
> >  		int i;
> > 
> > @@ -1825,26 +1826,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct
> > xe_vma *vma,
> > 
> >  	if (last_op)
> >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
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
> > -			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > -			u32 num_syncs, bool first_op, bool last_op)
> > +static struct dma_fence *
> > +xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > +	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > +	     u32 num_syncs, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> > @@ -1854,14 +1843,13 @@ static int xe_vm_unbind(struct xe_vm *vm, struct
> > xe_vma *vma,
> > 
> >  	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op,
> > last_op);
> >  	if (IS_ERR(fence))
> > -		return PTR_ERR(fence);
> > +		return fence;
> > 
> >  	xe_vma_destroy(vma, fence);
> >  	if (last_op)
> >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > -	dma_fence_put(fence);
> > 
> > -	return 0;
> > +	return fence;
> >  }
> > 
> >  #define ALL_DRM_XE_VM_CREATE_FLAGS
> > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > @@ -2004,10 +1992,11 @@ static const u32 region_to_mem_type[] = {
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
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> >  	int err;
> > @@ -2017,27 +2006,24 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct
> > xe_vma *vma,
> >  	if (!xe_vma_has_no_bo(vma)) {
> >  		err = xe_bo_migrate(xe_vma_bo(vma),
> > region_to_mem_type[region]);
> >  		if (err)
> > -			return err;
> > +			return ERR_PTR(err);
> >  	}
> > 
> >  	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated))
> > {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> >  				  true, first_op, last_op);
> >  	} else {
> > +		struct dma_fence *fence =
> > +			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
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
> >  				xe_sync_entry_signal(&syncs[i], NULL, fence);
> > -				dma_fence_put(fence);
> > -			}
> >  		}
> > 
> > -		return 0;
> > +		return fence;
> >  	}
> >  }
> > 
> > @@ -2484,10 +2470,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
> > *vm, struct xe_exec_queue *q,
> >  	return 0;
> >  }
> > 
> > -static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > -		      struct xe_vma_op *op)
> > +static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
> > +				    struct xe_vma_op *op)
> >  {
> > -	int err;
> > +	struct dma_fence *fence = NULL;
> > 
> >  	lockdep_assert_held_write(&vm->lock);
> >  	xe_vm_assert_held(vm);
> > @@ -2495,11 +2481,11 @@ static int op_execute(struct xe_vm *vm, struct
> > xe_vma *vma,
> > 
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > -		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > -				 op->syncs, op->num_syncs,
> > -				 !xe_vm_in_fault_mode(vm),
> > -				 op->flags & XE_VMA_OP_FIRST,
> > -				 op->flags & XE_VMA_OP_LAST);
> > +		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
> > +				   op->syncs, op->num_syncs,
> > +				   !xe_vm_in_fault_mode(vm),
> > +				   op->flags & XE_VMA_OP_FIRST,
> > +				   op->flags & XE_VMA_OP_LAST);
> >  		break;
> >  	case DRM_GPUVA_OP_REMAP:
> >  	{
> > @@ -2509,37 +2495,39 @@ static int op_execute(struct xe_vm *vm, struct
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
> >  			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
> > -			err = xe_vm_bind(vm, op->remap.prev, op->q,
> > -					 xe_vma_bo(op->remap.prev), op->syncs,
> > -					 op->num_syncs, true, false,
> > -					 op->flags & XE_VMA_OP_LAST
> > && !next);
> > +			dma_fence_put(fence);
> 
> 
> So you drop the previous fence. I assume in later operation, we will need to wait dma-fence for the previous operation to complete. Is it safe to only wait for the last fence? Shouldn't we wait all the fences, such as chain the fences in some way?
> 

All fences on single xe_exec_queue are should ordered (e.g if the last
completes all fences prior are also complete).

Techincally this is broken on tip and at this point in the series too as
we mix job fences and tlb invalidation fences on single xe_exec_queue.
This series gets around to fix this once we convert an IOCTL into single
bind job. So this patch while not perfect is regressing anything working
toward 100% correctness.

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
> >  			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
> > -			err = xe_vm_bind(vm, op->remap.next, op->q,
> > -					 xe_vma_bo(op->remap.next),
> > -					 op->syncs, op->num_syncs,
> > -					 true, false,
> > -					 op->flags & XE_VMA_OP_LAST);
> > +			dma_fence_put(fence);
> 
> 
> Same comment as above

Same answer.

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
> > @@ -2547,34 +2535,36 @@ static int op_execute(struct xe_vm *vm, struct
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
> > +		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
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
> > @@ -2591,22 +2581,24 @@ static int __xe_vma_op_execute(struct xe_vm *vm,
> > struct xe_vma *vma,
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
> > @@ -2619,23 +2611,23 @@ static int xe_vma_op_execute(struct xe_vm *vm,
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
> > -					  gpuva_to_vma(op->base.prefetch.va),
> > -					  op);
> > +		fence = __xe_vma_op_execute(vm,
> > +					    gpuva_to_vma(op->base.prefetch.va),
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
> > @@ -2803,11 +2795,35 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec
> > *exec,
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
> 
> So you only return the fence of the last operation. In the later on codes, do you use fence to wait for *all* operations to finish?
>

Same answer as above, all fences on exec_queue should be ordered.
 
> > +		}
> > +		if (IS_ERR(fence)) {
> > +			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
> > +				 op->base.op, PTR_ERR(fence));
> > +			fence = ERR_PTR(-ENOSPC);
> 
> So even if there is error, you don't break the loop. Is it to perform the cleanup below?
> 
> Once error happen for one operation, you seem to print the same error message for all the rest operations....because fence = xe_vma_op_execute(vm, op) is not called anymore after the first error
>

Yes.

Matt

> 
> Oak
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
> > @@ -2820,19 +2836,14 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
> > *vm,
> >  		if (err)
> >  			goto unlock;
> > 
> > -		list_for_each_entry_safe(op, next, ops_list, link) {
> > -			err = xe_vma_op_execute(vm, op);
> > -			if (err) {
> > -				drm_warn(&vm->xe->drm, "VM op(%d) failed
> > with %d",
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
> > +			/* FIXME: Killing VM rather than proper error handling */
> > +			xe_vm_kill(vm, false);
> > +			goto unlock;
> > +		} else {
> > +			dma_fence_put(fence);
> >  		}
> >  	}
> > 
> > --
> > 2.34.1
> 
