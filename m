Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D7D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 17:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923210E435;
	Mon,  1 Dec 2025 17:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6myd5FF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F8F10E435
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764609440; x=1796145440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ExP7ySzA1q8xTFKU3cEKGOF0kb+oYT58b2VoPZ35RP8=;
 b=j6myd5FFmSsZwjyLZWe2DCKk1v9EtV5rWNwGfEVKhWyQa1UMDoSXOkuP
 pHMQtTfT3qAJDSe9kpbH4Igr7/hX05rWw7EWg3Qgb9/Q0dRAtLswDUmQh
 GE4Oi4qoB5tYKiGWPPas57rEli+d7Fr9VmH2boGX6npXeEglYPSypcyIy
 z8rPKVrGhNpT9TLnvaxJlRQdeiUXCebPeYwdUfIvuYYo7xRUBOoJnSzBr
 NgHwzNtS+1WnIlBLazVdf265oE+PKFFheI42Gv/SZckThDkhxUkducwvk
 jl/X5E3KsQ3e0vxJ8nc36I2J21Vk5/pQV0fsnXlG16yVfSHdXD2VtvIk+ A==;
X-CSE-ConnectionGUID: yVz/8sp4QQ+jpwjxiLbaoA==
X-CSE-MsgGUID: ZTwwkMxISNiGkPi0tASPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78024440"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="78024440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:17:20 -0800
X-CSE-ConnectionGUID: ESQGYLrARymxPJs3C2usTQ==
X-CSE-MsgGUID: RDwqOix+QLSXtrS7b6d3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194332223"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:17:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:17:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:17:18 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:17:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQA2bR/HlRTZSJCzdk7Z+M1Vtn3ndYGyVVdFFCdEINP6IqQyD87dNwrAEkKWWGsJAps0FsvCFWBzEbz53jF0aVRe4gxmM84Mu464I66UPPZIRTmT2PJvGvj+kIZJ/znDgNeUJvmCLBTZM0PxEAWsjyZuoVWuizdyqQ+yBveXHz/PHGMJnqocIAHpYjs6m5TexJ4a1796qVqNvCCalhPqewFw8H6tiEm6jE4KYIaGMx5kVlMnE1OtQpwP8WojFokgnSl05p76dwlpXuf/EnZfaUTdtNG32ZRxww/Jd6P0D5s/WEO0YTInJNF6C782TLrL8Qlg9MZlsm0LKTCXrwG/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFem1q6C2bg+Aw3VfQeY3obdkMUuUIUaWuZMhZT82Zg=;
 b=fQwwyGCfycc9AKSzb2cAIn1dMwmOmVhLXMzLxWSVFL2wAgxoY/Agi6By9kXF+n0TqTq3iT4Dyl3W8VhG4q8McXazSmXDnsaUAbNlpabeLjobwVRkZnJvs9HyXh2ellSB+4KCL79Vhw4lxpi/4HxXMXNqKKg22Yk2iLaE8mh1YT1jAn2spmWfJ0u/Ah6RVpv3nVF04GUfRErnVj034/EX/jkKRoturr/eKqmmCcdcZeqqHRjd2jT+q3KcVTFvGasDcDwJu2MtPW5c2pdn1gkOwZQBvuzE5MGzXR3FM7aOibWxonT/CbLB2kk2/KhFJ+dXFm1OXaKZMMN6558qTT8vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS4PPF178D5B043.namprd11.prod.outlook.com (2603:10b6:f:fc02::d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:17:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:17:16 +0000
Date: Mon, 1 Dec 2025 09:17:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <gustavo.sousa@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v1] drm/xe/gt: Use scope-based forcewake
Message-ID: <20251201171713.GF4065316@mdroper-desk1.amr.corp.intel.com>
References: <20251128082212.294592-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251128082212.294592-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS4PPF178D5B043:EE_
X-MS-Office365-Filtering-Correlation-Id: c93cb187-086e-4629-0608-08de30fd79e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w0etjZOWnZR1Ux08f7lCALigfhGYpm/GIQRB6m2s6UlkwSwCTyrt4sLXsdFN?=
 =?us-ascii?Q?6nP5W/+KykOThtckQnBwR7CNUcZ6qCtCxyUENrhR4IBPFy8ThbEisLDstRdf?=
 =?us-ascii?Q?93TBemqfU7Ux/deeB0k9AcXdg6Dthr6TNdvT+FOPivUAYgYp2w3LNirPfbQs?=
 =?us-ascii?Q?FtAv+YgQ24kfwUPz2U1y6k6Gb7Q14MMcdaLAZFuTEQ4YIY4qfe2FXt8CIPpe?=
 =?us-ascii?Q?ekT/WUx/0fHxkCp5anJKnPdP6jQKtRBNla2i+Ua1TbjxpVQB52MKGhFvkR5T?=
 =?us-ascii?Q?AZr0yo+5P/h+kslFRTWMvi3SyQfSa2tm96TEBKt1xbVmmo5KbuxNJKmXTy5v?=
 =?us-ascii?Q?7LZlk3SyqNnpD4N79Cj25YGOk6gd7Lc+HzNASxbSoNibrrpglbX9nLskFM/S?=
 =?us-ascii?Q?/HfpbHNR1T3v81s0zltasExbXpl3Xfj93iR7UFh9c2UlTULYovzar3FNoxaY?=
 =?us-ascii?Q?dU/M3OuwvMhDqJ9DF99ydCB9TaDxHk89vbyUQZR18nBIFG0a49LkvmwOXXDK?=
 =?us-ascii?Q?PCZR1HyszK2EDasOPOuP9iloJREHI+HJiQG1p+I7sr6ymZvy09QVpp2WPpjG?=
 =?us-ascii?Q?+yy5o6MHjGCIpoFaewPvtxxFRT2Tbv5PLmzHZCYExQO9FybrtBAbEC2G1zwW?=
 =?us-ascii?Q?S8beQ3PgiPt1R84EE/FGUDZcDfB0ssHJ4w67Drq9QAhOku7kHlPTlcqv8NbS?=
 =?us-ascii?Q?Nufh6WOxpyiP079umPPjzKW7496Xgq4r+azW2W0eo6pRW+c9pWS7qhJ7GHcT?=
 =?us-ascii?Q?uotK3wIRsD8Jmipjpr54/UssgB/LuvVPR2w4lv/t2eqtHGtupylb/y8u9irl?=
 =?us-ascii?Q?T+5nFF3tQ5PcdT6quQ0BC/eURMDBivYXpWy3c+B0SPpWi9s6Nsz7AY+Z4tCo?=
 =?us-ascii?Q?r9TFeBfYF04GNOZIHrcJJijaUC8Yv+vWLqp67isp8g/sThlpXYCtrNQtKfgj?=
 =?us-ascii?Q?BAFJ4kf1EnKcqDJe5bSx70E03OHbRoxlE1SqFoT5K7cm12gNxUzen6oWLaNk?=
 =?us-ascii?Q?j1+qzSPpfn71x8yGdGu4g+883i7SzTCKRKif4VhnAglKGJNMLWxqg5jAeH0t?=
 =?us-ascii?Q?jyf522nsrzJWuEt4BO8q/hU39hytN7MQVMAWPQHBnzNIJvpvK2vRkgnA14Sa?=
 =?us-ascii?Q?4U86MMelYzH5wanbZTAZ423wtt+43QONAHU4xKD4OpiCs6K75pH3xJtnOaLU?=
 =?us-ascii?Q?HunwjxPHTOMOLwkYJLoQVzZ8zoXjLtmDh2cgKlwQKoLqEoPVBUhToThUN07i?=
 =?us-ascii?Q?NhmX4EEt7aHNmQsejiGEZIJZdmAgfCkK+gf7Siup6mwlv0oy3aUoZ/+uNDnb?=
 =?us-ascii?Q?PIXFUEL5AmxrVDhKa3SRGOlkayt+tuEF2MBvi17zo+4NPmduvltfPw+x5mxv?=
 =?us-ascii?Q?wBJcHENIgFwaUXJzM3/oVsIGyxc3Ci7C1MgTYqOlaKM6hI4FY42dZTBnl6Mm?=
 =?us-ascii?Q?jNAg0zWBjTcNcyxn7MVy4MY28M4vDyNb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TrR3veLmffD04OGDIWB+sVi4DndhCLTPBP/K8K0d3UYgecZsrvW4s0XYiE4c?=
 =?us-ascii?Q?gsumAkdSSdexSNnzJkjN4QPIqAwYSUEj9OVmG6j4JGkJ+tuo92eW8QpY7eZy?=
 =?us-ascii?Q?11/YsAHRDviBrpXR4Jj52Fxc1X8YzRg0yjhFQpzf1plB5KpDADuq8G5mGn8F?=
 =?us-ascii?Q?uSkFj9sm4SjD7tVVMZNDJWPwAuiHFNZY6S653nm45iCm4zeMXg220OyF1HbB?=
 =?us-ascii?Q?rBZk8MAKElfruwSSJw5JZrLBeB7y99mHYCERPdz1XxraeS5DAedwA/WSvViR?=
 =?us-ascii?Q?ApK7X7Roo4jLjMvJCk8NwPK0C0lMolHJoxuOZWtZMtOoesWCyYsKjjE/y1N3?=
 =?us-ascii?Q?FSR2d/MoLruP5rmBz0W1ObHOpGmBS1iCPRCvjyLRMT92UIRaB/mjCsqp/C/1?=
 =?us-ascii?Q?7j0P3PUL7oNdI0fLs2NDVpO0UPqI72WAiuUsTTvCvNg0bHGsaDJeOhyueZjx?=
 =?us-ascii?Q?l0AEUNg3m6Xr7r+bT20IGEhOsO/I6PkbmzTG/7zJ0+io3B/oIYjuv5sKgC80?=
 =?us-ascii?Q?NYW3d43IKkVL4SzSD1K73JQLIm1zVPtJQAuQG4oqY+5okdt4ExHXu6cbyjyv?=
 =?us-ascii?Q?3NhcvDoFc+/Vx8If00sW3QCH4nPNtSvl1yOyU4YPmRXZKYVcHk2q/kSLGUC7?=
 =?us-ascii?Q?K2XSzfZRCE50lf/1lQx1j+YNBwjVb2CnS6jQzRbeqkiKA+uuzxd3P9clGJ8r?=
 =?us-ascii?Q?LANRCC0XmyTyFd0xTD/CGxSDPT3j0emoNmTwkltIIIBZb+a9nLCSya+3q/o+?=
 =?us-ascii?Q?aE1HcM+ZuYwhUmJ3u6zJ9qW3Q0hovg2aRYQsKlJMHjt3QTTkVVhv9Af/Ou7T?=
 =?us-ascii?Q?MxskPb730aWTvYhmqf90Kc6Xj36uKFZtGhe4uj3N5DN9v78XK6u4OgmsrZP+?=
 =?us-ascii?Q?h+37prEcK6Qcsg3UWKEvQo5WpJfD/kAHEdCwNFY4zPjYNTnYEs8fyHXtFW9t?=
 =?us-ascii?Q?GNV0ko8/6J5K4TKOFh8IOamaO7R/JLpEjRmsQ38U4rQOoU/uC9AZRuSiznFB?=
 =?us-ascii?Q?+GgTM5mgoOnhuapo+2d12oM2/PbY2MqIdqNaJ/tsAygNgUv3KKmE48ZYKphD?=
 =?us-ascii?Q?YLhE6S5aav5QDko/B/2D8kunZSKweSmSVTyOZ2Ia0FNvz7UCeV32QR3eq1lC?=
 =?us-ascii?Q?O9DPlXNVRglqASBhwMegLuyEQT/ocLkNRGBR9XWE2YeYdF/Inq6+RM6QvyN/?=
 =?us-ascii?Q?8wAJ0uOe3mtorKdtbuboEmUufNJGuaD7eW34OrJb91BYS/u8yxKYJ4mwKpXH?=
 =?us-ascii?Q?O+fTOaR58R3iDpt5SCjJJAH8pyg/uYY3GQyFg2MNopOvc0brVCaGh9Ze64sT?=
 =?us-ascii?Q?7u/U3lFO60I+9uvDaDwbEMW5XgW/Fs8PUw8HSIV+/7Ag3OvU65a8co8NtALj?=
 =?us-ascii?Q?2trgN7SYVBCmdDNWPFljy5ABGzmzBo2F8d0L+Q1sexSBk/vFMbZOIKWkQ2QK?=
 =?us-ascii?Q?UWddx0NDp6fotO3Tn9/wrveoVLIgyvW5GdbkrB8oIKd3D23fHRbYfqeRMwf8?=
 =?us-ascii?Q?uw2j/bXDlmu/5B50wvkdYgbkYonIqUMQrtdbq3BdwW3pvjprqXAYOguCdho3?=
 =?us-ascii?Q?UNpe+hRiZ0kepReY3tqgE51YKApHnaF+Y5J4HEkMumISBkIbBYGjFDnBzPd0?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c93cb187-086e-4629-0608-08de30fd79e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:17:16.5186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSUf9dYtYa9049JekePWlUIwIFL2BKs6t60mqsCb6KbCPkkPGxCWs9FIf4WKgXy9kf6XCho/HJQeVrHuy5fYOStgPd9vcsHYHBn53x9gqhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF178D5B043
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

On Fri, Nov 28, 2025 at 01:52:12PM +0530, Raag Jadav wrote:
> Switch runtime PM code to use scope-based forcewake for consistency with
> other parts of the driver.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 32 ++++++++++----------------------
>  1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 996756d1fbd5..1bfde7af90b3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -964,26 +964,20 @@ int xe_gt_resume(struct xe_gt *gt)
>   */
>  int xe_gt_runtime_suspend(struct xe_gt *gt)
>  {
> -	unsigned int fw_ref;
> -	int err = -ETIMEDOUT;
> -
>  	xe_gt_dbg(gt, "runtime suspending\n");
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		goto err_force_wake;
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> +		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		return -ETIMEDOUT;
> +	}
>  
>  	xe_uc_runtime_suspend(&gt->uc);
>  	xe_gt_disable_host_l2_vram(gt);
>  
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_gt_dbg(gt, "runtime suspended\n");
>  
>  	return 0;
> -
> -err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	return err;
>  }
>  
>  /**
> @@ -994,26 +988,20 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>   */
>  int xe_gt_runtime_resume(struct xe_gt *gt)
>  {
> -	unsigned int fw_ref;
> -	int err = -ETIMEDOUT;
> -
>  	xe_gt_dbg(gt, "runtime resuming\n");
>  
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		goto err_force_wake;
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> +		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
> +		return -ETIMEDOUT;
> +	}
>  
>  	xe_gt_enable_host_l2_vram(gt);
>  	xe_uc_runtime_resume(&gt->uc);
>  
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	xe_gt_dbg(gt, "runtime resumed\n");
>  
>  	return 0;
> -
> -err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	return err;
>  }
>  
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
