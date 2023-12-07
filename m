Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A1C10DCE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 19:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32B510E96E;
	Thu,  7 Dec 2023 19:39:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430A10E96E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701977993; x=1733513993;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mO369mhk+x/lN1PjeALd68nSIdZGm5GOuRA2GEHqGZc=;
 b=W4nmx58AmAiVD4tJy1rtpOJRmrr9qnhKFqroal9UaTB/JC06gDb3Fp0x
 CUKUqiFhJGn0SNy9bEecZLjl/24ljPn9kz/Dj0lZkzINgmr/x+P+G/g61
 SesOzxHIPuNDKtU2RPYgKG6nwCizinMH+YYclFmT0XELC5VqYvIZiZkgJ
 p7kdxxUua6jHK74q+lB3gk+MYU3W+WSWck9Uu+nAyNMGy61jFAVki4kPO
 6wvw+LDNwRF8w7CBbuxHj/Mn9s7iQI81uuKVes/CmqHRbLwjbKN9W+lAc
 yqniY3Lhx9s6AddHC0/CGm0SJh2hM/Pa8LnlfartwtRgbZXJECWANhPoC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460775886"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="460775886"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 11:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="765214758"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="765214758"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 11:39:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 11:39:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 11:39:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 11:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaezcjCaMYZ+sD0OoIQJAMbMfLAkf63GQ5oOaxmb/VLOvyJrMT2gkqFh8tFa5CqueLvR1ivJijx8YYTMzBGbEmDmrbcKdY+cLyCVmkamXtAbxzK50slBMWa94J3hRx6PVn+t+npjB+KIaE33phQFDiAcaIiMxjDh9jHZos/3S+wp9uHtMFK+vcHkZWYFKv8HqpArGiblpFkMlYEVROhyLR/yxZCVIwfonFy6zKToqhwcoMTz0KbXFghYsXYv5ZLErae59E04hPDDiLA9E7N2AzoypOBozPG4Nok1etwJCiC3dLWjxkj2RcltXstcN+5FS6EVWOD495vqq/b/iExElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3APgTChBSuCySkyntRmsHhZjlg6UnRNjJRnvPeFkmE=;
 b=gUFdJ5CAZk81Iebdk5hf/iy6CLG+9qYEkbZGwN+LZH804S7c6ud5MukAesmKp4MjXM0VdLH6gfoB3LBbJCfJZS/oeKynBeczk8k0mZ5tVwCZa1CkLX7Tdyg+w5iHsUo20DCySWai9Gy6S9/FzS+ix4ovfdGnPopIgIb4ZbpGrKej1ZIOwNMuULGda3eiGqlpmr00+fgIn4twtJ5Tb8edsAn311rgZFutaNLoXeFr2mrp6eGqZGHhYmOSVT7h8BOSjOAPfslay1QfQB1AdZFUzmmj+EVxJ+Fiht/19dTyy5XeiRI2jFh9h7/rAWocoL0CC8x85vIOVPpnPDK75ws83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 19:39:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 19:39:46 +0000
Date: Thu, 7 Dec 2023 12:38:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 15/16] drm/xe: Adjust to commit "drm/gpuvm: add an
 abstraction for a VM/BO combination"
Message-ID: <ZXG82vYroZewhAJI@DUT025-TGLU.fm.intel.com>
References: <20231207141157.26014-1-thomas.hellstrom@linux.intel.com>
 <20231207141157.26014-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231207141157.26014-16-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0072.namprd02.prod.outlook.com
 (2603:10b6:a03:54::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 00df9661-dc9e-43e6-50a9-08dbf75c445a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcfEV2E5+4Q7jlpO/uQuI0NlROUyd7E+/SQxkP+WRnJxPd1bUUSJsZiqPYQxPbYQkJPpqcphHBw2vls+Dz7+46PmJ1OiRUr/KlER+YLOyWlVYZ6EkgYrMUskZch1sQwZtcv79giC1AbuzaXWdv1ARfHqnON5U+OkGJHUgf+cdnBU2kgYdVjNSLNyMR11sRpzYQ4CjbSvVf4aq3GxG5bVG1JW9p4A5q8K2fJfjh3eYUFQ31lz8aSNSipIYizfhRp5uv87IQfwvAbmKfqaDLIHW/6XzrCQtvNyaGjxzO8IUSxhbu5WfPtke6pXWsH4nVO6cTznu6OerouROOT/Hw8smeTWvaX3+M6wWwSWy20CKd1nGgkEu3TTn1b5B/tn0AKxlmuXOq0yF42r/ySjbymA3HP6RJSqzxkSaZnTwB+sFP9Gm5QTGi/YIlc/REVEn2xleqMvnpn9ZL0nFvnh4SRiviQEwuIrBQOpKEztToV3UGOVfUMajXwHaYUD6FXaodA3BoMk5r3d/AtdMm400UAMzOoEjb2WWGAyKwL4RJXiPnU8+ws0v3uZ0n/C4b+OCinZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82960400001)(2906002)(83380400001)(41300700001)(38100700002)(66574015)(26005)(5660300002)(6506007)(6512007)(6666004)(44832011)(86362001)(6486002)(478600001)(4326008)(8936002)(66476007)(8676002)(316002)(6916009)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NQsT3G81chG4zyMVfqKieePKxQZodnhJWaQ7Mk1Kg5w+noKaOrfZSxWxm4?=
 =?iso-8859-1?Q?62d1xD3sFDdUETK0KDhuCdFuonjv/Izw9Ri/d3Si+v8GyOCanb47aIzDUc?=
 =?iso-8859-1?Q?YA6dmhrnJzDaiQjsODFKvxOMce9XDOkXmvF/6ZENPb435KEBpJzpgVWv6/?=
 =?iso-8859-1?Q?fowA7Tk7e0VdSqELTn2+qVfar2S4GQoP1Z4UKRmlSc2i+ZFxkFh+OEYH5N?=
 =?iso-8859-1?Q?q44k4840tWQvmc3PWICAPvK/q3Hqxm3PQiTMy3J5Mm/ZQb3u6G1DmZS7HA?=
 =?iso-8859-1?Q?mU8Uw5lUCEW2+erRBq7OOYY5690NphiYsU5vY+WqV+zOTM6AZbkdiA1FfM?=
 =?iso-8859-1?Q?IyfVH4TXmSaiIN3eBe3ZCUuy9LVVtPNxrYd6pCqbuWp/BQSL4eeNdMuokg?=
 =?iso-8859-1?Q?XAMqgaf22xWSsgruhtDNPFcnWIaqSVF60csYJMlD2kyPTeYVUD8WnqcX41?=
 =?iso-8859-1?Q?h9SHpe00CYuGqLrhBK0CPchjXo6i4hDfVSoil09ov4vQ77rY1cBw2rf1Qw?=
 =?iso-8859-1?Q?GLl7aT3H15xUDsgKXh0NMFw65CTGxx3LJezYACtYdIVlL5mzdOYKDjRoFc?=
 =?iso-8859-1?Q?CgK2ZxcuJuqQXauCMHPSpvj4mQ4iz/RLeSyCHO2X4ApFhmEImvV9l9GDQO?=
 =?iso-8859-1?Q?MqpDLgOTPm2P1bYEWbpNjWe/f7dJA34GBvq3uBVLAWpqHxsouWPwEH/WzF?=
 =?iso-8859-1?Q?FVHcYvHlualov21LXezC/Pc0p0/H1WMvoq8OH35pCRzVs2G0OQeRvurc8K?=
 =?iso-8859-1?Q?aOWbl7rMohZeAZ9pQi0LJhz5vZuu+OX68iNZZKe1q0bkynZntNbHdtA0Ae?=
 =?iso-8859-1?Q?QyPS7zARx4+4RzB0OnTIxZMH9er8u3u3ZOdTAPamnc2IgYhKTagNtvI01+?=
 =?iso-8859-1?Q?V4pwz22hQ6/8WJa224fELmBLrYMJSgeY41/g4VS4P7HeRKGZDUxwL/y2gb?=
 =?iso-8859-1?Q?W/dL9Csi/+YpjHAm4oyNR8P80BnvH68DpYugSF/6gyro9IwznOkE+mBgQk?=
 =?iso-8859-1?Q?0X4jCT0yKXWwHlKciqAHL3O0XunrjPGZDhuMdegvOI6lVdXoo4FK6ROb96?=
 =?iso-8859-1?Q?omNExrVppO7W9q4FHSIOIGxk06QV7wsJH6s1gwG76TxjLDMWvyNMzyXqbO?=
 =?iso-8859-1?Q?NMb7dO4qo3cSEXCg4aD8sEdDTsBCCaHnpufKROtF8Glq/Q2psA04kEuFzC?=
 =?iso-8859-1?Q?PPpVsAaVs1Sa727XYpA1aMZf7eN2s8Sn8+B2qbsx5ZjJwZNrRKecgj7wmC?=
 =?iso-8859-1?Q?hwccsw/a+btcHxKBmGW+cukwTS2f5qIQV461jldRzI+zlP5ba1cpQ0J9wS?=
 =?iso-8859-1?Q?IgOJFfvMP8XUxH38SzJosjBPUC3jEERPApQdeJM3OM3QF+iVGucmosR4oW?=
 =?iso-8859-1?Q?rsquH3/0SrzXo+N0xboDOI7+IAFfvzDpXIsdB/8iEmb+edWdDL1ujc0jE4?=
 =?iso-8859-1?Q?F6kIDuSEdjEnfjO8jv+Fd2oOUIKS1nK/FkX4Nc+b7xykEtIRsZy5vgZJ/3?=
 =?iso-8859-1?Q?NkA764ypA3US2He1cn6WA5GiNgXygfrySSiaTX9Rndbhlw0eoMBv4Y9Gno?=
 =?iso-8859-1?Q?J5zRurRwBDl7aDrl9zaClLhGLi8vXLNCwNjzQbz5kiDrjbKjLU0mK+OAcw?=
 =?iso-8859-1?Q?X7W8uomF6A1YpPjXPhFbdr6MieqDw/grvtiJbQgKv8nYXOAne0s3rOyg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00df9661-dc9e-43e6-50a9-08dbf75c445a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 19:39:46.0188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVBSuHYz/GQXNwecIOZ5JQ6HmBHUoGAAd8HsT0bGnyh/t9iJhSZsfPq/7hCMOfWfJ9XcycXlW6fLTuJT60UyFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
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

The indentation looks incorrect here.

Everything else looks correct.

Matt


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
