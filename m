Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D1C54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 23:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E6310F4DD;
	Tue, 26 Mar 2024 23:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIYGd7Mj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFE010F4DD
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711495812; x=1743031812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VKw/l0DNcR6rp9lk4BFYXFXIuUpI2EeZ8uZjmikSYog=;
 b=NIYGd7MjflHwEp4fsGtQ3epZtlM1CEju+GwMmPKMx+MvQ2thGxHUdix1
 AMYG/ZwJw3r46rU0YOSo7dYZ+Ibh4QKM9LjclVQuksDfNt0du6GQ6W2Yy
 orFNHklif/2dmvEuhYq1y8upqaCIlEm8bIHpM6B6sr7Ta1JRCAFF3FPdn
 u2ifwfAinWmUWmEXHhrIcnC4FvGBzevhBHnDvYYDYThuM4oS09rhBGcfV
 1PTHWI7ZDB1uGpDPaAEL38VRrWtTqMyhTxc0vw1LsdNkB24PZmXCnkERO
 Drsfz2tdQPrRpgKhqKNFurh4Gw06rHmHFKKi1HmwcQv5c23lDhAp6/7vl g==;
X-CSE-ConnectionGUID: xUy/oFodSVWqzSC4pP9TQQ==
X-CSE-MsgGUID: 18V3juiySlO7HbQVU7vqQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17305288"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="17305288"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 16:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; d="scan'208";a="20764863"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 16:30:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 16:30:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 16:30:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 16:30:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 16:30:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIOJxp2nmHRhVosZFx1G3mI2XrIPVBih5H5W+c6hUDFkoDIT+FN+Q+L4IR2Lri18ZMqRFYtCFNa+Ou+n8KLzMZksfQNRet5COhHiZTRM9zDYgOV00Vu246XTi9v14JODt/SbDMm4rvo7Z/fYMqtYBT5UiKrGlD4+HGFpveLmaxTrFnjcpZRAEGXx2BRfAC2W13JWSUKP5hBN8tvQI3f4NV1bK+iW1cChMEVGpk0sWjzUz5S30aGlCGgwuLFVGUGymTKoYvVuAezUfsoqgBEjy1friMZ2rxCe9r/pBsxPkfUs3X9DH9ie87HZRb67CGz6HuYJNU3MPiT5md/Qo6VpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiX0L/RInEsw3/tc1LbHFeQnvKk1ihzs1NqDv89IapA=;
 b=k66zbOrMAtFIn3Ut+VInK8toFSlf3KwF5ya2ZjpFiTlof7Zn6I93S1TB57vZu564mFFYgGjmedHD4zrWoFVo916uQUOb0CDhIcewSqGDXThpgUkHVDnbR5KEiWPLzeAjcgOZPLoNUzbsdZEapd45cKk1253Q5vNlFZ9edf0EGI9rpMP9DwLsjP+He1k/FSY2eKDwaPGyOXAnmBB8kO9+mTADbPozP5VkANRn8qhfvDRRK42UHP/yibi/svcmDp0ivIvO8Y+DbH9tQ7Bu49c/TVEAWQMT38tEqvA+XiT6UZ7T8z/+r0kY0k4Vje1lWmhDviHKiury0XBXxWQS6BUXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 23:30:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 23:30:08 +0000
Date: Tue, 26 Mar 2024 16:30:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move HW GGTT definitions to dedicated file
Message-ID: <20240326233006.GF718896@mdroper-desk1.amr.corp.intel.com>
References: <20240326131042.319-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240326131042.319-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7898:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZiTTjIKhCgwsE85M+HYdgbsd/ucHfK/hr3XQvnGqIvqw3HtNL0Y4JLsU9oQU1PY8p+OVtLhZZeZR0pgI8NbxgDFDHsnhGy3usmyq37ouS98AeLrSxNc4wKtYoNYmpDUcrqw+HCuJc6rXXNF0RAj3yqFsWoFgSPJ7Pi7XgLP0wpC5gimgEPEvZ/r2sbkhSuNHdClA1o9ibAYzBdd71EVE3quf+zjdorUxnvhL1fYc9WEioUlff9A+SCMEMo0kS5ii4g4p/JmxftWDBwDQaszH3Grj+ht9i82PmBKOiIOkN7ZJs9SNspdLtJZb1VAPu1VgBplpZolD7exQ02J+LSR9d7IPSQ+t75RRV3+eyqLLhsUqBtfsKwMLf5NVHCe7WvfwT8aZ5FURwhSRa8uUJdbfdItWwuwO6/JOPYmVuU7gr3P1K5u4uw85GtIRsV4BbM2+Nmq7tZ+pKPqec8lrjbOV516nlzSkAox1W56KEYRP5uk0EfOnMeWmDWnDh0V/CVvwtHDC/3iOm3NStVWXdvXHpTKcIepEvvj4NYPzMj2c8gHTEtvLba3VPWzBwd1eQXQyGuZvX09RRJL+rw6EqL/nf+8Caa2FTFoCZPsbNanHdqBs6T/WFNefhad5cNK1s0wrJP32/IJoLs5C7p0749axBUVd1/fifGvhxsOmYRyr90=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HG4V6m5W9aA3shmJ69U7Q1WMH+fNyR9xO7uELVDvk6je18lTFczLRLgBxK?=
 =?iso-8859-1?Q?534fSa/x6fev99ylouFk99M8Gc0LIhooTUDphOq3qpFdsG1ulySaRVCNBa?=
 =?iso-8859-1?Q?n800TMnVo3h9KF582V//FgwiRM0zVjU0tL3Hq9XnetgemkIlyK7jox0t2K?=
 =?iso-8859-1?Q?D1nM8u5Kdr4we8jFmGEOSzyNTestIRzphAGvq/zB0WygCAhT9Pyz/qIuqJ?=
 =?iso-8859-1?Q?4NvFWacfJfeTOtMjOdxuh0vEQHV8dWbTIZH+vOzMyLyVHoKW9xiadh60jV?=
 =?iso-8859-1?Q?LK5hhb77ghKqc5x6RX63BmzujEZTpAODbQcMfBTW/4jl+ULkZqvYMerVAl?=
 =?iso-8859-1?Q?r/Liut1Y/2bxJa3i+NIo0na5SeJUYmH3fupORWQpDuDtP6wWUOCULY10+S?=
 =?iso-8859-1?Q?nfsEVmEJphVORh7JAGNkFn5LUAtNNxK5/qXo/NNC1nZyemSK1JOIdnBCiX?=
 =?iso-8859-1?Q?RMJ8j0fwsSTwgzHZ7ZmoS7Kyh7yOHqw2X0W9T1Ir255dw1SsaNl0X4TfL2?=
 =?iso-8859-1?Q?BJUtb6CdxnBor8cVJn7wBetE6X+wp+lNGkrL3AOlvlOyljQsbnu0BZWe74?=
 =?iso-8859-1?Q?xPErwNOAYW4N7bcFsiX+/fhAAU9rKS+TrZO6Y6QpydiP7EZtFZtn+3Fq8h?=
 =?iso-8859-1?Q?kFp+fKXtLM4i8Z7Zp3qsT/G8Tx11AIoT/L4eCsep7Mm2BQSw18e9H4BS7k?=
 =?iso-8859-1?Q?ayqe6jg3dg0Tg/L41vMjTBRqB/CeYDkLjswGaeMaf2DFao0/R3DXLPiLzX?=
 =?iso-8859-1?Q?aOuAtNhKlKlE6ZZ/scOdSJZl87/eho3uxCvBl2MNpzKmwZFLF93XYQOgnA?=
 =?iso-8859-1?Q?7yq2bSvZVQ9asDh8GiMuOazrHSWct3IBEFjQwbjBZRzyJjozuOA+2z53vj?=
 =?iso-8859-1?Q?0YiZt5nBTpwzwSKQzLAjVYthNWzD/rdhS67rh2Mt1W8Zf6q3GlQn7Ru92I?=
 =?iso-8859-1?Q?OWIqyWrogDfCKASOoE1LESV07blIIsDhAG3BxJxmwQAhDPp+3sDdjZAHn6?=
 =?iso-8859-1?Q?kUafQrs4wRWofU7JaTMg3P+fl1XEVi5FwND7svg0/B7Dn0N+PmTyTMGKY8?=
 =?iso-8859-1?Q?wG1BqEKboRVP5TEh1plFVwglbp2gntu2sAm8hUoqD/9MOVYyQM5+6wOA0N?=
 =?iso-8859-1?Q?yREZ8GSqbnGJX0zZe5VMisipuKWQMctTeurUSX45LA5RX5Uf7pI1O8IQyc?=
 =?iso-8859-1?Q?b1pGHehLwmGDOpR7XF/ebyRwqWltAdJ5Byw32KZgni2juvgH9hg33V+UHp?=
 =?iso-8859-1?Q?vrE2OrB5BNF7MYuphpVnR5rdUOoH9BVsqO8dzQxJwLHHfY+mYAJ2msCIP8?=
 =?iso-8859-1?Q?RhuZpMRhMVEDQpou/+v022VqnzTUz949lkYU6y8qoDrWyLrmkFiEXUeKBF?=
 =?iso-8859-1?Q?8tGsl/DfLm1nZhj2Rl9oH2ZrukUlMju7G4P7X1n0TS63FcF1Z1LzXkLI6M?=
 =?iso-8859-1?Q?oBrQX6DX0TULXU3uRof1JxUzTUC9EHJ/1VtmdkMQ9GSWfyo3tub2aCcC/7?=
 =?iso-8859-1?Q?CpoFGb+DG0oHdVVnc3xLBc1w0ashiNIeSMhMXK6kpFJoFmXFXBgFuGOpbO?=
 =?iso-8859-1?Q?V2ix+z0jqvFZNvBTvk0ALEGvpQelyKVhKIlMGgzzEX2bfCneCHm0Te+gvG?=
 =?iso-8859-1?Q?RRQ78vWIsOMTaywXVbJYWmNhTLAnuXNY6Ux7GxcCli6hZwezbge+XmRQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c304400-9182-4ecb-abee-08dc4decac70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 23:30:08.1763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gVBgcT5oYh+/1OAJPWax8t73+FwEj2rCN+x4eUxNXEr3AgYbVuAZT6pzHHyzjddpkgLVPxn/iUe1eDoDzp5IijHgkKP1oL7LWec4bBEKTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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

On Tue, Mar 26, 2024 at 02:10:42PM +0100, Michal Wajdeczko wrote:
> It's better to keep all hardware GGTT definitions separated from
> the driver code. It also helps to avoid duplicated definitions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.c          |  7 +------
>  drivers/gpu/drm/xe/xe_guc.c           |  4 ++--
>  3 files changed, 17 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> new file mode 100644
> index 000000000000..9196d71bad37
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GTT_DEFS_H_
> +#define _XE_GTT_DEFS_H_
> +
> +#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> +#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> +
> +#define GUC_GGTT_TOP		0xFEE00000
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f54523d7d03c..f659af221bd8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -12,6 +12,7 @@
>  #include <drm/i915_drm.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_gtt_defs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -23,12 +24,6 @@
>  #include "xe_sriov.h"
>  #include "xe_wopcm.h"
>  
> -#define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> -#define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> -
> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> -#define GUC_GGTT_TOP	0xFEE00000
> -
>  static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  				   u16 pat_index)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index c558d978462a..77be3bc2d7c0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -12,6 +12,7 @@
>  #include "abi/guc_actions_abi.h"
>  #include "abi/guc_errors_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_gtt_defs.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -33,14 +34,13 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> -/* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
> -#define GUC_GGTT_TOP    0xFEE00000
>  static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
>  			    struct xe_bo *bo)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	u32 addr = xe_bo_ggtt_addr(bo);
>  
> +	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
>  	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
>  	xe_assert(xe, addr < GUC_GGTT_TOP);
>  	xe_assert(xe, bo->size <= GUC_GGTT_TOP - addr);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
