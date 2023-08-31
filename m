Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B69C83F38
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA7B10E19D;
	Thu, 31 Aug 2023 18:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0CF10E6D3
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693505346; x=1725041346;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kIrWAshgJHmGrCxdxniCF5wgTvV8SJ76YS32Ib8tWJg=;
 b=DndX+sGlfKTdsEzl+SLh1s6hk/4KPMOSor1mZrUCg5ZJ0e5YSpFmBGiq
 MM81LU3I+i11M6yOlyO/vvtXy4zreivwZXC1sW//q7ALyILYl7J5Ut/Tg
 fs3JAjPPMYZRBdHWGNy+hdGV7/hMr63DgUApKqEz8k9/47LTl07i0ewCi
 IxkocGNswHTdftnp7gEgbA3ZegyBve8oMl3vpqzwgSH4n8h1TL6lCdIAT
 46tQb/X82jenL8YBYb5nGV3YToG9uW0ezk2gbObB3cnJ0EhJjJXiIbgBO
 gyfBdO92JMQylAe7WBthpTyu8LKqtetd6DZ7VrLk1awYQbUO6MS6P3IOU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361045902"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="361045902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 11:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="716452611"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="716452611"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 11:09:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:09:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 11:09:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 11:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYPks1ELAsv2THuU1j65c6GOnDSXYCZiPI5UW0GFgAWIWLMmAV1ouu6q5PM4ueNfx3ypYPsOiqaJ/UDj9y7mYN3K3oqMRQtuqMAjt8MkwCxbTZ8Iej3wXFAtgTJSsaOFtVs+hA33dq4DbLs+v5UzJfK4La4mQytnTWMDj2wWLB6axwjf3iFRICStHP9HubRnQVf2x00TqSyD1Dsn2pfnXWFVa3TL+kphKHmbRzi4vUWr5nouEeaatykQkChQuICcFpPriztRXC7YXAcP4OC+pUBpoQKJfOGafxcdMgz5Ep573KjSIxHEtfu5X0HiATleAb4MFZ4RLTdygQZjvQv2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37QG9g0Fc1wqn2XULEcRSsH7k4PY/S+VEkzU2Cnb74I=;
 b=Dfend52s/C582Auz6F43zXLaDFdBrokgraekMSSedr34Y0sDV7UWp2zGW6ptOIl/c6su5BwmqQpjssiKakeWr0HGjNMETS3ME1Ivc3A6+QpY5aBlrPoul8505OgnB9DIMWhVCQWAU0hphBtPQ6bfNbOOof/jPxjoM3Nbjx2GNXJnHV1MmmTn9hizcnFGxoYIP69sqoGWgBmX1xuarJ+v9j57bMEcDYhQ1ZziqdjPd3btpKUlr2piBiNHuves0At61EpWNHtlP4l5+Y3EWwcPjlJacZCmaMf+h7grMm7yXTexpxU2NUShErr4GE+siuFY9lVgxI171P+pRKDAOI30Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 18:09:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 18:09:02 +0000
Date: Thu, 31 Aug 2023 18:07:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDW/59htJrQx7Ap@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230831092937.2197-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: f16d7e79-4395-4018-bc1b-08dbaa4d5b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9RflS00U6rqx3DSYfZN17ZRc2FMLPO2UML/7/vvCxuo7n85aD3GwE4KV8og/2/e+SR5PfC43StDdKI90l9BpWuohmXsBLzgAKmwyfQhXFVpMlOM7R1q6krBerhhDhrri0YDvZM4nWui/x1pzAiMMJJ6mjDulmjZgUa9BRXwA0Tbk/iqVG2QCfuPmseUtGuviR92jvq+pNgZtlPABTz+4purPKnVXfuRJohS4rDGE7LO5+ioPMD5J7mkBi9HiE1ihAvnx1zCIvBdu/tUTntAconO/m3DSBaTf82BqIupNAsk4Ft0R5nGAv00L+vKrQsdMRlI3S0i46tIhi8lxbZGUnpA7WIW8dKul8VXDnsYjavNL8tfse/2ZnenBKYYkYQ5PO+c6d4KbFfft2q7LHiiYHEAIVRwtNdNs/thhweqaZn3rshGClxtXDHZ3HsU9tEhaCOco0eZgvr8/vn+xmWJAsO+U1pAq4oHLimJq2AVH/IyZwwHIfm51FEFRI+KgYnpoyxGejwKhG6OA/AQoAf3vseHwK0joZPAyrZaP7ZO3fzab3+NW3bGkUqAn1NzSTTHB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(1800799009)(451199024)(186009)(2906002)(82960400001)(6916009)(316002)(66476007)(66556008)(66946007)(478600001)(38100700002)(5660300002)(8936002)(86362001)(8676002)(4326008)(83380400001)(41300700001)(44832011)(66574015)(6512007)(6486002)(6666004)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HaGrPoSfXfc6L7YR3PSBUs/eKLYieOxcvUNsIdlgnsEh0L28mldXyLjFgg?=
 =?iso-8859-1?Q?kufv6sO4ugGyhxOCsMLXvtnfHwGHAcgGcW1U0fa/KQ34pCdC75nx+tdJ6l?=
 =?iso-8859-1?Q?C9TLhq2Uy+UyWwzLh+o55w0kiQerWLmtuHMCWyXUt8LcroCHdubx0Mn7t1?=
 =?iso-8859-1?Q?65vKVXqhGFxCglnKBFuWRSqwYWfD3MKm4OGeONXD4C9cL+qRqQkDfEvGzv?=
 =?iso-8859-1?Q?XsFF7B8BUuZzocp5SkVzmeUuqnu080j5DtsHk54GbrzNueRayFUhegpllV?=
 =?iso-8859-1?Q?v+mZ+lrAA2o4hHLqwXd/wUM2UjMiBG2SZmcDpYgKfC5/zE2f6iKSUZlXlE?=
 =?iso-8859-1?Q?R3elc4V6EIuNtQMAmRpxdYi+SdUGm0oLnMOMfcPsEQOScodBVfojE7vF3o?=
 =?iso-8859-1?Q?MpdqkTQZNy12YOXgi6AVJLTJu6Qygp9DV6HHQMx3hEDernIcwIB6/AbFKC?=
 =?iso-8859-1?Q?kp+Iz5p9G/+2ZkEDA2VP95VqHVsALOB2QB3Y3zf2H58Fo+7GaaF31+eoFk?=
 =?iso-8859-1?Q?jfiHIUPucrnBCGYWuohqnV5XEK9GSFg8R9Q6dS2UKofT/jMrJmmQA/pk2G?=
 =?iso-8859-1?Q?lYyDueq0hU4ubOVcvH4zkwP0AoKr+GLI/qC4+rkVg8WIlO52i11qUNXJp6?=
 =?iso-8859-1?Q?GUSFp98w/AMzvz5zxRfGgTf15YwL4aivQx08/e622uiHkGx5Rz0DoUxGth?=
 =?iso-8859-1?Q?2S4iNx1HO6qq3tARjWHUPXYUvxOiZeaey+aJ7ydak+2P0IZVKdmRNAGokn?=
 =?iso-8859-1?Q?sHYCmRfidGhH7BEq04cYxShTu8ExhjhzXQeqIkvhLhMaJE5VHKmJeY7ar7?=
 =?iso-8859-1?Q?yRH13yucd7tF5nffm2LS6WHN0FV7WkMuy6IrxXPv16R0uDWto5VAWbK0Ts?=
 =?iso-8859-1?Q?p0MnkKZcbihRsBsx9eFYsnlrAMLZuRoBTfB0gOsCUHu8oL/6gyCmXpcv7C?=
 =?iso-8859-1?Q?jyQsagabFLZpW30KxCCqnJwHbD3kSA+KDR5fVPJwm0NkQ9FOBGZ+diR4tD?=
 =?iso-8859-1?Q?jWpuv30Ys5tOBV11ASQoAOJhVMgZt3SpRJ3H9uKVM+cX5n9w4HjG0cJQNx?=
 =?iso-8859-1?Q?IAKgnAVaJyfrhWCk+JYSRBaIzLn+GazqrN5lhJFzO/HYCnz1CegBFwvBVL?=
 =?iso-8859-1?Q?CI8+Dao6p7yJnBgJAiuPdtCryw8wTTDylizXVP727deWKyieY4yUlcDlyE?=
 =?iso-8859-1?Q?NrJ7XAUU0kfEYr1yRNomLoogdRsZS0RGzXnuQfnxPSglardAbPedFVnl4L?=
 =?iso-8859-1?Q?w4ZloK0UzwTGRnoP7UK3OS0sPPxL7xHah8vTIkwN0PcPqdNGLsh4e2xBfk?=
 =?iso-8859-1?Q?8mevpSyZGxqR2dOe3UcSbF7xMGlIPt4wqGYOSWFpG1kMQn0SxCIgaCIkqq?=
 =?iso-8859-1?Q?aEwQFW0dlil50MvGQpsDcGW2wCef9nxIng1i3m968jb1SrWmqRdI/J4D+4?=
 =?iso-8859-1?Q?wW1FGXMCXUHjF1gXa3qKXVuFFS8e3qccchH1Q99C5+w56fw5nbKrkUhNWv?=
 =?iso-8859-1?Q?LitorNuskMqteafi9ag4rvYt0i/GzMixg0yZM7A9YO47pNsKnCj3DtEHYe?=
 =?iso-8859-1?Q?vcWK2MgDvDPOmar1jz7uxcK8x25964OUCAvVzFM0839G0mnWag+kzs3O6P?=
 =?iso-8859-1?Q?wnStu9XFiDkDoHaV+tERz1IsjzHg1qjMMldfTKp1K1SawAGWOpSp6xjw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f16d7e79-4395-4018-bc1b-08dbaa4d5b32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:09:02.3747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 768RKss8+oETULimhh4ofZPaPr5TE+CU4ZmsvowYBc5qxrINnkrnub+FK0Wm/LvYQtF6rOmwFK51BOPuQKAMBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 6/6] drm/xe: Convert remaining instances
 of ttm_eu_reserve_buffers to drm_exec
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

On Thu, Aug 31, 2023 at 11:29:37AM +0200, Thomas Hellström wrote:
> The VM_BIND functionality and vma destruction was locking
> potentially multiple dma_resv objects using the
> ttm_eu_reserve_buffers() function. Rework those to use the drm_exec
> helper, taking care that any calls to xe_bo_validate() ends up
> inside an unsealed locking transaction.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 91 +++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1547467c7d92..defa4299f172 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1102,27 +1102,21 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
>  	struct xe_bo *bo = xe_vma_bo(vma);
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct drm_exec exec;
>  	int err;
>  
> -	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> -	list_add(&tv[0].head, &objs);
> -
> -	if (bo) {
> -		tv[1].bo = &xe_bo_get(bo)->ttm;

You catch this but here is get you delete.

> -		list_add(&tv[1].head, &objs);
> +	drm_exec_init(&exec, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		err = xe_vm_prepare_vma(&exec, vma, 0);
> +		drm_exec_retry_on_contention(&exec);
> +		if (XE_WARN_ON(err))
> +			break;
>  	}
> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	XE_WARN_ON(err);
>  
>  	xe_vma_destroy(vma, NULL);
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	drm_exec_fini(&exec);
>  	if (bo)
>  		xe_bo_put(bo);

So the put here needs to be dropped. Drm exec has the proper gets / puts
in place.

>  }
> @@ -2138,12 +2132,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>  	return &vm->pt_root[idx]->bo->ttm;
>  }
>  
> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> -{
> -	tv->num_shared = 1;
> -	tv->bo = xe_vm_ttm_bo(vm);
> -}
> -
>  static void vm_set_async_error(struct xe_vm *vm, int err)
>  {
>  	lockdep_assert_held(&vm->lock);
> @@ -2644,42 +2632,16 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  	return err;
>  }
>  
> -static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> -			       struct xe_vma_op *op)
> +static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
> +		      struct xe_vma *vma, struct xe_vma_op *op)
>  {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> -	struct xe_bo *vbo;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
> -	vbo = xe_vma_bo(vma);
> -	if (vbo) {
> -		/*
> -		 * An unbind can drop the last reference to the BO and
> -		 * the BO is needed for ttm_eu_backoff_reservation so
> -		 * take a reference here.
> -		 */
> -		xe_bo_get(vbo);
> -
> -		if (!vbo->vm) {
> -			tv_bo.bo = &vbo->ttm;
> -			tv_bo.num_shared = 1;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -	}
> -
> -again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> -	if (err) {
> -		xe_bo_put(vbo);
> +	err = xe_vm_prepare_vma(exec, vma, 1);
> +	if (err)
>  		return err;
> -	}
>  
>  	xe_vm_assert_held(vm);
>  	xe_bo_assert_held(xe_vma_bo(vma));
> @@ -2758,17 +2720,36 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>  		XE_WARN_ON("NOT POSSIBLE");
>  	}
>  
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	if (err)
> +		trace_xe_vma_fail(vma);
> +
> +	return err;
> +}
> +
> +static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> +			       struct xe_vma_op *op)
> +{
> +	struct drm_exec exec;
> +	int err;
> +
> +retry_userptr:
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec) {
> +		err = op_execute(&exec, vm, vma, op);
> +		drm_exec_retry_on_contention(&exec);
> +		if (err)
> +			break;
> +	}
> +	drm_exec_fini(&exec);
> +
>  	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {

Not related to this patch but I think we can drop the userptr retry as
the exec loop or preempt rebind worker should catch this. It is redunant
to have it here.

Matt

>  		lockdep_assert_held_write(&vm->lock);
>  		err = xe_vma_userptr_pin_pages(vma);
>  		if (!err)
> -			goto again;
> -	}
> -	xe_bo_put(vbo);
> +			goto retry_userptr;
>  
> -	if (err)
>  		trace_xe_vma_fail(vma);
> +	}
>  
>  	return err;
>  }
> -- 
> 2.41.0
> 
