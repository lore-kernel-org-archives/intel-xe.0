Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29B0C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C910E634;
	Wed, 29 Nov 2023 16:28:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56810E634
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701275327; x=1732811327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aIBNqQf+nPkDp9e2KRB2YgJ+O/xar6kN1oH74G0pIkM=;
 b=WsAGjZBUb689INJCyWq+LSVB1JN2qbTlteVR5YSXgO1txTb32WcmpEb3
 U49HtPqQIpFv5YSh23RpiL7YBq11P1nrrTPtq/nYZQOFZ2X2iF3/GoUX3
 ToogRpEA5MyZDAOCbSANFhxG29RdAOvkqiWYkpGRvzoJr8nEuEA6zyG0h
 En0otqfS/ezZjFV2El1zkTmJs+0wtw0AAMDQ4awS0Ekj1FrZWnA/57b5j
 QKdhogZLDqd1nzfKC20L+Sjy3rjQWTEe6wfgIL6JynS2k6TNcc93SmCrP
 Ly9r/ltMjExblOw1AZRjxf855EFzbIXNhQlI469Ww1RY/utaQVf1Wwz2a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372565702"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372565702"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="797968423"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="797968423"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:28:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:28:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:28:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:28:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:28:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAJysGpVjNGBNJkrU0DdrSC8Ctm8RA2isWKkvb5eA3F+lT07FjjzGwNa/eQnJ5iTMoUSpu8olI99Gpga3LWh+2kcrSwlyMac2IoMe2qvBfi5SNEGHbNt6kvmoXJ6WQl/rlvzEZR2/nfeNsWSF3GYD2yeWxbr2mC/3U3SLBiuER1S1tAfS7/nqWroC9CwXYbosuqoMOfJKggzWKBXNutw1zrGgSh/7wP40aW4M8Nd9iD4vbeazqQ3vaf9XtTsnADqgL1+pccxSumd020bq8ZXcJi1ORuJjRWVtpYEBo7/BVc+ZOPuJpgWRmXbtCR7DgfCAy3UnF35cUrfolrZCbr75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8QaPKE3rvlxNTWzWpSztuKYy6gJU2PZU0CeDztMZTg=;
 b=PAsrbBGnxbOlZ6Y6eggTc9hAqZL87qJRR0jlWPRWzCqUc4bjFGbTNfIXOQPeaxuQn3WQLkUqxomR7AOmnV3UgohKKA7UQsVH8oRB/G3+hMYcgqTXUIks+9isD37e+V0EcXk4F8Z7YrZhSffIi71QF5wsc1BV+Mv4CNFmp7ZNfZWgDR5vz0jlRzCjfWnW6OgKp+hp3fB0OXRwz6wIM97bEF/3VFJtGzOngtCzB8HtlyLycw3JXMHT2Ii+mDcNgcIktJfPmt7sooXdD75DiD4cDya6hO6CTJ4Rgj5fG64NGz/MfOh5Cy0RYUnOhUen7VrW2XaGwEidfU1WdJX14K176A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 16:28:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:28:43 +0000
Date: Wed, 29 Nov 2023 09:27:07 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZWcD680K1qUWEI+L@DUT025-TGLU.fm.intel.com>
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
 <20231128203203.1147-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231128203203.1147-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: c196b3be-2cbe-409c-b3c8-08dbf0f8410d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: grcgj0pB79c7VxWdj9RGXa6qesFGnUAFaHknwvk9lUgLiqU9qSBn5QHRt0oBK3YLde3IBTiot9RBC8eEVTzRtd6efGF/epfRzjd3wNG5DVCBRWlsyVMX0h+qh5VELXAKUP2p4QWy37snhSAgQxSa1Mg/pENZIbU6uAQgy1LnCQJyHZ6SdBLOMo2Yi9AgJSdMRdbUPqUG8dYYYaO+lnUF3uHuIY2IOH3Oa1bJddD/Q+F5sJMzlJPhcodn/vAgu9g6MPOgtuv8rj00bgDrzJJJRaR0diyUoRqT3nAvFDOHbjjQ0DfzmPl+DujU4WEDr5KS58pPHCgBgtKizPGwFPTYIhrDfMmR4skcVBvdhvkluhM1Yk1EI5hiuVMap6qaS+I0SPOB+2xs97ktVnee2igVqnmsO3qtnKwYXw/+ZOHg41PRY5f3Zeuk4WXrwmhLFOWETPtFSqOvTqWQEl+I85JSeJf9HhFfrNyCevFMpARkQWZF2xtRaOHAtnD9unkHB9LdGtpt1tzD5DJbmw+yJq9g+jivsp6aDDMj6/5ZDTh2mKKWHzbL+F1Xr9W7RgwTXchbCFsZ577UKWYI93QeTdRe1p62LXM4nJS467+feUvPzlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(966005)(107886003)(26005)(6486002)(6666004)(6512007)(6506007)(82960400001)(38100700002)(86362001)(44832011)(5660300002)(66946007)(66556008)(66476007)(6636002)(41300700001)(2906002)(83380400001)(8936002)(8676002)(6862004)(4326008)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7n0iW4zlTVNb44oCq1ZI3QOS9ZX5MqLuBixlP5DfKbMorpC03I7BDJKompvq?=
 =?us-ascii?Q?5m/2iZVRyg2JA+XRj5VlsB160ly3MtwQ8jH03BeSh/1eBdZEK7Fsio6uqbo+?=
 =?us-ascii?Q?7SOXpnyoH2ZM1yCmXQYGo0c1VKf4+Ty5rbvlomMjSFEmqJ45XcPPPNIJAyaL?=
 =?us-ascii?Q?djVxblxYHsMpciVAVJ5MCEk/zKyE+MMrkW8R93MrGfwFgMxr/3tsDSIqOjgg?=
 =?us-ascii?Q?fewUrdXaTJBaM8xhHMK/7HPIbkYtuuOjTi0NWqd1EfZ4niAotBj8B49KjCFZ?=
 =?us-ascii?Q?+ox9NueHxYVjaD61KoTEdT5VBOs237f+9nXMIF8PleEBLF4Bm12JpVmkCjNB?=
 =?us-ascii?Q?ZKMp1ZM6cA7YXujWDcCnOUsQ2W4YFkNM1PPfy5j9N1yGOx5CHFNJlQ6YIwMh?=
 =?us-ascii?Q?oDb2vJClsLKxiRQB1QEeJQoABC/Ie0RJR1OUcPfxUKsvx7e6pc+TfzCnJtbu?=
 =?us-ascii?Q?29w2/VY4lhKRPYLK9K9CMfH81Kf8zaLcw2zXSc73jEjMwjhZLgsGAJc1pnoV?=
 =?us-ascii?Q?THenrTwS8+pyKxtB65+Bt9YTBdzrseGTsezlYbDvQC8Mu5pqbwUpcULXuTj/?=
 =?us-ascii?Q?x4AZT+zfd3M4nwU9b4aN6BnHlGax8H+urDwhrfpQsMcwopPXDUEfx0IUeMwl?=
 =?us-ascii?Q?ff3v2A3zaY0a/vXV6GjSFtSUPuJU3ONtDdWIF/TssZ2frJzV2W7gTAs2QKrr?=
 =?us-ascii?Q?PqoIArQXK4E6//M+e2BesVZcM2BTK6jJ0SPbXhac559G1AaBnEF4RGkP+/Tk?=
 =?us-ascii?Q?rL1CfRyIYSLvFpMRudwT8kY0da3akFHXr1hEJedbYO0BuewT2tbBZ6IoWDif?=
 =?us-ascii?Q?ZnZ0lHAxwzhuYP/2IrCVCP3lG+RFAa72+6JT5CjWQ2ngMDK3g1DqX7UI7i3Y?=
 =?us-ascii?Q?9s3osYV9Vv4k6psXQ/bRcHgkCk0TNRXjuz1X51Pm15zDCgK76NHU9S/CPOh/?=
 =?us-ascii?Q?fALWOyLfiw9X8gmhnhREnT7VaGCjiVQxqGYs6mGS0GSkB7j02+o339LCEJRu?=
 =?us-ascii?Q?D0/+rP73tqKPk/tgtBNyQdWKRXpbdd7kwHdb9sQL8z5KpxpT7cExcTfajfZL?=
 =?us-ascii?Q?DaOEw5y5ylQAWa/ZrQ28Y9rOAK4LJp227e95Ubkrr1Vc5WZXMGZkH6pnk91U?=
 =?us-ascii?Q?DEjvHWRPKsdvtuifIPa1VYGmpgDAw35GLbpOqoARzny67b2gCeMub05fQZfe?=
 =?us-ascii?Q?vrmXiljb57lRRuVANaxucNvaWSWKsrijTFEChMakE3nWIgS11Awb98RvEBFe?=
 =?us-ascii?Q?VsDKvurBF9LyRomg4OX7F05Ay3BpF6jVNzljln30yUKIfb/lqGy1t28E3SEq?=
 =?us-ascii?Q?WhQ/VrDMXekBy2SdePEYZwwtYE6D0ZiV0/X4c+5rdr8aCF8edH0M/K5X76yO?=
 =?us-ascii?Q?6LOqw1cZJcRXLpkDwcMkyHeho9itgfS4SbD/VdEclE1KsYVFOShelhWX0cP5?=
 =?us-ascii?Q?wrYzypjhmglOfT5qMg8o0ohXo8gzRcq//8uLHDSrwpH/4KwSN3rWX6CV8hCC?=
 =?us-ascii?Q?7KZJjqE5mpUMESvbVkCO5Xp60LQzJq50WutBkcjSoHO6UXU4YK1rPbx5POTW?=
 =?us-ascii?Q?sMPkZcUE4iXPS4JaUBTAY8ez8qpN54y7wFMVKHX9qumqJrbHA+VDSAn/b7PK?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c196b3be-2cbe-409c-b3c8-08dbf0f8410d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:28:43.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwZfOlW4y8Z5iQB5Zf2RUNU6mWPwbL/iVN69fUx3lGGXEvPZfUpzzl8brVhLGiwzNCOjoBmS+FtTFzhdsmga6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/guc: Include only required GuC
 ABI headers
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 09:32:03PM +0100, Michal Wajdeczko wrote:
> On i915 we were adding new GuC ABI headers directly to guc_fwif.h

Let's maybe even try to kill guc_fwif.h sooner or later.

This is going in the right direction, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> file since we were replacing old definitions from that file.
> 
> On xe driver we could do more and better by including ABI headers
> only in files that need those definitions.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/741
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c        | 1 +
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
>  drivers/gpu/drm/xe/xe_guc.c                 | 2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 2 ++
>  drivers/gpu/drm/xe/xe_guc_fwif.h            | 6 ------
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c        | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 2 ++
>  8 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 03c1ab0ab0ca..a33f4a37bf2d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_gt.h"
>  #include "xe_gt_tlb_invalidation.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a28f31c05b1b..7eef23a00d77 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_tlb_invalidation.h"
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 08142d8ee052..e6f680efb29e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -7,6 +7,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_errors_abi.h"
>  #include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c44e75074695..6295d916e39f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -11,6 +11,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_klvs_abi.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 4216a6d9e478..4dd5a88a7826 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -8,13 +8,7 @@
>  
>  #include <linux/bits.h>
>  
> -#include "abi/guc_actions_abi.h"
> -#include "abi/guc_actions_slpc_abi.h"
> -#include "abi/guc_communication_ctb_abi.h"
> -#include "abi/guc_communication_mmio_abi.h"
> -#include "abi/guc_errors_abi.h"
>  #include "abi/guc_klvs_abi.h"
> -#include "abi/guc_messages_abi.h"
>  
>  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index 57d325ec8ce3..98bb9bb30705 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -7,6 +7,7 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e9dd6c3d750b..2919c6aea403 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -9,6 +9,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_actions_slpc_abi.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 97e87c701af5..46b132ee1d3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -13,6 +13,8 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "abi/guc_actions_abi.h"
> +#include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
>  #include "xe_devcoredump.h"
> -- 
> 2.25.1
> 
