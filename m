Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B03C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 04:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114A410E34E;
	Fri, 19 Apr 2024 04:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpAPuubU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7005310E34E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 04:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713500078; x=1745036078;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s9xgYaTeqccR1WsCoDg5bM51eaFEJwcePK+yLz93Mbc=;
 b=kpAPuubUCI1g4IfSG3t3CA4qlhrUpANymgdi+oKlZgxqLcAukKhVsjrW
 Ynq8yRBEd63Z0//SV9QgIwxxoGLBgwoSYccqSDqmbpbkvN1NzQOPnWIv0
 cEbFjhfAHhss+SDy0XDASq9Cq/0TkLFr9XdXuFm2vWa2oYMWhXvmDpBId
 vw15ph9Zm75/0dSPCJLWUuvG163gbw0rSTO3qaJOMz6kImdkUWcdk7SoZ
 Cki+zxuUQqBpflK/bjEztCHTnvxAUI4UPLAJl1tUS+K2twOzWCDwScNPd
 EsMQ5ZA9SVnEIVJN5orgV8Ck6/IJBWngmHnQ8VTALr/I+KhLko6FuxkXv A==;
X-CSE-ConnectionGUID: 6FV7B51ORmSkWfpKqVRQyA==
X-CSE-MsgGUID: zaMgtj8UTES4Tdjs8y/DiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12920909"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12920909"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 21:14:38 -0700
X-CSE-ConnectionGUID: pbGLYu+wT7SaijCpjLRh7A==
X-CSE-MsgGUID: LmLrCCc7QsWugk39i/ggNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23246227"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 21:14:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 21:14:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 21:14:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 21:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLkDCHc62dZAGHpHxs45Z2Z1XVeQl2CbthMsp+EPQeWHM/HsEzinN4ePoZaJcIvIt/miY1yBH8W6zaYz2e7tmUXJTJUEmL8bMihEi8QdvTCDJoUtqoYXYlNKRIObibaB+skgAysmkoLX60rYPbfySDMqkJeYHI4Y1XlOnqKVQF6Oj8V+IYLhfie5f/0eDclX5bq+QMNc7DAhlsX5rBfHUukACNH3P7oHaj0yt19FyuoRf2NdrYOfYCm3JH1y/HDBsa0VOQqmmPBCxX8ghgFxou/diqP+50mIgtv/nNuhJnsqSY5UkT/RDhq+JZ74sng+J0Qzpf6I2ImwTlr2loyC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDR4xaR1UfhXvkcPhdyZE1fbIbSGvF6eC2uir+DXL1U=;
 b=iHBxfLsxzGHKakStNBG9my5V20zUJamT6Llm1aW9T6pWsSg0Z1l7XRlMUGxirgEmMHhCoC84kLoTtm700KH2BL/8ihGczUORJpBiNJCgXXtEYGZ2/0KfQxS7TW13N+hWhWQbE8ubHSn350kURGtKPs1ASOA2Jj6azMfsrA48GcU9N6jxDmevOj9PJIa0fi0Z2wCrHwGzzMPS+VpkKgulWmabtpeKQI4x13xHpDUrL5GJ9YkEDLTaI/9REClaY1Dy6q36owq0kB4VDjt4Lyz9y8pUL8H4qZ7NOvs4Uqi19ys5npALXIWmrNVgeIgMBZNzhmp4VHKdO3nJO8fbLSj0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8475.namprd11.prod.outlook.com (2603:10b6:806:3a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Fri, 19 Apr
 2024 04:14:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 04:14:34 +0000
Date: Fri, 19 Apr 2024 04:14:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement xe_vm_rebind
Message-ID: <ZiHvm7C6I9n5XoG6@DUT025-TGLU.fm.intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-6-matthew.brost@intel.com>
 <SA1PR11MB699140DE94F7D680AADD7A3E920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699140DE94F7D680AADD7A3E920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0f628a-bf95-4135-5589-08dc602737f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Iz8OjZSJHFAnOqFI2RuNYk83LefLJRjAFfQnMBsZ5RF2rMvf0y9AmPgAj0jib1X+KBQzbYa9rv04TacNXZu6vy7CP8kBa56fVdP+SPkwCfRfmEv356ehlqEup+C2WngE0aKsjaAGSnsS6Tq5fZIkseH4HEFOUIw61uP+PZqPeGp1iKKfmtmaAw25jLgS7KYgaThTdOYgLJVvCz9kWLOaiKMUrhaCTtzkmKMxx+5MSgtwjggvpKMge6syfgfORDIpDX6E0cjABFW+nIgBkqvVQO/oqkTh9GpXhjBd/6rwjfPuY+OUBNR5UJ5dH/gYO3P4lcpdC0aimdYVZpu58WLeBz44rbxOlx5c7of1Ep5DPAl5lSQBjyBh3sITv+vuroqMsBU3ydJczqKPfXb164p7gMvRw65LUTKQjDi6HTJnm7f8lbffeHTabkLUFJdhqTsoonz5VRWusSQelwQQj8bTEZnfbG/1OEQwQK0wOwzn5zcTW9PY7EnSKQ4xbqMtADKjM7rfrzVLrxNEaY3o3RQA48bat6q6GPvYHqLJHY2/GiRbjkQR5/Nf+TmLCgx/TZIDX1n/i4027q91hLuy/jYCr9C9bKa0jBbKgetP0k1+WnIItE15Jr52jotLjNbxZhTKIb+KRtw34k4yEDWXRT+TvUpPmsvMgqkXwMqwcOPaTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z4+uAh23TvRFZ6unS4xlUUj7abUzK+aPKzj+/JsJjuegnPyEieONvRFCmC2N?=
 =?us-ascii?Q?pvVuX0NdkPrqNObV56xXIDk3y/NxXJW/JPerNk0RSyftU+5MfqZra6NL7JHF?=
 =?us-ascii?Q?IKunqjNy2bx5WBnFMVpSulKRAOAUO54ID8v+1lm2MBJrB6j3VXij3AbSAfHf?=
 =?us-ascii?Q?6d2ay5X/iKI+Yi9XbqrXpf1lLBpIayJRCTZj1ikoXLK8DKIMrtux3MAI0LOd?=
 =?us-ascii?Q?cH60ST7rxXUF+N9epzFy32WBuN5MYWMqdvxqQs2rP9KumRA8crQbXzEtlZ1u?=
 =?us-ascii?Q?wQQM69HJ47rJ9AASq+NJ2We1Qd2S/PtxUkXWX0d7fDFmucDvh8ztliML+8Ax?=
 =?us-ascii?Q?EcCxQFYhkBJXwWcgDjCkGsEWTrhYxAeXuIr0swlXv5jZZJ4dEWBsJKmX6Rr6?=
 =?us-ascii?Q?2doc9loEz8mAiqbF5v8AuNmUDcFd58pEyMROWuux+6+d1O05EwBNOK84Y+Ri?=
 =?us-ascii?Q?n07f8VGPpanKvjTPuA6PByZ1pvhXSqDZ82Mc5DmM2uSVB0A5BGfUsSN/DkxK?=
 =?us-ascii?Q?BEAs7ZkrlVqqrm76jl8vavjafJdCISyviYXauHOqiDO53qETSpLV9G5sw8DX?=
 =?us-ascii?Q?2K02BLN+WfobDsmKpCH3poruVjDt66g3yHevUC7sx8pGrDPcCmBiRQMAzqke?=
 =?us-ascii?Q?5F+of7FZE2x8nH1TuPyb9XJoiMqe7ygeNki233EuTvMElpk4bKZyR042rZzo?=
 =?us-ascii?Q?wA6kG35PGBMhNve6l6J4N2khgUv+2bEAyfhWpy4DnB8QanokTAzUKcCx1aYs?=
 =?us-ascii?Q?6JQRLE0v8LnESa8NyaSRK34FHRJ1ySrXTtV2/C0xHc5X+X7H51xsS5H7Mx28?=
 =?us-ascii?Q?w4QD/VF3I7uGC8yzZy3ab8p8aS4n0xI6nIstS/01HBC+H81ZnYIvyVXC6zdU?=
 =?us-ascii?Q?hVpFM/S10jk+FNKyAaQbIL9tw4aug8mbL57kL7sKavO8U1ZJchh6XNOIrlvm?=
 =?us-ascii?Q?TRhC14vG6rd0lVLG2cblm+lyTTY6OCl+bV9gP0NSuP+7NxrPduuMUW0D3PL3?=
 =?us-ascii?Q?jf7tYkzDYhGLFy5NBSVHWL8miYIPsGzAUwORnJugRxc3N4akZLYwLTCbdUVu?=
 =?us-ascii?Q?94Yzwnqi4hrpjAsKLltdtomxkvCav3KM1z/2xfj9+zys6QQTglSu8U2IVn4j?=
 =?us-ascii?Q?NDL8hTJWWkjvvdtSlFKsmrxudOsKgOJhqfg8Q+IvexdOPRC/dxjE8JTvAX2/?=
 =?us-ascii?Q?0761nKPgeN4uKTFRsTyx+6YLMFTQx0WfkP1+EQvyA4RXrs/CwwdJDG9CYAiD?=
 =?us-ascii?Q?t6XiAiwauktIkVBYMB73ifYFqYHBGJ0CGxAHuhwoxnFPOsxqQPtNpkjfxxJj?=
 =?us-ascii?Q?LzAiVEJm5RXhraucE2SAafRkEcjCr65Y7Ks1JRg9O8oNHacJr+F9P4dWGAP8?=
 =?us-ascii?Q?toFRUvwzJdTuJAK+7uYEOxDSWleH2kVL6/VYwo2/s2v2Dq74A3SfKKIo5pXf?=
 =?us-ascii?Q?CE64Et12wDZ3P+XM7yzQotdXAZ1ekZBHVWAyF/jMfOLWwNBtb5Sol741sQQp?=
 =?us-ascii?Q?rhJTyxeDvC4919f2+be9JgJACiHa1rfRYQ8ZM2l4x6he/HlH9jq2TS6tHYhg?=
 =?us-ascii?Q?DY1epX4XrhDCE61SDs9aLxZjIbfTCY51Nw5Zdgw1+AJuLZ1JjE6wXPpP/EE4?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0f628a-bf95-4135-5589-08dc602737f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 04:14:34.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixkr0p6/6H+/6GG1aBhtb8qH6ioxjuBipC2P7NVBDDKqIZ3K/losljs3asvvlADE0IHhiaN7HpfhDjq98Npl/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8475
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

On Thu, Apr 18, 2024 at 09:43:06PM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Matthew Brost
> > Sent: Wednesday, April 10, 2024 1:41 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH 05/13] drm/xe: Use xe_vma_ops to implement
> > xe_vm_rebind
> > 
> > All page tables updates are moving to a xe_vma_ops interface to
> > implement 1 job per VM bind IOCTL.
> 
> Just want to make sure I understand it correctly. So far after this patch, the rebind is still many jobs (one job per vma), right?
> 

Yes. A follow on series will convert to 1 job for all of the rebind list.

> 
>  Convert xe_vm_rebind to use a
> > xe_vma_ops based interface.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 78 +++++++++++++++++++++++++++++++-
> > ------
> >  1 file changed, 64 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 4cd485d5bc0a..9d82396cf5d5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -811,37 +811,87 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> >  }
> > 
> > -static struct dma_fence *
> > -xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > -	       struct xe_sync_entry *syncs, u32 num_syncs,
> > -	       bool first_op, bool last_op);
> > +static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma
> > *vma,
> > +				  u8 tile_mask)
> > +{
> > +	INIT_LIST_HEAD(&op->link);
> > +	op->base.op = DRM_GPUVA_OP_MAP;
> > +	op->base.map.va.addr = vma->gpuva.va.addr;
> > +	op->base.map.va.range = vma->gpuva.va.range;
> > +	op->base.map.gem.obj = vma->gpuva.gem.obj;
> > +	op->base.map.gem.offset = vma->gpuva.gem.offset;
> > +	op->map.vma = vma;
> > +	op->map.immediate = true;
> > +	op->map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
> > +	op->map.is_null = xe_vma_is_null(vma);
> > +}
> > +
> > +static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma
> > *vma,
> > +				u8 tile_mask)
> > +{
> > +	struct xe_vma_op *op;
> > +
> > +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> > +	if (!op)
> > +		return -ENOMEM;
> > +
> > +	xe_vm_populate_rebind(op, vma, tile_mask);
> > +	list_add_tail(&op->link, &vops->list);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct dma_fence *ops_execute(struct xe_vm *vm,
> > +				     struct xe_vma_ops *vops,
> > +				     bool cleanup);
> > +static void xe_vma_ops_init(struct xe_vma_ops *vops);
> > 
> >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> >  {
> >  	struct dma_fence *fence;
> >  	struct xe_vma *vma, *next;
> > +	struct xe_vma_ops vops;
> > +	struct xe_vma_op *op, *next_op;
> > +	int err;
> > 
> >  	lockdep_assert_held(&vm->lock);
> > -	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
> > +	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
> > +	    list_empty(&vm->rebind_list))
> >  		return 0;
> > 
> > +	xe_vma_ops_init(&vops);
> > +
> >  	xe_vm_assert_held(vm);
> > -	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > -				 combined_links.rebind) {
> > +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind)
> > {
> >  		xe_assert(vm->xe, vma->tile_present);
> > 
> > -		list_del_init(&vma->combined_links.rebind);
> >  		if (rebind_worker)
> >  			trace_xe_vma_rebind_worker(vma);
> >  		else
> >  			trace_xe_vma_rebind_exec(vma);
> > -		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
> > -		if (IS_ERR(fence))
> > -			return PTR_ERR(fence);
> > +
> > +		err = xe_vm_ops_add_rebind(&vops, vma,
> > +					   vma->tile_present);
> > +		if (err)
> > +			goto free_ops;
> > +	}
> > +
> > +	fence = ops_execute(vm, &vops, false);
> > +	if (IS_ERR(fence)) {
> > +		err = PTR_ERR(fence);
> 
> So here, if above ops_execute partially succeed (some vma bind failed, some succeed), for those vmas which are successfully bound, it is kept in the vm's rebind_list. Is this the correct behavior? Next time we will rebind them again....
> 

The VM is killed if any VMA ops fails so it doesn't really matter, also
it safe to issue a rebind twice.

In the follow up series, once we have 1 job per the rebind list we can
cope with errors and not kill the VM. In that case we must leave
everything on the rebind list.

So this patch is correct now and for the follow on series.

Matt

> 
> Oak
> 
> 
> > +	} else {
> >  		dma_fence_put(fence);
> > +		list_for_each_entry_safe(vma, next, &vm->rebind_list,
> > +					 combined_links.rebind)
> > +			list_del_init(&vma->combined_links.rebind);
> > +	}
> > +free_ops:
> > +	list_for_each_entry_safe(op, next_op, &vops.list, link) {
> > +		list_del(&op->link);
> > +		kfree(op);
> >  	}
> > 
> > -	return 0;
> > +	return err;
> >  }
> > 
> >  static void xe_vma_free(struct xe_vma *vma)
> > @@ -2516,7 +2566,7 @@ static struct dma_fence *op_execute(struct xe_vm
> > *vm, struct xe_vma *vma,
> >  {
> >  	struct dma_fence *fence = NULL;
> > 
> > -	lockdep_assert_held_write(&vm->lock);
> > +	lockdep_assert_held(&vm->lock);
> > 
> >  	xe_vm_assert_held(vm);
> >  	xe_bo_assert_held(xe_vma_bo(vma));
> > @@ -2635,7 +2685,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct
> > xe_vma_op *op)
> >  {
> >  	struct dma_fence *fence = ERR_PTR(-ENOMEM);
> > 
> > -	lockdep_assert_held_write(&vm->lock);
> > +	lockdep_assert_held(&vm->lock);
> > 
> >  	switch (op->base.op) {
> >  	case DRM_GPUVA_OP_MAP:
> > --
> > 2.34.1
> 
