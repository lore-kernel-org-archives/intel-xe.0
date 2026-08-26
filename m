Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54EDC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5077610EDB9;
	Wed, 26 Aug 2026 19:15:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fF0m+Ih7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839A710EDB9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787771707; x=1819307707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZxFtuWKB3NzVxhDia2PMNnhvRJy0OLQvBr4HXQfOUmY=;
 b=fF0m+Ih7+mMiwX2bwW6POMkAFl6qrm6/bYtPY9RMJkfYVL/18r6WE47A
 tx2NPcEObkWm/zwZMCzbTRKg+SM6Tw4G55IwYBHOtfVAHSvA6Z87QHtN/
 0K3PkjpCGhviQfx+jJDg8k/XHLE/hWkwC9m+1Kc5EWS8za1dCGDg/pyFW
 h1vH6xq9KSW5vtBlQjUdlwzaW+imfzmm8b5cioBpomyLg6lbJbjrlijzd
 xWqn7zoZ1k2X39gWh7BQdJO3/6UCRWJ+hWUsKGFQrZVirn3YXZujlvvjh
 EcTBQ7Amxim9M06khYGYUpd3611vmtYLYESsyFSHNlNmmls0SjRzvj5Y7 A==;
X-CSE-ConnectionGUID: gXlbLX9ZRHqTqc0utu3Dfw==
X-CSE-MsgGUID: o6UXb4/lS1CghqwtuNRKBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87393611"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="87393611"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:15:07 -0700
X-CSE-ConnectionGUID: Jt71FfnyQPeMxSo/Y9NvrA==
X-CSE-MsgGUID: bxfYRpCfRD61gsxkwigncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="267080427"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:15:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:15:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:15:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdGPYVs6kJtBD7RK0WIayoIQQ6s6/90wdCzXrmHRPm/PBkLQMmrtIVFM0mUHW91OtKfAKM4tHTSfsrH6DiHxWzO1bPnU7p+kWlq0jDJa2NIixxpzHHKfymtBVXBD+WMtjKbjwh8UgChtdZYLF5lA8Abc6Rnuv1NeVQjj2TZAiMCyvFLeTGiZVIJnCfVpJ0rtYm4NAnEHB1Bh9K5WVV7fxMzSUHafY5e6I8QdbZvRUwhxlHOAN3Hg6ewdLThi5shUdl3jFJEj8u1JRRtlQjWU5qbfnG9qWDXdNhNKgtE2O7Hk82PmaMK7Z4gIJLMv2MMXdkFH1t0VBYAmQKhYi2YHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFb06NX+gF8in3ML9I/DssA3T10W/dTtGoI0sMCgLJA=;
 b=xUyfEIoX91+FdC85eqGQq57gkJFHTjZDOUpgONdBAjW2LkECPeTmxRdqW9zv5k5uYjM74ivsXSWIA9iGVBBbU6jpFOXlFt+5lf2nEPYZLNk/V1tu71h8Gi3uUPIuIyi0QZaFaSciNqQCqwENLw9/kFqMA2lY1kEVE+JhHxzcnuzjTHlFmt0dthTjOFvld48NQs9e9yyMgw4RhOKvr/ZMR5ysxxT35HpqkXSlnIbBHi2iUcFcBF7Q3A4p2ebJXpVGrQuYW5yJVoW0zHykB8UzNnd1mumbHKeGoP/CwHpqgLu6lukXQj5EjkHQF0848fo4vwOSOj/qbYOnHSPtghKHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CH3PR11MB7895.namprd11.prod.outlook.com (2603:10b6:610:12f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 19:15:04 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 19:15:03 +0000
Date: Wed, 26 Aug 2026 12:15:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Message-ID: <ao87NOu0N7v81iL_@nvishwa1-desk>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CH3PR11MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6984d3ba-e9ad-495b-33bb-08df03a65513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: EII0ThHqPY5y2GUeCANazCKlcqwS1u1nCPsH1cfr8br8pFZciXcOW1tvIL0rmEVEEsjI1MxreIM4V6+x7aWoVp9ZBjOQI3T0AxjsAVQeLIg6HZ0c+yYouj75gdumbi4jfHXWijDgBd9sRs4+XtyQQ4xm9PYcMfAP0fR/TmR1E9U5xylBAUJn3PtLa5bR0TBEX24oxYBIHVDdg2ei4R8k8wzrhDP4SDrLSUxEh/2jEr9wDb8xWXegmcSGCzatdZbU7lnu10QdJUysDMz8sBtc98mBLwFsNRKSU1YJur6yZjDZJaq7Txup6Bs8exJFuUqwi/YoU5o6D8FDbDHDiNI6gOf07ffwTgLeC83teVQ/KSDkNuqGEoSWlXk5PenbV0JmqWN0WfO8hrwaSFT6RuE9LO9SkeuX4OHLyYHP+C2VdCb3gCSJwc1AD9y770d5S7Wc2UD0plQh882Sh0ui9Hpzx8IP9xxJ1pxgEAHN064nN4I3CAbB5fBqChZKrkEUfVcLsKFD0gC7sc5v/KLfoQp3mGQdRtBEkRW0LCZZsVzfI/JaWYxphLpLZiA4db6QNDVqSfRDo2GpruINF8/EWCpPaKXxKG6aGf9uTStsHGSVVFFPyUwIzAapVr/fw2r/easMFR/G2ire3twrfBpTqKeua0tLXHImw54/Ljd2nddUNTM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IipsO0TVwHBEnO7PDbFk0dgD5MgjHyI54+6VTk5tmHAOa2WsJ7EHz/DuT05U?=
 =?us-ascii?Q?kdEDjxRZz9IUK/uKbQjjv94tWnTe3iEmRKuXekoW2rkgLHZRv/rnWIgqc6vO?=
 =?us-ascii?Q?8XkmeUVdItKVU3gwPkwnkOsBjLprVs1DwyGOo+dkuD4481ov2jfKWr2xql8G?=
 =?us-ascii?Q?0EZTypBpkqR6oNUEMZLHy+eOH5+wyUB4ug4puaIq7U6YQKLOi1U886Kotcda?=
 =?us-ascii?Q?yfwy8sHezMY3jm/0GGSZbwCgBXsUNxjsUj5ej1AKEdXJ+dNEICJb9AQ9rX2d?=
 =?us-ascii?Q?qEopnA8JFRuN1B6hkgsBf7A3tBS3gVgyr65D6rhuW3V+nXFFFQcgCBe1kK1o?=
 =?us-ascii?Q?GCM0it7de/JWWxKxOfBk6cqinXNAWv6gL4Lrln0Nw7SfF/eXGTPY32U9aSgN?=
 =?us-ascii?Q?rOgIWHwrenpJkSiCw+2E6ZhidVTgFB0UtKcIG/BJTdWOeJiZTu+GbE9BxbDn?=
 =?us-ascii?Q?XKvlhOwK+XiuHMaSVAd269nTRc2JrRKy7mVi4QHjgWvIvoCwPUQASAeOOr7C?=
 =?us-ascii?Q?eKIsfThIzFM9pINs8WufmTVSczAENF4jaiIAfMWL0Egn3MNSVTlnstKSmjWZ?=
 =?us-ascii?Q?+8YPQp+gefHjMyOvtD65c3E6/pvKLj+EkDkDiPEut6i2czVRhBDqMrj5PIto?=
 =?us-ascii?Q?X7wIpYo5C2rbS+FNH9say/WWh7Qes16Y/NqFEEtNTRsQavP9MCv8YgQ1o/2+?=
 =?us-ascii?Q?DSnJobwc+lrnc+U88AbdcUrGatT8UnO2fuFGyeJr5LjOaw9WQWfORsAK8FNL?=
 =?us-ascii?Q?JS2pXjl5svqjZc8VPdOK967X3Z5dFJZBR3nACs/cIEZP9JASjaXdxFqS9itx?=
 =?us-ascii?Q?otiYLjzUcodPwAW7tJ5Oj63YZq1gnEZ87I1/bD9DRc4c3rV82Q/9tHJtJvFj?=
 =?us-ascii?Q?IGUwCzCHVc3XYKxEyUwZUBtK/OYDcYTjVMiaWfHMFL+0vN7r3reb6VponWUu?=
 =?us-ascii?Q?wIJRSJSnUc003SB9j5RRzj+Z6q01UeVCquQ4XPAZophwsdh8M/I7oB7IWPhq?=
 =?us-ascii?Q?5r2fGox02gJRUF5Yy/UW8+nQ8HIfsCnOVfKAmNjd66/UjqDmQJC5g+i/0cZW?=
 =?us-ascii?Q?o+XdHMbkvuXJcwRh0vZ8MXI7GgQmBxB3lozCbJX2FCNHPW6ra8M51AROWv2e?=
 =?us-ascii?Q?mdYBkqRuez7yZddPj44LOE+k5fncM76v+aDdDV9aeknM8+EVDkn8o33e4s6q?=
 =?us-ascii?Q?5SVckyRjLoyZbv8UBJQ7xtLQpPQq9VqhHEdsxGzLMzIIk4/LMOw1k6k/Hr8s?=
 =?us-ascii?Q?LoiCvYnb7aoyolGmmSzu/v+uSqFbPFgoRloqam0g444nmqsnQzsWYtitrTbz?=
 =?us-ascii?Q?nhRwxQtfsVAV/Z4omaKsbVtM4xprxqQI499+iQBHWNZmUL1HxTuRuFt5YsDg?=
 =?us-ascii?Q?7vuOxNj4ltgccvLaIIUmoCGV4JASkzV5KGJ9GgMYe1oQ5TGSxil6v/r6kGWD?=
 =?us-ascii?Q?L2+fGv7ofJH13neiIhT9ssuhvD7j55Q302DWtzJFt8VepXukgPzy0z3wzjZy?=
 =?us-ascii?Q?pxDzy7rXnVdTiUZ/4Bx7ZsG+/kYNWnF17ZvzqwNXLRUWVPmaY2hg/0aKnCrT?=
 =?us-ascii?Q?/FnIYEPoWYqlqEfVy4jNVwRe0kAsxq/wG3fHmrJUHU25PO1aMdKQckf6HCc/?=
 =?us-ascii?Q?AMkC5X4lkEKmnG032e+MeVNbHiQYuCitpwcWXQS7cShfeefyf8zj4GBLLKUK?=
 =?us-ascii?Q?4uwUu+Ygc/Z/hR4wJlRm870STaNzWz2A0ywo7ziLbfgNuni9n1Uomvw0Nks9?=
 =?us-ascii?Q?lG3uy2INxC00y5OZRaTw5UZejsDhvAi+WgHO+3USeD1ktkYvpVVf?=
X-Exchange-RoutingPolicyChecked: TKetWAMfnuizaTMXBJBg7lE5T096vAyaufPzBci0dlu2LUcx4+WWTXFwLhi9ZIOp34j35JM1C1Xq121IbBOvJV2ocHHr/W3CG6B2TP/p/7YD1dON75X/enSZYEnON2psyYVlqyX9kapZP46lXb3iywfsg5/S/0q6w+qQUknCiTBhWmfV79YlFU2sQ1HY/aTMpV46+vP8gn4op/45hTsK2YGcs7fYHiSikYKPg1bDjGrO561tFNQxGhtBB0BjP3LvbCqKsCRaYJISsKcBa7mSghx55lJCpp6GU5roqGCaRzQn+aVL6XIY7JzU7KLQDlZ40ss4bLUS8Fm8ns3o7LRNZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6984d3ba-e9ad-495b-33bb-08df03a65513
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:15:03.8601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Guegj4sfeQpnfdqtordi0lzobMnxiJcJ+Cx/Ee6UvyRh75TJzeE/dicHK/B8NWa1UVfEmnH43Aq6vkzqppE5kqe4rgaP869YuJpd3wjPOnxiBF857ZDb1TChvjJmUh1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7895
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

On Wed, Aug 26, 2026 at 04:55:31PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>On multi-queue platforms an engine can retain a stale GGTT TLB entry
>for a range that has since been unmapped and recycled. When unmapped
>GGTT entries resolve to the scratch page, such a stale access lands on
>scratch silently instead of faulting, masking the error.
>
>On multi-queue platforms, skip allocating the GGTT scratch page so
>cleared and unmapped ranges hold PTE=0. The whole GGTT then
>consistently faults on unmapped access for the entire boot; other
>platforms keep the scratch page and are unaffected.
>
>v2:
>- Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
>v3:
>- Drop scratch entirely instead of toggling per-unmap (Matt Brost)
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 39 ++++++++++++++++++++++--------------
> drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
> 2 files changed, 37 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 8ec23862477f..bd65100283e3 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -20,6 +20,7 @@
> #include "regs/xe_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
>+#include "xe_gt.h"
> #include "xe_gt_printk.h"
> #include "xe_gt_types.h"
> #include "xe_map.h"
>@@ -533,27 +534,35 @@ void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate)
> int xe_ggtt_init(struct xe_ggtt *ggtt)
> {
> 	struct xe_device *xe = tile_to_xe(ggtt->tile);
>-	unsigned int flags;
> 	int err;
>
> 	/*
>-	 * So we don't need to worry about 64K GGTT layout when dealing with
>-	 * scratch entries, rather keep the scratch page in system memory on
>-	 * platforms where 64K pages are needed for VRAM.
>+	 * Multi-queue platforms leave unmapped GGTT faulting (no scratch) so a
>+	 * stale engine TLB entry can't silently resolve to the scratch page.
> 	 */

NIT...Comment sounds bit misleading, propbably good to reword.
May be, "For multi-queue platforms..."

LGTM,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>-	flags = 0;
>-	if (ggtt->flags & XE_GGTT_FLAGS_64K)
>-		flags |= XE_BO_FLAG_SYSTEM;
>-	else
>-		flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
>+	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
>+		unsigned int flags = 0;
>+
>+		/*
>+		 * So we don't need to worry about 64K GGTT layout when dealing
>+		 * with scratch entries, rather keep the scratch page in system
>+		 * memory on platforms where 64K pages are needed for VRAM.
>+		 */
>+		if (ggtt->flags & XE_GGTT_FLAGS_64K)
>+			flags |= XE_BO_FLAG_SYSTEM;
>+		else
>+			flags |= XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
>
>-	ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile, XE_PAGE_SIZE, flags);
>-	if (IS_ERR(ggtt->scratch)) {
>-		err = PTR_ERR(ggtt->scratch);
>-		goto err;
>-	}
>+		ggtt->scratch = xe_managed_bo_create_pin_map(xe, ggtt->tile,
>+							     XE_PAGE_SIZE, flags);
>+		if (IS_ERR(ggtt->scratch)) {
>+			err = PTR_ERR(ggtt->scratch);
>+			goto err;
>+		}
>
>-	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt->scratch));
>+		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
>+			      xe_bo_size(ggtt->scratch));
>+	}
>
> 	xe_ggtt_initial_clear(ggtt);
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 65a4655b0994..92d934d50244 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
> 	return gt->info.multi_queue_engine_class_mask & BIT(class);
> }
>
>+/**
>+ * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
>+ * any engine class.
>+ *
>+ * @gt: the GT object (may be NULL)
>+ *
>+ * Return: true if any engine class on @gt supports multi queue, else false
>+ */
>+static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
>+{
>+	return gt && gt->info.multi_queue_engine_class_mask;
>+}
>+
> #endif
>-- 
>2.46.0
>
