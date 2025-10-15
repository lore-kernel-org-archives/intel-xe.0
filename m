Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A0CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D49110E0DA;
	Wed, 15 Oct 2025 22:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDfh6bPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5866910E0DA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760565954; x=1792101954;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hwLc18QEvdFFi7ZI/RZr//wEfCKHKUPS7mB67b+AVLU=;
 b=UDfh6bPpQODqkb202Da3sAkTdwtc0p01NI3rH8tCwcqIShTMbfWBUcHo
 Qg5+vyf0YNUkp7NH0hvxhnIcxS4RfLaNizpUODkiG/GlLtysoWc0BArrl
 eEPoTef3KTjxPiIRGNLjufYc7FrYg0hhNr7Ad/5Ben+OVArHpKui7M8ED
 q45q4eMFkWiBpRKzbqFAfEMVcjSCEKJBZ2st3zRsZlSDbAUSAZkcpVM/9
 mjFM2HhQzHJdLmkTkTPZ0CSKKjse197JnqI0xRHqXP0YS7e5Y0GwwEbSs
 k9cvcttIpcp7IrsVhuMF0g2vNYZ9zuyuHloqxzo4MgxvbNsc51E3DpTFz g==;
X-CSE-ConnectionGUID: RGZLPh4bTDSEQhEA1KrMDQ==
X-CSE-MsgGUID: PdX1YdxkTGKUWQYzkumzhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62651919"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62651919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:05:53 -0700
X-CSE-ConnectionGUID: k/m+7JBaQa2SlIC1uRFp3w==
X-CSE-MsgGUID: 0Sn0/DKQTdyv0PR2U01mCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="181958372"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:05:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:05:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 15:05:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 15:05:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO4vrJGCV4ZvGxq2NiqBTHAEaFI8/3y0LzMRobl/RwHHkZvUmlXyW7z+BXgoU/Gsn+Oyua4L6gGSh4hUHxAZWqAhjf3Asa/WntDbre8O7nlDL3HWBGidnls6pm0WdF7WrmrlKYk/LN9VoM3AE7T0uym/kDwZXUa1pLxzOXXxHPVn1Yf4TxS6QgEVcZ49MX722Dn/9gJmZ+cPsipCJkO28bdCkJb+ajifcjmwemeeNtjUE/v9dOjA6vdgU1oS3xgdOEc/mxEKBCMlGE63gTn15NYnTC3mn6H9ne/+Z2zsTlaT38KiKMlsqzYvhxmrh4m/UHC/298e4K3oK1vxHNMyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCVBOab7CxnkpoLZ2zpazJz3J4xTXTOZrzueKZaDB4A=;
 b=s08gC3eMnI4JSEMKGbwkfpIUYYjjkNSkn59M7kteO0g0BRwJdl5ZuAH75qzwXOaYy3afEq9pAMmYHZFZx3dHq9LBPwkyxAbNvhL18RPHToexeE8nTZnelPk2TBTydrJlGst1b89T9o0CtvIjeP7NSU5bfQ+rJTqnUamvoMUKCI3F6qAAKaBu7k+2TpPwgqFGztlYVsWBFpayBkvv/VHhhpCbqCt/sS58PhxYxNqQgqTroprDFoJP2WGxEpapz2QZZz0JChmjNluzQlOQk4/JfaYQLynXTWRH9C3tR77CL8rPNyd6ieceFpcY7/HaV73WFu8IwxqeM/Ye//OgJsIIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9061.namprd11.prod.outlook.com (2603:10b6:208:57c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 22:05:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 22:05:49 +0000
Date: Wed, 15 Oct 2025 15:05:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 07/12] drm/xe: Privatize xe_ggtt_node
Message-ID: <aPAaulBUST9Pfj25@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-21-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015074708.1654014-21-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a8d8305-a689-4371-3c3d-08de0c36fff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5paokxPtgvUx6v7ketCcrFzzImAaWUQUy896dETTonQH51JmhLBcKMXDjEbM?=
 =?us-ascii?Q?i3Nkz9Iq58xRnxx4rjFUOjhHYdces1HU3WBvP+s2QlXUfWTZT8hjWutqBFj4?=
 =?us-ascii?Q?o2P7Gk1aXI2jt5+/2ldjD5lnU+zQHRltd5M8bb8ZTD4uMwLoBUn+eBEw819M?=
 =?us-ascii?Q?k3vjj0eQFAeOIgQlbppx9bhIDlwtrCsSgWFTT3oBXPgRj9+wPfSJdcFWDsn0?=
 =?us-ascii?Q?t3YpeH8RAjEHBltiJo02xftpvQp9zDNVxYYCFjiA7YSsdin3g9bRwA0AzEE5?=
 =?us-ascii?Q?RFO6ehi7l1m0lZrtrMWveZRLmLZktxGv0yMI0bbEY+GgQrhl/yZtSKV8PZfE?=
 =?us-ascii?Q?VCKcT7oBpPhSqmRnsJ3L2LfowGzNDYsHtKGZFMprNNgl/DM2TEjgLKRIGvoP?=
 =?us-ascii?Q?TjcDsHHXnBhZRKmqWcK9cH20GxS1v8PqxDCFjHuvQTe9hwsuD+1iOpLk4yFw?=
 =?us-ascii?Q?B9ngOlkxum0C6MboCM4Ox2BwFv5gdAZWYXHuN/HmOsjBQM+gyKXX2JcSKrcm?=
 =?us-ascii?Q?Zzd1McD2mgSMBq41Mx5Pu7uCBCaiCUv++bSLUcMtX3EKS6QLfnbsHXWkJEcb?=
 =?us-ascii?Q?srvvSBb8fdMK4GPkhc9f3ZJqVXNbF1U4totDUUVF0R+NdczNyo/nCkZlxfau?=
 =?us-ascii?Q?FeLmRVnRsCAbxJLsXI07Tuo4dB7tW8Pqc8ccWD1npec0K2lQt+QFjwaBq4IW?=
 =?us-ascii?Q?e87ywAz5uWfdSWiLbQJKsTLAM0kjWPnV0yje0kNmplr2ftRvB+Ar1gNS1tWC?=
 =?us-ascii?Q?ph+K5vHLTLRH8/LjlQCsMGvUrzDzsV+PYz4q1Sipb5WSPZxexq6dYDyL7cA8?=
 =?us-ascii?Q?PL+S4X4Z8v3fBUn/xPQgVjnesWkAjRB5jFOGYf8SQneyK88KtbT1pTwte7of?=
 =?us-ascii?Q?tF4BpZzEmdYvWEZ9ej6KMGgriDGpkoQKLdRRaDSMj8s6dNllgBpvO/DF9PWW?=
 =?us-ascii?Q?BKZ3tMVtNxtFDhESlkpwDcmfuHst5eucxAMt2jvDJEMgKrR+nto3NV7+cxkK?=
 =?us-ascii?Q?Lq7A0NprGUhg55maUzpCkryJCrNQyUUvsa5HfNDp3D6gV17M3rpZco3U+8Xt?=
 =?us-ascii?Q?Zzxxz246T9H/JDpdcQcDsHNzDUOJ0fLbYv3xMh72OSPEo3vJgeE5ZNRh3mcv?=
 =?us-ascii?Q?V2Ri4h4lLLqiSJ8EVMTJAvIEzoRJx0Oa1m7FKn4ASPqDFhSi94uylY8n5zsX?=
 =?us-ascii?Q?qBu+QVxVMpbCpMhM4gAZ1m173wqXDlUiFqtuZ+rCHZ33ieD3VZmJiS/uwIs1?=
 =?us-ascii?Q?KQNEH2hq3Io7h4w9t9dXWlmBByHOAzkdr4bbe/nuSrcFsxJNBQ0Ek+PzDIKT?=
 =?us-ascii?Q?XZiG3psRUxu5Coa1q46y3wD+AqUSqvCjf3+aueGbFb2urgiEA8kEUyLIxDiT?=
 =?us-ascii?Q?Qz4mcxIewc7T74M3BO4ufFnrcVP+7uh/0anYr+gFJFlr7tvIWHztKCITpm1a?=
 =?us-ascii?Q?bHnAQL0auO0p1ptNL8em6hIA7cs/HVMk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NR32M7Yh7+ArNeyCL38DDT3bTS0WEzxArukZbd94yUmHzD29VAMnXUjnTqh7?=
 =?us-ascii?Q?WmDSNhfcdl+NSt3pmccGzRi5saItaE04FWD5rdtO45lIMrxxHGx9nPjkFKJk?=
 =?us-ascii?Q?J74iTnP+97TW4le+r0m2Y7KqYVAL1go505ks9L6sNfM8UTulPECBBfuRiSt5?=
 =?us-ascii?Q?5Mkci3jZRb0e3A615eauJfENbt9aN8GHWm/FG+im94/pl66KZ7WCpoztEBOe?=
 =?us-ascii?Q?0HYO/o7P/FbebBcuptcNMjYrF9ZI8vT7bXSBn9CsltWBhuFlsGtaSqhjmp2m?=
 =?us-ascii?Q?BvMZn+Syxqq0pZyzQsrTXNpl9c2ewSO/9Hl4NBFP86/wK7oFsCpm2wBAYKdl?=
 =?us-ascii?Q?ig2VdpkCMqKAE/UI/KY8yTvv2LJ1ExjpNXQJ5HnEj6BXRpXOgBU68kSW5cx9?=
 =?us-ascii?Q?0oiErwpe6fJwEes6luQ3u585f0EyPGFn22c5j8RE+W2bAO41jY8Muxam4TGU?=
 =?us-ascii?Q?rJVfyI/lk6/8SRdm5urdlH8Q74ayk8oYKCeDIsjrPh0N/YY75ZG3l87uESZa?=
 =?us-ascii?Q?lQwLysRdfBWMOflavuR5rR64EwlkdbdPtJK3eOb0V91JL2jnQXGXI9r5SJgE?=
 =?us-ascii?Q?B7GuavMPtsRojsyB0uEeHy8SoujA75GWZg9+176e0Y+yUUXb+lRTi+2JeK36?=
 =?us-ascii?Q?uSNx4ELY1omiogy63bjvOYFiKqCL3J1aHewIFHDlPKDTbRRkrqO6igQz//pM?=
 =?us-ascii?Q?6bNubdtgnDZlrFuqGH92ClCnRmVgzmhzzAeZLws+rtx7OW2A3twIplKJV+bm?=
 =?us-ascii?Q?HK46p4da3QCQZUfQoc9VR6atPo3CIFnGqizw60QsLO7ASLundEfZfSA3iGXx?=
 =?us-ascii?Q?czTyB7ucW2C6FN/iogOdEkFGN7mbbq36MuHRVOTMrxlNVnEXaix3hBHIdJRr?=
 =?us-ascii?Q?3zazp0g/tK56Jjp4zRiTiErV5jF/u6hwfqHgqr+AiRkMniEQEJNKXHgxLfWS?=
 =?us-ascii?Q?Y3ntnLsfz4KeHwYcaxiq1FP0B7egAdz2O+nEIlrr0mP1uFSngKgyY8bp62os?=
 =?us-ascii?Q?mVEcurKiJz8aEIOlOZJGP/lPdVK4Mj84s9wrZmaNcjP/U13GbCXzjdX4toh3?=
 =?us-ascii?Q?2CF2EUJl8fS0vQiIOxVt2R9xtkPL25v943BhBigHMXo4V4mrsl2tqrYjhZIP?=
 =?us-ascii?Q?06I6b74PATgjgM0ZrpfbQM1dDQOldkAl3YFfAS2H4HX+2Hy3lDgNdSk65VNC?=
 =?us-ascii?Q?HEnGRWHDvH+V1J9cqvphGM8DmEqT+Kj/+pXptAxp3ffnkGaMNRT7LOcrjueg?=
 =?us-ascii?Q?IhIfa4d1eWYttu8mGdUxiMsC9GTchy6bGKGT1td+hyESDUCjVjbcdpZDElf3?=
 =?us-ascii?Q?bqXzKvJMHbWzOpl4/7HiXICvrc6zJjONnTYi4TKxjE4+nslHmAhmUSvhk5T9?=
 =?us-ascii?Q?A5JEOmioUfKcu4zUe0R47OId/Nx5IpiQtxGOT8Uex9TUuP1ynJO+Pz36AH33?=
 =?us-ascii?Q?+65LF+pSVLrHXwl/A2Hzkpq9bATTYliay+bH4b6GL4K+zn6jvZlK8IabIu6E?=
 =?us-ascii?Q?Aq6+FwsFzJCh5IHai10qXkS2pw+zlF0YkxNpISpB1TqyrhKmIEFeds6E7NXT?=
 =?us-ascii?Q?RqxiNUhF8S375x0VYkkVIi3p1/OMWGLSCcVZFwUkfsEjQjuJCUnK4Hy+jYvl?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8d8305-a689-4371-3c3d-08de0c36fff0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 22:05:49.8179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlQqVR5OOBg1sk4kDf9qORU9XpWuNNFnDJXDbiGC3PBPpaXdvciMEyNgKycol8Rm8wRSN6LRNHDQflx6a1Ehhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9061
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

On Wed, Oct 15, 2025 at 09:47:16AM +0200, Maarten Lankhorst wrote:
> Nothing requires it any more, make the member private.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c       | 18 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt_types.h | 19 +------------------
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 05515037e2d6a..5c07d63189ab1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -34,6 +34,24 @@
>  #include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
> +/**
> + * struct xe_ggtt_node - A node in GGTT.
> + *
> + * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> + * insertion, reservation, or 'ballooning'.
> + * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> + */
> +struct xe_ggtt_node {
> +	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> +	struct xe_ggtt *ggtt;
> +	/** @base: A drm_mm_node */
> +	struct drm_mm_node base;
> +	/** @delayed_removal_work: The work struct for the delayed removal */
> +	struct work_struct delayed_removal_work;
> +	/** @invalidate_on_remove: If it needs invalidation upon removal */
> +	bool invalidate_on_remove;
> +};
> +
>  /**
>   * DOC: Global Graphics Translation Table (GGTT)
>   *
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index f4aa5671cb3e3..31054e00daa6b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -11,6 +11,7 @@
>  #include "xe_pt_types.h"
>  
>  struct xe_bo;
> +struct xe_ggtt_node;
>  struct xe_gt;
>  
>  /**
> @@ -53,24 +54,6 @@ struct xe_ggtt {
>  	struct workqueue_struct *wq;
>  };
>  
> -/**
> - * struct xe_ggtt_node - A node in GGTT.
> - *
> - * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
> - * insertion, reservation, or 'ballooning'.
> - * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
> - */
> -struct xe_ggtt_node {
> -	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> -	struct xe_ggtt *ggtt;
> -	/** @base: A drm_mm_node */
> -	struct drm_mm_node base;
> -	/** @delayed_removal_work: The work struct for the delayed removal */
> -	struct work_struct delayed_removal_work;
> -	/** @invalidate_on_remove: If it needs invalidation upon removal */
> -	bool invalidate_on_remove;
> -};
> -
>  typedef void (*xe_ggtt_set_pte_fn)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
>  typedef void (*xe_ggtt_transform_cb)(struct xe_ggtt *ggtt,
>  				     struct xe_ggtt_node *node,
> -- 
> 2.51.0
> 
