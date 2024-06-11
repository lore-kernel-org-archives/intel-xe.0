Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C0AC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253410E0D8;
	Tue, 11 Jun 2024 15:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGPiy7rm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D9610E0F2
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 15:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718118559; x=1749654559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X7t/v1IYRkldSR6baJLaV8medWRpWi/1e/jyv+4n/+o=;
 b=TGPiy7rmdoE42Lq4ibouUMnY+Tyg0BHEL8uUWZIvyfh1isnFVtcSLq/x
 HK+uGzloAjvjfWiz+xqJ0Pt9idHi88OgLvRYCW2UeQtQQVfuhcN85l/1U
 pbu52eQsqNf3tXGlMu1up+GZUWeu/LvnrU9pJ13riJZJggUMLrY/V4JGN
 RlpZr+jN3kC9GwKvZj1zG8Lj9EemZcrUGuX+Wuc6LO4FWt/EvQfawEy4m
 7of0JIlxdPCG+fcWQLCK0zyaUQ5Xe5lgito9Te8G5vnePdRcHNcr4NCwY
 BGVuqX3zBLI9dwveUewgDV/MQP6dzxlpUGeEwebljPNZRHoJFADKY4ewX A==;
X-CSE-ConnectionGUID: FHunm7V6Tk+TpNBoAlNkkQ==
X-CSE-MsgGUID: mhzql13aTwiTm+9KeFsqgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26252371"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26252371"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 08:09:18 -0700
X-CSE-ConnectionGUID: 3p5SToyeQk6SeCNdfkhFMw==
X-CSE-MsgGUID: 9CN0YdeSR9Wsfaa5UZKMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39395407"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 08:09:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 08:09:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 08:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfaaPO2hAMemHuhnqJqlIzwSW9a4UvdgTVgqDgiajBG+NQmqptqFRAyrEOba7FuWDHQX224snYLf2HG1b1fuVWxNrS52jzr1CskvxGPMQbzQJgOBEuIZqHtuiQTKJyOsikUUGAAWnm+EUR/zdXOAdz4aJY8yqTssAfyeS+Bhjfbz0LHRIsQCGLSpMdq7R+X6J6SJ/jlPFDeA/76TTXG6jAJvjututYlyiPY8EJI94s+DlME97Pm6JXLa9c792EVOdlbgFC8nkJ3xq7oEJJJ2F/kZvCHBF05TotjA8tdQ8eoPuQrgp0HHuVcsFmjAUY1obFnQTNMFtcV5yB0cbzQWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dcz1reH91d1gt8ugZKcscmcDVKG+kHtPEF9f3JNBgU=;
 b=b44+O2gPHQUcVaqrvT95K5UqeHWxfY25MyNTdJJbbUeiqJfnhy7hKk7ufEPajFAWv9fWDFqhA8qhUuSg35U93ytZHlqXBPcWbzu3mqq67VJ7bqr03peKs0K+S5Fr18fw8Twjp7Y3JjwxkRf4hOWtr/Lg0op6zZpmzYVBb5sz0Wqhh7QS/UqUMPSr9W1j5im5cSx3uVLMptPyT2D4bQhsrvcZdI9CkmBkcKFRG17tGWf+LAodQAoti+iNUxPdZvy2hST+FFiZgGCZBdEOJZb6BdseXCl4qAsR2G+obomrH2S5grXNhIDAVyB5WFX9QCmLgIyiHodOW2JR3KoHzLgsaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Tue, 11 Jun 2024 15:09:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 15:09:13 +0000
Date: Tue, 11 Jun 2024 10:09:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/xe: Prefer GT oriented messages in
 xe_force_wake.c
Message-ID: <vyf6kxffqx3ecssdgrzmxp3piulars6hbr7qhdrhpjs2yjqrrr@hvit3upq6qdv>
References: <20240611100757.1856-1-michal.wajdeczko@intel.com>
 <20240611100757.1856-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240611100757.1856-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0193.namprd04.prod.outlook.com
 (2603:10b6:303:86::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 3137d2a8-28d4-461c-130c-08dc8a28746d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b8ZXo6DTx3KllRVy7TKh7udI3ePCVduNwrggM0OwQLAr2Ffcz+70J6hrOZam?=
 =?us-ascii?Q?QWtHMXzaxkgtYCJIwJQmrc2avtUWWMIcHFz3+oY7ErCXLyd4EgPGjbOAcgAL?=
 =?us-ascii?Q?p61MiptDrOEpuLJtOoBBNS/Zc3SYepQ7Sz8EQueDHgyQPOxatXeypo9ruf6a?=
 =?us-ascii?Q?2546voZGTNJwdiN1D+sIQUwkixzOvkpbk7lygAZjy+7UD2dJVhZ99lax8SvO?=
 =?us-ascii?Q?8ZQ3w3PU9aP6PmTi65gORJOkKAT12bPtBR4jPpcVkVtAkl18UmAa3f+MA/bU?=
 =?us-ascii?Q?ws1KXTZ4VKf4hktpyIBbHEG/0iRw54Km5zMm4WGjLlhrplc6q4ujLQ446uKO?=
 =?us-ascii?Q?hWgy/ikKO7zsOAKgH7C/8n1NtH52Cl1NSZp6yc/Q+inTajGPkIpI+Xl/z8yG?=
 =?us-ascii?Q?coT3ff8vzE7gAgydKsUt0seTWOPnu2+rw5uDcNfGxvaWgpuia0R/vLVEov0B?=
 =?us-ascii?Q?ad8fycMuHojJHAG2c5JmQ9xkCNECIFVut59Ijnjug4RIVwKkAhAZH647EMbo?=
 =?us-ascii?Q?CunnynqGqlO/zjK0bJqSBu5KKMRf08QSQngucTsSN1rY6865XKc+E+SBI8jR?=
 =?us-ascii?Q?JoyGqTQX/zlxqxVAp3sYVkF9mJmW8TElENKndTYnk1iPjG8xIlUkjTkUtd10?=
 =?us-ascii?Q?kd67yooRUA6CqVNXIbkfCVUlgHLWV6xFYcH9iWZC/A/xsJpJm8SyjQ+THgdO?=
 =?us-ascii?Q?cMc2geyPUMoyJll7GIqvA6DLIJhXtsIHPwGIvuNKfVESR4j4AJK4OabQNLRQ?=
 =?us-ascii?Q?JwKdKto0gIoEUnzoBFCs0UeMEOhtOmizwFtovhjTlQRTglCbe+mB556cQKRN?=
 =?us-ascii?Q?EeGKU0AV90OgaR3g5NizVCBl+SF/kkzJhGHFi6SlOfrMT0hsKDXVwRBgLnWS?=
 =?us-ascii?Q?u3IpTzumI71pOf/3jkuecGPC+8S3rN+TB2FqHRxVODI0141adr9espoIbXTJ?=
 =?us-ascii?Q?Gx5AfT2EJbnyMytGaEFbTVTQiL8GQZUeLiL9SRfMqOM8h/Udvj3n+zlGd9ll?=
 =?us-ascii?Q?ltsLW7d8VCYjQcpBpjaKmtDt450ALS7iLXsXLkomyx7TTfVxf0xlDpZ21Jl9?=
 =?us-ascii?Q?g5tfurQI7nZ3QolWF4hC/74S+X1/r3usjg53kH2pQcAR+p/WPhdqodgFIBcT?=
 =?us-ascii?Q?+hx5iV16JFUBf5m212Hiwho7ezGILYVV72qWiJGGbkg/O0Ly7q7OYLuKlGC4?=
 =?us-ascii?Q?EvXGb1xEHWs/ZHF6lvndAJ+elhNXcEYXGFx6yDX4hMoORtLjzBPRgABW+vDB?=
 =?us-ascii?Q?FguAC/eflpJ65KxSazOEGoFkvmJBr8Dn3iYu7zSs6FTBPk4l36yjm4IVkJti?=
 =?us-ascii?Q?zNaFk4Fw5Vc6rgOgkHmBp5NP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQKCVG++GOMZB41nlNVc4wyW64yu8+tgk7HPZoBFl1foN77qIKoM96rB1U6p?=
 =?us-ascii?Q?P0uOnvT5JxlQs5JMgQdj85CGNzcPEwpzlZRHPmqEPiCKmQQukZMAWB2OoD3z?=
 =?us-ascii?Q?ZOfekqs7GVDl99jWSKnwWbo4KYLxEtzX/XFAREZAEQ79ImJZMXjYrabrXFpH?=
 =?us-ascii?Q?UgzRFoHVIGYNt6PpPRZx7vQt2ZRFkUfHXVL4QatkwEzGwz95zz7UN2QcPAjr?=
 =?us-ascii?Q?55TJBO791mHpd4WDDmDZNmghCqLPMQGA0FOZ0pb7Yw5Y9XutXiHB25eTRlIh?=
 =?us-ascii?Q?/rCD67yazb6O/YAJV5SFTaDMkfVHu4cI7Fxc1+4SL1GapP98nYz8JPEY/y72?=
 =?us-ascii?Q?WrzhYUjjJYGwo2Vj+CLrnuiZOqO9cAyF1tE9/qrtXOfmnHOREd7UwMewn/Cq?=
 =?us-ascii?Q?3Y9G06nf4FcS2ZsK+CF0iNGpTUfdMH+1aD4svbfbv6bv/UQ9oqR0OJzmRsMy?=
 =?us-ascii?Q?ZeVCsNLbWml2RRtbP4RaP2HkkbVmTNgBPXUi8AFOZixBDQCnWAx/uCHJ9vaw?=
 =?us-ascii?Q?VT7IugL7JBr+Utdlf/c0x4F3LhfYyJ/9ynIPldmxiJ+U8eezdNvhnH2APgcC?=
 =?us-ascii?Q?NExTSVJRRqFRyYzTnx2zIVjvo/4YxD02utAm8eP9m95kLRKaiBO3AYccZY4b?=
 =?us-ascii?Q?tiPbzLl2Ju8me/6F4EjoIJ4D+jSH+B/Qp+LEKsPZtTtCzS3GWas34w3AugPF?=
 =?us-ascii?Q?kcUPRbtD1hXt/HxfR7PUZe3wB7RplgC8joUnNIi3SX9ccQbetwfpFv50h5Z3?=
 =?us-ascii?Q?yYP1MRA/ah4JSDehL5h40kE4PHJSOrvhK/S/ur9Y9snNYPKYwGik7fC+Nlq7?=
 =?us-ascii?Q?Ljyq8nisvHCe/OjFiIjmyJPncE3WkVjG/+T4FgrfwyMn6+4XKcUULYp0/bah?=
 =?us-ascii?Q?rJM0lihJhLcwNvl5MO3QSa9aUCx5W76q9MwG+YoVwOlDVBc8VK86Tkvi5Wwb?=
 =?us-ascii?Q?j8Sn6X2GoStIUQfAvx2BJlgEDknTUwdUVHZO1EOIBu3HYG93Rrst2G8naGgp?=
 =?us-ascii?Q?jgrUKoKre0bVNPlkSt35JPDpdg8P8Vbqnm9IFK1TRmK3q6SAHzRMeI9t5M2R?=
 =?us-ascii?Q?pL6yJGqQnAbHOU8rLQNxsuI36HgtyPjeEsGAjW0HRRwz1PvNlA41M024hmzp?=
 =?us-ascii?Q?64pt4ifNdDGF8W0dRmZQTuLD4b8KiBVkBSP9zAeW1g2/QhFdLAPahcJemWZm?=
 =?us-ascii?Q?/27jbgum/4TW+ZzRf+q2RolVHSTBqP4RMy587z3AvrzrjofXFmPRBVncBzSA?=
 =?us-ascii?Q?IClpnZ5itUmJwvU5rN/LLxcFiUIdQch3Pa0aWXhm4TEs/xu39FlNWPJGFXVJ?=
 =?us-ascii?Q?ip9lwjzvMsPrS6uglH/4PsY9TR7MM+/acZdqs99e74EyHAsdQZloP3ByHmxr?=
 =?us-ascii?Q?qgc8OzhQK/7DGokjC8zayN++wsA0ZNU+FqZ8q1BN14Ug4InzDFC3S2HOjMBA?=
 =?us-ascii?Q?ywXF+h/ZZPACsyX9474JFsm5NlEXuyL3sY3tusfKs93kwm8qwmBFb90l67Cs?=
 =?us-ascii?Q?36sALbgb1BpSWRU1P3ONx7opfJFFAV4jd3TSHnRWr1df7ZACjSFK6nk3NEw6?=
 =?us-ascii?Q?s0XPKdckaDdkjqLXHt2Gp3Oa/Rbu+31f6ZshqU2z+zl/3cqf6OR2+e6ON0O7?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3137d2a8-28d4-461c-130c-08dc8a28746d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 15:09:13.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyUm1x/3hrhkMxbzJkPg4/l6k5iqoBo58znZJwOBjclfPKz/FjC5fwIVcz0MMK3q/lDu+sC6DIihYctnfXQOJhOYtvuA7uqLBTuh9WvYv0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
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

On Tue, Jun 11, 2024 at 12:07:54PM GMT, Michal Wajdeczko wrote:
>If possible, we should prefer xe_gt_notice() over drm_notice().
>While at it, undo line split of fw_to_gt() function signature.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++--------------
> 1 file changed, 6 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>index b2d385daff4b..2497f0f65aa0 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.c
>+++ b/drivers/gpu/drm/xe/xe_force_wake.c
>@@ -10,22 +10,16 @@
> #include "regs/xe_gt_regs.h"
> #include "regs/xe_reg_defs.h"
> #include "xe_gt.h"
>+#include "xe_gt_printk.h"
> #include "xe_mmio.h"
>
> #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>
>-static struct xe_gt *
>-fw_to_gt(struct xe_force_wake *fw)
>+static struct xe_gt *fw_to_gt(struct xe_force_wake *fw)

unrelated change... but it doesn't seem we need this helper neither.
It should be perfect fine to just use fw->gt.

So I'd remove this hunk and in another patch remove the calls to fw_to_gt().

Lucas De Marchi
