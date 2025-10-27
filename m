Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E85CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B6410E191;
	Mon, 27 Oct 2025 21:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dk0ka6aj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9C10E1AC
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601629; x=1793137629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=27RpJzYfO9+YN8y5MWsSzLndcoy868jFZkRfowVc5pA=;
 b=Dk0ka6ajEOLDz+RJJD170HaqhjI6XCuWEWgIqZCHkvVf0wnVvtd5qwhl
 dWxYUY7jTxS6EQqrZxEEf9JMwnfI4dwLpLKZSmaYA1fCXxRalzAalbXIA
 Rf7rxEK4/10BXpSJwCoEpl+DkPoqKaWABLR8IW1eF4lf0WO0A3RHFC2LK
 BlXcRz9vRjYueSSVlVp8VeCaYbOQkweOIM/bi35IEgwkBaKGUkNqa4pr+
 ocZmsu4RWL2rNBbi1N/Uau8Id61ryrX50FCCyh9tbNn7rVGgqGFcWe+Lb
 2IT+vtCgX4pAv8tj8eNEPAtnxmYEW0d9xwMakGbprFmO0u/pzej8IErgZ w==;
X-CSE-ConnectionGUID: apTUG1IITgaTJpnDO+Cveg==
X-CSE-MsgGUID: lpWO0Ja0R5GcTqST/JI5vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63396646"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63396646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:47:09 -0700
X-CSE-ConnectionGUID: Lw31qMQjQ6W8DXjR8SsXFA==
X-CSE-MsgGUID: /yQYwNsoQ+mVoewlF7900A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185251234"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:47:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:47:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 14:47:08 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 14:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUA8SGvXFT70KUtnqogysXEA6xuWVY3dKPdMdv41FG5+sQIf3U76tpV0eNuYEIJdahMhwT6NhEKC3G7MT9Veuh6R7QmYXwa1JDxenrNO8+cjZ04AH1YumxKg4QhNc6d8HNc692FvFB6wOaAJUjZVHfTk8R1rJr4W5FRusrd24VGnTmsSv0X6vAdxGWZ4vQk29o5aHyVAkYqv5t/Sh3asWi9njOLC3f6bfktyZSVOYLTua2MX+3jpAYMorPSgaJHUKBxqetXxMHsA1RZHLTKbvqMICdklLOr9YG+KOme/G3CfdFqjAHlgC/q/wMgNLRYgYRAeI53pRFsqzhnuzNgOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH7+a0VqS65er4R8NawXt1TwzYBZljGEA3xJ2ZgwDmA=;
 b=pjmWbtMGMe/ifV6GTOlz/7rtRSj5VAoFu5TtkRBOWUdyTrvTgrBsX41lcn7rnnHoP7EIabUHCwZD73ZWvMHO89H6ff9VbJvBuvOX9ODFpxAcyJ+BN0M/Yi94dwzorCyPWRKWQTndWL4pcK9eSjbbetn2Fr1Q517LrOFhpmAluIpXkpZ/WkA34Q9AZVkrt3nzNVSsZmGvCxhwsM/VnCsG6oBxypQ/d6ia71cS+evlQDXDwOOCqTMxKGiOWLi5Ye34sKBt1FQ7rYTeTcFJjd/WGt7aGU5A6T7nE18+KyhxOT84F9hEciCvNVynOGm9EgeZP3c95/4NvSV8qDtmMc71dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB9511.namprd11.prod.outlook.com (2603:10b6:806:47e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 21:47:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 21:47:06 +0000
Date: Mon, 27 Oct 2025 14:47:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe: Limit number of jobs per exec queue
Message-ID: <aP/oV1mz1aDjJiVC@lstrano-desk.jf.intel.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
 <20251027202118.3339905-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027202118.3339905-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 2334f417-338c-4848-1c72-08de15a25f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/MGN3gx8ph6Bawf3TSA6aav+tTBTQDIdTQLlpOG4jZM1ravwY2DtOpcv5yMs?=
 =?us-ascii?Q?8R82cmkIhHcuPfxgWbJTq0x4Cq0DIEsIQW0cbJSxJNY8zZRMm7BL634rRkah?=
 =?us-ascii?Q?XvUNpcJqaoX6d0ubG9eS3htvZgcUKorl/c3Awk55zMqPTvxcSAH85/co4RJg?=
 =?us-ascii?Q?EYq+hwRxYjeNwaN/xu4goMPl6qyjjhvvdfLANmHgZn4cCcQxB/Xy30m1oblA?=
 =?us-ascii?Q?BQwqr6I+L8L6WSY5XSzE1AjUoV+xzdFOxZCxJgle8W/7c3Urnxkler39dZ/e?=
 =?us-ascii?Q?LzNJdaxciCZp+o6AljIFP95etumzU2zIlmbnXhrPr/ax1oBXSnE7z7OLpdIq?=
 =?us-ascii?Q?pnKxm/zkgeXK0kUoqeMmnDACCT10B0/4C3A+GGy/heStRyAalpTVgd0C1dae?=
 =?us-ascii?Q?kv1RyyPoZMmZqmjo2hAFccSuuSF/aqaxFfx6VC+51rbEGLfWdRtnq7btnmuX?=
 =?us-ascii?Q?X5FngHMldlxWh/qc3CyiR/jPud4BWm9p+C74lfO+ccwblHnqryqGFOomaJcA?=
 =?us-ascii?Q?NybUXtxkwTgJ4bvlj2BjbkvGbdFJGd7xaaE2PLBZlLFDPCVTjCHRbkDA74My?=
 =?us-ascii?Q?UMC0FWQOlgjw/1EUiBJbixZ4JJDq8aBUpH8a4MBGSeX5mJpAJT9jFgy6xmbw?=
 =?us-ascii?Q?GwuTd1HeuiJivIqg5ntdLj1NHWEn1OfqsmfHZpEMqIqxJIDceinb+a9mqbIZ?=
 =?us-ascii?Q?bNhvCB88OxgEDHsFFmM1whGqNz/xJpOD+g0g/BfLvgN5uYBfQ54geaEKRO91?=
 =?us-ascii?Q?zQ9v9iryfmagYHHrfQ0GxYY9fIyY1k2EuS6x7I1AALthFRf4rVrPbP0M71LD?=
 =?us-ascii?Q?WKpYNPPBPfNFGDn4vRZY7O9EpLiqENt6qqBIqpKPO6OILUNvi1LjK0/Yhqog?=
 =?us-ascii?Q?tQo3cSaokd/ZHtN6p3ZS4c8o3SenFlSVvx75hLWvXLLp+34yYXIZ79kUtnfp?=
 =?us-ascii?Q?FP7fRjaOh56PiftSdv7dy1v7CjUCpZ8oQbt09HmVVHTJGFVJjxIKZnqyF5Q0?=
 =?us-ascii?Q?/aMYxgEbiEvChAmzRQaqaYxyje9x7K3ocJJpI51cVb3CBacDeH6GBNniog9G?=
 =?us-ascii?Q?G3p8ja25MImgakcth4RVKUWcWCkSv3Kkx8MZ/xST8eEaRQZ90tHAZV3nd7FT?=
 =?us-ascii?Q?eNIIAPlz7mf3/Xo0NDLADL0fyWrgiHt1p7SawdqIzEMwxZV+TpP1Y+IDFRFn?=
 =?us-ascii?Q?5Ihj9rC+wmhYRDm6fJETyq6hmaYPEoTzmGe8Jim4IAJF548UzDsQ+XP6UTFZ?=
 =?us-ascii?Q?5n406JGBuY8Z7uQI4BtYK1rnwe+vFp5C34llJIoXgeT+9YKHRkmhCR8GDqJC?=
 =?us-ascii?Q?c8h6/Xi7vlHEu3OhNlPGHf9kBf6a6qwD4N9RuUajUaW8t0nHyakxkO6j58Tz?=
 =?us-ascii?Q?Y/Oh/9DZtvdyIxfBu5QmtEwNRdIv2EKRuzAha7Aed+qLO02D34Yh6/AqpeGY?=
 =?us-ascii?Q?Gr4QyqhVfNei6WHUw8CYjIhToQ+vXoxr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rlyW2yfW8eCdnXJrrdySgR6kY4YRb/05E9GB4odgi7vfjfzFkheVe2cHRAhm?=
 =?us-ascii?Q?/BSbPbx3C003qmJsoWyYtE6rfr13PuKBhjBB4Yjvsrt3C8QQjVcv2xSCckTH?=
 =?us-ascii?Q?qR6jZBWYrPbhDZ+DkR1G/yXpoim0fHDXFu6xP0DE08KWa3OvmN7YGmqjPgGl?=
 =?us-ascii?Q?FPnYI2/EURumQpFkY2x53BqJYWG+TsG4+S4dnOuN/i32doPtlFQDMdiVg8j2?=
 =?us-ascii?Q?HVBHnbJoLR/B/Sg6Ot1WMXlihTzjlnFncKK1pqPz2A46HETB43wHa7XKL8Me?=
 =?us-ascii?Q?cMOh/7Ta+/ndimGyxAeN9rFGi8BVqzoLNEVeKXwZ0wWmB406tuek26B9XgdX?=
 =?us-ascii?Q?rr4ceSj4QGq6DTXk7jlu5B2Fgn3iSddUq/dAxUa1nBjaDk5A7h+wsjiyHAdB?=
 =?us-ascii?Q?dceEgEzTnbLI0Lmv01rssQoaXpQtfyYhLfdV5rC3w2nknOnjnlgY3iowOOyJ?=
 =?us-ascii?Q?dguMdJoQ57eCISBiXo7oax4bbnqu50U3Q/lRJPTrPUQtzlxeylMS7IGNfNot?=
 =?us-ascii?Q?F4TxW6275s0nzGotTEgvJCS0EabDov9K37hMIp2zvcj1c2wbohaLYlpeOOzZ?=
 =?us-ascii?Q?+c7rnI/i/z58eC8iKgcDcvfFDxy28XHo37/fJQHYqrh6BSE9dZX9LcQHupUb?=
 =?us-ascii?Q?/yEY6+LfbYCAGMGya59k+CnThv+PxilcTb10e6zqvsxWokts9ADMCDh6m2pa?=
 =?us-ascii?Q?NGCaoPs2CIgXUBmXRTyj06WJCgXBne3qxL1eB9kva+eh93j+GnQOUpMGpenG?=
 =?us-ascii?Q?AaWRZy/gKwJOLnTilNoiFlBic84dyZu60JUAElF3W7X3RVAw4I8THBS0vAoT?=
 =?us-ascii?Q?7uNcTpw8kg3Mj5AXo3YQpksNnRBCbcszJo3Bh83NjhW1UtLh6cH4J+F6Kjvv?=
 =?us-ascii?Q?sEklkXj3L9zOHGySuBQUYdPbKcFRM04v32NwwUNKfY6wVCHoaCLNFUHnLsbd?=
 =?us-ascii?Q?3tW9kAfMh9MzdpCtd4Xmlkxs7DslFZ8op9Mc8/Ccei0CB87izuoLsCqeEZT/?=
 =?us-ascii?Q?voXIxS/ejYB6ZfBHnPAE0NDxmc5OticQtYf3VtaqHq/DEZQr49+vHdzszqo6?=
 =?us-ascii?Q?2/yadyrEcUcjBwJRT7Xj88ojDAdaax3K1p86LtpEEySkdjlKpkv+t/WhVHTA?=
 =?us-ascii?Q?QQVq8c0aYH2cMHVqGMloZYUl4qVDJOsx2FA6KtOV0h43ZbOLRQe7EZ0HUicb?=
 =?us-ascii?Q?h4KtnRiWf4SSYNO4oBhP7J0TAqB9ShVIUuONVSEhJI/iLkT5KYADW3JYDie1?=
 =?us-ascii?Q?kKkO473ESSowEwm+fXvbYp9ptPZjHNdD01rBvSdbbpuF34aRBZovhOlO+AH/?=
 =?us-ascii?Q?pNw0zKb85lrabZaZK2qFWUJNEK6F1cFK8aOr9X7nYP93n6Lx8LWnvnotg7co?=
 =?us-ascii?Q?CVp3H58BJW+S3RsRyaMkAfba7qGGEwNDunmXVjOLIHkJ2TAyOwpz3185x/+m?=
 =?us-ascii?Q?pjzuIwA+W2pUlW355KP6LHjlHfiXAfLZbIAY3YgQ0baTNtUgN0JKbufNQfIM?=
 =?us-ascii?Q?RF8bx4SlGE0IcPW0I/82GAQJCfKQljLAtVKJHVnb5DQhiI0xrz1B6Qiqo6zi?=
 =?us-ascii?Q?k7DGoXylupxH9WBW10aov0RYZpruvpEsE4CMsmwtYYVfGtu0GbaUSzwDVXJM?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2334f417-338c-4848-1c72-08de15a25f5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 21:47:06.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZibjoWtkAI8FoaQeovkg6uhCNU5UaaiaEG0HWUqWtksuzxvJyoPPBZOZ0/WrxHktsuORhZ8EHzAWkzg8VmFyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9511
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

On Mon, Oct 27, 2025 at 08:21:19PM +0000, Shuicheng Lin wrote:
> Add a limit to the number of jobs that can be queued in a single
> exec queue to avoid potential resource exhaustion.
> 
> A new field `job_cnt` is introduced in `struct xe_exec_queue` to
> track the number of active DRM jobs, along with a maximum limit
> `XE_MAX_JOB_COUNT_PER_EXEC_QUEUE` set to 1000.
> 
> If the job count exceeds this threshold, `xe_exec_ioctl()` now
> returns `-EAGAIN` to signal that the caller should retry later.
> 
> A trace event is added to track when the limit is reached:
> "xe_exec_queue_reach_max_job_count: dev=0000:03:00.0, job count
> exceeded the maximum limit (1000) per exec queue. engine_class=0x3,
> logical_mask=0x1, guc_id=2"
> 
> v3: add assert in xe_exec_queue_destroy that q->job_cnt is zero. (Matt)
> v2 (Matt):
>  - add log to trace the limit is hit.
>  - Change max count from 0x1000 to 1000.
>  - Use atomic_t for job_cnt.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c             |  7 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  2 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++++
>  drivers/gpu/drm/xe/xe_sched_job.c        |  2 ++
>  drivers/gpu/drm/xe/xe_trace.h            | 23 +++++++++++++++++++++++
>  5 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 521467d976f7..f4d79b4b9396 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -21,6 +21,7 @@
>  #include "xe_sched_job.h"
>  #include "xe_sync.h"
>  #include "xe_svm.h"
> +#include "xe_trace.h"
>  #include "xe_vm.h"
>  
>  /**
> @@ -154,6 +155,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_exec_queue;
>  	}
>  
> +	if (atomic_read(&q->job_cnt) >= XE_MAX_JOB_COUNT_PER_EXEC_QUEUE) {
> +		trace_xe_exec_queue_reach_max_job_count(q, XE_MAX_JOB_COUNT_PER_EXEC_QUEUE);
> +		err = -EAGAIN;
> +		goto err_exec_queue;
> +	}
> +
>  	if (args->num_syncs) {
>  		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
>  		if (!syncs) {
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..1b57d7c2cc94 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -377,6 +377,8 @@ void xe_exec_queue_destroy(struct kref *ref)
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>  	struct xe_exec_queue *eq, *next;
>  
> +	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
> +
>  	if (xe_exec_queue_uses_pxp(q))
>  		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 282505fa1377..c8807268ec6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -162,6 +162,11 @@ struct xe_exec_queue {
>  	const struct xe_ring_ops *ring_ops;
>  	/** @entity: DRM sched entity for this exec queue (1 to 1 relationship) */
>  	struct drm_sched_entity *entity;
> +
> +#define XE_MAX_JOB_COUNT_PER_EXEC_QUEUE	1000
> +	/** @job_cnt: number of drm jobs in this exec queue */
> +	atomic_t job_cnt;
> +
>  	/**
>  	 * @tlb_flush_seqno: The seqno of the last rebind tlb flush performed
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 6ae4cc6a3802..f1ba9c19e218 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -146,6 +146,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  	for (i = 0; i < width; ++i)
>  		job->ptrs[i].batch_addr = batch_addr[i];
>  
> +	atomic_inc(&q->job_cnt);
>  	xe_pm_runtime_get_noresume(job_to_xe(job));
>  	trace_xe_sched_job_create(job);
>  	return job;
> @@ -177,6 +178,7 @@ void xe_sched_job_destroy(struct kref *ref)
>  	dma_fence_put(job->fence);
>  	drm_sched_job_cleanup(&job->drm);
>  	job_free(job);
> +	atomic_dec(&q->job_cnt);
>  	xe_exec_queue_put(q);
>  	xe_pm_runtime_put(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 314f42fcbcbd..79a97b086cb2 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -441,6 +441,29 @@ TRACE_EVENT(xe_eu_stall_data_read,
>  		      __entry->read_size, __entry->total_size)
>  );
>  
> +TRACE_EVENT(xe_exec_queue_reach_max_job_count,
> +	    TP_PROTO(struct xe_exec_queue *q, int max_cnt),
> +	    TP_ARGS(q, max_cnt),
> +
> +	    TP_STRUCT__entry(__string(dev, __dev_name_eq(q))
> +			     __field(enum xe_engine_class, class)
> +			     __field(u32, logical_mask)
> +			     __field(u16, guc_id)
> +			     __field(int, max_cnt)
> +			     ),
> +
> +	    TP_fast_assign(__assign_str(dev);
> +			   __entry->class = q->class;
> +			   __entry->logical_mask = q->logical_mask;
> +			   __entry->guc_id = q->guc->id;
> +			   __entry->max_cnt = max_cnt;
> +			   ),
> +
> +	    TP_printk("dev=%s, job count exceeded the maximum limit (%d) per exec queue. engine_class=0x%x, logical_mask=0x%x, guc_id=%d",
> +		      __get_str(dev), __entry->max_cnt,
> +		      __entry->class, __entry->logical_mask, __entry->guc_id)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.49.0
> 
