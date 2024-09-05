Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFBFCD5BB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 19:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34AA10E16E;
	Thu,  5 Sep 2024 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgV5ibA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F75F10E16E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725565082; x=1757101082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z3N8i4vmODsFPkk/vwiJvDkMCmq1IeI8dKH/VgKMDuo=;
 b=BgV5ibA8tAszfrG4qes4CadP5dHQM15aI8PZMhDc50Guq920Xzvzw12b
 RjxRWo/PO0zhzm+UhtbsoYzPrRzC3VRnjSVz8BBhqrj81KSq1ASXForzm
 Ryw0/XDuWA1IaMvFX/oktUhEu7BvaGg09lalxZWf051NjaKvUyztiPEyf
 RYQeqpOR4FwqIiRTqQN6883B9z/G18Z1CougaIP0/7TsLlTAegQTmr3IO
 V9Qz2zgkfPEfkm9dXK7E3kj7q2wy47EhFb8CtqzTxagUu2D2Pzvig8eY6
 0bsyc9C+m7t0EdulGBglt3ul33Cp5MvF9zOpGKbNUsMvbJYTbXMEewp7K g==;
X-CSE-ConnectionGUID: /l81OjXtSuqCmvlZnydM+Q==
X-CSE-MsgGUID: eMXDl1RXRleaWBwhizsf0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28193503"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="28193503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 12:38:02 -0700
X-CSE-ConnectionGUID: I+u0lOp6TXuA+sBpMR4qwg==
X-CSE-MsgGUID: ATrtS23ZQhyKK539Sysihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="70520566"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 12:38:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:38:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 12:38:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 12:38:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 12:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtXZpiJ4iY1sjJq2I0Ln8/TCBQc59OvWtd9+tdBNTawfRWsnNXvk//xUtwMj5MKPksterMEB6biRsyeehe5qICkLcenpJ3u5vAYNY4EE/6BDdUcgpw0Xu50QLsIbkP0lk2Krco41a6oN++iRWRoluXO9ynjX9qSMJFyCqOoGNopaoEs6YvSJgdo04LHHtiVX4LdLE5IY/8EB6V65U6FZsa7X2HOcMfcMBEv50G2uT3SmyU3zT+kQ6dm3Ri3AXd9Z8x4y+vY8BcMSYizUQbb4FYkG6UztYW9QwZULpTDtuerlbeqYQtMFMT11wH/No6akRneHW6IdNGX3Wb9mxJY1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvQ3LHYK9yFsMdZ1VmCdJzfCEhJ5W/JD8TJ+s72B4N0=;
 b=SE7YftDYlkzhzTqd/8DxeuMOUHg9Kc0+Mxpwn1KlxKTQiCKZAIwv7LahYGhp+9N7yn08L6DCi5hxCsTt87hAa5kmTbigqvuCnMbBnFdaxd4Olb4AATEF6lzhNhCC3NmCkn6XW1jq7pdiyvZn+dEx4FGHkSNS1aulSNcD5R+DwgV+tAXXF80CFDraOh0zIArXmqrNXl1vpta+sBTs9VJmnBk7eaCB7FP1q3y5ez5iY4eKZQKmpzMkcOYcRytzea4ubCozZm478CatrfqKKbe53k9a9MvEiq96+AovFt/1jNiqV/9p9gHgH9hiHNACLamdK/R7Dx7dg8mHy8qNBGfC5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB4840.namprd11.prod.outlook.com (2603:10b6:510:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 19:37:58 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 19:37:58 +0000
Date: Thu, 5 Sep 2024 15:37:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call
 xe_force_wake_put if xe_force_wake_get succeds
Message-ID: <ZtoIk-OUD7qkBvKn@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: c4098e58-5f35-4006-788a-08dccde23eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BGSdf9YUUp/2JM5Bt2xaOyq5eqg4kgp2Oy9RccMTyICDeZS/1vmkBdGDYAJO?=
 =?us-ascii?Q?UVI/HtRngpLT8oLHPBSYmRFMvxYs8HVZ6mI4tfRaPTIcydHfj6f3E87PeErS?=
 =?us-ascii?Q?AeiNonItfi/N+4I6om/OD04yHpg4FIWMvUKsJBdsEO1fBrFhTlFTUhZbgnlx?=
 =?us-ascii?Q?Z4dIceRnKN2EHDfdfb7CpSuAjVFxhIJMGfInUVFcZNwFU7AGSLQkj3JAMKZf?=
 =?us-ascii?Q?QjUmpXSje+jEegFgtajdp7AuDN/Y647X5EtYonibU+dYVkUTQc9dAj67Grc1?=
 =?us-ascii?Q?FZ3AwupWv3f7GGp018OlbwpY5w+yke87DYozDl22/fNmWqOXiwIiVnQHZExm?=
 =?us-ascii?Q?XMCA4l99ezE3HZbteu66oTcPoSrTwZBnnFJOVzs6K9ova/jTSL38i4+WoGS+?=
 =?us-ascii?Q?igqgcUUfaU61BSdF2YMg7JycHZuIuB59e5R8KxD1qKIesuLfLh+FeMuPmaUU?=
 =?us-ascii?Q?dlwR1Ul9kYHg6EQeAyLN6d3ZyH3Wp6v7AcjcPExcNEWJnATqX0rMq3njH/J7?=
 =?us-ascii?Q?iOxT8MDGcG35IJLeWdU6Fr07DlciOZlHdYCJT9RaxlPAUqckU/vWeuDvnyNe?=
 =?us-ascii?Q?/2Zo1nfWaFQX2csGLCvNylpueF5vjDwV7xgDRhUP2MuVer3ef4j0PpYBje24?=
 =?us-ascii?Q?02skMVTSwZhtunjEkDtWatjulHQRv9ivEaXPsSWXr0w6mLjZ2fIWZaI23smu?=
 =?us-ascii?Q?k749nLhznIe+XLm2kcI6pvEWlA3+oq8vQ2EQE8VidZ7ce/KdxLZICskHWMSF?=
 =?us-ascii?Q?BygIRqZGOdzAt96H1u4F9++iaAPN/gbkk25hagaImJpPef/mip6ArDlxue90?=
 =?us-ascii?Q?0qcErrh8yiPAaXhhBba1EtxWpMKSoPxWmDSlYNb4siXfGKiHmpvfl+1ZQtog?=
 =?us-ascii?Q?GkRFVYlTqcC+w2znKkFuONFUHEHVkkmdS5BYajZyLzMgoBp9XUb+1R3ZCcyA?=
 =?us-ascii?Q?OIeLJUj4UHSPt3J91UzSCsaXyydJVTDzgVr1gLnBO2ED0BcYY9NBFEeC/PlY?=
 =?us-ascii?Q?AltJvmP6m4A4KWtKvysfXla56ZBUhggaBoYab3VfiZmqOk3E5rPh7850oxge?=
 =?us-ascii?Q?F42h8Hv/Zp8RAkmWEFQPuEi+MmDJK844Pwu321uCgcNqRgMU+WZifGDSn6l9?=
 =?us-ascii?Q?S3dvCMW4hX8GHjHQG1ZWWEzc942MUJy0v3+X/m9uFwWecbV1fcmtzkaOOXN/?=
 =?us-ascii?Q?LfTAEPvccaJ50k1UbYJapjndTC9uSnSam/V+liqgTNq1BM3m/9Zm8uoWJZjw?=
 =?us-ascii?Q?DZ6lCEHp+dR/caq7KcIW0MwzI7c4SNY2THNUNbCJ3W+FAEe/xehqoPyqcyeH?=
 =?us-ascii?Q?KXEOfnLSIl8Wc4cpOJSd/9CII2ycat9ROYcEQ5U7gcSB9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HpbpYgZK7bNjBuRMvcQXh9N96AC75FI18U6f5NDYrKVgRKwhTKkdx8pNHXQs?=
 =?us-ascii?Q?0eFQwW3PYH1yEXw+XScJUypp72qeGntlqZt3ErxODh8dAUIj2AlBCe38CsRz?=
 =?us-ascii?Q?mh/JE4vr9Ar1oWgnFv46Q48fUDX5TBTQUl/LlSYzOFcL4wZBZPggeqVgI4vQ?=
 =?us-ascii?Q?HgwTUf0OBiP0nJQkupMd6eTiOzS2vhsrsG1sP+/ELLmX8WsPu1ppHLrkiRav?=
 =?us-ascii?Q?XnH5rQvMz+Ad82swhtNEfvb5nD7O8GO/YHkYemWhzJkybnmSdKIGRzS8fN87?=
 =?us-ascii?Q?aVC06s2paDI8LjeOmRHe+sJ2iOlnXDPfDOWpWcsJCkzHHSs6rEkudEthffnC?=
 =?us-ascii?Q?FkJieFh5RGSfj8MUK2nKCKfMzVL8e2bByJ/fRORS4c+zzvH6Sx/N7Gz+Ciuq?=
 =?us-ascii?Q?2iDGRAyta3Od5zOUGuFF6TCWR4DLGuMHkCluxXAJwVu2+tlPutdJUpbGm/ej?=
 =?us-ascii?Q?F/s7rm/0qSUvIsORRl/qai/EUDDUN7TtwIOI0GFHQKJg5Cpr64BvPbCdYkBZ?=
 =?us-ascii?Q?iWhodbhZZeA+GQXUlffiGjQPuQx90guI7GnopwDQriFFDVzs3Nr2npxKntaD?=
 =?us-ascii?Q?6+BGPiTknHFrGLjI0CemTvR+jOXMGwdGhjPNMihwBhPrFuX4Ru3Ux5fGQj3b?=
 =?us-ascii?Q?AT3wli20dCquuGXcWk+eycondTS0b1pn/tKUvoG+QZkaUuA2NT7qmZXAgcHk?=
 =?us-ascii?Q?r81FGXlR0CnIccuQU6WOmHZRCGGE2HRE3B5kpqpLI7rxf6pf8OifbuCAdDl5?=
 =?us-ascii?Q?5m28xmzdJDY1lw6KrPeDTpyYmWUOzHxU7oTb7SReYY6Eh4evDszDicocbHte?=
 =?us-ascii?Q?etNTvL1jC+4W4JcqV+bM5vKBBsHEVVkS/yhG9edbAi4DhZNCGS0tPHS2wY70?=
 =?us-ascii?Q?Lxmegw+0KKFa2Io6iztv86+cQiGroTiX7GTiy5jz0T/wfTCik3n2cicZuDuL?=
 =?us-ascii?Q?PTpdoVvpMV4HsxD45k2s8xpnsnsHguXxoqYjDCD0NCiqQU+eIuGadBpFixx5?=
 =?us-ascii?Q?gd3Fin1HNJGIZHuFi65hDFzsF+/9VQzQWzJptnoDdoSsi69ss+Pv/Vtw0pND?=
 =?us-ascii?Q?+YLb+/hHrJaUX9djhsa4A4cpTi1KP9Oty8XpvW6WwKi6Kb3PyC0GE8ohEbdQ?=
 =?us-ascii?Q?ZUFO80snejZHLenXrRqnS5ucphrVWDmctA2nK+5iMoV5sDuT35369C55WuU3?=
 =?us-ascii?Q?DqZHUANokKB+qmvbDIgXNiHVjGPvYvpw+rF3JqZXL0suqQneXMzKXfjbczua?=
 =?us-ascii?Q?ltlhLyDY07Y/omj9LIOBSEuRh1Zket0snbnXOhGPlG2gkUe3KR73JxVsYpzR?=
 =?us-ascii?Q?Ak/PHla3lkqiBSPaAvVnt6ArHmj/3kwTNuloTgSHewlDOAPq2G+fU1seSVTX?=
 =?us-ascii?Q?cXUTQ0fLyo/xuimcXij61qo9IogTPihOZGXB7w3SdlgBPR3KWspFRk6V6Efo?=
 =?us-ascii?Q?1HpXoyNgLSiiM+8kepyNPy/ynj1KCZUQxbonwpbo8OybM9KxbRYqk6Dpewgx?=
 =?us-ascii?Q?qSeQJDlfBRKk2I9XwdHH6tUfiEj9e2mm2zpIVILevs58BUbsNhisdwX9ZCff?=
 =?us-ascii?Q?F+zRNJPa31kpKn2PDOh2XNW+D8Pmy0cvGQpglTqwfjMgXTHgPUPMw7xP2JWJ?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4098e58-5f35-4006-788a-08dccde23eee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 19:37:58.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efwxeJ+4pbbMJ8/RUiJuNqKE0Gz9W2KFD8ztYInCHn5JCWIyrIPjZbz8b8MdZwSTQiSp8zZ0EE/t8dT9V9mh1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4840
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

On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
> A failure in xe_force_wake_get() no longer increments the domain's
> refcount, so xe_force_wake_put() should not be called in such cases
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index cca9cf536f76..3f86ab704c4f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -259,11 +259,11 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>  int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	int ret;
>  
>  	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>  	    gt->uc.guc.submission_state.enabled) {
>  		struct xe_gt_tlb_invalidation_fence fence;
> -		int ret;
>  
>  		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>  		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  		if (IS_SRIOV_VF(xe))
>  			return 0;
>  
> -		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		xe_gt_WARN_ON(gt, ret);
> +
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>  					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  			xe_mmio_write32(gt, GUC_TLB_INV_CR,
>  					GUC_TLB_INV_CR_INVALIDATE);
>  		}
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		if (!ret)
> +			xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);

looking all these cases now I honestly prefer the other way around.

If we called the get, we call the put.
get always increase the reference and put does the clean-up.

fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);

xe_force_wake_put(gt_to_fw(gt), fw_ref);

so, the fw_ref is a mask of the woken up cases which require
the ref drop and sleep call.

>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 
