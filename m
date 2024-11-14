Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F670D6A223
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:37:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15F710E094;
	Thu, 14 Nov 2024 17:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RjFVmOOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4628B10E094
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731605847; x=1763141847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TMdoLKXyzSGROTqGJQW0TooDUc09aolKjDrDgQ/0mUY=;
 b=RjFVmOOSOOie5xTFX6Hgz8JUE6qRupVEwqKTHhKDYSSfrpdcXUFBXp0J
 0X/DaHtiFrxgA68LVOAqIlBEnfFQ0V55ehHsa+/vfRlD0iRfEo2vHdyXR
 B6DIrThcor1lhhWV/gCosWG7Mrokg+e3MO1FnCcxP8Qh94hyYy3Bie6JE
 uOI/1FKk4QtUd2ITq3Vys86usaMQIm3TfSLmImKr9z+PtrYvb6R94+4X0
 ud7s2oBMLEgRS0RrW/jTCUewqgjwZIjNmg54VfIlMoAiJb66AuGXIMapx
 d3M8S+Rc3ScxWK5szDQQimuyQRzDUkY+XnQ2Wwk8HiWZGfqrFmWeUJUjn A==;
X-CSE-ConnectionGUID: oI6In9x8SP66WvOWDN+ARA==
X-CSE-MsgGUID: jifPIJxRSVGjMSnKYS9xxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49093905"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49093905"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:37:27 -0800
X-CSE-ConnectionGUID: Z1Jx2EwYQLWl4suE3XCXjg==
X-CSE-MsgGUID: yLpiAWe9QaCRHw9sfPzIVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93231095"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:37:27 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:37:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:37:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+x/zPSahBmwse+EFuyz5c4MfcmB7IHMkUzLj8avcSqFuSYma2w0YhEVH2dB8+2r6YclDKMJGzNApGUiYFiRlO+HU80BukCZTndEV5xkvxaiy3kFYo8/c83m5YDgXkwfU2beNh3iQ0PebH72p0kl8CAwmfMqHdLnYhb4H3Y51hXmo3en7F9xYg9HZ0bxnIHr33ure6+7SjcX8qHBS5NL70mWi3lFGmE6qqy2FiC3lZldPrZ5EPgdxIzf6Ta4z0NMRbgJjMKBOOKYw6Z3OF+GYHvh6h8TU/SPvHFMBwVwJjl12artOQAqYjFAXo2eTYC/tnWnhvKZi7PkYryiEbrJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMqxK2wzSUEMVnLABRr+6GLO8gUDZbYLuD0gB1MdWTM=;
 b=tuundm8ewuV2qOVQZX77oFEg1rF/S/qOxvazdhbWOi8O5MUQhRhXRY58y6rSuPt8gAlopcKlwVrj5J16HgwBywWW/9jsdmLx+GEqlgDEs5jzYs8UrVeYfXMwf1o6AwG9rVMlcUPnPoRi4BxfPXSrUV6hawpN1p+dHKwVAz9FBi+XMuhO1S321Y1Qs+z0YZ+3EGprVpmBP1P43ukfBB4DQcGDGQQ23aMS1ah5HNQiSjb77PbUjXQJqJ4Z23qBloYFrTLsQiUUtkLsFFPRV5iXsG11Bd89zSkjt9rDlK48Olgy+oXvqa5rXikgR0+V7EKgxbYgij3CKk3UAGlwWGBWZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 17:37:23 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 17:37:23 +0000
Date: Thu, 14 Nov 2024 12:37:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/4] drm/xe: Include xe_oa_types.h
Message-ID: <ZzY1TjVmwtPcl58J@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
 <20241114152148.572447-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114152148.572447-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:303:b4::26) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: ace47b40-e603-49f4-1c07-08dd04d2ff12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2jtZSdkXquJ3S4x+dvQCaItcq11qlV/s5eC2CznZbsQa5nOjVNFxABBkfMaE?=
 =?us-ascii?Q?E+3lWQ7kKwDeG8g2M2csvvJoSJiKHMskkKtveNP7gr+ayubvu0XOZnEhLzQ1?=
 =?us-ascii?Q?zHv2MtFL3yQ6vFG5xoUjf/rOkmzFwmFdy0ZTemFNkMNsOYJtFi4KpmHf80Tj?=
 =?us-ascii?Q?kv3AnEB3R7sBMpHmiSiDTpYJrLyw18CyoGqDeQCH2bgFyK4wqJXarsD8mHUi?=
 =?us-ascii?Q?8R4tjsy7I+qFpyPm5jN01WVNIM9SrGi1PQGCZVGLdGsJwWlSTbfHjj88SbSa?=
 =?us-ascii?Q?LMTB/Nxx4ZjoLS0Z6MbC4bC4XTFHuVELdIIWY+M+hVMbL+WNeWJXy39lMbol?=
 =?us-ascii?Q?4wzfwlEahnsnHqubNP2VGeOjcv1R8R5feHwaeocDxWpU01K9Zn9kBoioJzXQ?=
 =?us-ascii?Q?4hQyp99Hf4805BiShgk7+Pn3ojZSXD1oXo5fn9Rr8xNIDmxL6HP8U3HD199O?=
 =?us-ascii?Q?1jqpXcQA5cyCvze9qOu6unY5Ft0urohsgTGOgnEG5eTpFb85Q6YFR0iYgKv5?=
 =?us-ascii?Q?bH5eQ5zMsEPhrNDbYVZT7TwFvklmJ+FiEDWv1R1rosUrx5lwyFalwXCYCg4L?=
 =?us-ascii?Q?TwpPEMZQ62IFgthuS7a2ePehTriJKfx41SUSIp7kBUldAwPEHGnHjHdT42dk?=
 =?us-ascii?Q?5JctdVripq3GkVkKLxLL+9lUchCbhbeSQ6poBUhaqsuJzahxcBWaFb1lcGAd?=
 =?us-ascii?Q?LChi/mNcTvDd6u29nxSF/R38pe35iJmMPN92NuR8r7poTdpij0hMsvPi0udL?=
 =?us-ascii?Q?VpwAK9IWWdkVtvtHodpCxeLQSzn0BpFT7GDBAYI2DCgLHyJ5ozt0yDCADWGp?=
 =?us-ascii?Q?5/JRuXeFpnv/kxQ0tXYBXS7+86Yhrv/ssuu4H9A+9fZkzsmfT4ZqdvxT2CvL?=
 =?us-ascii?Q?lZqNAsul+v1xhR0xjdJiJD1OKq/hJgw9Q0/2Ks9Hn5qmJOMRm/VRGrSKW5Ze?=
 =?us-ascii?Q?o74fDMsNe9Qbw6u5mkN5Gmha8H3IzywNVHoeEUCbpbjza+HCpUX9u6R8NSWU?=
 =?us-ascii?Q?gBbXTlO16lkhYEDqInO6ODfyqTQO5HdY8mRvBV6gNnc5mOBFpTMoqxjugdkB?=
 =?us-ascii?Q?uA3LXkI0UQANpQms9U+fJ/tWfULQMiZbhFdaBnyvcIWeK9N+9oZD0t8xZy1K?=
 =?us-ascii?Q?mcH2B98Gt7jxqtb7E6ip5E12hd/J6n6TkajpsiAyXcQBRTds03dUy4siPJdD?=
 =?us-ascii?Q?6742GQE4B4TAosYprMwXETBJazMUwqKAxrHaNd8hvcyr1yQn0WDLeWGrjZLk?=
 =?us-ascii?Q?eVzHQefFzh20QuLUBKHZR6NrVRFi4BdCYaHewngB/JuMtaO92YY4Y03u5FAA?=
 =?us-ascii?Q?I9vRFX8rgmd09bg2DGOAy8pj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izdBjJq6ynQHsyjaHjMUDiibGjijDyC5bTSW667QaDAuERRj7e446WNybv+N?=
 =?us-ascii?Q?TpmxCHZohw77PGXAsb8RW7eeVNBFcokw0OHnrKi2iLhZ1d8fciUjBqeOD+Js?=
 =?us-ascii?Q?UGmiav9yEr0zkHTECOc2tXM4Mc45KM77dVpotSwaZ0DmR7YUTGyds8Bbi0Y5?=
 =?us-ascii?Q?fT79gVUuqNATgEokS6SRFBKZmQC8eb1Cp2ei7/dXTn9neEJkJqCyeM9IyqiJ?=
 =?us-ascii?Q?NcLetq2vVeYuoBy6SzuS7Ogivmw9pdr85i+beQN7tLJhpAqeFtjACca9aGZD?=
 =?us-ascii?Q?aH00iQrLv+oyptFC4EgG0lqHV+j+1I09zJ47KUNB+T2+8+gOSYplF8NvH3Om?=
 =?us-ascii?Q?CrpQrc1CI4RALSH0HzlVbV2We83hq3ApnjlahsAi9LPJdKKb3h5ciw8x7V3m?=
 =?us-ascii?Q?HUzP3jGdiFDg86zUCsruMl1/tVkaEIU+kHn6YkFRhyYLi8GXZcy4LXfGk5OQ?=
 =?us-ascii?Q?b/MmHet2/NJly2AMpyKTwwBXCOiJgrOodQ/WMXh0aRJwSt9SxiYL4Be8cBcd?=
 =?us-ascii?Q?lDz629qSkG8zwXMNK2g3YA4T/aSO9uDuMT5BLTB3JFs+qkfO6doI8xE7DaoA?=
 =?us-ascii?Q?WmLXOkn6TXm4N653R0EVA+0aKVfI4PXU1z86qvN5COwQR/7FUTS+SmE2Do1B?=
 =?us-ascii?Q?e0z7p2ycU89ARp2StCRvQR7MUzTvABVvxTWcMMiyKcKZ2r1NkeYuE6Sy4SEo?=
 =?us-ascii?Q?IUrEyzuHb4rx1U2zjPHFNggHMCl/q718fwDziWdCrxQEnH3cxg6P3rYp+r3U?=
 =?us-ascii?Q?RLyRb0xQecNSGEJRlSWWg7NtWRQQ8lsOUpmQk31FkPPAomaTB7wwSaHVTDcD?=
 =?us-ascii?Q?qosh8i7T4Qwz7j6OVXGPVtqRVsvNMhmM6CQF+uTbUTx5A0CjFyRwH59TZzP4?=
 =?us-ascii?Q?WUrw/tAfKnE2WDkZmOySa1La0oeIc2G3mV5q4Vwl9Z+DzOQE2zVcQhQZALZJ?=
 =?us-ascii?Q?BSMyNQ2FWgG18VynqXGQLUzXrCcoY6Zboo0HJW00pdMMMEByG2HWt5umGdvy?=
 =?us-ascii?Q?EvkA0na316ttbihZDvZWSVDuqzyjk08yInf9YLCWWMCcn/MgOYjiHhGTItrJ?=
 =?us-ascii?Q?ZmJNneAzOBon+0UVQM3mp+71Zha8X6DTj0bg4I+J9lp7XhyPdPJjTVbNlTHa?=
 =?us-ascii?Q?M5UlIjoUuzQbVCnu5xungR7fePifJi4D3yECCvFnjy74387p1qN1unsKJ4s7?=
 =?us-ascii?Q?K3vaT/wib0g/yw15D6timN60VWmr/MoYMv86wyZHv+L8VvohvNbCr//tuc0x?=
 =?us-ascii?Q?DSP07Ishu9cxMXpC6tw2i/CaWS/DfWeDnbI9DnIjcVIlk45exKRvvkwMlCJO?=
 =?us-ascii?Q?N5xwJArxhaWozP1MeME0OtwZ5lplFJG8Z701qHMNz+jaL4zDor9G7bHMAvGr?=
 =?us-ascii?Q?06HzXmDsmkJg+uEcAz5t2AVVR81qaKd1h5KvGuSZ65iQfo7dTXoHasISfj77?=
 =?us-ascii?Q?WQUMtRiHZIhuJWf47su7WV+SRdKIybYlvrXgKlQflcye4ruQ7ctQRVlYqZYV?=
 =?us-ascii?Q?zAXS7+DjfOecaGtzDoUVuFEMn87b1LSBhetlF+tX9aCLu7EtqL9RTUNftQcn?=
 =?us-ascii?Q?aiGibYsKZSnE9+Rjv2jB1luxasNBN7Kmw+mELfq7y2gfqOl5RAEy4C7jt6Z/?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ace47b40-e603-49f4-1c07-08dd04d2ff12
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:37:23.6322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyVWO0J3LM8OTdlnLxHpD79VUrG1XRPqQH0V7Ws7gngVkiMpP020dDqc01sic+blPMirhwt684VBPugMuXT/bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Thu, Nov 14, 2024 at 07:21:46AM -0800, Lucas De Marchi wrote:
> xe_device_types.h and xe_gt_types.h only need to know about the xe_oa
> struct sizes. Include only the _types.h, like done for other components,
> and let the full header to be included by the compilation units.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c       | 1 +
>  drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>  drivers/gpu/drm/xe/xe_gt_types.h     | 2 +-
>  drivers/gpu/drm/xe/xe_query.c        | 1 +
>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae9..8f7841ad8ded3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -44,6 +44,7 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_oa.h"
>  #include "xe_observation.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2c6a2040f0d82..ff19bda9ddadc 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -16,7 +16,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_lmtt_types.h"
>  #include "xe_memirq_types.h"
> -#include "xe_oa.h"
> +#include "xe_oa_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index a287b98ee70b4..20901c01ba29a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -14,7 +14,7 @@
>  #include "xe_gt_stats.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
> -#include "xe_oa.h"
> +#include "xe_oa_types.h"
>  #include "xe_reg_sr_types.h"
>  #include "xe_sa_types.h"
>  #include "xe_uc_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 170ae72d1a7bb..3eda616f15026 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -23,6 +23,7 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> +#include "xe_oa.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
>  
> -- 
> 2.47.0
> 
