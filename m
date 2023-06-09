Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA5CC7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 15:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B8110E147;
	Fri,  9 Jun 2023 15:52:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB1210E147
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686325945; x=1717861945;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fY5lg23Ptzzo3JCkWujzD1Uil+UpbM+P8H5xTzduXHo=;
 b=VT0GK3y1zisNh+vdVAT7na0DDBTJ0LJo+2wwq72x7qlWv/sBffUQUaDA
 m8RRcv8WVTfxjGxu387fEylU4P3R0VJN7CBawHd9uGgbi9Z9/EURCJLY1
 Re3D5tWtCkyPP+Uqgu5bNHwoOAQGodWD9nUX1r8MrVdeyoXOUPd/o+bH/
 AHwdGUER4Km0Eh2Idr5374VB5A1HH9svhrKKouFrXGwHd5Fz6wQTlqKJz
 C6AL+hHnihlWp2tIRm21IehO38Dm9OCNlMJ/L1B75jHG4Qgs/OWRquSFx
 5NLz/E1xZTNu6MW2Hxw/QPqyWilkt6mQ7qIceLcgA4eejlioBqPvMYgtT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="443998071"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="443998071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="687782949"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="687782949"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2023 08:52:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:52:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 9 Jun 2023 08:52:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 9 Jun 2023 08:52:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 9 Jun 2023 08:52:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqinh9Xpamo+2sxHtpkWLPeKOE/GOQ4bCL7zwaDWALtSEXTlaINdVEGvxf/3r+E7Eg6eA56EkMdLvSlNQFlRiFmxD21KSrAjmahz1IoRnBLCCRvvu/hRx9D9N8yYnULHg2jMxjoOsqQ9WGiOMCvVyxgmM7DD2GaGuZuZFxcTPtCjsdeHopKXl8uUYVbzr5RCHLIs3GAMD1qNMSJPqfIg0dIjlZuiOQebhSJJHzMwor8iSUAELIA8/DdRkYVAJPSiHuBO64wFGY/oA3YrtJjSIO0qnMD1uoGO4G5zHDvuI2JU4KWsL9r07h5J8/MSjPB3WWoslsq9MgKG/NTIxw4Fuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENxenWPo9bMPW/KcUethNq5yc8+hEGN0N37kKJHVpCA=;
 b=iol3YPLWdQqosW890wQsJJy8JeCPv3PEATQS/YhX66Mt19FRT9Sv1TP1085nkgWgdBiMvqzCtANTVDRzuCp1CcAJJyhpIIUqeKZuJzihl9WcoHeCbtck6W/dxw/bQaiw6B3Y6ybXNo83c7EgwJuxeZwksWj/CoVIPB5pl/5PsqELe02r8nbfrZFMK2Ne1scWI1kjeX+QxeXAHf9ZbCCsu1OLWtwbFvOff6/aQc7VqWbDEIKz3s5d/QW+pCS9TGGnBP1NPRU6j1kI82OAeiW7A4JCtK1Wrz5qIXEsjvPz5gxEfBUJgS9XSkR8gCvu8zKdL9aH8MtlocSZ5mUQTHep4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 15:52:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 15:52:20 +0000
Date: Fri, 9 Jun 2023 15:51:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZINKknFps5aTrLNi@DUT025-TGLU.fm.intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
 <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 350a76f7-7148-4b6d-4b78-08db690181b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czicnEvLT0PrrO/1gHL4RmLzBJQtZl7px37i32jMKhdQdrnNoPWbRIaGRonKesYGGUj6GO8TFbmtfIobFeuEQqHn8L/W8WZNqMyrVmwPuZJsVUGCm5PwqgiLixdYZbMR99PKwL09eKsL5jf242Iixwf24avSAdlylE8MjdE+sYZ8ALuDCdvTTBdAuuJge6jGalBejmTpMVGad1J4+tXB4zNBi26cGOV5r82tuPFZQAJX7OyZT1PnqwSd6YonfpMl3j6tsvsQCb4suVUgiTnMY6bpU3eloLChywUsmYIDxTe5mEuYeaHvTYJjAX4B/lxS5G39CuQm1htma20k8w3DHjSE3+PLkMx2SpWMNC+ObJLt/u0Wm3fUXA3LlUTOvCBWmnqEdRmbnD30uGPugOq3XgsBUte6zdNvZk46TRp+ghTxTkK2/Ok3dvJ69nz2Z1FiZxiQn7BaG3dLGbftdvAy+Xiyvqs6oLXrhoCthg5xqSjxNTkowsec+jqxwJodzgQjRc/yE3xZIzDG40z0rkRrYf0mCFph0WlqvUw+s+7HsJD3oVorZMjzL2gttFa32Hzg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(41300700001)(8676002)(8936002)(44832011)(2906002)(66946007)(5660300002)(6916009)(66476007)(66556008)(4326008)(316002)(478600001)(6486002)(6666004)(6512007)(6506007)(26005)(83380400001)(186003)(66574015)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qgofkkpTgdlQeww2IJccXhOekhvEsh5SMmDSzaoj2Sp26wd1B1c7AFFfOr?=
 =?iso-8859-1?Q?pzDpQoAUVWtvuO/ktpW0illpiRbBbZE42CWB4bRxpAQeV8wXQFHm0vAFF/?=
 =?iso-8859-1?Q?UwdPnOwAE2GabMtErx6qhvn9tUwfRN8HJwQHT/FuJ+sdwItBiGkul0im43?=
 =?iso-8859-1?Q?ohPcjwtSfa4t4TMz3/vzHPmzJ5f8My0c3cQdARpSKlVeFXcm7fqL1LSL9t?=
 =?iso-8859-1?Q?uuXH0z6yiFiUMDWIgO6/c8jwN2VEJEtQ45/RrjbHx3+DF3igHfbGzWQRok?=
 =?iso-8859-1?Q?c04KRRFRSB5Ep3mgvXclIK3jgiqYCoiqyfEbQ4dzxhqxbMfALfOdPqrbe/?=
 =?iso-8859-1?Q?LYdKjD/ajinQu9TSiL3yEcXNVgZgNEphwGtaduD2uGU7ziuw1wxgLw873N?=
 =?iso-8859-1?Q?TSm/zRkYSfu/GDklr7/67ATZLAZb8yGeQYIQF15zuC+hIIh9oSCvjjBGOc?=
 =?iso-8859-1?Q?j4TFfXwHOePrzoFuqsx5h5XEp8LolZGVHFdBbrp3A69OgAmhguJFJPIQfP?=
 =?iso-8859-1?Q?G7T6p7irtv7cuf4Ja60wvThnWFxWzT5jysTZ4AdgGNlIkZ/OLqdIlgPeIf?=
 =?iso-8859-1?Q?GJvSVQwr2OJ1yW05rdJ+fNOz9KcoiCoOr5d7BtLtBF/z4U7O6YZ/OHaGiO?=
 =?iso-8859-1?Q?SDZoAw5GqgPeVAUzpFOiKrodVPTpYxN3i3zB3XjvtPoScJ+Fl+MFH2tDuV?=
 =?iso-8859-1?Q?1BLGVrmGkpynHSrZQA99v2F6l5usDL/THzMP3QZ3FJnUJ2zOGmgXLqi50p?=
 =?iso-8859-1?Q?DBZS+oUTqcTqlM3yaFGwizG4HgLr0Ifb4cziSRWIQ8G2pEwwq6gACu1Til?=
 =?iso-8859-1?Q?gsgfBTqLSbwFc/K1L/2q6S3VxS8OYjC9v1ZWbwWeTs3ecO24WT0+prk//M?=
 =?iso-8859-1?Q?ZD/zu9RUsn9q281CGi5wNRb1tgIuJmPr42Os/sAv/N8RZ7Q58yPV5uQv+c?=
 =?iso-8859-1?Q?aamlVrZ22jwS2xK3iN8/1mUV+kJh3SsZq2W41Ayhzu8v3vKrdiCoPRKiRY?=
 =?iso-8859-1?Q?h3Sjzs/TPOPCCpfdv7gPG44dQWEVZ9qiyxM2LvV3+cmjedGW/htplKBhoZ?=
 =?iso-8859-1?Q?vZbrs+5G9zwdNWy1LkLJ8WdKwcfazpcCUbi0T2glx9wX/KJLK8usSqPGn/?=
 =?iso-8859-1?Q?7XPF+WnLx5d+0HnN/fB+rQ6UlLy0w9cTcL7oQAxxXfcASwMJJBICxZJqV2?=
 =?iso-8859-1?Q?EdTWq9X9P1PxtWjfk1vUmq24/tdX9i064uuV1/xudSxz1LplJmXMOgrbug?=
 =?iso-8859-1?Q?8ntR+3NnY34vDPp3YV2nuffcjOc0X8rKxzDlidDMNxGrKgSRHt5PHBmpsx?=
 =?iso-8859-1?Q?F2fmDa5xlO8lQ/uMkTl9hR1IdPrnCIX4UWFdJxvzJFj4Q7z8nKcbu3CQoq?=
 =?iso-8859-1?Q?N0zUmPdW2+6Dzxxs9T5NRQIrJ0vbUiUw1oLTEdUz/HjPG15+NT/YWdVfFq?=
 =?iso-8859-1?Q?eCHwhwVt1NlIXBNZTxqIWSUGrd19jp5M6kyXNpptQIP+/4PnyrJww5b1r1?=
 =?iso-8859-1?Q?YwL42jyUpSRJ8HOlrpiUMmORVk+9/7E2+4BOWgCe1AOWbU+80XbXZifDHa?=
 =?iso-8859-1?Q?4rfXfu3aJTDqT1kOb8iaSeq4FMDhbSsQj3YX5vkQLYUIm1zY9NLVtNKp0U?=
 =?iso-8859-1?Q?YquKxwCzK4D3xNdBDu9BDoNWGqzCbdJPkAVTSxEru7t9lPs3QruhdpxA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 350a76f7-7148-4b6d-4b78-08db690181b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 15:52:20.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLDVVirYdx9e8jRb2nYK+8683+siHnAq0CZMs5cuD0A81B47zzuWHNKMS8bvOyMhjkJU9fFeRTQuT1J+0oCSIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if
 in scratch page mode
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

On Wed, Jun 07, 2023 at 07:47:28PM +0200, Thomas Hellström wrote:
> For scratch table mode we need to cover the case where a scratch PTE might
> have been pre-fetched and cached and used instead of that of the newly
> bound vma.
> For compute vms, invalidate TLB globally using GuC before signalling
> bind complete. For !long-running vms, invalidate TLB at batch start.
> 
> Also document how TLB invalidation works.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_pt.c                | 17 +++++++++++++++--
>  drivers/gpu/drm/xe/xe_ring_ops.c          | 15 ++++++++++++---
>  3 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index 0f9c5b0b8a3b..d2d41f717525 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -73,6 +73,7 @@
>  #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
>  #define   PIPE_CONTROL_CS_STALL				(1<<20)
>  #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
> +#define   PIPE_CONTROL_TLB_INVALIDATE                   (1<<18)
>  #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index bef265715000..e817fa9fe65e 100644
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
> +	if ((rebind && !xe_vm_no_dma_fences(vm)) ||
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
> index 2deee7a2bb14..c20fe41c0729 100644
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
> @@ -107,7 +108,7 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
>  	return i;
>  }
>  
> -static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
> +static int emit_pipe_invalidate(u32 mask_flags, u32 extra_flags, u32 *dw, int i)
>  {
>  	u32 flags = PIPE_CONTROL_CS_STALL |
>  		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
> @@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
>  		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>  		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>  		PIPE_CONTROL_QW_WRITE |
> -		PIPE_CONTROL_STORE_DATA_INDEX;
> +		PIPE_CONTROL_STORE_DATA_INDEX |
> +		extra_flags;
>  
>  	flags &= ~mask_flags;
>  
> @@ -250,14 +252,21 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  	struct xe_gt *gt = job->engine->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	struct xe_vm *vm = job->engine->vm;
>  	u32 mask_flags = 0;
> +	u32 extra_flags = 0;
>  
>  	dw[i++] = preparser_disable(true);
>  	if (lacks_render)
>  		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
>  	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
>  		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
> -	i = emit_pipe_invalidate(mask_flags, dw, i);
> +
> +	/* See xe_pt.c for a discussion on TLB invalidations. */
> +	if (!xe_vm_no_dma_fences(vm) && vm->scratch_bo[gt_to_tile(gt)->id])
> +		extra_flags = PIPE_CONTROL_TLB_INVALIDATE;

I think we need a similar if statement + emit_flush_invalidate call in
the functions that emit jobs for different classes too, right?

e.g. emit_job_gen12_copy, emit_job_gen12_video

Matt

> +
> +	i = emit_pipe_invalidate(mask_flags, extra_flags, dw, i);
>  
>  	/* hsdes: 1809175790 */
>  	if (has_aux_ccs(xe))
> -- 
> 2.39.2
> 
