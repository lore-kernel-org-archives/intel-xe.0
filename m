Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746EEC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 20:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321F610E8E3;
	Mon, 11 Mar 2024 20:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCbtl9Bz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57510E8E3
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 20:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710187972; x=1741723972;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zdt+9LpNOWPwaAF0CcFTVgPzP+/1Fxde2OjDS5nNzAY=;
 b=HCbtl9BzGtshdw8QlIJAalZi7vuCPs45vyu7w4YwD8ZhbOQopqxLNm5V
 Qd1hRrCc3aO76nNmOPUNJCigMvdo0gruGG24ZhDjvqRVO85udegGibod8
 D3QH146HRGAFAzqU1IFwRY/6oaNpoMN44GQg7+8VnleGIRLfuCs7yj4K1
 I5JpkGL2g9oHiYP3PJ0ho9vtIzsu1PH762rATTP9Nk/8ooOV0CMULmsSC
 KLaIzCMHKYi0Pyu6olK4zuTZEGuvtAaNAYoDzGKeaulW6eTYGfE68ObOk
 V7/EUqV4oiIOZp5qxiCwYAZ8JOJryTmsWYUsCRYIAoCJvrlvBCPiaG2VA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4730808"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4730808"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 13:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11703539"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 13:12:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 13:12:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 13:12:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 13:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXEZzzUyRDsgk8TKaIu8Jg9IernUnVYkCajimSalrEs1advwOGdjdXuHrhOKpAhqNo9GxHFxSSA8l5PvycQoMSgnAHJMQfyPQeSjn2H1XVaxwJwG+6PY3POWPx1hZrTQq3Opzd6l8HiqB64pX3D7qf+lrpPJcnyCJgdRAKZPr+1bgkwiZUa7ku6YvXYsQ3XA7hexEgyuYcnUi9exwoGh3GvV5mg0BRlLMU/YkRfLQryT77i24gHl2A0qVn5T59q4A691vA8BgoEjFJlQfqH+u8M9cyuRomKZeffoXM8fhWd1HbJnSVU00Jj8F7ko4nVP0cVoqq7XBBWz3dwdGSRfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiQ7bo5NhaPxPfwhXNiIGP3S/UoH4AD/FXf4LT1517Q=;
 b=YiQRm/wNHdXzpIc8lHJf6rB6gxZRgz+GaC+ywW70tZmbG2vN29YwrZi5aNorribg7Mn25l/zEn/2Z4nbEbg18EPD0yKk5lTOwCzAb+4Vtot2UX7CMfVrIvMZYtMurm7K1psj8MfXIBDtiOUv6DNIDusVRyj92QoheAfgJz5OzosFCs7HwoFrtdIXZDBa+RilFvCtVmpty+ZlHjDDcp1/i7xrbSSHI3K+T0DcDYIKEDqopRB4lk9IK4DEiy+NFT8j7Sby+/PMnTkCJDXy9bLg6KetQX75wMiAf/SnM8vuuMSxrROULwoYkwbU+lwbf6njACFSVAHGCtVBQU9fzXXWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 20:12:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 20:12:46 +0000
Date: Mon, 11 Mar 2024 20:11:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <fei.yang@intel.com>
Subject: Re: [PATCH v3] drm/xe: Invalidate userptr VMA on page pin fault
Message-ID: <Ze9lgpge9lcXpMoM@DUT025-TGLU.fm.intel.com>
References: <20240311192045.852975-1-matthew.brost@intel.com>
 <3c16d6322a6d0127f9448c11a9b5876c688fe41d.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c16d6322a6d0127f9448c11a9b5876c688fe41d.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 590158f3-7a01-4faf-dc91-08dc42079de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ac4fJubyWkcNIBIYbJMVeDNDEqU5XbORdhK8hUJqOWomJZVir0J4XwkiNPQ1NLkT0e/xEDz4slai8tocfGndc0cJLJZAFkX2s7C8brUxEUKdsu6cN2bZhIp/bhf46ttbx6qI+OZdIXbkOZ+R4ksXxpws93hIs7JjMVVnptk96KCtP8qAkFNd2Ji1JL2tk/mD4J+D6/UzyXbQ6apYScFKovvugtFrO1KFiWjl+O1tj1gvT+TEgkaWhPo6WjklQPwJR+pYR5renrzOsjaVhg7eut79xXvwDULlySjWd5Vxeu6v8YgT/nXaVdbpLoffD2+lrtqrKNQuN30T4ae7coNaaFZdFJI4hlW37MS2dSejcI29bPTuEquwQkw8mygn176PsycZy9HzYwbh6tQpiCSTzf9Oji9L3/2T2+fJWEW7NfNTQumu02qa/d8Q+y2GbB1bm6RVeGbbX/q7bvlkmVLCO+7Evl8mTDR2sakv+Bmto+v5wrr5KBFrEiSM1u2YkygYx4mn4zX4l0dGpp2GveC7csPvmMrKUZf+QxwgxUh0fboM/Bmb71fb5UGtZJu4Xs6ziGuqkDyyb2DcO4Zrfrj6AH6Mm6yzZLewjYap0QmNAUJzV8zid3LYSUmgw4/8lb+YHjf3Kq6APQF+ce1vFBNYN/0I9pKPc0fpUPpjg2XJrys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?P9WFHmo6m8QnBGXpiS8b9Du60gSQsvwr52tIDq5ylVsWo15bywXrK7EBV1?=
 =?iso-8859-1?Q?WofLwQidT9em8Co9L9rnBkgEyW1EQGvZKf+X+J6BzRerUy/s16jUetbdvG?=
 =?iso-8859-1?Q?lppST2S/KClA+lJVF/hwTIr2zLZ+tDVhNW0oXbXO5w+6BzyGBC6QHpRsIl?=
 =?iso-8859-1?Q?ys+rVvluXcM4Hla/1CRaQJi+66gxazY18Rd9CEq+zMkJaRbkBf6lu5kaNh?=
 =?iso-8859-1?Q?j6gLkCHO48UKlLevteXIjbpRH54l66GPmhLFhn070mMMqMtoAHsdI5AG6y?=
 =?iso-8859-1?Q?GOOYXK2QDzCIzhiZHbauuPX8C1DVoIvOzh+LR+gkYrkYZdqziJiDLD6/St?=
 =?iso-8859-1?Q?34QB1iX6LKoG5jLQuRvOH+xl1ECeuCEZbKRQToxO3PncjZ5MztE9wra+Le?=
 =?iso-8859-1?Q?/gXTpYMljbwXg3MFZtGt1T8Cfz7YiV8dHmc1i4CC+ihF/mQzryWaZMYji0?=
 =?iso-8859-1?Q?2eTd6dJlrjyE2X9ymCJWR/ydAP8A+iLM5edPwbMi8IDzafPSVMBiHIccJc?=
 =?iso-8859-1?Q?1WlL+vbj0unj8F6iuApnSsd7/ZdkxDBEBSixG1eTcDwXL+2NNGeCxqw+d6?=
 =?iso-8859-1?Q?Q9Ht+z7x6heOu4mrZfdOiKF3yNkjST5fnrg5sVXfgoSgRB5h7cSNa7M95C?=
 =?iso-8859-1?Q?yu8rXp4y4SGSxE1a/vhAXcixSj56HGsKvl4jdZAvYfnKQk4jxV9TLIoJ2d?=
 =?iso-8859-1?Q?2bWOpSUECuVJ0RJ9Hh5TEazY8ffbmDwR3k+gOgGiAr8jVZAv5kxqhuScMw?=
 =?iso-8859-1?Q?1cAdfG/2D/JCZT2yBjFbqPHkrlh485kkW8kN//glN2rCHXELpSXVkWlMji?=
 =?iso-8859-1?Q?RE+HuX/vtkot6MnTz4Eug+jpbP/UiSLpANaD94mdOFDBkxS6r3AmFSdxIv?=
 =?iso-8859-1?Q?RsPKoinlJb2AZ1fyj4RptdSXz+g6NQjsJFvFruxOkwvuVstlRp1q2hYAvw?=
 =?iso-8859-1?Q?4cql7kku5v2d6po9FKmh74fw7ghKH0wZOM2PahifTx3VCBkM237N6fJADx?=
 =?iso-8859-1?Q?8kPTQaikJ/MqCM0D80bk5zW/IlzRH9C9+kXWrP2uVSTfmzyULq/sRiLkhC?=
 =?iso-8859-1?Q?2zgQq+wdbfQAX3vRL8WHthe07vp49Ahzg85K8suekczWGuU8ryMk31eVNv?=
 =?iso-8859-1?Q?ReAkAF0e0SDaBrXh9mIU9vXBmA9+5wHiw5ETUvXJqqWL04IqOSy6KykkQX?=
 =?iso-8859-1?Q?LrmwPk0WY/YDNULpdU22AkcRstYMgcwkA+TG3mOdKXxsAj5v6KEuTHtYuO?=
 =?iso-8859-1?Q?E1vpjMQKwC9w0eCpTXnqPqxh4OVbVUcIzqySlk701M48QeQ2SZPeKJqKRk?=
 =?iso-8859-1?Q?Lhb0hPxGE6/0mpjUZNCzBB8JDY1A6li+IJnx32gbmeM8ffBY+TD4dickF6?=
 =?iso-8859-1?Q?K901fsEvukMThIlbYy5Hk1UhZ0CJ1xDH5MjFCOYKyYLDaCs8BawpYV53YW?=
 =?iso-8859-1?Q?02JAjzXOr2aC+FaKGBFgLnuGTbDPqt4jUXA0heSuwpoKwq+sE9rAewZG0u?=
 =?iso-8859-1?Q?cNOdsSqMmTktVy12+9zu+Ci6RoJdGcLXz/HOIiQP2FkeEto7tdby1D9TFb?=
 =?iso-8859-1?Q?5ah5ns4l//7TBGO3s4sjRAVeg8i6iO2we2yb6zwoZxR1tKljlkar5fVkSo?=
 =?iso-8859-1?Q?6NrNQ2Gwb+VopvOzGgyf5pmGSAcWAWOCwmoSsPmsNb+3lcRxZay3VnyA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590158f3-7a01-4faf-dc91-08dc42079de1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 20:12:46.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLWNBAvSzcwqZKM/WhNB0SHWtsOl8IZ2zsiW7Fd7lO7MQK+p+wpEl/m3zn102k9wNxvnA9pRk1dUmDOP6oJx9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

On Mon, Mar 11, 2024 at 08:47:50PM +0100, Thomas Hellström wrote:
> On Mon, 2024-03-11 at 12:20 -0700, Matthew Brost wrote:
> > Rather than return an error to the user or ban the VM when userptr
> > VMA
> > page pin fails with -EFAULT, invalidate VMA mappings. This supports
> > the
> > UMD use case of freeing userptr while still having bindings.
> > 
> > Now that non-faulting VMs can invalidate VMAs, drop the usm prefix
> > for
> > the tile_invalidated member.
> > 
> > v2:
> >  - Fix build error (CI)
> > v3:
> >  - Don't invalidate VMA if in fault mode, rather kill VM (Thomas)
> >  - Update commit message with tile_invalidated name chagne (Thomas)
> >  - Wait VM bookkeep slots with VM resv lock (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 ++--
> >  drivers/gpu/drm/xe/xe_trace.h        |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++++++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  7 ++-----
> >  4 files changed, 26 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 73c535193a98..241c294270d9 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -69,7 +69,7 @@ static bool access_is_atomic(enum access_type
> > access_type)
> >  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> >  {
> >  	return BIT(tile->id) & vma->tile_present &&
> > -		!(BIT(tile->id) & vma->usm.tile_invalidated);
> > +		!(BIT(tile->id) & vma->tile_invalidated);
> >  }
> >  
> >  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
> > @@ -226,7 +226,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  
> >  	if (xe_vma_is_userptr(vma))
> >  		ret =
> > xe_vma_userptr_check_repin(to_userptr_vma(vma));
> > -	vma->usm.tile_invalidated &= ~BIT(tile->id);
> > +	vma->tile_invalidated &= ~BIT(tile->id);
> >  
> >  unlock_dma_resv:
> >  	drm_exec_fini(&exec);
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > b/drivers/gpu/drm/xe/xe_trace.h
> > index 4ddc55527f9a..846f14507d5f 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -468,7 +468,7 @@ DEFINE_EVENT(xe_vma, xe_vma_userptr_invalidate,
> >  	     TP_ARGS(vma)
> >  );
> >  
> > -DEFINE_EVENT(xe_vma, xe_vma_usm_invalidate,
> > +DEFINE_EVENT(xe_vma, xe_vma_invalidate,
> >  	     TP_PROTO(struct xe_vma *vma),
> >  	     TP_ARGS(vma)
> >  );
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 643b3701a738..19323b411cb2 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -724,11 +724,25 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
> >  	list_for_each_entry_safe(uvma, next, &vm-
> > >userptr.repin_list,
> >  				 userptr.repin_link) {
> >  		err = xe_vma_userptr_pin_pages(uvma);
> > -		if (err < 0)
> > -			return err;
> > -
> >  		list_del_init(&uvma->userptr.repin_link);
> > -		list_move_tail(&uvma->vma.combined_links.rebind,
> > &vm->rebind_list);
> > +		if (err == -EFAULT && !xe_vm_in_fault_mode(vm)) {

Just remembered this now. This function is not called in fault mode
either. It is called by the exec IOCTL (dma-fence mode) or preempt
rebind worker.

I'll delete this part and add an assert at the top of the function.

> > +			/* Wait for pending binds */
> > +			xe_vm_lock(vm, false);
> > +			dma_resv_wait_timeout(xe_vm_resv(vm),
> > +					     
> > DMA_RESV_USAGE_BOOKKEEP,
> > +					      false,
> > MAX_SCHEDULE_TIMEOUT);
> > +
> > +			err = xe_vm_invalidate_vma(&uvma->vma);
> 
> This can still race with yet another notifier, I think.
> 

Wouldn't another invalidate just add it back to the
&vm->userptr.invalidated list and trigger xe_vm_userptr_pin again? That
seems to be fine to me.

The lockdep in xe_vm_invalidate_vma would be unhappy though (I think)?
Maybe we call a version of xe_vm_invalidate_vma here where the lockdep
checks are skipped?

> > +			xe_vm_unlock(vm);
> > +			if (err)
> > +				return err;
> > +		} else {
> > +			if (err < 0)
> 
> And here we should've kept the userptr on the repin list.
> 

Yes this is a change in behavior but this change is fine as I think we
try to kill the VM at this point, right? I can change it back if you
feel strongly.
 
Matt

> 
> /Thomas
> 
> 
> > +				return err;
> > +
> 
> 
> > +			list_move_tail(&uvma-
> > >vma.combined_links.rebind,
> > +				       &vm->rebind_list);
> > +		}
> >  	}
> >  
> >  	return 0;
> > @@ -2024,7 +2038,7 @@ static int xe_vm_prefetch(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  			return err;
> >  	}
> >  
> > -	if (vma->tile_mask != (vma->tile_present & ~vma-
> > >usm.tile_invalidated)) {
> > +	if (vma->tile_mask != (vma->tile_present & ~vma-
> > >tile_invalidated)) {
> >  		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs,
> > num_syncs,
> >  				  true, first_op, last_op);
> >  	} else {
> > @@ -3214,9 +3228,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	u8 id;
> >  	int ret;
> >  
> > -	xe_assert(xe, xe_vm_in_fault_mode(xe_vma_vm(vma)));
> >  	xe_assert(xe, !xe_vma_is_null(vma));
> > -	trace_xe_vma_usm_invalidate(vma);
> > +	trace_xe_vma_invalidate(vma);
> >  
> >  	/* Check that we don't race with page-table updates */
> >  	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> > @@ -3254,7 +3267,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  		}
> >  	}
> >  
> > -	vma->usm.tile_invalidated = vma->tile_mask;
> > +	vma->tile_invalidated = vma->tile_mask;
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 79b5cab57711..ae5fb565f6bf 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -84,11 +84,8 @@ struct xe_vma {
> >  		struct work_struct destroy_work;
> >  	};
> >  
> > -	/** @usm: unified shared memory state */
> > -	struct {
> > -		/** @tile_invalidated: VMA has been invalidated */
> > -		u8 tile_invalidated;
> > -	} usm;
> > +	/** @tile_invalidated: VMA has been invalidated */
> > +	u8 tile_invalidated;
> >  
> >  	/** @tile_mask: Tile mask of where to create binding for
> > this VMA */
> >  	u8 tile_mask;
> 
