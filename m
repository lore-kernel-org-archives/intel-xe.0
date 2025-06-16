Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19E9C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 14:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394D10E3B3;
	Mon, 16 Jun 2025 14:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAoBw1F5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACFD10E3CF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750084181; x=1781620181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UJPERD/58CfEbB5jvDccKkGXuPlxkIvwI8iSBjuEF6g=;
 b=dAoBw1F5dYI91bO3082WFjFyX/T+d6MEZuER3R9fePZfXvDmVokTAyo2
 BpBbPF3JH2BWQBvJJ+WYy6KAzMUBXgsylTE+OlvNL3wgZFitMwanci5b2
 vm1cKoKHTzKxaRVmpCMm7NTyDDPcnHMYSRRlUZRjI5IdMD4xBTt7XNFKk
 2o/+0fhQn0/iAXBi4eJEVu/2uku9Bm8m01qPgbCYnxQwh2eA4g++r+JUO
 L1wqINurUMmkZM3VEJQfz2aGWt2V2Zmle2B8RRKM4w32LDDrgnx/WUFLg
 lW78uAJsLOEWQoOEHIlxZViMBQUJhvv0fzjYKnxA7QmX2jgTuohFfVx1r w==;
X-CSE-ConnectionGUID: U/gtX6ywRiWjm+mcjKRJ7A==
X-CSE-MsgGUID: M8nPGJkEQG6qvIQQAd0DcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62501365"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="62501365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:29:38 -0700
X-CSE-ConnectionGUID: 1cqEf1EVRhKsZF4qveylzw==
X-CSE-MsgGUID: KO/clTJ+RkWMjv9hqNiTsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148957512"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:29:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:29:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 07:29:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 07:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO1Rod+TXq6qfWlAhFx4Gv097ZvMsAa3HG671OHtbA+2VjQJoAFd+cDWDbAQpMZDUpEiEHjo/3TbDgW8n2RWTEqzUP4YDosW4w5WgCg9kmz4WWEeWciBDG14WnYR3DxzYVQ/rP0ROwcXB4PVkgylAzAra5BACEnKV7uObxRKq/Qb2M+J3DzDahkOwI1Em5StylfhzUr8UlU2TNxRefFTl9QiaHU3+knPBxMEsCuV/vtFdubyg+uzh5fbWcIuzrBQkLXAcqEv4nt4np/ArqR6nFrDfibYF8D3qojaL8Hz3xYSgkdOuPYe/pI+TldkyBs4J5g0SdVY0zOqaMXF36Bz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GUu/tqk80yXSAOUyN6EpoAHTlEjlYuDG9RwOLqxqRY=;
 b=V8Izdji/pNGkTANzP7iAbaFZW66e+BjLp4ySfuYUM9v/fBm1QkvMzPUKSrP5cOpvdEBGHKEKL5z/AjxtF093MLDebPPOKHC/Jha1sDT17WFjRIsd3CKAj+6h/cinrVAJcW1A5kowQID32Jq1//T3osQzBSSbsNiMCwXsX0iMPd8F/kfjsiEJ1EWPjVXNiNmgRKWdgq6JSuIzPxKDNtpsNGD1qPM2nHc+7VAyLOfSLl5Axk1VJ17FBr1/OXszdEIiRJBywKoT0FclwBBWkMFFyk9qf/ysJz2TpbBrl6OyvIbIhuAypxUyErfsNlYf0E2cxwPLBoUxCHBs4ZjDanfhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:29:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:29:05 +0000
Date: Mon, 16 Jun 2025 10:29:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/xe_guc_pc: Lock once to update stashed
 frequencies
Message-ID: <aFAqLjeXkkL5rNGP@intel.com>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-2-704830697cbc@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250615-wa-22019338487-v4-2-704830697cbc@intel.com>
X-ClientProxiedBy: CH0PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:610:118::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 1010c62e-2d30-4a2f-2ab7-08ddace225f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?27JFiOqe+nYIlLxeQJZ3/KAGOIFTqPMErhypIk+da+90CvPi7Wisp/c39cbJ?=
 =?us-ascii?Q?ubYEiKlaOx0WeNU91PiyXd35ZiiAhAjwtMvBPCEj3zSRq8+0ae9f/CVl7Qsr?=
 =?us-ascii?Q?JjfPc4025g5+Im0RjdO5mrQIVI7h3E1mgR09SRb/8tqLp2j3rrTHu7cBi2wV?=
 =?us-ascii?Q?GSLy+MFIcgGxxGszBh/cR53XLEtQtJX1QqjV2m2sVM1+6yqPFEkyZFI8k7Z/?=
 =?us-ascii?Q?VvNX0qBA+P71lnqc55HwZrtFstx8wpzE3Axs92iy0A6J/aUXmOLwZoub3UVc?=
 =?us-ascii?Q?rfnzh33Ebvp+2+VvXY2Xkt8iQuWVkCScMe8jUQVkivaa6I07N0mytDdnTD8D?=
 =?us-ascii?Q?6D3Oa6pNkASAityJwV1f721ENQI8tBhtvbnCHywamPQ+FraeNqz1K9LIXVcV?=
 =?us-ascii?Q?ICPko8fgJMZTewc/stT2XkiO/AXgws/wLgzYQW2fBcmNC6HqJ1TgHoI1A/0c?=
 =?us-ascii?Q?K3mNcV6jUIxMZiU+qvcxp7yUTObscT1HNyfyhD/cpT8Nl0zYNk0qH0cuz3pC?=
 =?us-ascii?Q?XJ9NMhZWXQD4yJWe8jFJ1l1djzopLniTZQaf3riTnZdOrF8tZ0oVMmcZo7Qd?=
 =?us-ascii?Q?TyR5IeJpuEyaXaL0fqzm4yAEWTGu5VCaEXsl1m/F8TNhAr+N2QvbFhmbYsjF?=
 =?us-ascii?Q?61Shr/F8mmQCflxboyGvqry7pNx9YiIpvl+q+WGuefv99ndaUCzzy2lLH91p?=
 =?us-ascii?Q?7SiOb+Q0yLPv1FPxKDMFbja9OCDoQaZAcUJSsa4Yg2+zCfl2+GIpTpPPMBQP?=
 =?us-ascii?Q?lpwuNI7JDay2KhQGjfYSppt8K3UjLAyp+HP7748r5IO0nXUC5kpnH2oGuzUs?=
 =?us-ascii?Q?6wzvCPo2pEdMpF2VkPBdsSk8uc/SbVq8Wa2Zh99NY6YB7GzbziNXuFj2d2hd?=
 =?us-ascii?Q?OAD8GP/jZAapAdr5NlIbblNPx5SltCCDotdAZa2BSxDQVCUflvWArLZ2DJUe?=
 =?us-ascii?Q?d7aGMh4nS0/UvLar8TN/MCZMlvj0vhsxUFhW9SAjPLBlQCzR7IrXW+jWSnQE?=
 =?us-ascii?Q?4Es9EfHa+2BCjwN0xluT7qgcvYZtyI3cJsvQ/oleGSGnBmuj5Js+S54nPPAV?=
 =?us-ascii?Q?eRHhFEvGXjkk2Yv6XFOqjORlLjzmXFlspfKF+L9RFA2RVaQCC92f2O7kc5pJ?=
 =?us-ascii?Q?WVZEInsuYTTqeWeCLJu5XURqaFrckv9BwHITnVmV6aDscQ54XuQugFYCzezS?=
 =?us-ascii?Q?iV/gcIK85WIbk/4iF14n/IYTYCQ8TGS/3ffPByd2F2njn+r6cXI9abPNEJMh?=
 =?us-ascii?Q?7xqOH3cB7NhX0DcIdXubn1mms+GTilokytoW48rD90uEX2wbQMVVUCokCMyi?=
 =?us-ascii?Q?BvV76IX+W0hYMDUUg6p8giTnkuJNyIXVhbZIbWqFtOUPR7yzK6ZqFZBfZAtI?=
 =?us-ascii?Q?ztORQulfQ2vbDK538S5odRqdAuNjEEFN1aSqsbCTejS8//oQmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IoN20o2ViK1atVPiNCgZjs+H5Gh5avyPO5RKxc16O4Hcmy4VlyI/gmmhSBir?=
 =?us-ascii?Q?d3NB0p1EmAKqZNw4dnTa8yaW0+JMaGl16tahgjiq6TARVF3M6eVml2U/7GUY?=
 =?us-ascii?Q?B2IzU89/vhpnwQ2LOy/tJb+pBWUoWwYJJHA7DQvNVMAVRr0T3d0u8YPTdfx0?=
 =?us-ascii?Q?3xlFvTlE5eu1ioVWXKujTF7L363hLmiCElS2QraQmGKD/L0ncQtVnQVwoPpw?=
 =?us-ascii?Q?uShlhNkFvlT4maENX7gqRavoHNl47njgQesh5+DHDXpjO2c13pB79Bbq+T2v?=
 =?us-ascii?Q?MMubNRhX/nB3oE0USl/p8WcekegJpfMHuMMI7wbBuF9mWtf+ZNw8H958Zh9l?=
 =?us-ascii?Q?/SEiQbWLmxa57Lk1hlwhmme0nrM+w5cu2cg5aykJgx8cViYWYG1Y2V9VVM97?=
 =?us-ascii?Q?880L1RYDLk5DV8L00cgSP2iCpN8zrXKD7gt6R4LsChRQRxKg2PEMbojuBCfA?=
 =?us-ascii?Q?USWtnZnjpK0Qg60lP4nB/1eIIMUAtXYPcZ/hDZyOCvO4O1DXjWh9mBud2dFU?=
 =?us-ascii?Q?4E+zN4kQ92cxnUP8Fq08CjgpK/Ek3vGdiEBUgUQxOSTzOVzoosq17WNjD1/g?=
 =?us-ascii?Q?a4Uyz3APB/G98j4e1UCKzCUWKoiZu60CE9Ny8rpGqx5RYMp/R9rlYWPTi90h?=
 =?us-ascii?Q?BPZFa0N+eBqxrl+q4wdqQMz9AGQNs4Dxq7eZV6yA1ab4V1wzOt+nCFvgUPyk?=
 =?us-ascii?Q?HFK6EkcdTn0ZdtH7gkgSkChfvobvKdGWmgtpCst1T1e98snQmGRnjjrs4ep3?=
 =?us-ascii?Q?JJZoKsAn6SMFUobnoiN+D4YPUCSo/zEV0Y0PkSRJISdE4LckdH4GSnAZmB+e?=
 =?us-ascii?Q?Hbzmt5/xBrDFsFLe+d1Fgeihep6EpAPxNtlCuDhUxi/t603z6aRS/TsVtnnP?=
 =?us-ascii?Q?fkgE3+NEcFnVGBTd7Sg04KwzjTZLRCZ0nZCZyGiHsvsz7fEevNhigLnq2LFS?=
 =?us-ascii?Q?q0C6SRJzKYyZCpfnT6Irb39/T/z67cK9q9JwWehkLjBzMlhRd7qh6zVLFIUE?=
 =?us-ascii?Q?Rkkt6uaCM6YapQpgan8Yxgc230t2B1VLht7L8/MCX6wCnMy0MHMdd2uuIDdB?=
 =?us-ascii?Q?Q9RjiJ8IaFgjtrGs3wLSC4TKsfjgg/fBAMmf6Hs4Vn1hy2pGAOJfhIsLGi/h?=
 =?us-ascii?Q?dQLQg0yVE+Hcd8yqmGDUCa2sjj7Q3G5NP5oMqF6Zod2JqkR2UVeJqTbaLPcI?=
 =?us-ascii?Q?k3MU16Jxco2fJ/PqO/3DpEZiXCBwWRbYCFS0IL8SC2A06LBmnP3RhoEXmbjk?=
 =?us-ascii?Q?8scBMq8Wkajn99MV/wLMBfN+v/4C2D45hPhHyoFL/ScnND2W2nUJoQ63fPq/?=
 =?us-ascii?Q?4eUKirY9bpqMEUNEblg5Lz+Rdq34AbmG8zdfJ0rMUI0vSwWL29QJZA3cRrGr?=
 =?us-ascii?Q?7eB8fiPz3w4ZblRK1LZcQ66ocGuDsabW3QG/5gKHLqDe+ygZYFrXil+w6O50?=
 =?us-ascii?Q?I//2h/RSsoYNW/Ll5TgGbU2HmfYV1QqA9QaMpDmtvltZkf2dtaad4T2V7P4x?=
 =?us-ascii?Q?9lMzSNypI3CqK8/M5D9IV0bYfFSygnw961mncUgJUYa6luqxud0PiG+sxy29?=
 =?us-ascii?Q?ZHYjqgtygW0BudkizQJR7LZA9u8SMI3XiZHQgfEC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1010c62e-2d30-4a2f-2ab7-08ddace225f1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:29:05.7905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSV0mPWjsmO9Od5LcwNCQfS7CeROmToQAQX/x4LliaBVLW09ny5JuDAvzmaaGInFrUiwOwOAeU8VtOEglRPO5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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

On Sun, Jun 15, 2025 at 11:17:35PM -0700, Lucas De Marchi wrote:
> pc_set_mert_freq_cap() currently lock()/unlock() the mutex multiple times
> to stash the current frequencies. It's not a problem since
> xe_guc_pc_restore_stashed_freq() is guaranteed to be called only later
> in the init sequence. However, now that we have _locked() variants for
> this functions, use them and avoid potential issues when called from
> other places or using the same pattern.
> 
> While at it, prefer and early return for the WA check to reduce
> indentation.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 53aaf937d4bec..d449eb0e3e8af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -891,27 +891,28 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
> -	int ret = 0;
> +	int ret;
>  
> -	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> -		/*
> -		 * Get updated min/max and stash them.
> -		 */
> -		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
> -		if (!ret)
> -			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> -		if (ret)
> -			return ret;
> +	if (!XE_WA(pc_to_gt(pc), 22019338487))
> +		return 0;
>  
> -		/*
> -		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> -		 */
> -		mutex_lock(&pc->freq_lock);
> -		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> -		if (!ret)
> -			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> -		mutex_unlock(&pc->freq_lock);
> -	}
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/*
> +	 * Get updated min/max and stash them.
> +	 */
> +	ret = xe_guc_pc_get_min_freq_locked(pc, &pc->stashed_min_freq);
> +	if (!ret)
> +		ret = xe_guc_pc_get_max_freq_locked(pc, &pc->stashed_max_freq);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
> +	 */
> +	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	if (!ret)
> +		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>  
>  	return ret;
>  }
> 
> -- 
> 2.49.0
> 
