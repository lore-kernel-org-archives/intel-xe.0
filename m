Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5580D2F338
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 15:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5526B10E48F;
	Tue, 13 Jan 2026 15:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knVPofW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A4D10E48F
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768318474; x=1799854474;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rPSzEWSKLKXKZ6/c+QzSWjA9djuH1ZxWsMW50U2I74g=;
 b=knVPofW94nbbaHKrVXhDc1UyjIvmlSl02Eae0mQUMfrn9knL+tyS5tA4
 csNFEzFKKCip9IWY9wgcatcMx+Jro8OIm1oRU1it/m5k/zpmWfGvUkbeG
 Rm1YVGarSoI41JH2ce/mpTft48aYUr1bBpKpZGc8r+j7PxWCmvzx+18KW
 k3xZmtpnRbRQRmYM3ut6OikXZo7OCW1Z91SGBo6dxyixxTv7D2vy/YC2b
 MwGqbDDlYYa/pb6470mHHZ2HjSkuzpvanpquy3wGBkfxikqRcyt+rskHe
 x6e3Qurhm6i/pgb0RK0bNidg87up4PWUtecyxN+Yo1Bo4m49CLm+iafvL A==;
X-CSE-ConnectionGUID: doIO7u3lT6WpLbjYczon9A==
X-CSE-MsgGUID: Hz+GXkTDTnakeWnZmXeneQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69687233"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69687233"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 07:34:33 -0800
X-CSE-ConnectionGUID: LTLIf3PQR92asBCOTE2oIw==
X-CSE-MsgGUID: 2CAHjG5dRWOwCZEAJ4O4iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204816795"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 07:34:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 07:34:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 07:34:33 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 07:34:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OK13YKlErImA0IP7RT91I4QTH6VdaX4R2eXjSbpeUTZqSMEOA3aA/7rkgjgjPI88ngmBIhtFPZpOWI/Oc20JO0Z11oDLkszOvcTrohajWYtL0vSh7HxTf/YXaAUdXLo0LKfFEa5aU3WbM+8ZvykcvffEFxFDYxrC74y4bcCLeEAAoffbQ8R0+p2az7aRQVtIdV7VwAa0QK0nociw+kSZb6ZOjkneLOqJyTOR4mGKHx3vu6UVdGmEwRWg9wDnl3HsXOanQ6DxZyy2Fe9nt79dg04n5u7XLmx1zQjGWf4VTc2e02BFc2wieHeeHKha1DeeyWznBgQtHCnZJFLgfai6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BG4twJAf+1faWwrrGEXsuPF9H59zdgBgt7md6/UnVm8=;
 b=qiYKkIoOA5Hw/7zDX2nbndQDBKNxJSui6mTabngSyAMJxmwL+8B14/gtIR8TkaSqjPukoeHaaZ9bYNAOma/Ho6leefNcpdcgbN3sOfJVo3ZhKgbeKesbTDsCWLlQmr/lKJtgYyYf7dt4BSxbzSX09AKsLFmiH63RFWiYHaZmq+FfSiXIJDM3JDcxWKpb0j781mZiTyIUBlN00OCuGmDXogLA8TBHWVyBaw+xA74VbzwXc6ZbXVjh8uPy3PfJrwrL+U/vNdrzxsPpNMtLgfCWqxQfivbRRG85ulWKa9cTvS04ee4h3n0o789NmXoc7+7t9lDASavmJdcnZpaarwmMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 15:34:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 15:34:29 +0000
Date: Tue, 13 Jan 2026 07:34:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2hpg: Performance tuning changes
Message-ID: <20260113153426.GE458797@mdroper-desk1.amr.corp.intel.com>
References: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260109164250.237044-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6306:EE_
X-MS-Office365-Filtering-Correlation-Id: c934ec57-6f88-494c-f7cd-08de52b93dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3y70trup1aG9ufRVd2ofh8pDRth6u42nCYuRs9u4yxXeryXTBCLkklQCiPqW?=
 =?us-ascii?Q?e1TIA/NDXN1qRWpOoyzfdpuLyODav5rrE0SxhT777kwg2Bu2jCcESF0fCGIk?=
 =?us-ascii?Q?iv4aIQvhdsVACuGvYdAPKJKnanInvpoYJ7xDawE6LTjtwrLvMM/5l45I7koo?=
 =?us-ascii?Q?Q02D5hUtZHj6iOrkB2a23J1sySLvksqCMC7jvY6tzzlERH+bwqCzegNvGX7l?=
 =?us-ascii?Q?f2gIjB69ZB7K0C9z1mxOG9VefJ/FFuHmL6RHFpqZ5zQjNZZe9N/c+cUd2hQe?=
 =?us-ascii?Q?dP5IzFOa2ECIHYq0UBs1+gFA9937ETWi9rSkCA8SE3mjT99RTr7LMaRlQXLI?=
 =?us-ascii?Q?W9FLuOqYiC44qz3xSI3utUnZuwY6oe+59XJ/HBLLj/ovgaqvfUqGs20c6UpX?=
 =?us-ascii?Q?AFCMXI6CPGVzhsPbve7/iZwuR7CFZlqIGN0Q18FNs//42CSIAnIEri+1YsAO?=
 =?us-ascii?Q?m1CcLSZ6gE+742oBRKZnkwEZCbu5OO9vfz12nF0Orxz+fx7VFjvdhKB8+zQE?=
 =?us-ascii?Q?pNB2cKWCHpDoTYtemmkROFO56KiFG/GE41LyPMrNK5xJcjp9ThG5zq3OaxJY?=
 =?us-ascii?Q?WpgvZvfUb8AXzZBy25AA+BARZkKP8cWb4JP9X7U2E2D6DLJ5oM22S0bKZAaS?=
 =?us-ascii?Q?iSDGGmeLhhaC5xFnBqYSneKc123UrOgikfO+OKmvmuOeZglO62sMTqNFhfz6?=
 =?us-ascii?Q?UvQlir6RSKLaWgVVL4EPBYni3wSlgxu8bOtNa2aMugnUL59vZaSvAYBqzF+l?=
 =?us-ascii?Q?dCMoGtByUPZ2bnw7MKABlABpwvxOJwao8zwdH3/uqFgJrvdqMpdOoJZnsMhm?=
 =?us-ascii?Q?vc25Fy4X+IamaHUxGUvJRu+6a4TrVmErO9fQA0EyJTIMpm9SISsneTlzY4Dz?=
 =?us-ascii?Q?4lCQu+OtEse9yLdnT8iu1F9p2wjP/QGCwBJZbkeUgePNx3H1zrRODXBlm0bO?=
 =?us-ascii?Q?Dg4YxttqhZbnUsBQWuJVlu7EDhxyPf4mLfQnVixz1mHRbHNEKDIAM+5V6pXY?=
 =?us-ascii?Q?PS+AWjPwNYJXbv1Lysh+CVjm4II5SBZQrW9tRHULXZKy4rMMsEgVWymD94Fm?=
 =?us-ascii?Q?kNDTMQCzb72qVWN86jQEOBwXpWkzE4grUAwVOrrVreSs9Q6x2BcNvwAKusuE?=
 =?us-ascii?Q?KVhgJeAFsOLYRNchVRyu416GwfI/O7a0r/ixjgZuXiFBovVHKonO77p0EPKm?=
 =?us-ascii?Q?4BpfG1vLxasBr/k/BGzJCN2rCCoKq/4lWwg312p2ZpjBLBMje2NSG0iU9rlB?=
 =?us-ascii?Q?C7c92Ow1e/FGcQrcE37s37Nyh/tKtkpqn/NeZd0D9sRFbeDe8KDJidPm6XXG?=
 =?us-ascii?Q?ss1z7s4vISKBOFugnCIN2gfongYcJtfUveGqC2xe6FCJMSQUgO/57DP7HWV+?=
 =?us-ascii?Q?HeRw1p4Uf8LN3RAOV/2tl1fBzDhPeNffix7InO+Egs8ej5X1dmEBn3IEAhaQ?=
 =?us-ascii?Q?+wJezx3x2ydJY8ittJjULp8aZ4YZ+n46?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tQd6cGa5TBZ+H7jW4/Dl3R1FiZokvJx/vDNDW+FJX9JsgK3Bq7WgW7y6UxNS?=
 =?us-ascii?Q?hpKhYgy3VZZTeF4yjAPlCx5fMVUh0fldpc5Cxtzp2Dn984H9fZWGMBS3h4Lf?=
 =?us-ascii?Q?DdYWT0wS1cPGTuVPAXwQvAXZ1cGejOuhEJjzYtkNGmlplg8isx9G/hbq19MM?=
 =?us-ascii?Q?o1Hw9KBWaHkn3dBb8QaxYcdodv6BjqTcy30AI2KWjhZBrImk6O2KVVGWqGD/?=
 =?us-ascii?Q?wIt4lD2k2yOyAlFxTFvfU7VDUqZH6QdRWtM8J4Z3MtHmC9znXk0xz1wCq99q?=
 =?us-ascii?Q?eANHUvrdDJ7A+3j3ghnQbbeva9c5hhWJGiModTBCEcZlOOLOUrQMfRkPLiCX?=
 =?us-ascii?Q?9ZTVS0d0UNILGBjPR2cqoJmPYXG8S+WlAPunMdm+yfpQLtj+hJPJedxeNu6R?=
 =?us-ascii?Q?sPhCJBtaPujaeIfKpQDSJgsYdjLTgGQOU26w7FQo98orOwDUFxO8r8kVgWBa?=
 =?us-ascii?Q?b32bKP9cQYyAAdllpxGgwTmeUAt9YyFIVVncnctUMIfnogSYbv4GWk66ohdj?=
 =?us-ascii?Q?8XN7vWQE/JewMyWYeUUeSX0vD2JnxlcHQXIPfAKRS8oS15VR8iAF9ZjYM1PK?=
 =?us-ascii?Q?xoI+JwbzzgiR8TklxDO+Bpl05kP19k/7Pgow5iPKed/GSXrYnaOU49nJlxbw?=
 =?us-ascii?Q?k6Ge8UtH4JnHWzG6iWD3BycgW6ZOc8ulm7fv0K5qIlFL+aNg1ZnSu5Gdl0BI?=
 =?us-ascii?Q?PXJ8ionpxr58+FiDvXMG+pW6Y+LxfmR8YzbDWfteQirihygyHHT+fEGcp+eM?=
 =?us-ascii?Q?Uz+PGsYgHDnMD2n4NufiGRR08ycmCwnp3x777mSXJMvzkVqkTAj33fcQCah2?=
 =?us-ascii?Q?rb2p4XEOGWXkz2b3T9z43xdkjFQxjYxiwalZSRE/g3fuCP/1CCXJ/FYBe5Su?=
 =?us-ascii?Q?XkzoCuRqEckvqBxVhtAsiwW3QKIJiry1av6rVoK+RmTSKbi5CIssXzkWEGf3?=
 =?us-ascii?Q?hvWvJSNKvOqQDfGft/Hf9veeTgyQCvDZvVQsNbCev1FYNyC/n/arvtsuDtUl?=
 =?us-ascii?Q?ukIpV1gZsQx8n1L0qM6R9A71hLiKg5k4gZH9B0EmfK5QrJePn352Tzl8AjL3?=
 =?us-ascii?Q?RCRqxJI5de5RXWKFMW9Q2TQhJ0GpBKQDux6BfqJTFglOU7PQYVco31fDs2cV?=
 =?us-ascii?Q?vv38018ad70amccT1Cx+sbIkOGh1f3k23LBWNHxehCxBzcVztpVtgb/Mndc2?=
 =?us-ascii?Q?c90F789741/Y0irwIDmGvjglPciWFMmfP88QJ9JMPEV9007nSjCZPsvEOdy0?=
 =?us-ascii?Q?3CG8VYzaKzvuCVN4v6LOnE4WPuPYtGqbJL+QEfhJ2+RTk/hT4tMi4bgQmifU?=
 =?us-ascii?Q?MTCM8xtdIC9eygqpfcG0Ln5lJVuDH3qqCYpNU4ZbsRfIp4EDZgW/e6f833rg?=
 =?us-ascii?Q?Ovl/Gk+FcS6k8FZX+HJZgsYTMxEAWeXKkCOhZ4PuSLazWKTSdGSPTSsnYtpn?=
 =?us-ascii?Q?ZtA0fMU4ZsrhGS0FQEfvbyh5v814kREa9Bd5Y2Ls4vTQjywKL8HSI30wuagD?=
 =?us-ascii?Q?TFXurUiECnFf3IcLCNEMXsndbfANoMypaVakvMTcbjdp3gnEDy8iC5H9lagV?=
 =?us-ascii?Q?n3hgPm3U/tR+mc5o7UP7zF0ozrWRi+QYnXoVIwcoxSFA3Z0awjTuDIbzJs/v?=
 =?us-ascii?Q?QrmoGbo4hPY86RTM6ghvwrPgUfDXe9RjCAFzA0xtPNC2UyGiQ1JcZl9TllYE?=
 =?us-ascii?Q?i3FWn5+ZmwQuBlh8kQmup4o4jciUIfghvph+L4dfEH6drygSG4L+A1LE6/s9?=
 =?us-ascii?Q?iPn2D9jyDNOOvx9Wq8qQdtOAqd3tPDE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c934ec57-6f88-494c-f7cd-08de52b93dec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 15:34:29.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n85rXkHxXTrpRWyOsV80B9+3FgYQXyoeETRA/UELTlz9WcbUSCrSd5rrDgk7FhZm+MWcPdgU0SB6llPHwig2I3qScrBZsg0xmchT/ohg/vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
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

On Fri, Jan 09, 2026 at 10:12:51PM +0530, Balasubramani Vivekanandan wrote:
> Further updates to performance tuning for Xe2_HPG
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 93643da57428..cc18ddfb7cc0 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -135,6 +135,9 @@
>  
>  #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
>  
> +#define CACHE_MODE_0				XE_REG_MCR(0x7000, XE_REG_OPTION_MASKED)
> +#define   MSAA_FAST_CLEAR_ENABLED		REG_BIT(5)

This register is under UMD control and Mesa is already applying the
workaround on their side.  Is there a need to do this in the kernel?


Matt

> +
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 5766fa7742d3..122829c8d14e 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -144,6 +144,11 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
>  				   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3f)))
>  	},
> +
> +	{ XE_RTP_NAME("Tuning: MSAA fast clear"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2002), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_0, MSAA_FAST_CLEAR_ENABLED))
> +	},
>  };
>  
>  /**
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
