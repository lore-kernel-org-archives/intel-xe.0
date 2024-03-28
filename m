Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57466CD1284
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C358910E357;
	Thu, 28 Mar 2024 16:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHtgGPoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9010E357
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711645142; x=1743181142;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SwKe6isARQpBe4XBrgmIFJC2ZlR0wH1MdoI3chLNXe0=;
 b=PHtgGPoSy040it7UHFxXlaN/zWonkxkr21Xtn35C5n1CzzInpphaGts8
 TDvDUWoGmmVFncuHn5yo5cvcnzCaRCKgGqrwd9QRssPYzXqCmc+SQuKLY
 j0Buc2uloVytAXmKikGrl4LbBPGgUAD0Y1XI3YVAHFghFeYWuVfxFCgUj
 IxrOnaWbK8mjbbrDSx1BVYbEcDVN0H5nvNaW4z4MUdSm3G6mFsqh8fcI+
 mDZ1eV84//1poiFwByqNI7TdIfLo2UrSDsxh8AH42dic8SN6/I7aLedC2
 JVko34P8GluGYZNzKKbJFh6c5SzJAyJ6pzGAhbDGy4q1Kwv5mycmcw6hu A==;
X-CSE-ConnectionGUID: 7o8Cj2nBQheusa0d0tkOQg==
X-CSE-MsgGUID: Mu5Zt/8oQkOm5cItPjJ27Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7415668"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7415668"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="39860051"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 09:59:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 09:59:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 09:58:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 09:58:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 09:58:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LueTbIwQMMnl3XltIiUEWG2a40aLice1ul7SgtJMz2pm5RfPo9rV3sgcIzZJ7sQh/9+VuV4s0q+DkWVMn5vdnI0D65qE7ChaP3Oscm8pjFcFxafwlH6wiyHW7QpCBQRJNalg4DONERiBhby0K86cTanNPVCPJBxsrJpW/EKyHGCA7U86fUrjowfW2Q2mUul5XJWquhSRwXZLp1O3R/vbRlWVsRTWU0/D23J2h8STpuajtjByZ61cRorc2bmEX3Xpo058utGkdqufDXztICNZQhdOGEPEHd7GTZ7vUuQyhcMKWGZqfm4qSF6Iw9ruf3rNUC+eE0vU1fLhtFsSR/sMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Xy+rOTdDGJ6b0tyB8NVT1/WxNS/4UH11H9QRCUQesc=;
 b=MXAAJxLLypvyvglLhIMVYRZRnaIzL88CxaxIZd1ljgCCZdatC1GMWoEt27A5XP00l/nS1ZLIfwpWw7BOh0gL6S4yqqyF1OdNVryMV/Q79KpiBaV0e5YhIB1qUSc5Y2Ce2BQg5nezwjX2dvEetd26g2dHpOLe//gCPbh+KOr+fwzwhP9FcgrRTg56jq53g+uLBT7BjjMNczpGcvYU7KEaBjHtie2bALbGDs2AIgo3o1eImtCnAnhrPaQkDTGmUMSXcOmjQioFyhxSp99Ck7bBzR7AGNbXoqGYc1Zc4L+SvIf688O7U4zmgS/0DdWzzBc08DgPruQw9c3QOE8425mb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6741.namprd11.prod.outlook.com (2603:10b6:a03:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 16:58:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 16:58:57 +0000
Date: Thu, 28 Mar 2024 17:00:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mateusz Jablonski
 <mateusz.jablonski@intel.com>, Michal Mrozek <michal.mrozek@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY
 and VM_BIND_FLAG_IMMEDIATE
Message-ID: <ZgWiGejixyevimsF@DUT025-TGLU.fm.intel.com>
References: <20240328143742.7-1-francois.dugast@intel.com>
 <20240328143742.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240328143742.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef01acc-3a83-49b0-cb32-08dc4f485ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: osytLkjWRkSIuMBR0BDUiQbuJQj64PRq7pq/T4XHEnig/iMs27hr6okiCwC4soe3KAxfC9N9NLNDbvxK1suKds1qOm1Kv1a70IFQ/WXBcAohbLWBBCs5eQ2OJXhI3+pbA+O6CjGUcTddb/ubh5HrPyf91lBLJcjoD/yR0ip1GkMWVWsGh1y0kSXuADaGFq/bvlzmUkC/q4AERkLMNGJYvwHjG7TlfoTjxCj5e7k6Mjk6m2pMfCSQBWA0KCTeTv3heySRIdiWruAhuA6zoOM1DdAJDmwIYUSx1wtGpJBBJHsW98G1RsYmag6WW2QcWaStlE4e5QiDofcdBV4uJYRnDT4nKLoFMpOsWWAA4gu2mFvJVk8AUVy+A0pfnUbZuU4wtBO8EfECw7Xpwy2p4CKdxC/jo7/8U/0orukwcmPR93pN8x55ghU3ioEwTgftEB2WTHCIvhEBy6i1YCubjKCADtlSxWplsoBSn31EpbpdrPaFA+Y5pYuwo//8DHBT3PTNxKgrALzU4nRcCM+pZSl/McpSUu9cAy6kd9MOs+vfQnAeii8myXLzVTlQw/7HYVHSc8hM8Cu6HxuBGElzIPklLGwrZ0vA0shPQyDMJjX/Zu92+jWmmQqLetUkzQNIXD3Q8WG1cdZQyAkqbr/AQ+kRJJD/hzElAjY4pUtNY8DxbW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m5Nuuk3J35Lc44ZDD+4ffvrW6YHOhs0k6K0pLv6maKrTk/9we9I9EY0L8mU6?=
 =?us-ascii?Q?3fMoYE3fapAKF6DXsSZfLEBOTRvyXasHvwE8bxBQIH1j+BD9RS26BBEheNI3?=
 =?us-ascii?Q?6aw2K4oSL4FWMZbtlp50i90JtOOiya5Ebg3SEpgI/Z2Yqbp0C8INdXQYcHBo?=
 =?us-ascii?Q?NV5Nf1+tDjsD/Sb5Yh5wDQKNIguF6G5K00kT1rnu5TFkqaVHMQqu68WqX3ox?=
 =?us-ascii?Q?R6NBzQn9YAM7U++MRkFKGpcA9KLWg1u33nwF32phnlIMljLXsGBfgBErs05E?=
 =?us-ascii?Q?g+7FHzgsp8cXL1mr11MKRjcTl38VvNt+nAzg0szlY9gzhDjOLDBGtq7F2pIG?=
 =?us-ascii?Q?FS+aRMw+p2kszpw2/0vyLG5Kmbvdg9r9PbqytOOcDd0BuEAIbNAM/GUKljdv?=
 =?us-ascii?Q?rxeT/2LlJ4V0yGey0U8QjESM+l8FVIN+EiaseoupUlER3MPGXN2HRvwzYoNs?=
 =?us-ascii?Q?0/KLx3MZK6umd2GKiLYssXn+Oy2gFaJgTrqiAlArBe4KNfcN8fl7Q8whxg8c?=
 =?us-ascii?Q?i8ep6NJjJOkIf0zvs97HPOH2sVQMF5WQpsU6hYPkf68b2dYUw6wYcKNWvrZ+?=
 =?us-ascii?Q?o10jD2UztCfo4lm74KU7JVS7U+PeKX3VXN5RNbFKnYoL49ZdZhVxvWJxiQbm?=
 =?us-ascii?Q?fbXlggqDYNTh+nYLN9M4h1wK3pT/KOeVpvdvRquCmhPMdVflTmPpkDmaUZqx?=
 =?us-ascii?Q?4Na3pKz0/BEa2eGtkVzrkSVI20lpN8wZ7ygfxBVWO+aGTxykBK0v62qk7HbH?=
 =?us-ascii?Q?n836CtZsNITvdDyTasOcsWSUVCyebQPHue5vATvGCANVPnx7qMnfwYPOHIJY?=
 =?us-ascii?Q?ripPaXobjPVW00RAhL61h+J7tShIHl8VRert2Tt860W+i0Oq2525E2LnJ7rz?=
 =?us-ascii?Q?du+x7N1dUPS59aOgLP9gTSqQ7DcvZdSzXzbz5u3hC95k9UzcgWOtYUkUya65?=
 =?us-ascii?Q?OxKu6Fl7AmPGRC6wddpf5KDIlu+qXdSqCpQD+BIUvnki3shQX0KAgmt+CW2C?=
 =?us-ascii?Q?N0zdIJ7y9BnXIjDM/qdHX1V1plxHbapBEwI6vu43w418fUa3pNr+uzTP6+Zw?=
 =?us-ascii?Q?UOK8QxGJtPQJlnaNx7RDRvjmEFBx0RX1Ec2zRDV9mfZ6RZXeCslaxT8T3KOx?=
 =?us-ascii?Q?N1DOuO6uXoXucd+Ko7RUwMDhCpp3qay2t2vwpwjrxxVFPl3yxmw4epBYVNO0?=
 =?us-ascii?Q?QHclbwM5QlGMKaSOrr+XeKFVsj2uIkX9yHzekyRL6SXCJAaIhLEiVB5vGokt?=
 =?us-ascii?Q?SMytbptMtITd3nZ2Enkbz4uW5YN9zv8eYKZppBVJurDhaEAfRCgOz/Pa0v4w?=
 =?us-ascii?Q?FttU0AESOWvuFtdXSWAFzdW2/4QF9dG0botbokP3MbobSLAmcYIVkaQzupv3?=
 =?us-ascii?Q?548tVAwtB9QzXfTw+30ducgkP6/C9ReohwYEeiIaID5frmaOVIDFfR6n24Y1?=
 =?us-ascii?Q?C4X00/zUsZWsuMvzjnh+A+A2LYBDVe2u5AZH8Lc4y93xNbnspDctggI80dr2?=
 =?us-ascii?Q?UG4tW9Ecaogy1OvqrXhUfN8HWBSwGMf+Mirc8960XEa/0on+jmFCwriFGcxy?=
 =?us-ascii?Q?yz8ENNG2jS8EOdCsUo3dpon3LpjgSEgO3SL08A2SosPcUde0MA4B/D3QATTl?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef01acc-3a83-49b0-cb32-08dc4f485ba5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 16:58:57.4939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N074tccZWNnjaS+KtBtJ4veXUXsNrqHAfTQQLbauaXJUzgvRsnmcVjgRj9dXNKxsoongg4Cbg1UlUWuvyiuNJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6741
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 28, 2024 at 02:37:42PM +0000, Francois Dugast wrote:
> The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
> reverted. At the time, flags not used by user space were removed during
> some cleanup. There is now a need for flags DRM_XE_VM_BIND_FLAG_READONLY
> and DRM_XE_VM_BIND_FLAG_IMMEDIATE by the compute runtime, so they are
> brought back.
> 

I'd include the link to PR in the commit message too so it will be
included in the log directly.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com> 

> Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
> Cc: Michal Mrozek <michal.mrozek@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
>  include/uapi/drm/xe_drm.h        |  6 ++++++
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8b32aa5003df..6e56b9a3985b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2212,6 +2212,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>  
>  		if (__op->op == DRM_GPUVA_OP_MAP) {
> +			op->map.immediate =
> +				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
> +			op->map.read_only =
> +				flags & DRM_XE_VM_BIND_FLAG_READONLY;
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> @@ -2406,6 +2410,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> +			flags |= op->map.read_only ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
>  				VMA_CREATE_FLAG_IS_NULL : 0;
>  			flags |= op->map.dumpable ?
> @@ -2550,7 +2556,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_MAP:
>  		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>  				 op->syncs, op->num_syncs,
> -				 !xe_vm_in_fault_mode(vm),
> +				 op->map.immediate || !xe_vm_in_fault_mode(vm),
>  				 op->flags & XE_VMA_OP_FIRST,
>  				 op->flags & XE_VMA_OP_LAST);
>  		break;
> @@ -2825,7 +2831,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	return 0;
>  }
>  
> -#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
> +#define SUPPORTED_FLAGS	\
> +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> +	 DRM_XE_VM_BIND_FLAG_NULL | \
>  	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
>  #define XE_64K_PAGE_MASK 0xffffull
>  #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index badf3945083d..0447c79c40a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -276,6 +276,10 @@ struct xe_vm {
>  struct xe_vma_op_map {
>  	/** @vma: VMA to map */
>  	struct xe_vma *vma;
> +	/** @immediate: Immediate bind */
> +	bool immediate;
> +	/** @read_only: Read only */
> +	bool read_only;
>  	/** @is_null: is NULL binding */
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 808ad1c308ec..94e1f3cfe705 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -871,6 +871,10 @@ struct drm_xe_vm_destroy {
>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>   *
>   * and the @flags can be:
> + *  - %DRM_XE_VM_BIND_FLAG_READONLY
> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
> + *    MAP operation immediately rather than deferring the MAP to the page
> + *    fault handler.
>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>   *    tables are setup with a special bit which indicates writes are
>   *    dropped and all reads return zero. In the future, the NULL flags
> @@ -963,6 +967,8 @@ struct drm_xe_vm_bind_op {
>  	/** @op: Bind operation to perform */
>  	__u32 op;
>  
> +#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>  #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>  #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>  	/** @flags: Bind flags */
> -- 
> 2.34.1
> 
