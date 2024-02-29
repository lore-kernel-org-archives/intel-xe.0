Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC56C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 21:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A24D10E637;
	Thu, 29 Feb 2024 21:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPKMEJYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075010E635
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709242310; x=1740778310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5rVIxy0VaDDjUWvfgv/uOBJ9nrt0I32bnvC1sN2E400=;
 b=iPKMEJYNR4vgZke/IBmGKBvm+bQPPLkw0PSagDnMlD6JMQmPdZ0P3FIe
 /1mQlfRo0/labExDLJsULYdp7SPYQoXQv1dwQETJhsh63xZStdekhPLY3
 8arXDr9SJWYvqiSM3+Q9+l2RqSeD6HCiQaGmwN4A3hSDpd3M7BysfgWja
 KndIDgaWckCamFHu9rnsm5fly3Q5j5G50MEQWWMSuJ1vTR5pPBgywmiXr
 OvpO1ymrxyeI0I2z3a1fFGdhDHk8Fq1NkKPLFgLGxD1AZ9pJLBTgyz+ff
 +P2pooPbV1FHlutND1GktomgL11nLxM+g37Aa41ZVuPM4gS/tHqseYHys g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14456371"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14456371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 13:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12631558"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 13:31:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:31:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:31:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 13:31:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 13:31:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zs5pMcs2gd7+83p41vF3NG6O/Jh6UdWP5pf+fmTdEybinmKzIyxciVGWdvsHZtnpisxqRXnghz4NWec7tlgemoPISgpgRiwoAk/Kx5mcORyY8GPBeDLW1dp7ed2qHF8hrouZ/LneI8MbZdkZWsWzJ1Om08jI0cCXpcUbqYZK2HV79+s4P/jZUeWWqkeChr2OnuXiJNx4AeJJdNfKEpXMKqSw0U+5OFUs/buR4zNcBORcUnh679jdw3UF9gc+zmzlx4bVg7g8aF80vMpISsUtFYkB9GZn0us3cI+Q8V3xJNgHQUiF8HyIVBumwnzRm/Yurtgbv2cORHnRdEqJUAn7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2v3c1SnnTHbUjs3dSz7UUea1FreKX+ISJxF5Eh61Uw=;
 b=nHEAEh3x79X6HE2KevXRjGgfXgy+QHbhLuU30MA7bSRHrCfUW0FfuzmFQoYD7G+ue7ZPXkmVFWA8yT4uJYBB7wSamkc85qiuPhMvauR6bRHngxX3PZ2hdAlk3ABSFxI7WDHLxl2q3WYSayoAfK346nwn5YbaywJhawJIs7Ws+9Cp/RlJGFkmG0+YZKn17XLDLVNRM70dC3Rr5JlJfoFvoTY5DsuIHTeW6trP6EGVRSc3HgD0N2FoSF0hPOoznHZow5srF0hJlenB8ZC6PtJyysqduwFaN4wx7lwFVhQ8D+swiJY28e7Sjg4f+JWWLBbbCRU6ojWGLh9Nzpi+fjQYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.16; Thu, 29 Feb 2024 21:31:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 21:31:28 +0000
Date: Thu, 29 Feb 2024 13:31:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 5/5] drm/xe/mocs: Fix DG2 kunit
Message-ID: <20240229213126.GS5347@mdroper-desk1.amr.corp.intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240228061048.3661978-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1a0656-6bed-4bf0-6229-08dc396dc9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZK5J4SsO2JullnMJESVQ+FYl2kQ3eVqjJC84v3+FUkkRvDIYc1DAvjebxx/cGzjZdIaRZk6pZy+GFcqu6fZPwgCaubN399kKBGnD7+xupK8/A420cBLzcnRDfn6fMd7b+p2wQYZKBBI5KfkWLNFk2hFhJlwUWmI+Lzfe0z3pjhf091wVz+a3XrvBd8+gJyrmUG3WToGh3gVByZSABAIwE2Riss6ctlmL7i4gUBreitTeMpSlfr/P+KZa/isz935FFiqAaConOoew+DscwhMA+wbVza8otyOikS26liXBQtCnNMFyNyjLCETI3en5ycuHiFLsHWyb3XRLaZqb3eFOrF+yuSdaEnosXLLqMesIlr/pGg6lyIFxjtBezvXKnoYuA9dGktGndOuOz+XjHI5+Fp4ZM9Dr5GsEGMA4kcdLtGY2d+qlg7zAf2coZQbmLZAhtEUQzNTcOa10MDEsff7qX5sfogvVB2qU6DwKGVfkixGDQD3KO9JZvteuDMDSv9EqhLw1VYTAo5gXr7v3KrkZEyqdm04KBWJPIa5RSl3z9ScFRNbLHk79ZMnvhbiC0r1H+WzBZTNtKjC3VSmftbULBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ScgzMp3ZMR8H0+U3xqYBHIqVobviXYrGvNztS17ATVnM6XSdYbQwKDm60VmN?=
 =?us-ascii?Q?B4mORNj/RPZhBMS60OcOliqbDVKfjYqG0pR6GiwmGkPQoKwqxBfse8xN9F4Z?=
 =?us-ascii?Q?xcrWKwSNhDhZhLrbKRksR3OakI6h4ifVDfp5kttq/gqBsLXdU4r2Vy4v8HE2?=
 =?us-ascii?Q?S9WzfBZalQc+oi2/OBDMzRHvT47ypCC1GQ487HuvWh4F1gPRIKfpiyvdCmcB?=
 =?us-ascii?Q?Cs9hHP4Ci6xvlz1NFQOFL+EW6JmyeqCNFoyRoFfIgEbX/t7N5aMMCqCM9rX5?=
 =?us-ascii?Q?DW7C2fvDrUK+zpZgHD6ycO49Ow5Zi4mgWn7GgYHG1Wpqk0DAOB+ZDZazK3tY?=
 =?us-ascii?Q?vhvqaUSZ3G2XosWMfk4w0XDK+NCiPPT/YqcWHFf3BaGVm4y+Ie/yJeR9UURp?=
 =?us-ascii?Q?VpI3GqiOXPcAA+WtSZTIliJ6T2S825rwQCdbguGEPVxlCxtpmVmD/K33xdE5?=
 =?us-ascii?Q?kL1a8RMe0YVH1e4SlXiQwt+ZTCKkB7vpQ6tkfgKQsoQMzKkx7dnAtln7Degi?=
 =?us-ascii?Q?f+8vyL1Jv2hJOngwWVdVCW9zvYs5A4hOPSoiQJhi0ZydxucNAQc4mA1ioTCj?=
 =?us-ascii?Q?35lkbRTF0GmAwaqsQ8DfihOmqTKbyaIQcCeTPzqYKNh9nQMk973ddQevf8EK?=
 =?us-ascii?Q?aKhJAO0fVGquA5/ahybTSbO+BkR1VYLEv6zsDUL4J7QuTC6DBYDehKZmXl8X?=
 =?us-ascii?Q?avm/Hbt7bqBtyQh6Vc6LeBP4bBHqClc399BsTlFDmTZwp57Y7ZLylvI6GIUz?=
 =?us-ascii?Q?RUXCHzT1JL7cWL1AxrzV8mYVxsR491SqtGcn3RYojSnV6uphlO1EwqGnGqOR?=
 =?us-ascii?Q?7eTGTVkZi6BEUcpZp20X081h9UFONHlYIO1hh8FgkdKaxuBLZyiPOQBrzMAE?=
 =?us-ascii?Q?yjV0ug2TjFPXiEjFvP15Rm596hPTcGWIeFBgaSPLuYBnOoVubo9jD0LYaUR9?=
 =?us-ascii?Q?84cn0GYV2p+os9IL+twLO8vOTnd4rq9mQSqZUn4zKkUMq+sjYQnTelKwKlDz?=
 =?us-ascii?Q?HhxjNx2tb+ba0IXx1SoKVwWQYRpmf4cs+Ge7es7brL+gkbx95rs2w7o1a0UE?=
 =?us-ascii?Q?F5sUK6owTiuUgZdqNbjtNlPgQh2k18Y13QBUjwRry01VIYTgZwYoK24bzbU6?=
 =?us-ascii?Q?4i7rbYr1+rDRiaUFd06lX5Yw4NIIrf/oI/wrx89ZhtEMPm5vYlnZDPgWHVFH?=
 =?us-ascii?Q?LZbxrvMrHicFE7gP145tTi00F38Rr5WbN7cEMWToC5b2pYV3Zo6yvgWC+H/M?=
 =?us-ascii?Q?BPB/D49kD2ZwC/rpmLAB1gx2CwXrGDgACn+g66Bks41nDy29b5qGn0gSHncG?=
 =?us-ascii?Q?0Fwf78JH2Dndjm+1VWdImf6zjh1zv7InkHrEmFQsRaD7iG6KOMl13Iuc+Cby?=
 =?us-ascii?Q?ZMhhJpzVGOY7JqnNVFKCzQSgVjGwp6yT7kpiSK34ZMRz4IxS80OKfoXi5Aze?=
 =?us-ascii?Q?xIN3vBLwO5N7rrHscsh+jbEWjcUHslQP3yuCkER90DsvVvqwAvhOkw6uh6sd?=
 =?us-ascii?Q?ZyZLG9dkqtA452JkkLZPCP5cAzss3xnNDtIA80W5imq2QLPUGUmQcvSnvOrB?=
 =?us-ascii?Q?boDdzTlWAKK8E3Rhp1AnvXbU+QZmhjasLAqPDQ5pOJpJWnKXHo/FSntKdHdt?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1a0656-6bed-4bf0-6229-08dc396dc9fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 21:31:28.4164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yp2sF230HNRidXzneb0Ci9sXuiIjgpgx7cUfGOa+Wa1JnSUBE9s3dazV80RKpi+O9TMmDktbpH0hV3QjeXBI/tLaR6bZ3sZbUknu2/nVmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
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

On Tue, Feb 27, 2024 at 10:10:48PM -0800, Lucas De Marchi wrote:
> LNCFCMOCS31[31:16] is read-only for DG2 and MTL, so it's not possible to
> check set it. While trying to set doesn't cause any issue, later when
> it's read back to check if the value got correctly recorded causes the
> test to fail. Now that test is reliable for an odd number of entries,
> reduce it so the last entry is ignored.
> 
> Bspec: 55267
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1253
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1233
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 60ab34fd213fb..f56f630fa29d0 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -72,7 +72,7 @@ struct xe_mocs_info {
>  /* Helper defines */
>  #define XELP_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>  #define PVC_NUM_MOCS_ENTRIES	3
> -#define MTL_NUM_MOCS_ENTRIES    16
> +#define MTL_NUM_MOCS_ENTRIES	16
>  #define XE2_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
> @@ -401,7 +401,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>  		info->size = ARRAY_SIZE(dg2_mocs_desc);
>  		info->table = dg2_mocs_desc;
>  		info->uc_index = 1;
> -		info->n_entries = XELP_NUM_MOCS_ENTRIES;
> +		/*
> +		 * Last entry is RO on hardware, don't bother with what was
> +		 * written when checking later
> +		 */
> +		info->n_entries = XELP_NUM_MOCS_ENTRIES - 1;
>  		info->unused_entries_index = 3;
>  		break;
>  	case XE_DG1:
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
