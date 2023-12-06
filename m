Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDBBC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 23:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B15510E03A;
	Wed,  6 Dec 2023 23:37:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859BD10E03A
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701905865; x=1733441865;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AmR6nBG8AmF92jGu324GpifbdumUcaUkZ4yEL7A+VV0=;
 b=gVFWKeDABX+arOdzBRIEECKdgChKmf7zqOXaENajewSGhnNtH5xB+Rk9
 6vy6xB7S3V28OoDWl8WiGoJyMm5Q+BP6UmftTzAi59YEMN59L3VhovscE
 V1Ovu4pJNqruqLBlz8G7/aK9FDkq9b03C/m0lI0ogyzqE5hLH3IiSgvf0
 kXHAvKZWbA6VJFw0PDntzimMCNcmB7QxI8q53CZaBzEHH7o10XqR3afKK
 Ssw5dbBm1+VkisvyBV4qRx3ODD8Sylq99+8gBU56g9ZpBnZRm9U31M7fm
 791dZ2EztF+HO1gK2XZ6Y81okmr8UJwuxjvvzzZYtGXyFN5s4QZvJqvpn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393017492"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="393017492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 15:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="747774259"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="747774259"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 15:37:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 15:37:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 15:37:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 15:37:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glP3otFBYrT+SBRFt9eJoMuo+79wlCiQaKXzcHD8Kx6Oe1dv2Eu+ul2VnYa3nOZ9tuN3ZpxZH+XKpHDNl7z0tXs9QncMexltphwcUwyjO1g6mvn95+b4/OB7o3cMlpV3udLuB3nprC7Rpox5sJTpCtbQiB2fupqBoF6CD4rEwKdy6E2RCXZKNm3lUBi2vFeAR/cpPbaWyheE+tOz0L2oaY4HpMrST64QcnRBVL3zhqg5vAKqYzdBh4tB24WFZMiuqBqQVs/MmzTnAbjnVP5nLIdHvaJ/ix1gaylmGjLSdPNP+JfNlQT4Wj9oM9SsBj6c2AeMx4TJwI+qh46dkvoZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TCGiQaoKW8GtnR3C4NpgO/RU9pDS0NGSENk7ilIfjI=;
 b=m+7rzGNhzmXittTFtRoC5BrHG5X4rTsj54OuscMVPCWTI4gJCtH6j5q4HvMG8W17+fsagWMzLLTLiPA46LGL6YB+Le/Zq8fLLCM8qejpCGhDnhggrfO9IcrxWbvXs4nHUfqxl5EKjdnOUqjzcZ3aa6OVpAeKwJVxq8lyMM/4xlSk+UiPUHiAwBbmPZmbdhjO6mMhd5sjTbJPAPJ+wruHAFbfU+wH6AsUeCcDhXLHdn5WlDVI2RBKvid8tKYTPhr0/CTotf1oyVNasCmAMVEjIs/RQc9VshKbI6wgele5g2p9Xa3fhZXLKQv+RLVN3vlJOEVmJKYQfm7K865sNBy6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6073.namprd11.prod.outlook.com (2603:10b6:208:3d7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 23:37:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 23:37:33 +0000
Date: Wed, 6 Dec 2023 15:37:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231206233731.GS1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-5-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-5-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e41dec-80dc-47e6-6642-08dbf6b451f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+R/qO3E6uTQGLopozJV+Sa0dXW/+nz9gAk/f5rB8gUhlcXwODu56QrLULXObucv7Q97NtRGANjcsJLfWteV2147pxJDvabNTmMvzGc6VTmpTdjofv4ld5FQN2zMhnGQLCyYQJVEBTvzf28g+bQSkHI2SdQQFTbk21R3n6j1BvpEb4M8h+ou5HDWPxHqQcNaQDmUhsN3kr0rMiMClqmP2vt7ydHpL6hljAwDgnN17+XaC4VW0bQDduX/3Q/HmmsCjqlslckDuvDefAdJ4zdu9CPQcBjqIR2MJ6KCvrYQBKRJkYUyTHi6jOxLZq/1tVRjhrCObcT8EH9c3eelNbvR4KQcl+vbYXZ8/KIUK80gm0LVLuXmZLGyx9L7/sGcQHDv0mGdj+mUQwdSBbOuyfZC45dGht1avUde2m/TgIoX6mLKRePDUdwGhEPU5SeyZIh8G0Y0qDoVbbLbj10x2bMJS8tx/eJ6vM0234bQcfyHS+WOO+LrquBWk7u6RHmdSlesHsZYTfwJPuL8w9zoX+Zblr4SrKldZcGril8ZbIkjpVfd/y6v6m4aiXm2W/ynFNL3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(4326008)(86362001)(8676002)(8936002)(478600001)(6862004)(6486002)(38100700002)(6512007)(6506007)(66574015)(316002)(6636002)(26005)(1076003)(66556008)(66476007)(66946007)(82960400001)(83380400001)(2906002)(33656002)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+OzmKVYW51hACN6oES8cS3Hqhn/SsN+ov0GcrZREZW6RFH3UIw1xuHyoP1?=
 =?iso-8859-1?Q?p8NLy6Y44yBBxhPOPzMMdhz86U6ajbxfv1XMBI7u6JM5ERG6ryXmabAhs0?=
 =?iso-8859-1?Q?Ejs+evLwM5Y4yPppKtikFOjqpoxmWg+w1/COWXFdsT4nXeRzbQLqCeutXq?=
 =?iso-8859-1?Q?n1FywoFNxuIg2hEL+OzEuTJkPWjQZVIdg4TX2syWfqaOHr+83hsq6YwdD3?=
 =?iso-8859-1?Q?YZbkbENssFUFsAKCK5ZVGSJD5GhFGXWaY+1nqyvC891UZnjpqJvbrhKKQL?=
 =?iso-8859-1?Q?zucdAX9qAT/T6N/aaGedTABfV4BEhd+RojE5qs+BSzCPRFfktSxt+ym8e9?=
 =?iso-8859-1?Q?Kx3JIVNMAmTpgNOI//1RTVOdmtWdsbJxv3hXDNE7UHuAVrGIIagIzkazK3?=
 =?iso-8859-1?Q?TNkZPe1gsgppMbWUMqHQ1IS09AUDDJVbL0u5BfqTn8jnhkW+eX4rCEoJZs?=
 =?iso-8859-1?Q?VXvRAzfCDt/eqjrLi4OC1L1GG3VXsMDznUVzvqbdo6HRAymHOHg0XLckdm?=
 =?iso-8859-1?Q?t8FWFrAwI/9eoGOl/v5PsHK44o5sEwACPYfLIoiScV+foodv0Q8R8P25rQ?=
 =?iso-8859-1?Q?5ymNDxU9IjZ7Um99kPqlsq7PvQPiWvhHwR+4r7fZVT5Qre+BxEk1pzQh2t?=
 =?iso-8859-1?Q?2l/btmJMKYG5dwpMCThSDlsHqkbGnltyYakWEJ/VbKNY0x1EJO1GxVoYEZ?=
 =?iso-8859-1?Q?E1EcWiUKshjG6NbVt390H3G2udgdPOZHAqxVPUS3SCEjh9cY3tR292tc4y?=
 =?iso-8859-1?Q?rcdDzbJv/t21i/p2bm3D8aaZRxROculRECUx/PXSrXktDD9zz7rKwkR8AL?=
 =?iso-8859-1?Q?pKe9e3oR52nUPbGJVM1dXDQ9Hl8J9UsGuI70X0918AQV1mBPYvj29VySN7?=
 =?iso-8859-1?Q?iq3DxCF4C8qG2Up7RulWBKPuYeW2Z+Gl47XgaDKSQx3si0rXDl58+slXln?=
 =?iso-8859-1?Q?63/hV3tt5Lz841iFKftHCST1wjpFbNZjnZjTWNwioDU9Gd63evl7LI/BoH?=
 =?iso-8859-1?Q?7+ZBWYYZdefHNDkWfxCFoBIPdnYZdiCEKUpcCpzbBDTRymIVFUpNMZq338?=
 =?iso-8859-1?Q?PoHcgWc2IHqv4bYgQEKJnCviJiHQy2FFy7BcyvVoPYhESdS8ofDQh03WHA?=
 =?iso-8859-1?Q?uAbqgnDDEEZEJ8F1FFf4Q1AR3MEo1V7E1FaOaVAe6tOvLxdgXwCC64igrL?=
 =?iso-8859-1?Q?6PMU97HIdD4R8E3krAlqycdeavoUtL4Af/0k8LtqHhCMtgYcAmJEj+Zsvd?=
 =?iso-8859-1?Q?DDbdFVcVI5V1sHN41jH/VwOIsAqhFc7U9Bq/3ukaS+Cfmr7AolYZU/UsIz?=
 =?iso-8859-1?Q?vDp+JBjCs95ynP2p9+GXk8RYxE02MGeq9yoYhwEhNg6GYwAv+8qqV93wK2?=
 =?iso-8859-1?Q?6ZGZLhts9md53tcrHoqyly+bYcUAAv4L25gM5V+UKa1U7hgMQW7/UIkZMH?=
 =?iso-8859-1?Q?2QYGifoa03sm9dK5SgiD7Ejp7rJwqhpwKd/grh7fthijYnahw8KKL8ZldI?=
 =?iso-8859-1?Q?WiftEMB7OppOipCihemj5p7NFG4UHIHdEWDAdywg4+ee917QUkYRNnnDtP?=
 =?iso-8859-1?Q?E8Uh5w4c+D6Dz7mJQWhTIIn43O4WjTaNmziaRpqyQJc3pY2dHq2t5fPBGl?=
 =?iso-8859-1?Q?FOFwWwcE+QdV/qs92MGQ7uFVlpIKjo09iCTEMZmvd6pY+XIHu987b15g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e41dec-80dc-47e6-6642-08dbf6b451f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 23:37:33.3807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUGBbEwBLphVve7e0jhjqlhuwB0Q/P0to1PkW1xDzqFEnYXL/c0Iwprc+x3rCgHTLKZTQ3oqToeLrzaEQ1hwcWpmmU99KUrPOzYqgo7zNdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6073
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 4/9] drm/xe/xe_migrate: Use NULL 1G PTE
 mapped at 255GiB VA for ccs clear
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

On Wed, Dec 06, 2023 at 10:01:21AM +0530, Himal Prasad Ghimiray wrote:
> Get rid of the cleared bo, instead use null 1G PTE mapped at 255GiB
> offset, this can be used for both dgfx and igfx.
> 
> v2:
>  - Remove xe_migrate::cleared_bo.
>  - Add a comment for NULL mapping.(Thomas)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 65 ++++++---------------------------
>  1 file changed, 11 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7ef068451b59..b4dd1b6d78f0 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -46,16 +46,12 @@ struct xe_migrate {
>  	struct mutex job_mutex;
>  	/** @pt_bo: Page-table buffer object. */
>  	struct xe_bo *pt_bo;
> -	/**
> -	 * @cleared_bo: Zeroed out bo used as a source for CCS metadata clears
> -	 */
> -	struct xe_bo *cleared_bo;
>  	/** @batch_base_ofs: VM offset of the migration batch buffer */
>  	u64 batch_base_ofs;
>  	/** @usm_batch_base_ofs: VM offset of the usm batch buffer */
>  	u64 usm_batch_base_ofs;
> -	/** @cleared_vram_ofs: VM offset of @cleared_bo. */
> -	u64 cleared_vram_ofs;
> +	/** @cleared_mem_ofs: VM offset of @cleared_bo. */
> +	u64 cleared_mem_ofs;
>  	/**
>  	 * @fence: dma-fence representing the last migration job batch.
>  	 * Protected by @job_mutex.
> @@ -93,13 +89,9 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
>  
>  	xe_vm_lock(m->q->vm, false);
>  	xe_bo_unpin(m->pt_bo);
> -	if (m->cleared_bo)
> -		xe_bo_unpin(m->cleared_bo);
>  	xe_vm_unlock(m->q->vm);
>  
>  	dma_fence_put(m->fence);
> -	if (m->cleared_bo)
> -		xe_bo_put(m->cleared_bo);
>  	xe_bo_put(m->pt_bo);
>  	drm_suballoc_manager_fini(&m->vm_update_sa);
>  	mutex_destroy(&m->job_mutex);
> @@ -125,41 +117,6 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
>  	return addr + (256ULL << xe_pt_shift(2));
>  }
>  
> -/*
> - * For flat CCS clearing we need a cleared chunk of memory to copy from,
> - * since the CCS clearing mode of XY_FAST_COLOR_BLT appears to be buggy
> - * (it clears on only 14 bytes in each chunk of 16).

Is XY_FAST_COLOR_BLT still broken on Xe2_LPG?  If not, have we checked
to see whether there's any performance difference between doing a NULL
copy vs a regular fill?

In general, this pre-existing comment should have been labeled with a
workaround number so that we could properly track which platforms and
steppings it applies to and know if/when we could potentially go back to
using the dedicated fill instruction.

> - * If clearing the main surface one can use the part of the main surface
> - * already cleared, but for clearing as part of copying non-compressed
> - * data out of system memory, we don't readily have a cleared part of
> - * VRAM to copy from, so create one to use for that case.
> - */
> -static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
> -{
> -	struct xe_tile *tile = m->tile;
> -	struct xe_device *xe = vm->xe;
> -	size_t cleared_size;
> -	u64 vram_addr;
> -
> -	if (!xe_device_has_flat_ccs(xe))
> -		return 0;
> -
> -	cleared_size = xe_device_ccs_bytes(xe, MAX_PREEMPTDISABLE_TRANSFER);
> -	cleared_size = PAGE_ALIGN(cleared_size);
> -	m->cleared_bo = xe_bo_create_pin_map(xe, tile, vm, cleared_size,
> -					     ttm_bo_type_kernel,
> -					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> -					     XE_BO_CREATE_PINNED_BIT);
> -	if (IS_ERR(m->cleared_bo))
> -		return PTR_ERR(m->cleared_bo);
> -
> -	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> -	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
> -	m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
> -
> -	return 0;
> -}
> -
>  static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  				 struct xe_vm *vm)
>  {
> @@ -170,7 +127,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	u32 map_ofs, level, i;
>  	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
>  	u64 entry;
> -	int ret;
>  
>  	/* Can't bump NUM_PT_SLOTS too high */
>  	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
> @@ -190,12 +146,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	if (IS_ERR(bo))
>  		return PTR_ERR(bo);
>  
> -	ret = xe_migrate_create_cleared_bo(m, vm);
> -	if (ret) {
> -		xe_bo_put(bo);
> -		return ret;
> -	}
> -
>  	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
> @@ -265,6 +215,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  			  (i + 1) * 8, u64, entry);
>  	}
>  
> +	/* Set up a 1GiB NULL mapping at 255GiB offset. */
> +	level = 2;
> +	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
> +		  vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, IS_DGFX(xe), 0)
> +		  | XE_PTE_NULL);
> +	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
> +
>  	/* Identity map the entire vram at 256GiB offset */
>  	if (IS_DGFX(xe)) {
>  		u64 pos, ofs, flags;
> @@ -618,7 +575,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  		 * Otherwise if the bo doesn't have any CCS metadata attached,
>  		 * we still need to clear it for security reasons.
>  		 */
> -		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
> +		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;

Is the 'src_is_vram' check even correct for an igpu?  It seems like
we're _always_ going to be copying the NULL CCS data now and will never
be able to copy the real CCS data.


Matt

>  
>  		emit_copy_ccs(gt, bb,
>  			      dst_ofs, true,
> @@ -1006,7 +963,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  			   clear_vram);
>  		if (xe_device_has_flat_ccs(xe) && clear_vram) {
>  			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> -				      m->cleared_vram_ofs, false, clear_L0);
> +				      m->cleared_mem_ofs, false, clear_L0);
>  			flush_flags = MI_FLUSH_DW_CCS;
>  		}
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
