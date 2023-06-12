Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553DC88CB2
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jun 2023 15:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F210E2B0;
	Mon, 12 Jun 2023 15:54:37 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777D410E2B0
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jun 2023 15:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686585276; x=1718121276;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QYe6H8ad5cllxyuKbf5h3FqgOt1CHY/d2euCtlsgtk0=;
 b=HFs5BerLKpqXk9g/u0KZ7+E4EtbMcO7tuKBFVbck68ixv3aGdGgzOcyH
 zggiXtm8epTVc3+a8djNW143sP/LpJb5wuVxruocFGlI+O1fPZYZhaiFi
 Z2cB6jvklNBmqpon8Y40/p4OyMeCR7ZLFNbMIz/g5die7aSvv04X99try
 QnkmNJ7AR5Ep0sdG6k1RafT9j9U3fKgodshdApy1sBqT3X9MgNS/OO+x8
 I/9pZkOcH+jjBtEyvvz0aN9GywdvnHBAOUqY8WibyYXzONEEDq3eMWsiB
 3TScsPIqut7/c1yNTK4z1mxH7uJcPl5I7ZUkfnJuPOa8944yv8r3R57nr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="421675191"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="421675191"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 08:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="885500072"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="885500072"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2023 08:54:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 08:54:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 08:54:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 08:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDPFtrIRPSMsyo+FWvEoYtsZG0tlrNIepMiQtDNmmNXj7NCyM9rhOKbdvTWJaYmlXbhz27DW0YWCVJjmZC7vU0RkxxwQFBrLPI6eUH8nzGUNyr9Wqgn8dzjywqUkd9lGfURhrmemvhVEQtNJH2NqIKrV0NDf58t75kbe1eizP6dElyh3PPzwMdlWiJ4PH15HCUgvfaY4nNt6x6LPrrdRU9RGUE2JMNoxfQ/xn7cnvSq4xbOA5NQ92R8ytcB51lz8pYb6qFh5mUr2zZijM183OCFQQMA9Ou+9yxPU3iPF2ak1eWOojFjWKyUhRKGgqvFwKISIhZd852WT0vHso17F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftM5QekiVjtug9DJpg3bZy38QXZ9V9VlSOxkGfC0l9c=;
 b=h3nbagVCC1F2zYHMLwh2kT4GghToqnoPbM2j/NVsEXawlLgGbpKTCJHUdUJO6ZsjunkUb0EnXPpnofksGoCSuxOrnepYfvpNCMOkNZj5BlCXa4FQSSo2efopGGAu/XPrPLDUCayk6TT8b4txBNEkGAqJFll4pAwduFqljwLbSMxqkHNFMcu7J+qn2koI9WZFR8j6ANioZwgWs0AYJsumDFl32duhnBJKXTFmEyiRNTicycXCSdRAwTfP5j7Myt/QrHBGnBuS9e3rnIoCP5WjDn4exM7ubfCswzeJdSiTHuNbkGkvUuQlHWyvOOPAMgym2v7sqMe1BCEWaAaFMNsm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7517.namprd11.prod.outlook.com (2603:10b6:a03:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 15:54:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 15:54:31 +0000
Date: Mon, 12 Jun 2023 15:53:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIc/jCOp/RtYI8mL@DUT025-TGLU.fm.intel.com>
References: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
 <20230609085840.114729-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609085840.114729-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1123c5-d3cd-4281-b7aa-08db6b5d4f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GhlmU1ALtkNgqE8QKAx2ydhXe2ta88QqnZYt9HiZUNvwBlduis5nlButPu3YAP+E9v2nPddkOpUmg+9lORcFVQ4cXM0BBiFVs0uHBhE7IEqFGFnbasrVEQ+prJUQj1XzWgjDJwgMf6haZYCn+vPKDNy/3MMravLzo8xkMRYX2VquY4Bgf/yE1n5ow3v3icY7XvLSENw/Eu3pF4Fmne4KVlj7JLX4ydht7KJLqXuCsAJu5jNPOau3fBmigSdIl1SOZD7t0tswufa/E5/tDYibWLaq0qrVDZGqpO6aTRSVXjfIOy8HNaTIzvHVHAVCqFuNjrNIYR8KYwkaaZ8Dz2ez08+PU2ue4quO24By2kexGWFIb7dgMKq0gE6eRwSIrGS8TJm4hiw/qYxLVBdho519ALr3l3+JZRVMza0QtG37bS0RcTCDMhSYzEFKkJaoyetBwRglUtbDKXjOy18Bhc8TUIMvky7vr557sYLmkZw+OIVSPxVwNp6SIZ8kh0dCOw4AIRhwdU10W+c/VHQDuVVJsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(396003)(39860400002)(366004)(376002)(451199021)(966005)(6666004)(6486002)(478600001)(66574015)(83380400001)(82960400001)(186003)(6512007)(26005)(38100700002)(86362001)(6506007)(66476007)(6916009)(4326008)(66946007)(66556008)(41300700001)(316002)(44832011)(5660300002)(2906002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CtXzv3NyuDvzNPPNG4eJw9P5qkJ5NbKYJngB7yt+hEgy2VUW7e7hGSrY/6?=
 =?iso-8859-1?Q?hwSA9eRIvmnAQuZkbxa4tlEUpL9BUCQubJVFWjF2xxKJSzvkDFKl3M6M7F?=
 =?iso-8859-1?Q?kMmS8N7IvevqBDnmCItDdEhQNeUtyM6Nf+ce377+bQAThbJ7P4v7VDrlBB?=
 =?iso-8859-1?Q?qkd3DdWFNM60FqoJ+Qo7aHscR3QGy4frCn5hTVELv7ap8cu9sE7OEHod4k?=
 =?iso-8859-1?Q?9lcPEr/spNOTktBQfPGpUzDK4yYK6wUZikL8dzhMU3E1I1IlPKpOACE+gy?=
 =?iso-8859-1?Q?IFdUapE28aMSTBh0iU3sT7nSHI5A74OCnrah+HPKUl2TEEh7arCTMlCiS/?=
 =?iso-8859-1?Q?DhktQ7769vw2dVFSXN5Pz+QInOX/uBN6Key/Ukg1lH0GemyC05HiLnQxGB?=
 =?iso-8859-1?Q?MXTgXy3GBbKyws8iahrjnTci5N8A+HyGNH7cp128CJ6rVq58lBrk36cPPk?=
 =?iso-8859-1?Q?3vzwiRSPbqefnOENdzW4M/0ml+lcWMCEYE2WI/bJXbDSAUsLpU5fJcbbw2?=
 =?iso-8859-1?Q?XpBAucOcJWzR7Qcp6KLsYuhFDGsML+SEluyQp+sVhoiirLfgzaNxENXQQT?=
 =?iso-8859-1?Q?zY37GHVQcXxLf5pMBSaEyi1S1cfLDFDAbibB0gN/G1xV4jDemHt6ZFZYmd?=
 =?iso-8859-1?Q?KL4iYY/VNVmTnFi/Hq74g0odLhxtZCNiMMqpw0uVA5uH4Uc/VHNrPyDbXM?=
 =?iso-8859-1?Q?lOWxc8Z1TKC4HCgPIvmgMpR/Z0TdwEgzNaHdvZX344kRhe09GR0zdUjzoi?=
 =?iso-8859-1?Q?HLruObxQIo7t6siDYoPCI5gMycXb+ag7BsQrfFQZQzuzZpKgAuC1yk5V3V?=
 =?iso-8859-1?Q?rAIIDC7qsIam9yhF7kaayZcQeeiOLJ3eINPYQJQ71NIm2K2ue038yGsCIQ?=
 =?iso-8859-1?Q?6hDs+iTUr43F9j/6Q5TBYhEpopZwchqWTFMBIqaUhAoZYnGqhyoLrfXVvF?=
 =?iso-8859-1?Q?r43pHqjCUdDZHppK+EbaMIW+9iTki2e51tknAQeish7vLoB/33xSJ7UOD+?=
 =?iso-8859-1?Q?70uGDdv1LiZuPP6Va7j1I6g1wytoAkvPHzwd5Z1Zq3H0lruwjMefEBv4bt?=
 =?iso-8859-1?Q?Wet1CqkHqLm6EIOWpKwt91VVkpqycDJ2Zy0cG9VX6rzBAP89RJBP4wt42W?=
 =?iso-8859-1?Q?GGAohqpq0SJV2XYDT+dWOMjr8c3zf8vATpd2FtDcJh0PSNNBgcCsD/cugO?=
 =?iso-8859-1?Q?AYfkF1wnZ0R646cBxE4kSzUOzlI+46xlUr4mwWw3dt1AjXygYJAgxON9q6?=
 =?iso-8859-1?Q?M6/3sOxI8fGayF0Eb091JEoMrcVVhEZXADbaN2CNi0VTlOSHVlzYRoiVlV?=
 =?iso-8859-1?Q?x4EtJHQ9XCd7apVr9oklh/XRIjSHwmLv9xsuy73AeUlNEYKE2afZwiq2wV?=
 =?iso-8859-1?Q?a2HudkuTEt45YQeQIAdIecdZTHklxGajMDlHPCvSNeCJyW5KtbDxILPk/E?=
 =?iso-8859-1?Q?na7zM8dekKqVq6fzFT46lTPKef5guEAYGV7ZWGkdTiy6k7YtqVP5YnQQsF?=
 =?iso-8859-1?Q?Xw0XfmSkJkUw5zu1zSyP318UA6CrAbOutybGq8ZYjVBDCjimmOQQ/AIwer?=
 =?iso-8859-1?Q?RvF2HlGNtXp4i6IYhh43I73EtiM7JPAesMk2zVyZr5cr7n1I0n4zZbQCd8?=
 =?iso-8859-1?Q?eTmhsQgh0KE7y9Sn/9Uo8x0mXXfHxcsi4sD1L6lOIujyQkcWPTFItnBA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1123c5-d3cd-4281-b7aa-08db6b5d4f9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 15:54:31.7439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j18k2KiIPzL+cEk7imyzgg2NoEISLfp+6IO9IerZ85Ve/wuR0hmk97TKBv88WNSlmj5Xm6UM1iEeovJjq8LYzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7517
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe: Invalidate TLB also on bind
 if in scratch page mode
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

On Fri, Jun 09, 2023 at 10:58:39AM +0200, Thomas Hellström wrote:
> For scratch table mode we need to cover the case where a scratch PTE might
> have been pre-fetched and cached and used instead of that of the newly
> bound vma.
> For compute vms, invalidate TLB globally using GuC before signalling
> bind complete. For !long-running vms, invalidate TLB at batch start.
> 
> Also document how TLB invalidation works.
> 
> v2:
> - Fix a pointer to the comment about TLB invalidation (Jose Souza).
> - Add a bool to the vm whether we want to invalidate TLB at batch start.
> - Invalidate TLB also on BCS- and video engines at batch start where
>   needed.
> - Use BIT() macro instead of explicit shift.
> 

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Tested-by: José Roberto de Souza <jose.souza@intel.com> #v1
> Reported-by: José Roberto de Souza <jose.souza@intel.com> #v1
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/291
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_pt.c                | 17 +++++++-
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 47 +++++++++++++++++------
>  drivers/gpu/drm/xe/xe_vm.c                |  2 +
>  drivers/gpu/drm/xe/xe_vm_types.h          |  3 ++
>  5 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 0f9c5b0b8a3b..1a744c508174 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -73,6 +73,7 @@
>  #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
>  #define   PIPE_CONTROL_CS_STALL				(1<<20)
>  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> +#define	  PIPE_CONTROL_TLB_INVALIDATE			BIT(18)
>  #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index bef265715000..2c472fafc811 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1297,7 +1297,20 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>  
>  	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
>  
> -	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
> +	/*
> +	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> +	 * cached PTEs point to freed memory. on LR vms this is done
> +	 * automatically when the context is re-enabled by the rebind worker,
> +	 * or in fault mode it was invalidated on PTE zapping.
> +	 *
> +	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
> +	 * PTE is already cached in the TLB so it needs to be invalidated.
> +	 * on !LR VMs this is done in the ring ops preceding a batch, but on
> +	 * non-faulting LR, in particular on user-space batch buffer chaining,
> +	 * it needs to be done here.
> +	 */
> +	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
> +	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
>  		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>  		if (!ifence)
>  			return ERR_PTR(-ENOMEM);
> @@ -1313,7 +1326,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>  		LLIST_HEAD(deferred);
>  
>  		/* TLB invalidation must be done before signaling rebind */
> -		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
> +		if (ifence) {
>  			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
>  							  vma);
>  			if (err) {
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 2deee7a2bb14..dbf06f996568 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -15,6 +15,7 @@
>  #include "xe_macros.h"
>  #include "xe_sched_job.h"
>  #include "xe_vm_types.h"
> +#include "xe_vm.h"
>  
>  /*
>   * 3D-related flags that can't be set on _engines_ that lack access to the 3D
> @@ -74,9 +75,11 @@ static int emit_store_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 *dw, int i)
> +static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
> +			       u32 *dw, int i)
>  {
> -	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW;
> +	dw[i++] = (MI_FLUSH_DW + 1) | MI_FLUSH_DW_OP_STOREDW |
> +		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
>  	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
>  	dw[i++] = 0;
>  	dw[i++] = value;
> @@ -107,7 +110,8 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
> +static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
> +				int i)
>  {
>  	u32 flags = PIPE_CONTROL_CS_STALL |
>  		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> @@ -119,6 +123,9 @@ static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
>  		PIPE_CONTROL_QW_WRITE |
>  		PIPE_CONTROL_STORE_DATA_INDEX;
>  
> +	if (invalidate_tlb)
> +		flags |= PIPE_CONTROL_TLB_INVALIDATE;
> +
>  	flags &= ~mask_flags;
>  
>  	dw[i++] = GFX_OP_PIPE_CONTROL(6);
> @@ -170,9 +177,17 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
>  {
>  	u32 dw[MAX_JOB_SIZE_DW], i = 0;
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
> -
> -	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -				seqno, dw, i);
> +	struct xe_vm *vm = job->engine->vm;
> +
> +	if (vm->batch_invalidate_tlb) {
> +		dw[i++] = preparser_disable(true);
> +		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> +					seqno, true, dw, i);
> +		dw[i++] = preparser_disable(false);
> +	} else {
> +		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> +					seqno, dw, i);
> +	}
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> @@ -181,7 +196,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, dw, i);
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> @@ -210,6 +225,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	struct xe_gt *gt = job->engine->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool decode = job->engine->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> +	struct xe_vm *vm = job->engine->vm;
>  
>  	dw[i++] = preparser_disable(true);
>  
> @@ -220,10 +236,16 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  		else
>  			i = emit_aux_table_inv(gt, VE0_AUX_NV, dw, i);
>  	}
> +
> +	if (vm->batch_invalidate_tlb)
> +		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> +					seqno, true, dw, i);
> +
>  	dw[i++] = preparser_disable(false);
>  
> -	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> -				seqno, dw, i);
> +	if (!vm->batch_invalidate_tlb)
> +		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> +					seqno, dw, i);
>  
>  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
>  
> @@ -232,7 +254,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  						job->user_fence.value,
>  						dw, i);
>  
> -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, dw, i);
> +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
>  
>  	i = emit_user_interrupt(dw, i);
>  
> @@ -250,6 +272,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->engine->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	struct xe_vm *vm = job->engine->vm;
>  	u32 mask_flags = 0;
>  
>  	dw[i++] = preparser_disable(true);
> @@ -257,7 +280,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
> -	i = emit_pipe_invalidate(mask_flags, dw, i);
> +
> +	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
> +	i = emit_pipe_invalidate(mask_flags, vm->batch_invalidate_tlb, dw, i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1c380ad7f6b..efaef437ea97 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1237,11 +1237,13 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  			if (err)
>  				goto err_scratch_pt;
>  		}
> +		vm->batch_invalidate_tlb = true;
>  	}
>  
>  	if (flags & DRM_XE_VM_CREATE_COMPUTE_MODE) {
>  		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
>  		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
> +		vm->batch_invalidate_tlb = false;
>  	}
>  
>  	if (flags & DRM_XE_VM_CREATE_ASYNC_BIND_OPS) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 76af6ac0fa84..5242236b4b0e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -337,6 +337,9 @@ struct xe_vm {
>  		/** @capture_once: capture only one error per VM */
>  		bool capture_once;
>  	} error_capture;
> +
> +	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
> +	bool batch_invalidate_tlb;
>  };
>  
>  #endif
> -- 
> 2.39.2
> 
