Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABAE77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 19:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A420510EF80;
	Thu,  5 Dec 2024 19:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IERQ+pTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723C510EF80
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733426832; x=1764962832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B+lgFN/JJTIYxXWilV1qN33NXiMTQaIqK/EtmEu/Vvw=;
 b=IERQ+pTYq5s97bMhr6Q9VkhLxyjEPLRhe0PrxenrRspo93984Wk2DL/a
 t7eG+vPa25rAzQVnWSdNXlZ7G03RLRTK5FvnSZJxIy9GnfvQEPqN8ZXyg
 hJtwAraBaau1C9k6UFsvCxztzEnUBLFE/KJYJz2Sc1DdCsGqSL/hnkM7f
 sqWJCx6T2zdCTikN/jQ8L/zaZuAtXA6MH3c+B/5nhstl5f9lwOE4AlZTQ
 dTvwupRtEpsHEjwPGyoG1OYi0wHtEzibc25nYpSpB+qVnBRO33CDD+BIG
 bf+cPdaM+GShAAi4/PRGWJmFMpnSsdzkJSok48bIZNXGqGS/HmxWOtZTr Q==;
X-CSE-ConnectionGUID: m8ULkfvVRLCbMQ1t7jY/Pg==
X-CSE-MsgGUID: FAgyNdqST3ayah6+STmJPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37547726"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="37547726"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 11:27:12 -0800
X-CSE-ConnectionGUID: dRgdi7bKTmGwsyJOgOgRow==
X-CSE-MsgGUID: A+iu4VSoRP+87KqDue0+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208";a="94267656"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 11:27:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 11:27:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 11:27:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 11:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp6h8ARDniir+7zWa1C/TxW2VJRK0rZVdY2WFtzopLu8ggVWVz6kpWTgwBx4d2jWzubtY5jlIdGs4Qk6+vSvlcZ1HsY1o11FvEa2bD1eSmVbka02g74nAbqWce+Zjv86Gx/HaLRJ//cxMo/YvI3vuCzTgHGbcM3a3gZKGvQmC+VaIGul2xk+qo21zlr1DyDCa8bqddkbMpxCsZHbdWVe9NC/DzZW9odcQbu4kFQhpMYsIy3GetRvSS4SZUWkGrCiga90AYSi92QEhll2xTCURnNFDfdivkxPA8BWhI7RUURyG/VWDdfN+syxRSuryWgEQUtDMz24w6fYXkP0kw3IeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIoOoMFBmM6tQ/UcEdkPwBiunRRAEv/TYdZAKckBcEM=;
 b=A7akn4SaO49xoiAPvfwtJdLFXJ4yIigsUttewsa9jnAsZZd6PtUsUpjeK5XJaOBzqW6nXKueObqkTsVmTxw1bD5Zgt0F4hs6k2KPEElFk6raf/33+hpEfrFrm3KuTm2vv+D1yBsv8cPtnsylxSINT53LO1OU2UDiyFXpjb6hyJ1DLEV1zJ/ZbNfo1SWv5INDJcUbNcCRwyZTwmJZxknnHIv11wO755FxHPo8iC3RazImUN96NhHttw13kFdGgloMe+xfV2VvtHQGxH8YgoT8nwe5wCtZjE28HkU6LxoheL69DGgjpv0L+dFQZ+oJ6EUzchQvtfCdvS0z/vYXrx2aLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8322.namprd11.prod.outlook.com (2603:10b6:a03:549::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 19:27:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 19:27:07 +0000
Date: Thu, 5 Dec 2024 11:27:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 3/5] drm/xe: Add xe_gt_dbg_printer
Message-ID: <20241205192704.GD3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
 <20241205182240.3463027-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241205182240.3463027-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd656c8-f77e-4c36-ef54-08dd1562ce62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hFbIEjxiLLRca9mjBvzLJ3fLDC4M0zIenunb7m46ZO/6rHTAr9gLnlW/MLrD?=
 =?us-ascii?Q?5DpjKYog4L1ie4I7B9cgbtM70NlZz1ZImDAbrtBHBW3je999ABqhA9MUzuqI?=
 =?us-ascii?Q?f+eE4HEI/VDgAx8PhOU74853BfM0VgKRrYitiG712N44mBTRPfxV8PJG25M0?=
 =?us-ascii?Q?g6CwjLX020nc4YezZ1+vorO//cPo1Um5ptFDvatbZnbEcsA+m85RoSPAoSdE?=
 =?us-ascii?Q?FHqwgxnSCQq/KCr3vLkltH9mOmu678BiDLEzUzIFla1WJtQXH3poL6VZq2iG?=
 =?us-ascii?Q?dy70EyJX8vN2nJf8mKB4ZRjiHeAZ7nIJFUmVXH1O1dZlW+ObOnvp4bfdWxd8?=
 =?us-ascii?Q?0pxg3IfPSqETgPbIDft7k+57n6sKSiZRR1ESz04QWL+xLPMLb8uys6LK4A31?=
 =?us-ascii?Q?Ujtj9YfQzybmvO3y5NQXAayVVEIcoTTYplhoPjKzEI9WusEQAKJzT1kDD3qY?=
 =?us-ascii?Q?C7BNAAy/go8pCXrV68Jk8N5SkGF4mov9oqolSTYl8D5dlnCDF+bv4dtg6po3?=
 =?us-ascii?Q?49pEm9zMyg1/pHvG9XioVjqdh7Km8GaKG4z2Seuh7dOf5v9e9WYuN6cUchlp?=
 =?us-ascii?Q?MxyGsc9LLf3yehukTM27YLvVQD+RBdiav2RO8f3kLIqqL8g2/qrwwp3DSvRe?=
 =?us-ascii?Q?sQCgHlqm4roFI2UkOQLHoP864uesDYhpeaMECxiiCFikO+X0MsTat/IACM4k?=
 =?us-ascii?Q?nFwvQMzSktWbVBm+6Tpw0wAKkEL1x91l/7oYieIOXH+Q/TNQ5suHiC+/m8j/?=
 =?us-ascii?Q?eGndfnIJa7ZA30/1FuzdkRdEr8Wen6abQQQTZjxeBCZ2si7FG8Ip8hldekC0?=
 =?us-ascii?Q?wZ390ehZBmhsN6zPC5MWsKzTc8XoSKACyYEcLIofucpdKbUQ8T/1nhr/WcK+?=
 =?us-ascii?Q?IMew2SDpUeOQAMTM9q1vLcIrkPJJfEHVwn5I/F9Ui42lNSHbb1ZtosufGvvO?=
 =?us-ascii?Q?XLQlrIZq1GVn9QfyJNPf4ciEJkx658476IAJPcJj8L/LmPqZHRwKsmw5sGBT?=
 =?us-ascii?Q?vwZlrFvD2/UAOoJqGGAk4l/4srVlHgL8yXmQVWhqpTkGdI4F8cxUvY30Uz6c?=
 =?us-ascii?Q?dQAfJUAn+ntn1nZlxKDpB9G9saYljmk2u1y1C/VADc4wlfTg7LUBA5mfxX6P?=
 =?us-ascii?Q?JlPAAjPVtK04e8corcs0Y9cv/m++3ml9o7QXluEC84F204oK3NL+stkTj19r?=
 =?us-ascii?Q?285fYv4RyNSxyERurjwavsMAkVQX0pwUxnTCOVvopszaAkeuS8BZH9y8Hy6X?=
 =?us-ascii?Q?6reFVZApX5Ig2EMYvWpDlkZiIJ4gAoIeyNGRlaqCKNqnoM601Rbk0EJyVBZ/?=
 =?us-ascii?Q?ZulD1Zq5umt6yGB+aqFkZW34JLn1pd84TJQ3hcK49yEp/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kp/xaDdT+iwFcmsfFc/me35RYU4VGwTPFqHD7gs+eB0h3XzS+q4Uq+MfktMX?=
 =?us-ascii?Q?Nv/N/gGFWYbrX6WhIUKHF/G9wg3gzy/r7zJZEqVLTU4/HRrbGNSSg8/B6PFA?=
 =?us-ascii?Q?4OIeE1hVrRCQF4BcLKO31Bbm7w08QHyWXYnG0sUe0ZZc3ugioe3raUC/YglC?=
 =?us-ascii?Q?dEgtNgIu9/VJljKpkmUzi6k068IDYfduwLM8747/Sc7U4WRufGcEAIbOXxVb?=
 =?us-ascii?Q?oOwTb0KdBdOb4pYY+KLpdXZqtE33qbTBukZuhnvdXzXwXkUo5bd4GgGhmkzN?=
 =?us-ascii?Q?BLHX1uHQ/y6NDYfqJwEBK8xV8OjqAvElykXpt4ERDMsi3tjpp54Tu5nGFO/5?=
 =?us-ascii?Q?TWy53PbuCSEdgpm21aHGVdgIrYmBGqFmq8++qgQQPPB6idEwjZMzgnHRyHuv?=
 =?us-ascii?Q?MjIe3N+4ZNBucPIAOgOnPDQPfp/J9gp2GtIl+Lwtociydq9/xfAQEDmSQJEU?=
 =?us-ascii?Q?p0LYU7HiD6LJ9IYYUcVg+dACvYrHFtg+WnxsYzw7qXyJOdfBvBnjcrlcmXj/?=
 =?us-ascii?Q?6gu720lG4LEN4ikSsid+xSQ8rA5GKSZaFDRfIE4smnb6lfjrgomx6haQoGFc?=
 =?us-ascii?Q?sPlk6QEGj2I1WcbfRs3IYAVtIz+g/326I6dGqZ0sUybelJb/14QmeEnYpXD9?=
 =?us-ascii?Q?Q3DKAxH2IrKiQQ6yk6eQqyCko7DlRgYHkEn2xuBfgtkLnZxtDwDTcRXyAwV8?=
 =?us-ascii?Q?JpnOZx1vqs5bvh645e16HKgsZ/fTBoJdnlZQi8JUFFVAkceX56LXfiTjb1xj?=
 =?us-ascii?Q?HKTz39R3Yo6Synn0HeS3TdsAvLcsfLnMLdYM1KQdExBQK9qI4boZyBF51JwM?=
 =?us-ascii?Q?j9s3F5+KQi+S7KYGTrTqERfbLMweFeNARNVBs0vjIC2+DoFcMbd2N8EcuDWY?=
 =?us-ascii?Q?8YnYFjWmERP1T4tlY806q67Md7buqL27fhsSg0Yxu+CkeMbFqgtf9MiLXSTi?=
 =?us-ascii?Q?eUsZClvL5wsms7g1H+msajiX5VhXspOd1CqkTcHkXXWBMiyWiIRqfrYe/8t5?=
 =?us-ascii?Q?0sHYqSwU9OdJdgFB/x2/lZIky4BfF5UyJdjxvPjixRG/GSp2VJMApKXPXJjd?=
 =?us-ascii?Q?tjAd9ELBmZFjC+MBlJS81Jprd5dkstDFXgJQpFEv4edl00zDaMzNaHtEyvzj?=
 =?us-ascii?Q?LKKNy6hG0OMy7og0KjeHnjkdgchDNLT/3xgqxntQFKJ5BZ0LQRgUSyy9MD8W?=
 =?us-ascii?Q?hxz2500t/BCQkSouKhP9Hb9qgRdaU36Onhj+YzLKubeKF9pcYmdW09LJovtx?=
 =?us-ascii?Q?uyytRulAWAsWQrP7OhhPXzireFp3EQmaSIBu6yyzlNYez8ee3RNP4PdBfK7R?=
 =?us-ascii?Q?vhbIx8WkiEacyeDshl6MpfP21DTVBUFNa1o2zXINiJt1u3Gvl5MpY7PdYug6?=
 =?us-ascii?Q?5PmK0o5Z/VgiMy//gUE3H2XkJGEp9ls/UXjMCUaF+2Z0BV0rW1hHlmFUvvzZ?=
 =?us-ascii?Q?7iLZPNUqwSSRE27gc2oxXW6klKYUNVjYUXSKqj8djvIHmCrvWOejPttV6OL6?=
 =?us-ascii?Q?0AWgRmU+QC+wrioFzlS8Z/0V3yeowqFl+DteKpOSEaVml7hVOWmg94f5rAHZ?=
 =?us-ascii?Q?kpXj4YJ4dgVkpPyqrelbAoVRW3QFPrY9SSpliLWo6ybcpUrDJTzWkM0usRXD?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd656c8-f77e-4c36-ef54-08dd1562ce62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:27:07.1793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCvT++VInZx4A/GnecPKKVBaf4397V0+MnQc255L4oDwMmdL7Cy7jSS6Bu3csezALAwJrE61zFgzKGTudNB7kCNGVedGFj3kcNxA0dMOxOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8322
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

On Thu, Dec 05, 2024 at 10:22:38AM -0800, Lucas De Marchi wrote:
> Like the info/err, add a printer for dbg messages.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_printk.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
> index 5dc71394372d6..1f27d9f75bae1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_printk.h
> +++ b/drivers/gpu/drm/xe/xe_gt_printk.h
> @@ -60,6 +60,13 @@ static inline void __xe_gt_printfn_info(struct drm_printer *p, struct va_format
>  	xe_gt_info(gt, "%pV", vaf);
>  }
>  
> +static inline void __xe_gt_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
> +{
> +	struct xe_gt *gt = p->arg;
> +
> +	xe_gt_dbg(gt, "%pV", vaf);
> +}
> +
>  /**
>   * xe_gt_err_printer - Construct a &drm_printer that outputs to xe_gt_err()
>   * @gt: the &xe_gt pointer to use in xe_gt_err()
> @@ -90,4 +97,19 @@ static inline struct drm_printer xe_gt_info_printer(struct xe_gt *gt)
>  	return p;
>  }
>  
> +/**
> + * xe_gt_dbg_printer - Construct a &drm_printer that outputs to xe_gt_dbg()
> + * @gt: the &xe_gt pointer to use in xe_gt_dbg()
> + *
> + * Return: The &drm_printer object.
> + */
> +static inline struct drm_printer xe_gt_dbg_printer(struct xe_gt *gt)
> +{
> +	struct drm_printer p = {
> +		.printfn = __xe_gt_printfn_dbg,
> +		.arg = gt,
> +	};
> +	return p;
> +}
> +
>  #endif
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
