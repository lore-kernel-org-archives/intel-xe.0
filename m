Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5A2C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DB110E067;
	Thu,  7 Dec 2023 19:10:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B22A10E067
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701976216; x=1733512216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C5PestBMeH8O7cHPGyMxk+b2SgBA2Lwr5i20epfZfoc=;
 b=QBxwL9r50dEBnS/WS8NrYGgMUO39s58bmOM2V/vClUE82/IjOAzgn5cr
 stT2b3T5jFBqlvk8Kvt4KGPhBTJHnLFpBdGlw9IPIDGsOrC1UGH018CFU
 0FXwDf0EQA3QMEPI/9xJ1PbApx/TFMRCdqf9r7R6nY+qWtrfqCcOSnVzz
 rruKnu97Nrg+Kdzx+O1bgFDToBF5rZ/kvitWOG4aEVBGEd/PBw2vyUOu9
 bNHVHcjHtPuOjpgeZ8GOCEg0Y1RGiBK6DWMy3hfQJz1HUqI4x9QSZbqW6
 NP8rW2AHzXEiBl/q5TIdqeYdDgLayklWryTV9AKTwPdTU0CtcocHT8KnM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="374457130"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="374457130"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 11:10:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748067584"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="748067584"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 11:10:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:10:08 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:10:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 11:10:08 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 11:10:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNKjU26ItosOy4s5eoRQUlwP2EnnU90fyG8tgqKIZX5wFM+cfFYoR/NIM+CK3wfkem0k/mLlaubwoEQkOD0mvB7g61VkUqZV2B6GOqNu/n21zkUbHcIORS9XmsjuMA3eCnzjkkwfYJjiDXBypI9VC5mKv/fTa8GnA3c3a8F8oZ0fKRzWd8YdbGWrggyLR4X0vHmr0TPjV7r+e2R7wqCOxvWpXAhFRm22P06j/lLv+n/Q75a/VuDj3PCr/Uh1BZc19an/xDGq6VkEULmgmRFuojzB6UelH5+ygMRPGRdM/77wbEWeNbIeh0LuTQLr1uT4zEvWor2G5qtVvnjSOyZrtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJU/Cwx94Q/iyGrxqLsnhuCWekPSr3GWAj81/pM2nXA=;
 b=PzMhDfabdX2R1ZSYuakesSI6D7WZRuqfloOh2yv7mzyp9aKqbpHFacOCJrpXxs9kGucrvBBJboOA8+YTtVrphdf7Q5aauKex00Bk3zX/VwTiKJizlAoC4WmMqO3TfOY2wunfk0s4KroNBS1QJL/DuUpl+sVcUmX7cIqGErFWFLNV9QE9+EXnC50v6Lxei0ru6CqvQk8TYjos7xsWQbzZMPZAx1eZY5xsyUmYWOuKg2Dvv6eAlqzwUe3sIi1X/VZd41WhHyunDOWXekb7kV1PrjGI35ympY5z4KvqNf6KGrwYQSWJNZY55Xx8HINkwv5g7TgmNG88SZXybgcWMg7jEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 19:09:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 19:09:59 +0000
Date: Thu, 7 Dec 2023 14:09:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 15/16] drm/xe: Adjust to commit "drm/gpuvm: add an
 abstraction for a VM/BO combination"
Message-ID: <ZXIYgzTbujbv4cFD@intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
 <20231207141157.26014-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207141157.26014-16-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b172524-402e-458d-1549-08dbf7581b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 13QhBlClyBuXqQIUoB60TfBKvJzakUdwGG+TEGqsbNBIsn/1O3VjN26PzBIAS2V5Hrh4j2WBUq34wFP87EJUQUszaFP/kIhblyOZZockTXqCyeKs0shyNyDhNVSmQz4gx/2ygsWull/iOtVOUCYkDxc6cErSnPdn6m5SVPnD+Pt74cp5qgCvbj4LSDtPHj2n2njkYu7EJv/3BXHtImQa+kx1miOcmjmd599L/y+xOPu4MzKVwXDVhuXtXOXEFM7VfTXhC1bveDISU2kqppq12WhkyhGlBJqNUDKlWkdy0GyHn+/N2iJYfyNTReP5E+nYHqvBfZWiGRolak9LtDEOy77npuE2glWnINoAbHcJVTtIa2df4/f5TS6s3hu9MXe3yZ3Jzx4T0PlwH1mrpKCxkk2o/h9UAgUdmUOaAxpO+wzv039VW0M9zTUxPocBLSy0ezJm1EvlebSfP+KpTektRWAgyKJnvCSaQtyVCojNJGgdJ+jGP4BUBgF8og0ffOEFLwJjf+o3Jq0c+AT+PVRCdbXVWXO4wXtRbIIF/pTdtFjm8OVWZAZ7qwzL+x4rewSU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2616005)(6512007)(66574015)(26005)(83380400001)(6916009)(66556008)(478600001)(66476007)(316002)(66946007)(6486002)(6506007)(5660300002)(6666004)(44832011)(82960400001)(38100700002)(2906002)(36756003)(41300700001)(8936002)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IDUosaMpyOPuWEuoUpgGovsx0Y6U5zHi/1GzYV+cHvEWGT3SwMUmlD9mMz?=
 =?iso-8859-1?Q?i9QyiZEXJPqAy8yEisiivTUTL83bLVqhy5ULbbVaYdXE4vWuME3ltJOtI8?=
 =?iso-8859-1?Q?RSmDytt9YCSDWPUBKLYPBM8MqafDdR1bU6nPbS5+Ms0a1ioNH2ygKGh6BW?=
 =?iso-8859-1?Q?7epgu0KLcVtGXxyy96T69Gq2n7WykQUFo7pA7EBpr9qDLM2+udIJsznpMO?=
 =?iso-8859-1?Q?xgx2UxFZS0ymXK7CAnMFwU9IvIye9TPSik9t0OWkQqxt29OIIlnepdKdzQ?=
 =?iso-8859-1?Q?OsGZvkF4mFZIwSsZN3sQz+zlkbwWl7acMBAsBnHCR3Gp4O1pTwNzUVTt2d?=
 =?iso-8859-1?Q?IOsFRnElkuruZW6COGwydnGo5f1BNFenCxLQEjNgS5xsSfwRJOwiexqu3a?=
 =?iso-8859-1?Q?5sTtbFjiyRvntrDp8t9AEDsXb72VyZ4ou3Uyf2LDx+E42nrnPvCC0qOGad?=
 =?iso-8859-1?Q?XAndI+8NqZFIf3mwCAVcblfO+1OjLscDGbOtPkZe2HiuiQgRVbbRLrb+6J?=
 =?iso-8859-1?Q?VryZ+zZ8l7hD5NO1cx11Tu1Uiy//qBTZyzivRdKU6n/Q9OEEoyrAXOi6Gn?=
 =?iso-8859-1?Q?kJWSJLkn7Dkh6O+phi0F8UYVQgDKWbMX1b+1OUP4cggw1uNjVaQeFKvZMC?=
 =?iso-8859-1?Q?Pjlpu92auWNk1rrNUl28StspHeWVER7gngbtRBhMxX778EMWD4C9krAW7X?=
 =?iso-8859-1?Q?BDHMeE6vZ+rWV8d2bKI50RTJcQvv/pO4/NT6ELpymjFe/oxUxjiI3uEuHs?=
 =?iso-8859-1?Q?WcNT6swrfobcw2ktaIbJR4yW4VOTeNi8E0lejNB8yVwuZKb9maJhabxnor?=
 =?iso-8859-1?Q?Y5ThaNQvjSiGNKQ7sLQiC/xEtV/W4DctFPSytFmRYrbyOCU3MFP4ghSugt?=
 =?iso-8859-1?Q?WrDNez99CtByh5YA/SFLRLZ2eils/e7KCYNSm7/VmFOXHNxrS0jwep3o7h?=
 =?iso-8859-1?Q?hsrdDG5jWdKzM9HyV+Ag7XFLWsdG1vXBSxPQr40OtyD5dHyWJQ1mHFFOPB?=
 =?iso-8859-1?Q?9IMDuwoArTkTtnyy/gg9Hjr/nkxq8AudXQxQn+t0gOt0JEnXlqTAndp3lK?=
 =?iso-8859-1?Q?Ek5DJu8r04oFLRFvibIGpI2DVANrz6z7cth2sQ9foT54ky4qPfMJ8TLJN+?=
 =?iso-8859-1?Q?ehX0f0iH+bePmz9Eb5YfKnJy41sa1YeA5CfEn97FM7NomT+Sc2cfC5ON0E?=
 =?iso-8859-1?Q?s8wO0hGl6V5A1CAYnd7EZFv8G/beinsynvr+9QG/uL9MRMqCXJvZwr4o7e?=
 =?iso-8859-1?Q?fx+TKbHLOH45DwIsqFxOVzEqV5WQts4UnTdAodK4ZvL2k+cKuM30fj5G/O?=
 =?iso-8859-1?Q?SzlXapiLrX4SY/7DEn5RHNc9dLlQFXbSZ8pjBUrDgdoBAURLP+tnsbCQHz?=
 =?iso-8859-1?Q?2fy2iAaLuZWJ1V+yJXb59NkyNbsmyfUlE6I0O/UzPu40ycAh0Yi6FCV4CN?=
 =?iso-8859-1?Q?8j303VAVQeHY67GIN2bjEdAgklaG9uh63LPx+vw2p/iZlpEfDQ82/GinVF?=
 =?iso-8859-1?Q?PBPRVTLMcoUUXeQZEkflEz3PBoYAJSrsxe5rwEIXS8D7gTy+dycxo1qAnv?=
 =?iso-8859-1?Q?vnf+sNUSxX1yFpUM9Y5KmFA40JgVIuyzEktn92aDetV30ujuA7ikyYvLbq?=
 =?iso-8859-1?Q?wKE9ac6CQi5lyj2S6VANphb9Bff5rtysv/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b172524-402e-458d-1549-08dbf7581b18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 19:09:58.9545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v82aF/eN0lVXBQ/mFkNE9aq3oHjNl4I7ArgtNSR+LZuBceRkIHNQs5LDKdACel8SmX6ppnUKeeOKmZsoXfs+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


likely a fixup only to ecb7ffab6760 ("drm/xe: Port Xe to GPUVA")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

On Thu, Dec 07, 2023 at 03:11:55PM +0100, Thomas Hellström wrote:
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 11 +++++++----
>  drivers/gpu/drm/xe/xe_vm.c | 33 ++++++++++++++++++++++++++-------
>  2 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index ad9d8793db3e..7e25c8b7a01a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -470,6 +470,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  	struct dma_fence *fence;
>  	struct drm_gpuva *gpuva;
>  	struct drm_gem_object *obj = &bo->ttm.base;
> +	struct drm_gpuvm_bo *vm_bo;
>  	int ret = 0;
>  
>  	dma_resv_assert_held(bo->ttm.base.resv);
> @@ -482,11 +483,12 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  		dma_resv_iter_end(&cursor);
>  	}
>  
> -	drm_gem_for_each_gpuva(gpuva, obj) {
> -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> -		struct xe_vm *vm = xe_vma_vm(vma);
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
> +			struct xe_vm *vm = xe_vma_vm(vma);
>  
> -		trace_xe_vma_evict(vma);
> +			trace_xe_vma_evict(vma);
>  
>  		if (xe_vm_in_fault_mode(vm)) {
>  			/* Wait for pending binds / unbinds. */
> @@ -540,6 +542,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>  			if (vm_resv_locked)
>  				dma_resv_unlock(xe_vm_resv(vm));
>  		}
> +		}
>  	}
>  
>  	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6c8a84026af4..f71285e8ef10 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -911,12 +911,21 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->pat_index = pat_index;
>  
>  	if (bo) {
> +		struct drm_gpuvm_bo *vm_bo;
> +
>  		xe_bo_assert_held(bo);
>  
> +		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> +		if (IS_ERR(vm_bo)) {
> +			kfree(vma);
> +			return ERR_CAST(vm_bo);
> +		}
> +
>  		drm_gem_object_get(&bo->ttm.base);
>  		vma->gpuva.gem.obj = &bo->ttm.base;
>  		vma->gpuva.gem.offset = bo_offset_or_userptr;
> -		drm_gpuva_link(&vma->gpuva);
> +		drm_gpuva_link(&vma->gpuva, vm_bo);
> +		drm_gpuvm_bo_put(vm_bo);
>  	} else /* userptr or null */ {
>  		if (!is_null) {
>  			u64 size = end - start + 1;
> @@ -998,16 +1007,19 @@ static struct xe_vma *
>  bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
>  			    struct xe_vma *ignore)
>  {
> -	struct drm_gpuva *gpuva;
> +	struct drm_gpuvm_bo *vm_bo;
> +	struct drm_gpuva *va;
>  	struct drm_gem_object *obj = &bo->ttm.base;
>  
>  	xe_bo_assert_held(bo);
>  
> -	drm_gem_for_each_gpuva(gpuva, obj) {
> -		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
> +		drm_gpuvm_bo_for_each_va(va, vm_bo) {
> +			struct xe_vma *vma = gpuva_to_vma(va);
>  
> -		if (vma != ignore && xe_vma_vm(vma) == vm)
> -			return vma;
> +			if (vma != ignore && xe_vma_vm(vma) == vm)
> +				return vma;
> +		}
>  	}
>  
>  	return NULL;
> @@ -2156,6 +2168,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct xe_vma_op *op;
> +	struct drm_gpuvm_bo *vm_bo;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2183,7 +2196,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return ERR_PTR(err);
> -		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
> +
> +		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
> +		if (!vm_bo)
> +			break;
> +
> +		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
> +		drm_gpuvm_bo_put(vm_bo);
>  		xe_bo_unlock(bo);
>  		break;
>  	default:
> -- 
> 2.42.0
> 
