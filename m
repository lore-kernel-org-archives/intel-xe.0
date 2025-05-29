Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AA5C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 21:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCEE10E218;
	Thu, 29 May 2025 21:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GflgA7pG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5980810E218
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 21:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748552587; x=1780088587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UQYxce8RejoBS+3XwjAI1rhDfR+zFwwCI36m+HdX05A=;
 b=GflgA7pGpHoJO5BQ4bF48ZNoPktJajjZ4T9M6lGCvofitLFZDUKNMHmW
 gxtsPSqn0v8jQ/GES+ILejJxHjoYeOk3Qltn3YZMGnq40qsUyWpscug0o
 UeSrix5dTCgstEhH67XjVWRsfrbdVm241RoJmMgL+BS6bmSQrzjkAQg9K
 OSjp5Hy+yTyNbMcfr1V/NGRfFIbpt17WrMyeMzikgX5SIqFSOvkpQDbry
 h65RSfE3o5nosaAYkN+EoGrMBb13C3XVXhNhhag8xdwByoL86bY4YPTpx
 qVJSFrfGjL+tJZsdbD/rjjc+J1ZAa/zxd5qw/PUJwrbQin5fvpVxM8hsu Q==;
X-CSE-ConnectionGUID: 5Nybq9AeR7aO+KCApDvGtQ==
X-CSE-MsgGUID: T/fqLi+0TuuuHRXtOkLBlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50639643"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50639643"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:03:07 -0700
X-CSE-ConnectionGUID: LasOL6CzSCWR8G07lmaQ6Q==
X-CSE-MsgGUID: EJe4IAhtQseiSZWLx/9x8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="180890045"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 14:03:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 14:03:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 14:03:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.85) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 14:03:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWgWjkvhfCSqqRz9GwStlqdRSVQJKvVVKEKgH7GA85EC9zhCdQX5T7gqm1dLiXmeXCr5jJTwSUkCev5o0uEtgMmfSt3xgDPoeJ8B4yOShOQWlLLvgep9jFJiYMYXc4apIIt2NPEONxSGJVwl8rGyY1IfFvRhkYOSHHxXmlK2PNg0mHF5MXP9wG+Fgt1ocloO8EGqfm/LByh5AQxO+PdJxEtGjW/gwQrt3jQsWxEV66p+RkQPmk3P6UTjQVtctYmD6m2pM/pecJFNxRv8up4s4O+fF4poxIiQSS9YB/0yPEXJJXQbmGyx47WLxzlYWozRt2M4mvA7iLZrpHdClRWQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaTQJ1caAb/YXixJYVgtiS6hMNmRsFiyxdf0SnkCLxI=;
 b=HdvGh+Zoqw5qBNfEFzvMNntuNeNJswD5lKCuAJX1a3xRxIiM2jQd1LVii4F6l8sWxaxuPguiTTOfgW+3SRmFHcgvYUCKx8RNM0Vjj0ZAvFivJQ6sOYP+mztqS1mRrMElXEQorIi5cxO3LaHPMsNc2XJ8lqU2ws5PeelyWZ1Tgzc2t+3dGGScSt3yOABuNS+4PCqi3SdxyZthCdMRzcLjr7f0wi72yuZI8LdAPM60PlBnPI+xO00l2j76opPrAKhL9L+L215uJEUbm/AaRRQneJEf3sdeWydJstLHpFFh28Y1gFY4yy9clixOBSL4TLdI0a0GqCebB5UmgfmrM69D0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 21:03:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 21:03:04 +0000
Date: Thu, 29 May 2025 14:03:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, James Ausmus <james.ausmus@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/xe2_hpg: Define additional Xe2_HPG GMD_ID
Message-ID: <20250529210301.GZ5080@mdroper-desk1.amr.corp.intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
 <20250529120534.531237-4-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529120534.531237-4-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a574035-6131-487e-684a-08dd9ef43474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H+sd2W9WBb6389wccgrCIXd3o4Z9/3+cS3Vbgmu4CUrLYmF7QvBtCgoJ+tzr?=
 =?us-ascii?Q?5fhvj1RnCva8toDvJZWgRsqwodOQSFaLhwj6JuC37Lx00v+7ADu2QuQlb1YE?=
 =?us-ascii?Q?6CioHnELNopoOaXABbuv/uv3lMxfljce5fFKSdtLoOh2LraMbYXuSsTBYJla?=
 =?us-ascii?Q?krX0v5DswxUn5NIl5ON3MLrBWa5FNotHCJ16lS8jtjoUS4PUszeqinyx51Zs?=
 =?us-ascii?Q?tJos/1SvGrkxW+LBA9IN3fEjfIPelZaNFBtScRd6G5yzv5YmZ+6WyNnLEvj8?=
 =?us-ascii?Q?kRw+UAr5QxM0Vh7LtzAEKE3+LYYdEIHqOi0JKNhbCEummV1lRr88jXkd2sHT?=
 =?us-ascii?Q?jrbO2SvWQfyMmQBLeZ7BcAXHLI81wQcE4nDNGHWPHJAjJCjZ4IIvINllWI51?=
 =?us-ascii?Q?iWYgvSac5nDFoDYIqtDie76qmTTmxCNPbXT4Ui6H8EJbvpVptS+CpqNQ6pqQ?=
 =?us-ascii?Q?QbbQ0hS62tDLv4sOCYtrjodisPlhHGBZ7QHBA979DcMVFbNLT/AT2/dNU2Mh?=
 =?us-ascii?Q?Zp7RxTjXhmz9iZasCUS6VSUuUdsoaQpyAM1/6wpFYDgR477mERP7JhpUsweb?=
 =?us-ascii?Q?jeOUvPNytgzEsZlpohOcC+v4DGlQFn+RaWosIotBuh8DKvkhAOLCjuW1iK3L?=
 =?us-ascii?Q?w4bHGsOmcP/WZFt9Yiqc/jkpVmYqQQG0jvLVfLRXOMc1cBUKNEh2fVTspuxm?=
 =?us-ascii?Q?RwTrPGnlpf9IaLRMBTp57v8JvdyTu3hygCICGu2mdMrV6XAURQj+jGbywbf3?=
 =?us-ascii?Q?Xd7HxqRjan0TrtNidXo0gUhlLJsvw3EKCEfhBYGf1Dy01JxMhz3fRxZSbvDi?=
 =?us-ascii?Q?cHacsiUHtd6ty85QucSDburH87cgysp6ZeJpMzstJuZcqUBj6i+4/IGrO0d/?=
 =?us-ascii?Q?7/KcCNUUskx4qLtRW0NONHuue8BsO4id1+/6g80lRvqmwQdEgdNpnFrDeP+g?=
 =?us-ascii?Q?TCDFHGUIAZp54ykwOfDIxE6/1n8mIErwGHtrGXQAGPYqQkOkOUcQ98fmgrHV?=
 =?us-ascii?Q?ZB33EJrEr/aOpLcbWB201Xqz88rp+8hfHSrQcmfmHZL8nD7tPzr+7T3hZbim?=
 =?us-ascii?Q?5SvM3OHWuqiV8XEWtyNh4A7fYoVaaE3eEFFgiWcNV1sgMrA/SqbyOJtcfigs?=
 =?us-ascii?Q?0EjStUjeq8lAkV3t1wpecpCFQa7o74gIjT3Z1VkCFkQOiIk2CCTRJ3E57X+u?=
 =?us-ascii?Q?ZxFmDmzrgRl5rdLOFQHzaoBaKXEyqPWFvsNB1gm5ioZeutXQpfiOMaBRqnp8?=
 =?us-ascii?Q?Mb+xfjfC2mNQeItcNypzJfIFqvD0dh/b1V+J+6PUAZSgDbx8WvMntRRB2hPH?=
 =?us-ascii?Q?DZtfPNFOTnJM1Nfu1uGdLhWsopJgFvYG9kS5sgKQFSBIb9ExxjfGRJZB+14s?=
 =?us-ascii?Q?aqOqLeI1GPTvSDc9a7SQU2N15DtIUo3d2OwO1sMTG2CPQ4O82oiQB02bOI8S?=
 =?us-ascii?Q?XftZl9Vjqq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5OFtRwDXMIMYH/fWI2gt3N39eAebBaUgjB8X0Dgeh3toKWQQn8D14MyJSWy?=
 =?us-ascii?Q?u42cP1WQ2Et6CRVgEkI2IdgZROvkF2TRpGuuGla0fXYw+YYk+SPWf3Ng0jdy?=
 =?us-ascii?Q?T6MVMRVNDUW3eElz/tyqhxdWOxXGe9JEzpqwu+gsw/LpRfUA7WCg5g8lm3Xy?=
 =?us-ascii?Q?ESfg3jFpvNK+wTrD02xLUPpsrRtU6iwKxFOdZ20lS9aiuQojUU7ioUVhfM49?=
 =?us-ascii?Q?6REKkY2ExGH1n90kLmQEn6evis+Ylg9DZoWX/EKEq1bLrV8qbVN4v8VT9+1g?=
 =?us-ascii?Q?Mi+Pkt86snLLjn5pNuEI8kw5/KbAhOlvSUrvs3AKK6BfLC4O/B+RFPBZHm/I?=
 =?us-ascii?Q?p66vvOmf+BWyGJdkIYPbrL7gIdMXZx3vFpS+VFFib5hfdDEyxK7Xu1AxkE4L?=
 =?us-ascii?Q?q11kUny2p1rHzJSLIwtwS07Ue5+lv5e6QhT7brD4RImYAQ3KU+6wAiNhgzij?=
 =?us-ascii?Q?15vM9q43zrLanj4ycekS0A13aeXpXYDF4vcJ2ls8WN+OWglf25DqaWz2Yixo?=
 =?us-ascii?Q?JrJGmizfkuWfzxU7c08ZbZ/CTTmlQU/cRFSzPnMDHpQzzE/pkAeBEMVwd9rd?=
 =?us-ascii?Q?RLpd6F7ES1c/OsNvkQJtQ4Jp9iaCkQw/Iv6KCvvT09QtreE18J/5Cu4w03dr?=
 =?us-ascii?Q?0bTmVdx+2g+p0cFq9YfJB7OtKk7C5VOD3JVQVCuLq1qeHCsbOpR2oYk/JKyU?=
 =?us-ascii?Q?R1Yip3LdGIbfyuxZecxHknoEetUtdgzhwaXcDtucwIir3TgZ89V8/WLHyIQg?=
 =?us-ascii?Q?p50V9oMNoEyT/2Gseg5ZlG2QlzKLMvzifD+rD+sM8gdB1jR7cio0pFFpStWu?=
 =?us-ascii?Q?d4tO3GZF4XjgHedU54MrBgaV44OrAaCIOqtYCb7p20ez31gn78r4QVS+JDc3?=
 =?us-ascii?Q?w0pqhw+iTGGSzexjlsJkUWo5nN6XaVekvz0gm0wZmZMuXFU1IZ1/RdZ71+Q2?=
 =?us-ascii?Q?hccRpN7bD6QsltkBDkeFavwYEUGt3Vm6CX6YY8ZdjTNJ5EHYHrGpk4DsNvlC?=
 =?us-ascii?Q?6Bwv3RanNzAP8EDaFWyiHw66CENodUQNVCM3gZWsS4pb/B+xK1zLPFNu9hYm?=
 =?us-ascii?Q?d/BcxGia67q7FfdHQjjRVgGTNif9Xp/2FxtRuQjkICU6oa4V5Q6l7n6yE5fm?=
 =?us-ascii?Q?IpEzCpZPOOgf1Tx69ftxqPzmpP2ALe7fx9BHEvFqR89Tl+lWyw4fFns5eWq4?=
 =?us-ascii?Q?afghAnyO7u20LBsRjksY0Wi/HEFR1JdK9gwZMSHEyyKCc6K03DRJ/+ncpDFu?=
 =?us-ascii?Q?IbVM99WiUE7exzBpLcsv+ojcDECkkbpBEDdVV+YZhmUXlRlsXRHRTebkYJjm?=
 =?us-ascii?Q?C+g9NLT2L2sht5BAZq7ggMVIpC279+A60dxVSaa4tWJcCnSBLh3eU5vj3/Aw?=
 =?us-ascii?Q?anf9sMJLFzYLLLThsclAImfViavPmw9sM2BEhInNANUx+7SRGiGjO/PCqxm8?=
 =?us-ascii?Q?WLjIVk/N9s1b3gE8nIfgssvzXvFQmosB1LoAAFopGY7qJ/s223dIxme3T0e7?=
 =?us-ascii?Q?pqL/wrdbRzZpm7baYC3vx+QEIF4k8x0XpwbxnwwTOwOxufoXVGzyzeQJISft?=
 =?us-ascii?Q?EmKjUBSJDR38+W6zms3bixucZQCO3ApaaUH6zMRIz5JOFCISkFLPIXD66jDg?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a574035-6131-487e-684a-08dd9ef43474
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 21:03:04.6841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KdMqsGt0cvnJIbSHZcDz/WY/qam8hGOnk/O6IvVQWHev4bGUiQGSxxDDVJTeu0VUuEvSMBUXAvT3tg/JKyFoJbLHFWJQZGyurep65GO7wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8455
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

On Thu, May 29, 2025 at 05:35:34PM +0530, Dnyaneshwar Bhadane wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Add another GMD_ID for Xe2_HPG
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: James Ausmus <james.ausmus@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b68c90910d82..83f0a76a81a5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -179,6 +179,7 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 1271, "Xe_LPG", &graphics_xelpg },
>  	{ 1274, "Xe_LPG+", &graphics_xelpg },
>  	{ 2001, "Xe2_HPG", &graphics_xe2 },
> +	{ 2002, "Xe2_HPG", &graphics_xe2 },
>  	{ 2004, "Xe2_LPG", &graphics_xe2 },
>  	{ 3000, "Xe3_LPG", &graphics_xe2 },
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
