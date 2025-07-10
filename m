Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E5C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 14:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560A10E38F;
	Thu, 10 Jul 2025 14:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEqEMY+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BC110E38F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 14:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752159387; x=1783695387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5h83Mrpdq18+rTGQyNSRU/b2uWDM3r2hN1zDCEa7D8E=;
 b=EEqEMY+rSZnX2L1VblT4VbjYdFBBmQpWWFW7Qvz/i85w2ycMC5dtwWFm
 i4PG0a75si4iRKMirZf3ccRRzMbF8YqMM1HvP87B7NALXV0IKE/ZY2Ala
 xT7AcYhct3CUhpm7KM9Gr2kHf9p01k3RBbpRZZBODpttuiAUzr6y/Iu09
 Gv6yiKrB5AkYzwFwCp85XkSiL/ii9LfovRYvkY0qai1bKydsKoXhHXG9o
 9X15WTDDnUqB3eTW1+TEiXDDVHkpGJbn67YFpgybLXU20qQOlEE/E34+O
 fkPLQqE0KS4W4ChvvjNtsekHlviFfXl1H9d0aWAcaGkLrawm/U0Q0y7jR A==;
X-CSE-ConnectionGUID: PBvEA3K9QwmWt28LydnaNA==
X-CSE-MsgGUID: zx4K3l47TQe2jzzlN0t4Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54574451"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54574451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:56:26 -0700
X-CSE-ConnectionGUID: BN0YmDMPTv+OE3liT1DsWQ==
X-CSE-MsgGUID: 2CrUDJ3DTQaYeL8oDK5Osg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="155745665"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 07:56:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 07:56:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 07:56:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 07:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABjDWMDPsgKLnhRsy07Alppuiu39E+bJn/io3usCIAm9edzFxhx6O++rxUopRToj+RLlpw0AVxc3JG/K7vnimZujpJJiEm3rIri39oi8j6KI6YokOBvDDlkPfiqVACt/qQfm91r+zbCmK2BNx6rX1rLX6WoD54n/vf59BqKeylZmHiuAtIzqIObXpvsQmehahAkWu00CCM6Lt9tWDiiA2aKaNQANWzXLi6mkaj/qCMzzlq3AGnEFqqZML42T6P4IUq3s/y72kd6czmHZBCsXcechOM65tWH6ZTftaakh9QjeeL/bPJciSt/XRnDyHqJWCx8MYPyZSHYD+2nEh8XhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Niu2X0Y5963PRUyTUp1UgDtBvWhYONjMOpP3G0bFHFI=;
 b=C6Vzavj9H+7gmN0GG7NoFHjbgTNpmZs/al6Rg++tPDeWy1nkstbUbfbdq6csZZSbUs3K41zf/vKrlbJC1iiwV35TUc0PwDiB6JSkbC1pJDiOnPnvP9YY+aVHwYOLURWfqwQ2Bjxd1Wf2J/Psca2NaWzzihZY8WQp14bAEhMK8nmRPB16n0yDuf3ATWbwGO+fOdxTt1vWBoD4SMHVL2r71mrCPcLsRuUPtwZogi2jbRa8Fk8/jd3f2LOHMEQt9Fy+WAhV0jWTxnZZDfO3I2I/0uSPKdoTREkTJxbKkuiBNNg4uQgpDJtpv7RnYbqKNCnlR7SGpX8WlUKmFeRSjh3xYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7822.namprd11.prod.outlook.com (2603:10b6:208:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 14:56:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 10 Jul 2025
 14:56:20 +0000
Date: Thu, 10 Jul 2025 09:56:17 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Juston Li <justonli@chromium.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Subject: Re: [CI] drm/xe/bo: add GPU memory trace points
Message-ID: <qam7njmuxr23wzswe2g3mumtd7usjiamovl7sisvqwt5wkgfef@j36kxiphdzy6>
References: <20250709192313.479336-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709192313.479336-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb6e328-9640-42d2-9dc9-08ddbfc1ee11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V13o6AQnA4taFXTnRxzHQj0FiQejXqNX77Fdk5xxvHe/hkM1jDdDvSLpSzxK?=
 =?us-ascii?Q?y1uxa1CwCD/TiSmB5XnbQurNObmOanAAvSQF6i0+oTS5AnfM8OUEdax34wdj?=
 =?us-ascii?Q?NgS7+6mGgoajWcOIAvI/zerSsHpHMNoc8w86QJpv3huPU8pZKaaeiQFzzI3d?=
 =?us-ascii?Q?yadAW5IkJKuch1xtcuDXD3tlVBr74jQC2dMAt0iidWjvGm0TthPNa8V7OrA5?=
 =?us-ascii?Q?NYZfPDAbBcyIdWJ3UYif5Rc8vKJSFpdMBU1ee+UTQVgJQxW8gTNqRYOLEnGK?=
 =?us-ascii?Q?9HlymidR3gK80NGNaJgzTqXcPkov2kgqskZVeMMw/EltZR7i16Pa0cKPW5tQ?=
 =?us-ascii?Q?2b6zY38sjRnO/crVU+b1lauYWKSF+UqJvEzuUEcWotZ2U0tc0IFkrWUnqZab?=
 =?us-ascii?Q?MA4aaFNvgxSFEvZ+ddBlKVh6zLdYkytmm2I3Ve0VZzdM28oxSJcsRAc/fsGy?=
 =?us-ascii?Q?zFPoUK6UH+eSTaVIkOlF27uqbYmpBo/aRrwpfdbf+n++kHcu33H0bTC9rLOS?=
 =?us-ascii?Q?CVuKU0H4Rr2dQkDGzSbVmNwoPr8huzaHKXXDp0VQWvE8D2vZweXckC00xSin?=
 =?us-ascii?Q?2eRvFqgr9NWb9Yzu31HNyPvPY56fkQmUGUhfkKw0buIawJP/eKEhjR06phRU?=
 =?us-ascii?Q?0c6tD8qs/tWtjk2FcunIyfAICbXlhE0BbyEdNE7ff+j7eTlW5ghuIPZ7g747?=
 =?us-ascii?Q?E3lQ97GOoL2499S8LAKOrmw5pJFiRmB9POc83DdnGaHlJ5oYB4vIsh9F2X0i?=
 =?us-ascii?Q?rgLepVM+qOSllvw6mCwigPOZfD0ht9VRvbWBQu1teN3rAwsn7tDaIuwxDMpN?=
 =?us-ascii?Q?TpmYIo/2n/6WFA0uXfeY6yIZkVWveiNtTVqFy5b7tHokDe2aOTyhfla5s2ji?=
 =?us-ascii?Q?zxq6+zSf4E/CcU0pzwZEDVJ0E59GnjpC1Ax+v71388BOeq/NFZ99rFqzes/O?=
 =?us-ascii?Q?EfAFAr7CMHJR72F/9yoPaWKsnaKsawRE6QqERR+gECymunYS2MvofTtdo1un?=
 =?us-ascii?Q?6D18d0TxADUKJAXyLDQ+GrL22048ak82Xyg8ntEQIfcP1IraZV71+7u+IoVM?=
 =?us-ascii?Q?UN1bPzEG7Tr+TfgqiUalaji1WONREMEnwdCSxVSduTtLlgzMrL13W/hvtffC?=
 =?us-ascii?Q?biOr/ObII1n2Z7PHtp/bHRq0s0zI4UF8kY+2hsGEkeHe4ab9H3OpW/6PcQD1?=
 =?us-ascii?Q?A5XBEXzBOp0MrQTFkOhjFEy0u2E5fo7wQsMZFVS57BySMt07TjTjWcVvLK40?=
 =?us-ascii?Q?KHFRZxuKSG/VnXr/vVky2eYa2qUbi/n2eITSBStXEcqJqsKmK2zH5Lb599Y1?=
 =?us-ascii?Q?sBYpegOdrr8CsKdhBPduy99+Bla25hQXS6WJkWTTPhJbW9ErTX+f56a7Ltpl?=
 =?us-ascii?Q?/EZP5vbF/RtoaK8cgt6CyJdBL/Blmq7q5qXQ3q+Ny3xvzoap/HLbkIwrJmzu?=
 =?us-ascii?Q?Ex280R3nRaE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o4gpAdH1fUEyHBTAO7mQHgnQe0ui+g/oSwVdjsYOY3kzPjaIVsQNERD3d4KW?=
 =?us-ascii?Q?45bfAp63nG3MIILval/APGOy7NnDHMlPGnZquE8i1HV3tcbj/GDVuNiVpOwe?=
 =?us-ascii?Q?4Ed9ZoIxdwH0CZmuCH0WVnJPZjhmgy2KN/9uSbxgP6rJ5E3usobl14zdxAAw?=
 =?us-ascii?Q?A3J9HsZciB7sbhr6Cy8+xYAqpZBz6NxFFOA6q3fyhqZnReEyUON1a3M5p9iL?=
 =?us-ascii?Q?q3sDE+L+U0wqfVbghQ3gfDhdHqYtfX63dBthT4io74uNwxgqU0jft6OiGuwS?=
 =?us-ascii?Q?7LquV7dDBM+3QgVRc9ZWG4VKvIFqOltH8UE8Z5nS//Eso2bHFyLRFpu63PzU?=
 =?us-ascii?Q?GdiaVp359KuAb3FYsdrXLQCarWlaGdrgBaBiQDL7PV9BWDx05SRg0riHedXu?=
 =?us-ascii?Q?fZfivLZgxM/wFLEa5GMcmG+svBy4skyO0GRiUdWqqIvAs8kA1CVPyi9AZI+Q?=
 =?us-ascii?Q?Hvr22wABaECsqBit1B72N8hKWOl17kNk0Ct+KHO7E5QcuJcdc4Gd3aSaWQ2C?=
 =?us-ascii?Q?ooCUeOB3ryg0sF5jaF3kgxRBRJfDcqUtQJpw03VWGbpXvnuW6WUUtypETPxV?=
 =?us-ascii?Q?Ay+JcS/F0R+XpUUYsBKIvOKzl6t/1dC85e0ilyn2EJb6JCfRkvGVbwp30SU8?=
 =?us-ascii?Q?TSlh6K8yySUuDW0MVNjK9SJ/EjHwiLDfI/n12yb3ditPGmCJ8ZPR447U7K7n?=
 =?us-ascii?Q?g1zcurb1UVIttNsMCDGDkGsAMCuOv7alALty/vUUOkdpnUuyYfBkovmcwVA7?=
 =?us-ascii?Q?051Q5BIClpPyU3ZSg2hQXVsNApnrdpWmXLQyzP8+Afz4V65O+pixVDGwdH7+?=
 =?us-ascii?Q?ZBjJhTqxUw700aBGtUEeLNDJ96a6MRvlU3YtUQaGH1m+nQhIY4xKNqcHOMz5?=
 =?us-ascii?Q?V07PVATCU5IZ9Ev0V9li2qohzivXZluekZJas86CmfCZgGMaqxwcVm2s9lRW?=
 =?us-ascii?Q?P0Mrs8D+Hc0ykf4mE52TOItUK0jmSU8yPINQ+epjWMp+RIDkQYiBlHQwbCzl?=
 =?us-ascii?Q?ybEBnleIE5fsnGx/5kn20JtPyNqkUWLQFVei6sGuFJefmS65UODxcDbW4Rs8?=
 =?us-ascii?Q?Fnj01SmAjeA13YJtxSIMxgzsDV55DVFAsNa1zyhYDMzvHJmzLuvUPSgqyLro?=
 =?us-ascii?Q?mQ8u+8fMcEDqfqCHNVKEE8qYA7Q9BCZ6nTzzRDlQAlD/dw6nzHmUlxvTaWiu?=
 =?us-ascii?Q?JLckryISptiIhBaQ+p4JiV0E5j3WlQlbfsSTQrruRwpxmgpxbRth8MLbJpnu?=
 =?us-ascii?Q?ft0Vg8IV6jxZQUi00pZLNsofgS5WfDq0dY4DYwhYXTUH72rmEVzlgA+CUXTU?=
 =?us-ascii?Q?0fpOTlkvcIYFyi82Oj7O2TxShuETavkt30NgY+zAe2SRyMQhtE0P+RS/97Bs?=
 =?us-ascii?Q?E8og3Bs8Cm/7Uovg6xXEN9gFMXXV1k6dnh0fnIk7yrePt78szVJzOsfuxg1j?=
 =?us-ascii?Q?C3B6xR8a5cFwh+jpTTMS3tSmz62KHJCGaGxq6gAEINH5yobNN3tN0xW/5dwe?=
 =?us-ascii?Q?/RCXiaySCTrCJUpQ8hCtocPuBzT0ZIgDnRls2S/ChW8kVtjOGxUACedyp2p0?=
 =?us-ascii?Q?hP8d/9mEKMC9Y5NJV65uNTHBcjntqxPoRwkM2pCXx/8spfzaJTajL31qPPBI?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb6e328-9640-42d2-9dc9-08ddbfc1ee11
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:56:20.1912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QXXP6qChfvSvnnmORqYKXcmqvIKFGb7HQikAdQDFC5hPytfUCMDNF3JztG6fGDwSqe8cBIO4Pl7MbEc8oElj2i3Ta+eR2/c28OUGVyfkQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7822
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

On Wed, Jul 09, 2025 at 12:23:14PM -0700, Lucas De Marchi wrote:
>From: Juston Li <justonli@chromium.org>
>
>Add TRACE_GPU_MEM tracepoints for tracking global GPU memory usage.
>
>These are required by VSR on Android 12+ for reporting GPU driver memory
>allocations.
>
>v5:
> - Drop process_mem tracking
> - Set the gpu_id field to dev->primary->index (Lucas, Tvrtko)
> - Formatting cleanup under 80 columns
>
>v3:
> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>   per-driver Kconfig (Lucas)
>
>v2:
> - Use u64 as preferred by checkpatch (Tvrtko)
> - Fix errors in comments/Kconfig description (Tvrtko)
> - drop redundant "CONFIG" in Kconfig
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           | 17 +++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
> 2 files changed, 25 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 7f8470b22dc99..4e0355d0f406b 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -19,6 +19,8 @@
>
> #include <kunit/static_stub.h>
>
>+#include <trace/events/gpu_mem.h>
>+
> #include "xe_device.h"
> #include "xe_dma_buf.h"
> #include "xe_drm_client.h"
>@@ -418,6 +420,19 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
> 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> }
>
>+static void update_global_total_pages(struct ttm_device *ttm_dev,
>+				      long num_pages)
>+{
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>+	u64 global_total_pages =
>+		atomic64_add_return(num_pages, &xe->global_total_pages);
>+
>+	trace_gpu_mem_total(xe->drm.primary->index, 0,
>+			    global_total_pages << PAGE_SHIFT);
>+#endif
>+}
>+
> static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> 				       u32 page_flags)
> {
>@@ -525,6 +540,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>
> 	xe_tt->purgeable = false;
> 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
>+	update_global_total_pages(ttm_dev, tt->num_pages);
>
> 	return 0;
> }
>@@ -541,6 +557,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>
> 	ttm_pool_free(&ttm_dev->pool, tt);
> 	xe_ttm_tt_account_subtract(xe, tt);
>+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
> }
>
> static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 78c4acafd268b..5b48b9604fc0d 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -632,6 +632,14 @@ struct xe_device {
> 		unsigned int fsb_freq, mem_freq, is_ddr3;
> 	};
> #endif
>+
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+	/**
>+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
>+	 * tracepoints
>+	 */
>+	atomic64_t global_total_pages;
>+#endif

I also had to move this up, above /* private: */, otherwise kernel-doc
shows a warning:

	Warning: drivers/gpu/drm/xe/xe_device_types.h:642 Excess struct member 'global_total_pages' description in 'xe_device'

Applied to drm-xe-next, thanks.

Lucas De Marchi

> };
>
> /**
>-- 
>2.49.0
>
