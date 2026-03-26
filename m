Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938FC10AB810
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 19:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8D10EAEF;
	Thu, 26 Mar 2026 19:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRhLo/G7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0183810E23A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 19:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774554774; x=1806090774;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CghuWN4fbm+Rx2CCGpCtTCzhVIpqS9YWvVOn7UrZNuE=;
 b=ZRhLo/G71yPslOaGaE+hucBNg8P0w0CaAZyb1BXKHLNIlN/bj7EYwSYR
 0N8P6jVpemsE/IeFGN2F181wcYQfzVJBDwXoeWMlZZpj8Da7k2z6lCol8
 6qvd1H9XEmhyg/XKEyHrclUDCOg3sHbtYt6EEnaBQDMUiVhoNvhmYhq7t
 aRQ4lGosE6afbLsZAUd3qF3DPHbam8zN4cyk7N2yP2KBtkOL1sstI9GR/
 By6Ogx7j+7BpcLmytPPCfMx6DqEXHGjLGQEOXqeEJpIvTXKaEjCj/V5w3
 qzZTpk5ONniCagzXsjZh3jJCdp2RgH4o0grIAdP1Z29+/XT0ojI0AN/ec A==;
X-CSE-ConnectionGUID: VkikeZOaQdGk90GVSPbu/g==
X-CSE-MsgGUID: NQ4R9SzqREuVifM6cM+XwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75645152"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75645152"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:52:54 -0700
X-CSE-ConnectionGUID: MrhZYTvRQeqd7IImYNob9Q==
X-CSE-MsgGUID: Ru4V0RXNQj60+Y6JazbZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="229881503"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:52:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:52:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 12:52:51 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:52:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iA7frqFCv1DTJozpiIoyIh+WEv6tMl1VnSyWzgMP9NLZvCctnjcrrwqHSmsZpHwXvkX5wikGTMvPns/zFc/ZuHAlETZmobfiUnw2UthIWGmLvMRZ1cGvSDr6KMJOenXqatE6ToFmHZCCx/ZTC87F32vdbRyE55wZZ7RfR1TN8JEHtjXH/Xd7JqaGvlpVuglzwCqgJkLhmmizTzGp1Nr0vDZlx2NZlkKSB6KaHMmr8TsxT8EjZlpOlJ6qBRRJJjw+1GzyM+YEse2GmQ6XeMRlO6Ky+tcp5pxl3hMJaYJeCYlJ6b8zUBTmTti/O4wzRbai5IhnSiycvROmxLVNiEVrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTQ2h+uvUtUwUPyXG22LNTRxp2UtHhlE5iBc0tFlC+8=;
 b=Ij2jfyM9pZnB2Lx8JrlgWy5h6/ETBMovbiR48W3yAJl0h0eM/zix9pGTqM3jZNndlsvmRv10InMJxshXFJaSijkI3IDVEQiLjriLESr4iM1cCjCjmCeeNwD0EOPNFGtBkVxJOc7OR3G+qgh64sFr6CNHOOvZhj65cb/RxBosnOH5ZePaH5TIIaCpXi1XCe7Y7k6ZI90zGU4UuxlYgUfa/hPrd95bZAxSZGNVS+Kdn+bxJf+cf7a3KnmEyCLigpAFHcmVJ2SUih3fdXbjpYC5v6v8rl871NgiaUFR0xGzpC/pJ0MxZ4AGqFpO5IFMILURtvZwzg4UX4U8m65IA6TgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Thu, 26 Mar 2026 19:52:49 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 19:52:49 +0000
Date: Thu, 26 Mar 2026 12:52:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
Message-ID: <acWOjrQgl9Or+Buc@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 84179793-5424-41ee-bc93-08de8b714236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 36mwSbPPAeqXlRPqLlOnxupER3IYxoFWZB+mhfuov6FfPTh4hQKRrKwnyhc3nAReZOqbMzZp/bon3ww8NW/IyBxEMHPRaJFB/p1E65jtr8tm1ivUaUX67TX2I3viI0DcXGWn4jOVRWIH3hXmzDlvSxPFGaI6OYFjZL+phi4KeMxBSYNpJ7LeJpHp37DhQ+aX0HQUrxHQoZ6GMgW0bI+18xqYLxC73Q9HXgzOy4zIo+OV5vWg50+gKZEfqNEZjDMqSIegG+GfPubxlXJ9AeqN5gKdl3smPzs1FKhV1ewF7FHaWcS0t5IVamCGiOP/A7cT3wnSOrIy7PQ2e9OZ/9KQlvvwUoTyLnFB4NLSHx6bP66QyzfXFIEtaFGU80EARDOZxiax9/3y1FYCu8StRXPVYiNlATP6Ot5tE5QnH3rZKZSTsBig/M6gJw7NNe492jKs8CrpdhvMFLC8R7Z/Vuo9GjTE9xGxAyke5bQ32KbBRmzpppzhvQK7jGr/PBC/UwTJHrJGTsuxdHmfJFrBs/2SyniwTzzOOwMrpsmrUMfy4bJ4pp3tGIwoCwZV/U+XcmWqMpDwcdw0iNW5lNqsdFYCmR53p0W5gmQH5/SbTjtdXxX4yNMFP7Et+kSd3Kcl1WnvfH1EWkdMXKezQA4QbLC6k5EZ0XVBW1xo7q20TbzmL5CXBkEzl39ISPTk0q+VeAXF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/gNPJm2e/EYJLTtGgY5RpwdBbVzUMmYNPo5lEZSQ3QYiVb3+sHuXGynp3P?=
 =?iso-8859-1?Q?fLHTGGITMa+RCYKhMAc0RfgQEz2bDAa5kN4vM9S23DP4B9t0CDdvIO2IcZ?=
 =?iso-8859-1?Q?AI2NKZFY3mQwv7V9Dfs7aUEXMzTNloR+vh19B6+/LtueupsRJwY8mv+vkQ?=
 =?iso-8859-1?Q?H2BrcbTeqSPS2p1y2pehmnjjCNkyG0U5R7fHVkjjqXIJfXt8moXtysjYU6?=
 =?iso-8859-1?Q?YFE3v4IznhXZv0DEtns1RUhC787Y1QyIpXbBzr1tuwMgt/bB8Lb1ewkuFK?=
 =?iso-8859-1?Q?9GnPlH+FQXX5I8bW1aNePI0+YOfF7aHx7Ua87OuQCoQOakslFAyF9r/zbf?=
 =?iso-8859-1?Q?lUdkNiVEcRCEk1mrxHpI5C+9l62/w0cIVrC7gnjYB0bE0LzSbMjAinpQwf?=
 =?iso-8859-1?Q?54EFO6pN10xL1BI423BXxmpL6WsTURd6+79z5R4d2cnJ4MeKN6IDBLdiVP?=
 =?iso-8859-1?Q?ZyPQ75dJffd8FrS+uMlXYZ3/2667zNnkQyRzbBgQ+pYcC3I0NsqelIZkea?=
 =?iso-8859-1?Q?i6Hmb+5C5L8JyzE7hKZxETWTzjIthKoYflAwwR1iMyisUZvIOIVjxyVUb1?=
 =?iso-8859-1?Q?JVKD8o8xDnOj+4DPvuDvCtvLCgM62BGB2gjIw4ZHfba6fou+pQbD7xv78x?=
 =?iso-8859-1?Q?qEc6XBl5cUJfgv5EXXe4epIljdGskbHaFZFejKyOofnZVU+GON/g690ied?=
 =?iso-8859-1?Q?ywJZbspTqoUbRyD45ZEKNWn52bSCFFjST9EnXj4Nvjf/oCoHLlLX9ZCCXS?=
 =?iso-8859-1?Q?QOoB+nJW0uKF0JYk5FD+BOXcCk0AN6q/mHGorxlmrB6GsODDX927whGLL0?=
 =?iso-8859-1?Q?DCE86XM4WiKettW6zWQtHxM2Nvn9bi+dUC+H/H0paPkBYd879pWOAa2UYB?=
 =?iso-8859-1?Q?SrDZilCQOaZ1ow4gYaQ9Ft8DFv92FxSt0adw4Y6WobZtguJ4flyfJlP2dg?=
 =?iso-8859-1?Q?5CQPLySzZ+ClCCrFjeYIfNH+VYut1H3mFaqbeIC5JPnjUTnERXyc7i4v7u?=
 =?iso-8859-1?Q?SXopNZ9BB8hRmaPe6kXp7tXI2z/NIXPOhji/a/wzfsTbN294SdwspW96N9?=
 =?iso-8859-1?Q?RSgXl1RHG2QxxFVUJfBpz4ztNsEkkPD7V5zIy/NwHmOM60ygftSAIZYI/6?=
 =?iso-8859-1?Q?okC+f2OHGeksLPqeIO5UACluMgrJcTAAeIwL4GR9syO68X47Hozjx9Cn2c?=
 =?iso-8859-1?Q?+yQnUokQtIHOAehoW1k9rBamCAugCyUSWsAPy/cA82dCYwMT5qQgEPRfLc?=
 =?iso-8859-1?Q?wwQ1HHVuerXQgdCJxd27D6+gFaR528Kigl0Wpw6RG6ZQlpMoV+G/1BPS2T?=
 =?iso-8859-1?Q?bi0lxgOTn0SqEmppLdTjh8a+2aECvBN8HKqmfNHL3Rxs498o1cJfkDijxB?=
 =?iso-8859-1?Q?GAD0sPHfV8eF7CA9UWTlcJHtkIpho+gXoC4UNJfvGGl0jTLtlhwB80PVxj?=
 =?iso-8859-1?Q?V6pBIzRDjHBcKVq8h0HN/gmNzYE00DKKuRVMe7OZ77sXwlQDIcENpn2r5L?=
 =?iso-8859-1?Q?tjpjMw4ZZKdlbDx1mxDtJ2oaNzVUeATBYGy5E6JSG5FVbnHsfTQN1w8Wtl?=
 =?iso-8859-1?Q?ys0qXEdckzRnFtpUr9x7AEIj+oWU22aW1XM04RNwttv9wu5AtqHilgmaXN?=
 =?iso-8859-1?Q?daN1deCCxhAZ3FjWY490SJz2khYNBDn7WxEWiEQAJfxT9xqDPY9JDNeJWR?=
 =?iso-8859-1?Q?q/EUPI4MRdDYROfKwqgncS+/vvS6Lt/xOgybQgkfljdQlRUNEyklm4D9Lz?=
 =?iso-8859-1?Q?ijE/+KoZckjFa0psoKXriBsbginY+49sCK4cfIXaOzfW/bttAEpqkSdC1M?=
 =?iso-8859-1?Q?Ojdq/t2p+CFJYWQE3LkayeaqJ6uT/g8=3D?=
X-Exchange-RoutingPolicyChecked: RBD689gc2r982fRtOQ7j+Q1y1s8JnlFnMSf9qpIrw6gboEhM1yN+mIWbHswzvmpDIIqKUdJpPSA+iMLy6Uz8o3MlvwlE1ziHu1FS0GjPQ/csIobSN2FYN+uk6U9JOd+GPj/7hLFmL0AEB6krRuWi8F/rguEbsXVG7y/Xjk1rWrXFz/X9iLnBAxlXR2iGZuRjt2YZ0fNdui+TrAHkJWODTvvjyt/2l+qmKJ0SScXNtHEoIp/oSJUDuJRWUzNseXbSUL8UoZ2QOX9eCJ8B4LRbNmrIDKC/LPMfrBKBPkwcSHCkNc76Dww/ouSUPD0+8X6u4n8iNKgvZSWLhmFmZUiiew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84179793-5424-41ee-bc93-08de8b714236
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:52:49.3080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz4/iLVu/qJyjefWeh0G2TbjQWAGRO93lYg3GA5HxBV8WVF6B7Gly1g2BlTFJ03hmovEA5+TRogqYczYjhy89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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

On Fri, Mar 20, 2026 at 12:12:31PM +0000, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable first.
> 
> In fence-enabled mode, that ordering assumption holds. In fence-disabled
> mode, allocations may be freed in arbitrary order, so limiting allocation
> to the current hole window can miss valid free space and fail allocations
> despite sufficient total space.
> 
> Use DRM memory manager instead of sub-allocator to get rid of this issue
> as CCS read/write operations do not use fences.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> Used drm mm instead of drm sa based on comments from
> https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
>  drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
>  4 files changed, 53 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..4c4f15c5648e 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_ggtt_types.h"
>  
>  struct xe_device;
> +struct xe_drm_mm_bb;
>  struct xe_vm;
>  
>  #define XE_BO_MAX_PLACEMENTS	3
> @@ -88,7 +89,7 @@ struct xe_bo {
>  	bool ccs_cleared;
>  
>  	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
> -	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +	struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index fc918b4fba54..2fefd306cb2e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -22,6 +22,7 @@
>  #include "xe_assert.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> +#include "xe_drm_mm.h"
>  #include "xe_exec_queue.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_drm_mm_manager *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
> +	struct xe_drm_mm_bb *bb = NULL;
>  	u64 size = xe_bo_size(src_bo);
> -	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
> +	struct xe_bb xe_bb_tmp;
>  	u32 src_L0_pt;
>  	int err;
>  
> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> -	bb = xe_bb_alloc(gt);
> +	bb = xe_drm_mm_bb_alloc();
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
>  	bb_pool = ctx->mem.ccs_bb_pool;
> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> -		xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>  
> -		err = xe_bb_init(bb, bb_pool, batch_size);
> +		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
>  		if (err) {
>  			xe_gt_err(gt, "BB allocation failed.\n");
> -			xe_bb_free(bb, NULL);
> +			kfree(bb);
>  			return err;
>  		}
>  
> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size = xe_bo_size(src_bo);
>  		batch_size = 0;
>  
> +		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
>  		/*
>  		 * Emit PTE and copy commands here.
>  		 * The CCS copy command can only support limited size. If the size to be
> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>  			batch_size += EMIT_COPY_CCS_DW;
>  
> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
>  							  src_L0_ofs, dst_is_pltt,
>  							  src_L0, ccs_ofs, true);
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
>  
>  			size -= src_L0;
>  		}
>  
> -		xe_assert(xe, (batch_size_allocated == bb->len));
> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
> +		bb->len = xe_bb_tmp.len;
>  		src_bo->bb_ccs[read_write] = bb;
>  
>  		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -		xe_sa_bo_sync_shadow(bb->bo);
> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>  	}
>  
>  	return 0;
> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>  {
> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
>  	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_drm_mm_manager *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
>  	u32 *cs;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>  	bb_pool = ctx->mem.ccs_bb_pool;
>  
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> -
> -	cs = xe_sa_bo_cpu_addr(bb->bo);
> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>  
> -	xe_sa_bo_sync_shadow(bb->bo);
> +		cs = bb_pool->cpu_addr + bb->node.start;
> +		memset(cs, MI_NOOP, bb->len * sizeof(u32));
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>  
> -	xe_bb_free(bb, NULL);
> -	src_bo->bb_ccs[read_write] = NULL;
> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
> +		xe_drm_mm_bb_free(bb);
> +		src_bo->bb_ccs[read_write] = NULL;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index db023fb66a27..6fb4641c6f0f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,7 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_drm_mm.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -16,7 +17,6 @@
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
> -#include "xe_sa.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>  
>  static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> +	struct xe_drm_mm_manager *drm_mm_manager;
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_sa_manager *sa_manager;
>  	u64 bb_pool_size;
>  	int offset, err;
>  
> @@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
> -
> -	if (IS_ERR(sa_manager)) {
> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> -			     sa_manager);
> -		err = PTR_ERR(sa_manager);
> +	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
> +						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
> +	if (IS_ERR(drm_mm_manager)) {
> +		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
> +			     drm_mm_manager);
> +		err = PTR_ERR(drm_mm_manager);
>  		return err;
>  	}
>  
>  	offset = 0;
> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> +	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
>  
>  	offset = bb_pool_size - sizeof(u32);
> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>  
> -	ctx->mem.ccs_bb_pool = sa_manager;
> +	ctx->mem.ccs_bb_pool = drm_mm_manager;
>  
>  	return 0;
>  }
>  
>  static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	u32 dw[10], i = 0;
>  
> @@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>  void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>  
> @@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_drm_mm_bb *bb;
>  	struct xe_tile *tile;
> -	struct xe_bb *bb;
>  	int err = 0;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> @@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_bb *bb;
> +	struct xe_drm_mm_bb *bb;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>  
> @@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   */
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  {
> -	struct xe_sa_manager *bb_pool;
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_drm_mm_manager *bb_pool;
>  
>  	if (!IS_VF_CCS_READY(xe))
>  		return;
> @@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  
>  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>  		drm_printf(p, "-------------------------\n");
> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> +		drm_mm_print(&bb_pool->base, p);
>  		drm_puts(p, "\n");
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 22c499943d2a..f2af074578c9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
>  	/** @mem: memory data */
>  	struct {
>  		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
> -		struct xe_sa_manager *ccs_bb_pool;
> +		struct xe_drm_mm_manager *ccs_bb_pool;
>  	} mem;
>  };
>  
> -- 
> 2.43.0
> 
