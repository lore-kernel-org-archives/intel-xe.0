Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903AC3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 13:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B1410EAFF;
	Wed, 17 Jul 2024 13:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tohn9xZP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8C10EB02
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721222913; x=1752758913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yZ9JQL/btCFfRKAE36pPkTgEmC2NNMCs3i93Od60nIM=;
 b=Tohn9xZPhxCSvPym3DnwieLxeMGd7Aq5K2nFv1iH9Y8jr1Gf2biWzjL9
 6lVDqlCFI+QYleoZoXH/xGVvywR7V0D9WYLClhplrWnS5zYm83hB1LOJ7
 RfWYhE3xS9Oqcn58Ik4ca2rDxNdbYULVFGdyd4dFUfYsnYQNBGAt81AZl
 Y9woBagNH4oyR28L+wVcenWLJ4HQAIN/vuzipjX39ZNDz4RjN1aNgI9cg
 G7mzrbDDzCVjo/e/TLmjqPIt8uLY4rxENQlYzztp8RO1PnxVA6rwcGGYj
 O9niYh35eoujE4S58iC+L1ebApExZwh7Q6SRnQdjrIkV+8SMQr6TDtda3 A==;
X-CSE-ConnectionGUID: 2DVnFktLTt+eArXX1DFeQg==
X-CSE-MsgGUID: rOSQwddaQi2iYRsW5EZspw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18537184"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18537184"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:28:32 -0700
X-CSE-ConnectionGUID: YyVUUGvZSlyc/UPLZwNOSw==
X-CSE-MsgGUID: 6EmrKNyaR0yxOkIVbDzq4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="50135475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 06:28:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 06:28:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 06:28:31 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 06:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpyMpYKWQaBcW8tbCftNEueIwsrc5O94OAqbjIS655cel5La7vLImKb6zxPjz+uABamR2WlKAK9niY19L55gE9rJJiPDlPmSdAxqnDTfKf75N6qR8ZNfNR+1sxkQU0QyzaUtrYHy1PRj1MlhVYAYc4iomlR37tMxrFk99UrpcDDY9beVh9m0aWqGl3azkHDtrAvzgkLjLeZRLoq6QwSXmYW4tcO9ayQEh2F4rNBZNVE7HSz+OtnWpjWVGiZ5oyly0V7sOYKxeMch+nw3Aaxm13+8t4utGHyjf25yQ1RGdat2IwYlVN0iN9yWW+EMQ5CIgPPmHya10IF2y3SrTghKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkgBS97gh9MgCx58XzEcg6DqRyKP8LRas2qLViRPIV0=;
 b=Z+8BAd1Bx0wdjQ3mid+n3psWvQ/WC0mxR/tJqCpWarA8meLso4thVAFSaKMK4YLQLNULNQBumW0ENo582vt11vi3As6v5TWUwz/EPeAhIf2w5DgdujM78ozKQ0sMivVnJGG82IL7296sD2F2DqYHVVobi42rHRIJ9ubuZmrbZtypF6Ovpn7/8zvqW3ck4I2gW7AHkYz/SXR4E7cFjwqVlqiJ1bk4TmXbBtc8YXv8pTgDr9MvPFH5sq/d5enYZZQrgKraq60hDHMZpzZvphlzGEbiHOaNdWTkkMypBwlKFlDBQBgcigVoLnogorbARZPweKZKethv3A3pB3h8ZCryRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 13:28:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 13:28:28 +0000
Date: Wed, 17 Jul 2024 13:27:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/pm: Add trace for pm functions
Message-ID: <ZpfGysLNAUXfryn7@DUT025-TGLU.fm.intel.com>
References: <20240717125950.9952-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717125950.9952-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: c4cf08f7-25f7-46ee-e3bc-08dca66457b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lTCo8TrSkzohQUWCH7JYyloeJpwIs7s1NDziCWI+gDhjyUPS7j8duawwZyME?=
 =?us-ascii?Q?KbWz2O2FWTI7qBysi0CUekeQ2jUw+S2mruT7Se5qfWCHJUj2SB6qXXOEltYo?=
 =?us-ascii?Q?6pEWPLNWwy5tCmZjIG6CZgIp5WQVcA35m+kkaw3AD6rC0Fyx6ZOUjyoucVYp?=
 =?us-ascii?Q?/MrOiBsYd8jKqG2tEHecEi1qMQAfDXduAmeWQaeiGFK+uQuEuQWtM+OgyjhH?=
 =?us-ascii?Q?DTpshw59LfHOBd+WLWa86OoD2Dl988d/rwnIphw603qL0VKQQ1L7IHHwWC11?=
 =?us-ascii?Q?bgpelN8dGKf3OmDlxG6CmOXnI4Ae/a5PiQt4jET8gT4NccYhwNW4wZDjRER7?=
 =?us-ascii?Q?xWMX7G1SdGpHTFGcJKzC+dhzs74k2EAmWn9a2/+VSHjgzKqDFB6eSBFCrh82?=
 =?us-ascii?Q?W0V/DQXv8ALrxFK8yQu2TGn0tvdPsjyy828ibimpwS/cChFShM7eFtHWgboo?=
 =?us-ascii?Q?vUY/vhOAgwoK+sq7sRlhxPB4LWEi64DbTjAZwHUWWFZwY+Ak5lyypwpKLObY?=
 =?us-ascii?Q?i1YOvYeBoucS4wEp88cY1UUysXUVny/DU5POeF1UebY57HdN3Geq+V0d4QPm?=
 =?us-ascii?Q?TKEyImgPfJ3v6RfRxn6RoZJfO50QZWoJ0V4WseRKG9eIK6z1ZDNGwfrKUoXB?=
 =?us-ascii?Q?VJOZ6GVNQ/d0MFnrXBlJ7NAhA41XOEkJ+8KB2G/uqk/vCCDEy/3zL0MVPYuV?=
 =?us-ascii?Q?PreIWEqE9rvTfE4W6uQ1pooycIpzwoXYYAHpv/3JtquUSFw87wwuTQBwlkQ3?=
 =?us-ascii?Q?rlZeYiqRS91GerTi1k70rNZkW2GQE7/HC4ANuMrg8ANd8mBNMPjwR4sQk4cG?=
 =?us-ascii?Q?4wKQ55/+JAuxNn3QKf620rKfiE5lJLot7JfN1y+9G8xi87Dwz5iDbgUQSR61?=
 =?us-ascii?Q?jVhIAYMXysWn3h5B4ptoZX0Jb+yrU6nJiMRvuWQ4HncTXiSYm9WGSL5KUp7r?=
 =?us-ascii?Q?Pfo3I+KcrC14yWP8VK7ucuOxKqHQWMp/BOCLkjLAPBKhRlCD6GxfpBpZ+hEA?=
 =?us-ascii?Q?/g23EYN3mV1Esk9B7urs28ywYRcmLc6gBgWBubLKdyQIlEMzW0/RsVv7bDf/?=
 =?us-ascii?Q?6AnysuMe054wQuj9/vwP7i/J3VS7vuk9VkQha92shUyq79+XbqKj8JTW9IWA?=
 =?us-ascii?Q?egYhn844XesZuIgDrtEi5FJaOkw+/zHf3ff9LBQjfXvp0SdbYcsJ6vH3Zh2o?=
 =?us-ascii?Q?T7vzXcUxWURcWq9m0d7KchZpR8i3ans4GnRRKGnKRrVkqc6Yq6xTVEz4nMmd?=
 =?us-ascii?Q?3Rj6a/Lj8fVVaaAiY03psxDYwN2jkCJw2Sd5ZoFPlez7fi/M6CYdyRGnmkOT?=
 =?us-ascii?Q?wwMJtzTglPHAuMX4XkYsqX+NLeX1n/+DZiyFYi99EbP6oA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AC76gMtUbSzJfr0EeSCbXKjzex2Hz/lb45d85oq92bgYql8yKIkKTyp01/Xj?=
 =?us-ascii?Q?6mEoMAwyspxUk8hSBfyPjYzBJT5nCNSDv/VK93ws2UqtobKlw1F2CBeYCbGF?=
 =?us-ascii?Q?YDoN95LCQl91mcXWFBRCkyVlR9CE+KFtIN9pPTgJ1px6f+TnwBZjAZfovF1K?=
 =?us-ascii?Q?mu4DbYARGYYXHtvtQcStNc6ruTAZFZHb4ZP0MRshLUEYKV8LCeeTeqUNlaTJ?=
 =?us-ascii?Q?BlpSDpeaW76T7RIVHBpR7VBNyatSDh8EE3ghmQFYU8tDOSwg8ROWki9fl/8W?=
 =?us-ascii?Q?rpjj1kW+bHcIXzcVpd42CSiWOvwPfn/GjLZDcW2NLdvYfgDwkkxtzpQ1RYZb?=
 =?us-ascii?Q?OoDBe+K5R7EG77kR5aPC6LJiQkc0qVZxd0fES11TF1xb1sKk6SEWpVv+EUZm?=
 =?us-ascii?Q?9keHs1Wdj6AuuQM088s8EEkFk2oIGo2K+Lf1Mm8K9e6GcGOXoZAJ5laojRpA?=
 =?us-ascii?Q?VPVFFsk1enGdNDEv22UHX67WWNHftR6yKX2J7ta1D0j4b5xa1PcGOUe79/QD?=
 =?us-ascii?Q?CLa5i4QentIbIdQ5UrMQ3mayoDmznfz1W+iqAeWSmBFJraeKhUVHEbUpUWzJ?=
 =?us-ascii?Q?5taH+JGufzXpbzDVwHMOQaenKq7++RhckhEPBvlUwbZAD1HCmCp1Og7FGPOo?=
 =?us-ascii?Q?sscqEo6z1rtYZDjx/7QVfjKz7V5NBOPHuhTC4P4/Cod1EFduv1sVqU/ZoLkw?=
 =?us-ascii?Q?4PxmQ/baR1Zsugll6GCiRHwSTlwcB0IGeXQtTNAQe0PxHe9HxXLGid6Dj5Sx?=
 =?us-ascii?Q?8Tv1uTM+FRv8TSxsuSV2x1tlNvSEwkCyk5kiJon7Ku0E0OAZl5sDLOaDrKYf?=
 =?us-ascii?Q?7rpKTMVOCMFYNMEZNvSlcShydgCxZQ47G3rvu+aKDBV52X3khNVMSgvZZ7vn?=
 =?us-ascii?Q?Qc+8DInU3AppyC8qsatxsrVXgjotTeFDLlZlcxinwfZHxYDBLzrZW+UNLnn5?=
 =?us-ascii?Q?PMu2GK3oHvVwy4yC1iOZfEDGCU7RqrjvBNanCgCe/NBg/MkFmANxdvCL4z6B?=
 =?us-ascii?Q?pV2qdbm6dH2f38YWeL+6ybU7bYVcWpUc4sb79H2FIBBDZM0S/6yw4Bc/MSft?=
 =?us-ascii?Q?H2L8OEM5g0XUeLhs31kgC7jN8eXI93WgmsdlBfxKbue7n+V6oeKUeqTvzyJ6?=
 =?us-ascii?Q?Xtj4nxSeHBWHAxghY/YgtXf+q+CFAHHgeUC8QiuJNZdrStdyIF4qg2zOxAp/?=
 =?us-ascii?Q?cyYffQ1l4J9SO3adBdJ9dbZ34cYFb95sjJStBIf942j6aWQF9zymfs/sfy5w?=
 =?us-ascii?Q?SRjSyFU+K5GvRuklOnUEozgoHoI89QlTW7Dun8ldMZF3tMMA8bkO4+zoIKAf?=
 =?us-ascii?Q?DK+xPE2QjfOXs6nuoYUcmsGYrjnGO8t2wchHoV2FM1D9S1HYXx82UcbA5jJu?=
 =?us-ascii?Q?F1IRS7F0kYOY0irgQk8Qdb3BSBFGhmadjpD+ZpOMNK7Rd3pK0QnjbybWboto?=
 =?us-ascii?Q?/ljrOMClHmBH4A+T0AxrLH87Y35rGa4FLoKpDIFEb8Fe6hhEpA1xcs1oSgej?=
 =?us-ascii?Q?1OOVuOUcowJmfXmD20EZSDl2z8H3gyDQE/ciSPRjFaVkR5RowWsNbTBHjGVV?=
 =?us-ascii?Q?GD7BaTr2VDilkShQZtpolBGoJ3LonDlYA0EBGRhDOZBpxKrF+jcOH8QZIb46?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4cf08f7-25f7-46ee-e3bc-08dca66457b2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 13:28:27.9265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKZn2kZBsDDVAwzj+u1gaZ0LJhHNSuzHpWF0daJMThWZemPatgNvR0RM73O7TtTizUvF0Q+WFxq1L16imobMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
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

On Wed, Jul 17, 2024 at 02:59:50PM +0200, Nirmoy Das wrote:
> Add trace for xe pm function for better debuggability.
> 
> v2: Fix indentation and add trace for xe_pm_runtime_get_ioctl
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c    |  8 ++++++
>  drivers/gpu/drm/xe/xe_trace.h | 52 +++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index de3b5df65e48..9f3c14fd9f33 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -20,6 +20,7 @@
>  #include "xe_guc.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
> +#include "xe_trace.h"
>  #include "xe_wa.h"
>  
>  /**
> @@ -87,6 +88,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Suspending device\n");
> +	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_suspend_prepare(gt);
> @@ -131,6 +133,7 @@ int xe_pm_resume(struct xe_device *xe)
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Resuming device\n");
> +	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);
> @@ -326,6 +329,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	u8 id;
>  	int err = 0;
>  
> +	trace_xe_pm_runtime_suspend(xe, __builtin_return_address(0));
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> @@ -399,6 +403,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	u8 id;
>  	int err = 0;
>  
> +	trace_xe_pm_runtime_resume(xe, __builtin_return_address(0));
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> @@ -463,6 +468,7 @@ static void pm_runtime_lockdep_prime(void)
>   */
>  void xe_pm_runtime_get(struct xe_device *xe)
>  {
> +	trace_xe_pm_runtime_get(xe, __builtin_return_address(0));
>  	pm_runtime_get_noresume(xe->drm.dev);
>  
>  	if (xe_pm_read_callback_task(xe) == current)
> @@ -478,6 +484,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
>   */
>  void xe_pm_runtime_put(struct xe_device *xe)
>  {
> +	trace_xe_pm_runtime_put(xe, __builtin_return_address(0));
>  	if (xe_pm_read_callback_task(xe) == current) {
>  		pm_runtime_put_noidle(xe->drm.dev);
>  	} else {
> @@ -495,6 +502,7 @@ void xe_pm_runtime_put(struct xe_device *xe)
>   */
>  int xe_pm_runtime_get_ioctl(struct xe_device *xe)
>  {
> +	trace_xe_pm_runtime_get_ioctl(xe, __builtin_return_address(0));
>  	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
>  		return -ELOOP;
>  
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index baba14fb1e32..1abdb30cb7ad 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -369,6 +369,58 @@ TRACE_EVENT(xe_reg_rw,
>  		  (u32)(__entry->val >> 32))
>  );
>  
> +DECLARE_EVENT_CLASS(xe_pm_runtime,
> +		    TP_PROTO(struct xe_device *xe, void *caller),
> +		    TP_ARGS(xe, caller),
> +
> +		    TP_STRUCT__entry(
> +			     __string(dev, __dev_name_xe(xe))
> +			     __field(void *, caller)
> +			     ),
> +
> +		    TP_fast_assign(
> +			   __assign_str(dev);
> +			   __entry->caller = caller;
> +			   ),
> +
> +		    TP_printk("dev=%s caller_function=%pS", __get_str(dev), __entry->caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_put,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_resume,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_suspend,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_resume,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_suspend,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
> +DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
> +	     TP_PROTO(struct xe_device *xe, void *caller),
> +	     TP_ARGS(xe, caller)
> +);
> +
>  #endif
>  
>  /* This part must be outside protection */
> -- 
> 2.42.0
> 
