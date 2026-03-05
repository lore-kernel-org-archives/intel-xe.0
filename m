Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C60F513E1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DD510EC8E;
	Thu,  5 Mar 2026 22:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7XYtwgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3351310EC8E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772749432; x=1804285432;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wC6QBuW5IsvL65USUXQtgejfonaKoGC66wPoQjypIQY=;
 b=k7XYtwgxe6zX5K7tW6dZnbVWBUYAx0yUGBCB7QQYVlLASnIu+Pg8aBrt
 hgTXbIF6cCr/Jtwq6i+DUvh0yZWlVzz9Prc3xIigrnoNwCK5Yfm258XDN
 zsyi7M1d91mJL7WXNHcMCESgRXTWN1W/ylAd3qRpiJB4OptwXoPqcHr6X
 EJiM9uVIcxn0+wqy/302yVbxutXPATpdThGBOv8i+iUWlXh9Z7JNW6TlQ
 Q2Web5SRmmgGt00tj2zHuxM4QtnQ/6xfYBVqe8wR2YD/ubB+EK7DlZVnV
 6vAr+GoCZt1NnxtMfYVKG+2kL+KMFngfkqo12u+FkQva7WiTdYGrG9MeJ g==;
X-CSE-ConnectionGUID: YUslQLz4So6EMTZ3Qe2c6w==
X-CSE-MsgGUID: ZpwiGPuHTd2jXdx7XWX8hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77698827"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="77698827"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:23:52 -0800
X-CSE-ConnectionGUID: h4NbPb6bRdKOlBFVRjUnHQ==
X-CSE-MsgGUID: DgHKyj3UTIS7TjByCPyoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="249289960"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:23:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:23:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:23:51 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:23:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHHS/hQRJO/auHJcYZmpmd+QcWrPA2ZimFo5IUiBzD9E+ws766fq01FU4n/3ctSTWgIvOcukN/GygcchIk0ZM7gaQePvK7DuE8IyAG9VLn9L4LCEB7GqJZm7pyhYJwDgaaPJkQGaPBIvIMueaM7CwHKzQJFlNU2GCpxklc+LuvqHfYe0MeRI789f/TtvJqBdFehuygZtQigVeXuT8sp3KV2+TRsKtOlgVl+FU9FZ8ppe/9+xesEqSb9w19N8zxfp/zPghhwnC1zbLAKrPf2S8i5Wx3RUALLEUO80TQtXkY90cGiHSE73ZcFdC1QGTedcUl7X9W5CIfdyCXETHRIFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWASYGLCTqUgPvpBS4+iVpajed6QlSiQ6ZPVUTbkG3I=;
 b=AHp5/D3N/fy9+gelpHXGLNX6JS0VHHdiHQT2yqC8Ysh+jc8WUTOPr3K6MrEg+b4C1VEOjOupnKUaOBqNuxZdLMEc4XaMxvXaR7jIH4grUHgkBKWQZNH+eaHyKYKo+d9H19VK4wCZ83c4vKyvLe+t6ni6S8PWAp3MGhEcAbgyBajbOSBMq0JE5YjabIvkaQPW05suV1QvXtPxCkNrXeEpwA0aR8U2YPNn7qZZPL1Tykg/KSIc0gQzN2/941axwogVMV1Oskr/NxCU2SFAOk1vWMQtwEAEpeHC+Czzq1gJ0OA/4dfTXToLLVKuusONNrucexhCX24+GRd/W3lUewh6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BL1PR11MB5303.namprd11.prod.outlook.com (2603:10b6:208:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:23:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:23:48 +0000
Date: Thu, 5 Mar 2026 14:23:46 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe/xe3p: Drop Wa_16028780921
Message-ID: <20260305222346.GT4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-6-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-6-5020d5289dea@intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BL1PR11MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: 499aa1f6-aa1b-4ce3-d77b-08de7b05df69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: J44vVOw6UT7qoxwyPL9rYvEUztCAx+sL4/M44oN7lszH1tf2H+m+8Oe+5eRjB06a03dx1HwtYoBtj+yOPq1GKhCmC/G65J3Q2Vfc5UelTYuCj+gefBjvBEUkf683oiGo/Oh0QYO4aRJ6s8XAI5C8JKuKrXV+XjSrm+FLL/eaqKzIgyrn2QrF4HhuZYu840OvLgVtgUhvbQMexhV4eP2o7UtFulAEglmWAycqgHtCuIpHg38h67jklqwT8Lc/9rDEWddsWJpoFaT9IY8o2vScrPTYUTJiWfIuVdazNsEqhmgUYhkYUb3hyZpJ9cIBd9dRy2l+fLcvBcfDYRjtUSx31GWzgnTIY5/wvoStUVZxPO6pwpkF/WoIo+rVyN2tReWJJQKmH/AIPJw5j9S1X2aF5EE5vDZ68h2IU8Qv+Y0H3h2RzBajTNtElOEFIpc3DBFe+8w3Ak9IgUigYzPkEV2+PfCJvHGDFWCgxeJ4S+iKgiM7ozEjQZ13UkfCfMCVW+CpaeLUiR9GYY0bjjL/yXtupu/R2039ovkaOG5gqv7nCUY7RGNAHPrWt3eQ3SsN4ZfRQh+4veppOjeJT5ahDFvHbBgR4bzshZaU7R+eTU0OMphaU2QGkGGpC399TMxOssfbkI4/pOexVu5cdozwY/+iPMfVXy3LZI2ndRWhhBGhzno0aNC3+BmGdmNVAJtfYFcT9tsvtiTj1Tths47YoyaE8AzgT0ALSeanU3NmhCh7BP8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A4rFbuOJftWR/M/r1MTfm8biE3YEuyZbvVQoZnJlA286MzJ+GDjdYzEj26QE?=
 =?us-ascii?Q?cQ7BH4OBWQJ2OtVONpVo/Idev1FlhZipqy13LYICLuD0HGy6JvUF2/801JcF?=
 =?us-ascii?Q?gbJM2G3ldDqCHX0sDOqmEdS0m21rMAVPfedlT5RCzCqcsfcJS8+wlVpWRiFA?=
 =?us-ascii?Q?wrvvbaUekrmWSxZ6ftEpbS0qevj7ndGDe4uOyqfloIqXTrkzNSSbbqynRDm9?=
 =?us-ascii?Q?+0lrqbPQddEqwVasugWI8GOKycsa5bO78bIflBQOJgSei9wYwaOmxB16x2pZ?=
 =?us-ascii?Q?C4KFXI4v49UirmWW6cIGmAyM/jlMJWwLXfKS/600h/XhSlHlckA5xg/zTbBX?=
 =?us-ascii?Q?wzjqy7iY0QgV2E1U/HBxlD1mg/bJqcxgAHhcXpQzTk8gQQ5P3z4ksMpQOsmH?=
 =?us-ascii?Q?IriTrsM1P0Biot87nXRPkrvRaNCztLoGNHsq5FFD+VgusBfiqPTB/ligML+g?=
 =?us-ascii?Q?ooso+M6p/3HjEGX9sbZbk536tSSBM/s8Du0VT1GCMKeNtrUUEvcNnzmixe7H?=
 =?us-ascii?Q?3hl9hkR9GgwX5psjfhzrstscQv824s+fJvVo3KMsvbrY0cdOsGC4oTJu8JlP?=
 =?us-ascii?Q?O2VQHOXm5IuHHCS1tG/li/J880oEQVT8+I7ridcg5yiqWv11CF5RBbOr7Th4?=
 =?us-ascii?Q?WQ/375JwOBPhh8Bp+WMVcC9SoU9KcV4SA3YQcr5bTlttrMMhdGJVsXpKRJ8U?=
 =?us-ascii?Q?9aflk8aaawstOLVIfyPp6BZEg58ukC2DCMyaxW7WehtmXM5LD7lGC9m8QcLh?=
 =?us-ascii?Q?iKUg0c4YZZ1AnZiHRxG0cGlOTq3byQ0D9+wvno1VaCWGSO3KsiUijtT4pZeM?=
 =?us-ascii?Q?2aPcowz7gH8/biC3xFmeKsKgYHWaJmz7Qbjq7Bix0adFC2bCUcXypS34gREu?=
 =?us-ascii?Q?hYNnjYuREx6PIV6gYT+bHyOkWXNHXhxr4nYh5HbpR5Lc/LwgZmzqctpDWW3M?=
 =?us-ascii?Q?O7CL1Rkeh522S4+BsUNHM5GQY+nfhPnKqwSZIcJ9SuyIX0X3W7eMdDqY2hLd?=
 =?us-ascii?Q?/NIX+KxYzgVK2lPwKB2J8HbHH5uH8XHrGf7yontcXxhHjA9SbDFaZswfC/4c?=
 =?us-ascii?Q?NpI3DUYl2sRmQJMqyudvXnDrAv31EjowQiCuyWBQTji8L8acUXlA+gie6SEy?=
 =?us-ascii?Q?I+nYlNq3/iCSjoZgmeMHR9CdsF/XlrWsEwtCnpt7RVvAxVjac20YUy3G4KyC?=
 =?us-ascii?Q?GpUbNoW7bcs0Y+4cFhHp0A7Q8h7zl/a8fFrJY02dL7+q7IsxW7wkGrUNNcaj?=
 =?us-ascii?Q?biM/mrG1KPP84nuXyyysBgzEBd1FAx49cqj3nC3M6+pgqyUsqrJbAQIHc1OP?=
 =?us-ascii?Q?HdvHfl7yDo35SXs2lPfSydEbmwX0Xks+mJiA2ryKW/AOW0FVVFN6W2O0L5ql?=
 =?us-ascii?Q?ES2Dp+H+v2yXR/LPMlwgegGc+J+GRCdTqYJTY7dNOSAdfmxp0FcgiZxxPDyf?=
 =?us-ascii?Q?3B/7Tc+Zl/e80IJc4cB0KU/+Flf8Z0n6z7lNiWPaDXpGwfVJouccbRU3OkNM?=
 =?us-ascii?Q?T3SwKjheXCkHDeDrdlEj8xh686JQ6L/ZNIatBYLa7P8hoGihloAElxlXCoTu?=
 =?us-ascii?Q?c04UIlcubO5zn03RYZFwe8MtMQk0DLsAmBtMevrhX0UNMsOgEQjdTxBYF29w?=
 =?us-ascii?Q?pOFMm0ZD0LL+KC5QtJnG+/3vcy4uWoG42uCZoYiG0cYVBxboqphUB3bcAQC5?=
 =?us-ascii?Q?W8EEZxp07HfRuJx8GADV8ExrfGUbG/c5vb3UoHUAXQf5ApAHyvPWfL1K4lq6?=
 =?us-ascii?Q?JmvTgcZiC9erudCrdHfqGNMsAbiAvUI=3D?=
X-Exchange-RoutingPolicyChecked: iu6M2GVl08nksVfY5j2xVvqiAjBw3Jyvrp++MwROqNWl/Pfx91KmOFajcGP6B5xc/48K/9NNx3JM15kpPtlkEP/lWEkwOx+dSSc6AV0JH8cPvb4Z+ExWWjGbGFv1SDfPETlksWfdO/C45ghSAtwrGVebfA2cXtqMLieQlEVeSvwHd58uPw9SOwW0S5jWohcFnXKSITQcAlK9gLdSU4JcmMyuIqOS4kNke6/nGDtFULp4yKDsAfajlUedTqgOfBcm3Wn9WXmwd5sZbSvBD9ChDluq04mK9sqkGRHG7OHUhQ7xBqFFh0b8gn+RISa4Kx5l3D0FYHk1SuAIybavNmL6mQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 499aa1f6-aa1b-4ce3-d77b-08de7b05df69
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:23:48.7936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvebktcKofBSEeqVBF2q6+9DnCF/1vZtheZrVvoc5SosdyFKMaHuHJha8Cfbprss0BKmT9K80SqgdOyOA8s2jqz+mxUWHx71oyo/QBpNtvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5303
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

On Thu, Mar 05, 2026 at 09:02:33AM -0300, Gustavo Sousa wrote:
> Wa_16028780921 involves writing to a register that is locked by firmware
> prior to driver loading and doesn't have any effect if implemented by
> the KMD.  Since the implementation of the workaround actually belongs
> the firmware, just drop the ineffective implementation by the KMD.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ----
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index a83cafbe03fd..f49a28f4a330 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -218,9 +218,6 @@
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> -#define CCCHKNREG2				XE_REG_MCR(0x881c)
> -#define   LOCALITYDIS				REG_BIT(7)
> -
>  #define CCCHKNREG1				XE_REG_MCR(0x8828)
>  #define   L3CMPCTRL				REG_BIT(23)
>  #define   ENCOMPPERFFIX				REG_BIT(18)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 183c5c86c35a..38881b1aaeb1 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -287,10 +287,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
>  			     DIS_ATS_WRONLY_PG))
>  	},
> -	{ XE_RTP_NAME("16028780921"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(SET(CCCHKNREG2, LOCALITYDIS))
> -	},
>  	{ XE_RTP_NAME("14026144927"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
