Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB88C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 16:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D113610E023;
	Tue, 12 Dec 2023 16:15:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E810210E1DB
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702397754; x=1733933754;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4fqs2HI2KZrYlS24uTp/7quAI2VvqEc8YdqLuBU9B44=;
 b=ChOUzLElIzC8tCmJxdvxLBTI59jkMD98ar+UOo/ofkTk2+/vqqmL93fG
 XlEMPP5BbrybeQnNYWRLOVonED17zblRhn06rdDp3iiSpFF1tteagRADM
 rfg4xqAm4ZZv+AbPMVpVJZBchBtDtEFzTTkWzmZyoeHcV9eMdju17YgUn
 /K3YF6e2EdL/ha/5YcL84cJIg2+SxQuUlm26KWtqSzAlJvayQyVphbZnm
 XFF9KjvShb6yOq9zbVnIJdLpgl+2DyxrxAQ+uVyB1jzNzMF6VlcB88vjg
 ewq2+CtTuPbHog5QpXCnPHvrj3wC5wjkpO22vf8ibGPU05SBuXRWOW2QM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397616965"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="397616965"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 08:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839499714"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="839499714"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 08:15:54 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 08:15:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 08:15:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 08:15:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 08:15:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcWluzzoefjmD+NThNaI+yIWnseDtGvbE7B6R0DTK5WeL98ne4jqRVGO7ullx+oBZdf3BOrFnuiS6uV2mFuWHKJgKbj/xaWVH6XCk+R4bP37UG+v3gO0HG0noq394uWvv5/9wQ+aGycAkvKUtYl4fWc9LWMYqTBIxoy7MssnNeJ6JnWX9mSOc7vAvg53AJvMcC7DSq0BGxtuE+nkrjLIix2Ce74YUwwnZgqAPgZFNdS7Md5aQx1IXtzXkc2uyaFfVIrJxFJZy/uxYOKWQMlpaLlw//yG6tgL2PpY4hzJZs9WJjf68XA3MdUTqIL9GpS1czFYwsme/NASiCP+cGP+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xd33WusdZnEL8XIqAB0YCZqcNnci+9Pd7xNdhSBiI8s=;
 b=DoGwCqWP3qjhQrTulE1cJMVaDqDeOjxgrM205QfcFdLX74cZ6iQh0zHoIpEjtF8RnjQKDRfulrigKK1QrA04MLKW7Mfd1UwtIsgHyNfqFQyxsKYlelM6DUsaeg4tgIizPNZkl3xE01p5E4Pz5XTNEvo0KtVWIm8cj7/Vzkztwn5Q6obGPtK0CLYYRvi4v9Hj6aQxJBfCsjpT80g4EayqnlPPahjd4W3WoKVEAjjb/YFp36FczDZe1ojuDBOaGvoM6NQmx0FUMzUG9FN7vvNi7jKUmWNFdIsfI20Q18wemDP2bLvMUNdvpTUN3TdCa+w6DEav0Uipqw5yjOoUpzEH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Tue, 12 Dec 2023 16:15:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 16:15:50 +0000
Date: Tue, 12 Dec 2023 16:16:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Use DRM GPUVM helpers for external- and
 evicted objects
Message-ID: <ZXiHQFA8Uopq7y3y@DUT025-TGLU.fm.intel.com>
References: <20231212100144.6833-1-thomas.hellstrom@linux.intel.com>
 <20231212100144.6833-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212100144.6833-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0150.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e12e6b-ec26-4689-9bc1-08dbfb2d9b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wo5gQfQCVPyreV9xKA4Blx3uGYal/ZPRtwVnXg7JiU77EPTerC3i6OqlIBaXWy1Jg7W8IeE3ZSdR1moaOPuuS7K/2W8Ui4h8HNCUbmWSOzXnTNp6vbU9s7n3DmVG67ps9Q0k0tcyIH4gpc2Tx7ApiNTL0XFdBHGO2ueE1doPNfM0jnuxPhOe/o8incKoBE9AExA6mO1LtsEjM8uMSps+NBKqAZ6RKyT/L4ARal2HgFjsz9TpPdlmQHF1ZZgujk77D66wHzsszwCOPNS3I4w6Yh/cm3dkrNmJsvCO+0RabHsT1dSVZ8aQR2hMVQKHjt9GNo95cAuuPW5mFQb2GWkWLqz5CNL7AS7ttu9aibIF/dI8xXCGJ86QOBd74amUlaWC4yZSo38uw+TNWqhkBUkcKyf2YJITGpr6jGDKWrGTUt/rLiBSM9o0pDk1fbEdaZpBgQKLbri0L+SptnM1M0CRgkUe/GntBPuWREpjw1H2LmN2F3kru2nu8mY2mYAUfIti16JDMSB9zPm+dCAVfKgDzYdglpTt6JK8J5oSv9sA+VsXxS3oME373c5bTBuKNnwQgItQieiGk4jHhAIUYfq1bwp4YSJOcHjd27zIGNAHDnkmm7jfzxEa0C+US6aijP8jNQ1U9T2R65AZfNzG0BqOsDoNx++VHRwqXCuHVN6J5P4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(39860400002)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(86362001)(30864003)(316002)(82960400001)(66556008)(66476007)(41300700001)(26005)(83380400001)(6486002)(6506007)(6512007)(66574015)(6666004)(2906002)(478600001)(6916009)(66946007)(8936002)(4326008)(44832011)(8676002)(5660300002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t93IuSTCcOgMptEaz8Xr/mmvTiKuLHhe2QOkmdM8zi9y+x+0wIjCbPvtxA?=
 =?iso-8859-1?Q?YGrOgkLieNmi9vTm3+cYsS0TAodRxEcmSQhP9RTvoiWfa5ayJiw6/xhVpj?=
 =?iso-8859-1?Q?75DKkwPmzJSNu/CV932wSG2OrToqcTaKXgD6XQ2CmC2VQgB1+h3mvvkB5f?=
 =?iso-8859-1?Q?pB54B9grH7cgs9u88UHG0V6j3pU3H4Gkt5zUZS960iGzkASxz5+S4+tiMZ?=
 =?iso-8859-1?Q?gEL7L/bXmvlVyCFTduCIVQt4EFglxfdRb4wt64xQseXEtpHqH+lGt6Uaov?=
 =?iso-8859-1?Q?HPj3/puUFDFvKl1PpKYnnLx/jDOF80dSxV1UPBbYvFeM2v0inLH7SsjKsy?=
 =?iso-8859-1?Q?+p6UFhO6E3QozWRboBDeDMbxl/O8echsMOe70CvaIvrlrcT4sVoW/UhRux?=
 =?iso-8859-1?Q?Fj0qWHH4i80/AK/tUQ9OGQGCTOPpW8QNKj/s5YbNdZNg+zuVDUzHQ5cxgd?=
 =?iso-8859-1?Q?rALPXLd5xN48tWoszyoAGIZjo0kOXJMkDjxhjVkCqutmZWu2j28pq0Mb+W?=
 =?iso-8859-1?Q?kEDJLt91DTtar4bEtLGLS3fGY2G90XOWvDDVUuZPumKNq0788qckMfUX01?=
 =?iso-8859-1?Q?b8mIxcvHmZyQMpCG9QX84f8tBh89XvIYJBUN0JHKDJw4CDol1/SqmI9jQA?=
 =?iso-8859-1?Q?s3HmStQm5+Z1hjCZOHGQ7IoctxBJVgFN3N8DgNBC6Fa0GURkikj4lZa1O7?=
 =?iso-8859-1?Q?u2zIB7Kh+uDsp/XoqG5CVrmujVbCRL36cCNbyd5kxiZHnrAtM2GDaIMxpj?=
 =?iso-8859-1?Q?Y4bmzdBxEZtfphGF280PH1CphJ3tVvMvJr6KRZa9riWbaageMaIDYYp8fq?=
 =?iso-8859-1?Q?iTArnVUVQNOlCZ8C8571WklwTTPQ/5VfqrtjuSW+Jb7SWwNpkPFBPaXMCY?=
 =?iso-8859-1?Q?m+pM0fO9+aAZ9DlgXaynpXHBTK6JJA2VbwbvhzqIL7P/O9Tw8dsIoTRdVT?=
 =?iso-8859-1?Q?Jiigp6kvGWr83S4stIae5aiGw4MY5gzFIqqTifPfdWUQCY3IYO92E8m2Bo?=
 =?iso-8859-1?Q?wN5uWAucY3lLMNIDwjZcUOr+22l7zc2DJCQw1LWlvfUMAofobDsTdWhdHl?=
 =?iso-8859-1?Q?aGMpPKAb/FkWiw/gM85VHp4enFHCuWsBvYkVo7FmKceCqWk+5TZoLYrf4I?=
 =?iso-8859-1?Q?UclQYbI9ryGaEXfSh5+cg93+6Y+a+iyN4HFmejC6sdm1dj4+kszUXh+zeS?=
 =?iso-8859-1?Q?wOXXhW0YkLxUrx/FKBPGdTYydE42p/FEEcuvaEiFigZCfIMIQQukNnDZ6O?=
 =?iso-8859-1?Q?CricPE+F8wNpbEHuWzuk7sn00vvidZXY49iNUJg4bA+LSdOBXVCVraz8JQ?=
 =?iso-8859-1?Q?VOyAzHABmojYZdCMvPETXdNthO/5HbGrYWbgbTvBylgw9FWHP53xNbHmBx?=
 =?iso-8859-1?Q?DnOgFfOaEzJNnsEtryzDrbqszDqINLMQBvE5N7wKuaJ5pSrBqLDKfEC0uq?=
 =?iso-8859-1?Q?jtX/tDYhEEzB/fs1fieZ8UPtiK1Mwe+txk59Myqtn//acRfLtWQLsKak7t?=
 =?iso-8859-1?Q?x4tI306zHSS1zV8Sep4nrnhXyXJvQFCOCc9AJ670yfXe9Ebb2ApTiSVcHX?=
 =?iso-8859-1?Q?QwRgT/USIJLI3vsuUzGSO0La1jUZTTLEnA/b52Ps4eZZoyCoRgP8rV0t+g?=
 =?iso-8859-1?Q?N4GBJ6JcRWGXQJI9Dp5MZfMKNpoMHO8AtJRfrrYFI16xtL6NXp1gDUow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e12e6b-ec26-4689-9bc1-08dbfb2d9b06
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 16:15:49.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXFN9W/of3xgDO36Oo3NH+wzOu+eP9jHebzHQsioCwqIzA52XaVHA6vXjLeFOybCq2zUqj7lZjCpvJm9H0tG7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 11:01:43AM +0100, Thomas Hellström wrote:
> Adapt to the DRM_GPUVM helpers moving removing a lot of complicated
> driver-specific code.
> 
> For now this uses fine-grained locking for the evict list and external
> object list, which may incur a slight performance penalty in some
> situations.
> 
> v2:
> - Don't lock all bos and validate on LR exec submissions (Matthew Brost)
> - Add some kerneldoc
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c       |  63 +++----
>  drivers/gpu/drm/xe/xe_exec.c     |  74 ++------
>  drivers/gpu/drm/xe/xe_vm.c       | 292 +++++++------------------------
>  drivers/gpu/drm/xe/xe_vm.h       |  19 +-
>  drivers/gpu/drm/xe/xe_vm_types.h |  67 ++-----
>  5 files changed, 129 insertions(+), 386 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7e25c8b7a01a..bd79b322e6ac 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -468,9 +468,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> -	struct drm_gpuva *gpuva;
>  	struct drm_gem_object *obj = &bo->ttm.base;
>  	struct drm_gpuvm_bo *vm_bo;
> +	bool idle = false;
>  	int ret = 0;
>  
>  	dma_resv_assert_held(bo->ttm.base.resv);
> @@ -484,14 +484,15 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	}
>  
>  	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> -		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> -			struct xe_vma *vma = gpuva_to_vma(gpuva);
> -			struct xe_vm *vm = xe_vma_vm(vma);
> +		struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
> +		struct drm_gpuva *gpuva;
>  
> -			trace_xe_vma_evict(vma);
> +		if (!xe_vm_in_fault_mode(vm)) {
> +			drm_gpuvm_bo_evict(vm_bo, true);
> +			continue;
> +		}
>  
> -		if (xe_vm_in_fault_mode(vm)) {
> -			/* Wait for pending binds / unbinds. */
> +		if (!idle) {
>  			long timeout;
>  
>  			if (ctx->no_wait_gpu &&
> @@ -503,45 +504,21 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  							DMA_RESV_USAGE_BOOKKEEP,
>  							ctx->interruptible,
>  							MAX_SCHEDULE_TIMEOUT);
> -			if (timeout > 0) {
> -				ret = xe_vm_invalidate_vma(vma);
> -				XE_WARN_ON(ret);
> -			} else if (!timeout) {
> -				ret = -ETIME;
> -			} else {
> -				ret = timeout;
> -			}
> -
> -		} else {
> -			bool vm_resv_locked = false;
> +			if (!timeout)
> +				return -ETIME;
> +			if (timeout < 0)
> +				return timeout;
>  
> -			/*
> -			 * We need to put the vma on the vm's rebind_list,
> -			 * but need the vm resv to do so. If we can't verify
> -			 * that we indeed have it locked, put the vma an the
> -			 * vm's notifier.rebind_list instead and scoop later.
> -			 */
> -			if (dma_resv_trylock(xe_vm_resv(vm)))
> -				vm_resv_locked = true;
> -			else if (ctx->resv != xe_vm_resv(vm)) {
> -				spin_lock(&vm->notifier.list_lock);
> -				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
> -					list_move_tail(&vma->notifier.rebind_link,
> -						       &vm->notifier.rebind_list);
> -				spin_unlock(&vm->notifier.list_lock);
> -				continue;
> -			}
> +			idle = true;
> +		}
>  
> -			xe_vm_assert_held(vm);
> -			if (vma->tile_present &&
> -			    !(vma->gpuva.flags & XE_VMA_DESTROYED) &&
> -			    list_empty(&vma->combined_links.rebind))
> -				list_add_tail(&vma->combined_links.rebind,
> -					      &vm->rebind_list);
> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>  
> -			if (vm_resv_locked)
> -				dma_resv_unlock(xe_vm_resv(vm));
> -		}
> +			trace_xe_vma_evict(vma);
> +			ret = xe_vm_invalidate_vma(vma);
> +			if (XE_WARN_ON(ret))
> +				return ret;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 5ec37df33afe..15ab1a927613 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -94,40 +94,9 @@
>   *	Unlock all
>   */
>  
> -static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
> +static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
>  {
> -	struct xe_vma *vma;
> -	LIST_HEAD(dups);
> -	int err = 0;
> -
> -	if (xe_vm_in_lr_mode(vm))
> -		return 0;
> -
> -	/*
> -	 * 1 fence for job from exec plus a fence for each tile from a possible
> -	 * rebind
> -	 */
> -	err = xe_vm_lock_dma_resv(vm, exec, 1 + vm->xe->info.tile_count, true);
> -	if (err)
> -		return err;
> -
> -	/*
> -	 * Validate BOs that have been evicted (i.e. make sure the
> -	 * BOs have valid placements possibly moving an evicted BO back
> -	 * to a location where the GPU can access it).
> -	 */
> -	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> -		xe_assert(vm->xe, !xe_vma_is_null(vma));
> -
> -		if (xe_vma_is_userptr(vma))
> -			continue;
> -
> -		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> -		if (err)
> -			break;
> -	}
> -
> -	return err;
> +	return drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
>  }
>  
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -140,7 +109,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	struct xe_sync_entry *syncs = NULL;
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_exec exec;
> +	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
> +	struct drm_exec *exec = &vm_exec.exec;
>  	u32 i, num_syncs = 0;
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
> @@ -216,16 +186,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> -	drm_exec_until_all_locked(&exec) {
> -		err = xe_exec_begin(&exec, vm);
> -		drm_exec_retry_on_contention(&exec);
> -		if (err && xe_vm_validate_should_retry(&exec, err, &end)) {
> -			err = -EAGAIN;
> +	vm_exec.vm = &vm->gpuvm;
> +	vm_exec.num_fences = 1 + vm->xe->info.tile_count;
> +	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +	if (xe_vm_in_lr_mode(vm)) {
> +		drm_exec_init(exec, vm_exec.flags);
> +	} else {
> +		err = drm_gpuvm_exec_lock(&vm_exec);
> +		if (err) {
> +			if (xe_vm_validate_should_retry(exec, err, &end))
> +				err = -EAGAIN;
>  			goto err_unlock_list;
>  		}
> -		if (err)
> -			goto err_exec;
>  	}
>  
>  	if (xe_vm_is_closed_or_banned(q->vm)) {
> @@ -307,19 +279,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	 * the job and let the DRM scheduler / backend clean up the job.
>  	 */
>  	xe_sched_job_arm(job);
> -	if (!xe_vm_in_lr_mode(vm)) {
> -		/* Block userptr invalidations / BO eviction */
> -		dma_resv_add_fence(xe_vm_resv(vm),
> -				   &job->drm.s_fence->finished,
> -				   DMA_RESV_USAGE_BOOKKEEP);
> -
> -		/*
> -		 * Make implicit sync work across drivers, assuming all external
> -		 * BOs are written as we don't pass in a read / write list.
> -		 */
> -		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
> -					DMA_RESV_USAGE_WRITE);
> -	}
> +	if (!xe_vm_in_lr_mode(vm))
> +		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
> +					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
>  
>  	for (i = 0; i < num_syncs; i++)
>  		xe_sync_entry_signal(&syncs[i], job,
> @@ -343,7 +305,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_exec:
> -	drm_exec_fini(&exec);
> +	drm_exec_fini(exec);
>  err_unlock_list:
>  	if (write_locked)
>  		up_write(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e190469ec03a..7a3b680d01a3 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -299,26 +299,8 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>  	return err;
>  }
>  
> -/**
> - * xe_vm_fence_all_extobjs() - Add a fence to vm's external objects' resv
> - * @vm: The vm.
> - * @fence: The fence to add.
> - * @usage: The resv usage for the fence.
> - *
> - * Loops over all of the vm's external object bindings and adds a @fence
> - * with the given @usage to all of the external object's reservation
> - * objects.
> - */
> -void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
> -			     enum dma_resv_usage usage)
> -{
> -	struct xe_vma *vma;
> -
> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
> -		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
> -}
> -
> -static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> +static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
> +						struct drm_exec *exec)
>  {
>  	struct xe_exec_queue *q;
>  
> @@ -328,16 +310,19 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
>  		q->ops->resume(q);
>  
> -		dma_resv_add_fence(xe_vm_resv(vm), q->compute.pfence,
> -				   DMA_RESV_USAGE_BOOKKEEP);
> -		xe_vm_fence_all_extobjs(vm, q->compute.pfence,
> -					DMA_RESV_USAGE_BOOKKEEP);
> +		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->compute.pfence,
> +					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>  	}
>  }
>  
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
> -	struct drm_exec exec;
> +	struct drm_gpuvm_exec vm_exec = {
> +		.vm = &vm->gpuvm,
> +		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT,
> +		.num_fences = 1,
> +	};
> +	struct drm_exec *exec = &vm_exec.exec;
>  	struct dma_fence *pfence;
>  	int err;
>  	bool wait;
> @@ -345,13 +330,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  
>  	down_write(&vm->lock);
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> -	drm_exec_until_all_locked(&exec) {
> -		err = xe_vm_lock_dma_resv(vm, &exec, 1, true);
> -		drm_exec_retry_on_contention(&exec);
> -		if (err)
> -			goto out_unlock;
> -	}
> +	err = drm_gpuvm_exec_lock(&vm_exec);
> +	if (err)
> +		return err;
>  
>  	pfence = xe_preempt_fence_create(q, q->compute.context,
>  					 ++q->compute.seqno);
> @@ -366,10 +347,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	down_read(&vm->userptr.notifier_lock);
>  
> -	dma_resv_add_fence(xe_vm_resv(vm), pfence,
> -			   DMA_RESV_USAGE_BOOKKEEP);
> -
> -	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
> +	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
> +				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>  
>  	/*
>  	 * Check to see if a preemption on VM is in flight or userptr
> @@ -383,7 +362,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	drm_exec_fini(&exec);
> +	drm_exec_fini(exec);
>  	up_write(&vm->lock);
>  
>  	return err;
> @@ -429,55 +408,6 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>  		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>  }
>  
> -/**
> - * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
> - * objects of the vm's external buffer objects.
> - * @vm: The vm.
> - * @exec: Pointer to a struct drm_exec locking context.
> - * @num_shared: Number of dma-fence slots to reserve in the locked objects.
> - * @lock_vm: Lock also the vm's dma_resv.
> - *
> - * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list.
> - *
> - * Return: 0 on success, Negative error code on error. In particular if
> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned.
> - */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> -			unsigned int num_shared, bool lock_vm)
> -{
> -	struct xe_vma *vma, *next;
> -	int err = 0;
> -
> -	lockdep_assert_held(&vm->lock);
> -
> -	if (lock_vm) {
> -		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
> -		if (err)
> -			return err;
> -	}
> -
> -	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> -		err = drm_exec_prepare_obj(exec, &xe_vma_bo(vma)->ttm.base, num_shared);
> -		if (err)
> -			return err;
> -	}
> -
> -	spin_lock(&vm->notifier.list_lock);
> -	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> -				 notifier.rebind_link) {
> -		xe_bo_assert_held(xe_vma_bo(vma));
> -
> -		list_del_init(&vma->notifier.rebind_link);
> -		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> -			list_move_tail(&vma->combined_links.rebind,
> -				       &vm->rebind_list);
> -	}
> -	spin_unlock(&vm->notifier.list_lock);
> -
> -	return 0;
> -}
> -
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>  
>  static void xe_vm_kill(struct xe_vm *vm)
> @@ -526,30 +456,39 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
>  	if (!ktime_before(cur, *end))
>  		return false;
>  
> -	/*
> -	 * We would like to keep the ticket here with
> -	 * drm_exec_unlock_all(), but WW mutex asserts currently
> -	 * stop us from that. In any case this function could go away
> -	 * with proper TTM -EDEADLK handling.
> -	 */
> -	drm_exec_fini(exec);
> -
>  	msleep(20);
>  	return true;
>  }
>  
> +static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
> +{
> +	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
> +	struct drm_gpuva *gpuva;
> +	int ret;
> +
> +	lockdep_assert_held(&vm->lock);
> +	drm_gpuvm_bo_for_each_va(gpuva, vm_bo)
> +		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
> +			       &vm->rebind_list);
> +
> +	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
> +	if (ret)
> +		return ret;
> +
> +	vm_bo->evicted = false;
> +	return 0;
> +}
> +
>  static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  				 bool *done)
>  {
> -	struct xe_vma *vma;
>  	int err;
>  
>  	/*
>  	 * 1 fence for each preempt fence plus a fence for each tile from a
>  	 * possible rebind
>  	 */
> -	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
> -				   vm->preempt.num_exec_queues +
> +	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
>  				   vm->xe->info.tile_count);
>  	if (err)
>  		return err;
> @@ -565,7 +504,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  		return 0;
>  	}
>  
> -	err = xe_vm_lock_dma_resv(vm, exec, vm->preempt.num_exec_queues, false);
> +	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
>  	if (err)
>  		return err;
>  
> @@ -573,17 +512,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  	if (err)
>  		return err;
>  
> -	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> -		if (xe_vma_has_no_bo(vma) ||
> -		    vma->gpuva.flags & XE_VMA_DESTROYED)
> -			continue;
> -
> -		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> -		if (err)
> -			break;
> -	}
> -
> -	return err;
> +	return drm_gpuvm_validate(&vm->gpuvm, exec);
>  }
>  
>  static void preempt_rebind_work_func(struct work_struct *w)
> @@ -623,12 +552,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  
>  		err = xe_preempt_work_begin(&exec, vm, &done);
>  		drm_exec_retry_on_contention(&exec);
> -		if (err && xe_vm_validate_should_retry(&exec, err, &end)) {
> -			err = -EAGAIN;
> +		if (err || done) {
> +			drm_exec_fini(&exec);
> +			if (err && xe_vm_validate_should_retry(&exec, err, &end))
> +				err = -EAGAIN;
> +
>  			goto out_unlock_outer;
>  		}
> -		if (err || done)
> -			goto out_unlock;
>  	}
>  
>  	err = alloc_preempt_fences(vm, &preempt_fences, &fence_count);
> @@ -675,7 +605,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  
>  	/* Point of no return. */
>  	arm_preempt_fences(vm, &preempt_fences);
> -	resume_and_reinstall_preempt_fences(vm);
> +	resume_and_reinstall_preempt_fences(vm, &exec);
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> @@ -780,9 +710,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
>  				 userptr.invalidate_link) {
>  		list_del_init(&vma->userptr.invalidate_link);
> -		if (list_empty(&vma->combined_links.userptr))
> -			list_move_tail(&vma->combined_links.userptr,
> -				       &vm->userptr.repin_list);
> +		list_move_tail(&vma->combined_links.userptr,
> +			       &vm->userptr.repin_list);
>  	}
>  	spin_unlock(&vm->userptr.invalidated_lock);
>  
> @@ -791,27 +720,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>  				 combined_links.userptr) {
>  		err = xe_vma_userptr_pin_pages(vma);
>  		if (err < 0)
> -			goto out_err;
> +			return err;
>  
> -		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
> +		list_move_tail(&vma->combined_links.userptr, &vm->rebind_list);
>  	}
>  
> -	/* Take lock and move to rebind_list for rebinding. */
> -	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
> -	if (err)
> -		goto out_err;
> -
> -	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> -		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
> -
> -	dma_resv_unlock(xe_vm_resv(vm));
> -
>  	return 0;
> -
> -out_err:
> -	list_splice_tail(&tmp_evict, &vm->userptr.repin_list);
> -
> -	return err;
>  }
>  
>  /**
> @@ -890,8 +804,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	}
>  
>  	INIT_LIST_HEAD(&vma->combined_links.rebind);
> -	INIT_LIST_HEAD(&vma->notifier.rebind_link);
> -	INIT_LIST_HEAD(&vma->extobj.link);
>  
>  	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
>  	vma->gpuva.vm = &vm->gpuvm;
> @@ -921,6 +833,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  			return ERR_CAST(vm_bo);
>  		}
>  
> +		drm_gpuvm_bo_extobj_add(vm_bo);
>  		drm_gem_object_get(&bo->ttm.base);
>  		vma->gpuva.gem.obj = &bo->ttm.base;
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
> @@ -953,16 +866,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	return vma;
>  }
>  
> -static bool vm_remove_extobj(struct xe_vma *vma)
> -{
> -	if (!list_empty(&vma->extobj.link)) {
> -		xe_vma_vm(vma)->extobj.entries--;
> -		list_del_init(&vma->extobj.link);
> -		return true;
> -	}
> -	return false;
> -}
> -
>  static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -1003,60 +906,6 @@ static void vma_destroy_work_func(struct work_struct *w)
>  	xe_vma_destroy_late(vma);
>  }
>  
> -static struct xe_vma *
> -bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
> -			    struct xe_vma *ignore)
> -{
> -	struct drm_gpuvm_bo *vm_bo;
> -	struct drm_gpuva *va;
> -	struct drm_gem_object *obj = &bo->ttm.base;
> -
> -	xe_bo_assert_held(bo);
> -
> -	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> -		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> -			struct xe_vma *vma = gpuva_to_vma(va);
> -
> -			if (vma != ignore && xe_vma_vm(vma) == vm)
> -				return vma;
> -		}
> -	}
> -
> -	return NULL;
> -}
> -
> -static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> -				 struct xe_vma *ignore)
> -{
> -	bool ret;
> -
> -	xe_bo_lock(bo, false);
> -	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> -	xe_bo_unlock(bo);
> -
> -	return ret;
> -}
> -
> -static void __vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> -{
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	list_add(&vma->extobj.link, &vm->extobj.list);
> -	vm->extobj.entries++;
> -}
> -
> -static void vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> -{
> -	struct xe_bo *bo = xe_vma_bo(vma);
> -
> -	lockdep_assert_held_write(&vm->lock);
> -
> -	if (bo_has_vm_references(bo, vm, vma))
> -		return;
> -
> -	__vm_insert_extobj(vm, vma);
> -}
> -
>  static void vma_destroy_cb(struct dma_fence *fence,
>  			   struct dma_fence_cb *cb)
>  {
> @@ -1082,20 +931,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	} else if (!xe_vma_is_null(vma)) {
>  		xe_bo_assert_held(xe_vma_bo(vma));
>  
> -		spin_lock(&vm->notifier.list_lock);
> -		list_del(&vma->notifier.rebind_link);
> -		spin_unlock(&vm->notifier.list_lock);
> -
>  		drm_gpuva_unlink(&vma->gpuva);
> -
> -		if (!xe_vma_bo(vma)->vm && vm_remove_extobj(vma)) {
> -			struct xe_vma *other;
> -
> -			other = bo_has_vm_references_locked(xe_vma_bo(vma), vm, NULL);
> -
> -			if (other)
> -				__vm_insert_extobj(vm, other);
> -		}
>  	}
>  
>  	xe_vm_assert_held(vm);
> @@ -1213,6 +1049,7 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm);
>  
>  static struct drm_gpuvm_ops gpuvm_ops = {
>  	.op_alloc = xe_vm_op_alloc,
> +	.vm_bo_validate = xe_gpuvm_validate,
>  	.vm_free = xe_vm_free,
>  };
>  
> @@ -1426,9 +1263,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> -	INIT_LIST_HEAD(&vm->notifier.rebind_list);
> -	spin_lock_init(&vm->notifier.list_lock);
> -
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>  
>  	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> @@ -1437,8 +1271,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_init(&vm->rftree[id]);
>  
> -	INIT_LIST_HEAD(&vm->extobj.list);
> -
>  	vm->pt_ops = &xelp_pt_ops;
>  
>  	if (!(flags & XE_VM_FLAG_MIGRATION))
> @@ -1647,7 +1479,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> -	xe_assert(xe, list_empty(&vm->extobj.list));
>  	up_write(&vm->lock);
>  
>  	mutex_lock(&xe->usm.lock);
> @@ -2289,22 +2120,36 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			      bool read_only, bool is_null, u16 pat_index)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> +	struct drm_exec exec;
>  	struct xe_vma *vma;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
>  	if (bo) {
> -		err = xe_bo_lock(bo, true);
> -		if (err)
> -			return ERR_PTR(err);
> +		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +		drm_exec_until_all_locked(&exec) {
> +			err = 0;
> +			if (!bo->vm) {
> +				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
> +				drm_exec_retry_on_contention(&exec);
> +			}
> +			if (!err) {
> +				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +				drm_exec_retry_on_contention(&exec);
> +			}
> +			if (err) {
> +				drm_exec_fini(&exec);
> +				return ERR_PTR(err);
> +			}
> +		}
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
>  			    op->va.range - 1, read_only, is_null,
>  			    pat_index);
>  	if (bo)
> -		xe_bo_unlock(bo);
> +		drm_exec_fini(&exec);
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		err = xe_vma_userptr_pin_pages(vma);
> @@ -2314,7 +2159,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			return ERR_PTR(err);
>  		}
>  	} else if (!xe_vma_has_no_bo(vma) && !bo->vm) {
> -		vm_insert_extobj(vm, vma);
>  		err = add_preempt_fences(vm, bo);
>  		if (err) {
>  			prep_vma_destroy(vm, vma, false);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index a1907544cc4f..cf2f96e8c1ab 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -74,9 +74,20 @@ static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>  	return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>  }
>  
> +/**
> + * gpuvm_to_vm() - Return the embedding xe_vm from a struct drm_gpuvm pointer
> + * @gpuvm: The struct drm_gpuvm pointer
> + *
> + * Return: Pointer to the embedding struct xe_vm.
> + */
> +static inline struct xe_vm *gpuvm_to_vm(struct drm_gpuvm *gpuvm)
> +{
> +	return container_of(gpuvm, struct xe_vm, gpuvm);
> +}
> +
>  static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
>  {
> -	return container_of(gpuva->vm, struct xe_vm, gpuvm);
> +	return gpuvm_to_vm(gpuva->vm);
>  }
>  
>  static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
> @@ -219,12 +230,6 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
>  bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>  
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> -			unsigned int num_shared, bool lock_vm);
> -
> -void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
> -			     enum dma_resv_usage usage);
> -
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
>  int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 15471025a44f..2e023596cb15 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -62,26 +62,17 @@ struct xe_vma {
>  	/** @gpuva: Base GPUVA object */
>  	struct drm_gpuva gpuva;
>  
> -	/** @combined_links: links into lists which are mutually exclusive */
> +	/**
> +	 * @combined_links: links into lists which are mutually exclusive.
> +	 * Locking: vm lock in write mode OR vm lock in read mode and the vm's
> +	 * resv.
> +	 */
>  	union {
> -		/**
> -		 * @userptr: link into VM repin list if userptr. Protected by
> -		 * vm->lock in write mode.
> -		 */
> +		/** @userptr: link into VM repin list if userptr. */
>  		struct list_head userptr;
> -		/**
> -		 * @rebind: link into VM if this VMA needs rebinding, and
> -		 * if it's a bo (not userptr) needs validation after a possible
> -		 * eviction. Protected by the vm's resv lock and typically
> -		 * vm->lock is also held in write mode. The only place where
> -		 * vm->lock isn't held is the BO eviction path which has
> -		 * mutually exclusive execution with userptr.
> -		 */
> +		/** @rebind: link into VM if this VMA needs rebinding. */
>  		struct list_head rebind;
> -		/**
> -		 * @destroy: link to contested list when VM is being closed.
> -		 * Protected by vm->lock in write mode and vm's resv lock.
> -		 */
> +		/** @destroy: link to contested list when VM is being closed. */
>  		struct list_head destroy;
>  	} combined_links;
>  
> @@ -115,18 +106,6 @@ struct xe_vma {
>  	 */
>  	u16 pat_index;
>  
> -	struct {
> -		struct list_head rebind_link;
> -	} notifier;
> -
> -	struct {
> -		/**
> -		 * @extobj.link: Link into vm's external object list.
> -		 * protected by the vm lock.
> -		 */
> -		struct list_head link;
> -	} extobj;
> -
>  	/**
>  	 * @userptr: user pointer state, only allocated for VMAs that are
>  	 * user pointers
> @@ -180,9 +159,9 @@ struct xe_vm {
>  	struct rw_semaphore lock;
>  
>  	/**
> -	 * @rebind_list: list of VMAs that need rebinding, and if they are
> -	 * bos (not userptr), need validation after a possible eviction. The
> -	 * list is protected by @resv.
> +	 * @rebind_list: list of VMAs that need rebinding. Protected by the
> +	 * vm->lock in write mode, OR (the vm->lock in read mode and the
> +	 * vm resv).
>  	 */
>  	struct list_head rebind_list;
>  
> @@ -202,14 +181,6 @@ struct xe_vm {
>  	 */
>  	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
>  
> -	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
> -	struct {
> -		/** @enties: number of external BOs attached this VM */
> -		u32 entries;
> -		/** @list: list of vmas with external bos attached */
> -		struct list_head list;
> -	} extobj;
> -
>  	/** @async_ops: async VM operations (bind / unbinds) */
>  	struct {
>  		/** @list: list of pending async VM ops */
> @@ -299,22 +270,6 @@ struct xe_vm {
>  		struct xe_vma *last_fault_vma;
>  	} usm;
>  
> -	/**
> -	 * @notifier: Lists and locks for temporary usage within notifiers where
> -	 * we either can't grab the vm lock or the vm resv.
> -	 */
> -	struct {
> -		/** @notifier.list_lock: lock protecting @rebind_list */
> -		spinlock_t list_lock;
> -		/**
> -		 * @notifier.rebind_list: list of vmas that we want to put on the
> -		 * main @rebind_list. This list is protected for writing by both
> -		 * notifier.list_lock, and the resv of the bo the vma points to,
> -		 * and for reading by the notifier.list_lock only.
> -		 */
> -		struct list_head rebind_list;
> -	} notifier;
> -
>  	/** @error_capture: allow to track errors */
>  	struct {
>  		/** @capture_once: capture only one error per VM */
> -- 
> 2.42.0
> 
