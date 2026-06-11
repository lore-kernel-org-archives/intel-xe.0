Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE89CD98D5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 20:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB3310E248;
	Thu, 11 Jun 2026 20:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDTWb2gg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14ED10E248
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781211151; x=1812747151;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBae8WOZry7nQCyKsG1FdKvYsrEh1Egoac7vs/dpSm0=;
 b=aDTWb2gg3IfIXZorZbIVpK+q+0QMYBr3Fx2VlqrdQgIjfdl37kQ6c1C6
 KfK+HuJaoEYtnkdUSOq77sEMLelwfGaoGR0Yd2ii3gn7MjI0VeLxIbDPX
 wIszR30/m2sq/vG0tYHZXF0RuaMsUp/Vz2djS5d2F3RyhMtTZc6Eebd45
 b9NIdiyKw8PkcEAJRziZ5N3EjFlE7NOrYP13lczj7d2pf93OJIKdSS7oM
 vQ5A8pI8Mwnwh2qpYhvzlpUlD75Jb0Dn6OfWAaBfaLIXfOVGYuV98SgKW
 60usRfNh4v8lcftERCpFEA0K/DH2xGztKmnezKHapSUdJWTleykEquc8z A==;
X-CSE-ConnectionGUID: WtPrMG/9Ti+yNbV/k9qSNA==
X-CSE-MsgGUID: NNrCajm8SKqw+LrOTmgKyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104704815"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="104704815"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 13:52:31 -0700
X-CSE-ConnectionGUID: rga7PwCgTeW3RHkSEMaX/g==
X-CSE-MsgGUID: h0qSW4mhQ0+SxWFG/UTY3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270634768"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 13:52:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 13:52:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 13:52:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 13:52:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnqPGjU7MoqmX14rz/x87vt4v3nUdnbuxJliAMcQ5MlRa83Hw7HdBwNsbAzMbfZO4avYJ9RBe5EgDHQu4ph8LyF+XHJ4NLLuks1a66BxiBlV5O7WaT6D21z3SX6GawTs63HHsQTnHZtBcXxwoSBU5P9zWH/BkumxE/k7YrBQ5kqtxjw89ZoPm7nK6gLptl6jPtprDONZ0JfR5h8WglEHmKsfQIcNZLX20J8E3w6WvIPU+xTB6T6d1D/b8V613ZHi53dgbX1uyjxtq3I7RkzoDhGoZ/NzePiocUC2KMro7QJ2+KEXOoQnjY7p5ERrGkTfojAfcn/sIQks0EjspDLpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lUN2aUtZsOPJRkdyktR6xQWFWKOEUWmk8gG2grVMaU=;
 b=DCfAMcPE0Q1qGtP+8wjPbDXOybdxox9/uL33WgmIUcQncu2wMQFuUeMs4EP7nqeYPIMNroKiX9pHFZf8y/iu76GHmtPfcin8s0kA+d16w7MHDW+yatKL4unTTtJwkWZnaYhlYJdjJEd4MBB22k+s5PJ11Jvw1meD5f994D2o0/rFvBrwX3+8HStK3AO7jH6JG8gDAxiT68pl3ezZ35BrpI+FVlXLb0b8z5iEVLwoyaCexskBslz503zPZ71S0WdftSbBR8Rq7fyHv5EucZDRSklWbRp4SgT6vKZJxcnLizbs3fnh7f2vi8sSzWT5YQ/pxaNTc4J34mZy0yN9AHghxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 20:52:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 20:52:27 +0000
Date: Thu, 11 Jun 2026 13:52:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/query: Avoid global forcewake in cycle query path
Message-ID: <20260611205224.GG6214@mdroper-desk1.amr.corp.intel.com>
References: <20260605051944.1541085-1-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260605051944.1541085-1-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR05CA0136.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b62f20-8a7c-4506-a467-08dec7fb58b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: j4YXFriWYtryOM0hzHf5WthQYGwEmQG/cgzTzyR+6CQFG/ULFf8X8scULsMbDnzTrEAJcczxKgF5Hq3k53onX6GSrJDRSfWGKzkt6GaPLz6A8fCsdCXIFIs1raLoAOwee4nxTXm8QTfcQ5xGgPGfO3U5ewFOPMFSi6nyI6t+vQr5KLV+qJxS9FemIjtuO+kscgC14KGoM1PHH6svgNDZ33+TWsrGuJzI7TN8B7OpAar334VlR9WuviibOuxFfQoWU52+/cNtaOoVsM1KQINX5+VpCrUh4UtzVXHx6ChU1KnYnLiFFIiK7J9j1SW9vt1c+f5lWZyD+yYHWrak8wICsQkmWV+K4Uo/Q3ECwuVzdG9RgEJ4mQa2PXf8NBTETkHGquAy7xp89J8jVHjYjszy6qKMAG0cR6+knY65JJWGYt8huEQrRM1NScTAi6FGIMydj838HjchlJMD3ty3K+9fNxs8+kvN0VFAAyQVRyKtUF7LCZAfYATuU2KvLL18Gn6UtdZJo6oKElx5Gb6XaeijWVn0QabnZaEm/Wakz3dPMOHqKbN2SzxOH6sTpbJr6htZtgB3ho8kxDMYFyAPB40d0ZBj+RLtt6QRU6ePTEPhq9EzhtrW/OQz/BOc3q06Ko4iG1aiqX2VJln1CCeb93X0S1VrFOzC0IccxGuCEoDaXor9hrTZ/vYPk6odTtWSZ2UJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yVwm+EEEu27KZX0Plu9bJPXWZvwL4LiI66c1dWXtG313Dc+nYSLLq3yaVR3K?=
 =?us-ascii?Q?/EQcMRCdP9mQnHS98z3SkswbSWwnLOSbX2H1Mfh5TJw/wkaBZdBbkgS0D94z?=
 =?us-ascii?Q?N2zsm0u2M3hbVF9APu7o0U7DRBAO2IvxasUvOpJityVFqSbg5/0zlTRT+IUq?=
 =?us-ascii?Q?UMmvX2K2NRU+HikcOCN8K9PpaS87X/OkGWU3Gglh236govIAKyD1RCpUj92r?=
 =?us-ascii?Q?QpXlO1z2mOFxkuPQ7aEHujBfiJP9L855+WvXVWHOtoYafbxjI2FF1kdqMASO?=
 =?us-ascii?Q?v2XFzx19vPoecTwYqH88a6gobfgyu3JghO/PD7/wA/PSfBhUd/blY4ykFmIs?=
 =?us-ascii?Q?IsVr48IEq8Pp6cG3A30vv/qtxlfzMWuqP1wX2U2zz3pk9oPW3UUhnnaPg5WJ?=
 =?us-ascii?Q?FWsKjYbh8zNtjMBrnY/YPFVsPfQ9OTFZ7IrNiolXSB/QnfCJM6ifPNGgCDVa?=
 =?us-ascii?Q?wBeNt2A3IeVzbz/84ToCn9awDFVUH1C3oziJLp9eWLYx8MnUjg+d+TIKoFxX?=
 =?us-ascii?Q?1inFRRrcri/YXLmk9ssbIN64pKzOSvuSEozKmQ/jXAzBlB2iFNaEDjlXgVI3?=
 =?us-ascii?Q?8LC6GgvIMrgwXg1GnVpvhoiNVJOmISeOas06YyT2A3zyVXKK89LMMqtq/c9P?=
 =?us-ascii?Q?k72I2Ln1ZiaEqSbE9OfvS9Vd2o0mwNVw1MD6b8GjbzX/wYqq95T6eWwK+rul?=
 =?us-ascii?Q?rgLqWDaoy0y6iaT2w6pkODYR/GaDxNevQA5kWry+mrt/USW9vu6Zp78vHww2?=
 =?us-ascii?Q?5WGE65x1IdApBH7Fwv+3staVCsv24PMWV7CMO2nxmP92t22hVw9WVkZyeP18?=
 =?us-ascii?Q?KkjbWRVD2tQ5VV9jUPqzccYd86hpF2o0dw/dN3yVVK4JxGyxak5LFXp91sNb?=
 =?us-ascii?Q?qh3EdhtLIe98VrGPw+8XAQAvkjh6uJLlXV1fUT2q1j5mxYge+EXgn7ohxgn1?=
 =?us-ascii?Q?aj7v3VPDSzLMrdcjBBi1A77Zva2vG4uYg7/uj3xlYUiv0Qwr5RG52loHk7SI?=
 =?us-ascii?Q?uj13dXXRYjBJBVxGg0JbtnU8j2ydYwYlJj8cdcce1RH8892qVpQuItwk+sad?=
 =?us-ascii?Q?PPq9vJLTlBBNVlsfiFF+vCTYVlB0o9nnRiz/9QT/aL1E1Y+c9goKOipqrDff?=
 =?us-ascii?Q?3l+5clnTPFY1gUAUwTIE0j1feMg7eYh4xyRnb0Rktk7lLHHZJk67wfxq14+U?=
 =?us-ascii?Q?GcSadp+yq+LZO39O0Vsyuk517Bsdt5qqNuBemxiOYTBkBw0MCxrmFH0lG1VA?=
 =?us-ascii?Q?/6KVNk0/qGF6TyuX+j5DPvhx05CaM5qhTrZ0Gu/FqgDF43DpMh31WLZgC6P2?=
 =?us-ascii?Q?5hD1ZLD3xxrWKd6Qa6EXGkYaIlkYMvM/FwNCIvfh3fkuXyQr2J9eUCvJfEw0?=
 =?us-ascii?Q?qMyKhwkbPQM1Pb+YTft2CDn3MgiN0kNPhousr5WRIziCgoqsNl+A5qtY9WGS?=
 =?us-ascii?Q?+0MvPfI4hW/SmWc/sWMKnZshhfSrLKqu+6tCGAgn0/Z/Jos/n675/L/wikZW?=
 =?us-ascii?Q?+HsiHDTaNBqAsra/b2oyo2AN02CVBxuDBJRqxHmKQNaH6HPHC/XjgVJXxX1l?=
 =?us-ascii?Q?kJ5owBtnIMTE57kZuHJMj2rgYIyL5lb5ZZvtm0nJB8SmqRNf7861GGhpEcTV?=
 =?us-ascii?Q?iE2wo7wEQQmHzupt7RF8QYsNCxJJHB5BJ+ARKS5bd5QNK+8PzjlTX5OtnplD?=
 =?us-ascii?Q?CYWmp98y9OUa+TAcf2jjyDFVqDm+PPlVZQQxul3/2hhM8+KgMeKY0ONCDBE7?=
 =?us-ascii?Q?a5uh/LOlq96HlOhjCTC/24Nq1TM7mGA=3D?=
X-Exchange-RoutingPolicyChecked: UkD/MmuUkyE7iI/0JS2KSilw29ubDkU1PRQ7pqavXHZjHzO4fLLPeJWUlqM/a5/pQphRzL7vZ668/9KTYEK68KtjI1pE406ImdlKJtlCjsJeYMoXU0PjW3DSJ2mQepu/92pFnBYxUKoCjQX0ztgLS4BkH2omNsaD8uSKOgtrvuHuLCOjlyPHLB+azPxwMYDg6qIkrgCUN6x4EQQvQO5A8mPXoH8fdvsX0OipnJAMDZlsTBcUxegIugcEgq67Py/NQu9WdDJkchtz5ic1Wy4BZT/z38c/gmcQWFsdCtXI/RcpAh2agnXu6DvbuOk5xpSHwjpHSs+fyV2Zxg4ikd5Wmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b62f20-8a7c-4506-a467-08dec7fb58b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:52:27.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7czECzFE+Jy/0WboxUw+zuqoauqAtNZDC3MC9vjAz4whb45GUXo8tLdmLVDZuMeuFDwQRyR6C2OOJ5k9aMp/X+vyKZvJ8tZXuGEeSYLXv6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
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

On Thu, Jun 04, 2026 at 10:19:44PM -0700, Xin Wang wrote:
> Engine cycle query is a lightweight timestamp path and should not wake
> unrelated GT domains. Limit forcewake scope to what the query actually
> needs.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_query.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 8c7d54498f38..dc975f595368 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -119,6 +119,7 @@ query_engine_cycles(struct xe_device *xe,
>  	struct drm_xe_engine_class_instance *eci;
>  	struct drm_xe_query_engine_cycles resp;
>  	size_t size = sizeof(resp);
> +	enum xe_force_wake_domains fw_domain;
>  	__ktime_func_t cpu_clock;
>  	struct xe_hw_engine *hwe;
>  	struct xe_gt *gt;
> @@ -154,8 +155,10 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!hwe)
>  		return -EINVAL;
>  
> -	xe_with_force_wake(fw_ref, gt_to_fw(gt), XE_FORCEWAKE_ALL) {
> -		if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
> +	fw_domain = xe_hw_engine_to_fw_domain(hwe);
> +
> +	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> +		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
>  			return -EIO;
>  
>  		hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
