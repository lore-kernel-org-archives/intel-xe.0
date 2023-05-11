Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9322FC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 02:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D510E58C;
	Thu, 11 May 2023 02:53:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189FE10E58C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 02:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683773595; x=1715309595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nwmnU45y9GBgd00EA7o5l15girt/VeBNaL+RKkOWz+Y=;
 b=QTfL7SP3lTLV6D5mzS9EsstPaGmf5SRMxVBlLwbzU/N4x7OsYceceZ/a
 fMvvNeXcv/llysk424noQtfIk4hyxvVPZo22Ad9wMl9TsEtHubA6xX9rI
 pYk6bTxKbBs8H5tbHqysim9TbAV1OTPrVl2zE2YGbMfSxzBfX2La/UrJT
 7+ZcJEBwnQyM9fiHdKSFVrDLcdSBPtVOQrB5yVofR1adYUULchvcN7gpC
 KMLxqidCNpQw7KTIkklLXAmWPkuMfcUDDxxNrQ3Yi74b8XnHYv7zw1r0K
 G1NyVzh6eKDopSlwgO+x1llF/v4fdg6Bz2LGxt36bYclO7DGDnc/aB9MQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="349213783"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="349213783"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 19:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811400434"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="811400434"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 19:53:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 19:53:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 19:53:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 19:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1z4j2IaI5o0s1BK1GgFAgIIfySna2vDAiXlynj5QCiQl4rLw7MAfVcaA2gBNPTlmTch7vtVf7nIpokJmfJyMlSvrv/LZczPPXk9Mc/cPun5Foiwf4M/vrD7DI4rk0UUDHCE2VY69l7xHp6Nfpndg1EsmD1fx2V5M/iCfsGxM1FxEtK+fZZW2DZITEb+T8gXiwQn8P5qLciPh9rw/PHjpt41sD4K2XjRIqhwkShBBvmJUmpitSjwpuRuUuetQ8mwD2Qk3eqRZ6bZK+6xPwZKi5JjgpvZOBZxHSlkCGRzMjnazJ0MDahx5kDIofyKgT+Ed4pjXySOkZGdxqnWEaCd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpKQ2ovK4WBKq6+m1DGM7blnjV/t45ZKtG8reBirkjM=;
 b=fRm+0gj+nQFZziXARg/m/pnGX1soBSNfP7Fx3f2zDq/F7Lpf6oQG1iKLnoClldo7Zpvp2fTb3vpq+wm28p2y1Z1A6OOij14pph8Jf/aFq9SkIN4cPbnxfAqIpRIVUsXj6umJfIWQNMXR4V0omO5pMJ8BMaBD8twu1v8eoIV0nv2F7MPo/9jRpGyzW+tMtcgbicUSBvZ0wN3hU4cQ8ZUKCMwCyOLwhp1QhuVtcVmeJwX6Zw2ZkqKr2i7O+oYkLj0oALmdiiGU9iT36USSdCsSkI0BtvOnXDYtJ42t9Ns9cShNgLw7560vZO/B039vMPpToPKqZri+vL+IyuePzCekpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 02:52:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Thu, 11 May 2023
 02:52:59 +0000
Date: Thu, 11 May 2023 02:52:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFxYY/q77/1iaClb@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-18-matthew.brost@intel.com>
 <ZFpaDFSZuDqtTbKH@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFpaDFSZuDqtTbKH@intel.com>
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: bc040f61-51e5-4aba-1932-08db51cad43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pnyEJzkKGAadT0PXAZAmyEqzBMaALfmDMIfqcBDVKeX9yiJ0baRN6ph+Yu3pgKQwNQyVyfdzYnDdmcxHlfuxSK2lRI/wKjF7OrS192akLtoyJsrxkrfvtxTj5w/E6NWanPHIX6Byyv06sirjLFbOdQBaKFFki2UHm5kx+ba9XbbaUJT+uMU582/jyx1OousfMHO8jT/Ds8BFhIWPwpCg2CWXw7ffWYIeAqDyVvNrQWYON8uYqGBaPYqRIDgmxe8afIlakqenrPuJCxJIyqlcqU/Jsef1m5FT7ZkaKV78SYWvE+YfytSJKBdopiz8htNhF0ygRYkTX7osOJs9JCROszh47nYhYywfym3f7A4klbrVeZyBH69ymV23DGyaUeYuWH6zL/kV+olO1gDcOZm43MAEYN0+PIbRQZsqsLYvdxxytMEqxNw3N1VvAV/S6EPR7w/LmbZgDNnL0YBZrwjKfjkFM9XOW9UaDjCHipn9X/Ccav2iscJN5kDGiiPohSoaUIwz5WY8RJziD1nicoXeY+ypgc8JPYhQJ4c61BW/I68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(86362001)(83380400001)(478600001)(66946007)(41300700001)(44832011)(5660300002)(8936002)(6862004)(8676002)(316002)(4326008)(2906002)(30864003)(6636002)(66476007)(66556008)(6512007)(6506007)(186003)(26005)(966005)(6486002)(6666004)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUOjj+zbCXGjLyZZJILNgZ5QCPAgVublg93kQRCvqDB7G6f0OnzFBckjGlzI?=
 =?us-ascii?Q?xf39igdjiGLCacaZU/75215r26seCKpArkomUvrE2NGVAc7nARZ2UBvQWzEu?=
 =?us-ascii?Q?Ut1pPtEUNTdXo5lzaXhVtogjP1HTxda2dmccfJdcsNzSwT7M6QdUuGwfpIWX?=
 =?us-ascii?Q?wVcYvSRIZP5VehC35VbwGj4NVEeN7QHJJJ82/OSN66BdY1Hd1qg5xLXwLzag?=
 =?us-ascii?Q?lgwuZAWcW4CsU7vJtuHHD1DQ+UcN/GD9Nd2K5JELDhQ717LJ63Kxc6V05SVX?=
 =?us-ascii?Q?ByY87T5757kYnWh5B4AgH7h87IID3FTLjau4Qf/AE8wGouaOYBsuuNifpxkE?=
 =?us-ascii?Q?Ozg+2PE/KP90MXbeSEjar1HVrfsww/bFfj4dfiboF5zUeTtZsZKVuo0ExXAd?=
 =?us-ascii?Q?sMIJGd9+a6SZrDrJ4g7igof3111P0XUM1wqlnU1YB7gPp2dfyRB62+dbiPGd?=
 =?us-ascii?Q?vNQAlYwGd7ovUnMZcZw2Pucd3tcbq1MCVS9aB5QKoT91reYD28d/bVFE3hNk?=
 =?us-ascii?Q?qcSXdJ31Adbv18I2KBUdipJgwjrSmPi+A2A2V7UUlpCznLorhI8Oa4FwlZcy?=
 =?us-ascii?Q?jcWaQli+P0nzedyykV3vI5s4VmJmchQHQ+cawdZktjy4rjy8AmKSQ4Z02V8D?=
 =?us-ascii?Q?XtcXThC6AObnCGN8UtOwmE+LnMROgX3dnO5mLPYeVBtOMLFhCnLsZsI6+oXf?=
 =?us-ascii?Q?AJRtJiDO/GCFAymUgaM/HM9lKs/G2bj6T/t9iQxRV7n76qxskzJ6c+gwfC7s?=
 =?us-ascii?Q?CXK7TJjCgLAuks2PL2qM72JA8WcXj9CxJHtlEmJitBMgw74F2QuoQoE9QbsL?=
 =?us-ascii?Q?X1RY55qtfllPyeufV5e5cHsEAAu6BLxplMnn2tgsAjLo3WYWsrCrxPYMjMSF?=
 =?us-ascii?Q?qinUDPvvkPUNEC6On6YA1FAbSqLl2NBOoHLBtQ94WBSybWFGj1wOK3V2rAFn?=
 =?us-ascii?Q?9Yqk8Pjy9X5yaDi0jccrA7opk8De5Hbo0hAZFlEsXSbz2D01d3usU/9fQWAi?=
 =?us-ascii?Q?Jmyp5Nq+gYK6ZVIJfvplGzvPVt1JU0J/iYynBy3yvfnYegg5L8kZuLPFEHLX?=
 =?us-ascii?Q?XiF24ELvpP7QBofdYBNopi3SJMO925DwzKI+pMeFA9y7jM6DXwnM/HfUKGye?=
 =?us-ascii?Q?QL8S1kN1L0Z7LAr5N6cOIv65TZKym9eOWylu30CqldwIHvwxR6ufCqsEpTtI?=
 =?us-ascii?Q?Pxdu8PAqyXolhb1jv/W/ie5OORHIiPmxNFQYHn93OVLLtWVuVXQ1cTgrdNM9?=
 =?us-ascii?Q?BeAP4bHGe4xVKSO7M87ThGcJMm6X25asQda7qIzJQkhIygF82SUfERh8YHm4?=
 =?us-ascii?Q?KqbdGW0y9F1wpHaswvLo8IGslccTSAjlVmNnerqr31iKX95zFIC/L+grlEg5?=
 =?us-ascii?Q?ThCp6SjYTT/KQKWrx/re3ZM0IEjU7lkPCIhq4pQs1akSNxPsRQD3u4HdUuGR?=
 =?us-ascii?Q?9kyXyzz2KvhGCnqvB2Au9w8aEzI0OYwAKrLvwUxrOH1MIj28wEmJhLPPlK8F?=
 =?us-ascii?Q?ksPFUVjlsQBRC+/Ibxnwp5yC3PyTSdoO8BMyLUm1WOS2p2SHSZPr96tiM37y?=
 =?us-ascii?Q?sj+tBs+7jVl1A9hZpYsc3Ow1xdp0kn+j7OxPcIDrUxBB+00JtGAa1Iz8i5RC?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc040f61-51e5-4aba-1932-08db51cad43d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 02:52:59.2073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zl6lTc8Tgt7ZWKA/Jn8SuxiMhtWB0eqDeo3v/E9TKeIsG5G6EydiFIpRAl+elzZgT8hEZ7IPT01z03psqezxHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 17/31] drm/xe: NULL binding implementation
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

On Tue, May 09, 2023 at 10:34:52AM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:13PM -0700, Matthew Brost wrote:
> > Add uAPI and implementation for NULL bindings. A NULL binding is defined
> > as writes dropped and read zero. A single bit in the uAPI has been added
> > which results in a single bit in the PTEs being set.
> 
> I have confirmed in the spec that this is the case for the BIT 9!
> 
> "If Null=1, the h/w will avoid the memory access and return all
> zero's for the read access with a null completion, write accesses are dropped"
> 
> The code looks good, but just a few questions / comments below.
> 
> > 
> > NULL bindings are indended to be used to implement VK sparse bindings.
> 
> is there any example available or any documentation that could explain
> how this is used and why this is needed?
> 

VK sparse being needs this:
https://registry.khronos.org/vulkan/specs/1.3-extensions/man/html/vkQueueBindSparse.html

> any IGT?
> 

https://patchwork.freedesktop.org/patch/534957/?series=117177&rev=2

> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.h           |  1 +
> >  drivers/gpu/drm/xe/xe_exec.c         |  2 +
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
> >  drivers/gpu/drm/xe/xe_pt.c           | 77 ++++++++++++++++-------
> >  drivers/gpu/drm/xe/xe_vm.c           | 92 ++++++++++++++++++----------
> >  drivers/gpu/drm/xe/xe_vm.h           | 10 +++
> >  drivers/gpu/drm/xe/xe_vm_madvise.c   |  2 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h     |  3 +
> >  include/uapi/drm/xe_drm.h            |  8 +++
> >  9 files changed, 144 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 25457b3c757b..81051f456874 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -56,6 +56,7 @@
> >  #define XE_PDE_IPS_64K			BIT_ULL(11)
> >  
> >  #define XE_GGTT_PTE_LM			BIT_ULL(1)
> > +#define XE_PTE_NULL			BIT_ULL(9)
> >  #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
> >  #define XE_PPGTT_PTE_LM			BIT_ULL(11)
> >  #define XE_PDE_64K			BIT_ULL(6)
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 90c46d092737..68f876afd13c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -116,6 +116,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> >  	 * to a location where the GPU can access it).
> >  	 */
> >  	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > +		XE_BUG_ON(xe_vma_is_null(vma));
> 
> Can we avoid BUG here? Maybe a WARN?
> 

Sure.

Matt

> > +
> >  		if (xe_vma_is_userptr(vma))
> >  			continue;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index f7a066090a13..cfffe3398fe4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -526,8 +526,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >  
> >  	trace_xe_vma_acc(vma);
> >  
> > -	/* Userptr can't be migrated, nothing to do */
> > -	if (xe_vma_is_userptr(vma))
> > +	/* Userptr or null can't be migrated, nothing to do */
> > +	if (xe_vma_has_no_bo(vma))
> >  		goto unlock_vm;
> >  
> >  	/* Lock VM and BOs dma-resv */
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 2b5b05a8a084..b4edb751bfbb 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -82,7 +82,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> >  			   size_t page_size, bool *is_vram)
> >  {
> > -	if (xe_vma_is_userptr(vma)) {
> > +	if (xe_vma_is_null(vma)) {
> > +		return 0;
> > +	} else if (xe_vma_is_userptr(vma)) {
> >  		struct xe_res_cursor cur;
> >  		u64 page;
> >  
> > @@ -563,6 +565,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
> >  	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
> >  		return false;
> >  
> > +	/* null VMA's do not have dma adresses */
> > +	if (xe_walk->pte_flags & XE_PTE_NULL)
> > +		return true;
> > +
> >  	/* Is the DMA address huge PTE size aligned? */
> >  	size = next - addr;
> >  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> > @@ -585,6 +591,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
> >  	if (next > xe_walk->l0_end_addr)
> >  		return false;
> >  
> > +	/* null VMA's do not have dma adresses */
> > +	if (xe_walk->pte_flags & XE_PTE_NULL)
> > +		return true;
> > +
> >  	xe_res_next(&curs, addr - xe_walk->va_curs_start);
> >  	for (; addr < next; addr += SZ_64K) {
> >  		if (!IS_ALIGNED(xe_res_dma(&curs), SZ_64K) || curs.size < SZ_64K)
> > @@ -630,17 +640,34 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
> >  	struct xe_pt *xe_child;
> >  	bool covers;
> >  	int ret = 0;
> > -	u64 pte;
> > +	u64 pte = 0;
> >  
> >  	/* Is this a leaf entry ?*/
> >  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
> >  		struct xe_res_cursor *curs = xe_walk->curs;
> > +		bool null = xe_walk->pte_flags & XE_PTE_NULL;
> >  
> >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> >  
> > -		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
> > -					xe_walk->cache, xe_walk->pte_flags,
> > -					level);
> > +		if (null) {
> > +			pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
> > +
> > +			if (unlikely(xe_walk->pte_flags & XE_PTE_READ_ONLY))
> > +				pte &= ~XE_PAGE_RW;
> > +
> > +			if (level == 1)
> > +				pte |= XE_PDE_PS_2M;
> > +			else if (level == 2)
> > +				pte |= XE_PDPE_PS_1G;
> > +
> > +			pte |= XE_PTE_NULL;
> > +		} else {
> > +			pte = __gen8_pte_encode(xe_res_dma(curs) +
> > +						xe_walk->dma_offset,
> > +						xe_walk->cache,
> > +						xe_walk->pte_flags,
> > +						level);
> > +		}
> >  		pte |= xe_walk->default_pte;
> >  
> >  		/*
> > @@ -658,7 +685,8 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
> >  		if (unlikely(ret))
> >  			return ret;
> >  
> > -		xe_res_next(curs, next - addr);
> > +		if (!null)
> > +			xe_res_next(curs, next - addr);
> >  		xe_walk->va_curs_start = next;
> >  		*action = ACTION_CONTINUE;
> >  
> > @@ -751,7 +779,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
> >  		.gt = gt,
> >  		.curs = &curs,
> >  		.va_curs_start = xe_vma_start(vma),
> > -		.pte_flags = xe_vma_read_only(vma) ? XE_PTE_READ_ONLY : 0,
> > +		.pte_flags = xe_vma_read_only(vma) ? XE_PTE_READ_ONLY : 0 |
> > +			xe_vma_is_null(vma) ? XE_PTE_NULL : 0,
> >  		.wupd.entries = entries,
> >  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) &&
> >  			is_vram,
> > @@ -769,23 +798,28 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
> >  			gt_to_xe(gt)->mem.vram.io_start;
> >  		xe_walk.cache = XE_CACHE_WB;
> >  	} else {
> > -		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> > +		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
> >  			xe_walk.cache = XE_CACHE_WT;
> >  		else
> >  			xe_walk.cache = XE_CACHE_WB;
> >  	}
> > -	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
> > +	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
> >  		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
> >  
> >  	xe_bo_assert_held(bo);
> > -	if (xe_vma_is_userptr(vma))
> > -		xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma), &curs);
> > -	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> > -		xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> > -			     xe_vma_size(vma), &curs);
> > -	else
> > -		xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> > -				xe_vma_size(vma), &curs);
> > +	if (!xe_vma_is_null(vma)) {
> > +		if (xe_vma_is_userptr(vma))
> > +			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
> > +					&curs);
> > +		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> > +			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> > +				     xe_vma_size(vma), &curs);
> > +		else
> > +			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> > +					xe_vma_size(vma), &curs);
> > +	} else {
> > +		curs.size = xe_vma_size(vma);
> > +	}
> >  
> >  	ret = drm_pt_walk_range(&pt->drm, pt->level, xe_vma_start(vma),
> >  				xe_vma_end(vma), &xe_walk.drm);
> > @@ -979,7 +1013,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >  
> >  	if (xe_vma_is_userptr(vma))
> >  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > -	else
> > +	else if (!xe_vma_is_null(vma))
> >  		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> >  
> >  	dma_resv_assert_held(&vm->resv);
> > @@ -1283,7 +1317,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
> >  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> >  	struct xe_pt_migrate_pt_update bind_pt_update = {
> >  		.base = {
> > -			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
> > +			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops :
> > +				&bind_ops,
> >  			.vma = vma,
> >  		},
> >  		.bind = true,
> > @@ -1348,7 +1383,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
> >  				   DMA_RESV_USAGE_KERNEL :
> >  				   DMA_RESV_USAGE_BOOKKEEP);
> >  
> > -		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> > +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> >  			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >  					   DMA_RESV_USAGE_BOOKKEEP);
> >  		xe_pt_commit_bind(vma, entries, num_entries, rebind,
> > @@ -1667,7 +1702,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
> >  				   DMA_RESV_USAGE_BOOKKEEP);
> >  
> >  		/* This fence will be installed by caller when doing eviction */
> > -		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> > +		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> >  			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> >  					   DMA_RESV_USAGE_BOOKKEEP);
> >  		xe_pt_commit_unbind(vma, entries, num_entries,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index f3608865e259..a46f44ab2546 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -60,6 +60,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
> >  
> >  	lockdep_assert_held(&vm->lock);
> >  	XE_BUG_ON(!xe_vma_is_userptr(vma));
> > +	XE_BUG_ON(xe_vma_is_null(vma));
> >  retry:
> >  	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> >  		return 0;
> > @@ -581,7 +582,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
> >  		goto out_unlock;
> >  
> >  	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> > -		if (xe_vma_is_userptr(vma) ||
> > +		if (xe_vma_has_no_bo(vma) ||
> >  		    vma->gpuva.flags & XE_VMA_DESTROYED)
> >  			continue;
> >  
> > @@ -813,7 +814,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  				    struct xe_bo *bo,
> >  				    u64 bo_offset_or_userptr,
> >  				    u64 start, u64 end,
> > -				    bool read_only,
> > +				    bool read_only, bool null,
> >  				    u64 gt_mask)
> >  {
> >  	struct xe_vma *vma;
> > @@ -843,6 +844,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  	vma->gpuva.va.range = end - start + 1;
> >  	if (read_only)
> >  		vma->gpuva.flags |= XE_VMA_READ_ONLY;
> > +	if (null)
> > +		vma->gpuva.flags |= XE_VMA_NULL;
> >  
> >  	if (gt_mask) {
> >  		vma->gt_mask = gt_mask;
> > @@ -862,23 +865,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  		vma->gpuva.gem.obj = &bo->ttm.base;
> >  		vma->gpuva.gem.offset = bo_offset_or_userptr;
> >  		drm_gpuva_link(&vma->gpuva);
> > -	} else /* userptr */ {
> > -		u64 size = end - start + 1;
> > -		int err;
> > -
> > -		vma->gpuva.gem.offset = bo_offset_or_userptr;
> > +	} else /* userptr or null */ {
> > +		if (!null) {
> > +			u64 size = end - start + 1;
> > +			int err;
> > +
> > +			vma->gpuva.gem.offset = bo_offset_or_userptr;
> > +			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> > +							   current->mm,
> > +							   xe_vma_userptr(vma),
> > +							   size,
> > +							   &vma_userptr_notifier_ops);
> > +			if (err) {
> > +				kfree(vma);
> > +				vma = ERR_PTR(err);
> > +				return vma;
> > +			}
> >  
> > -		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
> > -						   current->mm,
> > -						   xe_vma_userptr(vma), size,
> > -						   &vma_userptr_notifier_ops);
> > -		if (err) {
> > -			kfree(vma);
> > -			vma = ERR_PTR(err);
> > -			return vma;
> > +			vma->userptr.notifier_seq = LONG_MAX;
> >  		}
> >  
> > -		vma->userptr.notifier_seq = LONG_MAX;
> >  		xe_vm_get(vm);
> >  	}
> >  
> > @@ -916,6 +922,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
> >  		 */
> >  		mmu_interval_notifier_remove(&vma->userptr.notifier);
> >  		xe_vm_put(vm);
> > +	} else if (xe_vma_is_null(vma)) {
> > +		xe_vm_put(vm);
> >  	} else {
> >  		xe_bo_put(xe_vma_bo(vma));
> >  	}
> > @@ -954,7 +962,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
> >  		list_del_init(&vma->userptr.invalidate_link);
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >  		list_del(&vma->userptr_link);
> > -	} else {
> > +	} else if (!xe_vma_is_null(vma)) {
> >  		xe_bo_assert_held(xe_vma_bo(vma));
> >  		drm_gpuva_unlink(&vma->gpuva);
> >  		if (!xe_vma_bo(vma)->vm)
> > @@ -1305,7 +1313,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  	drm_gpuva_iter_for_each(gpuva, it) {
> >  		vma = gpuva_to_vma(gpuva);
> >  
> > -		if (xe_vma_is_userptr(vma)) {
> > +		if (xe_vma_has_no_bo(vma)) {
> >  			down_read(&vm->userptr.notifier_lock);
> >  			vma->gpuva.flags |= XE_VMA_DESTROYED;
> >  			up_read(&vm->userptr.notifier_lock);
> > @@ -1315,7 +1323,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> >  		drm_gpuva_iter_remove(&it);
> >  
> >  		/* easy case, remove from VMA? */
> > -		if (xe_vma_is_userptr(vma) || xe_vma_bo(vma)->vm) {
> > +		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> >  			xe_vma_destroy(vma, NULL);
> >  			continue;
> >  		}
> > @@ -1964,7 +1972,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
> >  
> >  	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
> >  
> > -	if (!xe_vma_is_userptr(vma)) {
> > +	if (!xe_vma_has_no_bo(vma)) {
> >  		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
> >  		if (err)
> >  			return err;
> > @@ -2170,6 +2178,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  				operation & XE_VM_BIND_FLAG_IMMEDIATE;
> >  			op->map.read_only =
> >  				operation & XE_VM_BIND_FLAG_READONLY;
> > +			op->map.null = operation & XE_VM_BIND_FLAG_NULL;
> >  		}
> >  		break;
> >  	case XE_VM_BIND_OP_UNMAP:
> > @@ -2226,7 +2235,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >  }
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > -			      u64 gt_mask, bool read_only)
> > +			      u64 gt_mask, bool read_only, bool null)
> >  {
> >  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> >  	struct xe_vma *vma;
> > @@ -2242,7 +2251,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  	}
> >  	vma = xe_vma_create(vm, bo, op->gem.offset,
> >  			    op->va.addr, op->va.addr +
> > -			    op->va.range - 1, read_only,
> > +			    op->va.range - 1, read_only, null,
> >  			    gt_mask);
> >  	if (bo)
> >  		xe_bo_unlock(bo, &ww);
> > @@ -2254,7 +2263,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  			xe_vma_destroy(vma, NULL);
> >  			return ERR_PTR(err);
> >  		}
> > -	} else if(!bo->vm) {
> > +	} else if(!xe_vma_has_no_bo(vma) && !bo->vm) {
> >  		vm_insert_extobj(vm, vma);
> >  		err = add_preempt_fences(vm, bo);
> >  		if (err) {
> > @@ -2332,7 +2341,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
> >  				struct xe_vma *vma;
> >  
> >  				vma = new_vma(vm, &op->base.map,
> > -					      op->gt_mask, op->map.read_only);
> > +					      op->gt_mask, op->map.read_only,
> > +					      op->map.null );
> >  				if (IS_ERR(vma)) {
> >  					err = PTR_ERR(vma);
> >  					goto free_fence;
> > @@ -2347,9 +2357,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
> >  					bool read_only =
> >  						op->base.remap.unmap->va->flags &
> >  						XE_VMA_READ_ONLY;
> > +					bool null =
> > +						op->base.remap.unmap->va->flags &
> > +						XE_VMA_NULL;
> >  
> >  					vma = new_vma(vm, op->base.remap.prev,
> > -						      op->gt_mask, read_only);
> > +						      op->gt_mask, read_only,
> > +						      null);
> >  					if (IS_ERR(vma)) {
> >  						err = PTR_ERR(vma);
> >  						goto free_fence;
> > @@ -2364,8 +2378,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
> >  						op->base.remap.unmap->va->flags &
> >  						XE_VMA_READ_ONLY;
> >  
> > +					bool null =
> > +						op->base.remap.unmap->va->flags &
> > +						XE_VMA_NULL;
> > +
> >  					vma = new_vma(vm, op->base.remap.next,
> > -						      op->gt_mask, read_only);
> > +						      op->gt_mask, read_only,
> > +						      null);
> >  					if (IS_ERR(vma)) {
> >  						err = PTR_ERR(vma);
> >  						goto free_fence;
> > @@ -2853,11 +2872,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> >  #ifdef TEST_VM_ASYNC_OPS_ERROR
> >  #define SUPPORTED_FLAGS	\
> >  	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
> > -	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> > +	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
> > +	 XE_VM_BIND_FLAG_NULL | 0xffff)
> >  #else
> >  #define SUPPORTED_FLAGS	\
> >  	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
> > -	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
> > +	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
> >  #endif
> >  #define XE_64K_PAGE_MASK 0xffffull
> >  
> > @@ -2903,6 +2923,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >  		u32 obj = (*bind_ops)[i].obj;
> >  		u64 obj_offset = (*bind_ops)[i].obj_offset;
> >  		u32 region = (*bind_ops)[i].region;
> > +		bool null = op &  XE_VM_BIND_FLAG_NULL;
> >  
> >  		if (i == 0) {
> >  			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> > @@ -2929,8 +2950,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> >  		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
> >  				 XE_VM_BIND_OP_PREFETCH) ||
> >  		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
> > +		    XE_IOCTL_ERR(xe, obj && null) ||
> > +		    XE_IOCTL_ERR(xe, obj_offset && null) ||
> > +		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
> > +				 null) ||
> >  		    XE_IOCTL_ERR(xe, !obj &&
> > -				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
> > +				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP && !null) ||
> >  		    XE_IOCTL_ERR(xe, !obj &&
> >  				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
> >  		    XE_IOCTL_ERR(xe, addr &&
> > @@ -3254,6 +3279,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	int ret;
> >  
> >  	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
> > +	XE_BUG_ON(xe_vma_is_null(vma));
> >  	trace_xe_vma_usm_invalidate(vma);
> >  
> >  	/* Check that we don't race with page-table updates */
> > @@ -3313,8 +3339,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> >  	drm_gpuva_iter_for_each(gpuva, it) {
> >  		struct xe_vma* vma = gpuva_to_vma(gpuva);
> >  		bool is_userptr = xe_vma_is_userptr(vma);
> > +		bool null = xe_vma_is_null(vma);
> >  
> > -		if (is_userptr) {
> > +		if (null) {
> > +			addr = 0;
> > +		} else if (is_userptr) {
> >  			struct xe_res_cursor cur;
> >  
> >  			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE, &cur);
> > @@ -3324,7 +3353,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
> >  		}
> >  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> >  			   xe_vma_start(vma), xe_vma_end(vma), xe_vma_size(vma),
> > -			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> > +			   addr, null ? "NULL" :
> > +			   is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
> >  	}
> >  	up_read(&vm->lock);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index 21b1054949c4..96e2c6b07bf8 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -175,7 +175,17 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
> >  	}
> >  }
> >  
> > +static inline bool xe_vma_is_null(struct xe_vma *vma)
> > +{
> > +	return vma->gpuva.flags & XE_VMA_NULL;
> > +}
> > +
> >  static inline bool xe_vma_is_userptr(struct xe_vma *vma)
> > +{
> > +	return !xe_vma_bo(vma) && !xe_vma_is_null(vma);
> > +}
> > +
> > +static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
> >  {
> >  	return !xe_vma_bo(vma);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index 02d27a354b36..03508645fa08 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -227,7 +227,7 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
> >  	drm_gpuva_iter_for_each_range(gpuva, it, addr + range) {
> >  		struct xe_vma *vma = gpuva_to_vma(gpuva);
> >  
> > -		if (xe_vma_is_userptr(vma))
> > +		if (xe_vma_has_no_bo(vma))
> >  			continue;
> >  
> >  		if (*num_vmas == max_vmas) {
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > index 243dc91a61b0..b61007b70502 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -29,6 +29,7 @@ struct xe_vm;
> >  #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> >  #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
> >  #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
> > +#define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
> >  
> >  struct xe_vma {
> >  	/** @gpuva: Base GPUVA object */
> > @@ -315,6 +316,8 @@ struct xe_vma_op_map {
> >  	bool immediate;
> >  	/** @read_only: Read only */
> >  	bool read_only;
> > +	/** @null: NULL (writes dropped, read zero) */
> > +	bool null;
> >  };
> >  
> >  /** struct xe_vma_op_unmap - VMA unmap operation */
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b0b80aae3ee8..27c51946fadd 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -447,6 +447,14 @@ struct drm_xe_vm_bind_op {
> >  	 * than differing the MAP to the page fault handler.
> >  	 */
> >  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> > +	/*
> > +	 * When the NULL flag is set, the page tables are setup with a special
> > +	 * bit which indicates writes are dropped and all reads return zero. The
> > +	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
> > +	 * handle MBZ, and the BO offset MBZ. This flag is intended to implement
> > +	 * VK sparse bindings.
> > +	 */
> > +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> >  
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> > -- 
> > 2.34.1
> > 
