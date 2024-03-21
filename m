Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A1CC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 17:03:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7D010E87B;
	Thu, 21 Mar 2024 17:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI76Ntbc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D01710E87B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711040581; x=1742576581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h9r0ZtFRcSg207EDC3brBqjtccnrEHb4dhpYM9FLMTg=;
 b=YI76NtbcznWYIweJnDINBqY95dqYLq1wXbR4DwBZJhKb0ERagomEJlYU
 x333yhzp+W/FPwyHeHvvsmQKs4c+FLVYZtV4wA2ue0qrUwi4buu4Zmq/9
 sq+aFPkoceLdn7pumVsu7a061bDKead+HTIaPgAwgOjLgWydtS5AcAxtc
 Lv0wWWT35wZTo/rIkKLdFSNjiRxsU9HKTmAHCnpoWMzSvfW8+9kS3kyyU
 9a6T6MBqh98pVrjn2H9pbAgEEnmhbnzVS6c4mDUlQvZ0mY7n6+qrOBFBf
 LFNSJdaUW3P8RG9E5SUcUC62dCAZgritM5NiHkAmudZVoJT1U97333Wbv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17443251"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17443251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 10:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="52026903"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 10:02:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 10:02:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 10:02:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 10:02:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 10:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGkfNSWLIg9u4ebgosBGkgD8K9TLYPnOeM+Ym+n5b3F43PRdTF39izKea3Bg4AQgvZO4RfEy/39xtMJVAx4yb3kqZzrLjk4SSQVCY6MMr4L9Cwd03VDZTv4O+6nz2p8DZsjB5/nN52Vv4jILxlkdw6xvLDBos+THQrMx+X90MNiRC1ChKDGHYZr3JyFiD5LHFPnJO/EGTg3UDaFcLwsqhzoILG56Qrm2UTgt5QEA9FhqMhNvZcytdmzBO6kJO3Z61l1vx47z8ynXq62PNEWMunpeg0AHVLlulMaO6NKwenTy6iw/wsKAGcxUQiDS2jxD0MSzyKk2mvi9CslgUNO28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WXCeXO5N9nhzFOquDZWQ1ZV3JoZidVEREpISYbLglo=;
 b=D/QqiZlhnLez0fGzo6T8tSTkEcw5aiY/XRGvQe4NHUFwJoG7t12leKbvOBqNFoPQ86dM+xQ8Tg3o69u/kiaSZb8A28ZF5DhrCYVciVbXnzuS5rwL54EvbSuCMpSHxMvC8oCQIzf2aK5XCuHMBOrWuhLO49gVfYGVOuzYkGylM3pyv5OEiF/uQhUsrNSdeJkT3BmBt4NfWUrGrSgjK+e4HY9azQUDYEC/B9nwQYHx3fpkgmL8aDUC5E2m76Ey3gUgcF8RbNSEInndm7oUDqoFhG4cT26alTXilIQtYgefb1rskq+G5EwGRQVXD3aTJEFFP4BOuVisAe9GEkE94O4sIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6655.namprd11.prod.outlook.com (2603:10b6:806:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 17:02:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 17:02:28 +0000
Date: Thu, 21 Mar 2024 17:01:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Message-ID: <Zfxn/o1Qugq1hG6C@DUT025-TGLU.fm.intel.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
 <ZfunwkSUxdlFWmcn@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB699154B66898A29896FFB5D192322@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB699154B66898A29896FFB5D192322@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: b880584f-cc7a-4898-d1ce-08dc49c8b04d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMHgGBtGo69armiinejkOgSk0upqW7LEkunHBk9GaduSxxvcSRtfupTYL0sscTNw9yoob5zsbsTV+C62d8ypakBiWzRAFWfVkXoUBJYrJL2W73CVf5TNoFLgvNnyrVwM0eG2y3ES1DGhd+BMwKuUxT42Fe/CRy3fBrFoeCyQXMu6//9N2lyYKjF7+wAsEGfZIRlpXQBxYRkr4eIVnev/PNY++nJwJj03a7nS2J8KZldEd0Ga0d2ZZ4Icp0JdiPtjcv8XKHysarD5nQdnduy95uO4Ybz0VDOIySXHlRQezHknzX8VwZy22N9VnPBgAQbPjLM3bg3CTEfPb0aaPGb5iAfM2JUKmeJ3TbzAapSuvkXMNYANyCbxQuI2P21Wk9JaG1I7Cw+ZOHr95aPIkePLuYZmHZqASZBHfVnQwJlTVNNXZ7OzHX9whCjRu/hxUmlzB26fjOSkd0I+nlS+J+dvyY76H6biToEqhbgbvqTOBU6dv+6Q2JjeaDBDzIGdmUu1/nMZ+6JcSs1w8MIe4Tyx/g3PMkEGRfFGRAlOKXlPaS/OoKbLk0SCSe3lGWm3506fqTutZKDqzTSQsIb0Go+7LxtqsWXDj1s74LnyxDqq3+G81PAtfEJl9vUDUn24FRZV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ABCTygsETCl9L5tJM0n+Wq1flWMLKoFzqBjlEgxWLNnsAKJ9u6pW4c9rd2l?=
 =?us-ascii?Q?3azcKOiZdqSA86QtFMceloa6QQvHufxtZjeBuzttFK0507kr5UNbH3bRbdXU?=
 =?us-ascii?Q?Bh+n284YH90y4HzKU2JYmpfJB1KB+Kn8lYRImvHAskttyv0zNO7CQUf87Jfq?=
 =?us-ascii?Q?Uan6zDNEKukvdkmygsGox/kbkV441+jIb9uyQ1YBZlDITvtTUvMCpv3pYOcy?=
 =?us-ascii?Q?jnJ6dV9ZRet9P7fFMluskOM6uTv2zlJ7zVICDoGI0rHpAGpBoypWm1z28936?=
 =?us-ascii?Q?orNPDh4UjCaNy/FY1WI+ramAM2RomsZgRCiz+awG9UuZFz9nFJpHTB/XjZp5?=
 =?us-ascii?Q?lNWfaDmLTIxG4UKuqCJjF8D5Oqcrw8jd1ZZeXclmDKaNdKHjbK2e3F1Tzhlj?=
 =?us-ascii?Q?aExr+jGywz4e8YG28O/etQSZLZ1bz2pG//yJOW+h+f2fEpmfX1Gglqt9W9D3?=
 =?us-ascii?Q?1fiXTIhViNTcnhH/Twgvj5qTA/kstUlRfB+XX5eS410aZ766J4/AdG0Xzlpe?=
 =?us-ascii?Q?9YjKJ96p3LvFpZQQt//YsZwSgAcQkfTZt9OLFydy9xf8wgDLerOvVBxjxNJX?=
 =?us-ascii?Q?5yvpKnmm5RPKDuV6hN4wf8FZsmuHs3KicmBPLT2J016xVt5040NV5+wunSDt?=
 =?us-ascii?Q?7seGi7OcAk9EERi7eQdSlfgaSCn4bGej0HGScjm5AnYJN5MuhbnSU3567EbH?=
 =?us-ascii?Q?sXT+OpR8SueLfeQYcyMQvqxIJ3FvSMWdMgU/WP51Bld6EDTjx2Zpre2zU2MM?=
 =?us-ascii?Q?qmeE+3u6IerOkaClIlCy9VnpUvvYMikyf2bd+F3+l9mNX2DLneuvzUdJKZok?=
 =?us-ascii?Q?Ixe/oRp+p1UxwBGfuBYMOJK7qkjisT6ZzkwU4ZZ5G3VQPCDkysSx8Hxkj19q?=
 =?us-ascii?Q?kyKPgWclrcqDzFGNDOuLdATmR6xZ7q48kNA4/GJ4tS+eHs7c6HWmrQUS/66T?=
 =?us-ascii?Q?KVro0QOa8oUY57F/cEdKRpzR6N6nNXIxnoF0GpSOybdcL2YDCc2/luM4iOv3?=
 =?us-ascii?Q?XNjMlNxzEixXEDXblY0t/EpPFyUfkIKEn78TZko4IMpACI1sPJF2ih6EQb9h?=
 =?us-ascii?Q?o1rVgjepfuEg8wT+hc2Nk8llAye/ykwMCMmyk+FUJgU25n3Zk0H1Hz8GnwCu?=
 =?us-ascii?Q?eki/JR3eWAvjSzNn5bmky20Y7zeZoRlRVXbfhZ4waD3F/AVCUBNX2GWscuU/?=
 =?us-ascii?Q?SjfBml2G1INBRzLBrKUFWV15PBTa7+t07X7Olod13hPf2tt7NUA76HdMTxx+?=
 =?us-ascii?Q?jKf/OPTYiFSUBMiQkQ/IS2tybcwkNpVH64uqEEDXu3rk4gS1h8hCPHkcrWGM?=
 =?us-ascii?Q?212FiIlSt+8h6npEAyOslAC0TpwM4t8D5Vwe32m1KQynfqg5X14/A9hOMfKj?=
 =?us-ascii?Q?LSasQj8OP4hZRCx4dL6a4IEv1LhRlvzVLiIFdNxzlYX+LgbcRuleiO//Rlgl?=
 =?us-ascii?Q?Ng7DL/vsV/gyRC2DPV4VS8Hym3TtVhT7dJ3zWu/sP6S8HSDfowUBsdunTtCu?=
 =?us-ascii?Q?gUOgDttHmMhbcO+5diRl/6V8UTfl8mx9ghB6P2XJPMnqy/4snLcdbn5irxu2?=
 =?us-ascii?Q?+rEpdOiJzkTHLJyxBB/Llt4wFFbucVc2gbZGbQGtbKH9NCzW3nM5SibhH58t?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b880584f-cc7a-4898-d1ce-08dc49c8b04d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:02:28.2566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLDBkYhcUt3p+9BiDdv8h2OTZWDcjRLwiXkp56fJ9czarPwcaBkRMsEx9DNVT3GtbZqxyiQYN2NV+vWgH8SQRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6655
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

On Thu, Mar 21, 2024 at 08:56:15AM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, March 20, 2024 11:22 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimiray,
> > Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> > <lucas.demarchi@intel.com>
> > Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
> > 
> > On Wed, Mar 20, 2024 at 10:29:39PM -0400, Oak Zeng wrote:
> > > When there is MMU_NOTIFY_UNMAP event happens, the userptr
> > > is munmapped from CPU. There is no need to keep the xe_vma
> > > for this userptr from GPU side. So we destroy it.
> > >
> > > But we can't destroy vma directly from the mmu notifier
> > > callback function, because we need to remove mmu
> > > notifier during vma destroy. If we remove mmu notifier
> > > directly from mmu notifier callback, it is a deadlock.
> > > xe_vma_destroy is modified to destroy vma in a worker
> > > thread.
> > >
> > > Another reason of this change is, for the future
> > > hmmptr codes, we destroy vma when hmmptr is unmapped
> > > from CPU. We want to unify the hmmptr and userptr
> > > code.
> > >
> > > I believe this is also the correct behavior for userptr.
> > 
> > It is not, the user is still responsible for unmapping. 
> 
> Do you see a problem of the scheme I described? In that scheme, if user vm_unbind after userptr is freed/munmapped, we can return user an error "userptr is already freed". Is this a problem to you?
>

We did this until was merged - the next userpr pin pages would return
-EFAULT. Turns out the compute apps call free / munmap on userptrs with
bindings as the time for performance reasons. Thus the [1] we just
invalidate the userptr if we can't pin the pages.

[1] https://patchwork.freedesktop.org/series/130935/
 
> My thinking is, the xe_vma state for userptr depends on a valid userptr. When user free/munmap userptr, the userptr is gone, so the xe_vma should also be gone. Isn't this a general valid design principle? Xekmd itself seems apply this principle a lot. For example, when we destroy a vm, all the exec queue of this vm is destroyed, not requiring user explicitly destroy queues.
>

Not a wrong of thinking about it but see above.
 
> 
> Even if this was
> > the correct behavior we'd have to unmap from the GPU and update internal
> > PT state before calling xe_vma_destroy.
> 
> In vma_userptr_invalidate, we called xe_vm_invalidate_vma to zap PT state. But currently it is done only for fault mode. If we use my scheme, this should be done for both fault and non-fault mode during a MMU_NOTIFY_UNMAP event.
>

I'm unsure where it done in this patch - xe_vma_destroy free the KMD
state / memory for the xe_vma. It does not remove / update the GPUVM
state, the PT state or interact with the GPU to update the page tables.

We only call xe_vm_invalidate_vma in notifier for fault because the
other modes (dma-fence / preempt fence) it is call somewhere else (exec
IOCTL / preempt rebind worker respectully). The dma-resv slots in these
modes ensure that after vma_userptr_invalidate returns the GPU will not
be touching the userptr. GPU exection is resumed in exec IOCTL or
preempt rebind worker either the userptr is rebound or invalidated.

Make sense?

> 
> > 
> > The correct behavior in this is case just let the userptr page pin fail
> > and invalidate GPU mappings. This recently got merge in [1].
> 
> This also works, but the design is not as clean as my scheme IMO. 
>

The UMDs have requested the existing behavior.

> For hmmptr, there is no vm_bind (except the initial gigantic bind which doesn't count). It is reasonable to destroy vma when user free/munmap, otherwise we left over a lot of zombie vmas. So at least for hmmptr we should apply my scheme. Whether we should unify the scheme for both userptr and hmmptr, I think it is still debatable. 
>

The HMMPTR case, this concept is correct. Hence I implemented garbage
collector in my PoC [2]. The implementation however, is not. See my
comments above about what xe_vma_destroy does. Rather than calling that
function - it should be addded to a list which a worker picks up and
proper modifies all state (GPUVM, internal PT state, and GPU page
tables) needed to destroy the VMA. The garbage collector can be thought
od mini-IOCTL that only implements DRM_XE_VM_BIND_OP_UNMAP for the VMA.
Hence in my PoC it calls the same functions the bind IOCTL calls albiet
with slightly different arguments.

Again, does this make sense?

Matt 

[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocator/-/commit/91cf8b38428ae9180c92435d3519193d074e837a

> Oak
> 
> > 
> > Have a pending test for this in [2].
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/130935/
> > [2] https://patchwork.freedesktop.org/series/131211/
> > 
> > > This patch is experimental for CI and open to discuss
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 11a4bb9d5415..90d1163c1090 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -40,6 +40,8 @@
> > >  #include "xe_wa.h"
> > >  #include "xe_hmm.h"
> > >
> > > +static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
> > > +
> > >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > >  {
> > >  	return vm->gpuvm.r_obj;
> > > @@ -604,6 +606,9 @@ static bool vma_userptr_invalidate(struct
> > mmu_interval_notifier *mni,
> > >
> > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > >
> > > +	if (range->event == MMU_NOTIFY_UNMAP)
> > > +		xe_vma_destroy(vma, NULL);
> > > +
> > >  	return true;
> > >  }
> > >
> > > @@ -901,7 +906,8 @@ static void xe_vma_destroy(struct xe_vma *vma, struct
> > dma_fence *fence)
> > >  			xe_vma_destroy_late(vma);
> > >  		}
> > >  	} else {
> > > -		xe_vma_destroy_late(vma);
> > > +		INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> > > +		queue_work(system_unbound_wq, &vma->destroy_work);
> > >  	}
> > >  }
> > >
> > > --
> > > 2.26.3
> > >
