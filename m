Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCF1C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B310E748;
	Wed, 11 Jun 2025 21:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd764CkK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B9210E748
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Jun 2025 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749678606; x=1781214606;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dSrFdCYksj+A7fPIWfFcTUo5HYVuDGewJo43CSYmulo=;
 b=Gd764CkK4D/cpFahz33oKam/qeu5an5ydxxgMq7RV9P3s5yiIEgOdZtE
 8fqydmymKmvK0X/rLU7TPjovbyV8S4zHuKbbntkBAjBY0Ro1b/yvY0aqv
 i4TFrhajTCIxSHnRF02RQ0x94JgWTeeT30j8VKZ7Ogc2/936stZeqc97W
 gGoEdOkj+tSpUsTd25Tkka0MLkGi5PM9njefA7kecyxjpo5WxbNSKH0sH
 AmNgto9/DpE81ENacLXpewHASjnw8m7XgaTUgvaIBwKG8geVhu03yb2j1
 BJDhqu58+qsUOc1Os0q9+j/VmWOvK8QuFHxo8yGlCknilYUIH2rtOUydT A==;
X-CSE-ConnectionGUID: hbiYq2a9T4i64F+t10lVJg==
X-CSE-MsgGUID: fWtE/+x/RGmjSOLi+0eM3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63246345"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="63246345"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:50:06 -0700
X-CSE-ConnectionGUID: oS2N9cs1TB2PZa8ufoRX1w==
X-CSE-MsgGUID: 9OFakYsUQj6vcwm8T8jlkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="152591857"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 14:50:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 14:50:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 14:50:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 14:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfFri65bNMaLv+t+LWjixQ5ywT5lBesMdHAbV83Leup6Vwmx2FYSxc+XcWwHQar0o8sxXBxkB8xOewRqhwcFihRrtqt9ks99BnQosRVz+igPk09i6INdjKsyYpBXtEK2a3iArTXI0RxYTC3HFPx4RKh+kSdp0YuBxjGTY156GfIlWgNEL6HhOdoJOtSzF7+K2o8ffhP3zoc5C7H7o/RVnJP6jvd8LCoioFK7Qkg2Q0YYwHsiUOad1QHdhfg3SG79jNvNDyhvC7g1lD8qwgFYyvKKEke+fQHeB5UuJjilmMM8Tf+9iLgxhAFy9gzU/wNbmzg0PinWNmP6eHQOMwDHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MTWKipwzxotIvD1sroKR58fwumzSEp6Xkp0WpKyfsU=;
 b=LPDbZH3nAMfqDhwKAuulZDekqW17JBTUUGjw+MgaJvc6uyK5PTnT0ghQgU5IjBj6RRaGQvIu0UT0QQ9hLwF/hpBYzlUlBCneQCHQ59b4rI07YeGmRMQ+hE15vmkp+8fZzstTMQ73+UtXXBy+xAYITzyTrAcYd/dJ2bC7bnqZluMkk3A2UkqNXW2t0SQmgKMIu9zZ3LAvcjnlIx3bpO+ElL180DdqDp4kUVgsqsLCvef4Z19cPpErN6Q97IyOQzYAcGeDtHeJNwXwrKZ0fT33EJiaUcWRsvZqbaFbmXLPybFY7wSX7PlYfSNkdEmhPA3baI7GJCN2Owip7tc+21O6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 21:50:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 21:50:02 +0000
Date: Wed, 11 Jun 2025 16:49:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Message-ID: <mgjvnmzve36ippij5wgjc37iskd5zeughb6vaceatuf55md7eq@qdtfddo5bztv>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611210553.3756700-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: ba3d9b56-44df-4af3-f436-08dda931eb6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OhNUOxag4wPDqRbOFt4SIi4GzIXO/HgNf2UzAELiBAl3nazpYNkGXESKdNTO?=
 =?us-ascii?Q?gGJtrMM6bOwH/MAuxrLjgbbxklec37y/c1ym2G1HcLqL5wmW5vHPowW512ai?=
 =?us-ascii?Q?Un/ofyRr+uY64j8F6Cf2EiGfd9RXvmMqCJra09nh07DSD/sSGgBE6lMJSmQ5?=
 =?us-ascii?Q?pbRWeyow/uQrjv2tdYW2IY4p094Zq/L84gmby7lbaGeup8r+exhm9LWWfoZ7?=
 =?us-ascii?Q?HKlYn685bXmJCB+3VIFNWiVyN9dOXQqwl1xuf+ggfDm4bUminYOdMguc00H/?=
 =?us-ascii?Q?SKn6b4ceKyusq9cZVBTlSm6SR53/D4S5TKq25sJI5ZtgkqJzNxgM6WlEpJDx?=
 =?us-ascii?Q?YyetRtbGR80Cf1MYMxzLsr6WJuzMinHG2+aekJj7I0TmTP1k/0ek0n1R9RLs?=
 =?us-ascii?Q?EiNd+zONiF3Qn/ECGMTQYMDMMEgrNgfcp/IChiN1Do2MnuxpLXEHO+2I1ng8?=
 =?us-ascii?Q?sEYSNyFl5uNoZ/eC0oMkmPxv67JWLHrAU+e2hjwW+mKR4+E1hdL/Ubcj9wvA?=
 =?us-ascii?Q?mC9sPZ4ZqIGLG8IMyNJo7bWlmSOIIUa9PsnQ6M4JEWX0fZtfdax47wJ3jJFD?=
 =?us-ascii?Q?ha1s/AJfGP4cRu8BPs40f443zsiZ9GHMFUbBNC4GTCJQ9OWeKzefSNuOyHNP?=
 =?us-ascii?Q?aHKeg46UWt2TyEt2YL8/Rd/EEVOyzPCyxQfle0Zlpi6ufad4ZNEUP2DSe4I2?=
 =?us-ascii?Q?EAJJTucrcg6eUtBojrvuvqyHKdFqDfok+2MY+OR4K5Kkwt2KxVRJspT4FOSO?=
 =?us-ascii?Q?NVXXXT39jsyGw1DhQT3ydxaXtRtfio6EDwnsPpFU1R0ERUUm2dIcOG47yH0l?=
 =?us-ascii?Q?61o2nugUZeTvYVQWUcy3CVdJWF3a3m2/LkW0VZyOtgUkH+aw1D24osC5lV8y?=
 =?us-ascii?Q?5NBUIdHXOyM0QGlxl973lBIn+MH+Xufvqvi4dZE4UpCGaEzOTXwGXRelqCbo?=
 =?us-ascii?Q?RPiw50nv3vJFkSSpyfaG4+Zl4XDHfBg4HuGQkKJhwlehwy3IcIevBaHIy+Wb?=
 =?us-ascii?Q?kuIVA8q48y+FVGZ1gEDNP/e3edq1IB9mEetH1BsSjMpiyghOelZnxiLHHrY4?=
 =?us-ascii?Q?EA4akuzqLXBIf6Iq3dfaPyWi07yHQpl66wWclAwU/20E4lIIi7v0DVK39d3c?=
 =?us-ascii?Q?mVKPn5ACRNUIPQM1UWgxt6ZAMvPQKavZQLtvYljQ/1AWutkbLsXJQn+/EADI?=
 =?us-ascii?Q?ZPnUvv7Jrf96CTQQaWOWrvkvJoGE+FKNFR1E7LFt36fgMQX92IDNmY31plOQ?=
 =?us-ascii?Q?IIVlONlBHvOFutoT9dWNzhNVb2QHcW1b9F3LZc4bNgctjVdE8pshOjFoh8Wo?=
 =?us-ascii?Q?ffdokMWQ+Mefe81NSU414YryFatAIox9U7HN6iKLSSIALZd0cTLLjhrBbQxQ?=
 =?us-ascii?Q?oXbMMAQ2GOQOdO0LUomNhQetUU4MJYTJr3zUwurvT/b49gQX4Gy2EPoybwe3?=
 =?us-ascii?Q?u4ffyRWpHxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDcqDThtywaoiwG7G+GzVGhLnuaWF0Ux2IYA7RcUnZfwUcQdA9ASgo/xG9P1?=
 =?us-ascii?Q?N6a57hLnlKL0sJaLMNIKUjnj6SLoX/JmxXSp1or1CBTH1jzYkgR+IVLEG2ef?=
 =?us-ascii?Q?ehqB7a+YcnULwBJ8ooJDu9dDuNHM+nqUBRPR/9T+0/38Wyw1tP0fmWhMaQVU?=
 =?us-ascii?Q?4pnqw02RYnG3LNrD0gz2boNQybYZBvqFj0cNlKF/VpuQwwshNeYv7tpsnqSy?=
 =?us-ascii?Q?f4gSbVMAAEbpC8E/L7xC+kscoulGkj98R1YtEo53jI1rlu3wV3tx3i1hcPia?=
 =?us-ascii?Q?urQw7Lghvb/3PhBnCvs/ykVR5wf+iqku4iYC9aeWP2UlLgw/vphzes0E7oOV?=
 =?us-ascii?Q?5TCrLBaRmDpn415GIETWZJwDu/qlgHXmYnNRzMOer7aM7p9BHaoPYMqF4MA9?=
 =?us-ascii?Q?YsfYkN20mkLn4Mp07Hu9zjTTfik+UPhaS3vnKM9xThUyrAa1deScjN3SupY/?=
 =?us-ascii?Q?uzvu30snxxAKb2Ul0wN0KKTOhOmp/SxqbjibjJfTqEq6YTrSvb+W5M/HJzsy?=
 =?us-ascii?Q?19QKUzlJN5lbZ9uejhU4Nk4V5kjTb9HV96q3EM3epjy/9DUcpJsAsBT3I3wf?=
 =?us-ascii?Q?SdWic5qT4VYf27FKU0ygD6aoq8NOi1kVhSWvai/kZt63qCKaSN0HrwvHlisN?=
 =?us-ascii?Q?f2c2h6agWDl3Oejn34NdULTwZaOpUUj4CDLknbc935hxhI9U6kVQW0/9Y9RC?=
 =?us-ascii?Q?9vKkc+MddTekIBUpZveqALXWB7KL90D91/h18vZwuVEpjecpI5cioaG6cOg6?=
 =?us-ascii?Q?kfnwCsF1+voA6pFuFitg8W/UUrIfSDFGh8L7Mq84lK0ooqLF9kmPRWEseWxo?=
 =?us-ascii?Q?wEVTO5J37NpGcSXRWCkkwUuKm5S27nND2daHp5S6kq0xTORnQa1jj7SfAVte?=
 =?us-ascii?Q?//tPcCsWcJXVlZPSy9fJsAKxUC6k3GXLVe2yM6WFYLNVtUKPcJcrjBR+5L7n?=
 =?us-ascii?Q?RxxHOPwqBvmrfILuRfzIun31KRX9bCB3GnY0ZyD8A+HzOhDN4n98d0e/l6VH?=
 =?us-ascii?Q?sSeAf2cH5UajRUG3uKWmXY55VeY47tEbfhQqkNROUqQvCZF2U6uz9KJyRfqh?=
 =?us-ascii?Q?Vu8btadIpfxN2V9ps7uIfG1LSqa2LmJpEw/vu7dvBsBvXGKiRkiSKsbSE+/u?=
 =?us-ascii?Q?VOcsi5+zLJkT61nkgYW/Y6tuHG4ncbmrpMI6ONamSLnWfbUxbxQ+x2oemyZ9?=
 =?us-ascii?Q?fFOOTyefKj4n0SdweZPZGlrsQLzAOVH3b9sRJZZyYNK5xaNVTVqbiFJW53Dw?=
 =?us-ascii?Q?mfXsx49KI/ZWp/MjYF40bHYE0p+rG2u8lNWjzSLAuzyWAalqBizdHAx55M/C?=
 =?us-ascii?Q?/2qaUhD7ZP2lHQMRvO9ZfDLTaulRLDwG4UzBMBX+mb17SHqWJCMerHH1MwTV?=
 =?us-ascii?Q?nf+TA+ubuKzBRh7mt30GP+3zRpZzZlLp5/gqrxO2TXjiFaJAyqxYpE39NYQU?=
 =?us-ascii?Q?QaGxF797CcEVO0Ei3thPX4C5EcYyb+knntJoqwXYIQ6Z2KAMq/muKEfHU0QB?=
 =?us-ascii?Q?EWoQrnpPV7qatVccYfS/SrGdC+pKZmt+LFkhnxXfglZrPkqBCwBkmpzKe7AX?=
 =?us-ascii?Q?rDBes7sDz0fE44Ytw3lYl31axYzqYv4fbgEaH7nyxxQtcTKmN6nTYm+4JJ2X?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3d9b56-44df-4af3-f436-08dda931eb6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:50:02.6524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWwU3vDikj8lN5VztkyRlU1hG1oElJcig4HT2QBo/dBP/mftSyfNm34Lc/H97PE48menoCYJv3jNHurDhvJMLkHaERKnXyldin3iQhI72EU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

On Wed, Jun 11, 2025 at 02:05:53PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The GuC has an option to write log data via NPK. This is basically a
>magic IO address that GuC writes arbitrary data to and which can be
>logged by a suitable hardware logger. This can allow retrieval of the
>GuC log in hardware debug environments even when the system as a whole
>dies horribly.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
> drivers/gpu/drm/xe/xe_module.c | 4 ++++
> drivers/gpu/drm/xe/xe_module.h | 1 +
> 3 files changed, 9 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index e16d19b44bcc..9c0e3113f7d5 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -35,6 +35,7 @@
> #include "xe_guc_submit.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
>+#include "xe_module.h"
> #include "xe_platform_types.h"
> #include "xe_sriov.h"
> #include "xe_uc.h"
>@@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
> 	else
> 		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
>
>+	if (xe_modparam.guc_log_target)
>+		flags |= FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target);

is this supported across the board for all platforms and firmware
versions? Otherwise, what'd happen if you have and old igfx and you are
debugging a new dgfx? or vice-versa.

We should probably need to sanitize the user input here?

Lucas De Marchi

>+
> 	return flags;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 1c4dfafbcd0b..fc8c681819b9 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -21,6 +21,7 @@
> struct xe_modparam xe_modparam = {
> 	.probe_display = true,
> 	.guc_log_level = 3,
>+	.guc_log_target = 0,
> 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> #ifdef CONFIG_PCI_IOV
> 	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>@@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-res
> module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
> MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>
>+module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
>+MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
>+
> module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
> MODULE_PARM_DESC(guc_firmware_path,
> 		 "GuC firmware path to use instead of the default one");
>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>index 5a3bfea8b7b4..4d978f6f26b6 100644
>--- a/drivers/gpu/drm/xe/xe_module.h
>+++ b/drivers/gpu/drm/xe/xe_module.h
>@@ -14,6 +14,7 @@ struct xe_modparam {
> 	bool probe_display;
> 	u32 force_vram_bar_size;
> 	int guc_log_level;
>+	int guc_log_target;
> 	char *guc_firmware_path;
> 	char *huc_firmware_path;
> 	char *gsc_firmware_path;
>-- 
>2.49.0
>
