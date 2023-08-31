Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E84C83F35
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 17:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548F210E6AB;
	Thu, 31 Aug 2023 17:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB4E10E199
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 17:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693504366; x=1725040366;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wNMFWw3j3xvTrW8Z7U4ebeMHZHm/MeQfS7dQgYH/KDY=;
 b=U329BMv2ZYg1bdNaX2v4qY+lYnj8zaiz5c/eC5i7Q13aH8tU2bGUttuN
 7LcfMCZLZX1J0lohXsmSztatlcpbWfcIoBA+jGFS72J7DMu0X9EGtkJlj
 SYCFsmTM3zRQzDf8KTn49SCKRFWshIghhT4IPe0GkVverzhBqn0aAzOGb
 VVtwvLAyTt41SWYmVU6UWexs4DxdAdbqq+OgAxMTPk5sNIJRLY+ey2sBe
 mgyg9RGStLGMV+wysxxGdRwv7af0JXutf3cCVFLyR+LJ5cHJDQ29RMRZl
 K79ewfYluLnqzyZExaiU9LHvV532ZWBx0EOSHCQVhPwGGANBGGnw/BSWL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361039713"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="361039713"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="716448812"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="716448812"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:52:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:52:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:52:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:52:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLroau4bI2aiamkKfpUiiWuiQScp+q7aJ4QQ0xEoUL5dvUWblcYaTOB26Z2eNmCYOMkWXfEILPrOJf5X2qhOAQrcZZsOjTqn3SmIsgaJ5DR+DpeOjAEEyFVy2ye91y40ea0gb0FQ2YETpENObBnYL9AquTH+c5t6Hf0Xr1zqKTaXlhMg4iWB3pSumvqN8Mz5Zh1/t8qyMWanCUT3g1iUSoQCBBvu6HEdESsjw5XoLBrs2dylF5BZeguRJ9oZfGRVecG6XqBMwYEuuLc756Dft4zJESvaAG+h5nn+WpspMLlywrUdt2PGdnQptLOeOzEJ3+WsEnH9XKt2PqS2OTAnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu8qtOTvC7vZwWZxntubrmiPs8UDRW1L4Zo4alK1s5U=;
 b=YFYi5Ke0oCZxs7Eb40/5/1uTmbbfkW+tOyK3zhduIWXNUA7P9FURthNKbgMKPZgwXblzDAo4OHFhsxL/Ywf8lzfsOl+i83/59DlGI/oYLXYpV0nHOqrD1LKm1Hlgg7OCenBTA45+ImMuS36UXrX1qepO3tHHXfacNKu3KCpZ+2cH05rPMsBnxy/aw6XdmxKKTSY8A0S8jsSvysVnZRDlHVlspwrTOrCMnEwLIJo/hafhNNRsaezn3QYiqO10APpIOU9oEOkGWNIFsF/gZC06jV8vqXmUNOqpFLt9v6GKR4q2yKh8XVFR/LTYgxvNNc8pgsoclfYfZbzFhsi0cZvKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5401.namprd11.prod.outlook.com (2603:10b6:408:11a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 17:52:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:52:36 +0000
Date: Thu, 31 Aug 2023 17:51:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDTJRYQewto5c89@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831092937.2197-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8fc93c-9433-4004-4c94-08dbaa4b0f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCg128SaahNUfWuFFbSxO1l7pUyx/4o/z0aK5j9Kb+T3h9bixOkjDKyQDGFTNHIycSVjUucVwTzd+i1+lPUFo2UMuMcnX5vhTGTRAMVZSz+mHAAU97YBYiGteuhNGeqH409HyruAmZ1zS/NTtrpSdc+PI/riUOopKazdqr5D3mCTg/cce71kKUYQYheA0FH7zetsoUnKX6mHDHaIROiFJUHb31MT5JxRat0OKNV/kU57J3ZwEr0cQDwLEdcyAEU+DxVrpVvP1tEdx/rzXcgpsJbAH3273m5vS66FPjoQGSA6CM6cKdomOVyxTRILw6QRp1cHw8r27h8+ovyIf/A5WEXG1mXEGRzD12qHQYxxWG9X5zWjiX24TMfmXS629liaUpCONVQIyZpAzKX35iK18RY2z4UAO370i99CBsdWJ3WfJ519tHrzFTI+3+r3ENx1+MBtNBbDED/tfUv32jckmuyDaMITPvU2eknXxEcjgNVWUrtT2Kp7s301/zi9OBJWc+tq/Jy7wN9Yr2PUwDa/EyvLZ/PJ9eMgeqzYA9IbS/8/WZKl6HQi/UTcmpWLKGqd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(366004)(136003)(186009)(1800799009)(451199024)(6666004)(6486002)(6512007)(6506007)(478600001)(83380400001)(66574015)(2906002)(26005)(30864003)(8936002)(41300700001)(66476007)(316002)(44832011)(6916009)(66556008)(8676002)(66946007)(5660300002)(4326008)(82960400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RUUQB0OhNf+jGrDVCS+a0hegqqh1sBOS5oiqHCijLUes2JE/rLDJyKTBE4?=
 =?iso-8859-1?Q?J8j/VUgNO6btXL+LKGYgezSJUcaCTN4LNdEIsB8LWtn4VeSCN8xggXnvQl?=
 =?iso-8859-1?Q?G5yTw8w77K5nYwW9+ZIpJ7yMA6MoTLPn6SNS4fSeHGIP/OOJ9c5TAItWPR?=
 =?iso-8859-1?Q?rcn/buWSTHLNnPix5zoC84NIvOxLineVHQtOcsvfgjlWigyp9AhloxTPlM?=
 =?iso-8859-1?Q?zxJ7kkbjO8PRKLYsOXyg7ZFNHPU9Vux2haflXrqJhQE3TwauEhItIROTsy?=
 =?iso-8859-1?Q?CKuNBy7FkHcWl8hE9gH9lRWk3QV1jSd0RH4h6DJAd+lCV9l2m31FCi+i6r?=
 =?iso-8859-1?Q?4R6MsurDOxzfQ/jyG3Fs/xQSKFHp3vOm8NqcKrhoSfuh1loU7+OwgDqLVV?=
 =?iso-8859-1?Q?4EzFDk/QUGmbB0c4Xx4C63Nk6NvYVv1elAos07pE5By4tVDIZqmvhknXD3?=
 =?iso-8859-1?Q?n5yzaV/dlwKAEUMqZNgHNLncbwZHWKH5Xk/p4CA51I0nRXeiWDkljAforM?=
 =?iso-8859-1?Q?VTymi3FvZAEUnvk/NR5TnFNHFFqiNBAkIpr8+IQk8cJ1IU66IQ8tKFnacE?=
 =?iso-8859-1?Q?RNJFZySUUAjpV8KAWcdy2e+h84PFNz6NoQAN5703Z/NTJJ2P9gxSEOdAts?=
 =?iso-8859-1?Q?a0e/7fi8J6DMxYDPlSF3ivEpAJctoFuIEOOvMp+GcAzVLRuswnvD7+6ePF?=
 =?iso-8859-1?Q?0E9JblY7pLjtRbbq246n7n+nIeA4rCge7m4/9I+CTB6EDOpR+HzVlnMNze?=
 =?iso-8859-1?Q?v95e2NjFDm56Rl0ljV90WcDRKn5hkUqmEvZHC2P+FKnpq0SBge1+ru+GGN?=
 =?iso-8859-1?Q?Y9qiRllI72yurxr26TRGq2FnnK7u9TBwChXO7imvTjqM92OPx0kirdE8Q7?=
 =?iso-8859-1?Q?Tu8gmZjlomfGne3MlkiIZYzwWles//dSmAQ8wlCtwhEGO0zsYzbI8iMhw8?=
 =?iso-8859-1?Q?6YsFrvru+KGYuBK3FuuybWKH8MsDGmRdeJ3OISvk0RbU4jE37aYRUkGnx1?=
 =?iso-8859-1?Q?GZ0NUXrJ8HMAqeRDmuxGpR/RZFRzrWS73ulkHl/bU8B0PPyaemg17/1tie?=
 =?iso-8859-1?Q?c1onJ9wuqK1VLkl1ssdoXyeANGSlE74P6LAFrEV7pLBNBSTXN5bHU8LaJY?=
 =?iso-8859-1?Q?B4+D1/GD+173swh894iTZ3BKdRyan7E7T17qdmn1BshnyKkHV+M/mGwQ66?=
 =?iso-8859-1?Q?hSx8F7gJI4vSCVFyVRlryrxJ4Mw4AMy0t9IKRkaT3sZ6RrwjH+y97kaNeV?=
 =?iso-8859-1?Q?6H+WcE53Mx+ToE471DKtkl+o1Y591PDU4B8TMQiaCphnt70iCUCR754KAn?=
 =?iso-8859-1?Q?EeoMhM6PZXTOuVnU49v9iP0VOmPaKGlv9zGjjgqQZ5TZ9CQcULV9FpR/cU?=
 =?iso-8859-1?Q?kq33ehmBY5TiMX26UfOWfSfmyuIXM9Yi9aDKBgqYlKBjwx9B3g4UcV1PMC?=
 =?iso-8859-1?Q?7i348DCaqCf5A7Ypsud5RwyratgjrXf6CUosZmNpPDc8P2iV/GH1BL/UR7?=
 =?iso-8859-1?Q?J953C5EPN4NXaNUJlsGUG3PDIMUEsASM2GmQwyr6fc2gWgps4K7gZzPR5d?=
 =?iso-8859-1?Q?oOGLPJaRaqrugSRKFGO350Yezop3pKmeWh9RWK45ZxXTi0+RRp81aHLH1m?=
 =?iso-8859-1?Q?nQs9qB9DSlNK/K67gyD3rvLJPNriZckQWvgnZKOONKJrZRxUw8SJYchw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8fc93c-9433-4004-4c94-08dbaa4b0f70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:52:36.3020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMq1iDuHCE6WRXnuuYA8p9IY32Z82vZx3hLDLdp920C2qhwxsWp9p/5FFD40as5oZeJiWykqXyf5v5GWMsmHTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5401
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 4/6] drm/xe: Rework xe_exec and the VM
 rebind worker to use the drm_exec helper
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

On Thu, Aug 31, 2023 at 11:29:35AM +0200, Thomas Hellström wrote:
> Replace the calls to ttm_eu_reserve_buffers() by using the drm_exec
> helper instead. Also make sure the locking loop covers any calls to
> xe_bo_validate() / ttm_bo_validate() so that these function calls may
> easily benefit from being called from within an unsealed locking
> transaction and may thus perform blocking dma_resv locks in the future.
> 
> For the unlock we remove an assert that the vm->rebind_list is empty
> when locks are released. Since if the error path is hit with a partly
> locked list, that assert may no longer hold true we chose to remove it.
> 
> v3:
> - Don't accept duplicate bo locks in the rebind worker.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig   |   1 +
>  drivers/gpu/drm/xe/xe_exec.c |  71 +++------
>  drivers/gpu/drm/xe/xe_vm.c   | 280 ++++++++++++++++-------------------
>  drivers/gpu/drm/xe/xe_vm.h   |  22 +--
>  4 files changed, 157 insertions(+), 217 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 0a4ea965645b..096bd066afa8 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -8,6 +8,7 @@ config DRM_XE
>  	select SHMEM
>  	select TMPFS
>  	select DRM_BUDDY
> +	select DRM_EXEC
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
>  	select DRM_SUBALLOC_HELPER
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 8a5b614df090..b5058fb8b575 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -6,6 +6,7 @@
>  #include "xe_exec.h"
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
>  #include <drm/xe_drm.h>
>  #include <linux/delay.h>
> @@ -93,25 +94,18 @@
>   *	Unlock all
>   */
>  
> -#define XE_EXEC_BIND_RETRY_TIMEOUT_MS 1000
> -
> -static int xe_exec_begin(struct xe_exec_queue *q, struct ww_acquire_ctx *ww,
> -			 struct ttm_validate_buffer tv_onstack[],
> -			 struct ttm_validate_buffer **tv,
> -			 struct list_head *objs)
> +static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
>  {
> -	struct xe_vm *vm = q->vm;
>  	struct xe_vma *vma;
>  	LIST_HEAD(dups);
>  	ktime_t end = 0;
>  	int err = 0;
>  
> -	*tv = NULL;
> -	if (xe_vm_no_dma_fences(q->vm))
> +	if (xe_vm_no_dma_fences(vm))
>  		return 0;
>  
>  retry:
> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, exec, 1, true);
>  	if (err)
>  		return err;
>  
> @@ -127,42 +121,16 @@ static int xe_exec_begin(struct xe_exec_queue *q, struct ww_acquire_ctx *ww,
>  			continue;
>  
>  		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> -		if (err) {
> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> -			*tv = NULL;
> +		if (err)
>  			break;
> -		}
>  	}
>  
> -	/*
> -	 * With multiple active VMs, under memory pressure, it is possible that
> -	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
> -	 * Until ttm properly handles locking in such scenarios, best thing the
> -	 * driver can do is retry with a timeout.
> -	 */
> -	if (err == -ENOMEM) {
> -		ktime_t cur = ktime_get();
> -
> -		end = end ? : ktime_add_ms(cur, XE_EXEC_BIND_RETRY_TIMEOUT_MS);
> -		if (ktime_before(cur, end)) {
> -			msleep(20);
> -			goto retry;
> -		}
> -	}
> +	if (err && xe_vm_validate_should_retry(exec, err, &end))
> +		goto retry;
>  
>  	return err;
>  }
>  
> -static void xe_exec_end(struct xe_exec_queue *q,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer *tv,
> -			struct ww_acquire_ctx *ww,
> -			struct list_head *objs)
> -{
> -	if (!xe_vm_no_dma_fences(q->vm))
> -		xe_vm_unlock_dma_resv(q->vm, tv_onstack, tv, ww, objs);
> -}
> -
>  int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -173,14 +141,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	struct xe_sync_entry *syncs = NULL;
>  	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv = NULL;
> +	struct drm_exec exec;
>  	u32 i, num_syncs = 0;
>  	struct xe_sched_job *job;
>  	struct dma_fence *rebind_fence;
>  	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>  	bool write_locked;
>  	int err = 0;
>  
> @@ -294,26 +259,30 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  			goto err_unlock_list;
>  	}
>  
> -	err = xe_exec_begin(q, &ww, tv_onstack, &tv, &objs);
> -	if (err)
> -		goto err_unlock_list;
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_exec_begin(&exec, vm);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			goto err_exec;
> +	}
>  
>  	if (xe_vm_is_closed_or_banned(q->vm)) {
>  		drm_warn(&xe->drm, "Trying to schedule after vm is closed or banned\n");
>  		err = -ECANCELED;
> -		goto err_exec_queue_end;
> +		goto err_exec;
>  	}
>  
>  	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
>  		err = -EWOULDBLOCK;
> -		goto err_exec_queue_end;
> +		goto err_exec;
>  	}
>  
>  	job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
>  				  addresses : &args->address);
>  	if (IS_ERR(job)) {
>  		err = PTR_ERR(job);
> -		goto err_exec_queue_end;
> +		goto err_exec;
>  	}
>  
>  	/*
> @@ -412,8 +381,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  err_put_job:
>  	if (err)
>  		xe_sched_job_put(job);
> -err_exec_queue_end:
> -	xe_exec_end(q, tv_onstack, tv, &ww, &objs);
> +err_exec:
> +	drm_exec_fini(&exec);
>  err_unlock_list:
>  	if (write_locked)
>  		up_write(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ac222cbe78f0..b95a43d0af59 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_print.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
> @@ -322,10 +323,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>  
>  int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	struct dma_fence *pfence;
>  	int err;
>  	bool wait;
> @@ -333,10 +331,13 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
>  
>  	down_write(&vm->lock);
> -
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> -	if (err)
> -		goto out_unlock_outer;
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_vm_lock_dma_resv(vm, &exec, 1, true);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			goto out_unlock;
> +	}
>  
>  	pfence = xe_preempt_fence_create(q, q->compute.context,
>  					 ++q->compute.seqno);
> @@ -368,8 +369,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> -out_unlock_outer:
> +	drm_exec_fini(&exec);
>  	up_write(&vm->lock);
>  
>  	return err;
> @@ -398,68 +398,36 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>   * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>   * objects of the vm's external buffer objects.
>   * @vm: The vm.
> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> - * ttm_validate_buffers used for locking.
> - * @tv: Pointer to a pointer that on output contains the actual storage used.
> - * @objs: List head for the buffer objects locked.
> - * @intr: Whether to lock interruptible.
> + * @exec: Pointer to a struct drm_exec locking context.
>   * @num_shared: Number of dma-fence slots to reserve in the locked objects.
> + * @lock_vm: Lock also the vm's dma_resv.
>   *
>   * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list. The TTM utilities require
> - * a list of struct ttm_validate_buffers pointing to the actual buffer
> - * objects to lock. Storage for those struct ttm_validate_buffers should
> - * be provided in @tv_onstack, and is typically reserved on the stack
> - * of the caller. If the size of @tv_onstack isn't sufficient, then
> - * storage will be allocated internally using kvmalloc().
> - *
> - * The function performs deadlock handling internally, and after a
> - * successful return the ww locking transaction should be considered
> - * sealed.
> + * buffer objects on the vm external object list.
>   *
>   * Return: 0 on success, Negative error code on error. In particular if
> - * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
> - * of error, any locking performed has been reverted.
> + * @intr is set to true, -EINTR or -ERESTARTSYS may be returned.
>   */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared)
> -{
> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			unsigned int num_shared, bool lock_vm)
> +{
>  	struct xe_vma *vma, *next;
> -	LIST_HEAD(dups);
> -	int err;
> +	int err = 0;
>  
>  	lockdep_assert_held(&vm->lock);
>  
> -	if (vm->extobj.entries < XE_ONSTACK_TV) {
> -		tv_vm = tv_onstack;
> -	} else {
> -		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
> -				       GFP_KERNEL);
> -		if (!tv_vm)
> -			return -ENOMEM;
> +	if (lock_vm) {
> +		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
> +					   num_shared);
> +		if (err)
> +			return err;
>  	}
> -	tv_bo = tv_vm + 1;
>  
> -	INIT_LIST_HEAD(objs);
>  	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
> -		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &xe_vma_bo(vma)->ttm;
> -
> -		list_add_tail(&tv_bo->head, objs);
> -		tv_bo++;
> +		err = drm_exec_prepare_obj(exec, &xe_vma_bo(vma)->ttm.base, num_shared);
> +		if (err)
> +			return err;
>  	}
> -	tv_vm->num_shared = num_shared;
> -	tv_vm->bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm->head, objs);
> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> -	if (err)
> -		goto out_err;
>  
>  	spin_lock(&vm->notifier.list_lock);
>  	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> @@ -473,45 +441,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>  	}
>  	spin_unlock(&vm->notifier.list_lock);
>  
> -	*tv = tv_vm;
>  	return 0;
> -
> -out_err:
> -	if (tv_vm != tv_onstack)
> -		kvfree(tv_vm);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
> - * xe_vm_lock_dma_resv()
> - * @vm: The vm.
> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> - * @ww: The ww_acquire_context used for locking.
> - * @objs: The list returned from xe_vm_lock_dma_resv().
> - *
> - * Unlocks the reservation objects and frees any memory allocated by
> - * xe_vm_lock_dma_resv().
> - */
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs)
> -{
> -	/*
> -	 * Nothing should've been able to enter the list while we were locked,
> -	 * since we've held the dma-resvs of all the vm's external objects,
> -	 * and holding the dma_resv of an object is required for list
> -	 * addition, and we shouldn't add ourselves.
> -	 */
> -	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
> -
> -	ttm_eu_backoff_reservation(ww, objs);
> -	if (tv && tv != tv_onstack)
> -		kvfree(tv);
>  }
>  
>  #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
> @@ -533,18 +463,108 @@ static void xe_vm_kill(struct xe_vm *vm)
>  	/* TODO: Inform user the VM is banned */
>  }
>  
> +/**
> + * xe_vm_validate_should_retry() - Whether to retry after a validate error.
> + * @exec: The drm_exec object used for locking before validation.
> + * @err: The error returned from ttm_bo_validate().
> + * @end: A ktime_t cookie that should be set to 0 before first use and
> + * that should be reused on subsequent calls.
> + *
> + * With multiple active VMs, under memory pressure, it is possible that
> + * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
> + * Until ttm properly handles locking in such scenarios, best thing the
> + * driver can do is retry with a timeout. Check if that is necessary, and
> + * if so unlock the drm_exec's objects while keeping the ticket to prepare
> + * for a rerun.
> + *
> + * Return: true if a retry after drm_exec_init() is recommended;
> + * false otherwise.
> + */
> +bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +	ktime_t cur;
> +
> +	if (err != -ENOMEM)
> +		return false;
> +
> +	cur = ktime_get();
> +	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
> +	if (!ktime_before(cur, *end))
> +		return false;
> +
> +	/*
> +	 * FIXME: Open-code drm_exec_unlock_all().
> +	 * We don't want to release the ww ticket.
> +	 */
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +	}
> +	drm_gem_object_put(exec->prelocked);
> +	exec->prelocked = NULL;
> +	exec->num_objects = 0;
> +
> +	msleep(20);
> +	return true;
> +}
> +
> +static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
> +				 bool *done)
> +{
> +	struct xe_vma *vma;
> +	ktime_t end = 0;
> +	int err;
> +
> +retry:
> +	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
> +				   vm->preempt.num_exec_queues);
> +	if (err)
> +		return err;
> +
> +	if (xe_vm_is_idle(vm)) {
> +		vm->preempt.rebind_deactivated = true;
> +		*done = true;
> +		return 0;
> +	}
> +
> +	if (!preempt_fences_waiting(vm)) {
> +		*done = true;
> +		return 0;
> +	}
> +
> +	err = xe_vm_lock_dma_resv(vm, exec, vm->preempt.num_exec_queues, false);
> +	if (err)
> +		return err;
> +
> +	err = wait_for_existing_preempt_fences(vm);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> +		if (xe_vma_has_no_bo(vma) ||
> +		    vma->gpuva.flags & XE_VMA_DESTROYED)
> +			continue;
> +
> +		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> +		if (err)
> +			break;
> +	}
> +
> +	if (err && xe_vm_validate_should_retry(exec, err, &end))
> +		goto retry;
> +
> +	return err;
> +}
> +
>  static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> -	struct xe_vma *vma;
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>  	struct dma_fence *rebind_fence;
>  	unsigned int fence_count = 0;
>  	LIST_HEAD(preempt_fences);
> -	ktime_t end = 0;
>  	int err;
>  	long wait;
>  	int __maybe_unused tries = 0;
> @@ -583,42 +603,21 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  			goto out_unlock_outer;
>  	}
>  
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_exec_queues);
> -	if (err)
> -		goto out_unlock_outer;
> -
> -	if (xe_vm_is_idle(vm)) {
> -		vm->preempt.rebind_deactivated = true;
> -		goto out_unlock;
> -	}
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>  
> -	/* Fresh preempt fences already installed. Everyting is running. */
> -	if (!preempt_fences_waiting(vm))
> -		goto out_unlock;
> +	drm_exec_until_all_locked(&exec) {
> +		bool done = false;
>  
> -	/*
> -	 * This makes sure vm is completely suspended and also balances
> -	 * xe_engine suspend- and resume; we resume *all* vm engines below.
> -	 */
> -	err = wait_for_existing_preempt_fences(vm);
> -	if (err)
> -		goto out_unlock;
> +		err = xe_preempt_work_begin(&exec, vm, &done);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err || done)
> +			goto out_unlock;
> +	}
>  
>  	err = alloc_preempt_fences(vm, &preempt_fences, &fence_count);
>  	if (err)
>  		goto out_unlock;
>  
> -	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
> -		if (xe_vma_has_no_bo(vma) ||
> -		    vma->gpuva.flags & XE_VMA_DESTROYED)
> -			continue;
> -
> -		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
> -		if (err)
> -			goto out_unlock;
> -	}
> -
>  	rebind_fence = xe_vm_rebind(vm, true);
>  	if (IS_ERR(rebind_fence)) {
>  		err = PTR_ERR(rebind_fence);
> @@ -663,30 +662,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	drm_exec_fini(&exec);
>  out_unlock_outer:
>  	if (err == -EAGAIN) {
>  		trace_xe_vm_rebind_worker_retry(vm);
>  		goto retry;
>  	}
>  
> -	/*
> -	 * With multiple active VMs, under memory pressure, it is possible that
> -	 * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
> -	 * Until ttm properly handles locking in such scenarios, best thing the
> -	 * driver can do is retry with a timeout. Killing the VM or putting it
> -	 * in error state after timeout or other error scenarios is still TBD.
> -	 */
> -	if (err == -ENOMEM) {
> -		ktime_t cur = ktime_get();
> -
> -		end = end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
> -		if (ktime_before(cur, end)) {
> -			msleep(20);
> -			trace_xe_vm_rebind_worker_retry(vm);
> -			goto retry;
> -		}
> -	}
>  	if (err) {
>  		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
>  		xe_vm_kill(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index d7d8fd7bd8da..4a1dd11f71c5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -21,6 +21,7 @@ struct ttm_validate_buffer;
>  struct xe_exec_queue;
>  struct xe_file;
>  struct xe_sync_entry;
> +struct drm_exec;
>  
>  struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
>  void xe_vm_free(struct kref *ref);
> @@ -211,23 +212,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>  
>  int xe_vma_userptr_check_repin(struct xe_vma *vma);
>  
> -/*
> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> - */
> -#define XE_ONSTACK_TV 20
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> -			unsigned int num_shared);
> -
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs);
> +bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
> +
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
> +			unsigned int num_shared, bool lock_vm);
>  
>  void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  			     enum dma_resv_usage usage);
> -- 
> 2.41.0
> 
