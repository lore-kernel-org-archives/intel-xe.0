Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56386C44527
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 10:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008D10E88F;
	Mon, 20 Jul 2026 10:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SK63dIsB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2E810E88F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784544822; x=1816080822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+9eu8TuZXwvx+iAJcR+TdfJZjgIroGWzq1tLgODAy/4=;
 b=SK63dIsB9hffHKJNlQvuU/OJNYsP7ihIKtW25jtKAZxD5gjyAzl5TgHJ
 JBw2ISCrYjH2Ftmq6W93533fYPl5xMdukPOhl9JJffnbZf2KDLCrTrfcJ
 x5C/bKXXnSQ82OQrZ63NpOX0yhw1s8uEWDiMm2wg5dyya5AoDipYoU6e0
 PURM5mE387beirusw1WbJ1J1FHSXU16uTnfBRGwKt4GtiBW3op2nXq2VO
 z3pnML81ctcbO5KrxknQa8W/CAEc7cc0QMH7AR+XGeYLHtAEjHbPrfcye
 fZDrdjajkF0QG3Zk8450D1xnUEMZhdP7NTbWW/+g1WcLvz8AJ5jafgZvj w==;
X-CSE-ConnectionGUID: qYDjCRt+Q7SzC5bnGfM95Q==
X-CSE-MsgGUID: vP0Sdy1ATc++6zA6J7XvWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85323458"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85323458"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:53:42 -0700
X-CSE-ConnectionGUID: PmZKl+iHTr+DdEheNQXg8g==
X-CSE-MsgGUID: ST8RjsOASrqf1DmfHbSzAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="256847944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 03:53:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:53:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 03:53:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 03:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ff6r01v2xY5/KsoYXoM76nxBRRRwArEgUHroce25AzlM9tGSZcjtpGvbndVDtQs2akn2pYQuCcUz0BOVMQmeY6DcE1wW/m2UcApL0McvWuQBEotA4V640gqcL9GgYUpyeXz7fayt5pEBhWG5v4dB5jawRhYlr8HEKxye/HtKzqHRHGBVkpTqEpfBgUoQw6tFdD8NneZeEbYorJpaG/FTNhGQomHmijqPvBZcKEW96BrZBv9qGoqZkEvoZe0mesdJp28EKK+LcId9eptN9eatFrFS4lrdVvzimaCoEzZfVR+zYowiKZwuzUep6n1AvKZCwLDgxB/3U+OtoLBQaHjykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ0ZJrTRBkfVGTgAynPHI4QbIgGkzYiMddJ3Ttzgbes=;
 b=IAriutp8UX/dU7WNH9bzPCjxtAuUwR6JdHXxQk8IZ4KIrUjKogM63KIqCTBcu7rpFfmlTJ4FagbK6AoFGDYo3TYU5kC7KaeQi6+JlozKqgdRIHG37/mc0nfa9Oy8gX9rz3gMxiuNp4WNnmaSdVM36uU3H0TQH8qt1OLvccKcapZ2/0jJz75eYuPgTpY0D3SYNiKCV8TopUyY1KU0OK+A0ESg2dsq6HON7uRj6fcBOqq7yB/EMA/mvtTwsJ16T7cSNgfghWXCEH6bwtAYTMb6R0KReOd8+rFmJ8kZoWw20LSMuIngLeTqWoEV3LrYFkc35jbjL3STduc/g4mOUXcQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 10:53:33 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 10:53:33 +0000
Date: Mon, 20 Jul 2026 06:53:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe: Add debugfs for IA/GT bias
Message-ID: <al3-Kf5iZD1dNR0w@intel.com>
References: <20260715235824.116991-1-vinay.belgaumkar@intel.com>
 <20260715235824.116991-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260715235824.116991-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:a03:338::25) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: bb30e6be-47fb-4893-a40d-08dee64d2405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: UKKIAmnz3Y/XV1imi2KP+cHHjNv6wRlQ1tkzEYUAtKQhz8bA2jjDJJ/CQ4j/CXeqoghfuHpLEUJ95vfZmm3gXm4QBwQrYMpYfLG+mg5uoy3pBtA9XEBIDbsaN0C/GRRMDAQrDb/ecyvTHB98KPIpqcEWVOnl2yxgjZ1SHUjUxtN4UXIV6yr0Wb/ebL5Yvubg/GDBi7wo6UQU+B8gQ1wytRwPk/jCB/JMbtCrZoTKF5XPZnKKEpyqqDd4L6QP5NvNWTx5+AsObrUzwtf6IQEKLAo8Hda9vHfrYmItmdvfZNQetZLszBRJmcWHUzlw6HiRNBsqRaoRCsBXOkT67+VpRAycTtnwGT+7YvWWxohRSK/NiKp/rTpMxh5ahEAOSCHuArshLtGB++In1I0Eui4H3noT0xENnxPOwxpuPQwyshHfn53xjwpjQMUqZLmWl7tbhhn4rY2MZm+M/7Aw1WQl7xqGg47aaNiQC6fA8y/WVhdiCkT6uefpxg7GY03TffhnjTKbEuZGaNHWkHOlJC4PQExtmwrUs3ZuH44pMc7dmCXAJ6w7S0+24nHYUx6049P0SNWZwQOE3jTLSky2REoY7B9kBM8O7SiCpA2yp6dT5oPiAnGmkSI5lw3jGJ7XtU+xP39sckFm426Nr9OsS4FnXF9XKcCoSa0UFkLyTnvgoB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e0LQkR0Cs1IYBAtvzab9srbNbO1p9+dYBGbooIbD/OUjbpvgz0GMf0fazOkO?=
 =?us-ascii?Q?0l+SMh/tzX/hm3GCiyQAXqOr5xs7PQWwMogcW16vfOZBRiJF474tec/iOVJX?=
 =?us-ascii?Q?Cdu5mxpiTZIGl1AQQ2+ff9IVS7AdqubCjxqBcz27dphs7W5gS1LqJk73o9HT?=
 =?us-ascii?Q?/wCdq5u7WYNE1UnDmK5I4HlRDTb0+ZuwayL2f5epfcQ05VOZtSChOWXmNGAP?=
 =?us-ascii?Q?z6RUqDCGf1HjmBaW8eXGLK7yhBfM3dnVDBFD8GbmaUL0BNyLl68trm2+n5Eq?=
 =?us-ascii?Q?tplWLogJRafRwEQpLMFc3iQfQBH+f1olIkY4fYTZZ2njYyP6HsHcWBQaR6bU?=
 =?us-ascii?Q?D45kks59uV95X4twYyY/D53WHRubVLWEcghLzCvmVuDcMXYuKGpBv1a1mFye?=
 =?us-ascii?Q?p0w64UdJG2Xxz0Q8iARLFmDtWZqaYNE8ifgVUw9y5PdpjiOzxzimqebTE6MP?=
 =?us-ascii?Q?yO5UhpM3ZjTwIMiFdXcwMaoOPruBFwuc415RGFqbWxT4gNkX+AoP2PQJW6HN?=
 =?us-ascii?Q?jhOf4yNgkASJdO/gat5zxiOPMWkq8lxSYGv9eg4DIGe5pRZS44zbTP3tDeBS?=
 =?us-ascii?Q?uz9fUhIlOQ+caYjQaDuD3rI3Yf0z2md+4Z5Lw83fDTWEFvxHc1mP4OL7x+gv?=
 =?us-ascii?Q?+645SdWMQ3tbgBWUClekSIWuAwlNIaeZA27H3faGh/15eAQzjKnZX/gel7CF?=
 =?us-ascii?Q?x2b/gtQcTzt7TY4Xdg9UqwN3F0BRyiSBF5030E6AQ4W850xTSG9De9Dp8ANe?=
 =?us-ascii?Q?zJHaXIWZr5TKQyJs3EyCuy9f271q2KeR7N8MaiK8lWqncf2X91Ej6NXTDMgX?=
 =?us-ascii?Q?vwZ5tHLoVZI4RS5+MxRY8aL7F+GIe6k+1utEeNvB0UOupa/kDevaez2g3+rE?=
 =?us-ascii?Q?U0jXL3sKdjhFaP8YTbFAzTMucQqRQXB0NVyts1UJIuWEuwxaRqUmG4SUdF3I?=
 =?us-ascii?Q?0vx5xmB4Ds20+ileLnJzACChfDJt67O6Ut+e5nfbM4isbf09tOIBIiZl6fTI?=
 =?us-ascii?Q?V2J2tCP0FPEWDRJCjo3TaX+TZR5gvOJfK0dRoRlK7dqu0z97LyXUJFgHGMuL?=
 =?us-ascii?Q?Qduvb1R8XyoMogkdOZgDef8vAXcHrUDH1a9d5qDxa8+0nX09jFupTCyvDRzm?=
 =?us-ascii?Q?LUWpcDI55AJPygq4kn53A4yDsKLIDVf7PV+TVBfve0GdCREt/gjBsd7CoIoR?=
 =?us-ascii?Q?1sX2rxHZkmt61RZub6/Mz1F48AsHoMWkxFfL/B7ZehhUWr4Ek5+XLmGL4zUE?=
 =?us-ascii?Q?ZOQsew95opntsmlKiK/Y+6RMrhIT+XRNAOK7iIUQr630Qh/aUO2Z2bvbFTIk?=
 =?us-ascii?Q?S9PY+mTGvbNiMZe6IuG3u74hB+A0cbJguSyMrOXDACjuOFhdgndZPBL6lBgP?=
 =?us-ascii?Q?w40nXL2zZBXed7S0hg3+qb0fIKt6bxoQwrGLPUH3w7GylbOw7MmyluGIkjC/?=
 =?us-ascii?Q?vy8l7HblUE+5sUvE2NT7TXJWPsPmetG6YLZhYju2o8d8zu3RFQzEzBOYNF4R?=
 =?us-ascii?Q?ONTQiaCMXpAx4qkZddGHU68k4yEOjEV5qAEtJNkrXVU5Dap79e0T4uwIST9A?=
 =?us-ascii?Q?6KcBiAp2xEOA5evddvBHevYDsxdZu8/b0bt1jw9UyQqhzpMB+1nMjmQ0z+Tq?=
 =?us-ascii?Q?KD9hrfOqcUbc/FtzfUt20WrLDh1QQOt9tW49/cEU6q66k+UVwjdhN6pxvdZf?=
 =?us-ascii?Q?itYg7J2IhnrYhLBW0xatbGMTu0zwmeVmIv6dXV+mo9qRMTK3SgHPZPKe6lR1?=
 =?us-ascii?Q?EHHsTunGqQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: tMT5YZkmXfRAdPtmx/Q0vhgF+FfXYxtDSDbiRH9fy700Hb7Liy7VuoE1QMaKGEgYi0hisfQYadc6igYbZvM9NJj/dwlWZFgljvIhgOLVIO0GjFbeXl3Kv3RvK0eEz0ZVuFeXg6TGAJIUJe86L5OPYFDpdIGFGeWuYa1uDm3RIYyh3vYZ8WnP68fBRdH3IDEzfwdqmHvKBgatlOsvU3+ulaYUxDJ2zqTBOkix+rsPsNYbfEtmLekbrxTx/QNCGuKwHyzsSjhKIU6ImmAQujzE0dlRJWSPWEzcZzhDYpr4/iNF87Ex6cI0ok/Gglqs6UsTq64to9yQupt/6t6yNKkWvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb30e6be-47fb-4893-a40d-08dee64d2405
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 10:53:32.9769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsRSxFdQVgKhvhZy153QSQzLtYEvGrCIF9vGPHs9aSt0J+Ki9xrc7n+FpDDmfY5dgA+v+AbaGyuBtI8mIxFxMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

On Wed, Jul 15, 2026 at 04:58:24PM -0700, Vinay Belgaumkar wrote:
> GT_IA_PERF_BIAS_REG indicates power budget between IA and GT.
> Lower 16 bits correspond to IA and upper to GT. Higher value
> indicates more bias towards that plane. The values are in U1.15
> format.
> 
> $ cat /sys/kernel/debug/dri/0/gt0/ia_gt_bias
> 0x80004000 (GT: 1.000, IA: 0.500)
> 
> This interface will allow us to observe power budget changes while
> running workloads and also, if needed, tune it.
> 
> v3: Add a helper function for U1.15 decode (Michal)
> v4: Validate input values (Rodrigo)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 83 +++++++++++++++++++++++++++-
>  2 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..4f1404c6c209 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -634,6 +634,10 @@
>  #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
>  #define GT_GFX_RC6				XE_REG(0x138108)
>  
> +#define GT_IA_PERF_BIAS_REG			XE_REG(0x138158)
> +#define   GT_BIAS				REG_GENMASK(31, 16)
> +#define   IA_BIAS				REG_GENMASK(15, 0)
> +
>  #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
>  /* Common performance limit reason bits - available on all platforms */
>  #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c38bcacb27e4..407393a90909 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -22,6 +23,7 @@
>  #include "xe_guc_hwconfig.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
> +#include "xe_mmio.h"
>  #include "xe_mocs.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -336,6 +338,83 @@ static int force_reset_sync_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
>  
> +#define U1_15_MAX		0x8000
> +#define U1_15_INT_BIT		REG_BIT(15)
> +#define U1_15_FRACTION_BITS	REG_GENMASK(14, 0)
> +
> +static void decode_u1_15(u16 num, u16 *whole, u32 *frac)
> +{
> +	u16 frac_bits;
> +
> +	/*
> +	 * In U1.15 format, uppermost bit is integer value and the
> +	 * rest 15 are the fraction. We calculate up to 3 decimal places.
> +	 */
> +
> +	*whole = num & U1_15_INT_BIT ? 1 : 0;
> +	frac_bits = REG_FIELD_GET(U1_15_FRACTION_BITS, num);
> +	*frac = ((u32)frac_bits * 1000) / U1_15_MAX;
> +}
> +
> +static int ia_gt_bias_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	u32 ia_frac, gt_frac;
> +	u16 ia_raw, gt_raw;
> +	u16 ia_int, gt_int;
> +
> +	guard(xe_pm_runtime)(xe);
> +	val = xe_mmio_read32(&gt->mmio, GT_IA_PERF_BIAS_REG);
> +
> +	ia_raw = REG_FIELD_GET(IA_BIAS, val);
> +	gt_raw = REG_FIELD_GET(GT_BIAS, val);
> +
> +	decode_u1_15(ia_raw, &ia_int, &ia_frac);
> +	decode_u1_15(gt_raw, &gt_int, &gt_frac);
> +
> +	seq_printf(s, "0x%x (GT: %u.%03u, IA: %u.%03u)\n",
> +		   val, gt_int, gt_frac, ia_int, ia_frac);
> +
> +	return 0;
> +}
> +
> +static bool is_valid_u1_15(u32 val)

this function name seems to be misleading since it validates
the entire u32...

> +{
> +	/* Validate both IA and GT values */
> +	if (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
> +	    REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX)
> +		return true;
> +	else
> +		return false;

just

return (REG_FIELD_GET(IA_BIAS, val) <= U1_15_MAX &&
       REG_FIELD_GET(GT_BIAS, val) <= U1_15_MAX);

or perhaps just use this directly in the function below...

> +}
> +
> +static ssize_t ia_gt_bias_write(struct file *file,
> +				const char __user *userbuf,
> +				size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(userbuf, count, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!is_valid_u1_15(val))
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(xe);
> +	xe_mmio_write32(&gt->mmio, GT_IA_PERF_BIAS_REG, val);
> +
> +	return count;
> +}
> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(ia_gt_bias);
> +
>  void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -368,7 +447,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	debugfs_create_file("stats", 0600, root, gt, &stats_fops);
>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> -
>  	drm_debugfs_create_files(vf_safe_debugfs_list,
>  				 ARRAY_SIZE(vf_safe_debugfs_list),
>  				 root, minor);
> @@ -378,6 +456,9 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
>  
> +	if (xe_gt_is_main_type(gt) && !IS_DGFX(xe) && !IS_SRIOV_VF(xe))
> +		debugfs_create_file("ia_gt_bias", 0600, root, gt, &ia_gt_bias_fops);
> +
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
>  	if (IS_SRIOV_PF(xe))
> -- 
> 2.38.1
> 
