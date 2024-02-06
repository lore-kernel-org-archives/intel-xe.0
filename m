Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC5C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 17:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13E0112D2F;
	Tue,  6 Feb 2024 17:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqZoOHGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F48112D2B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 17:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707241647; x=1738777647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4+AH5/JDWl2nvgsaezUKscuRNE6gI5uZ2qFpmDmXVaI=;
 b=VqZoOHGScW2eOwJ2xhfyTcMpwHJ2oZSbCq+c8JjhCQe7+7nKeUSS69PE
 Ib+Y5xHkwJbeznlT74Hvnahs8eAaS2N+XWJzvWcOGdvhAaAyCjlCSCSY7
 4kvrOMEV3jp4aVaZioK0I43q4oG2JvuG4m6QOykN8SXgCr8gxfSrgzi60
 8Zrt7BpVen4R6uAfbA2sS/EzI533TNQgeeSL4KlXzNunXn5+dhgnvzOgh
 54f31avd8ZdXRTOKlkhD0wascuukTD9x6zRT5F/2oeH8vQ4vkGUop/p/M
 AcSfJwSMIW/sP65t5Wb2psyL3mOEJApm+8T9SRjh4Uu3SqZkXHPa8FzVb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11389387"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="11389387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1072330"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 09:47:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 09:47:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 09:47:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 09:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTpH+ON3SmJFDzeKA+nf1J9OpfKrRH2AVx+RI+PgrRXOxMPDTukPQ1ZaF2d6IndTRpDcRl2525YPZl79zGvEutKZUEzVPurRXKA1dABiAVjXMXaq5Bd6PGK7sSr0Kb2cwysBzEgMG9xlZ/P7aQ5iFT1PJtv8PlIleqPZBcUpbhZrdjSDtyTF/JEU120aSxBm8LUZ67GuqqycxF5+kEpNJhZzXu5/iFGW13CJtxwyyNGj4vIJyCbgdzawrfi3SIkUvVcRqdlj8niu5oUR1rH4yOMgQ0FcODOu4f5Q4y7aaun7p5QLEJySkDUo5Prkalk3vNrz4tx3CYiqUmoh3Fp8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8jH4P3dPHzOAYVYjdfuAP4/VrWPyVRSUy73MXgXlKU=;
 b=XP0jVk4e5TavRXZ8SPE7p/X/eARSE8b6GaGYwpbCWB9W54qG6BGO7gSljbH+/76lRHLTbvzFQWBZkFMPIsC5ps2N/17mBM7E/DBuBjeQYDRFqnKCJVF0BsuxnABQSIZ9qSxK6SEEzM4I0p9wspoNl2c/CnneMOYIFoeyiP/yAh3ijiL2IEaZICdSmND22lzdNJMt/acjCrOVa4XYt7MT4PJ+YDhaDYdXKAE7b4my1WAJFgI07UEdpdmEGrFj2l+Zz/1gAJjS6xitPBvUJQOEGKEcfSfVRcj5i6YneEmNq6A53fm0SvTsJER2+YrpWs5IWOShYy83HBrlLRXOmT311w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 17:47:20 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 17:47:20 +0000
Date: Tue, 6 Feb 2024 09:47:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/8] drm/xe/vf: Don't initialize stolen memory manager if
 VF
Message-ID: <20240206174717.GB718896@mdroper-desk1.amr.corp.intel.com>
References: <20240112152649.849-1-michal.wajdeczko@intel.com>
 <20240112152649.849-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112152649.849-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: cdabf4ab-462b-49ed-faff-08dc273baab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v/0XDN9gmcb452PeaIYZ0LVW1vJYsR3ImbAbcv5KnVm/3/QZ+oxX2erXaY+s5TDKYiBSyyyTC0WXVfDvpKaQPjHlFbsiLHdTyYdKdTY7CtqDvO4uDULYzXYzcxhnzydWaS38U8jnY6jNbICRSLYkHfV3qA0IFgUs6ji3X0GfEYRdrzrqFovItfQL2IHlmMPPbMzp4j2NDLJ24MredrrwtPEs/JVqq/cKfZNj1OjQ7P+9FPNERGvvAPiXUJPg5al/n2txdyDCaazbD6xXnVCSnW71zzTr/xuUU/PwHV9/fdPaL9GvTldsPqktuViw7fDK921PeyqjySFUsbvPciS7S6x/3p+zXXQTHNzfv+gdOKOM0uNIsUcWsWTbGrDVKvRgTyVjUs1e4qvZ9Ial7J8H4X21tOk/Tl6TW+rFiQThbsSCf/1uz/kJ1oH2rCMbD6PN2ObLxBNx7Xh+gLtnXTfdIqjBEkhmSnDHp5VBNxMwBKL/IBafxttBAOMfDLzNowixckVNOxlRgW6WxWiN+IRlvZbLQVT8vOmNS+vJPzeaXJE6HvuS1LwEI6vjLNdLfSy4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(4326008)(6486002)(66476007)(66946007)(8676002)(6506007)(478600001)(6666004)(6512007)(6636002)(33656002)(6862004)(66556008)(316002)(82960400001)(38100700002)(1076003)(26005)(83380400001)(86362001)(107886003)(8936002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?61rgq71qnY/y0Lm0zMDQr57n2StpF84NCCyn69iBektrBnLgtBTjUcXftJNz?=
 =?us-ascii?Q?nEoqj7ZS7++h+vc7GSEZJG+A72laiIMcs2HfjddD6B5noJbCiJocAX84W1/l?=
 =?us-ascii?Q?UN4vwevKhQcwtisZzSyOZ49w43TEihm/aj+Zh8FpIVGsTyILX/SoALg6VTiR?=
 =?us-ascii?Q?gagRxgEJzUTKFqnq2cbGUZ92sx7Uj+KQJEcJkhuJt8MOQFUbbnAi/XRZ/7L7?=
 =?us-ascii?Q?bRpoW4eY/XbT1l1b0EfTYCrG1OAwWAIbZrZD8OE6+t7kwFnMT89bHaZGJp1R?=
 =?us-ascii?Q?2BPgMZ0cbM5hyHo6EQUp7b/n1HBbGBcSujCCre3niVJXGEFr95IJfA6WlkQw?=
 =?us-ascii?Q?fXD512y7N9YBCKW4DFciNCDwTUZQgE4MKPYJKCeKiuww+JDluA2tCZR/jYO4?=
 =?us-ascii?Q?V1AlOoAxRdia4oCjTsfRKhwCzThX4oSM/GIetiVQNshWkOjJIl1aNe5W2/1G?=
 =?us-ascii?Q?sJ7UANs4GwdTkSwPZpV2Chs3P8Hb/c3qN1QNxofKF3TTK/NDufM+ClZVmUAR?=
 =?us-ascii?Q?NEUyWKI1Pdky787SXSjae5ahexd/BNnI7DJf//MhehUz+exz0/0kqArh7hmH?=
 =?us-ascii?Q?/IU99II1Za8MmVJLpPxvzA7bchusC5E2dVm2um2Q9qUSiDrkHmgImZy6zJwv?=
 =?us-ascii?Q?G9RO4ehGIIPsKfeVDDY2DvpQLIurTkGMehc/gIvXyyTPip6+8/3QapBFeQQP?=
 =?us-ascii?Q?XtWsmGKUVTJ8u032GAdIoCfCcd1lqBOWHphslK1/1wAr3KAOGWC2oR4xNurz?=
 =?us-ascii?Q?IoDT1JZ8JNJL/dIbiEkN6zRDauY23anggcobdwcSK8cyn+EB4n+zYwkgd+D9?=
 =?us-ascii?Q?di6PPTRJWnaH6QCyitA5Senmxcn5u/d2EOfFyVS276wwrmqXEmAthj4cMCjc?=
 =?us-ascii?Q?s1sdeJ1AKAm0ZkiAC9zqusamR5mW/NK73Qj2U9Y1o6iXCOWI+KzFZGL4/sON?=
 =?us-ascii?Q?nIXvgT9++c5M9iHudIQ5v4a6rv8M8EuGHXLOdz9nSEAkwYHhLhCez3xuqGAw?=
 =?us-ascii?Q?btzZO7RvTr05J88dzKvPnFTXkYxdDhbiMv/jSHCftvvkjRBqMM7aJwquwzWy?=
 =?us-ascii?Q?rTUfVW/RFg8hjlKVg6cC9HUoJGpwPiijXrsl3Fm91qPbYTPoYSiPFBDkwjOU?=
 =?us-ascii?Q?J1DqoR6MtMpSmrX0iH6KUWps8nF2B6ac1UO/iEZv1AveZDl/6ljjHW4+npZU?=
 =?us-ascii?Q?2fH6WEVI2z3+YiYPaBiyHBEUqFvO/mhp3UACOsGyFCxwW6Q5+Y6OiTlTNPRS?=
 =?us-ascii?Q?wEGpcAjnEOaM9U4n5/KT07eHqbgSshkm+wdiEHYzYQHiD6A7pCgeJZvUPnZF?=
 =?us-ascii?Q?Ju0JZKUlarjZagbnqM53MhZClhmej0/xCfWGqlJd8ay3hFXkcO8RokuSIHYe?=
 =?us-ascii?Q?LenJyL/iDbvLYF8ph4mYQlv+g3+F9esK79Kf5uPSxENKFP1BC3i7EtZh7mVA?=
 =?us-ascii?Q?TMM/Ok5N0GT9VLPlFBhxBMHEHwfZbdfrSBQwLLkuX0aKWAzrYJjh5hA5qaKP?=
 =?us-ascii?Q?sW2NA/RU/pE+TPxGxdKjD2SzLo2gLFrk0ug2OauZ2MJTSkn9Zco+Cz/TKEEB?=
 =?us-ascii?Q?VB4RIr92Q8Nq/jn3+4IPtS0sacPePlqIVLDTHKhAxIf5oCA0h7oIG7Gk2gnX?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdabf4ab-462b-49ed-faff-08dc273baab9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 17:47:20.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xz1TfzFsQdddy60RM3ZTuK5sYEhX5FdlmI7B/lLBTIc+pLlp6l84F5OQvRlPcy5aCKEKnFobxPi3zm7Rb3j84+4zveGqihpe4J6DQq0EXZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

On Fri, Jan 12, 2024 at 04:26:45PM +0100, Michal Wajdeczko wrote:
> VF drivers don't have access to the stolen memory.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index e5d7d5e2bec1..662f1e9bfc65 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -19,6 +19,7 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  #include "xe_res_cursor.h"
> +#include "xe_sriov.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
> @@ -205,7 +206,9 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	u64 stolen_size, io_size, pgsize;
>  	int err;
>  
> -	if (IS_DGFX(xe))
> +	if (IS_SRIOV_VF(xe))
> +		stolen_size = 0;
> +	else if (IS_DGFX(xe))
>  		stolen_size = detect_bar2_dgfx(xe, mgr);
>  	else if (GRAPHICS_VERx100(xe) >= 1270)
>  		stolen_size = detect_bar2_integrated(xe, mgr);
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
