Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4AEC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164410E167;
	Thu, 23 May 2024 21:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yj1AMMBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E7010E167
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716499256; x=1748035256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TDOkCqXsd2N4Iq+JKTKUDxlt81kL3IEwJ8D9jw3xFS0=;
 b=Yj1AMMBRALrnWkV1Pl/J1b0flnLRuYdy58rwkI+DTGjZtp470yw8WiWo
 fIeipcko9+T3H88r3ixLJn9Ly0yjxQNaCqRFZCy+r7vcmOyt4EOAuen/K
 UHkomKSNmNTzDz6tnX1ZFFe7EUUv9eLttFNlcGBmo+s1SuPwG60+ss6P9
 rGNHFsYIiMZPzT5Di0bhOf5T2curgUcmK0h5ziyx0nkM1guONxMFDr+cy
 YObLAAa7nu11h1gLWgbXr1L0UcXzKDjLPwCvSju8Bcfv0PO5ZVClRfoM8
 09t56XQ8T8PhKY5o7PIEs4OEBG7xIMuCFbWOfdH/4JnLyrzuu17BavmBY g==;
X-CSE-ConnectionGUID: EMGe/ghjRu+pZsnc100XZA==
X-CSE-MsgGUID: BCoGM4loR9W8g6HWgbuABA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35368180"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="35368180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:20:55 -0700
X-CSE-ConnectionGUID: ftZwYQ4HRsGkSP+Qyw9YOQ==
X-CSE-MsgGUID: Ypremz0kR5WmqNVRYmyLSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33680257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 14:20:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:20:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 14:20:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 14:20:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTzVD0YDOy+GSChMvtrSu5X/WARUKvcaWFp3APcBgXWDd/AnhdvcT8uqYp2sNO1BY0R8pN9URShlfoLusZIW/F6IPhlczCEJvO8ER4C7ysfIVI8U4eWqZCR3qLtc0vYn9SS+9xjcKXfp1e1/P0axDNQNnQR+kGMxIbFQbGFs9qGTxroXJMQLuO1KP5WpP86XUyIQasoCUV7cTqIm4KSTj1YIRzxrrLAw3Kdd7ljGls4HZW7xJ8Wosl83ptl6s5QO288F7wAC5lENYmbTHw1ER0ifqS2IuV5zxW7BjXCEYWhRwA0NhPFBRvoNQk0IR8ezWGzU8mYWtekk4vzR0vmPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uACcH50qqPxT1x2UJ6DL6ndovNKSudrJllUOXxSJ/XA=;
 b=YhqseWUTLYTb3wmOMMxtJYfqLrT++2eWcoNT3xybOp0gfXLzLFXx2Yg+4K9ZNswIIyjJOvTPtKnWWAMkRay4tfv5boC8wf4SWBrsBYG4i5lbq5aWgSkt9UvAhcgk54drRaCGAQ+3PF/q+F471sMJnCDeNIncukajGU9Onoce+/dxfUB1oFvhGZfbFhDSF0aIJrvFCiM/1Z+/QnaLU+oL3WYDGYFOo8Db1I3u68BK8pyrGrhrDM6oQw4E1m1RlzESjNl0Awj6MpckjM2yxZdlI/TZROp3OQwM1vKzyjzhif57DmCXOtgCERj1Taec64gqWPE92bWrLfiwgThFwdh8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:20:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 21:20:46 +0000
Date: Thu, 23 May 2024 14:20:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/vf: Cache value of the GMDID register
Message-ID: <20240523212043.GD5383@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: b984d915-94c1-4b57-d1ef-08dc7b6e35c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MK5rwu0a+7+iWyCdPqKKOeWISwaJGBEqiJxEFXAOIlf3P4pbS30Dp0eT3LwQ?=
 =?us-ascii?Q?gTi2g9s6E6ju0XFodchdP4Y9VLxEFtADHANFERcuEJyOzYLtnp3iMiJdC+ze?=
 =?us-ascii?Q?f3i9z6mNpM1caCpe+7NH0qjIEe7NH91yeH0JgdSi9reh4zfzq/eAFmLV1zq9?=
 =?us-ascii?Q?XARAwsro7shGetkqy1iUrr/gTRmsNcTVySa/BRtScj3vM880hdbYnCJvZx8W?=
 =?us-ascii?Q?eJR3oYi1JoZi80KFqEEoZDF0dsVEEeiqVjS1nGYfR+zeMp3ALlSy6zU3Hro3?=
 =?us-ascii?Q?8v+FzzgxviUR0hgKdvgpGHk/XJktl4M4I6pZeYLZMWqKZEj31XlVydpbsL++?=
 =?us-ascii?Q?L1xTr6RxPZvflRvPL81Od/VxoO6DfoDLwzbxd6588aFwc16HKNqRwhl4k7l4?=
 =?us-ascii?Q?ZfjBK4CBjy7HFDp5zwBnzKZUbLydpIBrpM1LT7vNU5kcSm9J1grbdbba44rF?=
 =?us-ascii?Q?+wsIjr/AjTCUhJoZ0vGEPl4UXtTk2R4WUTWSoQwNqiSRupfzoDJ26xEQBr14?=
 =?us-ascii?Q?zY2/zIqgd6dRBPKDdpO8qfmNja7j232ld58qgNClmrN0/uioumvZr9nsPzCs?=
 =?us-ascii?Q?n8TjjXl6vMDYZr9sBxGbci270Vg0Hlu71GOpEFUWbDA9TKV7WvGlMP0zJqus?=
 =?us-ascii?Q?D6tuMpvBrYxLX7ThjL9gBS5ciFXWhBOn42mOVZJHHJ7xlagDqL+KFx8SNxaV?=
 =?us-ascii?Q?gIe6e2e3vWCyA3DIXR045O3lO+Cgfuy0oEoLlkD9aFydQtsBL7Isb47f8+Et?=
 =?us-ascii?Q?73mw1n6wJK1y4Y1IxOAXtdfnyztX26a0j8pLQwrdK4pBzlqXk/bkHUA5eoLY?=
 =?us-ascii?Q?XEAZUwZQseVq9vv+jLYl44H8Hwf5GLkPh8aBseSixdldFVaSGRTlahawlFpf?=
 =?us-ascii?Q?VBe86ox3nhaDnt6xJ3NPovSEcS5aLmKVD8Q12ki6BmBoGWa27pN1j+TMyAGH?=
 =?us-ascii?Q?I1Yt2kyyjB3zCNl8RFYBcn9vUm7yp3GMa0ar0qGyt1uSgEWxcB+GCxiAZDHy?=
 =?us-ascii?Q?nODXXTl6d6ZDXPfUk+m57woCpvyp3PcZMfjge+p+Ux8NnqECeOpeatVsCFop?=
 =?us-ascii?Q?URu/qj7LP4NXOx+d/i0hb3bTW69NJremxllbL6ez+BJlqHevWiSWrACTqwbY?=
 =?us-ascii?Q?A4/C5LfpMX22T5XjHWiQwguQCtHFlTC+v5UUTy/nXCRbMwZA+WLJ2VCvfl6L?=
 =?us-ascii?Q?x0X6MERnhWQZKho+w8oc2dGpf/xDr6fR7IDeMl66QDMmsknNa3tQsoP+UP4B?=
 =?us-ascii?Q?VQmje0RRiQUZ2qNxShSDLNUETbahX9dRwu0WtVULcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zC71aXgnZV3602sSl4w7uVyLQjLVDTXURxM9l8dTr3gQDK18SKY2R80IFbyi?=
 =?us-ascii?Q?Rt1gmoci/xpZVFdd+3JM3cdkH1ucFAPZpME3Bu+D29izKyFMlB0+eWVLqGmj?=
 =?us-ascii?Q?TmDSb+5u6PVghgqfYBxQ/1MpfercmcQXUrcvBJzqjKFD8WJwKITylS8BMsQu?=
 =?us-ascii?Q?5tLZsKm2wrKR+7HtynHyKe8Z8acs4EX4lYiwkZd6ORoJS8zsN2881AsdX4nZ?=
 =?us-ascii?Q?Z0k5AHkdtrmgUIsKSOoJlW0+oRrPMtjLeyk2J3SNO3mnXEKPJOyA3X8OxalR?=
 =?us-ascii?Q?JRadhyiSoZHFRULfER0Bnd+02y6ai52hLGXysbtgV4+WZGuUkewlCEYHqwO9?=
 =?us-ascii?Q?2ls77w3FpGgNn/CUjtDteVLTh+XGLaeIKl/tOFnEXbYzGulqB6sDjrji3kcZ?=
 =?us-ascii?Q?D5UJIL6oN6AMkvXLSo/96jZKDabJD3qS25xbNdIkU8SrQDq2QG0+hDQB/hWb?=
 =?us-ascii?Q?4l54yzZh6Fb46p03AWoYsg7tea8OQYUeo1Z5fBs+ay8cHKEgtVHP5htWc/9e?=
 =?us-ascii?Q?moaJkY9qf2p8RFoEBsRZVL4Aj2a0RupK3OEAFjUVvrtX4hJSQ5P79kXbY13G?=
 =?us-ascii?Q?Mmck1N1EnasW+axDT04YnQTBB2Q05wBiesgNaj1KKa/ToCfstLtoZc4nSQ83?=
 =?us-ascii?Q?lCD/k+u5QMewiVjx9/qY2rEOLCDwX/HjECvXhSbf9gS0UvRf9LSAHFo1WpuD?=
 =?us-ascii?Q?j5wz35KUxixBpd6UuRfI9/MDGxRUcXTeVHrfOGxOHI52JbCgs0V8eMS+WLhj?=
 =?us-ascii?Q?u+pikHb0Rk4VGJpOrcRZHY0M35nlg8H2m7G5Oi0H1LjXJ6Pk1wWU0hshq0ww?=
 =?us-ascii?Q?vXa3t6JTQ2DKBg7wk5n0jskhV3YjlWc3Q1G0YKWYmsZx+pMVzUehpl1vvkiJ?=
 =?us-ascii?Q?+yafBXskGjDnho5krZ0WtuIV7UqIi6zJ41UW3qho8uNIZo37d7YCIham0ocI?=
 =?us-ascii?Q?BMy1qSGzZfE5dUANiLIiGXG2ceLqpZAtdGQuRdS30SHNPRuvMb//nqmwNAK5?=
 =?us-ascii?Q?F9Mm2f9ghJxnmw8jr/fX3aoQHj6zvsme/Orw1G0JPIPzwnnY931x8PWrWZ8X?=
 =?us-ascii?Q?HPFcQtmSNYDL25I/aEevb2G6T6pRs6bWH7XqORR42Jh0g0xMhAlZ0QnJ6W4w?=
 =?us-ascii?Q?d7+CCPZ8qg0WClVPYTjNgYAi4vjxKCRRHj3AQ8LU7lwOAFtcjYpC5D3xA2QR?=
 =?us-ascii?Q?0eTdEshjNbmsGw56rwp+TKkbGjuoes3D4OfMQyXRrmMld67aEWjfPd7B5+pl?=
 =?us-ascii?Q?STxnsQye+PRhDhk5LjITt3pLpTrmTC9QnueT6BMlAQ5fF0SALhaNcvvASLmt?=
 =?us-ascii?Q?t+k2ffWjePXY0+lY3L4XUrFA09G/HQGdwVvdlxh+fRlemz2iEcNgIq/PNhJ+?=
 =?us-ascii?Q?1nZMskeWa4u1Zym95DDJS6gaalJZAL08TT0P0Cr1dzWc6KFgKmxMZ4ds3zox?=
 =?us-ascii?Q?L0O3VDMdE8ERRw4HKd7aE4TnEN/Zb81aY6GErH3gM+5GYh5McYXJeisUqNBn?=
 =?us-ascii?Q?Toeii+PN5gLOnl1wpjJ42chj/QoXVUH/LBoKpmNsbLfVn1Du2JUPr7d61miK?=
 =?us-ascii?Q?BDOD3QzQd1Sc3qhPoL4oaJcFKDp+MbqVdu7ng+h/ZMsfFm628KHYoB5AkcYF?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b984d915-94c1-4b57-d1ef-08dc7b6e35c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:20:45.9526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIF78FQMU4Zbu32M6eEcQdWhqD4OJ//JQQD0L+GoqyrL0gFget7MxHfYHepPJJRyjWzm+OHJPhRj2FKW01R8OyzOI2cZGPSOPTRztNKaAUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

On Thu, May 23, 2024 at 09:22:39PM +0200, Michal Wajdeczko wrote:
> Read and cache value of the GMDID register as part of the config
> query that VF driver is doing over MMIO.
> 
> While the VF driver likely already obtained the value of the GMDID
> register once during the early driver probe, we couldn't cache it
> then as the GT structures were not ready yet.
> 
> Cache it now, in case the driver needs it later when the GuC MMIO
> communication, required to query GMDID from GuC, could be no longer
> desired as it will be replaced by the CTB communication.
> 
> While around, assert that we will query GMDID only when applicable.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 5b8771f831f7..347ab7060588 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -284,6 +284,11 @@ static int guc_action_query_single_klv64(struct xe_guc *guc, u32 key, u64 *value
>  	return 0;
>  }
>  
> +static bool has_gmdid(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1270;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_gmdid - Query GMDID over MMIO.
>   * @gt: the &xe_gt
> @@ -300,6 +305,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !GRAPHICS_VERx100(gt_to_xe(gt)) || has_gmdid(gt_to_xe(gt)));
>  	xe_gt_assert(gt, gt->sriov.vf.guc_version.major > 1 || gt->sriov.vf.guc_version.minor >= 2);
>  
>  	err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_GMD_ID_KEY, &value);
> @@ -409,6 +415,14 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
>  	return config->num_ctxs ? 0 : -ENODATA;
>  }
>  
> +static void vf_cache_gmdid(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, has_gmdid(gt_to_xe(gt)));
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -436,6 +450,9 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	if (has_gmdid(xe))
> +		vf_cache_gmdid(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 519492f4b7d0..a57f13b5afcd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,8 @@ struct xe_gt_sriov_vf_selfconfig {
>   * struct xe_gt_sriov_vf_runtime - VF runtime data.
>   */
>  struct xe_gt_sriov_vf_runtime {
> +	/** @gmdid: cached value of the GDMID register. */
> +	u32 gmdid;
>  	/** @regs_size: size of runtime register array. */
>  	u32 regs_size;
>  	/** @num_regs: number of runtime registers in the array. */
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
