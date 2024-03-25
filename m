Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA458C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 19:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601D10E0EE;
	Mon, 25 Mar 2024 19:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XstUEtjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F6010E06B
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711395431; x=1742931431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gY4YAMDCmDKlvYstcAm17xPW0atPlI5EMumctRXTB5Y=;
 b=XstUEtjhyO4otQzZIgcz9yKY6m4uUqsnHSrxV6pHmvgztgoTQv5BBuig
 t4B4BTF9qVPwlFI9qVglSAEokjiWjTmESBw/wgdwoHgOI1jzOdctT7OtZ
 9HgnmpW6sXeN0Nl8s0wOP7eVKyTRLnOCQU5qEwkAcmumd4y8FOb/NaM+8
 COf8Z2Uti24TsLJWubzrwWUxTsy0kpG2kB+9rtveGY5ONS3ZrbSHncYMI
 YDCZrJUixMDCYYkx5u24fRdP105HX6x/bflF423akYQUv8cPXHBQSyFYN
 Uh1kSW1Rk04zNjZ+z+elLuaPMLvywOBNJzU8Grq3iBgwBtI1klb1VJhlM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6531126"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6531126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 12:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="46872198"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 12:37:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:37:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 12:37:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 12:37:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 12:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8vwWuU8Odf1c9jFKHV5qRFjCwY9Qjh/ZMjpfHrbYbvnEsZHbw8DhFdvFIf2OK8r9zWRd5QpO017uu8ARnp2DVVBGeJF7aj9PHkY5cYM1yBfa9USnGIznRFEnlH+4PTOxGLG3phKaSpaiY0wfe2P3XeCR7uiQzn8RU67jt/rM5zcYUJdKg9u4wPpqh/ko+KmCFfurJFMSdUTs6Ain5EWRO/WrXZcsUxsl64Z5inRF3YMDc5V9bBt+hFJpiYA/5PDSFDcoabox0hZd0X0jSimTNmgf1nQhQkRf3WGly10bPz4H7AFKBiPmCuWWLZVN9Y2TC1NuXb2tctfdlPNGBOtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ71VkUKO8KKLK6bLVSwegqj1sC9io3WRLxuyNnxBh4=;
 b=ERB0YTBhJdL+MiFSX1fJdeY9Sq3Ts9m+pN9W4znQ8jNT8nkp1k9dJy+3UDg5ivUbba17qlaEARFtBEny0rw2ZR/OYs0OtyuSchvi899hzcsDkpezQyvv9FvakkqypFSIKGyJPk40DZY2BK+722UE1XoKJvfmANzk2DOnkIbhU5MCqWXNmZrjBZ85912lbXpqAuVo8oIlcK5BBIsrAITF7F9wtBnJGl+iONbNyVvkpNvEUA/WGE75t9U0GhTlkNcmIOtEST4QGMjEKEpddGHchCUlA4aHy4OQa1sC/AjhQjV5UiET3TryabYmPECsn/2ccIDyH1TsSLFqPDpO/Z3ODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.32; Mon, 25 Mar 2024 19:37:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 19:37:02 +0000
Date: Mon, 25 Mar 2024 19:35:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 11/30] drm/xe: Move setting last fence to
 vm_bind_ioctl_ops_install_fences
Message-ID: <ZgHSGxBPuRF0hwLL@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-12-matthew.brost@intel.com>
 <SA1PR11MB699190E3123611C3AF88D9BF92362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699190E3123611C3AF88D9BF92362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EmXAZrkxpNd/sVTE1el+cgAR1/9a2gyYzrZHqak1LLyf2jrk1F1x9r3Y2BMjusDBWcGgMghxe4Xt4CFtImxcVTiy7/DBAhzflYowuoqRynuPKnDDeU40XW1ojVqcKoFaC6OdcBcavOH8ERTkl/R2fjAJ8gdY2y6XdsgDl2UR/i5hcTMV0Wd67Gk6BLK9KKHrBbUE6OQ7H1WweWdqoHMh3LZaRlcBvo5AxfIeZAU1EXgSe3PGN/cfzIN0MkF52Pzm8zu5MoXI7fkIPCzVkUWDkyTm1OATRCSmuO9346obUCAjMn5fUdY/AFjfGgXrYdc+rXGRUttQqOs/kdxIexcEWRvSKSy0zoQHGQ8sYOtTYmUKBG3wAKc6tPcS9B73xTe6UQ4J+I5q3gkEavPI/qYzHGIZ/mxOsUWvR22p+cvxdj5lKAi/PPIdzDgjIVcTIDqeBsCY96BHQCIJJUg+P43R/npFB+dTP9M8twv6nF7IAVSMKjfeFSEgtdZzH15PWQ8PzS15IoDS97Z8XP9VEoCmyr6Q1CvUAMJMkaoCJZmtng0yc6duL116rHWSPjFRNbnckzvLXhVWBgqxyk47jbodcCLKQ1LZLkuYTBgTsi5A317wrJYfrbPIDQ02MOGOHD5DCDJA+hkfql3seM8kcxwAeTQPXyqtnKn1k64IOF/aYL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8w7cOa99y2F4pBMrqkkCugTsEgTsJDcTY6yk4EZtI3uce/zYv9xa1E9Bkvl7?=
 =?us-ascii?Q?j91vRivjByKnOc3GOAzRV3d1kvrKW+F2CZW323TIFkBMN0A3gZV8rEze1vPm?=
 =?us-ascii?Q?Srmkn7ek8gwRmjhqbFTzUVKlBSCe2G9MyXopJMamGai0R6O1WqQKdoq6NGbR?=
 =?us-ascii?Q?VjsDEGyOW0lpdDmvMMx3ybfWdiF9mZXC/kfCjhZIMaKbty2APuuG7GaABoUb?=
 =?us-ascii?Q?1HmSyQV7iCVlUg3LMOzlhwqxYRf2wHva3dW6MLLmkPnX/Cc9F/Kh+sIwsHPY?=
 =?us-ascii?Q?CcCkjgZhZovD+nDwL4tWqwtLZWa59xgYpSh5xrZJjt73wq9jCMQbJVQsFOny?=
 =?us-ascii?Q?s+B//d7LB2546umgNsO0wL6Z04ZT5diyquumZp/CQNBI0HdW85GBNRxvl4cD?=
 =?us-ascii?Q?HqrGjseCceaJq7Gr8ENMzxB41pjKYwKV+hwH8lEZVbxyrO5BB2b4oSIrurKg?=
 =?us-ascii?Q?07UlCTB9jkUdnJh8niN0NdvidEGYgjU8TGzfKxw98muk1bQ/MmPEGBa5S008?=
 =?us-ascii?Q?rqrRjujcugOIN9vExG3E/2ci90pQkFHvaprioPAfOqFrnsnmL2eh/EUTn+6y?=
 =?us-ascii?Q?KYLGcBqNlDCggWhHITy2QtXrWvM/v1O6oM3XQD+97Fx36e+KUeeOJKpiLUgT?=
 =?us-ascii?Q?C37SGDMgCrNTo/X/kp8QVKBl0u+ptIcloW56qDleuMp83l8ZsCDZI0UO9nts?=
 =?us-ascii?Q?iD7Tzf3G4U/VRaGTCNt5+FnFXvlQiEyTdLGlnK3H2kL4yXU621vbUbfsE1oO?=
 =?us-ascii?Q?RT4JlbJcOLSkZGSh01HadKEU5Z0b5nPtVPnaUfZLXGuNk5DpTwEp6FUewrWG?=
 =?us-ascii?Q?eD6HvbcDD1MzNhNUUwknkqVbRQektr6aomu5Cy9xFVUAbvh8i2WeFTjroYLH?=
 =?us-ascii?Q?/78aNKvZOtsOTGRkScMhNjiqEgMFompEf6UGlzlkQnJ8LiOy6dmAuY1TJtuL?=
 =?us-ascii?Q?XrKjq8+gIzSsfJHJqfIP16ftKZ1L2dEwx3068UsuHSMdxfQyQvhz/GWwuHMR?=
 =?us-ascii?Q?HtjcwTDTE+yZzCHVMFKbwjKmZrD9m+8sJyoTcgsQvPqjG7WykB0za35iZSnV?=
 =?us-ascii?Q?ZS+qwIAF2+7WTlhQkicMGMgl2doFKQhnkAbslTf4ER5pSANpTM1NMXVddmf6?=
 =?us-ascii?Q?cEyWbkXtayqeng+hG3c1FK/KJQwdB70ysULiDY0LXIg1/KHXJsS9vFQf+9Po?=
 =?us-ascii?Q?2BG06i7WivsF3vN+fpw2+h7fvyjFQPH0IH1iutUP9OQDmETTXL+ZXjrKFJuu?=
 =?us-ascii?Q?gVDJXt0vgDXbupwia4SJ8t63+ssEXPALekimr8w7DL1LJ7FFuRiKuCkZIXlv?=
 =?us-ascii?Q?UMeW607J3rU80QpC9lYxzOgf1gAUlRgYZADAsZ0Z+IZqnH+55vTCP7KVTOPf?=
 =?us-ascii?Q?8wmK4KS0dJqtx3X8uQ+/9VivXTYcaXQ287bXyjwUMthCQWzk1sf8yIodPicy?=
 =?us-ascii?Q?CLtu6R0p54i6e761N2ClKq5luxlf3ZLJ13aYmyVOxnijlLVHprtvjtwtPn62?=
 =?us-ascii?Q?gTfjoAODj3I/GZSQVAjHpyjCgV/QDiX26jGpP5OaVLlqqhuSzGMnmedAEqEa?=
 =?us-ascii?Q?rszQgZPUdcykj/FqE21Ka75bGw+De8hJTVR5HH6AvJwzuTS0ouw+jWZdT33e?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f08920f6-7820-4dd5-0d6d-08dc4d02f1ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 19:37:02.1597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxJ+gRRYoy6Yl39FJ3DWQ1ryjuK6Aa0wQ1LDKJXoZG0YGZMUw2OdoIj1NP0qv23PAz/0ssmeFGVdBCKURvClBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Mar 25, 2024 at 11:02:29AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 11/30] drm/xe: Move setting last fence to
> > vm_bind_ioctl_ops_install_fences
> > 
> > This moves setting of the last fence to a single location.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 8c96c98cba37..4432531f39fe 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1841,9 +1841,6 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > struct xe_exec_queue *q,
> >  		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
> >  	}
> > 
> > -	if (last_op)
> > -		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > -
> >  	return fence;
> >  }
> > 
> > @@ -1853,7 +1850,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >  	     u32 num_syncs, bool first_op, bool last_op)
> >  {
> >  	struct dma_fence *fence;
> > -	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> > 
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -1862,9 +1858,6 @@ xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> >  	if (IS_ERR(fence))
> >  		return fence;
> > 
> > -	if (last_op)
> > -		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > -
> >  	return fence;
> >  }
> > 
> > @@ -2820,6 +2813,7 @@ static void vm_bind_ioctl_ops_install_fences(struct
> > xe_vm *vm,
> >  					     struct xe_vma_ops *vops,
> >  					     struct dma_fence *fence)
> >  {
> > +	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > vops->q);
> >  	struct xe_vma_op *op;
> >  	int i;
> > 
> > @@ -2832,6 +2826,7 @@ static void vm_bind_ioctl_ops_install_fences(struct
> > xe_vm *vm,
> >  	}
> >  	for (i = 0; i < vops->num_syncs; i++)
> >  		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> > +	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> 
> 
> Oh, With this patch, I can understand the dma-fence-put below won't destroy the last fence, because this fence is set to exec queue's last fence.
> 

Yes, xe_exec_queue_last_fence_set in this case takes a ref.

> I also understand now, how the last fence will be used to signal the out-fences of vm_bind ioctl... things make sense to me now...
> 
> IMO, maybe you can squash this patch to the last patch, so people don't have the confusion as I had.
>

Will squash.

Matt

> Oak
> >  	dma_fence_put(fence);
> >  }
> > 
> > --
> > 2.34.1
> 
