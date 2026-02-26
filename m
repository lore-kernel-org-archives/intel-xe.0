Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F111FD9E19
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 23:01:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F2210E0BE;
	Thu, 26 Feb 2026 23:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQYMXn1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0638310E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 23:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772146868; x=1803682868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HzKWUx/b9iBnZATJ+LndXUKVJyIG/k5aAfc83zcUzV4=;
 b=EQYMXn1/2Jyqf0ey/gcvogCAhLoJHPzCZzJnD/6p7D/oWh7/3m+oaGWl
 S8bgD7pxoO1rgWUTbIHV2XWORqnK3+j5Rt8TzqHma2UXcd+gYrhD07AAe
 ZFbADJhJDMdTvolfVmVx75ZjlTltlo/JQs3gC5tQkEbY9ZIUgzDMu5Y+8
 dy7GWEgEdREx3tzTXqcitZrCrsO4c0ejsmo7tfqGTye5E8o/w7fGJeiQd
 4w7HfGOBmnfezvWy17HEPemvJq6ExyxXIOSG3wzRV65MZVGZTU0Zua6Qs
 em3JNAt+sJwEi8HuLH3aQQIgRv4nwG4BTs2yxZH0z6ioBoDwNKnIz6NHK A==;
X-CSE-ConnectionGUID: I49b82oTQ+mLZXtvVG1k+Q==
X-CSE-MsgGUID: uJvJM3kOQVeGKIxv2sqcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73133626"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73133626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:01:07 -0800
X-CSE-ConnectionGUID: Imo5VK4+R5O3xfvk8X9yKg==
X-CSE-MsgGUID: dqA6KxwmR96lFk/Bq5+2tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="239703384"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 15:01:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:01:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:01:06 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:01:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/u/XWvgzK1CWU31oXBvn2xr71PenIgXgmW+FfXtAobvjuJTQ1Mqo8bCVkXtQBXcrJvv4/QEx3YM5fEjQoS3WRxcCS/o6WMxmq891wAkK+EHVm9CYU5LWXZpUEN0FTD2vszYOdRdEJonUCpF8DKKb3iW9spo2jVldQtjukRRJNgEcyrUE/M5EVfu679Rc9ro9vu35raHZn634ubMF6g9JT5cAq8o2jtj+IuLnRCltaxqt+OKWDFEB58wIL+bQf5FZPjW72ydnD6IEHytuoQryB7WdgLuipnbL7nDJrnJcJS/dqbfDTs2H7foxvDPgHM4wxSnfpbes7UZgUZ6E0B7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QlI6RwCz8ZTxPalg3GMIdUJiaQnNRXGv/86UaJM12Y=;
 b=kjrRfsGnRdhq1wzX7cY4SDoZyLCxwsL9BS7p/ZqikLg7bXdT/OkXa4vwLRzbdQcL/K4w1npj7HYLUV327uaftKeWzkW7HIwJQzFyANAfmw6U9B6+viEOso//ysdrEZq5IyO9pVq/JFzLz7SLUoUgN+ubGtfMgk8hpmTE4jbNeKTMiFCqJpv+IiiNMXUrMTp9LhPFWMqtQ9wm26NEa2O52AkiXix1we3iz/hZoNDn8LLs0SHoRWeEkgemS4SWUh4lXzmDHxDnI1BOh4iBKKLSR7A35pmWT2+xtP0qdyeXGBxNCs/Imbm3Jqc0rclzhWi5gJMMtpQq7wmyhxmd8eD6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 23:01:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 23:01:02 +0000
Date: Thu, 26 Feb 2026 15:01:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 2/4] drm/xe: Wrappers for setting and getting LRC
 references
Message-ID: <aaDQrDdO2rxRWxoH@lstrano-desk.jf.intel.com>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
 <20260226212701.2937065-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260226212701.2937065-3-tomasz.lis@intel.com>
X-ClientProxiedBy: BYAPR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:74::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f8e4e4-e64c-4803-76ba-08de758ae9c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: z8OqMwfensKTMZnhm2ZC6v4tuL4aZCTrdEjG//SsJw8rEQsrkWseagdI73joYE4NhOHoYqzpQRWXORdBkSjBck9bgal6uFZN/+wuwLNhdTwOjHtMs877OiTG5tv8odppNIz042TrM36LvWH6qGNtilcMabAyZ13OMe+pHuCFyzP6VVnxuyJ4j1d34Bd1ekA9waUiti0IkAgPp1+EnYopCO3vvsG3qA49vxWXVrPUiz66LbwwVFiXdTaUo7BisRVaQonO8F4LFR9fFgqzpjLiprmoNkcjEGH9rNY0MWKd6dAg/lk/6/6RgGypQ3JyGGuY/erL1E4hZOCiqzywGm9rud6NnUHyuq8ptFt2YPSMMeSGGnn14qd2LmVnpsJxstt3bme8icNfoO5FJZsuKaA4FkQzaMVYjqpl9l2HOdizGYl3wcBqn1Rp4u6wPcunuKQOth5ClCsDQIdln6FS92MMyYeNsNEAF5JkwVspH0fO6LEf8e8/yh5adhWdlK5DKaeoN4PNBVKGzl80e9etsF79quH518LIgrQujZCN00q9I5HO+FYoKzoMPsHtR4YYPXwyvomPGmKh8qP6WV6KIq8of505OPNAjtijWbUJaS1a1+Yv8UKWimiB4PljXUp4F7k7gSK+kqVmNN10pKff/l33K6sU0N5t1W9Av9OJbbRdGpkVScz6PGxHuEDmF1WXkdWbWSW+Ql6Jl+kyo0L2ISPb8DLFS9jouo1zmFC2JbPDaf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jFqpmUPhnNUnUdShIAFLPVLlggMUZ2P8FvMreW8TjNpt5TLb7SldGfDMOdXs?=
 =?us-ascii?Q?qlZ7yilGn21mVyMBl30gjjsurRP9cNuQCvKIoU8esweX8STB1/MWdv5/OHZN?=
 =?us-ascii?Q?ltzPolPOtx2nn+v5ymYgCVaIcbvDMkqCKFXzcZGpi7qOFGn+cQ5cgVnTJGhv?=
 =?us-ascii?Q?ppDBvSk+ns4rkp/NXybsdZh/VjMVwuH+wSM6ZYkynm+UcmU5xYWXegRBxFLF?=
 =?us-ascii?Q?ApbxdFC7qJfjaPCy5IroDRRN4oH6wz/ElTN1mqNUN80b0vR/l6sHr4rG46Vw?=
 =?us-ascii?Q?hg0hufvPuZkG+fIfAzUAxMHez1geolMzVafcqvrZf67kxqsO1W6hHkv2NmV+?=
 =?us-ascii?Q?BvLr1DUIfvs2owK9kwp18yin2IyMCR1OXszhM/50LRU/QRR0ta5VUQwG95Gn?=
 =?us-ascii?Q?jvKAhpjBWvlOGWedAD+UXkUgywoYfkDGLAGAKpqdowv48ZlrjG/hNEY2IWhO?=
 =?us-ascii?Q?fgJHF6+lOYAHy34AvOC6pqdnm4IrLKcB09WytmmycJX0dFKAA8pq8LDSKAoY?=
 =?us-ascii?Q?Tp3i0KEWOxKNXKX74lQav4nxlLcp4cnj/87YzkG8vV0PnaUo1q3tE1tkIUl2?=
 =?us-ascii?Q?h9NwF7jtXKz6bjM716c+V+w7mAB7HElBRGYmdlD2S4qEsz2rMWxJEQe8T+am?=
 =?us-ascii?Q?aaTxFPzp47RiIY2LzfeBopcd5ODATZCIONRAVAz/4jNQb4qKSKhHogV712HW?=
 =?us-ascii?Q?sk/9NRvadqZ7okRvIEarbAdweN/YQfQVosNCDF7l7eNIJPQdZJzWQpba7TXo?=
 =?us-ascii?Q?TIIVBV6ZU+naHxQxMx9yCKkHZnQkwHJBNfef0Ttd4xNSjVL6lJNCz+0Or3E9?=
 =?us-ascii?Q?72Q5aJYmkYqQ1OSGGdWL+9oHIdTCrdXRtFqmgAvKe4lrOnETB6dWXzJOsa4a?=
 =?us-ascii?Q?tExRpe6at2G8CdGi/3uy4Dkh/6pOjh5xwqs9QXg1y6X3FyLdz/uwaCceNpJh?=
 =?us-ascii?Q?ql6aVaJbR4aYjn1+AMogpelFaaAZWEEezeRzaj2cOMX6C8VGRwUIe7429x7d?=
 =?us-ascii?Q?fnknNBgeJzqsUnmBUK82hYYfsyEdZpVMKxU4W8y29L/YWpu0AmIhBhRasUVj?=
 =?us-ascii?Q?E8bRGB7+fob9ty89uP6MYDAz+g0xcfdz5C0a0WBxEe+rw4hsy3Co2iS+tVXs?=
 =?us-ascii?Q?hfyLLKlH3e3UoESouvN6g5zR8fUdnSowkl7wTESZI+4yqs8k94BS6nGIknGC?=
 =?us-ascii?Q?/j1/49XB8Ci4mgk5Q16P+4z+VpOSitNCrp3SldzcOB5svAjkyAo7w1z18oaC?=
 =?us-ascii?Q?nlBJRTcaqCc03Tgr041W0Y0BKJXFEIjZLO2aTX+0hlPCc+DvWwnu9uHXR8Ff?=
 =?us-ascii?Q?NPqW9JjSwbhXqauV/VlQpMzbrt3CbYlRNtzdysnx+DeMASmk8vCUlBr5BgYf?=
 =?us-ascii?Q?0MlPqVxe+Nkhx0cc9vvMh9hWQkbGoryGfjWKu8l6alhUCtpOxooOnV7rS/LW?=
 =?us-ascii?Q?/lbME1TR0xmiI8VtOAbO9NHGG8WZh6tmVdzuIyjwYu9XrlpAzPfmZ5xPEwV6?=
 =?us-ascii?Q?8AyohxAUkKGcovZ81075AQvTHLweYlJ1Twsd7yPhsUnoYXp5sCBYD5/00nxL?=
 =?us-ascii?Q?WTY3BS7VXKQq3TyWDykof7A1yRitAa5ohKg4QzMSyF9U4efSN/tzKevDvZEC?=
 =?us-ascii?Q?zRCQ+CRfLGc7AzUxY4xKN67ftr1jw4wP5WcXFbvm5neP5qQg9pYaesnXhQ6j?=
 =?us-ascii?Q?WWnmDyiKyPsxUFqRiwf7n5DN+fYR+xUlhJ445I6D7tgkOX4W8SwwWfVik+4V?=
 =?us-ascii?Q?sajKdwE5nkPxF5kwPgaAJspqhIVrDLc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f8e4e4-e64c-4803-76ba-08de758ae9c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 23:01:02.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1khR9dQJfVUidhdzuAMb15UHSDNQkBAydikcO0Lei6zRWxI+piSUVfNhBfUqQ83vCqJ6BzqV+z37CUHqdcH7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
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

On Thu, Feb 26, 2026 at 10:26:59PM +0100, Tomasz Lis wrote:
> There is a small but non-zero chance that VF post migration fixups
> are running on an exec queue during teardown. The chances are
> decreased by starting the teardown by releasing guc_id, but remain
> non-zero. On the other hand the sync between fixups and EQ creation
> (wait_valid_ggtt) drastically increases the chance for such parallel
> teardown if queue creation error path is entered (err_lrc label).
> 
> The exec queue itself is not going to cause an issue, but LRCs have
> a small chance of getting freed during the fixups.
> 
> Creating a setter and a getter makes it easier to protect the fixup
> operations with a lock. For other driver activities, the original
> access method (without any protection) can still be used.
> 
> v2: Separate lock, only for LRCs. Kerneldoc fixes. Subject tag fix.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 73 ++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 ++
>  3 files changed, 60 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b4ef725a682d..c0e95f1a9911 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -231,6 +231,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
>  	spin_lock_init(&q->multi_queue.lock);
> +	spin_lock_init(&q->lrc_lookup_lock);
>  	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> @@ -270,6 +271,56 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	return q;
>  }
>  
> +static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
> +{
> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> +
> +	scoped_guard(spinlock, &q->lrc_lookup_lock)
> +		q->lrc[idx] = lrc;
> +}
> +
> +/**
> + * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
> + * @q: The exec queue instance.
> + * @idx: Index within multi-LRC array.
> + *
> + * Retrieves LRC of given index for the exec queue under lock
> + * and takes reference.
> + *
> + * Return: Pointer to LRC on success, error on failure, NULL on
> + * lookup failure.
> + */
> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
> +{
> +	struct xe_lrc *lrc;
> +
> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> +
> +	scoped_guard(spinlock, &q->lrc_lookup_lock) {
> +		lrc = q->lrc[idx];
> +		if (lrc)
> +			xe_lrc_get(lrc);
> +	}
> +
> +	return lrc;
> +}
> +
> +/**
> + * xe_exec_queue_lrc() - Get the LRC from exec queue.
> + * @q: The exec queue instance.
> + *
> + * Retrieves the primary LRC for the exec queue. Note that this function
> + * returns only the first LRC instance, even when multiple parallel LRCs
> + * are configured. This function does not increment reference count,
> + * so the reference can be just forgotten after use.
> + *
> + * Return: Pointer to LRC on success, error on failure
> + */
> +struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> +{
> +	return q->lrc[0];
> +}
> +
>  static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -327,8 +378,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  			goto err_lrc;
>  		}
>  
> -		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> -		WRITE_ONCE(q->lrc[i], lrc);
> +		xe_exec_queue_set_lrc(q, lrc, i);
>  	}
>  
>  	return 0;
> @@ -1288,21 +1338,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -/**
> - * xe_exec_queue_lrc() - Get the LRC from exec queue.
> - * @q: The exec_queue.
> - *
> - * Retrieves the primary LRC for the exec queue. Note that this function
> - * returns only the first LRC instance, even when multiple parallel LRCs
> - * are configured.
> - *
> - * Return: Pointer to LRC on success, error on failure
> - */
> -struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> -{
> -	return q->lrc[0];
> -}
> -
>  /**
>   * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
>   * @q: The exec_queue
> @@ -1662,14 +1697,14 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  	for (i = 0; i < q->width; ++i) {
>  		struct xe_lrc *lrc;
>  
> -		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> -		lrc = READ_ONCE(q->lrc[i]);
> +		lrc = xe_exec_queue_get_lrc(q, i);
>  		if (!lrc)
>  			continue;
>  
>  		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>  		xe_lrc_update_hwctx_regs_with_address(lrc);
>  		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> +		xe_lrc_put(lrc);
>  		if (err)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index c9e3a7c2d249..a82d99bd77bc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
>  
>  struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
>  
>  /**
>   * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa..a1f3938f4173 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -257,6 +257,11 @@ struct xe_exec_queue {
>  	u64 tlb_flush_seqno;
>  	/** @hw_engine_group_link: link into exec queues in the same hw engine group */
>  	struct list_head hw_engine_group_link;
> +	/**
> +	 * @lrc_lookup_lock: Lock for protecting lrc array access. Only used when
> +	 * running in parallel to queue creation is possible.
> +	 */
> +	spinlock_t lrc_lookup_lock;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[] __counted_by(width);
>  };
> -- 
> 2.25.1
> 
