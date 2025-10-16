Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C34BCCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 00:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF3110E90A;
	Thu, 16 Oct 2025 00:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUNt2fse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4B310E90B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 00:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760575022; x=1792111022;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9GEDv+lRJ9zlzn0UWgd4uHKHQ3NJbUNeq2M4EpdUEa0=;
 b=VUNt2fseXIT0dOlZ8j5psnWqtubIAh4ruskMlkKUAp+K81UMle5xt5Cm
 bCjhUTCt954nNiO8lnf/T/v4HaLDAtoX7Qg1OfIWFpeEeBR5EWzRdcuAg
 nGPefDrblHOyev7v4+/cip/22SXW8BzodO5869HZfQaLjBAWokvQORBCJ
 5lfIau0MZ2i/G25FtQypyrB02wLN1zhIiG9uO6eLm1nXzFexFi8uDYWJH
 xMsKSgZW0Qz6Baf9B3A1bBp+trGS3kicIvcD2SP+LHf0YRxvWqGV5iG4+
 Zg8wv/I6Y3IkJce28PJ05kborPtuggE5I/tO3tMPoHjIpzksy/8JbiDrp w==;
X-CSE-ConnectionGUID: Y4NZzzk+QRasIdDLHCxZDw==
X-CSE-MsgGUID: paTXeCvvTEecFAFVn34faA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73360181"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="73360181"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:37:02 -0700
X-CSE-ConnectionGUID: c2SYMIP3Rwqj5oKB14bVoA==
X-CSE-MsgGUID: g8ZhmubjSgqLGBYgBD1YPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186324380"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 17:37:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:37:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:37:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFO+T/4jIveq8AljLfRNi7KkbJpaMCODCjc1gsxcGbRf9I/ZgsGUzzjbNLbG+nOPjhulCTOSuGpGgTZaRaq+YZOTmQgY60KGKkv4TpXTfTIT/8HtCLx9/7tF3ofJeDkARxrkrJ5Jse37NZjD8ICJc6BmfKU/0kpLi0C/DTkJh7CcK2SbG39KgYb7qy450LCozXF4p78fk3BSltAuzFEmf3r1WDe+pqhf1prajCPO0itYp7xH0Y9BVbnT6VjBCb6B9yhSIdkyatN9wH4XHNCCX3vEazLKyotwwMHSm29uvA39Z0hv1jLvFXH2zRQxz8dr00J8o9qlAcEHwKOrylWImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sgDKeMMDBJLTemiLDtBc2qwd2h29grakwQMPIyfUMA=;
 b=PpnR31+AGoD5jYXfWAZq13gdVLtIZDc3RQsHDCQ7xHMi+W7xoZAqmyCWgH3+f3ZK1ZaxcWJW0OqzozoAXhKtPgedYIrSO6/Kqb/69o0vEW9UFRxONtH/dbPPkDTHy2yDT0BqJCSfpqdSp3mgmsQLWUlIMMvuQRUL+6cK5r8dzQY80fISR+Grk6gYg4rOZDwg0uXQeF8geglqGdpW8Vt7in+Ly8oH3K+zmrTqK3wx3J6cS5MGoHRoWukeHo1pvBp3EFyvMFKWjoJZ8H5zRco9GpoUEN+2DGkpbeosX5i7xp8gxn2CUpUk3tgKDY0EqbQT2wPd2unuyocMhTC30ti+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6524.namprd11.prod.outlook.com (2603:10b6:510:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 00:36:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 00:36:58 +0000
Date: Wed, 15 Oct 2025 17:36:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/migrate: fix batch buffer sizing
Message-ID: <aPA+KJ6N7mlI7YsC@lstrano-desk.jf.intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
 <20251015141929.123637-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015141929.123637-11-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bffaffb-1469-48b3-443e-08de0c4c1d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p+KiiBedbI4jSxSFa7QT5zfwP2pAmOfFL1CZgw9brPnX17lyhNWap5atTgJ7?=
 =?us-ascii?Q?Dh8ZYZ7XFquo7eJsXsbCIT2++QFGsQcDMDTQpDz9cgBGZa4a/78bOnRhwSi5?=
 =?us-ascii?Q?gdfw6zGN7002cbGzqvOOnhjm+UxZ3bL426vo3wqAh0Y2uuCQytWc/+iQ7X5g?=
 =?us-ascii?Q?az73aG6bYuytbWAiDEgCpAJlliORn7GY2A1/f3mcx61f2xEY8nfQiGPfLiTm?=
 =?us-ascii?Q?dwDgeabh0BIuassPVp5mstYldYF/Y7RFeDrQJ3t4UP+G7MeXS5zGalYEX5cy?=
 =?us-ascii?Q?TTqTGfeMm+HeM9upQ2TiNIHAPE58skHnHoemxUAnTdjlju0aVCf5PfxsfvSN?=
 =?us-ascii?Q?6dVXq19I0ShqU8G4+bgGV3Oix8bAQMksCmXVYs6tNqPQU5r2Ji8V76VrGxZo?=
 =?us-ascii?Q?UzIFiqM6KkA0AC4iWyvq2nbH0KZqBOg0+ZYI7vSVXAWMKev71oUK/mTRFp3k?=
 =?us-ascii?Q?yHVGY2AJ/+ToqgO1Ew2i45t718BS8yMP8G63I6Ns0wrxzlIdR0CWWNordTu6?=
 =?us-ascii?Q?GGqccbH7bxS/2DWC00F24ADH9xUQ+O2y0fEU2SaspGBCEipT+gBDKFFp9n/D?=
 =?us-ascii?Q?yWA7yXdMXyQd29s/Q+zVWZ5nHHL47N0rHF4hvb5WlfV3r8UHXBu+2NWP3ptq?=
 =?us-ascii?Q?nz81jKTEN0hRWM7UjyyVWjo/iA30IB4UwC8rff40f+caHWHILemr7fklG7bA?=
 =?us-ascii?Q?DHBVE3MwE/Wk99IUzs2KUGityNN2YRO3II9ajCvoGYj1ebTqASHZ2Gt7gGVj?=
 =?us-ascii?Q?uoFPi57m42MopZK02HYdmVgkky6mKo9rpzWEbM6h/0qk6PHsTUDGPFt+D4Zk?=
 =?us-ascii?Q?vxfU+jem7WSifgTzF4EFzkX37iP5AOsutGmF2RIddatxV0Apwr1i1zGwW6ho?=
 =?us-ascii?Q?8j+QaAj9LyWWFO8fvJKlDnGGtOsT+o0Nfp6MdAmEfFQwrDRVkumG4QDlbL9E?=
 =?us-ascii?Q?v7fyp+DU7Qoc3RJ7cJ9D6VLPSdC0sDO03DIYGpiu4K+ymtD1fytP7Ocb0drF?=
 =?us-ascii?Q?HFskQIEKHf3S6Eq1YYkC+mXtGBg7QZaXBOy9WvUj1Ns6ZcZsvuUb2VTsCocs?=
 =?us-ascii?Q?I9gYeaJqzaEWH7lLqbELeMLfCYdfprnvUFyPL5YtCh//hes4Il66/Cbkrqch?=
 =?us-ascii?Q?RdT/9HwQjCTBpNCFZwctqMfyrRtwmLXZGL+vaHaXfT7NBmwLnr1YtQWQHzYw?=
 =?us-ascii?Q?KHwzWBIfmR3X5j6AuMKbZU2vowdYUuuj0i4VozKolLpkfE5ISaZOaKGL3ohr?=
 =?us-ascii?Q?lryE24VkF//4Qn4p1gXfhZAD8WEZKbYgeQ8yGg/AtGDnl6t0Y4PNs1Ft4KRy?=
 =?us-ascii?Q?M35UxAMY0A0jsYJSu1NQPSadIuIAHJcbM0LzujriYxc1jGDrzCEx06gKrpN+?=
 =?us-ascii?Q?fUkooqJqRA829uB5deExtIt6nDDZr7u8QhOp+XPwq341MNMsBiqMASQfviaK?=
 =?us-ascii?Q?bR1clIan2/cfiifBKfWrU+mhDU5WCN2m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pDiDHO2s5NQA5WN458veEXvF7scXuGzo16NjxAKdMG2xqBZuHAyAhIYlpr2V?=
 =?us-ascii?Q?gLf598PNBMwJhM5aiWuQWi/JRTVUpP+KdRg86X2pYDxNq15Vk2mzx1xbbkTU?=
 =?us-ascii?Q?qDHgHb91bxehBIOk17M9vhRyD+EHma/Mye0F5q+H/sAP8ydloHmucE1xwULQ?=
 =?us-ascii?Q?A2NlQpd1IdnXVfM4LT/9fHQwCTnNjyt/DPYAKRSy6FavvIUO/aI9uf6xAL2W?=
 =?us-ascii?Q?2k7F4EDsnP6c1NpLlZOkfzVap2FEHdMr8n9+48Ai0Yo8TaYUcDk6xOx5ctKK?=
 =?us-ascii?Q?7pmQ/jgnoeA+c3mNLkH9MngJYReGwyGsul1MSXV6Ww8ZKbNcMLpZR6fpaS2d?=
 =?us-ascii?Q?BE9ZWO+yDmo8tg8w2gP75I0td4X5Jvv38gY5KHPvA/Ezyzvjir18JSNnqXnJ?=
 =?us-ascii?Q?JtHRFT9o1wMnoRovKN/JVThesTTJgpZCKA3jQWfa0V5Q8vdinMAjG0j6eXOc?=
 =?us-ascii?Q?pIa69F0Kgrf7eYD41Wvt7KveXUjceRqxb4ByV5jZkjL4mME14+BcfmedVo0a?=
 =?us-ascii?Q?CDh0sVpXrATcMeF9kNXFgHpW43Dg7CJiLFSyQVBihir33rywFwm9oVmJkyub?=
 =?us-ascii?Q?n7iaUcRhpst4q9oUMP22Sc3Wh+3xTIE0IDpvmcGBexYRVOqYO8em1CiA+5Ii?=
 =?us-ascii?Q?PyUDD1dY5KZT9b+eV2MdgRHwG3NKkd1NvwBhQBJ3IfsA/H3Bb0NT4bHWeozE?=
 =?us-ascii?Q?zbujhGoJk35Bbbf7GLfI6jeZUzSO/TFnnq3+VgiUgXDjCcR1nHdDRJrKA7Wx?=
 =?us-ascii?Q?aHP+O5y2zgNuAI4oYRMaJalNtSrYYRHAWnGD6btApTSftcR/ZbZ8MBtGohsa?=
 =?us-ascii?Q?1R15+hbZhMtk6BC9MzAV3L5tBTnhfH5b01zklzn9qpLIAOUGkrqbTYliWFZp?=
 =?us-ascii?Q?gIMduWfNJJwltsJXTiAbyg+07+W3PTxeUTMyvRJzbIkWbTvdf/l7WVZCzk0t?=
 =?us-ascii?Q?+GXoAp6e8ABvyees9LYMZofMW+xn14IMyh0E5KuvbFntkFkXrnXWPitLmLHX?=
 =?us-ascii?Q?16uUnHxkjoETMAw/UGe/720RkvU9FJ1AGhJao8Tv+MOi0XiifFqFFKjrONHK?=
 =?us-ascii?Q?4IKfdw477WSdhsbKyxYwf8c6P9A7RrKZFfr37FESO4g5jLqNLFfsILfJeIfT?=
 =?us-ascii?Q?3Syd6yudnkPaZsAH/Hfgd8DPolON14shSkC79kJDY6bqsVcwMp86o5M0Lhtf?=
 =?us-ascii?Q?M3feb/p+3E8FFnVdyEzuk1mk9seC/fs5wK2k8Y7I95f559JmmqiRcwkH6K4x?=
 =?us-ascii?Q?C2HQC5KLYFL6h/27SHWcUUyTKhOvjpydhjlsWAFUWlfl2fThdjMkAFpiUq3a?=
 =?us-ascii?Q?lZIyDb1waBfFGt5lBZY85dSC6/U3cp8koT6864HYCDB12n2F/OtNHTtzrbom?=
 =?us-ascii?Q?FmT69/5zoHy5dCzd/sUHbpXGEY8JmfP5MoWGjqTSEJYwo0tIA2YIkKcEKTQK?=
 =?us-ascii?Q?w2dvdnJvLg+l2GDixaf9HHj2d9YX5L1vZXe8IkuFhRbAkX2VyKvPKDbm0Hz4?=
 =?us-ascii?Q?5+gR+rGUNb7KgWiGayjCr4g3uEl8nGqiRwuPnwq7J/VTx/3Y6RssajUjnr4j?=
 =?us-ascii?Q?PkzGFToyY+qIZ5lUymlcrCbBB8/aV/o6QSPyVD4wTHfK3bLT4Jry3VxvoyVh?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bffaffb-1469-48b3-443e-08de0c4c1d82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:36:58.6829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyxGK0XnSQMb3J6EH3bbC4Znal9IKKqT9GAYVyMJ5iQkO3RTxy68/7LihFQekN5aWWrp9UmxRdPSeRUUr7FdQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6524
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

On Wed, Oct 15, 2025 at 03:19:33PM +0100, Matthew Auld wrote:
> In xe_migrate_vram() the copy can straddle page boundaries, so the len
> might look like a single page, but actually accounting for the offset
> within the page we will need to emit more than one PTE. Otherwise in
> some cases the batch buffer will be undersized leading to warnings
> later.  We already have npages so use that instead.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index a4861ede6cef..6b6caeb5cdc6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1894,7 +1894,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  
>  	xe_assert(xe, npages * PAGE_SIZE <= MAX_PREEMPTDISABLE_TRANSFER);
>  
> -	batch_size += pte_update_cmd_size(len);
> +	batch_size += pte_update_cmd_size(npages << PAGE_SHIFT);
>  	batch_size += EMIT_COPY_DW;
>  
>  	bb = xe_bb_new(gt, batch_size, use_usm_batch);
> -- 
> 2.51.0
> 
