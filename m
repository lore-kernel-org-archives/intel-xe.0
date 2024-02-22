Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE0C47DD9
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 22:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03A10EAA9;
	Thu, 22 Feb 2024 22:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRDwYQw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C276C10EAA9
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708642604; x=1740178604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sNFronO2A1j2+TbdQxNwPLCUe1NzELwoP+tpzeAlFtk=;
 b=GRDwYQw9j4OnEBYaxZ7xzuE9Li7mXWEtlXHxT3FrnAgUou/0245U45Bx
 fitlh7xUNhkbNak6lbt5LA+f8PkAAFLcESb6YmXuywSJEiGwgSlvw5OaH
 1x0QHnTTO7xLhyeP6HBcjsscSex6U79R8tnEcKLB4Xxuc7CeTbqkoXDhH
 hTVxW01BZCk6fiBaeT0zE1TZXeYtvjumY68cGYm4vhrX9tOJ9JFCgs7L2
 /z1O088gAjWkmBwH0GxkjGB6bdG0qAzoDnTuL8wozedSk2UdARg5WcTz4
 oTpR1UfIdyvfaJuJEJLKRXxz6c+Tvl0OImgTai2L13tUfLHa9XcR7/Td9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="5865924"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5865924"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6044525"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 14:56:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:56:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:56:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 14:56:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 14:56:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuF9UBnBJaXIryUNPkZC1xzEoHYod7jPiXRfzVz+MGhXAEUvhDqva1cytLT0LN7AIXKZchN0VQqeZZqfAeBIl08eeXHc2NvCLXTkarNt0ETnJJ2/cwO+4BrfFJeO9uJCT7hJghMYERB/HCKrD86jJte41V7u/oG2EAW9m4pU7cVZOjhA7fjyqPQ9FHQHc/EivfbOrRDxhBZErD7QAidGNs63NXhkxt6h45F8EtZydQCEKIGxClToH7cTenQg8S1MRGnfWMaVI4ISRC5lefgUquAhvb7YhsMlSR8mD3+SD0KpQXbolASy6tONKjgpbBX/3zDWv2wzUuncoP/Dc1VV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4VUPeM2SKfE3xQmQGQ9pmNTZVDlKkhwrPl4lLV1e7g=;
 b=BS35hg1TOyBbJMZJFBvwBi8QjcBvTimFk3Y7LZjuE/ybkxB5X0m3Sb+GDhtMkCMemnaPbVuU/yU3tkSU92skEX+mpOa7BXV88b3RxTx2VqA3VErwZNUsXeonsaFWVrG9myVlC6HDsYG2AUHH4suKh/QHx3RELBXwObVxMPzFAEmcZPLd1ywgDWq+OIrcJbU7ckNTrdMH/v9WMAevOV39yHWlLJ8OuriwO0Tu8XAHcQFvuJaDy0Sg/qF/pM/b1CNY6q+J5k+ypYy6Qe05mmDzy+l9TGmltVaWZYa9NHGlH6L5IZwUGcPbFxcGLQZ5G8ybBjuaSrUz0EduFntQQ5gBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 22:56:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%7]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 22:56:30 +0000
Date: Thu, 22 Feb 2024 22:55:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Don't issue TLB invalidations for VMAs if
 using execlists
Message-ID: <ZdfQ56ywbvkExQQp@DUT025-TGLU.fm.intel.com>
References: <20240222035906.3835257-1-matthew.brost@intel.com>
 <20240222035906.3835257-3-matthew.brost@intel.com>
 <Zde_4ZO9L4Q8jDRB@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zde_4ZO9L4Q8jDRB@intel.com>
X-ClientProxiedBy: SJ0PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: f235147a-fd9e-44bf-8aad-08dc33f981e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: li0l15Nglag1/t6/zkoteCjtoHf89zpGpGounIi2D1k/C620Z813050qRlNqMHT/phbSCbwkbKQNwg9lsEK7QUJlPVh3p+C2F3upEQqzMiK0Nyf7jbrbLpNAqHpP5PQzExCCuf/2pPmanDXzej4H9a4mY8qT9ntV/fFkL99H35WI24ghLmLTVjS8F2VHqqCed9YJdKxYyx4ZfLrVpFZBJujRR7LZQXr9nIrFDW9zVaGmoU7rQc6v0ym6qO24Lr7/mmKGdPBaoeXVyAoWub4iW8YyQeeHiobnywjp0boM4EBKNl/P8Bm3+yCB9WaWOjS7PX7RMgPaNWqJ/tAiJ1qg/hOOH69MI20poPXmReTmTAN/a6Am4cw5pEHZ3PG1KXGkfeyG0der6Xe+dTqTkgyJjDZC7NZcZWuYLIr/Gx8Jyivb+SaLAcgW4plVPSQAxREvzgWXighZXF+IfzNkNbdijOD79MXUkowC/tH3xB47N8dMyt/SkqjxPrAOJUboicYzt4RsCJM7yYWumQROMYOYBNGrQew2ZInUISIeJrfJhXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LX1A8IsQ6jnLSadd4NbE1OykpY/eGFltAJi/ZQJNwhh4rW1YMBiM/UouXUcS?=
 =?us-ascii?Q?1roet0hhOUgzGMIHojYbKEz6pBpcampHRQwLw0rl2QKYrHb+p4r6Sj3uZaVg?=
 =?us-ascii?Q?4EDmKz38EMupRGy+262BrLf595kMlj8VmVec4kzbOzCTXSZejt4oSVtMn4Ro?=
 =?us-ascii?Q?/RJwX/VTmJlyCbAcRSMGMq4qBPX7FGql4xhwwk38zw8fEcweUEPluROa3wQA?=
 =?us-ascii?Q?uJBsleez+y7/3pf+AP8YqegwvwP7VRo7ohwj2NSlY0wftCKijKFOO2TEp/gF?=
 =?us-ascii?Q?9tXC4n2LaLT64y0tltkdr3cDkxa4QLCS225tBa/GQZuPp9umlT+9sB4Ep0Ad?=
 =?us-ascii?Q?gBU2URljl563YXkLlo2iXbZyDy0P+R12Rd9TQHd111BZ0tgVEKmkDNaVmF3O?=
 =?us-ascii?Q?T1GdpdbDN4yzBjJv5RDZcmxhcyul7+oQW4jGeTtkytxTm/2mlqeKpF+YazJQ?=
 =?us-ascii?Q?q4jEukgLhr72eFdv/dR3dskh0/FmcyoT228sKibWtSVNx6YyLev70iermjoB?=
 =?us-ascii?Q?4G2xUWRVYRL5NtZeleTXpMyqZ4JgiFt8vJMll9CmJWZrQdkY+3b+wrNguFp4?=
 =?us-ascii?Q?HRGDUcExQk0002KqAyb8OOwGI6wpqYaVS01R2jvrxDdHDQvJQws3RVkN8OWD?=
 =?us-ascii?Q?RsPx3P8+IriEf8HOkD87eL5TaucUorDYqif5/jHu86lvStpSK491SmcPp/qI?=
 =?us-ascii?Q?SGrluEchWaWnBZBxwVuYSiq8wM0jt/d90ebuUi6mnf/42pKcBPCJir40tMtP?=
 =?us-ascii?Q?cKeivCTXtEEZXGEA4R/4Zj1qQ3ryZuRDt4vgyq+ieSydrQ2SuPAGQIoQG7E/?=
 =?us-ascii?Q?B/ZfN7tyZ8yR8lua40rKbDbLyOsSKuUYVQf4SMm9puMl+0/HFFRCvV1+rD5x?=
 =?us-ascii?Q?O1+Q9NtLYFi6/iLQfduiC5mhN8N8r2MIbB0sQm9RrJ7Mzz/T+G57WYawGH05?=
 =?us-ascii?Q?TkBf4aBXFF/RNJTGYPhE3OAjnizFyTUrUvL79fU6zwkEyMOLtV74pIPtRSX5?=
 =?us-ascii?Q?1d9jFei/JaByNZW2m20TFdU3TinAdt74aKaIvmkJZpWHQH/jJxiOspLae4M0?=
 =?us-ascii?Q?SsRMr2azAz4ch9MEc23lUKPY3980fwGHLIz1zjx/fxQwI+ddu781HMz2WZfd?=
 =?us-ascii?Q?cIQx+58E9H69mdEFcox32lMurkrAVLHUehYeuAEA45U1V7zFR7MLr5HU3ecy?=
 =?us-ascii?Q?o5tP/OzubQ0b4RcPcAjHMlavfJ15g5moLNtO0quC5oiH60ddE+KYchywKCYm?=
 =?us-ascii?Q?EUBnoN+9U+6GLBn8H2PiqgYmpU+dP10M9JFzGWxA1bfG8FzyWH7Hsuj5h6mJ?=
 =?us-ascii?Q?iAMBUo6v5RfKVazVtfOX0St8tG3qW59kdawCiWtDqWwJD1Gvc2pXjfIBCjGc?=
 =?us-ascii?Q?UpAceiGE2lGw+3SF8jUr8+U02k7Yq8gYX9XeKgL35cp8op9Fq6h3KWXNLrZB?=
 =?us-ascii?Q?FgskOgfrX+uY+tvPrji1yni2NqkkF5hiMhb7fhZtFqBir/wfNmufLx/e0eB/?=
 =?us-ascii?Q?0KAB5cLyQEJVpw5PjwuyU7F1+pt+I6O4n/1qg8w+6armR3N2nGBRwd9PTak2?=
 =?us-ascii?Q?sh9RHNqEa3iT/ZqdmS89m5DjtYsDc4yWGHiJ+/OQMZCWN/lAvVVMFDKetKTy?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f235147a-fd9e-44bf-8aad-08dc33f981e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 22:56:30.0520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAYyH2+Loi3cPqo4Rfwgx99XWA/vFBvbbSgZTMWmrL/RVcUNdQ8Mmq/YOYxwptKpF/lsebiTIGjSFVALm8FHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

On Thu, Feb 22, 2024 at 04:42:57PM -0500, Rodrigo Vivi wrote:
> On Wed, Feb 21, 2024 at 07:59:06PM -0800, Matthew Brost wrote:
> > TLB invalidations for VMAs are currently only implemented with the GuC
> > enabled. Do not issue TLB invalidations if using execlists. A longer
> > term fix would be up the TLB invalidation layer to be execlist aware.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 32 +++++++++++++++++++-------------
> >  1 file changed, 19 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 7f54bc3e389d..c4de13bcfe85 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1256,9 +1256,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
> >  	 */
> >  	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
> >  	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
> > -		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -		if (!ifence)
> > -			return ERR_PTR(-ENOMEM);
> > +		if (!vm->xe->info.force_execlist) {
> > +			ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > +			if (!ifence)
> > +				return ERR_PTR(-ENOMEM);
> > +		}
> >  	}
> >  
> >  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> > @@ -1574,7 +1576,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> >  	struct xe_vm *vm = xe_vma_vm(vma);
> >  	u32 num_entries;
> >  	struct dma_fence *fence = NULL;
> > -	struct invalidation_fence *ifence;
> > +	struct invalidation_fence *ifence = NULL;
> >  	struct xe_range_fence *rfence;
> >  
> >  	LLIST_HEAD(deferred);
> > @@ -1593,9 +1595,11 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> >  	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> >  				   num_entries);
> >  
> > -	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > -	if (!ifence)
> > -		return ERR_PTR(-ENOMEM);
> > +	if (!vm->xe->info.force_execlist) {
> > +		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> > +		if (!ifence)
> > +			return ERR_PTR(-ENOMEM);
> > +	}
> >  
> >  	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> >  	if (!rfence) {
> > @@ -1625,13 +1629,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
> >  			dma_fence_wait(fence, false);
> >  
> >  		/* TLB invalidation must be done before signaling unbind */
> > -		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
> > -		if (err) {
> > -			dma_fence_put(fence);
> > -			kfree(ifence);
> > -			return ERR_PTR(err);
> > +		if (ifence) {
> 
> I'm not so sure about the indirections of the conditions here...
> 
> probably deserves some refactor with earlier return or different functions?
> 
> But anyway, let's unbreak things first while we think on a better
> organization/separation.
> 

Let me just fix this in a slightly better way with all of in xe_gt_invalidation layer.

Matt

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > +			err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
> > +			if (err) {
> > +				dma_fence_put(fence);
> > +				kfree(ifence);
> > +				return ERR_PTR(err);
> > +			}
> > +			fence = &ifence->base.base;
> >  		}
> > -		fence = &ifence->base.base;
> >  
> >  		/* add shared fence now for pagetable delayed destroy */
> >  		dma_resv_add_fence(xe_vm_resv(vm), fence,
> > -- 
> > 2.34.1
> > 
