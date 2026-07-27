Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC3DC531D0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jul 2026 14:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18E410E426;
	Mon, 27 Jul 2026 14:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfGYQSK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9B910E426
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jul 2026 14:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785162844; x=1816698844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=opydKlFwwzl355PawnpJgATCPKJcrdwfaeO1tuAE8TM=;
 b=mfGYQSK0lsXpqTxSZtyj9LGKyIljCD25C3OAIcRprGG7VKJ19C7ngyD4
 WtAPSg3ThFilcBgN1QukWzie09Ie3gcArZWWcxbfNxdzFDfue4g/gisge
 slS9hKRBLBSzCR7ZdPXrRXELDxVO7HLP+Q108fX4H/uu5opXU/83ke/r4
 ECLXQtMwVYsHMSuBOFpJfYOdqLepzFmjv7f8tRzOJ/J2HEiDS5BC6U9RD
 yeorGypOP61CdmPocgncFZaxrK69rvue1FgqDQEiWeTzKYqG87FpjuICf
 asxVXw+nKeToCAiAt0Z7S+QfJVpixjszZh1cN0JNSIEIwA5szueSo49g6 Q==;
X-CSE-ConnectionGUID: NaC7lDQCRNWzsb3QGcRqzQ==
X-CSE-MsgGUID: F0e/1LMlQ/G6O1i/OS7RGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85742086"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="85742086"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:34:04 -0700
X-CSE-ConnectionGUID: 2d4b6gx9Tr2FbSKFPO58KA==
X-CSE-MsgGUID: J8Gn4l7LTSCGRagm5yUFcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259490327"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 07:34:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 07:34:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 07:34:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 07:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWBZ+i0APNUlzv69ccQQvAtUv2zCb16kG30xzwTHsApJUBSoX8Vd/4olXBDY6y4zAXi7cr0uLFwYS/NrQ6G/4vRRD7dcqqBChDVCN1glPYizuUS5JSNWTT7lG7B90NFu6RM2sMkdGx3Gb9rAdb3rPoELG0MesMpeIBgL6BdkdrgqVEBTYUU3py3jZV7jT9GNc704/ZvWxO533ImtO+oNS4e3eR5WS8OUcenKubjwROF0YOn1K/tL3c8uJ8y10vlZ+MLVaVxAelqwrxe50jErs4pNTuMR4/Dp2nqKWUUwUIkotNQCJrKfPMIth9hhvYKjxk0k/q1V36KWDQjK2viraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTFg4rpDVApHqLxRlT3bsyEe2S7k/wAf9i/wW6gwdpc=;
 b=guzR6uuhBuMnL3U3U5QR7irV7SRqnS8TXDLbPUgw2TZkF0eN5zjcoP1pZ/exCmxcJD4nPi4zufDBfAOa0mxgvrxeS5qHySzdMnIOJEQ3AMAGFdv9yy09JWnRWQeCA41rd2s+jfRb20TXOPjT8fSebY3ABc61B4JLiTJz5tJM1tZ+MWr6SFAs7hsWd/DHRDNFAnl+2veQUY9X8zY8J/CyQYNSkXMVjyMlAbPTB3htZyJuk+0ziRXy9Yh7Obwb1TrccYVxx0SFo7wnPFfZEkTArzyQJXH1aZ7F9Z5R73mv/d52WMJnff7U2wkJLmF2jGaQaGrKCmUiqjetiMluRFXkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB9534.namprd11.prod.outlook.com (2603:10b6:510:39f::22)
 by MW5PR11MB5809.namprd11.prod.outlook.com (2603:10b6:303:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:34:00 +0000
Received: from PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266]) by PH8PR11MB9534.namprd11.prod.outlook.com
 ([fe80::16ca:6958:c9e9:a266%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 14:34:00 +0000
Date: Mon, 27 Jul 2026 16:33:34 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v8 02/12] drm/xe: Allow prefetch-only VM bind IOCTLs to
 use VM read lock
Message-ID: <amdsNThu4aiGrg-A@fdugast-desk>
References: <20260724232601.1753977-1-matthew.brost@intel.com>
 <20260724232601.1753977-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260724232601.1753977-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) To PH8PR11MB9534.namprd11.prod.outlook.com
 (2603:10b6:510:39f::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB9534:EE_|MW5PR11MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a2d20d-c66a-452c-ddf6-08deebec197c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mpIdM+zRqKwq9O8cQQshyVrj69EfS2ycS/tKwZFZO5h0Cg59pUK/NLKfkGG1C8wyWWqXDo3NB2XV92TzYsjo4ngrsHVefZSrvFeRFGae3I/OscsrG6QJJLtjqyf9cmp4o4onrp3h+p2OA5f+677eNTHQ3vFoz70Ts7ficZMk0Ka2H/zx1A51rZ66AqBIDHj9s1RIh1ufz5Twhfuxvq2IQd7qG8tNqX6ELXUywM5YpP7R2ySorIGns2tgjEul/PFxf/Vhtszx6T3UyVxU0HLPaAeznQOeHLnaTlin7fSbgiTMdew5bhEHCeiHmhPzfYJWDXA3gvk/2xrbdftGbWuakkKH+XLYqxmQ657o5OJb3gMI1pvzIA2wCQblX6aEJlJAtmYLrqnVtO4bCuNdjl170ba/2K6UEWURxcCTz+I2XksRDgatqifU77AT7yLJdva4DUdQkg9AuUs+1uSIQKudtREpUTjHdkXtGlYUt5fqp/3rXEkHZJoCIiOb932ncyHsqqVontbGOm+PS1gV01iqwB4NjeAVfq+0x3H2wVKRBonobX8r62wuwHqPSlx058e7V+9ZIEWgrbaDgJDuN3p2Rf/Hz+mAtRZ2c6GE4H8RNqBvMLifVd5wG63RbBRddfy3fulaCvw+W73sr2z++V4iHVcL9zWayZjy+IFn6F+loMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB9534.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qbGSPnm1OiN4qeeIa7oikRWtFV3Lsyglrga9ILd1xy/YyWyf+R5b80Y0pN08?=
 =?us-ascii?Q?39vvpy+NQE40rQBXMjvB/StXHh/IQu5e0Is67qzxYRCdpOMNeSnW6wpl6PI5?=
 =?us-ascii?Q?ie251UVSPu4eyWlTUH4WgGuD5k6oLMLxCzWa3YAbyBCtf+qvBMyG9LjqSVOp?=
 =?us-ascii?Q?ZGMwPzesy2kP/ipQMqxQrm8FCUF3zVegC3ru/+vpF1MILLC9getbK5iw+3Ri?=
 =?us-ascii?Q?nW4ETHqSsek9ljaeTOTyxhqoXME30Cl1vfAdwC+ehAywcy455OochW7Wk9hf?=
 =?us-ascii?Q?VYUhnjkmSfCPDXTky/TuBZXu0fINnpmfoowXIOSEDvFCNW6pSYKBUmdwPrDn?=
 =?us-ascii?Q?t2+CjDMCqcA04mhCk2lKrodQTCQJ6AwABms6pTstz+y9Uue178AUrABJ+3NM?=
 =?us-ascii?Q?X8kdliIkgD8A6JM+uEcYrtqyyk67YBCYZOUm/vqUE9vJEB1k9GhWf3sQWlyM?=
 =?us-ascii?Q?piiW5KgOmfaGjUodoTtROPEnEFehICSLBN8Vly9C5pPtRnP5TgFZ7jgT5Qfl?=
 =?us-ascii?Q?Y30zUUok1MafGOp1HCMyykKX6/D5eMZlbLrriWF9Dg2KgYbLTVbSKSzIMeLU?=
 =?us-ascii?Q?a3y4sLgiSm1yAW9igFs3VELfDOKhhS8+SKH4BwZdZu8UEv6zPOJtRKhNONrK?=
 =?us-ascii?Q?tYPKABnIQtemzo0DoMnBjArI4E0OxvBE8e+7KFNsQl5/RirdjDwgxHGHL2WN?=
 =?us-ascii?Q?juSCE3kOfj5i0jQWJmCcVSljJcLNEipqvnf2Df1qG8D+MldiMj3Z0n87BkhB?=
 =?us-ascii?Q?9XpD2aLyUk8n3rPRMDIr9K2Jxysz1FnaTwFdYVf/Zda4ekeKHCag6Bp5KNr4?=
 =?us-ascii?Q?BbtlgTBxxoBrsApMkhGHPU7Kly6Es0OhUaghdmyTgPAiWJ5sjdxNxaL4ZGTC?=
 =?us-ascii?Q?H7niGBXjksCihsV3kA5YMFDFqjZIhxV46WBQKOfm6z/e78p2mg63BxE66Wfe?=
 =?us-ascii?Q?L8DddsUmd2HBJO5yEc6rEozbqcrhbujRzDxQL76xLOlwm6rWfttW8I1+vxH6?=
 =?us-ascii?Q?snASpGXXgwVi2rf8UQB0S+jlMwCUv9H9/9p8oUnvE3iRl9sih392qc2WfDTK?=
 =?us-ascii?Q?KrvUn7TVfbvj2rsGUR74nOOjPkzYmTmS+vSJ9HavwN7ApfX7ziRnyxQc0ACt?=
 =?us-ascii?Q?eAbznfWex1ehdiTLzYQ18cuA29NXLjmzYu/+ocoEAItrsZLjQaGjiB9F6jze?=
 =?us-ascii?Q?6QtjhY+bJ3qKQMtIuz19QklLOKkmSnFYuJEl9AGd8pSSSSUk+oiEuUxf0aMN?=
 =?us-ascii?Q?g2Pv2hWC6crMFrZKNJQLhfX7IZPkJ4UvTtyt8Qw2keDXxAqqQzTNKqJggiq1?=
 =?us-ascii?Q?Np5ZQmglwzYVoLt02bx4oiWe4qveoHcQwM+RQ27MmKwvsNN51sRpT8+yox7K?=
 =?us-ascii?Q?mMxZnOSlTxj2I9CkPpDJYTfAu7ZafWkUq4pEyacI+BKUvYImLn4vTXDF31s1?=
 =?us-ascii?Q?lqj59GlCqEF8rcHDrGEPYTxtCOzMHnzT+ANtouKm0+f+HLFJ2IQcjfre8MJu?=
 =?us-ascii?Q?jJ8ZFN1XtdMgo5fa/J/ZN/hOqvHvLcoITXdEofAom0ewuWcahKfiuXOf6MQ8?=
 =?us-ascii?Q?5XsXZLHWaZxOaj5xNqfELRLGoxK8xuFKQOb/n9A+lIqQCoX6Xpy82w1/I1RL?=
 =?us-ascii?Q?DkgdEHB7sCZZLTkbf23G2g0F6nAUHiqLbjPw5pPDilbJ/NIXJDQBnW40jWJa?=
 =?us-ascii?Q?Rwclxfz0sR1e9ntLySnnAsHl19ZndSE4jXeMv1MZ1nwxiyHEkGwFMMp0P6FG?=
 =?us-ascii?Q?taid3VCXPXaecBbk+z/ueJ9SabKiOug=3D?=
X-Exchange-RoutingPolicyChecked: EnmXsds0nnE+fgwBvEaEwlEzP9NFKhqC1or0waRsBF2QFv+1y7rDYquC8gRHLx7bdYSF0JcP95U61jNfT8gfAdR31V2xJ3uJ/kznGOwmxxyTatp1qyjKkYx3ZiTnA/gxO7kk4f9l4YbmUXhtqrerhQg0HsDHiuff+pVZRxtTisB3TyyH39q/q4tu0cYLFZcnvpg3txJSJthWUiSsQUiVnxwUd8O01dyyzSfJPOEn0uOGRO/qJNG4Yn2D6S0xO2bHj1dl/Wiu2Xn4GalxmJDb7DEyn9FMsPYgEuaRxfLEwJhXCOFPOudtt2fz7pSI8blxtgvudrvj4G6L40HO+Z3jIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a2d20d-c66a-452c-ddf6-08deebec197c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB9534.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:34:00.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtUhYE8ILsj3qTNsmEmzrS2Gtsz+0TP1gqstqb73Szd8QZS/x1YIV8w0747of5oW6Gj8M9kiYwM/rjhnjPMN2jU1rU4WRlVGxI/KwRaQ14s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5809
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

On Fri, Jul 24, 2026 at 04:25:51PM -0700, Matthew Brost wrote:
> Prefetch-only VM bind IOCTLs do not modify VMAs or use userptr pages.
> Downgrade vm->lock to read mode once setup is complete.
> 
> Lays the groundwork for prefetch IOCTLs to use threaded migration.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 36 +++++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c064bff842fd..d7e6644df4bc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2451,10 +2451,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			.map.gem.offset = bo_offset_or_userptr,
>  		};
>  
> +		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
>  		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>  		break;
>  	}
>  	case DRM_XE_VM_BIND_OP_UNMAP:
> +		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
>  		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>  		break;
>  	case DRM_XE_VM_BIND_OP_PREFETCH:
> @@ -2463,6 +2465,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
>  		xe_assert(vm->xe, bo);
>  
> +		vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
>  		err = xe_bo_lock(bo, true);
>  		if (err)
>  			return ERR_PTR(err);
> @@ -2523,6 +2526,9 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  			u8 id, tile_mask = 0;
>  			u32 i;
>  
> +			if (xe_vma_is_userptr(vma))
> +				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
> +
>  			if (!xe_vma_is_cpu_addr_mirror(vma)) {
>  				op->prefetch.region = prefetch_region;
>  				continue;
> @@ -2708,10 +2714,12 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  {
>  	int err = 0;
>  
> -	xe_vm_assert_write_mode_or_garbage_collector(vm);
> +	lockdep_assert_held(&vm->lock);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		err |= xe_vm_insert_vma(vm, op->map.vma);
>  		if (!err)
>  			op->flags |= XE_VMA_OP_COMMITTED;
> @@ -2721,6 +2729,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  		u8 tile_present =
>  			gpuva_to_vma(op->base.remap.unmap->va)->tile_present;
>  
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
>  				 true);
>  		op->flags |= XE_VMA_OP_COMMITTED;
> @@ -2755,6 +2765,8 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  		break;
>  	}
>  	case DRM_GPUVA_OP_UNMAP:
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
>  		op->flags |= XE_VMA_OP_COMMITTED;
>  		break;
> @@ -2979,10 +2991,12 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			     bool post_commit, bool prev_post_commit,
>  			     bool next_post_commit)
>  {
> -	xe_vm_assert_write_mode_or_garbage_collector(vm);
> +	lockdep_assert_held(&vm->lock);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		if (op->map.vma) {
>  			prep_vma_destroy(vm, op->map.vma, post_commit);
>  			xe_vma_destroy_unlocked(op->map.vma);
> @@ -2992,6 +3006,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		if (vma) {
>  			xe_svm_notifier_lock(vm);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> @@ -3005,6 +3021,8 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
>  
> +		xe_vm_assert_write_mode_or_garbage_collector(vm);
> +
>  		if (op->remap.prev) {
>  			prep_vma_destroy(vm, op->remap.prev, prev_post_commit);
>  			xe_vma_destroy_unlocked(op->remap.prev);
> @@ -3589,7 +3607,7 @@ static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  	struct dma_fence *fence;
>  	int err = 0;
>  
> -	lockdep_assert_held_write(&vm->lock);
> +	lockdep_assert_held(&vm->lock);
>  
>  	xe_validation_guard(&ctx, &vm->xe->val, &exec,
>  			    ((struct xe_val_flags) {
> @@ -3912,7 +3930,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	u32 num_syncs, num_ufence = 0;
>  	struct xe_sync_entry *syncs = NULL;
>  	struct drm_xe_vm_bind_op *bind_ops = NULL;
> -	struct xe_vma_ops vops;
> +	struct xe_vma_ops vops = { .flags = 0, };
>  	struct dma_fence *fence;
>  	int err;
>  	int i;
> @@ -4087,6 +4105,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto unwind_ops;
>  	}
>  
> +	if (!(vops.flags & XE_VMA_OPS_FLAG_MODIFIES_GPUVA)) {
> +		vops.flags |= XE_VMA_OPS_FLAG_DOWNGRADE_LOCK;
> +		downgrade_write(&vm->lock);
> +	}
> +
>  	err = xe_vma_ops_alloc(&vops, args->num_binds > 1);
>  	if (err)
>  		goto unwind_ops;
> @@ -4123,7 +4146,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  free_bos:
>  	kvfree(bos);
>  release_vm_lock:
> -	up_write(&vm->lock);
> +	if (vops.flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK)
> +		up_read(&vm->lock);
> +	else
> +		up_write(&vm->lock);
>  put_exec_queue:
>  	if (q)
>  		xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index b94eb018d532..2f5f74fed9d2 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -561,6 +561,8 @@ struct xe_vma_ops {
>  #define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
>  #define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
>  #define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
> +#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
> +#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
>  	u32 flags;
>  #ifdef TEST_VM_OPS_ERROR
>  	/** @inject_error: inject error to test error handling */
> -- 
> 2.34.1
> 
