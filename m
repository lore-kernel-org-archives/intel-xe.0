Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9CEC83F38
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6A910E642;
	Thu, 31 Aug 2023 18:01:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C50F10E642
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693504864; x=1725040864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/pnT5zu14rehKU5qAP9WGCTiJWikjT5nTc9MHeg3f+Y=;
 b=fNAl5GtrV8jZ3wxRrjpiWgNy9VptKuiNsHipjs3USa1gsxquuuuUpQD/
 QcmfUN22Yby7fWUPX3OEirO4EMg9qugUVPL4pamn7MMVahAp54CYgbcNc
 3WLr8/HqlRDSMJ9iO1pfVAwHQxHdfmlaxeQuc4BRnwhcGRH6SHwK4oVXl
 3FpTabwl8IU4oJthbk68TpO4RpTyov9AuT9qb7y0j9XwG7sV7q/6YNuSA
 MjLTWHfpgMEQf4As2rY0rYWgcY6z3Nu1QklwHaSMtFsJ7NCwqp3Cd+3Cs
 A1w1/ib2fSqoxWNbZs21LXY6pm66DXj7rND8i3XhH80mvYIL25K+jXb5v A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355517334"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355517334"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774676664"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="774676664"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:59:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:59:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:59:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:59:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a80Eqt5Ns2527gnXD3FWMpU40HQa/xG/+QDrZ821STUm4SVoMfV7gmx7IaC7HKJuEYIVGOXY225Fme9PehkVyGmdzpvTF7IoVC0sYFFX8FgTjfY6koNIGIGpsC3ZNNXX4u6RVEpTzbD52Kp5D0dbS5FPO3XptapicxM60iV2CbDzEChZHLc3sAi80oqcxjbs0QHJrGM7grozksLb3JEe25KRkwbKuxv99NXBdreXDXPpFu9PSmtBdLONi3MJuvI1NrYLu8awZ2WWY5gbjas1bdFWXLz7Dn+57o9fr6meB4e3tQSG3EIEXeh7AKKIE/7fNaSCnhC9Ue12RqGwU2PZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkL6VFjvbCoBxkbECSTY6IyF8UTeZbqQIErQbxkF69A=;
 b=ImOpqSwP44CgiWzr55oZxVxxTAE7geJ9KzZMOfvJ6u1H2Yk26dv0vU3n94MO2VT8NHtz6mzvdJYwqwJwXmfEsZBAZDJQgC5hu+LFJYQ/Xer/8Io5G0BtkcHmkO4oMscRCRbNdVi0xTj+N/sDyaw0AcPb4dCIMmAlYaPTzzOfGN19bRwYUAsW8uMuu1472dHnPFCgc+cN7wgx28OLGA26OxiXRpfJABCHJBEvvQk8p/Hv5jWroiy6U/23JIJXhBdCxfcL5aXZybdyokMIn3AmPb9lBRQLMF+galFYy+SsbVE3D7W6TG/OV8M8CtmVQ8r7jImFnMvRqmGismAV9tmWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 17:59:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:59:20 +0000
Date: Thu, 31 Aug 2023 17:58:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDUuaNl4/qAPtVX@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831092937.2197-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a86d2a4-7e5c-4aea-ecf0-08dbaa4c0031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +22S4alehd5V4VKvSvdGyViQfZulyWD7qaqC9PeJOB0V/356As5Qtw30xH6+LIByUw2h3KEZLoYMmA4jBU1REEhLsdK8CVAn0CpEBP+R5kN6sDcBAT5AEglwakR+AsxsSR//EM79ml7IUFc7M1Ow4Je+JdEjyiDdrxv/shGs4r07mirCYZ43VVGoqiN8Tfj0Qs5sI2FNkLNeTiXC8XUQ4PrBmceWSXmabOaWm4Sc+cbxEKqbBQ1RAdys3XvsThWO3YMvd9kvydn3hmKzkMj3pV+JR7LK4no66VRKCG7qDP7H5lUW3/uZdv3kgKjgVXZuA72+jWEBRTbA/q57to8/Y7qG+ii+cOhTCuBwImqBxTgPRXz3TOA92DL7kui54MZyEl3ogbOTpaiKZb1oKL6OkphcJlXaUFYOirxYn3KjLrzcj89GUgJw2To5DTQU1FBVSvnCshTyOAtqzMfGH8b9Ep4jcP3zvSbSaelzjMwm9m3QjKY9vasziyz6axPNIwua/fU568NlIpaXqpLX4N6BaxKjH187Vb5Q5ZkA5JPgH08F17gV2oIfRIrSKbUa14VU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(1800799009)(186009)(451199024)(8936002)(6506007)(6666004)(6486002)(6512007)(2906002)(86362001)(38100700002)(82960400001)(26005)(5660300002)(478600001)(6916009)(66946007)(41300700001)(66556008)(4326008)(44832011)(83380400001)(66476007)(316002)(8676002)(66574015);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qvDnKaVMfcNuO208081GhA8sAEc22WzcLDSqZ63AMmUbkj2zLKf718u9zK?=
 =?iso-8859-1?Q?6ZCR1Rz8M+W1o3DGO4rCXblZeeUMsNK6Dx4misHdknLo2MKYABjvvZ6baI?=
 =?iso-8859-1?Q?MNO5MS+1jGrC6FLonDqMUXogUfJISyagU5oCLrohQLEi9aeYMr3SSWX2R5?=
 =?iso-8859-1?Q?XGT7Aj4JlFj9Nzse/qDvgX6L+Qvb+60NX42SuGjUvHyKzy5cncYpAPANH5?=
 =?iso-8859-1?Q?768vMn6+4ImWVA44antk+rxfI/HGFpSy43zyJd4VNNUyoU/8RmMnSP1lam?=
 =?iso-8859-1?Q?vpJHwDpo8rQz5XxIXtOyxXSQBpOCXysEy8XCcL0TSxaWHVyUoWxwwjV9mE?=
 =?iso-8859-1?Q?gGsEIho0NKKjoPKnSroFq+7o4MtGx6AF8iFDAr4lDL1XaYUf7m/tfOVECt?=
 =?iso-8859-1?Q?dgmnqaZT9f339BWWRv/SW0jSwxWaRk5M8Hrcx7MNSTBRE++itdhJMYnzTF?=
 =?iso-8859-1?Q?PFjiouKzobTFE2keEvI+pAeXU8eUPI1o0NVNqNcc/JfBppVBe5ZOM6aSUh?=
 =?iso-8859-1?Q?maPl/PavUA9z3VvKLvm5S+GA7em1+revFXWK1FHu958u+T3zgT8JI9a3xN?=
 =?iso-8859-1?Q?bcvmwVGcZ1PuvwsS3KVT1wAiikqXd9NgZdO5b/mZaxr0lyKFMKxaMf5tSN?=
 =?iso-8859-1?Q?OjaVe+3ERPHG5ehqPOWTtNooYNGV2JMN41kqdq6UyzHaFKcbXShLTTqKYm?=
 =?iso-8859-1?Q?umAUaZXTnu5WXTd/tzc7Z1dpD35YKBHjdwVXIEpqrvUokbuny7EDSXYfQL?=
 =?iso-8859-1?Q?dUzIF1XOigfHpErlFMjEhhaqO2n9T2lYWO7XMGCv82m1EBIbVeaL3WOXYw?=
 =?iso-8859-1?Q?jrjChK7pfoqpcJOthJhsBbZByG08yWq1iBosy/UrkalAAJLfFVurs+yoya?=
 =?iso-8859-1?Q?4eLVDzcrqDhU8nEkB83GZ4cN75QjlQ95aTwcTBN0i/aRqZ9c74nCqd7LDQ?=
 =?iso-8859-1?Q?jD0lPqD8xfWKYkaSxyr7xzT4jwucAnxXnluFhlPbzsvPCWJ6MgHH+Be00t?=
 =?iso-8859-1?Q?PCkXk13hVUFUih2Gv/R5Re2CR3Leb2nxzYmohv3sA9NDn68KHNHWkBZAiH?=
 =?iso-8859-1?Q?aF5NKh+2gswYcCnaGkahCP5U6NWE0SYM8kQgdYL9ne+Izb3D1tIs2CN9tA?=
 =?iso-8859-1?Q?//0d/BygvggF1Bn1bKWIK2g3+PSUfRHSrSS/fMZ7CuVenQszclAvKBb5xJ?=
 =?iso-8859-1?Q?/VSagmcwTIsVNq0rihg2F9hjcUsiWIO3ibQAyXwppFG9dEfRoLjDZiIw7e?=
 =?iso-8859-1?Q?RilWINHaKzHm3IfRpMddAsmytJqb0Z1j1Gz2RL1XgsY1giXkALd5N5oruT?=
 =?iso-8859-1?Q?XPLjZ4OLFNOZ15yKKzbdT3XPxPG/Z0gQ82jlJIy3XP5KI4uTJN8WW8bQEt?=
 =?iso-8859-1?Q?00i7d5RbkFv19hZzdYzmtMLNY2iYcF1zV5HIRwFPUMl/ylnHpk2M+5qJwK?=
 =?iso-8859-1?Q?GqrNdzOIDJXR794aejtyHkUlcz6fBBqMcu+QMPRSxf2Hi84aOqfz49Prsl?=
 =?iso-8859-1?Q?mHOrsguDVP7k5YPpubcnZpb2gBQ2utZchcUmpT297qPpjNcFQvZ7kUZAbt?=
 =?iso-8859-1?Q?DvHCf2hGzeonpopAgu/YJwJRzY/JXKhLl5yFZT/KMEHDR4JdXmoHqhNbye?=
 =?iso-8859-1?Q?5ONP4e9X+Cm0GV/HS0XKh5+/GVfEowP33hmXR+72eqXCsDZ+sDhPFPIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a86d2a4-7e5c-4aea-ecf0-08dbaa4c0031
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:59:20.2200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPBEvtrPK+comO8caEZaFiLohbt1WklnGr5fJ8U82m/L6DnbNCiVVHl5wGr4UAIladX60p6iCp354LpsEQ8KxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/6] drm/xe: Convert pagefaulting code to
 use drm_exec
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

On Thu, Aug 31, 2023 at 11:29:36AM +0200, Thomas Hellström wrote:
> Replace the calls into ttm_eu_reserve_buffers with the drm_exec helpers.
> Also reuse some code.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 106 ++++++++++++---------------
>  drivers/gpu/drm/xe/xe_vm.c           |  15 ++++
>  drivers/gpu/drm/xe/xe_vm.h           |   3 +
>  3 files changed, 64 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 73fc9389a663..e6197ec6f72f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  
> @@ -84,11 +85,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  	return true;
>  }
>  
> -static bool only_needs_bo_lock(struct xe_bo *bo)
> -{
> -	return bo && bo->vm;
> -}
> -
>  static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>  {
>  	struct xe_vma *vma = NULL;
> @@ -103,17 +99,44 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>  	return vma;
>  }
>  
> +static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> +		       unsigned int num_shared, bool atomic, unsigned int id)
> +{
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	int err;
> +
> +	err = xe_vm_prepare_vma(exec, vma, num_shared);
> +	if (err)
> +		return err;
> +
> +	if (atomic) {
> +		if (xe_vma_is_userptr(vma)) {
> +			err = -EACCES;
> +			return err;
> +		}
> +
> +		/* Migrate to VRAM, move should invalidate the VMA first */
> +		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
> +		if (err)
> +			return err;
> +	} else if (bo) {
> +		/* Create backing store if needed */
> +		err = xe_bo_validate(bo, vm, true);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	struct xe_vma *vma = NULL;
> -	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>  	struct dma_fence *fence;
>  	bool write_locked;
>  	int ret = 0;
> @@ -170,35 +193,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	}
>  
>  	/* Lock VM and BOs dma-resv */
> -	bo = xe_vma_bo(vma);
> -	if (!only_needs_bo_lock(bo)) {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -	}
> -	if (bo) {
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -	}
> -
> -	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	if (ret)
> -		goto unlock_vm;
> -
> -	if (atomic) {
> -		if (xe_vma_is_userptr(vma)) {
> -			ret = -EACCES;
> -			goto unlock_dma_resv;
> -		}
> -
> -		/* Migrate to VRAM, move should invalidate the VMA first */
> -		ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
> -		if (ret)
> -			goto unlock_dma_resv;
> -	} else if (bo) {
> -		/* Create backing store if needed */
> -		ret = xe_bo_validate(bo, vm, true);
> +	drm_exec_init(&exec, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, atomic, tile->id);
> +		drm_exec_retry_on_contention(&exec);
>  		if (ret)
>  			goto unlock_dma_resv;
>  	}
> @@ -225,7 +223,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
>  
>  unlock_dma_resv:
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	drm_exec_fini(&exec);
>  unlock_vm:
>  	if (!ret)
>  		vm->usm.last_fault_vma = vma;
> @@ -490,13 +488,9 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
> -	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>  	int ret = 0;
>  
>  	/* We only support ACC_TRIGGER at the moment */
> @@ -528,23 +522,15 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  		goto unlock_vm;
>  
>  	/* Lock VM and BOs dma-resv */
> -	bo = xe_vma_bo(vma);
> -	if (!only_needs_bo_lock(bo)) {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> +	drm_exec_init(&exec, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		ret = xe_pf_begin(&exec, vma, xe->info.tile_count, true, tile->id);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			break;
>  	}
> -	tv_bo.bo = &bo->ttm;
> -	tv_bo.num_shared = xe->info.tile_count;
> -	list_add(&tv_bo.head, &objs);
> -	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	if (ret)
> -		goto unlock_vm;
> -
> -	/* Migrate to VRAM, move should invalidate the VMA first */
> -	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	drm_exec_fini(&exec);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b95a43d0af59..1547467c7d92 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1085,6 +1085,21 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  	}
>  }
>  
> +int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> +		      unsigned int num_shared)
> +{
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	int err;
> +
> +	XE_WARN_ON(!vm);
> +	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
> +	if (!err && bo && !bo->vm)
> +		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
> +
> +	return err;
> +}
> +
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
>  	struct ttm_validate_buffer tv[2];
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4a1dd11f71c5..5608e4e33169 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -222,6 +222,9 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>  
>  int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>  
> +int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
> +		      unsigned int num_shared);
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
>  #define vm_dbg drm_dbg
>  #else
> -- 
> 2.41.0
> 
