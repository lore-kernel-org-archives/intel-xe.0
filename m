Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C311CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 16:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74510EA8E;
	Wed, 10 Jun 2026 16:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C2xL8N4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6B10E4F4
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781109049; x=1812645049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QUD353otf3F9hXgywtTcS/txpAAgnpIOGPq+8mQfMJA=;
 b=C2xL8N4qQQVpt43wdBqr8GD60SYgXoInlTbF4bkAoh0Ys+WER1jgtROx
 Q41IcRyLOAnIvRlxocgx+5fLrexjdmOH+FYO9/CwX5F1hhVowcZn0lBn0
 VcBk9HtMrQbFlfHb8PoVlxhOKVGDLs+ESWwuyAUBt3uwGnVHHuW3ndL0v
 2AUilbFKh0n4oCtT90Q7T0QFP4bACMB+Lg7mxbqFY2WEOxnWgQDTCPOnN
 QjY2LUy1YMyZSlApbHSlgGJSBkTDud96zTJMQSl47PFzxHsBVxeLLSWWW
 u+Zb1MfdRu1iPNC4ZpmOwSb6n09WYCubFRXTHT9sfrRXM50tAl/WRKqwL w==;
X-CSE-ConnectionGUID: suOFuagkRP+jYt/LN+p9EQ==
X-CSE-MsgGUID: 8oxuWtetS72/LQncCJfuqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104571179"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="104571179"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:30:48 -0700
X-CSE-ConnectionGUID: cMobnlrLR86PMuLPtgTUcw==
X-CSE-MsgGUID: 77JTwZVAQtiGwLyTcds0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="276412877"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 09:30:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:30:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 09:30:47 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 09:30:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Otz9VrR9rpzivPeV2dHi81Yot9quCWOCl/a5XKTE7lvTrTMkIDC20rNfiNhOTaeIOH+RmCEzkkzi3y8tCc+6eIbN+QEcxeGIB5QPXyLBr5VKNIFm4Dm4mQgHKGgTxAn8atrvgnxhHcW5GoI14NyYm41Uy/lSM/jV156sazn9X6250V2Wrtb0Gs79xk+xzdb8WsArJx+o1E/XJzo/Otorx1hfvLoqNt785nwmTCvHdlU2YeeCX8ZkkCQ+ZqmRfVMmwEpHptvLxNadcaoFmcakp5DXo9LIgCWshNk9p44mJwncgNZ9vlNZsH8nisJH3xeOq0ub+EdGOUJYVLZJxzI85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh5qbHeX9rSAWfLnHGKGH1/7yzWiMaXYytbaMgUqdKM=;
 b=AWF6mbTG2Ko2SjMjzo4ies+38O86Oo3FdklxUeaY8vO0AkSlaJRLzzVXMehXhlaFjht0GbXiwKeCWAGKGv21O4ZeNcV7z6BpZ6SH3JLO3wwKF04/4lqeXLkXUexd21bslZT/iUT3jS+F3oGZCN0vod5hfGXIIlrvrRYf8tsh80WWXGGnKmavf3v/wup0/u1yFs07mAEKPfZL25gx3VT9EIyTybenxMNoNHAEnes+TnM4xHj1E4Z/nuOESA5o4Pd2ZJPAac4SLwz6LeMOqJtHGP4PVZT4jE6jGMnf5VTIFkKKZmIPsy3i7UoqJwjsAb8nD9F5veFnv8BSnLE8s861Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7702.namprd11.prod.outlook.com (2603:10b6:a03:4e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 16:30:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 16:30:41 +0000
Date: Wed, 10 Jun 2026 09:30:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: fix job timeout recovery for unstarted jobs
 and kernel queues
Message-ID: <aimRL9Lg0yEmMHFz@gsse-cloud1.jf.intel.com>
References: <20260610152548.404575-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260610152548.404575-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4d4aba-00c8-40d5-a3d1-08dec70d9ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MlIgQh287e75IF4b/fgR/4KrM6iVc8iMP1M5SVqXhmV52Ae3pPcmnbdParWSh51Z0Qrwj4mkrP9bMZYMp+ep1ReyENFeIynved77NcL399K0hAA8cO0pLt8TENnYtw+vUksbQ9puismYGU8/36/+p3HXGlzyXINj8Kvx9OKVYal2L2K8nfKokvDH80xJWK09YdYSu6iYXqD5JjVius7MoftclfD2XcSw8CgUSZ3hqsIv7Dwv7M2DvHJ/faPib98VYp0/Bd7+c8s+E4sLQ9mFRE5iLIblKRsJI3x0WmGw78IApO2xFxbvE/cMjKrnx84T2YvhbmUPWrQeiY8v7VB4Mqpme94zLPQxR8dNe/0PGxwBjO4EgzJmxDehcLMMXNBB9lsNNylwTGK8s0zugS78/f22ycBvQRSk1gscp0qCRTLWKoEx2ZcYAanDO25unPugDcpyHcyoEvQjK2/dLGPtkA6Hzzniwp/c/8zOIlAoIAkEuexH6JDcmwRqmmVIUK3dIUqqJ1PNVriqZbO6e8xw6tGrhbcq2kWbC60tW7BlkOXDwE9XjE5Qs36EYwYsZHHqKBTVtkOBlbnvCldQgICMO8nR+P4G7Q6x9Qa6cAUwi+4MFHXGV/arVxY+VD395xbW8yt1L/Gp3CMBd7aRnwXgnyIMx3z4B3zuzsYOY63ze89gvS+ny9GhSlV+oNww+0vl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bobOmoIo+hc0oQpLLVr9YWJon1yl1g+muIw+7nvMRJiy/jsBBEnJQHKHRWMS?=
 =?us-ascii?Q?H54vm9DNqlgLx84iOTBm70ct1TU4zwCHPqqy+kZO8m+8QpvKD6MtWVXxZTBA?=
 =?us-ascii?Q?Z/f6U59YNKObI7P9YU2B4m6xcnkAsjxO0zoaQpXnM7AyNWE0cEAaDAnrChOh?=
 =?us-ascii?Q?hNhxZeHM2iYl6imGdz4pCXE44f1AoynvKvFdv5gB7DxebX3vh4vuUKqJDk2V?=
 =?us-ascii?Q?G6E+rB8Sz97KlQX/Xo+wse81/pbQi7KnsQ71U67ICE1IINdimqQh2tLZnSsE?=
 =?us-ascii?Q?IqOZJIydWc1Vn0KX3axn0LcQNY2FmlwjzzczOr9VKB01kgyBIWKoAp7Iw6nY?=
 =?us-ascii?Q?DtfZv49yMwMk646durOQe6M/syQCgsDG2rWjRWS8CngrnEMIIWmpKKQXG8HG?=
 =?us-ascii?Q?YJNWiyHDTUfRm622D+nG0eGDoHGGhoPVLdBzty3B39S3ifX8qHDNN75YoDNN?=
 =?us-ascii?Q?7KgRl/FwY5YCIT4diMTmXYY8uRkHYbyDodE1Uta+xMIgfUH+hltS/M3ypxTJ?=
 =?us-ascii?Q?KZIjxbvXGwSSXhx+c70i8Ot77mb+/LUJimPB87tYbWuAhwRqtY7CE3AphC8c?=
 =?us-ascii?Q?EeI+Vou6QfpVpQHFLcEr1E24hW6ogc6w5PWgui2N6Ka+xZkeq8XvJyd27zir?=
 =?us-ascii?Q?3ny8X+OSsTm4Om2Pz/mjW629Hvi3iLEUNIwULK+WXAz84V08iJC0drHOL40s?=
 =?us-ascii?Q?HrMvS/uPWRKaXKzRRv38udEsudeldawdvKmIKT05N2P6QtSnpIeALQ3oXLPP?=
 =?us-ascii?Q?T59Ej1LqkEzZhZVd8+oXzPocjscPiqk7IxNBvWSOSFYIefxgDUngNy0AEcWO?=
 =?us-ascii?Q?Zm+kvgpxwpuS30BkQuvXRNuDO/sY0LY2q9yNJ2I5+S7T+mqq+LCDJErfVTz5?=
 =?us-ascii?Q?AQ/f8u8UsYWK20XuK9RsuCIoPz72S1r3+PKqBjLNrHrTcEtOqE6ntnaTtqNl?=
 =?us-ascii?Q?OgfhWfzfasKLLggbz7siLVqsbOqtazPAcvTO1KByKRuT7DeVCSXh4is+OSCm?=
 =?us-ascii?Q?IS6KVeXW7ily7oTemCudOGScc2pOdx4kQKN4JlDsjXdqgoSTcmRFhSZqnY5/?=
 =?us-ascii?Q?gi+Bf0tmjxNfQyVVVsm4XxXUp9ZzSOeAt1oPa3iO3NWwD6o6GxUL25FcAOGs?=
 =?us-ascii?Q?mFKIO4lYEcn/I5TdQFkOMsv5ylcUvCvozLR6cyYHyYKxzHNIaQXVjbUOeCKf?=
 =?us-ascii?Q?D6N1Bx7P7GoY6ELahCPByK4AetOA9gFXB3illeJA8PoXHhnwfivoY+ebLyXo?=
 =?us-ascii?Q?unqgv6/HngO9NOiLw8C3qujsUiJUC9Bb/xngHr8GkEq4MQbnkZ+tRFz5yCm7?=
 =?us-ascii?Q?tBT9zLORgz9tr8XED6OAFIa24Rti4bOYn2PQnAESLMj9H8OfvsgAE3hMr8Fo?=
 =?us-ascii?Q?r5LCtCbkWO4vX8qZsgay7lhGcp4Kfp0FLA+sp5FrUq74jhijBrh+pHIB2db0?=
 =?us-ascii?Q?neIpaaPbBYNn611F9No6GunF6VkAbBly2zyWFfEELFXew6j8UQCxKok3EOwM?=
 =?us-ascii?Q?rRGNf8DeNBVfrvZhXbrLIdt2vRDw/72l0fQx4L/9l7LVnr/CH84qNguCxt18?=
 =?us-ascii?Q?g583hVYCKGOYQLbu3U232RhH5wZni+NGLxAdxpduT5dlBwbCRczR4WDWfPlX?=
 =?us-ascii?Q?uPcEGAWo8ef+pFV5aL5m1mcio8CqVMH4Lmtc6sCp9T0OmvGthqYce0tDuH/u?=
 =?us-ascii?Q?V/mVu92x2i6rUjL7fzVZPIbNx4Hpu5z5TY/rfDu4aj6iUowNUktio9YMC7Cp?=
 =?us-ascii?Q?VT3SLtUwvmpUaCMxcEBctD3MTCqekhM=3D?=
X-Exchange-RoutingPolicyChecked: UHK81ahH1KxlyGtYDK6N8Q//RleAFEYRTrA4Uf+ZuDIpuxzCcZgxqwR/b0j0QYSHJQqQ4mCy8/B35d4ALWDusnc9XwUT4A4B55kQlt1XWlBPe/GWuFnkkIw6L/vA0RAeSQgeR4HyMGFnhALn3KW+86CnZ8XNbFeRq9izqW6/tKFkakjRzZCghAH8OyAsN6D26JhdCsH/ylMB8aymfHM+GGYi9xNJEYPWkf63pJiuWOwc6uiuQlyJtd3OyCoJw+8MFdhuDMoEcWlPXytInhCG9q/E9RiWYLbP5WMi6Syp1WFW12pJm8qdiBeohVTvcE1uZFl5gc4XhRzSPoyZ04zSMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4d4aba-00c8-40d5-a3d1-08dec70d9ccc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:30:41.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzW5xJNC8NzoNW9jcUpBpOJYkfBSjVI/mhnx2M0d/p47jTQ8B2/oSBonPIuQS5hboGfG7uTWO80z5GnANoqrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7702
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

On Wed, Jun 10, 2026 at 11:25:49AM -0400, Rodrigo Vivi wrote:
> A job that GuC never scheduled (never started) indicates a GuC
> scheduling failure; previously such jobs were silently errored out
> instead of triggering a GT reset to recover. Trigger a GT reset and
> resubmit them, but only when the queue was not already killed or banned:
> an unstarted job on an already banned queue is the ban working as
> intended and must neither clear the ban nor kick off a reset, otherwise
> a banned userspace queue could be resurrected and spam GT resets.
> 
> Kernel queues are always recovered this way and wedge the device once
> recovery attempts are exhausted, since kernel work must not silently
> fail. A started job that times out on a userspace VM bind queue stays
> banned rather than being reset and retried.
> 
> The queue is banned early in the timeout handler to signal the G2H
> scheduling-done handler so it wakes the disable-scheduling waiter;
> without it the waiter sleeps the full 5s timeout. When a reset is
> warranted the ban is cleared before rearming so that
> guc_exec_queue_start() can resubmit jobs after the GT reset - a
> still-banned queue would block resubmission and cause an infinite TDR
> loop. The already-banned case is gated out before this point via
> skip_timeout_check, so it is unaffected.
> 
> v2: (Himal) Do it for any queue type, not just kernel/migration
> v3: - (Sashiko and Sanjay): don't clear the ban / GT reset for already
>       killed/banned queues on unstarted-job timeout
>     - Update commit message
>     - (Matt) Add Fixes tag
> 
> Fixes: fe05cee4d953 ("drm/xe: Don't short circuit TDR on jobs not started")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 49 +++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index b29cc08e6291..e82018445b7c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -157,6 +157,11 @@ static void set_exec_queue_banned(struct xe_exec_queue *q)
>  	atomic_or(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
>  }
>  
> +static void clear_exec_queue_banned(struct xe_exec_queue *q)
> +{
> +	atomic_andnot(EXEC_QUEUE_STATE_BANNED, &q->guc->state);
> +}
> +
>  static bool exec_queue_suspended(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_SUSPENDED;
> @@ -1363,7 +1368,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  			   q->guc->id);
>  
> -		return xe_sched_invalidate_job(job, 2);
> +		/* GuC never scheduled this job - let the caller trigger a GT reset. */
> +		return true;
>  	}
>  
>  	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> @@ -1460,6 +1466,21 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
> +/*
> + * Recover via GT reset for a kernel queue, or for a GuC scheduling failure (job
> + * never started) on a queue that was not already killed or banned. An already
> + * banned queue must stay banned, so its unstarted jobs do not clear the ban or
> + * trigger a reset.
> + */
> +static bool timeout_needs_gt_reset(struct xe_exec_queue *q, struct xe_sched_job *job,
> +				   bool skip_timeout_check)
> +{
> +	if (q->flags & EXEC_QUEUE_FLAG_KERNEL)
> +		return true;
> +
> +	return !skip_timeout_check && !xe_sched_job_started(job);
> +}
> +
>  static enum drm_gpu_sched_stat
>  guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  {
> @@ -1608,19 +1629,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  			       q->guc->id, q->flags);
>  
> -	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> -	 */
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_gt_reset_async(q->gt);
> -			goto rearm;
> +	if (!wedged) {
> +		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
> +			if (!xe_sched_invalidate_job(job, 2)) {
> +				clear_exec_queue_banned(q);
> +				xe_gt_reset_async(q->gt);
> +				goto rearm;
> +			}
> +			if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
> +				xe_gt_WARN(q->gt, true, "Kernel-submitted job timed out\n");
> +				xe_device_declare_wedged(gt_to_xe(q->gt));
> +			}
> +		} else if (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)) {
> +			xe_gt_WARN(q->gt, true, "VM job timed out on non-killed execqueue\n");
>  		}
>  	}
>  
> -- 
> 2.54.0
> 
