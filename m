Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C1C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 16:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442C6113C9D;
	Fri,  5 Apr 2024 16:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSoodcRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCA113CA0
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712335905; x=1743871905;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pvtaGHAPAdQnNXq4Cc1hOspdGQoBzwtNMmoR7KlzaMU=;
 b=MSoodcRpkJnDIRmuYndQsKEWyPQGtqXMqXaOYDeyoKOFnZQ6Y/92fJlZ
 pJlJf6ZiU2FwGk3ZhCthMuZfTk8UPvygQW99aPdM9Fz+TocORatz5tEo9
 TuxfkSqZgTOaz+CmuQOOY4mxB8VAFs9PTk1HD+T9TAITe9/OmBnav8g9A
 w62pXRlOjyIMlN0IdkTpvtO09nt/WyKzm3N6DDXxFmT6aQdHGpj9zTGTZ
 1etNGBMwVuHhECBJY+r44U8ebs/XNlbOE8WxOcewdUs8Efg8mHWvifHi7
 tbAT9XP/LrBx09xNgJJRPoRBRBpSTTPOEqpM8l5EozZL8yLwHhE8ucjc7 A==;
X-CSE-ConnectionGUID: 10r0KTg2S96dGSkJISZBGw==
X-CSE-MsgGUID: glvWdK5bTZyLWX7X25SaMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="30153596"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="30153596"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 09:51:44 -0700
X-CSE-ConnectionGUID: 5RIzFsFrR6mrnDQUMxzfEw==
X-CSE-MsgGUID: 5DA2MQ0oRemtTedCvIkkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="50454950"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 09:51:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 09:51:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 09:51:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 09:51:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 09:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dldJtcoxe98DI+d+xl+88N2W3V5X61rPa6FSZIDOHsLQZf2kX4K7DQj+S4ZiLOX/6/5EpUb/RvdY0gKcM2yUB3MettYUIoj21WMEdRZS/4hrnMOdTK0+s1sG7q31GPxHXmoZCovC2ZED+74cAyypRbjJm8ttVnxFqTroBSI7KePQ0i0+a8vUHcaLjYGqKJiCp6SCg4ULREoEaegD+P6y90bxvpdYv47BQaT64TTZPfxX5ImFSEz+8MREUNmBr/OqquPmBeVn60NeLcL6M/UeNtDqRhCGZozi3elgL7CvTu4ufLoruab6r8D48RRBfe8mgaUBN/qYQlZt/GsrSYVkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQagpPO/0uLaXslygTDfasMQ9WqmbNCNACM7kEKzBeg=;
 b=c2WBBLwV3IHTJGgIRxi7ghsmmlBrTn19mS9WXVuhJpEA4wdQTkJe0biP57svXp9cmTDUwZ9/GvMj8m3qmO+tpBV5RFxkP9Eqat916J+XdumIM76D8SjgqjH+gKrq1TeoMiZ46O8FpVHH5qZG20bFHZNUyB1wB9B+PUKxdLMQMAShUxB7OAiXwN1AIzsVSd1DZmTvHAZmMlzMbGJoJNPopRYC/1XSJJrnggqEzUvaIz0xTAu1+Ztgb2EnZEORmkOONRFSwpDWaphGEEHMEkzvzjQ69HRIYMiQtQMtCVhUmUzsSM6H1+DTQDr3aoiqi0pIXDPp0wegR+4/e67acYrE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 16:51:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 16:51:41 +0000
Date: Fri, 5 Apr 2024 16:52:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Move PTE/PDE bit definitions to proper header
Message-ID: <ZhAsRRQrnp0NroJp@DUT025-TGLU.fm.intel.com>
References: <20240405123520.847-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240405123520.847-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0069.namprd08.prod.outlook.com
 (2603:10b6:a03:117::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8660:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0qzwX0RwkP2/cUIbW8nbRnd7w0e0ms54DO7llXiQnNGWLcljzJkjchj6E/+7sKu+Yfo3WM6GJef8606BbeAAbbrhNZqjfCXFUUehkzEJzyuihQrmq8wxNwjn8Flq3qSe1M9WPMRuGyWdaAQz4eA4pQmGEzdQEcMYwHA4GEwxeKQNeA/5p/Lx8lEVbGD3A7d49HkPUD6WKLeDQDvkFcYs+WfaYPOcmPPSuaK3+jkygtIqeHMcRKLBoadR1PS+aSoV7yIWHkWkp3Gs20r1nJAHL/2wh+qxS+Y5TV16vcfSJfMtlvJESgyEXlchOAa3XoorOsc/XF3NiPXY9I6DMqYye3nNwqly9p7ZB4e/6PmQ+OfQ5/0HryNovdJnmxLK+BY2D+bCOiOisxGp7zh7QFFE1GXnsv+t+clIxFdpdfXuFpKUEdWYQZ0YujeiBvwD5uBS6ch/qnmwOM76elJP/QmCNtrkVknmgecJVLQYenhE3WEEgwX5xtSThNEk90yemzsq1NQS7yZt05khueEuY3yCaPN/OyVKCAoP8Kllsg+bEVCGSHONeSoj0hsKzn3syIFLOA3ctGN2hr7SEQ+XYZCWITJuSCbpg1jSbCXXBpBl2ynTy0NBDVoYVsJoyx15JImvwIwNIG1/1NscvQOZDYAcipdQnUUH9s69OuU1iopa/rI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MUHhrzTUq+eTugbFFwx4zr2Wb1bJzD6fo3k5F0bJh7Ko9s6coBsAmuGb7M9i?=
 =?us-ascii?Q?6NuhkWMCb1fKXbGEHc37YQAIhYnDA+cIafNSZm6ItvQXBwIiQHApQjNdrYLR?=
 =?us-ascii?Q?BxnhPoNx5ydWEbsNmY0TUEP0kFXFY1XeWDcMEeEXpzhEdUsD/JBmzbBGpGII?=
 =?us-ascii?Q?d3+0bGZ0P47eG/nGFLjL27OER/tPFJ0hC+o6y4QSDxLdXU2dRV2Bkjs04VlI?=
 =?us-ascii?Q?p9lwqAxlrhyeFEGQMGjxHwylBBCK/W1vlCNMpewteLpOgGAqmoODuzQqjxzT?=
 =?us-ascii?Q?wa2ZfcfRDyh6JKcjgjriOyL6Udkm9tqiD4ZowV7SPvM/HjizKKtm8EUAa3kx?=
 =?us-ascii?Q?a4/coGNuo7P0QC+RMehSCHFBANWSCm6tb7kP96hI7ImkN6cHihs5uOWRdDLw?=
 =?us-ascii?Q?wwyhGMu8ZTP2aSGlUIUdZCCVR90ZEyrfMPW9nhxOAD+hlmxz8MSs+CFylyk5?=
 =?us-ascii?Q?PELWifqLnpH0plHWNaWLbmB4lach39Vmm0D8ns1+vmA+JE4J5/D8CB1qYr8I?=
 =?us-ascii?Q?9HssoaIIvH06D96PTXbdTuxg5zqHD4+zBhB9iL8l6YB5RY20uNlmQwLdBr65?=
 =?us-ascii?Q?qMEw6efLKH1Qd5Ps/H1B4uV7YCmVhzXpFwQI90Yl5C5cAPSKaHEvGJ5Qrjim?=
 =?us-ascii?Q?gmKfFIPWwm/kzSmJwgLlwcsi8FNFZMiSluyM7RrY1bnFTDR0WJF05F0lFkzW?=
 =?us-ascii?Q?T7P2sFoHL8+O6EgiBsVCeNZUsC0Dajf1hG0wGficZFQ4wk2CRZkA1dbKOyxJ?=
 =?us-ascii?Q?aBD9G/0O/+7M5dVc7GWA59c7Xi9jwA5dghwDjUPF1VGMzBnceEs55Y7OJ5Op?=
 =?us-ascii?Q?KyhonFQ+8TJaFrqBjxwcLdNJywkfs34dCMWdnOacRqmIRms8ZdkVFMTtu+mo?=
 =?us-ascii?Q?VB0YlDj6o3caI6jIMjsAoKFGl8vMsDXkgaUoyoAsVL7D1XKPwgzihiovGiD5?=
 =?us-ascii?Q?HxUfy6jbHqxbqJdDxunbiJPTUUtCO9rX5L56ePDJafEH89vCvJinwXSQMGSQ?=
 =?us-ascii?Q?Lf4A3KnCDAQnoSr+VHpGFGNGJZy25IXGxM5Nb0rSCkV26XpBANhvcSasNqrC?=
 =?us-ascii?Q?BWP59qD6SILMfTBW0HOWNCwUXtkk4mezRpDT7a5KQ3w4gxWnURTDWO/apxP9?=
 =?us-ascii?Q?DspaP7Bg22kKsJ9C3crcveGLQS8AOSP9Gdq+fBubDQXu74vznEviniMC+AI7?=
 =?us-ascii?Q?Ho9mHjf/70x+bvVXTxFyVi+OooGvnSGsH8vBwCAEvEHTEkPXNmw0I4HnvPpa?=
 =?us-ascii?Q?XUVcg9R8FeJ5xOc68phSuExxOI1yRksj5ZQbURIQb4WKGrNWDrembMVYqmVX?=
 =?us-ascii?Q?Lh0yXMDL/YjE8c4tdve+tSlGvslgjs57/V2kHmoKOKOdTfkTvUQMmUgAqW9u?=
 =?us-ascii?Q?fB5aT+ZWhdaDmK0vHDK4okS8h84gaIWBxrCdnLxWSZ0YMfmCD6TguPOQWqpY?=
 =?us-ascii?Q?cqjQCpk33DOOHKjDtEj6aWouWVUWP09aWtWrZsdcI6bhpj8FIQT3CppZO9Rm?=
 =?us-ascii?Q?wEsoLjqwLUainBZyWMfH78063b4kyTnHpymLcapEZ833geK4ed6FmMkH7dnL?=
 =?us-ascii?Q?dWQWVpFBqGGHNSWD3Y/EQYn8UEvZq9a43/W4LQJPJUecgXEic7keKIZMmWEp?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b372efea-dd84-4f17-fae9-08dc5590aad5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 16:51:41.2346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfVRxzLyew2PWQbc7k3IxtG4WbUV7Pz8pG1zby5qFBT+L28HN/7tarRpufl9muikzeC3b8KKFDWlQuStaYZHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Fri, Apr 05, 2024 at 02:35:20PM +0200, Michal Wajdeczko wrote:
> We already have dedicated header for GGTT/PPGTT definitions.
> It's also cleaner to separate them from implementation macros.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Been meaning to do this for a while. Good clean up.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  1 +
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h         | 21 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h                    | 21 -------------------
>  drivers/gpu/drm/xe/xe_migrate.c               |  1 +
>  drivers/gpu/drm/xe/xe_pt.c                    |  1 +
>  drivers/gpu/drm/xe/xe_vm.c                    |  1 +
>  6 files changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 7132cd5d9545..9693c56d386b 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -6,6 +6,7 @@
>  /* for ioread64 */
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  
> +#include "regs/xe_gtt_defs.h"
>  #include "xe_ggtt.h"
>  
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 9196d71bad37..558519ce48c7 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -11,4 +11,25 @@
>  
>  #define GUC_GGTT_TOP		0xFEE00000
>  
> +#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> +#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> +#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> +#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
> +#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
> +#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
> +
> +#define XE_PDE_PS_2M			BIT_ULL(7)
> +#define XE_PDPE_PS_1G			BIT_ULL(7)
> +#define XE_PDE_IPS_64K			BIT_ULL(11)
> +
> +#define XE_GGTT_PTE_DM			BIT_ULL(1)
> +#define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
> +#define XE_PPGTT_PTE_DM			BIT_ULL(11)
> +#define XE_PDE_64K			BIT_ULL(6)
> +#define XE_PTE_PS64			BIT_ULL(8)
> +#define XE_PTE_NULL			BIT_ULL(9)
> +
> +#define XE_PAGE_PRESENT			BIT_ULL(0)
> +#define XE_PAGE_RW			BIT_ULL(1)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bae042b35fa8..4824ab145bc4 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -50,13 +50,6 @@
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
>  
> -#define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
> -#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
> -#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
> -#define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
> -#define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
> -#define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
> -
>  #define XE_PTE_SHIFT			12
>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>  #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
> @@ -69,20 +62,6 @@
>  #define XE_64K_PTE_MASK			(XE_64K_PAGE_SIZE - 1)
>  #define XE_64K_PDE_MASK			(XE_PDE_MASK >> 4)
>  
> -#define XE_PDE_PS_2M			BIT_ULL(7)
> -#define XE_PDPE_PS_1G			BIT_ULL(7)
> -#define XE_PDE_IPS_64K			BIT_ULL(11)
> -
> -#define XE_GGTT_PTE_DM			BIT_ULL(1)
> -#define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
> -#define XE_PPGTT_PTE_DM			BIT_ULL(11)
> -#define XE_PDE_64K			BIT_ULL(6)
> -#define XE_PTE_PS64			BIT_ULL(8)
> -#define XE_PTE_NULL			BIT_ULL(9)
> -
> -#define XE_PAGE_PRESENT			BIT_ULL(0)
> -#define XE_PAGE_RW			BIT_ULL(1)
> -
>  #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>  #define XE_PL_TT		TTM_PL_TT
>  #define XE_PL_VRAM0		TTM_PL_VRAM
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 524b0198fcae..fe713d57cbf6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -16,6 +16,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "regs/xe_gpu_commands.h"
> +#include "regs/xe_gtt_defs.h"
>  #include "tests/xe_test.h"
>  #include "xe_assert.h"
>  #include "xe_bb.h"
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 271f13eeb852..5b7930f46cf3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_pt.h"
>  
> +#include "regs/xe_gtt_defs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2a431690d245..fff10e1717ff 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -21,6 +21,7 @@
>  
>  #include <generated/xe_wa_oob.h>
>  
> +#include "regs/xe_gtt_defs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> -- 
> 2.43.0
> 
