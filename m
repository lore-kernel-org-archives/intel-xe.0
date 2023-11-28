Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEAC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3710E0B7;
	Tue, 28 Nov 2023 16:19:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3A10E0B7
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701188342; x=1732724342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HNLJRgX7WWH7io3KpiyeLLIdsdpU+X+76/9nrYffPGg=;
 b=a/o4gAu78Hat0JYqHI6G4Ftvt010QrbY8NW9M0PMmCxDRfgyr21ZChxm
 Xd3PNgilmsPrTEGvq+XdLGiOIEJzpm5NNus374X4juykbJEo+iUjdOFMR
 /xVvMeSN6X2rw4mh6x7cfbVIdJOGw82/lAwJL4CGuSn67wnY5fDRTrpop
 kBoOnobbt2jn3g98/7xLpASZapGrQQOpa3GewAR+p62oORydAC4CEdAC9
 POHEIWee0b7YjyjppzJN9YMn5Yhzp0DkivL/j2r0UjmV2GEAa1mp0FdpK
 Fm/pc7tCTPzQf5W//PT1ISKxklZzm8zL6FDzk8dUgRpYRIo2tTTgLaWbW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373125675"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373125675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="16980291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:18:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:18:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:18:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:18:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:18:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6lGE+vjP1qTkkZb6ZknmZgaa5hvljCTrmADSBUovR5s8AUuilevaa3h8Z2hsdZK1DHk/hPgfoFiF4sFFxnn6cX0jtJ6sO5JCTEQJHI1rw8VGce4I/3uqbkSQ5V+SZ183a0yD1hM10YX+kLluvVD86WBzPXWhteR5d39wdjp2HPYR45Eci5VMwdmrpCBa96ORac3G6gybpx4M7rn0v9wAxCNC2GGVoATG0HMgR0qDZ/NaMlJlUgulbQUypwG8aabtsY5Ip/wdLWctsMDn4QLuSglryCcNn5Py5zIVbPemGDfolvVLmaaIs+FnUDsbjohx/Jcm/5HN7iw81exsGi4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOkVbGWZxmDntrS1DpP0+GS7a/ODqE62122+y8jhC7g=;
 b=XXL3c2CgfS5n2C/21rCK6ATMRPJ8VEBxx8nMc5rPHloR32U7sViC+kysTA5pMoEJkKhEvbq5XFEZBvQuBk/B4ngv/GjC0WD1Tyty7q5sqpXwr/GWEhd8n0WsDsWnileugx2vn3VWb9Y+PNPiWfW+PDNxZ8phHgI57ndCz6kGvlOZf6LD+oW7mS0upEzHDjFyaVfGtkWgXt/ThnTIn2hOREFJ5xvXClykyAeN/snGB39QeSXPPlxr/fC0y7dMo9wbYdVZ6ROVHGlDgzivYyex9kknonpU8Fu74zQkdf/zNS2c4wxrjyquE2ZTZzGkGh6JregN9xk+j5mzG4f1wrERdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Tue, 28 Nov 2023 16:18:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 16:18:53 +0000
Date: Tue, 28 Nov 2023 09:17:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZWWwIcj8/qF8fnpe@DUT025-TGLU.fm.intel.com>
References: <20231127123349.23698-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127123349.23698-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a37ebde-7aea-40e2-d32b-08dbf02db6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zmjZ7PyeaLVUiMk2O/qqzuOUcptyBzTBuqANvF1PaJNv7MqGb7VjzI1R4JYKANoyYT+7dGi1+8QVBMOXo4i/WihGBmPeh724sHrpXgN2GwYVPfV2wnexaLt9QUSTioXy/+JcdkUi//IZwHWj7foDtoja2P8qd+rv6dQLrz4emfQy6LXnHZEI4kqE7yKfM3EfxrvCW3m166gk1oDO6QkAGb3yO2Gv7rQ2WntOX09Fh9gbK9HTrp6DGeoBeDxjNuISMOGrLpuZbRVqfbXzbU9BVCzc6vOzw0oMykvK/7sw0PBPy13GHowlVJJbaIbGKuKugY9LkCZziBiRHaeCnXXgTR3YR1vBix1VdCsf36PBBgdDiX/VcbMvMLp+l1xMrQOLEDuYF+AJtndvzt65lHSsMXZvCo1LHdWbdEabQIcemyDcRVAMJiZ6h9TQgyEC3eSCsOaMnFA1RCbsSCnjt0bOZu79y6b1RyuzK7E0RtQ66CvsS9wBdS6e1UE/AubvrelkcU1MLNu4U/nDCMqxmGeS9GkHMf3sZ6QHuSVL6gjZWGWTrE55XSrl3nBS5qXLAPJG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(41300700001)(86362001)(6666004)(30864003)(478600001)(5660300002)(2906002)(83380400001)(44832011)(8936002)(8676002)(66556008)(66946007)(6916009)(66476007)(4326008)(54906003)(6486002)(316002)(26005)(6512007)(38100700002)(66574015)(82960400001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tMEYRStsdRU5NOhkGREGCp5NPB14TRGitEcdMMqwDayAkR2B0vCzkn5V7P?=
 =?iso-8859-1?Q?6dKhqM5tTafGxBmpm2hen5KhZiaWPdwbmJ7yqp2JsOm56nToF8E/0r/USD?=
 =?iso-8859-1?Q?DTVgaa6HPSMoAdtFihc/UzK7bulx73zVhJ1cZ2p6w8o531r43/SW/GxPHu?=
 =?iso-8859-1?Q?d/jbOpUaaecaLu+gng248K5sGOkp35umlI6nsPTxsBGT1Kcd0HAx+mtQ5j?=
 =?iso-8859-1?Q?tWlddAjfnaspGfi/VokPtBJbVrziQ3Y07UXZRb7C+YOx5X4wBfAyRxdqzv?=
 =?iso-8859-1?Q?ClYUvkLS1zi5UhBpdquXNVJ8osn3Oic6XBkVZCf5MmxsBAh6HbhWzNhkP8?=
 =?iso-8859-1?Q?5ycVfJmvhLhI7tzKaX1vkZC5JRQCBsLTC4ICJdskwU1yglnY73+dMi1T3L?=
 =?iso-8859-1?Q?OOJIvhViOsrEPQPhs53hoWiUVpD02PVd5k6IyletxgzU8KlQNeDQAnAt+7?=
 =?iso-8859-1?Q?ztPvbu3hKWANZ+brkDlfU/fzoBg904P/ft8DwmtGiqRpmWXnr1AA3LCxhk?=
 =?iso-8859-1?Q?dkaBhDN/8YQmmI60od7HDylXeLwaEYuQSxsbb2poSc6WU0CJFR5E7dckLJ?=
 =?iso-8859-1?Q?HxO/FULX7LWZFuc8cr6odQdE9FtsL8l1S3eC0vaZzB3bR/TgZDyn2V1vPN?=
 =?iso-8859-1?Q?H9GC2nNou/8218Yt/sBU6M/qaPDKLNo6G30Rjwa2TRmgJmAVb9dOZ175bT?=
 =?iso-8859-1?Q?hxvxrmhHuW6T0EbGFHaDDinJS9VwhNebhQCwHT67siRz4hT5WZ0xiCUVG5?=
 =?iso-8859-1?Q?yHhltShXU6+Ka8/3of42F7qy+XbuIF4QT2EOjgnX8ILhgzW7UkxKvVCM4/?=
 =?iso-8859-1?Q?48mYLZvbz3emwGbbHBC7xteSkhox8bZHOxVQc+wQiAQaqQyZRLYyUUMVQU?=
 =?iso-8859-1?Q?Bn0RvCn26v2cM6yVgFowNUUOMz/us8Lmi2an3Lun8rsgdTdz7YK1LAzPU2?=
 =?iso-8859-1?Q?LRWM08ppHsdESFn7FsGuN5YtiBAFF4Fu908p0UMsDJINyrpgljGhAMHR8+?=
 =?iso-8859-1?Q?mpE+lkOmV75+b1xM7u5caDkgZovnMi0DsYGHwQfnruFbrQKUFopMQx9108?=
 =?iso-8859-1?Q?/7/3grmMURZCaJWDCUly6Q/4JNjEFLMnIh1W3gotNQjCBtS8sn6lbQx1XW?=
 =?iso-8859-1?Q?jrV/m69DfWcvtPDMAKwpDfCvuP1OGyPpZuOLuruiTp3zEpxlkUbllvRNU+?=
 =?iso-8859-1?Q?OnRDmQR5z99mJvKgCaWIZ9wCJmGVX/DEc8kpre5djJJ/j2N1s8URJFIrhe?=
 =?iso-8859-1?Q?fg2zkumOrzULGY512U2l4IAbXkrgV4RtcMehA7XK/LP3gl0fJSd14XjR5v?=
 =?iso-8859-1?Q?xEG161I7xQwcr3FJxLBHhrb2fSnb6aPPU034Y8E6x2tsyxl/ys0F5s/PLG?=
 =?iso-8859-1?Q?PAwxeAdQL9y9oAMxEUR6hhpQaKSaLklNkfqGUKwBtNLdZGxCfo8H/hv68+?=
 =?iso-8859-1?Q?r9GttV0d686M1coggVgq5vyUKji1zMeerWaDE0qk4r+nHzV8XxN0gXeYka?=
 =?iso-8859-1?Q?lNQSTSefdXvJAIKmejVpf3R1ZpJ6JifR6a+03/135RtcgvoL42SHSnUT/l?=
 =?iso-8859-1?Q?4esOJooVhpdGLOwNonlscogQKxNEk7nHWUAo9WeK+50SEhS/TlKFI5MFRL?=
 =?iso-8859-1?Q?JdQPiL/CZWNtn2lFuk4SXDjQ0bef0hzSywHTLfvmvtogj9SsJDebKIMA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a37ebde-7aea-40e2-d32b-08dbf02db6a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:18:53.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOP0/h/aOG7qJvO9qo6elMqK5fA6iTAAWu/uox0tzAdh/x5/FYOcCjoRXpEpw4Gx0IoawTnjZKa+8y10giVePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Internally change the
 compute_mode and no_dma_fence mode naming
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 01:33:49PM +0100, Thomas Hellström wrote:
> The name "compute_mode" can be confusing since compute uses either this
> mode or fault_mode to achieve the long-running semantics, and compute_mode
> can, moving forward, enable fault_mode under the hood to work around
> hardware limitations.
> 
> Also the name no_dma_fence_mode really refers to what we elsewhere call
> long-running mode and the mode contrary to what its name suggests allows
> dma-fences as in-fences.
> 
> So in an attempt to be more consistent, rename
> no_dma_fence_mode -> lr_mode
> compute_mode      -> preempt_fence_mode
> 
> And adjust flags so that
> 
> preempt_fence_mode sets XE_VM_FLAG_LR_MODE
> fault_mode sets XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE
> 
> v2:
> - Fix a typo in the commit message (Oak Zeng)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c       | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++----
>  drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c         |  6 +++---
>  drivers/gpu/drm/xe/xe_sched_job.c  |  2 +-
>  drivers/gpu/drm/xe/xe_sync.c       |  6 +++---
>  drivers/gpu/drm/xe/xe_vm.c         | 20 ++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h         | 16 ++++++++--------
>  drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
>  9 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 28e84a0bbeb0..347239f28170 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -100,7 +100,7 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
>  	LIST_HEAD(dups);
>  	int err = 0;
>  
> -	if (xe_vm_no_dma_fences(vm))
> +	if (xe_vm_in_lr_mode(vm))
>  		return 0;
>  
>  	/*
> @@ -182,7 +182,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	for (i = 0; i < args->num_syncs; i++) {
>  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
>  					  &syncs_user[i], true,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_lr_mode(vm));
>  		if (err)
>  			goto err_syncs;
>  	}
> @@ -197,7 +197,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  retry:
> -	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
> +	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
>  		write_locked = true;
>  	} else {
> @@ -279,7 +279,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	/* Wait behind munmap style rebinds */
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
>  							  &vm->resv,
>  							  DMA_RESV_USAGE_KERNEL);
> @@ -292,7 +292,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto err_put_job;
>  
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		err = down_read_interruptible(&vm->userptr.notifier_lock);
>  		if (err)
>  			goto err_put_job;
> @@ -307,7 +307,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (!xe_vm_in_lr_mode(vm)) {
>  		/* Block userptr invalidations / BO eviction */
>  		dma_resv_add_fence(&vm->resv,
>  				   &job->drm.s_fence->finished,
> @@ -330,14 +330,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> -	if (!err && !xe_vm_no_dma_fences(vm)) {
> +	if (!err && !xe_vm_in_lr_mode(vm)) {
>  		spin_lock(&xe->ttm.lru_lock);
>  		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
>  err_repin:
> -	if (!xe_vm_no_dma_fences(vm))
> +	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
>  err_put_job:
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 62d0237e724e..d932c31f9fa4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -327,7 +327,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
>  	if (XE_IOCTL_DBG(xe, !create))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
> +	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
>  		return -EINVAL;
>  
>  	if (value)
> @@ -705,14 +705,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe,
> -					 xe_vm_no_dma_fences(vm) ? 0 :
> +					 xe_vm_in_lr_mode(vm) ? 0 :
>  					 EXEC_QUEUE_FLAG_PERSISTENT);
>  		up_read(&vm->lock);
>  		xe_vm_put(vm);
>  		if (IS_ERR(q))
>  			return PTR_ERR(q);
>  
> -		if (xe_vm_in_compute_mode(vm)) {
> +		if (xe_vm_in_preempt_fence_mode(vm)) {
>  			q->compute.context = dma_fence_context_alloc(1);
>  			spin_lock_init(&q->compute.lock);
>  
> @@ -785,7 +785,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>   */
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
>  {
> -	return q->vm && xe_vm_no_dma_fences(q->vm) &&
> +	return q->vm && xe_vm_in_lr_mode(q->vm) &&
>  		!(q->flags & EXEC_QUEUE_FLAG_VM);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e9e925c7353..97e87c701af5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1211,7 +1211,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	ge->q = q;
>  	init_waitqueue_head(&ge->suspend_wait);
>  
> -	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> +	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  q->hwe->eclass->sched_props.job_timeout_ms;
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
>  			    get_submit_wq(guc),
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 338bffe4885f..c2af86b0de75 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1292,8 +1292,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  	 * non-faulting LR, in particular on user-space batch buffer chaining,
>  	 * it needs to be done here.
>  	 */
> -	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
> -	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
> +	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
> +	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_preempt_fence_mode(vm))) {
>  		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>  		if (!ifence)
>  			return ERR_PTR(-ENOMEM);
> @@ -1355,7 +1355,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>  			xe_bo_put_commit(&deferred);
>  		}
>  		if (!rebind && last_munmap_rebind &&
> -		    xe_vm_in_compute_mode(vm))
> +		    xe_vm_in_preempt_fence_mode(vm))
>  			xe_vm_queue_rebind_worker(vm);
>  	} else {
>  		kfree(rfence);
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index adbd82f8744e..b467d5bfa4ac 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -92,7 +92,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	/* Migration and kernel engines have their own locking */
>  	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
>  		lockdep_assert_held(&q->vm->lock);
> -		if (!xe_vm_no_dma_fences(q->vm))
> +		if (!xe_vm_in_lr_mode(q->vm))
>  			xe_vm_assert_held(q->vm);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index eafe53c2f55d..ea96ba4b41da 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  			struct xe_sync_entry *sync,
>  			struct drm_xe_sync __user *sync_user,
> -			bool exec, bool no_dma_fences)
> +			bool exec, bool in_lr_mode)
>  {
>  	struct drm_xe_sync sync_in;
>  	int err;
> @@ -118,7 +118,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>  	case DRM_XE_SYNC_FLAG_SYNCOBJ:
> -		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
> +		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
>  			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
> @@ -136,7 +136,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		break;
>  
>  	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
> -		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
> +		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
>  			return -EOPNOTSUPP;
>  
>  		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b39c6f43f01f..5a4483bb00b1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -335,7 +335,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	int err;
>  	bool wait;
>  
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  
>  	down_write(&vm->lock);
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> @@ -389,7 +389,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   */
>  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
> -	if (!xe_vm_in_compute_mode(vm))
> +	if (!xe_vm_in_preempt_fence_mode(vm))
>  		return;
>  
>  	down_write(&vm->lock);
> @@ -592,7 +592,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	long wait;
>  	int __maybe_unused tries = 0;
>  
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  	trace_xe_vm_rebind_worker_enter(vm);
>  
>  	down_write(&vm->lock);
> @@ -836,7 +836,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>  	struct xe_vma *vma, *next;
>  
>  	lockdep_assert_held(&vm->lock);
> -	if (xe_vm_no_dma_fences(vm) && !rebind_worker)
> +	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
>  		return NULL;
>  
>  	xe_vm_assert_held(vm);
> @@ -1409,9 +1409,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		vm->batch_invalidate_tlb = true;
>  	}
>  
> -	if (flags & XE_VM_FLAG_COMPUTE_MODE) {
> +	if (flags & XE_VM_FLAG_LR_MODE) {
>  		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
> -		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
> +		vm->flags |= XE_VM_FLAG_LR_MODE;
>  		vm->batch_invalidate_tlb = false;
>  	}
>  
> @@ -1514,7 +1514,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	xe_assert(xe, !vm->preempt.num_exec_queues);
>  
>  	xe_vm_close(vm);
> -	if (xe_vm_in_compute_mode(vm))
> +	if (xe_vm_in_preempt_fence_mode(vm))
>  		flush_work(&vm->preempt.rebind_work);
>  
>  	down_write(&vm->lock);
> @@ -1973,11 +1973,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
>  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
> -		flags |= XE_VM_FLAG_COMPUTE_MODE;
> +		flags |= XE_VM_FLAG_LR_MODE;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
>  		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
>  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> -		flags |= XE_VM_FLAG_FAULT_MODE;
> +		flags |= XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE;
>  
>  	vm = xe_vm_create(xe, flags);
>  	if (IS_ERR(vm))
> @@ -3065,7 +3065,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>  					  &syncs_user[num_syncs], false,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_in_lr_mode(vm));
>  		if (err)
>  			goto free_syncs;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b08c75fbd8a1..9a0ae19c47b7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -152,19 +152,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
> -static inline bool xe_vm_in_compute_mode(struct xe_vm *vm)
> +static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
>  {
> -	return vm->flags & XE_VM_FLAG_COMPUTE_MODE;
> +	return vm->flags & XE_VM_FLAG_FAULT_MODE;
>  }
>  
> -static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> +static inline bool xe_vm_in_lr_mode(struct xe_vm *vm)
>  {
> -	return vm->flags & XE_VM_FLAG_FAULT_MODE;
> +	return vm->flags & XE_VM_FLAG_LR_MODE;
>  }
>  
> -static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
> +static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
>  {
> -	return xe_vm_in_compute_mode(vm) || xe_vm_in_fault_mode(vm);
> +	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
>  }
>  
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
> @@ -186,7 +186,7 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>  
>  static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>  {
> -	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
> +	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
>  }
>  
> @@ -201,7 +201,7 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>   */
>  static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>  {
> -	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
> +	if (xe_vm_in_preempt_fence_mode(vm) && vm->preempt.rebind_deactivated) {
>  		vm->preempt.rebind_deactivated = false;
>  		xe_vm_queue_rebind_worker(vm);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index aaf0c7101019..f23e8f462eff 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -161,7 +161,7 @@ struct xe_vm {
>  	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
>  	 */
>  #define XE_VM_FLAG_64K			BIT(0)
> -#define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
> +#define XE_VM_FLAG_LR_MODE		BIT(1)
>  #define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
>  #define XE_VM_FLAG_MIGRATION		BIT(3)
>  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> -- 
> 2.41.0
> 
