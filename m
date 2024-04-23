Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BB0C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076B2113528;
	Tue, 23 Apr 2024 17:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pe0sdQKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A88113528
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713893206; x=1745429206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=e3n8jGqdrom0o1YIp7uQze6tvwWhZt0wbRIvPAZ1UhM=;
 b=Pe0sdQKT6fn5rtb8Kk1dshuuVgZVvNymAjHfeJCETMYQa74QYfOkTMoI
 qWwHgiknmxSv1M6T+87xgEwOx8ELSJ40y4Ny0YxA+tplnwcHgxVyk0zg+
 CQ89XsEXHvECMu+H+UdS5O10qFPNAGfb6Igj7210lNMR0PVPP1q0q08h/
 tHXYNuqu4zEMwmjUM6RvwMm1OWVXqyasAc80SFIJ5upE+PDSVpeaDxdGL
 vuJcG8XdfA/voiqsTt7YIR2NqW3SWI8stv19ysXlKsyW8xBHS/WSAbeAt
 zmWMdYvSCMC9pf1a6RuYKNJ6kiDSu4E9l+X/Ywf9wpwWEPr4VWwEcLBNx A==;
X-CSE-ConnectionGUID: X10484gYTuuvPtTEy5oFuQ==
X-CSE-MsgGUID: NIW5ibHIT3O+2mMv/+ulhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13327101"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13327101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:26:46 -0700
X-CSE-ConnectionGUID: 7WVshrJmRzS5cMqQLbkuLg==
X-CSE-MsgGUID: pavSgEHRRqGNMpKomx2gMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24491210"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:26:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:26:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:26:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:26:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHY3M1sRzJnbzODW0HZTVDFKpUU1qSylPjnXNt5ql4L+dkSqq9MwYyHIvG5YWdoHhJ6D0EOC7GKcxBvapp0QuUY7ogvse3Ee2c3sqGOOR1+k5G/EBHgckySXFK/E1P5WYu4Zr+dDkUuQPQ67lRY8zCPonY8cmptur1msVAVTHSG+RaJri0/pWbX3tzzSiwvlK/tJSUPNOjVVuPTkX8ddR7uMij2L/LFwEUBXBMtToIY9GqDDUK1a+dqY7Zb+ccSJLmH5kWdvTVBI/vIK8IqEqynVzl2nDPFD3S9yUSG8N1HPNDo36U2pMqWDxNE/2ON7P/+nu4uM2oVFKsrFazrYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v18oo4izD6V9w25vVBSLzwV5D+k8g6fUMfEZmOzK5BI=;
 b=jWE6TdiZT+Fi6rs0vZvSkwg1W9gRIxLb/2IgyQRVCw+OAfne/YBi+OcBOiDJkITgOWDrczQvY0JtumusYBuBZJfQ2qHw1FAHV1w3hD4iL3Ww1uXsErr78Lnd6ES2Ma5kNM5FjyvAsB+JyvMeD1fRTL9AKsEHPnVvPqhig40me1703rjIaHreC6sklH1xuVvpdNtVgcVCSmgplkprX++tiEHRtPQRwXVYatDYKCWhHvTWTFxZcmqA0fcbei/ovPoSP9uUKKSDBI4y06z6jQMvp8AiaQK32pFhe5XW9D3vuGHi2YzwGNdLCQ2hUeXu/wH3O3Mtm2IGqxaSESEEdjjvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8054.namprd11.prod.outlook.com (2603:10b6:a03:52f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.19; Tue, 23 Apr
 2024 17:26:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 17:26:43 +0000
Date: Tue, 23 Apr 2024 17:26:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix unexpected backmerge results
Message-ID: <ZifvMlalW1YKhiax@DUT025-TGLU.fm.intel.com>
References: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423121114.39325-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0b6ef8-42be-4f8e-cce1-08dc63ba8b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U2716BETHNUhUq5zUriu3QEWr9CNESsMnkhDQyuLlQp21A2j85JBNIJjHE?=
 =?iso-8859-1?Q?99MPYMySWCiJKCYJ5ioP4iIOpqflzkC468zt5V7PoO50Djyz/DNMDE7buM?=
 =?iso-8859-1?Q?ka0+XzR5/BDbG8XvSTuLcbQLwCAElq8D9ruYRle9mEiEVGopzufW/rNv2/?=
 =?iso-8859-1?Q?EEM4UqW5oN0WvWt9BGsacioZpCAFsebcpRX4W35136UdVeqadl6ktlVCXW?=
 =?iso-8859-1?Q?1FX4pLKm8hlKk/vD8lmIJFQorvez7LCjIVRjotFPDAjIDyR59iF/R8X7cC?=
 =?iso-8859-1?Q?nLYfR/UmDKJ4daD+ZRd+UlYKqVkQ+beDYHyzycxcq6ENpgXMINMEOm1vCC?=
 =?iso-8859-1?Q?12s9ZqWqc9qzqxGi8qQe95qcT/PrVP1CY6bBcgABBMGGakRFNEgw0TlBQS?=
 =?iso-8859-1?Q?TbDdmOmHkzzDaYZmGJIZ0CpnFSI3qIIrCc5sUYXJ+DFwA3OV9jwVjbiNXs?=
 =?iso-8859-1?Q?MuUT45uKKfzL+qKfEjMOIUITsGWe8cpiZobVY3Grr2mNK6hvlbQGkVUvK5?=
 =?iso-8859-1?Q?Ae5EymL/UmUhjOXsjII5qU5fEFp02ckQBjBsYlY8t93dF2o3nj1ZhtKFZn?=
 =?iso-8859-1?Q?mXC+BFaAvQUOXpz+qIVUuDzEU52fRN00G717JVpxnO8atoes38oIYXUpcP?=
 =?iso-8859-1?Q?NoGDkD7q2IJ6f8rMYPqs0uA6tewvhdQRcBd0nZf19AYg9TrLYDybCsM9qW?=
 =?iso-8859-1?Q?ZRCivo+OJn+bn2bMPbvxMbLYuZ52gtv0rz3pqUWtshaLWXLXPIf+r5WqWW?=
 =?iso-8859-1?Q?r7qJ5k3B1/kY8CPqh9yNsdrWN1P9MdbP7PM7zmWJweLglYsqOF/zaZWc02?=
 =?iso-8859-1?Q?E7/zLYnvEVsnN4VjcQ/tzQVAw/hPP4IGsFKaL5HFsYS/ovTGGlJem/U0Uw?=
 =?iso-8859-1?Q?Fe0UwBF84GpEEXZfPIr+gCeJiAEZcKHi0+wDoabqVLV/7kDrKYV43qcStZ?=
 =?iso-8859-1?Q?oR2XfjjoFNYG9Yjc+8qf4vHWUkZfgJ5swSzxyhkKbAh7UDHOG79y5vhwbp?=
 =?iso-8859-1?Q?woPwY4EDqr0+1VaWquagZcBMKjVpNGaZU0V0b8B9nuaGZbmsHOBsCQxDxh?=
 =?iso-8859-1?Q?2LdmmC+QWerQOS0IF1wRIUCKaJD+yjWJi4f82nnjYonS+aUWv2GceA8n/n?=
 =?iso-8859-1?Q?xDZmZPhVwYK5I9/648YI3SZzELNf8v1LtdTwW5YQuNcYXq5LU/uKbviE+N?=
 =?iso-8859-1?Q?/PKINsLMoJfpwWXgXaKVjKapbVLtNS2NbZHvd0ASTwwLpvNOHMcUIAwAWh?=
 =?iso-8859-1?Q?Sizr/qC4+LhumAGpvsggPLJQ3ZGfia1JYDtnB8jx+SvE/BLjI1gJs9UIzB?=
 =?iso-8859-1?Q?trjUGe7DesvKCDQY7KCtlKVKew=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EsDooI0Jzo53SnHqdRENBWBn+02HmG2JXCMyHZibAQ12d/2BhAteMtXOUP?=
 =?iso-8859-1?Q?+SgoH9htoAqpM+83Cei5+bXNOQ6RR1cNYhzGscguC9DDkzSjhP8FJatdCe?=
 =?iso-8859-1?Q?ddUCTSHScl75/Ne8fPe5pML9TAyQTgjI3g/u3czz5X6B3XxB5S7hS+IHLu?=
 =?iso-8859-1?Q?LH1d7PXOtogKgR1K2IpWP3sdHQ0TgAG+33CvH80+Se0b7/fP5uaA6gJFOx?=
 =?iso-8859-1?Q?aBia0+cx1QFu3NM4Y/surB0W2oe2xyBJEeuh/iKTNbWCwD0KQ+LQL5OkFm?=
 =?iso-8859-1?Q?cWVhvDuZcSse8gNAiY+SJZWQiYttNRlT17pFeK+8j8Sv45taEPvWNwdFnS?=
 =?iso-8859-1?Q?T8m2SMezCniqmbtZzzJZpmOmY2CuophVBW5eBQlNSCtx+Xzb7reVnr0yp+?=
 =?iso-8859-1?Q?K7Lv9x0x4pAmVBhc/8MhOOm24gqFVwEq4RLVk5OXv8pd3m1CLhq4j4LB2Z?=
 =?iso-8859-1?Q?IrLrszW8Jx9ztnZDSA3r1iAuZRuMRZInPE9tRyN6i5k9ggSAdlayX1cS7c?=
 =?iso-8859-1?Q?UnGXzKV7LKXw/Mn+L64S/p2KKDoJGuJ2kNM+oVJa4DqIH4T28C+gS9Z6Uz?=
 =?iso-8859-1?Q?VGtU2VWoMPpVY25pWxDnhy/zIXEL51YIwwMFNKnfi8NRY0TQUmc7it43Fd?=
 =?iso-8859-1?Q?MRJwWPWLOGdjglH2e5m/Fo8mhvck+dwOTAh/pxyz9KpGiDbq+tzeQOtNWx?=
 =?iso-8859-1?Q?vh690Q9LCnXukW0L1GvtEsirLjP2dTinA3UBK5eNEKNKtHuGNtsOAekYoi?=
 =?iso-8859-1?Q?3XPjYLkJVXWfY5zNLzUKxGsihv9hpo4xIO7aJe+ZVq2AeCiJHC7VoZwRiR?=
 =?iso-8859-1?Q?XAG2lvkhR1Lqwax+/zWcaCM2c2Vcs+ImsoMl+w1SF5l09AW7ZnZ+XfcRYN?=
 =?iso-8859-1?Q?9ZyVtvzaN3Cjr5dFx2zX+3oP9h6mUvqWfSpyPbU92Asuj8/rknN2LlUxHj?=
 =?iso-8859-1?Q?aEaNqgijbUS7gl+ugexatK47Gj/i5vvj+S9KpMYGXZwZn2xrgTeR9P87Pc?=
 =?iso-8859-1?Q?cnRsWvJVo+Jga1x15dpAV8xL4xE5+04tt/aTZ76/XMQm/oweWfoQMWyRZB?=
 =?iso-8859-1?Q?cxWwg0dIBfc31Tgwx88nngPY/JzNjnUUwfmli7ayv8NIccw1Sf55I1T/CK?=
 =?iso-8859-1?Q?JAkTcYG69nJOQAQGP7lRcZv8p+geS/k6ebSi07rd9H+C7vnBL7BjPvabE0?=
 =?iso-8859-1?Q?RQHg+E5pfPuontx50+EkyfaLeKMRZxbfvlW2xstKU7NBhGsu19VWjKyr/t?=
 =?iso-8859-1?Q?vuxb86zRaIbUxToaPMgz19Vu1CcUAsSJrUyGnKHvMRvSE/4p0HvGozr6Y4?=
 =?iso-8859-1?Q?6ISDi0Rw6ZuK6wji0IsWLfwX4J45ktnKth5T3eQOgRfblfXgEv4F2bRLII?=
 =?iso-8859-1?Q?Tckk4v4y5IEA9VDU0YAshHXoQWXppcOoGqaiR5561wW5e9JdEYmIkF0hH5?=
 =?iso-8859-1?Q?J60afd1Ft9KEYfJPNCK0lnebJF/h3bSvQJDVRwJ5M2tO366bU1oFK9AUb7?=
 =?iso-8859-1?Q?7ld8+TVoQsOP99y0O1VFNRqUoEUgqXJsKFAsCCjjsIgTilG7h/kMmOkcEl?=
 =?iso-8859-1?Q?RMUmCGx5HyF/uG8yI4V4xyyipdEfdPyoMHFHfRgA94SQUmiZUM5NZfTbRa?=
 =?iso-8859-1?Q?R7/6ptlz95M8UKV5cGChP91ERvzlbjuWJbFouSng+wtz5Ln/VEJOk8cw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0b6ef8-42be-4f8e-cce1-08dc63ba8b72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:26:43.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpSFLqxmVKmFO/wb2y7zRMNw+VrAVi/8YFMlLs+jBZGsCN0C5y0ZAjV+FZNMkbOvHBw/aQj2JUk/Vp1/tk8/bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8054
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

On Tue, Apr 23, 2024 at 02:11:14PM +0200, Thomas Hellström wrote:
> The recent backmerge from drm-next to drm-xe-next brought with it
> some silent unexpected results. One code snippet was added twice
> and a partial revert was partially reverted. Fix that up to
> reinstate the code as it was before the backmerge.
> 
> Fixes: 79790b6818e9 ("Merge drm/drm-next into drm-xe-next")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 13 +++++++------
>  drivers/gpu/drm/xe/xe_vm_types.h |  4 ++++
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 85d6f359142d..7ae2b0300db6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -863,11 +863,6 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  		vma->ufence = NULL;
>  	}
>  
> -	if (vma->ufence) {
> -		xe_sync_ufence_put(vma->ufence);
> -		vma->ufence = NULL;
> -	}
> -
>  	if (xe_vma_is_userptr(vma)) {
>  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>  		struct xe_userptr *userptr = &uvma->userptr;
> @@ -2100,6 +2095,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
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
> @@ -2294,6 +2293,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  		switch (op->base.op) {
>  		case DRM_GPUVA_OP_MAP:
>  		{
> +			flags |= op->map.read_only ?
> +				VMA_CREATE_FLAG_READ_ONLY : 0;
>  			flags |= op->map.is_null ?
>  				VMA_CREATE_FLAG_IS_NULL : 0;
>  			flags |= op->map.dumpable ?
> @@ -2438,7 +2439,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_MAP:
>  		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
>  				 op->syncs, op->num_syncs,
> -				 !xe_vm_in_fault_mode(vm),
> +				 op->map.immediate || !xe_vm_in_fault_mode(vm),
>  				 op->flags & XE_VMA_OP_FIRST,
>  				 op->flags & XE_VMA_OP_LAST);
>  		break;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 7570c2c6c463..72a100671e5d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -269,6 +269,10 @@ struct xe_vm {
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
> -- 
> 2.44.0
> 
