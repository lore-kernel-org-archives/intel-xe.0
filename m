Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D61EB8FAD
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 05:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053DD10E1DA;
	Wed,  6 Sep 2023 05:14:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB2410E1D5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693977252; x=1725513252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oMU/kGo2t1lbXfwwfiJ9c8qeckymNNkkQHv4Jgx30/M=;
 b=l+yvvYjxiQaZsv8KTzmt3ofntnHHNsia9afuri7DgWMARPilyW+hwcWr
 zwbZdlhAZh5C8Z9hX3oczi38IDdeDXY1If26fISKn/8HY1tWanRWrykrj
 FyNSLB2exG7+PzAEmFelqX/PNXsDt4e/l3GHbPAmIYsCO5lZvVmijAGFw
 RLcpQfG5I/Wz4+0FoaHyiO0iVdvgZTW+IvRd6OIWadYLwB/ZblYr8+hAW
 IcMLRT7M3i1yuG4JZldTiN4Tn4K/o91um+AMeD1hsMpILZm4TGUyI9pwZ
 8s7xJXDWtQWF7z0YqYKDxWotWRIJHFzMjXCD5meL/Ytkz97rG2BKvprDm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="374365378"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="374365378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 22:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="806874487"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="806874487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2023 22:14:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 5 Sep 2023 22:14:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 5 Sep 2023 22:14:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 5 Sep 2023 22:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdFmSaEQaOjnVK4kw+nWkgxqsU72otAKwSRNBSluAUNKBDrbbMJ+l/r3PR6l5eabrAmGtGFFkagvo8w7AKA0QDLn7s2UEo1yEi/sr4fqboCQ6wfzkkO+m0ZGxnVKVBPNbBdhXmWKzX+nYjHPJygyoGs8HaisvVXG20C+eCB6tpWxrb6fuTfPM7ZDsCYyc6HmfKVUN0Fc2xnK35FuLO/boIDF6DadF71hmnTevHIOzD7yXq32uV22FYkGHfquQsmxqiPX4G8ESN3T9WKH7K+QPHqLPK+SKJCCpHtye1oNGDKKQBJjFDIxH7mKpKEQLSvr8CQZRhYgKRVcYCBu2mIMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMAudnAjq7vsCbHKGLzL5Q91OqmCVoAJLZFwDXB97Do=;
 b=S6MkaB+969a83FpfUWQT6ha1Iqq3YYYDUq5VqL31TyNWTk0buEv1K+5nwyEh8wroaDNhieHuWllTuLSUhhAsyVXDEDKbW4mPqIWVDw2565Vxr88fwJS2erdPbffDL1Yar6tQPx6mnVLMLrKh6LY+bapl7xsvIjkq21mC825Ku49NCOqgGxbzbuGc/sk6Yc2eFpDH2lBIfsfvP7emuCbH8ezsPR+5FhNtGFhWDWwkDaB+aRfJLyU4FAz8aBbcrgeJeNLcBOC4tK0hj7/r6J6nCVuqQl3/4ZJvHJp+wKvhvIcEeaU6a0L8BsywBPOpfGGYTofN2ziWO0bXDwwMnknHbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 05:14:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 05:14:09 +0000
Date: Wed, 6 Sep 2023 05:12:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPgKUviWLPAz24Mj@DUT025-TGLU.fm.intel.com>
References: <20230901142629.4125-1-thomas.hellstrom@linux.intel.com>
 <20230901142629.4125-7-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230901142629.4125-7-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a47e658-7ea8-4656-1a85-08dbae981953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P/zagzXv3A+b/LbFTHWUrQTvobogaPxhpq9n+E2snE2sXpU/sfPOk4YEA+r07q9rbb75N2Q7dmlOCuxyJITW/qMtrHIw8L2OHOPcznyTsLFyelbRhtPvQKIolQSe3o1+8YB+OqtP3QFE5zFRfMicj0FcJ2MjsLSC++ny20Dv9jbEszvSdshkzf3cpog7MGvAhZ82tWkEhP/lNVzzcqRBEA5J9mJK1bA2u11HZAWsRJejOtzbXeNx49zQtXeFkArKpqXO6dYBNKgeEd+pyA+6q3cxtAo3dhD4WnQEbJGW3vBiz/dcztaiSLuBIc24rRaic82PAIHJSLQWZrM0YxZWLDiYmJbMGKY73NbWzx8Y29+DIxw84KSdbsTxuLypH+cWdCWXTFnsxttCM0RzPFAPWzJiiwB+vSv0sqnFPaAlk/i+6pNGxEdc7u+aCyMinQVT4Ds4g8rSNZSXpOlWatB9BGRriOsIIJBLZ+QtZGVwbOmDDr2q1oPgSEbdSjgmA70iFuguMkkDf08Hgjxx40FtSwx/aPybHG4kbYTU/VR2Gw0MGY5OAl7hUsMVtI6yuHLQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(1800799009)(186009)(451199024)(83380400001)(38100700002)(82960400001)(66574015)(2906002)(66476007)(66556008)(316002)(6512007)(41300700001)(6916009)(86362001)(66946007)(6486002)(6506007)(6666004)(478600001)(8676002)(8936002)(5660300002)(44832011)(4326008)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ooinrb1eNFLw4SX188ywoxdW1DoUJiB/quaees+h0C0DHv3puiFl8dnw4R?=
 =?iso-8859-1?Q?TDE5KJU6AcVFhmEuvS/TdZZBQI2kKq0a9G914r5CfeOLfTMWEBTyl+JP+6?=
 =?iso-8859-1?Q?742Qpc2P6fywq4fFUAyy39qqyWxg1tUbghxGWsHYysixfEbKNuqePYfn+X?=
 =?iso-8859-1?Q?OFt6d5BctYi+ILASBcQzq9D9VSdLSGaFlBiAj6+BVPq3G3nohVQhRsa3Us?=
 =?iso-8859-1?Q?uqm9SWY/VfMBAoTDmwx0+bRf2reCmzWOZOEfnt+AsYBBJkiq/SOJmMFXa1?=
 =?iso-8859-1?Q?O0V/Fjo/qW8bYAg155hWMxPiESXM5hbRHPZCnfb9tYODKGl1TXvaOhahlj?=
 =?iso-8859-1?Q?6xgWv6yZIkoH4sJyiFI1gPYZtO0US5ugFB/XE4HPyd4e7bEXdtiv/uyPfu?=
 =?iso-8859-1?Q?xGMf0cJrn60CljWlgktScADw7ZN5mbn9sSb1Sed1aeRKxXmA/MzGnZZ2Sf?=
 =?iso-8859-1?Q?bbji4efvbkd7ytL/fGtlH+P+g++ASlI7Loy+R193T59Zns3LrMiC8Y2gws?=
 =?iso-8859-1?Q?6GEQEEi3PjfgcFCvpQz5/T9a8mDBvwa/Yo+OlO3egudyEz/xIxDF3HrHuS?=
 =?iso-8859-1?Q?dgzqBCMfyrJxmE6Ob3ysuzhBpFj8p074crqBYWsHTODgUNWz24BYR5XTL9?=
 =?iso-8859-1?Q?VSc5cArpmHulVVpJ2NGtxvhiA1R8KPsGUUcERKKNOuyWA9P8g9cacB/UsX?=
 =?iso-8859-1?Q?zPlohIhRPIofPEydhhjVBPUnR2IV3RyTo+OW8gE+s/amqGG0LPbgpu8TAU?=
 =?iso-8859-1?Q?KVzjt7csqDMTldbqZdvfT+hJj5anml2JagvddyjyOBY91wx/2DnGnUMg3d?=
 =?iso-8859-1?Q?anGnzP/0YYh6AnV45EpNPKosUhdDEmF1HRPGZHvDXP4Jxeo1JODikMPfn8?=
 =?iso-8859-1?Q?w1wqNMZ1Qlaqo6QkGmaXpxsEcTIvK2uDli3XIubUfUhOzULTGgYObB3rwK?=
 =?iso-8859-1?Q?k/sGmzoMIzELK0L6LS+EX2jXLhYYCit1ucXW+uq+RuCEYC8C/fmkMtTD2o?=
 =?iso-8859-1?Q?ZzSGRVQs1n9o6Ki455UAT1FovUpK1ZC4ak9lUjIRwboQe228pGXMRAwO8N?=
 =?iso-8859-1?Q?K+6erygyPtiQgYxtCU83PoRNwIcxot9PeO/SEcb5tqbH4uR62RkZuFyj+a?=
 =?iso-8859-1?Q?GH1nVXF/t3+3PlC5qovwk5OuUpXj5l17KknvIfuyhOX/H3dAiMSayRXa+4?=
 =?iso-8859-1?Q?mIH34msyYYK1kQf5W//Pj1v8fTF2k9h4s47isOnla8uhOtXw/iclNIAtzx?=
 =?iso-8859-1?Q?gwcxQfBghCJKoxtxMrHdMw0OT1TdxxEbpjBDs/sVM5ZXo1N++xOfJWlU+K?=
 =?iso-8859-1?Q?0FpwYYoYWDY2ZLjdN5qoALWuRXf2qn1PgCqqa4W6BnEV1t4T9FW7cmRCSe?=
 =?iso-8859-1?Q?OPs/cJX051f7B5BGRh96MF4lkaHHHSLZ9a4tpHCj7zcS8K7eIKPXSflFHS?=
 =?iso-8859-1?Q?q5fX7I5uOdS0BpS2FEcwMgeQua5YmJ2c4I6oEOMaNdcDKM4zqQo+5ZkOQE?=
 =?iso-8859-1?Q?n2sE8QKTzVtzBzoAwLXGgd60/Enaa6a9YuzRsh9ZJIvY6PY1EmH+Y2Sy6x?=
 =?iso-8859-1?Q?EqKqet5bkpvMgS9NFAj8apRunwntgYAuns4KYf1K4kUORBRR3SrZxTVVN2?=
 =?iso-8859-1?Q?wGcoUWld6tK9QTRrZt0I6NZsfT2njuwPWH3Z16NJhvuTbDs/EkSsWrTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a47e658-7ea8-4656-1a85-08dbae981953
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 05:14:08.8997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJ9JsDw3UtLlE1zMlCjxQcopzaDtw2mOBI0/0y0jVignLeRHhCncRP29oWSNIBGuAcljcFyvzo/BFN/JexlA4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 6/6] drm/xe: Convert remaining instances
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

On Fri, Sep 01, 2023 at 04:26:29PM +0200, Thomas Hellström wrote:
> The VM_BIND functionality and vma destruction was locking
> potentially multiple dma_resv objects using the
> ttm_eu_reserve_buffers() function. Rework those to use the drm_exec
> helper, taking care that any calls to xe_bo_validate() ends up
> inside an unsealed locking transaction.
> 
> v4:
> - Remove an unbalanced xe_bo_put() (igt and Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 94 +++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d6179a46157a..031ac2843b4c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1119,29 +1119,20 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
> -	struct xe_bo *bo = xe_vma_bo(vma);
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
> -	if (bo)
> -		xe_bo_put(bo);
> +	drm_exec_fini(&exec);
>  }
>  
>  struct xe_vma *
> @@ -2155,12 +2146,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
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
> @@ -2661,42 +2646,16 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
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
> @@ -2775,17 +2734,36 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
