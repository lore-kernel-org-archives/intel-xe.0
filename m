Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84DEC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 22:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726D510E8C2;
	Wed, 29 Jan 2025 22:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCJDfhi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F3D10E8D1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738188439; x=1769724439;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Clw1AgJGfuJvLaYAZrP2tf6q6RSXNgUVInmFwOaHxAM=;
 b=PCJDfhi/Ow3A/6W/zwCbOIj/b1adhicp8pyB33sbMn6uL+4NDxCFxFDw
 kV4fb73TyVT2gva+jiP4pV6a/zs3QzNdY6mcQ4VpFcyVeEdCl16qLEKox
 a9K1Kc9udvium5rg4/TAyObr345FrN1bnG9x/K4BOdHNbdIdGtVw1avS+
 HN++6oMqqKxy7ezcG4/y+TLn6klixztB2h0CPC9+Sb0bIzKHS/gFJmpTh
 REij0VbRK0rdgDlg+7nmeIP9nycVVOXAem0jb0hVkj4AhYmqBD+xEF8Wo
 slx7PJbBLX6cgTLAtznu1+hzhY/NmcsMUL0gstxMeH9HxSrJ2IU43jTIM w==;
X-CSE-ConnectionGUID: jJ6tsAKoTpyMSNUUzzBPEA==
X-CSE-MsgGUID: q9tQYRfjTeyCVsdVPXH6qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38990964"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="38990964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 14:07:19 -0800
X-CSE-ConnectionGUID: G4SfBaNOTxGz45OKOglWeQ==
X-CSE-MsgGUID: QAfKZwZBQJW+hDQ/3R28Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113167906"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 14:07:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 14:07:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 14:07:17 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 14:07:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8WtUN/T/bbh6jtrS+YIzFGehHWIab58L6qWZYt/aaTSegS1Jkdxr3pJ/AKo46DlIj42NI1sarv0mfCX+m0L9A3kfpkk+myZIDSfcZCDN7+CfNixcIW7pz7RPHKPnDQYVQFFr3+Wc4cCF0nIyyPPuoak4FyrF7fd08SJaDA35FqZGQjJtpKMV0GLYY20gdkEW+0UMdpraCJVhJTHsNxQMxMjHtFbmqrB2ZGXNed3l6KNI7i+ZFRClpT4JHP/QWZhBg674yacgAPK8W/FesNnsnsUZlJFgNZFjcO4hsECSM/lWsOTtMSp88nGk87Lks7SAp/nMN8/r2KOJ6aBx3QX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ig5XvNO3rr1bWPc7mDzbW59bIObR2Ir4c7LFS4kaL8Q=;
 b=alHAq97z1HR5ZJp/fvogG/OkYhq/1SZl07HQGOHnMPUTSl9twou3YOXY5oYVZNVuIbLI3y6kmmhpqzWtIRMrGUTfA+0xyUF5ehtzxD5w9kxjHTeJGMe4KsRlzIuanigqsYqsB0y6VJ1SpePTQRWuMxIsDkrhmtExhjOV06LMMl/1Sjz5Dl2OsAbyUWGMIPqt/z6zTCey7Ds1oVrJw9FifFdDvfZQQNpw97TMXWhzGWAzpsdT716kwqb7I/0eMccXouFjtkJ5DY/fqbiWPaQYbxNKNZ+sqTL5f0kv4hb6KMaRKV+w/PwUn+iiMqDAeYeA60LBOLwOO9a4fLyVdxcNAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 22:07:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8377.027; Wed, 29 Jan 2025
 22:07:13 +0000
Date: Wed, 29 Jan 2025 14:07:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Refactor dma_mask_size
Message-ID: <20250129220711.GP5109@mdroper-desk1.amr.corp.intel.com>
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
 <20250119123644.2881474-2-sai.teja.pottumuttu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250119123644.2881474-2-sai.teja.pottumuttu@intel.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ae9f13-be56-4afc-9845-08dd40b148d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QE8hivDv9Rh1a4vwd9eVA/SDeZ60mBCR9nx4/daxJela4fQDJoO+t0hz+Nfu?=
 =?us-ascii?Q?kWjblRpWaOvOoLmoUEm2VE3ObYuGA14jxUydgP8aAiE2lgKCCoJFx1JeERtR?=
 =?us-ascii?Q?XMZQjLRjCoo8UZFjPfPxbkqzxetl/o24tAp8UHdgysq4xAxJnKriLQTw00tl?=
 =?us-ascii?Q?7m5eNIEAouwIyW0B/hpt2JVXUSi2d2/8r+Z6do8t36D6XwgXvY5wC7nZ/Yyk?=
 =?us-ascii?Q?CqVpVP4o3i6Yu+M9AF1kGoeiviqRgc5U6/pDrH1RmsTvkxOkx4lPnPlQDIKI?=
 =?us-ascii?Q?JZ9RI7RdU9JmUkG9/HEIB/GEPXLIaHQMBPvI0NiG1Kjn9+SkHoJiEGwtWuIr?=
 =?us-ascii?Q?/hStPmfbbZty4Vp4TPmQYIm4bPxFFicw9+vFdqIXUUxH+dwMfHC8peKD8w2t?=
 =?us-ascii?Q?uwoAlKxKAZLfmT4c77x7XSkGXXRjh4XuuEAErN6X49CIz39MEr4TwrbF8CNn?=
 =?us-ascii?Q?YJ8lWWqyJQXy46L5NcNBBXBHm+m5Mu1WAoEDEo0CLcWTlFuC8/4TMtBmkJwK?=
 =?us-ascii?Q?JNr0tE/0IzinTcYp5loe9UEWajVzkyUC0nSFZ8jgl4OSAKNBZvmAfv2Tw0Al?=
 =?us-ascii?Q?8g0jFwxQyJ5FEOj3Ze97t02+ZLbetzwNpq+PrZ+jZDNbxUdV+tu/7kYqkzz7?=
 =?us-ascii?Q?DZKqm50kJ2AYNFBfePPqZmrgy8p2tcx1oi6y59wGVcVLvkyzI54skAj30E4e?=
 =?us-ascii?Q?liomfU6vpFdHj2bm20ziAIH972g08fxlJH/MXekxIR52Vv649OynZYEWnnG2?=
 =?us-ascii?Q?lD099j+S4eFC/+6KdLXy2nwahNoNXc7NhHHSGJnRITel/Y4dqVS89xBqFMCk?=
 =?us-ascii?Q?RMqzGkZXeX17gZvzaVgPvBJcDQPl0GNBH71lNSfQUTSCiGSSx9HRqYKAVdYw?=
 =?us-ascii?Q?sDTrU1xH4fde9jqT2rYOz4nRRML0WoScqe4FFGgieZJucP9uTVkei5ZrpS2f?=
 =?us-ascii?Q?Pwqk4NyMuj7dKzY1XUX3FTn6nIbMtc+JKOSVDlME+42f2Nyga5gLmjcxDkRw?=
 =?us-ascii?Q?YnAeuueHZebSZ/MANxe8HiGtCIzA1GXoTnnvK+EwCscyhE7W+6JzWglQ8i8N?=
 =?us-ascii?Q?2YPnbYG2FmIuhNCuSdc9mfOn1R204kwvg32YyP+zc1nI0gpe9KWy8wcdeZfN?=
 =?us-ascii?Q?pZYXbBoHV9G2RX1Zkpdo/NtcEpyaWxZjjQO5LoqyE1BFNgbF3/Eh99q2xzAy?=
 =?us-ascii?Q?wiOCeX/+twNExdsr8bESiHtczp+8CLhpPVIj4GcFb1HnNVC6ZjniurqQPiMR?=
 =?us-ascii?Q?9A4qkn4vLBcpBjDdW1orFQgujKlIi0YL3WTa6C8f7yUPIPG2mK0iW7SWmQkv?=
 =?us-ascii?Q?5mlux7Xm6cePq0JyL2MeRCelSLKXA5SNvZ3QVf5rNkhbFellZi9Gn4GvbF2K?=
 =?us-ascii?Q?KyKtxZBQWwgHGHckrojkfFKjbedm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNQT/9rCCKvS1Tf6b6jWOe5S+Bt7JHW2ND/ideNqbPAoND1lY6YQScAOWvKS?=
 =?us-ascii?Q?hKszkPK/lfQvE8dWzAq/AzPyuMzIrj+n6HoVGhhpvSGhZU1eNvLiAwOEJNeU?=
 =?us-ascii?Q?rqcseJDosmF5TLJsg6MYpgxDTStpzDtuDe2ZaR/pPXVudGutr4aTONL46p2p?=
 =?us-ascii?Q?vcMgbFeEwWfd0PoWj/gvtjj1bQY1Ns3a3EzLNykJj1HegMguRzS/ZsPQv8t1?=
 =?us-ascii?Q?CkWI3B9in4YNAV1MIaqyAHyRpq060rhAfvNGt8mgB0ptxo5VzhMUahLEJGEm?=
 =?us-ascii?Q?BX4lKuuYPIujncxiwZqr+LzLbMheedLATa8JbFdERSBSxcxE4PDUqu3LTB8h?=
 =?us-ascii?Q?LTab8ia9QJf8xnFAbDe25qEKy6LvI+i1N+MyZx42UpwYtIGtg6Ymfd8uBiQD?=
 =?us-ascii?Q?qInZPJLxIk9++fr8e0qyDFwy8mDJ8CZXXXb9jgtUewfnN6X4A0bLXDNkSPp7?=
 =?us-ascii?Q?7max3s0nrrTXmWk39LlNfgCoGukgJmQh50a/DOfW0oAVa1vcAdnfzf7II/8y?=
 =?us-ascii?Q?3fInzfcHihusiRDqoSxmluOMtDQ7lifOOtFDKBWHcko/tMLeN+Zbl7LUY9NT?=
 =?us-ascii?Q?jtOFP547Sk7+ewELSAMZ0PciINd+1Nqyu8eqDrLX/mYsHJ0lXOI7YI2q/lV8?=
 =?us-ascii?Q?o8KWW30XX+h8DDLn+qTL0ayH1H+fHL8zjrWdDbdjlKtqenUGlIKn5JuNzDi+?=
 =?us-ascii?Q?LVhtsAbMw6DIOf2Cmg1YafMEO8o88mT7wiT01ahZCU26gYZG7doiPzpQBnfp?=
 =?us-ascii?Q?wvGOH9exvXDNBUdrhzPBsOPHr7dJJxMc5b/O6wcn/RrmQ7VcCY429W9Bnici?=
 =?us-ascii?Q?8w5v5zxyyoIyM9GCuY6iXeyqiqSEEsgkpZ9UxVokncyXoS2H9PoGuHZ1Cxcp?=
 =?us-ascii?Q?l0FTkXI99pbU2ddWo6MJ9bSQY6DlD2M6aCwE8e+u4ZhoJ9qJV5aAjTSsHg6V?=
 =?us-ascii?Q?oYl7pbyGZ8AhUBXEOvdmTI12WozeSwvn00zNr0z6pqOd+KXiohzAHApzyioU?=
 =?us-ascii?Q?OmMVhAFtysd1xxhsWyQCMqJCVxWWemfQzq0+LnFRHFyANUgqeURDC3m6b154?=
 =?us-ascii?Q?ve5mW/WhvPz+W0zACYnbM1G8WBR8NigF0Svvoe7E4ZjcCONN/GqCT5SpycOP?=
 =?us-ascii?Q?jLYJpjLtw+6+ww+i+8yb6mWbQ+YpDdouG1tNf4TowZmPPSEcCIctDleoy2hu?=
 =?us-ascii?Q?J8tCamP+EjZIV8859HrNUAiN7MiVfffcCf3fGFCQeIB8PqWcSvGluTtaWZL8?=
 =?us-ascii?Q?Xb4ANcA+ZFnRbG8EMdQkmN61yEZdIdgf7kJ/wVeh1YSWqBP71FEIKH8PGsQb?=
 =?us-ascii?Q?i9HQYKYbpmT1mLlQoQM41M+djV6+4HSYsncou0pJ7Q5dhDBrYa8UpmiAmMfG?=
 =?us-ascii?Q?EUU2BhNemi3+2Ak5Yu8J4Z0NsFJDji0VhAZiS6CjctCjOgrkc2tPIN6ZhvaY?=
 =?us-ascii?Q?wnE9BOXePAibNcl7AB1kxlIUhS4MTgomHZcOV4AjvWNNBt5UbJTB/L/EHXLP?=
 =?us-ascii?Q?3rc6kpCrSZM/uknhqQ6yu65MTIedCvWc7EKZ0TbY6fXQwhoSraM+SaPZq2fG?=
 =?us-ascii?Q?nD+e+UQbcV+QIny+ae9ynKC6pxM6nHNTRYvhvt6Rf6y9dpRuvtpwKaPgwqlj?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ae9f13-be56-4afc-9845-08dd40b148d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 22:07:13.4052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJX7H890iHrbAGZJCiopb0MIFT8vRZYVj79EZLJ4uNI03+G9b+e3v4fWZX0LwlqE9PAuT+NhIq2YRzWapINyo8GppjT898iNOyiszMmg5iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
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

On Sun, Jan 19, 2025 at 06:06:43PM +0530, Sai Teja Pottumuttu wrote:
> dma_mask_size is more related to the platform than the GT IP. Thus
> move it to platform descriptors.
> 
> v2:
>  - Rebase
> 
> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_pci_types.h |  1 -
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e6ad189294c1..a6395050a19f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -54,6 +54,8 @@ struct xe_device_desc {
>  
>  	enum xe_platform platform;
>  
> +	u8 dma_mask_size;
> +
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
>  
> @@ -83,7 +85,6 @@ static const struct xe_graphics_desc graphics_xelp = {
>  
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
> -	.dma_mask_size = 39,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
> @@ -95,14 +96,12 @@ static const struct xe_graphics_desc graphics_xelpp = {
>  
>  	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
>  
> -	.dma_mask_size = 39,
>  	.va_bits = 48,
>  	.vm_max_level = 3,
>  };
>  
>  #define XE_HP_FEATURES \
>  	.has_range_tlb_invalidation = true, \
> -	.dma_mask_size = 46, \
>  	.va_bits = 48, \
>  	.vm_max_level = 3
>  
> @@ -137,7 +136,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
>  
>  	XE_HP_FEATURES,
> -	.dma_mask_size = 52,
>  	.max_remote_tiles = 1,
>  	.va_bits = 57,
>  	.vm_max_level = 4,
> @@ -158,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  };
>  
>  #define XE2_GFX_FEATURES \
> -	.dma_mask_size = 46, \
>  	.has_asid = 1, \
>  	.has_atomic_enable_pte_bit = 1, \
>  	.has_flat_ccs = 1, \
> @@ -218,6 +215,7 @@ static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(TIGERLAKE),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -227,6 +225,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(ROCKETLAKE),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
> @@ -238,6 +237,7 @@ static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(ALDERLAKE_S),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_llc = true,
>  	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> @@ -254,6 +254,7 @@ static const struct xe_device_desc adl_p_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(ALDERLAKE_P),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_llc = true,
>  	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> @@ -268,6 +269,7 @@ static const struct xe_device_desc adl_n_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(ALDERLAKE_N),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_llc = true,
>  	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> @@ -282,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.media = &media_xem,
>  	DGFX_FEATURES,
>  	PLATFORM(DG1),
> +	.dma_mask_size = 39,
>  	.has_display = true,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> @@ -305,6 +308,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
>  static const struct xe_device_desc ats_m_desc = {
>  	.graphics = &graphics_xehpg,
>  	.media = &media_xehpm,
> +	.dma_mask_size = 46,
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> @@ -315,6 +319,7 @@ static const struct xe_device_desc ats_m_desc = {
>  static const struct xe_device_desc dg2_desc = {
>  	.graphics = &graphics_xehpg,
>  	.media = &media_xehpm,
> +	.dma_mask_size = 46,
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> @@ -325,6 +330,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.graphics = &graphics_xehpc,
>  	DGFX_FEATURES,
>  	PLATFORM(PVC),
> +	.dma_mask_size = 52,
>  	.has_display = false,
>  	.has_heci_gscfi = 1,
>  	.require_force_probe = true,
> @@ -334,23 +340,27 @@ static const struct xe_device_desc mtl_desc = {
>  	/* .graphics and .media determined via GMD_ID */
>  	.require_force_probe = true,
>  	PLATFORM(METEORLAKE),
> +	.dma_mask_size = 46,
>  	.has_display = true,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
>  	PLATFORM(LUNARLAKE),
> +	.dma_mask_size = 46,
>  	.has_display = true,
>  };
>  
>  static const struct xe_device_desc bmg_desc = {
>  	DGFX_FEATURES,
>  	PLATFORM(BATTLEMAGE),
> +	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_heci_cscfi = 1,
>  };
>  
>  static const struct xe_device_desc ptl_desc = {
>  	PLATFORM(PANTHERLAKE),
> +	.dma_mask_size = 46,
>  	.has_display = true,
>  	.require_force_probe = true,
>  };
> @@ -618,6 +628,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.subplatform = subplatform_desc ?
>  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
>  
> +	xe->info.dma_mask_size = desc->dma_mask_size;
>  	xe->info.is_dgfx = desc->is_dgfx;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> @@ -682,7 +693,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  
> -	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>  	xe->info.vram_flags = graphics_desc->vram_flags;
>  	xe->info.va_bits = graphics_desc->va_bits;
>  	xe->info.vm_max_level = graphics_desc->vm_max_level;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 873efec5cdee..7437415a54d5 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -13,7 +13,6 @@ struct xe_graphics_desc {
>  	u8 ver;
>  	u8 rel;
>  
> -	u8 dma_mask_size;	/* available DMA address bits */
>  	u8 va_bits;
>  	u8 vm_max_level;
>  	u8 vram_flags;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
