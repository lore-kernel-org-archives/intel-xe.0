Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E98AC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:49:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B9B10F305;
	Mon, 15 Apr 2024 20:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXq6NfM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA81A10F305
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 20:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713214162; x=1744750162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NeKhZTu+hfxHm2mtXg0+dcYI6Cm9YBRRnNfWynYa8vU=;
 b=BXq6NfM1X3oJwzkJEczsOGnoYp4r39EwN0kKaoSG5dJvZKlbmVCF+N1U
 Iyvi/dfiD4damBFIjH8PHObnTmBErwY39oxWJELFV/fZTX7+9ZrFcC6dg
 mbDOa1NM4c4GMXsqn4q7WsGvkvdGkLNZg97SS8vXMbNVLN26Z9KbQ82VZ
 5dOvaVlg7VE1OAOpIVwXnKbFEd6ICs0/I3k+/YT53PfbtvtLeq4Slj5BJ
 HGHbM1swrDvFxhJ0osXa6Iuw4koDyjVuOGrR3NkHeVq7clNBjT3yBtX1i
 wSXjhzJXCF1CH+eIsE1pgIBHYnqHbME2hOMeJzyWPoUcjlsaRDv4lpmJP Q==;
X-CSE-ConnectionGUID: 4R86lU0rS3iVq2BsJLXg0g==
X-CSE-MsgGUID: rydE9rY5QPC7TiID6k8GkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8749169"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8749169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:49:21 -0700
X-CSE-ConnectionGUID: YrT9zlP7SrqajPJjfD4MAQ==
X-CSE-MsgGUID: TAWSum5QTj6+35TAgilv1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22035823"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 13:49:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:49:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 13:49:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 13:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCKJcLO3jxl4M3smojrflQQ8g9lnw9VaLv+HYvPoxuTdqg6quE5cxjehZ2a222HJztEIfB/L89zTpvGiiGcTRCeTRm0OWFOffl8774cti5OgRIasIizxHtWjSlNWYs7eO9ojmgf6wEcWAJ6vTPACJqMN8dut5nqeZyFBhTwOuGfaKoYZzXmXHHeNTvkOwIM+kPRJHTrCxityaUJNh24YTFlc6H17MVwZQiEEwcCzwO+CB663qXGmXZ/FKZabwX/TJLEqZe2AxI49PvRV53cUVfHr/YJmjXP7z0WV+TJFMRfmoF3nPUZNlHUtWmVwv48JjJr115bOkFB8EoMsJEHu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uql3dhkKdIfzMZRiDGPVJDK7mDeQu8KAKCDFy3aRhqw=;
 b=PgLQmM3fTJ+pRb9OgtpHaHK/aPDwX9O6xjWBLTP1faVMw0d+GEVEDic0odXeOydBfO5sTglpLODKMpSFAOhXVOx2yc//AHjgYX8AYpWQt8/7Y6ULgH9vpKfPbIlz/RiEObo0H4dCWKfr8Vb4ZCrukBsSsVj78BwcA8PGlexpahYUtkTVdD50IjslHe1ENlZ27ZKJk4R2BzfvuMldt1t97sSnFOCp8PddPz1Ews/FMoezxiGmHAN4wGjCjRPRPeqp3TXh33fogkSCpHgGSM05aMf1i2CVESV923VC/BWB0dR6eBq8xnRTGVB6lL8OPLAeh3xxpxYPE/E2IqWibsGK9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5942.namprd11.prod.outlook.com (2603:10b6:510:13e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 20:49:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Mon, 15 Apr 2024
 20:49:17 +0000
Date: Mon, 15 Apr 2024 13:49:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add L3 bank mask to GT topology
Message-ID: <20240415204915.GB2948065@mdroper-desk1.amr.corp.intel.com>
References: <20240410123723.7-1-francois.dugast@intel.com>
 <20240410123723.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240410123723.7-2-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:180::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 309ac929-f524-48de-09fc-08dc5d8d8490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h8KWitcB3fYM683doTzmUE6cp+QbKNGfP6tdMlQjgUQqmznCu7Gg7m2goKyCUpGgWkKDF46MYBGwQso8zmc1GzcpycgiHllcPy0YKWIT1RF6obKqrxeX7T4U3O242YTLKbWn13GAu7ctpucaHPXX3lKtUF5cCx52u7GJT8LuMDfpgiATqzQoYp23uBBCDectlEjQ9bf3Tq25ZAX+TI6BuY1IQXoVf09r9ZPMN56VJK4pEQQHO11GHe9lpmjNMbaMqgWJz/ngdrieFkSjxiwiKJizfX2IxYsppRsk48jQQ/tHNUovGQ+SBx4+Zod0Ytdb2nyp7R4zkUMYb0vh/ZNOqLgMYa2JxRnAPSMAdB75+WqsfUhrLtbKQKKsHbHtGmGx25hf+mAsG33N7i+LNNIV+tNCnRYOGNG6qxlH43ZY9C5egqHCAVnQRPWVdhYuogw4XmZqZaQtfSR7GaBWnrzSdwFSCJg01goXDGkB661uZ8gEcX/qoz5Wlf4bOjFw39nE8Q03VN31v2J5N9iFYfXD7WpWq89yZjBA1zItCwHWW/brnZ9dqtfSCRtwgqsFA3DojFfHKcXXSyms8JHk5EcnGIsoTX0tkuNHwKBJMwLp47tSp7ulFgu/H1L18kzQ9rOxfPK5LdqUtPMw+UKr5qH6Fj2yCFoH/1qX2eI6juJ3CvI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk1EajlhN1BkcVlNS2swMkw1a3ZPcGxoWnNBdUU5UjZia21LaGQ0Y0s2UlAy?=
 =?utf-8?B?aFVtMld2ZS92ZGRJT0pGWjFzSUZUWkxvaVlGWTVYd0V5Tk84WDlCejRTK2NU?=
 =?utf-8?B?TnNpYmtEWUxCMExPR0xEMGthWUVrV0xLNVg1d0FzL09mU1Z0NjRZS3VKUzhU?=
 =?utf-8?B?dlZwZTQxUlFWcWUwSlZIVEFGWEZmaTBtdWx0Q2ptaWNUQ3V0bjFmMi8xUGU4?=
 =?utf-8?B?cFM4VzVuNmszVzhjVkhQMGhORzBMWCs4K2FpbEhxZDFBZmVxRGU3Ykc4MlU1?=
 =?utf-8?B?dmFNMHphZ3E3UG9VRDZaTEp5YkhvdnNJSThQdkNwai9zcVdaaTVsVDVRS3Rv?=
 =?utf-8?B?ZGUyQWhIZHdvSDlNZ3ROazdTTlhUQTZYdWl1YVVoVFNOSmwxeGxDMkwvTkdn?=
 =?utf-8?B?ejNSaWVMVjk2VEZicXJlc2N3blN5N3JSaHh0QWwwKzAySnVQV2M5UWhldk1H?=
 =?utf-8?B?OUpBMjBvVnNWY0RuWmV4b2o3Z09qYXRsMlZEREI5VVhXckROTTFVYzBlYnpz?=
 =?utf-8?B?aWZnZDYxUHEwS2lKNHdocXhZOEc3c3NUZ3NsT3EvQzlLTUNNb3drYzdkSDlu?=
 =?utf-8?B?Q2lnbnZQam5memo2akRKRXNubm43UkdMbU16dmg1SzRHVndiNlZBZS9CMU1Z?=
 =?utf-8?B?a3FtbjF2cjhtdHN2YmJSVklCdkY3cUJiazFrNm5jVGJWTy9EYW5rQ3NsZklE?=
 =?utf-8?B?OERKZElBMTNVY3IyVzhmUDRjbHdtVlZTOGVtbEhlVFB4T3B1Z3pOWTNUdlRZ?=
 =?utf-8?B?Z2twZnRBSkYzalhDcHJqWjBveE1RbzZnaGR4UTBpUHo5cHRXdDRoSk1qa2lR?=
 =?utf-8?B?eXNFV3NrYjdYZDJzY3FEV1ZEZjB1STVhSVhxbWNSc3hDODRaMVFPRWE3S0ZD?=
 =?utf-8?B?R3NLd3VOcy9FbmFidUI4NHoxZnd6WS9GU1lnTGYwaWd3SlhvUElNbVVFM2pQ?=
 =?utf-8?B?YzJrdzNsbWs3WFJqWVgwK3plZld1eG5rdENPSUZZYnJTVGNUWFpUUkExejgw?=
 =?utf-8?B?UngyVEpYTlhtbXo1czZaNFFCY0ZTajVLc1A2aVAxK2I4RVorM2dsWmxlRlhM?=
 =?utf-8?B?Vk55SXJNUmI1T2k4TTRJejRkOGlPVGU3S1QxUmhJa0NxK1czSW1WWDNZQmhI?=
 =?utf-8?B?UHFQV2MyMTFiMHJ1RXVHSlVhQ2thL29va3orSlVXN2ZFZnFwZ1ZaYy9lajB2?=
 =?utf-8?B?ZVdzRlNOc0N6NkhsS1Q3bWs1clhLeUhGRFpaY1JjTGdiblJkMC82OGxNWGs1?=
 =?utf-8?B?QU5udlFLTHErQ2VZMDkybHZTT3lkMzN6eXdsZ2h1SkRTZjhKU3h5Mmk0KzR4?=
 =?utf-8?B?TlZybGVDR2grR25wbkVhN0NzVi9rUFNQbXV5emw1MEhyTlRRUHVBY3hjbEdl?=
 =?utf-8?B?VVAzakhkVVVINmJ4TnNRb3ZGQ1lPVlZWeEFFRitYUi9VT0NpRk4zVlozTWhC?=
 =?utf-8?B?MlBaUGUyK1ZiWlozUGFKaU0rNWFjWnBFTTZWQlJoK1lidUlYajVJRmY4V3lx?=
 =?utf-8?B?aDBidnY2UDlhUmxTTGd1YUpmWTdkZlhKRGhGdFdFYmx5cXYwYmhPVmJyd3RM?=
 =?utf-8?B?cGdnL1lkVTJJRnVnUXpWbmx6ZGwwMC9pTUw4YnRCSG9EZy9YVTQ5VWZFM3lj?=
 =?utf-8?B?UHErbkQxellBNEFlZTY1M3h3TjhET0d3djNOMVdjaTRsWk9OZ1VlcXZ4enFw?=
 =?utf-8?B?MDdjTGNFRzB4RFRzUmZXK2VMRkFKRkRRZmJoSVVIaDRvMDVrRFF4SjdBaWJ4?=
 =?utf-8?B?R1ZtUzdzTkJSUlRicjkwZXBjZXI3Z3JPQjJCWTBoUEQ1bnhmTlIvMk13TmVN?=
 =?utf-8?B?djlwZFoxMzYyWmRPVHp4YW5JeUxQWmMwRkZGeDRzZDBhRzVaS0kzTjJQaExR?=
 =?utf-8?B?SXl1TGVaYTRvWVZtWXRCSVNOdWVvUW5rcjJGeGIyY2dwb1FONWZCYW82SlVV?=
 =?utf-8?B?NnZ5ejQ1aG91VWM5cEpWL09XZndYUXo0S2JiNnh2V2ZrYjF4T0JuMXBMN2Nj?=
 =?utf-8?B?bzlzeWQ0OUFxcjNFRU1peWl5YTVGUFhhakdoY3ZabWtULytCL0Nua3g0UXN0?=
 =?utf-8?B?OEZTNWhjV0hEUWlYRGhyOE1wSFFJelp0RTJkVHJ3K0ZKZm93OUFhdzNvc1ZP?=
 =?utf-8?B?cG9FVExWMnlxOWhPUlNGclIwWVdFS1ZkZHA2ck4xMTNma0VJcmJ4WFdwb1Yv?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 309ac929-f524-48de-09fc-08dc5d8d8490
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 20:49:17.7528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtDsztett5s+bf6rCaPyfX9fDr0yrR0ukfhkgZjDlfUQ8r2uNU+yEu47FxEUpyvFXJHdprxh/GBHbx9GhFbVCYD+RnE7v9KckuMGpQDEs/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5942
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

On Wed, Apr 10, 2024 at 12:37:22PM +0000, Francois Dugast wrote:
> Generate the mask of enabled L3 banks for the GT. It is stored with the
> rest of the GT topology in a consistent representation across platforms.
> For now the L3 bank mask is just printed in the log for developers to
> easily figure out the fusing characteristics of machines that they are
> trying to debug issues on. Later it can be used to replace existing code
> in the driver that requires the L3 bank count (not mask). Also the mask
> can easily be exposed to user space in a new query if needed.
> 
> v2: Better naming of variable and function (Matt Roper)
> 
> Bspec: 52545, 52546, 62482
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 112 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_types.h     |  13 +++-
>  3 files changed, 124 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 8fe811ea404a..94445810ccc9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -165,7 +165,10 @@
>  #define	MIRROR_FUSE3				XE_REG(0x9118)
>  #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
>  #define   L3BANK_PAIR_COUNT			4
> +#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
> +#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
>  #define   L3BANK_MASK				REG_GENMASK(3, 0)
> +#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
>  /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
>  #define   MAX_MSLICES				4
>  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index f5773a14f3c8..7d459e093b06 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitmap.h>
>  
>  #include "regs/xe_gt_regs.h"
> +#include "xe_assert.h"
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> @@ -59,6 +60,114 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>  	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
>  }
>  
> +/**
> + * gen_l3_mask_from_pattern - Replicate a bit pattern according to a mask
> + *
> + * It is used to compute the L3 bank masks in a generic format on
> + * various platforms where the internal representation of L3 node
> + * and masks from registers are different.
> + *
> + * @xe: device
> + * @dst: destination
> + * @pattern: pattern to replicate
> + * @patternbits: size of the pattern, in bits
> + * @mask: mask describing where to replicate the pattern
> + *
> + * Example 1:
> + * ----------
> + * @pattern =    0b1111
> + *                 └┬─┘
> + * @patternbits =   4 (bits)
> + * @mask = 0b0101
> + *           ││││
> + *           │││└────────────────── 0b1111 (=1×0b1111)
> + *           ││└──────────── 0b0000    │   (=0×0b1111)
> + *           │└────── 0b1111    │      │   (=1×0b1111)
> + *           └ 0b0000    │      │      │   (=0×0b1111)
> + *                │      │      │      │
> + * @dst =      0b0000 0b1111 0b0000 0b1111
> + *
> + * Example 2:
> + * ----------
> + * @pattern =    0b11111111
> + *                 └┬─────┘
> + * @patternbits =   8 (bits)
> + * @mask = 0b10
> + *           ││
> + *           ││
> + *           ││
> + *           │└────────── 0b00000000 (=0×0b11111111)
> + *           └ 0b11111111      │     (=1×0b11111111)
> + *                  │          │
> + * @dst =      0b11111111 0b00000000
> + */
> +static void
> +gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
> +			 xe_l3_bank_mask_t pattern, int patternbits,
> +			 unsigned long mask)
> +{
> +	unsigned long bit;
> +
> +	xe_assert(xe, fls(mask) <= patternbits);
> +	for_each_set_bit(bit, &mask, 32) {
> +		xe_l3_bank_mask_t shifted_pattern = {};
> +
> +		bitmap_shift_left(shifted_pattern, pattern, bit * patternbits,
> +				  XE_MAX_L3_BANK_MASK_BITS);
> +		bitmap_or(dst, dst, shifted_pattern, XE_MAX_L3_BANK_MASK_BITS);
> +	}
> +}
> +
> +static void
> +load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
> +		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
> +
> +		bitmap_from_arr32(per_node, &bank_val, 32);
> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
> +					 meml3_en);
> +	} else if (GRAPHICS_VERx100(xe) >= 1270) {
> +		xe_l3_bank_mask_t per_node = {};
> +		xe_l3_bank_mask_t per_mask_bit = {};
> +		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
> +		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
> +
> +		bitmap_set_value8(per_mask_bit, 0x3, 0);
> +	gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);

Looks like we lost a leading tab here.  Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Since this initial patch is useful even without the uapi in patch#2,
applied to drm-xe-next (with the whitespace fix noted above).

We can come back and apply patch #2 later once there's a userspace
consumer for it.


Matt

> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
> +					 meml3_en);
> +	} else if (xe->info.platform == XE_PVC) {
> +		xe_l3_bank_mask_t per_node = {};
> +		xe_l3_bank_mask_t per_mask_bit = {};
> +		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +		u32 bank_val = REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK, fuse3);
> +
> +		bitmap_set_value8(per_mask_bit, 0xf, 0);
> +		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 4,
> +					 bank_val);
> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 16,
> +					 meml3_en);
> +	} else if (xe->info.platform == XE_DG2) {
> +		xe_l3_bank_mask_t per_node = {};
> +		u32 mask = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> +
> +		bitmap_set_value8(per_node, 0xff, 0);
> +		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 8, mask);
> +	} else {
> +		/* 1:1 register bit to mask bit (inverted register bits) */
> +		u32 mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK, ~fuse3);
> +
> +		bitmap_from_arr32(l3_bank_mask, &mask, 32);
> +	}
> +}
> +
>  static void
>  get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
>  {
> @@ -103,6 +212,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
> +	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>  
>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>  
> @@ -120,6 +230,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>  		   gt->fuse_topo.eu_mask_per_dss);
>  
> +	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
> +		   gt->fuse_topo.l3_bank_mask);
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 2143dffcaf11..e60156871026 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -24,13 +24,15 @@ enum xe_gt_type {
>  	XE_GT_TYPE_MEDIA,
>  };
>  
> -#define XE_MAX_DSS_FUSE_REGS	3
> -#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_REGS	1
> -#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_DSS_FUSE_REGS		3
> +#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
> +#define XE_MAX_EU_FUSE_REGS		1
> +#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
> +#define XE_MAX_L3_BANK_MASK_BITS	64
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
> +typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_MASK_BITS)];
>  
>  struct xe_mmio_range {
>  	u32 start;
> @@ -327,6 +329,9 @@ struct xe_gt {
>  
>  		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
>  		xe_eu_mask_t eu_mask_per_dss;
> +
> +		/** @fuse_topo.l3_bank_mask: L3 bank mask */
> +		xe_l3_bank_mask_t l3_bank_mask;
>  	} fuse_topo;
>  
>  	/** @steering: register steering for individual HW units */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
