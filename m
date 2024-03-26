Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11489CD11DF
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 18:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83910EA59;
	Tue, 26 Mar 2024 18:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFJQXJyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D6210EA59
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 18:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711479331; x=1743015331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ghFrluHSy5aTjmoGMSF3Bhefl67tRl6DlWkOS5zeYFQ=;
 b=BFJQXJyX5RZnANEALykEpYDYIGcELuQFuaJa+tXiEByGlvgAD8fERN5g
 h2TpviLcEOC2EVCPdJFA+6FFZ1gVmDr1qybJ5b9w+sYG7EXgBdLUFay+9
 2E50xyCevRR9C2kduriRARtiblGw2R6wsZxHBe2pkIOUjmAHuW+21WD6p
 fPYMR29N0i9zFb12UUIPKKFn2ESgklqp+UgVt6O/oAkhiWiHp4/MTSdm/
 f8iHn7N7le69F89vAYbxPEQNMAii4Yt1I68Q2kYCOwruSviMXRb94w4dw
 Ur+L03mpfdMO1SZqPeJNBSqeCV5I/7Dhlcoq+E3B8BFVkcwc5+WNiXXgV g==;
X-CSE-ConnectionGUID: bF/t/hTLQluE8iYDV/E64w==
X-CSE-MsgGUID: 56OalHkrTCOCTubBzq/09A==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6669128"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6669128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 11:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20595365"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 11:55:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 11:55:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 11:55:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 11:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lF9KbZrWn9mQatjET+GIPRD/Dwp3hHeTs+tULjErv9aC6hYHdGz46z4mgsJRJb8g2edYidCXCzIpROuKFsTUxpBD0i3mt8UDdW1EUkAcbZpGlspGrtr533sfXjkOC9ov2HSJOLH/dJuXJ9LfKx8PySiHsuABgtZHxtvRmgKc3a2DrcXPwcXcTVM1YZlDliNVJy2eNr4k5mPkyYwNnDufPaVunCA8nl4Og/gfgZ1i58ytPCXBvQ2oFXi51sR1DsCa15BnhzqWw4+3T0nuucMZNZIOm/yJc80wL/U8yJy1Fuihsh5Y4WvBPFImn4iGY00jbThYxgOheJ2Kym+HD9oBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCcULr/eCJi+DF2Y3VjrrvtSssf8nLEur61W6YEM9vk=;
 b=WsMAmKMQ+VaKYYFs6HR/w/dw5XwrL2JmrmnZObyDrRRTEjG5ZKEkQNPt6u7181reOVtsMHc6qXZ7OJzhDIFrC/ZPIKGVrNyyg+JFT3ZySclIUeT0ePhLzAJggp0tz3XwN4SarcuYbShMOeaSR7pyEd6JtwqZteoXftCVm5k+NJHp0xoEJ7Rmqy5wGd7FvwQln9uoTCIB9bNTYgp949/MISeFDlWbpEByLEy5QjODZrlL/9YtjE6GQ5y7UPJMp5krt8p3EQmxB0YWQinxJJpwgrSVqSDDGu2XMRIZqw9xucpb9kZLisB9lwJtXry4P8fxg8jizheyw/Ygst05n0w+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 18:55:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 18:55:26 +0000
Date: Tue, 26 Mar 2024 18:54:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 13/30] drm/xe: Move ufence add to
 vm_bind_ioctl_ops_install_fences
Message-ID: <ZgMZ2DsPwtd8lynK@DUT025-TGLU.fm.intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
 <20240308050806.577176-14-matthew.brost@intel.com>
 <SA1PR11MB6991931E0535678F8640623F92362@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991931E0535678F8640623F92362@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4533:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u17oMs8XHC7FD+b+xWFSWke2YnENb8NKFf/IhF7HKpKEDywavYFpz5qROF6A8eNKYu/i1CQOVOrAatAjynj0WzNDDIz+bARm4kzrBFoFwhYB8b3OIGcEG5IWJLWss/C2MzJHqSLEJTxksQeKRsV4vFKu1+OqzrRDhQJ7gutaXaz6AbcbRE+IyjpNYJx8RTdLCxYJv8eXMIs4EIRujbt9HsdgOrbf/h6hokHRgu26asbSuok2PR1Tsrf9qTzCl3yY/c+kkeonGRdQI9dGdqsNUYfu93OlfukMfFF6bfEUyDXkscFS8ZFBliJceJWra3pLbthBv9KbewFIpM7TLJ49nIZSxoqMrb76tkS0I8axi4jHYdwarstZhRO+Of5Kgsmxd86Os3/9/Q3xSQFiVfCDvoxeMUmFG7g//ZlB/edHIoC2pZCJiHfXzD1cqHBl+gmuxIWpbEBr6gcJhstHxSYUJq8/5NnjGC4y3WsUxfOIC29TRGj1UktKcpfekOzwUQ+G5ZDgaLfTPd/p4Prpw8vhYfp+0ETTNCaHUaPmHbzZsGBjAxZIn6eyE03WfKr0hRXGcVtbu+nRsDbqt/tCQuVK3uHsVrgmJReuElCc3wnvB7qVMUrHdQubv1wSn6DyuAN2cdHNjIM4+NIkchC4B8HP/9pacfa+Uuf+cU8nNdzOjME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rKZ1kt5ffRMj3SX1JI+HfQ4rF074v7UTgZsRKZ0MKj6U24z5Pn/ACzQYqoW0?=
 =?us-ascii?Q?FT2iwH3iDWg1dk3cCE3QyGRBUhAk/qmIkcqRf498bN7TpNCspFD8xd+fp9pH?=
 =?us-ascii?Q?t+2QKfpLTJbWepustTc4yx06KTp7Zdb5dFZtGTWgC4S2nWJBYxMam3cu8ePL?=
 =?us-ascii?Q?kGTOII05bng+902fwCL7y4VPLpl4aNU5xjHkEWKU3/5HYw57B0CD+uL5JmUD?=
 =?us-ascii?Q?uC3PGa6DXmYywfhXje4EwB+vxtgzXskCewWQL6TVnAbkyXpRry1VY6iLwq5C?=
 =?us-ascii?Q?CtV/N+0kiwFPU4P75RJhqST3vEv3FyT/o5DkkZ8276rO4FLqkwoiwYBl1lxL?=
 =?us-ascii?Q?cJacPvnL6tSoifCGXKRE6nNQKmaV/cPvTUIZaIrO256kZoaa1ZTTjmlmCIOb?=
 =?us-ascii?Q?dJf1DX+sOWOdZ9HggoRwGGY8ydr1qJeCa+dQACpGSlI2nB1ooJtB1R2uNDCE?=
 =?us-ascii?Q?rMGhBBSEDyjNYr+Z/c3gWnvpoi1dhjhjK1cnwkF40ojRzGnVzRwANRE6QN0B?=
 =?us-ascii?Q?rRlL9JJJ9gen2zr8e5n0VyR1wH0c3+RKFUlSHDc+ydlZ46HwhkcSga8Prw/R?=
 =?us-ascii?Q?Nz7s71/gxG5R9OV0XOMfODMozwcytpZhucGXlfjLH+knNs5h8cnRRYD7GfIS?=
 =?us-ascii?Q?WUXOM/uybXJPpfzMWcxnGq6RwLKcZty6grkf1S6PEIJ8imZDa3PcP709D1MX?=
 =?us-ascii?Q?6JvkprZ31BimLx7Ux8GPvuAZGfU9tECebehTgsg1ed6zQrdT7xea7vgp1/sC?=
 =?us-ascii?Q?8STRhC5hxmkcrWoYI/A8X1vNeooy8bRuoGDGQ9Jdm6963zXa2S2nfcaWSHtG?=
 =?us-ascii?Q?HWz7qANXXfw0frgP+RMCMVulIFCGrNfQJCzokouo0OoiVo3adLWvGkP1mJT5?=
 =?us-ascii?Q?ET3A51BYRA17Kbxp/3Lp8zdRCqllvbE8QUQqQVs/tieNJfwzMFQvz7a1nrQ2?=
 =?us-ascii?Q?DCMRx/jORJdo+r2OeHO3WPACJTbJ3tFjluwHxJzwUOiV1xhGtWNrvfRvJKe2?=
 =?us-ascii?Q?QvbQfaBqHOUwYywq/gDGKU5l7Z0KSUjEYTbcCV6z6sQgrzpae84AelQuiD1C?=
 =?us-ascii?Q?2x0XqP0oJVMDyJT39KEIL1gcErB7lIJvPha+UHe1Ppk57g+JSQBaPjIrymTJ?=
 =?us-ascii?Q?/l9GYc4HwJf4KHwtF0XNo4DD0UHaxX0AVHrFqbI0C+tUZdVjn6Z6LABt4ott?=
 =?us-ascii?Q?feTzwVKeJLyT7a38+8ZJ/3RESC3he5I/8Wbj9ahbuBdeAUzkHLWWooyMCg8e?=
 =?us-ascii?Q?tMa4ezMympNJ3rhLa5XcYFMutMPW7FGDdfDQIx8BAt2HDpOEMak0dDqmzDvF?=
 =?us-ascii?Q?VGb/hLjlbli29r727WDsYORaJr6W/jATy7CJlQLtoN+wzAxQdCcg68yXteVf?=
 =?us-ascii?Q?JBqaiuDFEK3YHInvXtt/xG4TJhV+IBL6AqqltTBVYqXEMSl791cd1jRP2F1V?=
 =?us-ascii?Q?QtKYAWs6zhZFv8rCTsMjQRcPslqT/5JBChldzXiWgvMi4OmRudCN5Ym+gI7c?=
 =?us-ascii?Q?kRes4M2/i2bXOhwYn/0jzGeK+2f0DEPD+c7NmQ5BOryvodmBBLPT+yFpDdU4?=
 =?us-ascii?Q?kML98OV468xVyT0nFro8GWuvpTdp4kEva3RakZ0yJGNmOM7VLhJFfOhmC1Im?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c89224-38f2-42a6-537d-08dc4dc64c9f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 18:55:26.5479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuT7gRgxRyy72I4EQSvDe9WiDJH79vW7Up2kKNd0qAur5ZMMJF/7gET02sdOBFUMbD2l9PaJGlunogW5P2dQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
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

On Mon, Mar 25, 2024 at 02:54:44PM -0600, Zeng, Oak wrote:
> This patch makes sense to me. See two nit-pick inline
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew
> > Brost
> > Sent: Friday, March 8, 2024 12:08 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v4 13/30] drm/xe: Move ufence add to
> > vm_bind_ioctl_ops_install_fences
> > 
> > Rather than adding a ufence to a VMA in the bind function, add the
> > ufence to all VMAs in the IOCTL that require binds in
> > vm_bind_ioctl_ops_install_fences. This will help with the transition to
> > job 1 per VM bind IOCTL.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 15 ++++++++++++
> >  drivers/gpu/drm/xe/xe_sync.h |  1 +
> >  drivers/gpu/drm/xe/xe_vm.c   | 44 ++++++++++++++++++++++++++++++------
> >  3 files changed, 53 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> > index 02c9577fe418..07aa65d9bcab 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -343,6 +343,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int
> > num_sync,
> >  	return ERR_PTR(-ENOMEM);
> >  }
> > 
> > +/**
> > + * __xe_sync_ufence_get() - Get user fence from user fence
> > + * @ufence: input user fence
> > + *
> > + * Get a user fence reference from user fence
> > + *
> > + * Return: xe_user_fence pointer with reference
> > + */
> > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)
> > +{
> > +	user_fence_get(ufence);
> > +
> > +	return ufence;
> > +}
> 
> I wonder why this is made part of xe_sync. Isn't just a ufence get function? Can we drop _sync_ from the function name?
> 
> 

Typically exported functions should have a prefix matching the header
file name.

e.g.

xe_sync.h -> all functions should start with xe_sync_*

In this case struct xe_user_fence is private date member to xe_sync.c
(only define in that C file) and just an opaque pointer to the rest of
the driver.

> > +
> >  /**
> >   * xe_sync_ufence_get() - Get user fence from sync
> >   * @sync: input sync
> > diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> > index 0fd0d51208e6..26e9ec9de1a8 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.h
> > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > @@ -38,6 +38,7 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry
> > *sync)
> >  	return !!sync->ufence;
> >  }
> > 
> > +struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
> >  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
> >  void xe_sync_ufence_put(struct xe_user_fence *ufence);
> >  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 5767955529dd..5b93c71fc5e9 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1810,17 +1810,10 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > struct xe_exec_queue *q,
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > q);
> > -	struct xe_user_fence *ufence;
> > 
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(bo);
> > 
> > -	ufence = find_ufence_get(syncs, num_syncs);
> > -	if (vma->ufence && ufence)
> > -		xe_sync_ufence_put(vma->ufence);
> > -
> > -	vma->ufence = ufence ?: vma->ufence;
> > -
> >  	if (immediate) {
> >  		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
> >  				       first_op, last_op);
> > @@ -2822,21 +2815,58 @@ struct dma_fence *xe_vm_ops_execute(struct
> > xe_vm *vm, struct xe_vma_ops *vops)
> >  	return fence;
> >  }
> > 
> > +static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence
> > *ufence)
> > +{
> > +	if (vma->ufence)
> > +		xe_sync_ufence_put(vma->ufence);
> 
> Not sure where/when we introduced xe_sync_ufence_put, for me this can be renamed to xe_ufence_put
> 

See above, I think the naming is correct. All of this is a matter of
opinion, we don't have any offical style guidelines for Xe but we might
want to think about writing some up / fixing Xe to conform while the
driver is still relatively small.

Matt

> Oak
> 
> > +	vma->ufence = __xe_sync_ufence_get(ufence);
> > +}
> > +
> > +static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
> > +			  struct xe_user_fence *ufence)
> > +{
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		vma_add_ufence(op->map.vma, ufence);
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		if (op->remap.prev)
> > +			vma_add_ufence(op->remap.prev, ufence);
> > +		if (op->remap.next)
> > +			vma_add_ufence(op->remap.next, ufence);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va),
> > ufence);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +}
> > +
> >  static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
> >  					     struct xe_vma_ops *vops,
> >  					     struct dma_fence *fence)
> >  {
> >  	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm,
> > vops->q);
> > +	struct xe_user_fence *ufence;
> >  	struct xe_vma_op *op;
> >  	int i;
> > 
> > +	ufence = find_ufence_get(vops->syncs, vops->num_syncs);
> >  	list_for_each_entry(op, &vops->list, link) {
> > +		if (ufence)
> > +			op_add_ufence(vm, op, ufence);
> > +
> >  		if (op->base.op == DRM_GPUVA_OP_UNMAP)
> >  			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va),
> > fence);
> >  		else if (op->base.op == DRM_GPUVA_OP_REMAP)
> >  			xe_vma_destroy(gpuva_to_vma(op-
> > >base.remap.unmap->va),
> >  				       fence);
> >  	}
> > +	if (ufence)
> > +		xe_sync_ufence_put(ufence);
> >  	for (i = 0; i < vops->num_syncs; i++)
> >  		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
> >  	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > --
> > 2.34.1
> 
