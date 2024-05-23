Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A4C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81A10E167;
	Thu, 23 May 2024 21:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xj/nZHkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9643A10E167
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716499317; x=1748035317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5b5lcZgTXZH+0tPlJdVYRV+fjpa7Dp6tJtgfuPhjaxI=;
 b=Xj/nZHkBk6oL0p8Y1RWl5EzRncH2luJGGjUl6vWk70HNHqQ6NIH13YA3
 +7i/MCGx9x2xtDN4ZWYxKTwivx0fQHD3xKz8o2W9hR3oMtxzIjna0dD5v
 dUFtcVc5nE44v3I7c7QMBX2ibQ3NkpIbssz4U2+iuyjS8CyKxK3Rqi7Eq
 xsnCM22tEdqvuamweD5dEIk1jE+SvbPuNDyRTFWSNyM2kPQE6SlRzWnkq
 S996+/+6O7A+auCzhUVv6RhkAtPDDosTTmxVNq2Y/femLAhq07TkbFRVu
 AKKLaJp6T610q7ZcxPJMeYB57CYf2zuf8/BsKy/7LsRVx+JKyvnNRDyTp g==;
X-CSE-ConnectionGUID: Eg+JUmmLSWWl45MLSl7myA==
X-CSE-MsgGUID: D6fbX+SESoqJz2n9nOyQ+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="35368314"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="35368314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:21:57 -0700
X-CSE-ConnectionGUID: qrlJyjSESReltSpifhU+zA==
X-CSE-MsgGUID: yAbXbSFYR6exs69//F2NXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33680650"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 14:21:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:21:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 14:21:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 14:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4TIB0e+5wRAj8Utja92nSYklXBblRnbZ4To+gNmFODlYwhJLkMvUZYAZ3NDU6CjLAPFui5nyqSL1zyzBmN71+AkhY5HOVdBRJ073OFtmjd5OxlHOcYgHuqPiV+CsUK9PGsw4sAHuaNZsm4NPwPAnJLv3oHgG7fbbpw6R47Ex5oI1ODABnOejLixEV9VOA2yyDxXKEQGbT4gqzNTrEQI3tto9wYI3/GmjefLEAPg7fawuIcdt70T7wiUVDJl/tw9iUNOtn7sA3JI7OK55wqWGv8Rl7Vrvd8t1ZgVGrRNHV/OuW4F/z573WXQVhTMFqE762BJl2qBjnE+LVj74PXBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82B9yfFVuwQbw8w34YUecexCRLWSXe2HVA8HJCQC5eY=;
 b=OEceALTt7d7QlharhvNUHTo3AYiaCgcPQQohB3rvW7x2350KCDeMt0sH0rSUou6Xey5oJojHvvZ3BM3zrssyHzyMqEM208vNFQ79ze/CPQco+VutodBCZmCI+iPRWsVCxTr/LXgQytxGps5r7uWot7ItTJtnbgav21vM6yLkZdazaY6Id8lSJlFNFhwkGQ4Rswp0OjQqBg3r4AjujDKtAL6zONOlFi0y0KboooUtIFxcx15zJCotIwssSZ6TueBf+jeinjzIE0ZUC1tp7noJXYuHk7/aVRyOG/Wffc0cfYvXG+cs8HsW4Z8wofBt1Webl9GJz5qfj8AtU5X9sMEiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 21:21:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 21:21:47 +0000
Date: Thu, 23 May 2024 14:21:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/xe/vf: Treat GMDID as another runtime register
Message-ID: <20240523212145.GE5383@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f86bb42-8eb7-45f9-f84f-08dc7b6e5a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NbctsWM6EOu+kNMuR1iT11/2IcHV8Y/L7TETZDt3RydXR9bq1Gpv8JvXBCdV?=
 =?us-ascii?Q?uw8jtsYj+8o0KYXWZE+wDf81z8s0Q6GHzjS6IkPjzguxAK6po0ALIwT7Sc1f?=
 =?us-ascii?Q?Fjje3nmGbhxIJPt17m88AhgwTFzSkXw54H/WOhS8z8fqqHbmyag4zKptL0U9?=
 =?us-ascii?Q?LKo0+XFN7c6Wx7a8Oi19PddzSc5ul1KR8gTKKNCwhWAaY99JATrQsoUq8kPP?=
 =?us-ascii?Q?yBxoJZashdSzCwdh4IQAt8LoQSyjSnAKNAW3fdwG0GjvnPJRbT1oSkca0Dfv?=
 =?us-ascii?Q?Fdj/VA2n83+109QwdubZtJ3soqRxTSUcVq1/8hoJ/qkWxqevoNXL0sgPVbXs?=
 =?us-ascii?Q?LdlmoprWjscCg2j4iJDH0F98z/vrjmDj5qQleg8PE5LB6sXhU+wsAKf6xabk?=
 =?us-ascii?Q?afQ2J+naZYMmwovqsWPJy1djD08ccDD+7tWGtxnfrnqZcuZoFgLrm4NeIBtz?=
 =?us-ascii?Q?KimkRAIwxuze6nYYjEOot/PHoB4Jx+/6Af7+6gK2IAoMLltOh01OnMK8WcCm?=
 =?us-ascii?Q?ADIzhAxvthInsxz9bNejozh65EWEZDlLJsy6/hlPlzFkUbSKWpaYcEJgqJM9?=
 =?us-ascii?Q?glji5QIGP2svqFRSu/l97G1qVpDw2sJRZgQF9Tik+HggBoHKh+OXPIjGCPWY?=
 =?us-ascii?Q?5zXN4nj7gRFJHe61Ej0fIZ5p9fbCdBYr+8u/yPMJkiBEIHjC+TYWDxPaEhP/?=
 =?us-ascii?Q?qS/WcdqZpNDWSNgV2X+fwqoGk0bto+DDya6+JN5EK6TNsHSWnnl0Tf9LKZzf?=
 =?us-ascii?Q?/WMZxQGPgxP+I3J8Dtvrci1xSz/vRVo0uA9qIq/PRYzuido5SM43+H3VLBDR?=
 =?us-ascii?Q?zhDYyG4mz5Fu3yQ2Y4Te29eGEtEcWr1RBVHqKtdRYdW0UNDzvcIpihaF+6oi?=
 =?us-ascii?Q?G1Rf8QGJ+gCaHsjkmAcE1fM6U3wLYLXamg2HkTNeOU2tkEMsA+NVNfbD4KhS?=
 =?us-ascii?Q?MvLcoEx1LtSDB6yRxs23wVobwW0L3u0Q1rBFjpjZNhJesFDrg5fR3XA9giWW?=
 =?us-ascii?Q?zOF9g68/7MNAAMO7VAQZXjArvPm7y/Q0mnBAvAOFUhgbIdAMxPiQt9irA9er?=
 =?us-ascii?Q?cj7YPXswAA0KnvOnhIUMEzShwQgmLpgZR7cbq3bVbpos5FYLGZdLYTAzpTGI?=
 =?us-ascii?Q?laPf3NdGJljSuQd7o27uB7jyRt4qq+y60twWyAXlV2HgTlZrIRCIWseadzZt?=
 =?us-ascii?Q?JZinXdXcbZS5NSMAGjFyIlXRbQyhsIp5Vh4wBt+39m955wb3GBNqorz+bD1+?=
 =?us-ascii?Q?bXSsppDpm2gD0gat710ri4N9RRVuzbhynQN/zhOJXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aj9jEuA/35sciWOqBa5lVTO010zg1SgzeumXN7A6ter+NcUR8I34ob+j/n0P?=
 =?us-ascii?Q?qG4GejjZ4JRPyKfbBeU+S981UcYNT2gyZZMK1oN40Q9JjuRPSi7GMi/7clzT?=
 =?us-ascii?Q?n0kyyRgySoJ1pyALv8PoQ/g/nnS14YnAjDpcviqv9xmJL9QKLc6Kxy712xfB?=
 =?us-ascii?Q?l4hHIqXsAI1NNv7r9+P1BhHjGlz18LJ0LGmPU6H0sEtZ4JFLmKzbxws3HJdX?=
 =?us-ascii?Q?KEMSiwFsboeKUlCJPiWoAkEXCb6qgPwjxZJv3GWz+53QlYndYx05sJGQuZ6K?=
 =?us-ascii?Q?eCAzjW8iB1x2OMlrcPKC3NbAFCefulTPvv4zIWJ2RwHMxZojYj2WIVyoQlo3?=
 =?us-ascii?Q?E3Ox+DzGxps+Y9GRqIEJqObUa51JcW0C/DvbgBOP4fpa7oCqfF//SM/vPIwl?=
 =?us-ascii?Q?xrs49G1ArFuMVsCbWdut9wTOaCokmaJi0+9I4setBEr3DYMMW1JEHPQsIYRo?=
 =?us-ascii?Q?bbZRO/8BYSj59xLfb5Bi07VidbZKW1xfmx8tYguofWEm3eapTPpEguigqZoV?=
 =?us-ascii?Q?LHIjucEP2okN+Gtuj49EjvkMz4DSM31+dan+64sP0G5zZPI0K4Exslu9bWiG?=
 =?us-ascii?Q?6CB0yCRHeMTr0VHLyP4mDLufGY6m3UoUaoFMc088iqHxQY1obM0jtH2VwFwi?=
 =?us-ascii?Q?5c/x+A/JFd49zrfObrV6DGVz8GOra+VYsrUB2jLV1PbrUG2BlcSoB+olWgn4?=
 =?us-ascii?Q?0PaHS2eJ9DwlC4uhXyzTaAjB0oRnrDVvVG/gLyQdxQ0FNDbPZNsPdIhrXzwn?=
 =?us-ascii?Q?Qqr0dB8Cvp6JnGbO/Zdcw4jGl/ea3WsgIdywzb2/bdp2wSzOp1sKwTt4VvQI?=
 =?us-ascii?Q?VUmndBcgRb2WuPzTjpuOK6eQVkcExg2aQY16vcZQLYDtrC2R9ywcIeBB2163?=
 =?us-ascii?Q?D/eUAjlzSnpm4zMZuyfoz+ILJrM+OQ+bKMkIuVCI/c7SQ4f55aha7IGE2kYr?=
 =?us-ascii?Q?hyVRSftUJifEug/oCUgrjuBMPChGpSIchvo44j1oaBLXMdLh6Ym5OEhdDtMj?=
 =?us-ascii?Q?0MykVDgiVrXMfAXsQRzeYFGKSrWpqXTR9B27MhuS2XYuXAUjOq/QnZ6yf0na?=
 =?us-ascii?Q?YDCDIlMwvHFZHfV3TYusv0MA7h3E/NLJj//RHDy7zO9yFdwcvjy56bLNdjc+?=
 =?us-ascii?Q?WzUvbMcEN23NhVBS2nKnjcl0582uKPqzBQJonPANUaJ5S0i8EyzKBY4xlglh?=
 =?us-ascii?Q?FXwWefEsfJf4bvUYr+s40F/zdE94QHXcSZLyaL4YkrhSMHi1I4Q1+wv7DTws?=
 =?us-ascii?Q?C7aYOXMznimEMd3aLyRWPhZuv92rRTzxCg4+atE1yx90YxVbw9ePDwb8JPI5?=
 =?us-ascii?Q?6NjztZ1/OEjkyQquLb0t8cMiBU8zabnw5LiqISZFzTc+EUNFyXoRtxaOYDvN?=
 =?us-ascii?Q?auMUO75gY5oO2q+LAUIHzcMmrxDAcjZJxAcUXV8OZh4bejE/pT3var8ksMCk?=
 =?us-ascii?Q?WE2JNE9kqPh6nabBpYLlKKkC9CRskHS8daS5Msa9Zv9wBE7xYy2Wxr/6lTx2?=
 =?us-ascii?Q?crawwvb01hsJyjHjSUup5MTJqFhX0VV+hdPnGv4q+AvdcTM+NqvinVyZ5CWw?=
 =?us-ascii?Q?089dH70zM2vQMt2tscL1ZJmuQBQJaZHBhOLXIh8nH6jTwWGqsCVvVjANYR51?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f86bb42-8eb7-45f9-f84f-08dc7b6e5a9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:21:47.7877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6u7Jz+g7n6nT5BEzsJJewSv3kxPNmJUWYD2vLr1nooK/Wi9AX7Tb0yV8gfh0vrQiXcVAPV9elbTkFWShe8OeTGaoDMkINZZHcewYfo3/6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

On Thu, May 23, 2024 at 09:22:40PM +0200, Michal Wajdeczko wrote:
> While the GMDID registers are not part of the runtime register list
> shared by the PF driver, we may still return cached values from our
> VF specific read32() helper function.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 347ab7060588..66069eb8c5be 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -13,6 +13,7 @@
>  #include "abi/guc_communication_mmio_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
> +#include "regs/xe_gt_regs.h"
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> @@ -764,6 +765,12 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
>  	xe_gt_assert(gt, !reg.vf);
>  
> +	if (reg.addr == GMD_ID.addr) {
> +		xe_gt_sriov_dbg_verbose(gt, "gmdid(%#x) = %#x\n",
> +					addr, gt->sriov.vf.runtime.gmdid);
> +		return gt->sriov.vf.runtime.gmdid;
> +	}
> +
>  	rr = vf_lookup_reg(gt, addr);
>  	if (!rr) {
>  		xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
