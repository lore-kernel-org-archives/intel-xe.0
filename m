Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1E5C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 00:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3F310E3C8;
	Tue, 31 Oct 2023 00:56:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9095310E3C8
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 00:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698713813; x=1730249813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p4eB/qiU7042mqTK7G+UhEVCB45rfO65VRbGMJXUrY4=;
 b=BOVrPyhyFDAopkE4vjrA9Op1vTXBWMmJn65T3HCLV6K6tJOABxRshUBr
 TMjk6OVsYuVjLydh1J6TuYHLjq9Bg/UsGdtyrr7hfWNaD3o1DNiVPNBEn
 QPtr/QFxF12geI7WNNXYIjEH0B3krQqIjcGBRtd/yU1MsvT1W7YwusAQS
 EVtP8SgDDdpJMIDMgDtoTd11MXYOCYKjOLHVYcS+QlgCEBJY+Agb6gIfo
 NbsDW3rF7xhbAeQdseG8GVPBltuNEzKASxbqOdL7WIrxW7Pkg/SE6vYpC
 IMsPLrlcR3eODIzLxcqQsTh3v/BHolZx8KpFsffoHzkpVF640onJlBfp8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454657566"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="454657566"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 17:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8538155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 17:56:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 17:56:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 17:56:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 17:56:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 17:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCHBxM8N5GldeQ8uleek2fOTeV5zXb7BUg0cra+FKgfXGkda83q1QcaStvlTla+N1RR8OvYDWDzveumNUX26VBiPyRIht8mpOZagh7I0prl8qO0Aa2Ew8G36If4xw8wSNiJn53klu1VQrrex9jPfZtBuKPd7KKe1ebznxWITEHM+SxQ+rmr3ws8Liqaf4QBYmUiWopcWief0454WlU744MTxUMoWtf2e1WO1U0W5CrAwEsNVN0ZrQEWAF17u0EG2mNyZV3X+tFaMqQbAVncOY66+vlUQRhTwg+qaBbDA83+b8srFRHtaWDFAVBbpfZoaoTSeSFO9wy2yCXQ5Iiwq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIv6pznboBUdOGx/ya/Sx7zVGgx52Ep3WUelj+s+65k=;
 b=dnYHXvFjwfgBAU51BQy5Zg6gc4dtD4BD02dnOG+9tNf+xsRWkVgQXPGXtwwKXgmxA4PL8ilD74yvu/kZgLQZDvtMoQSPNuEbcsInSJoi1g+2o/F//nUc0mfibLpqb0f2I/kFiQboMfry50vR04BKbIvyMhJLNpOcn/CynMr1wJuU3PfUMPWAZnfXeOGtGWfTzHfJxgPuVUAcrrOZaafYdZsh9u4HuEe/a79iVHiq8KzLHrSnbD8x1WpkO9hOj5vcNIULTpL2CDr3PHGNkXnK3LOSl9zooaFEmmZEc5bHrxAA8Lwlyuq0DEHraaiYzTlp1+d4WMdr6v0dLck0IdT5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7439.namprd11.prod.outlook.com (2603:10b6:806:343::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 00:56:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 00:56:49 +0000
Date: Tue, 31 Oct 2023 00:55:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dani Liberman <dliberman@habana.ai>
Message-ID: <ZUBQcJESFA0CeN3N@DUT025-TGLU.fm.intel.com>
References: <20231030193850.560629-1-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231030193850.560629-1-dliberman@habana.ai>
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: ad62cbb7-68d9-430b-5870-08dbd9ac42f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoNST3DlWNYscxYGosl/K3HEw1gaXIG8LxTwIngsOD+ZFPEup2Kfb6OiVihKiEUJs5uBQf6KM05s5I7e0/piCZGZR03PYmlu/qoK0Sfq56sB1ch91xDcGx67hwBKxcK8b5WoaiPaVKZK+cSjDk4m4kkORe+dVvDI8orwfe7BYX+SBB5PEug+TzSsIwOsKmxA4Qh5SHnhmE4jm7k/kBZqMLBun0arZyDFbwP43pQ54AqQ2TfTQ9X+5LnByUDrblxHwSHz2s8kYTpG0MV+KUd0N+fMptMCiMxvK9cWyYzS5E1Dbs5+jLZi9WJtHodjZfiTTtLAjqHB6O4R+Ph8n/Tc5uYtg6FBwBKZuCIYRuPDfvIpjgAx2QYLFa55/WqjDeITiI8RIJDJVtD/MMoXdh6ZZj1FW7+YNHAaZ3nUVam4KPvncj1EFU5oXS/OVBPz0ryW5uv+qynicj8ZgR853PklCQb2BL+hpFpZvz/eBSs5r9AgECm9yTb1+uR9pbFd1C9iwc7NwxpaoeAlKeM8CSU3WcIa1X8LxradV4y9ft8T/C6crbWR+T1ncPw9jNVy5vnX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(41300700001)(2906002)(5660300002)(26005)(86362001)(38100700002)(82960400001)(6666004)(6506007)(6486002)(478600001)(66556008)(6916009)(66476007)(44832011)(316002)(66946007)(4326008)(8676002)(8936002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gr/j61evS9hqcd/JS5vpkKcm2NIWiODP67ZEDvDI5nmGeAJohy5lwLy2bKyd?=
 =?us-ascii?Q?bodCI/VXa+rQ+ET6gDmEqAZZ4/rB+SADtRfmRIdHElUJaooOXyLg5L6e/ZiY?=
 =?us-ascii?Q?x66eeuUq3wZh0vQuy/3tirY6wN5RKBhvjb2NZpRvk8jjobWYnQ0kfX2HzjWB?=
 =?us-ascii?Q?qNUiV4nNqu8RCUwzpiajEXatOc1Vo9C+uAZLH5rpvrkaZSERsjeX0arEOt5W?=
 =?us-ascii?Q?sONnZBVzVIOFPadzWm10ksgzp1bkE1lDwRnCXXMsuVrgvMRuyKHWLOjjsxJV?=
 =?us-ascii?Q?rDXHU5ptpftjHCmICWbAOsN/kAburTIsfxESTva5GloF8NQN57n3EZ3yUqSZ?=
 =?us-ascii?Q?hRaCz7nmQn+IULt58CZN5qyb950SrLyldK5xoi4i2dcVTVUYk8JMV44zSk3S?=
 =?us-ascii?Q?GqktDDveFatiRX8UQK4ZM+EqnsvOf1Oa4+YXyNBTw4WuMFid2Cp4tJVRZP/M?=
 =?us-ascii?Q?1ezCdT66dTjg9aONq2LNDjvTMquZGWj4tIs2R/WDzQ8V5OqU8cbvCn68zspb?=
 =?us-ascii?Q?G0t6xGKbuf1s1tcWcs0Pc/l6wy8ISg5VKbINiz4uKCUNiDbnEE0YiTBs6+8/?=
 =?us-ascii?Q?t664fLOp5WpQXGMB+f9k7KSlVNycK9L4v693jQYg7I58NLHWPzkLIJ4htllU?=
 =?us-ascii?Q?0oe4YxY4caVzh6vchH4jaQUYCsFH8HSrbB4LrwYr7Dg/cyJ0PKJZhbauEtdK?=
 =?us-ascii?Q?omraT/RmT6wV3BYKSn3YyKm8JeI4QEeUQ8qBLVn1Bp2vOLlN8e04wdItvVxl?=
 =?us-ascii?Q?PR/NZBcFi0eAV2IsUiLIb9OJLK+JQWZLH0bDem03Wgh2mnRVjR1vaoGWBJQB?=
 =?us-ascii?Q?3RDdEACkrtdQttyGZ1O2pomiXzayOWYZE/WAcM/rSh0CivbJAPvYXH8bzq8b?=
 =?us-ascii?Q?QLr7vpmvCu/PsEVjOdMtwh1pe0vcvaYS2FBoyjSfcEVsS1hXPuOq4jGRTyy4?=
 =?us-ascii?Q?gEpvy9cjFowCJveY9eBIvubtb72ZNA2psdNJilu3EdBTtgCFtvKUOmZ1akPS?=
 =?us-ascii?Q?Ts5hiQd5TYrsJIz61fdoI6z15CtXMEJg5S5oZMnhNPGFWaUfKDfyt0nKLRd+?=
 =?us-ascii?Q?ufP5hT4BfpbIyN5flW9Hh/R9kES+oy5+U4lxqP1HQgSD58kdkKgKNgR282x0?=
 =?us-ascii?Q?lEeJ394ulEB9OOVimHaGp/+oTDgMwsnQC7FSGHrZy0qIeOkSfm1YIW9zs3U3?=
 =?us-ascii?Q?d9Lt5rSirKSt7f+nBOQ8qQFBIWAzQIcuCQrrqjo0FeknhIxgRm6vqhdrP+eg?=
 =?us-ascii?Q?NygaLNcjzz0fszIMp8FBGyuHprq01yvy+5a8SZkL6jZV57deVQVWgjaoJ/5G?=
 =?us-ascii?Q?M9YLLhqIHbxw/QlJUHPHVlZ5+oPxwlVMiVrFt74b+sQ+NJ8RnDn42HWFjdR5?=
 =?us-ascii?Q?HiF2E7lp/2dODXFYLB0WkOkSs7L5b1IO7TA7358CK1ZDIqHFl9wTtiQa6wvk?=
 =?us-ascii?Q?eB5QAdTf4mhGKSBSAU+cGWDTbwqosoxNeGmOoFqbSDgXH0qXd6eaemQS1NHc?=
 =?us-ascii?Q?TqR8VegQJsEGFOHeZ8Htvt13LvB3NQvA7KEQ8nePyx74poB3XA4bfSNWyJ2p?=
 =?us-ascii?Q?rmBQ49V9/BrtrDTlsN+CnivoOWs0jss7JrzU/h5k4LUzyHl6ld6jLW6XSA1p?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad62cbb7-68d9-430b-5870-08dbd9ac42f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 00:56:48.6429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iar0SOXR7CVojKYoH3I8afw3720OkWNfrJjYdSlW5hmI4IeMhgCTDcgEAAI2r6pF4LHZ4HKtsqKAI60aPeUIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: use variable instead of multiple
 function calls
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

On Mon, Oct 30, 2023 at 09:38:50PM +0200, Dani Liberman wrote:
> Also changed to positive logic which is more readable.
> 
> Signed-off-by: Dani Liberman <dliberman@habana.ai>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 28e84a0bbeb0..2de6c2c05078 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -145,7 +145,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	bool write_locked;
> +	bool write_locked, vm_with_dma_fences;
>  	ktime_t end = 0;
>  	int err = 0;
>  
> @@ -196,8 +196,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	vm_with_dma_fences = !xe_vm_no_dma_fences(vm);
>  retry:
> -	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
> +	if (vm_with_dma_fences && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
>  		write_locked = true;
>  	} else {
> @@ -279,7 +280,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	/* Wait behind munmap style rebinds */
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		err = drm_sched_job_add_resv_dependencies(&job->drm,
>  							  &vm->resv,
>  							  DMA_RESV_USAGE_KERNEL);
> @@ -292,7 +293,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto err_put_job;
>  
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		err = down_read_interruptible(&vm->userptr.notifier_lock);
>  		if (err)
>  			goto err_put_job;
> @@ -307,7 +308,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_no_dma_fences(vm)) {
> +	if (vm_with_dma_fences) {
>  		/* Block userptr invalidations / BO eviction */
>  		dma_resv_add_fence(&vm->resv,
>  				   &job->drm.s_fence->finished,
> @@ -330,14 +331,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	xe_sched_job_push(job);
>  	xe_vm_reactivate_rebind(vm);
>  
> -	if (!err && !xe_vm_no_dma_fences(vm)) {
> +	if (!err && vm_with_dma_fences) {
>  		spin_lock(&xe->ttm.lru_lock);
>  		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
>  err_repin:
> -	if (!xe_vm_no_dma_fences(vm))
> +	if (vm_with_dma_fences)
>  		up_read(&vm->userptr.notifier_lock);
>  err_put_job:
>  	if (err)
> -- 
> 2.34.1
> 
