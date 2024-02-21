Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C3C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 21:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCF510E2AF;
	Wed, 21 Feb 2024 21:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnZ0A+zV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230F210E2AF
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 21:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708550020; x=1740086020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bV/Ot8DtmLIp+TtYfFHCHp89o5Cczs1jAKM+hPFUjvY=;
 b=bnZ0A+zVQATzcbTovVjmRgkI1rGTdulvKOs8df8dAQi/PLbUXHxNnVz4
 VRGkTfXNTHqlhSP3J2cdKmzJWeJPGNJQ2d3nxX0aq3yTNXhoGG//QBGUJ
 TpwauIrQt393JbxhBNoH4eJnHbker0abJ3EENWLJxA1kJ8VGpR5Ur87sZ
 2PdaWqITqBbrY0ViwCQ0CtjrWwRlMXJrZA7av6B+XVqCkhQ/MNeh6G2xe
 j/iX9mIlFI8NIBLl/2yQYVo19Z8DfEDAESxOY+DSURRqwQu4030TBct91
 dRzHvFnM4vDWo7/T+JG2Wh6NCAo3MRRSbMzloeAyHTOsLW2/H3eXw7zxy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13866157"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="13866157"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 13:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9934593"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 13:13:39 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:13:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 13:13:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 13:13:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 13:13:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jajAGcc9alB2FW9/XkNZog/470fOuO/6aJo88UZWHPsojbzOPtSbosPjJDnhboCxhNcfQpEHXOiuNIpv6czgl7amjIVayCjgqvWxMO7M5pyZM1rh2YPxNPDttC0DrdQIvnktAgqWkDZONhOyh0suwQmxje5cUZDDNKrUa/BzAP1YeYGEy4Pu6KezSq0NDs4DkjSsDaWce3vF4/rbHsOHYA+/hEOAEh9Gj6MmL/qsKMMRucmVpPUnVleQ+2JDEIfJCnceshBZodRjhlguVFJXXCjf925vkcvwBXg24tg1KNm08webq8ynjT+xKpnhdP1RUPEy8fbti6cZKHJJkKx7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHBJPgSJWvpxPfjUpFHbKtG/BkMYKTZPsyGKQWLxI4s=;
 b=LQcnP+OxaMJpNFYQpAChg4VzFryY2ozqcGM7qj/bsYK03diqEFhYtsCmEzER/XPvYFrQzD5cXZaCXqKVB4SQmXLI3Ed8RoZ7YCXRWR7pw/5wzv8IccSWUTUFom0kFbqyjxIkQRwesfvZLVLLvfl7DKAoPpjgpM+sBcYrrxCV9l5hdhhGjnZW0BKrLFvrylvTS99EG2NtMzyIdakI596W6/rJL8nMulSXHjjsCcFDP+fJrUucHTmpvCA+dcUqYcQOgmvMbmQJP0ImclaRbA6RVB735uxw67ft0s0gJBCR3aWJ+ttuyxqJHkoBLOOG3iudYdK44AXbu3mv3yoGzJQc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 21:13:35 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 21:13:35 +0000
Date: Wed, 21 Feb 2024 16:13:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add debug prints for skipping rebinds
Message-ID: <ZdZne68d1T0_v8Sz@intel.com>
References: <20240221032743.3698849-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221032743.3698849-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b352c7-7f99-417e-e22a-08dc3321f6ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yXwhcVuq/+zslFggbiSjeawa4aXPZriw3p4VfUM6Vaj8GdCd6R1PvE+ju907FKSp4Zy7CdZbAB6G4F3UCWTEsEQxoSENHLixR9rn9ZxHjh64mxEEmZoRs+8q7pXaatgABSfd7wLEn8sDqscwLAyhIB2kbGcR6Sd58LGhZQNHZ3Ruv+s5fTgxS/KLfWmbLvnu4uGxTcNTpaDfvtKLmMs4Ht38NxrhPP0ada/X9VuO7+ySDHOvWg0yKHoJ4P9b/gEgxIQfLXZKMeXp58zCB6dKGgELYHL8Jo+Vyh5ukfavWm5z1xuRp2IGbGyz7ZCHaqBEQtHiBWBKzDiJB4wPj/I5LWRuD41b/YAYdbbAgOsm/42e+BW/28AOsPFGw1gpvG4s2ZRYIbduYYaxtphBj2Fe12riMsfS5BrVC5WWCkoOzYfaM/49/OBq2gpya86e17wpPbuw5ESliAW+eXDGX/KtazdDiE3e5DiebuW+DokNu37gKSoFQUprwqfjQmaXOcN8HPZSuatp9z68K2YWZssEFlb80nZWAfcCKQv1Lo20so=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QemeLX7MXbU4rXkP08sdOkXO6QyQX5JCU/LfiaKAX9E5XZpQgCAWvy0QgRt+?=
 =?us-ascii?Q?RSf5PB4fxxflLCTK05/DhUwI6jeoqdZDVZGA5rEe7BpHJwOC300128c7edTT?=
 =?us-ascii?Q?dQVAno2334aUlH2C3NO7jb5+1otxWzOVJ2creJ/SaMsU75//ofXuwuSmOLZN?=
 =?us-ascii?Q?SalIFnLerRi6VyH1xjqYPNDKYOpdRBJGiVBMfgGMYBDv6WzBO85qoxgvyZdA?=
 =?us-ascii?Q?mYIU5Ib8lBELLLu/b11TOuoZqirRe4L8iy0lXPyhue3ucek6vqIxcFod89sB?=
 =?us-ascii?Q?0UcUTFrtc/vKAfN/S2+Xk3LDPBLmTnlO8xEPpTxAIjU4nPvLYT8ij5zjGGXn?=
 =?us-ascii?Q?RDusCDfTcw8rw2/shBycbOTv6IjhDRGe3Fwo6xp+faDVpMee6kATOSvr1bTB?=
 =?us-ascii?Q?fld4A4mEMfhMCIb3TI4h/gK4sSYKIyK2dmAqs66rOBQ7DWkgdSSmZcoMSrz1?=
 =?us-ascii?Q?c9gF1mO24WiexCoJ11VB89qpZ8Yr3LPrPO3YgsjmWrF+44nxUffV/LGIUecd?=
 =?us-ascii?Q?wj/BQDEP7RmVv5Ht3fUVB6ZfuOupak73vo9kD+fSZ5Jxq+isuodr3fM0xcbz?=
 =?us-ascii?Q?5v0Rg4JLxrPwe4Mi53LTFTAeB+DELJGayUfUGaaWCwU9Zji3NcIo8HECZU7O?=
 =?us-ascii?Q?gNZEqYXTQX52RoD2yGpgjJguFeCKJl5FmdPp66yw2uAVjnzE2MePV4NNeeO/?=
 =?us-ascii?Q?4C7/pR+Mal4NiyTB6XEutRQ8WX4OWhWvW94P0kEwnWry8r+jT1kjqffIeu8y?=
 =?us-ascii?Q?ZOWMMIqu1B2H+s/qFe2m4DSWaW9emU9thHou8kP1I8FKPWmpyHbycjarFShC?=
 =?us-ascii?Q?W9geyjVLK7fil75hFqF2SBmcNjrwDyVI9IKm00dRK5O7O4hX9qKyKrxzMbOX?=
 =?us-ascii?Q?IkTvaMGB2TSOj/oSRmTLslbCHsmMLHyjaCTusR/aXfMeipju7W0tdsvIJC+l?=
 =?us-ascii?Q?2XwF20iu8cPv1jD+mlpejo/Z7D61wDJCRZQfhdPX96JQ1NNNVpN6fuMblK9e?=
 =?us-ascii?Q?KJysYZe6Ku4foGqLvNOknD969twDkWrJRiwr9olNVcCd6xK+z/9yI3r1CK6o?=
 =?us-ascii?Q?g2XffkLvFqZErPOS5ZvR9vy4ZRprs32nnHONWOFlsRuY1K9yytGTBVns2Cs2?=
 =?us-ascii?Q?eZY8L43UoEw9r1RbpJrKyTFE9cG+BOMD7XAuEaqGy2TfuTIw+AsZOm/tuoxK?=
 =?us-ascii?Q?E3uoYYGOgd02b/pWypzHcZeC0Qt6rfy8+Eq5qoiXXAcMpb4fLx+pgQHk4r3m?=
 =?us-ascii?Q?8lTqWieBJPr6X75sVEOi0gMkbFfz7KAuSkiifF8iKCDiKvQ44aRYavkT0PuO?=
 =?us-ascii?Q?Q0MTAgwP5vhJx5dR7EXs8CaRMZc5UVrFm9DPsD6UlTxy1tQ4XXA/cbOm0MWw?=
 =?us-ascii?Q?z/TCWbhJuF041VNi8Luz0Sfg4yuwAHkT7fSqYSWsaWNw/LZolSbJSvN90qYk?=
 =?us-ascii?Q?yfJXvFJS8920ZupKzPp8PKwEq81/OPcfhXUyGhThDK7VPqXjBAGBncJACyoY?=
 =?us-ascii?Q?YN5Iv8l8K5gxgkJ+k+bM93Xbv9U6Bahl4jWi2OZ89a+9NGgXfPuiwuXCsUGe?=
 =?us-ascii?Q?3p/VCqUJz6akqt5omcneeuIN8cxa4KN0Zq7dhRqEKnnVBuntq+Rd7ckn2e1t?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b352c7-7f99-417e-e22a-08dc3321f6ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:13:35.1315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fw2pSfj+CZm8CQ9kp1a2gDCP+IU8iBLvGF5FJ7dp+ciVowk1BYv0W/P2NNolt1/Y67uBaTh1lYC/PAj44Us4YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

On Tue, Feb 20, 2024 at 07:27:43PM -0800, Matthew Brost wrote:
> Will help debug issues with VM binds.

worth adding more cases?

anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 23a44ef85aa4..bf040df0d02b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2287,6 +2287,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  				   struct xe_sync_entry *syncs, u32 num_syncs,
>  				   struct list_head *ops_list, bool last)
>  {
> +	struct xe_device *xe = vm->xe;
>  	struct xe_vma_op *last_op = NULL;
>  	struct drm_gpuva_op *__op;
>  	int err = 0;
> @@ -2362,6 +2363,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  						xe_vma_end(vma) -
>  						xe_vma_start(old);
>  					op->remap.start = xe_vma_end(vma);
> +					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
> +					       (ULL)op->remap.start,
> +					       (ULL)op->remap.range);
>  				}
>  			}
>  
> @@ -2392,6 +2396,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					op->remap.range -=
>  						xe_vma_end(old) -
>  						xe_vma_start(vma);
> +					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
> +					       (ULL)op->remap.start,
> +					       (ULL)op->remap.range);
>  				}
>  			}
>  			break;
> -- 
> 2.34.1
> 
