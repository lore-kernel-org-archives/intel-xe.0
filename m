Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09307C3ABDA
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 22:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B378D10E047;
	Wed, 14 May 2025 22:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkG6uo2D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0B410E047
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747260200; x=1778796200;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2UiwUXGW0wo9TqHG7ueSflSiUXm0R8jszuK73IA1ZfI=;
 b=mkG6uo2DtCXgYZS0nXsktzED0X/juLADoJmSLhlsqUqMxtLb//j5mVCH
 sb89eX4qiF4vnWM0u37+teLSrf8hNLquHtpLw0V8VtGkoc2Cg8+5yihLZ
 SrY/olmpS2j1pXTA9xjvpmLNWmQsOrIl/HSWUDFKY548WZ3XLua8W8/3v
 nErk66oNLuxx+s25UQmnTgCObrcWM8ShsAr/dJoGQLNFBi9/uOu72WlcY
 Z2GWzOc2r4tawsVpidZMpeiAk3bBWCf/uGZnTZMuVdgwT0CqQQb3SaHvp
 hQdtUdXpxqu/BTXBjbOvMpPvWZp0p4Px009qYIO3E4K/shsI5tBnBgglc A==;
X-CSE-ConnectionGUID: fCdtmrjQRI+hlN+zhO2J5g==
X-CSE-MsgGUID: 3g3wm6ByRvqxmEuJXzKWRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51817941"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="51817941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:03:20 -0700
X-CSE-ConnectionGUID: YuMy+emxTN+T/duZLWUksw==
X-CSE-MsgGUID: EQu6HSBQTIiKnwN1xF2eUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="139079082"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:03:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:03:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:03:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a//abZ7qSBjrTslUg2xKAYmTqwlG8yNxPI4GqW9fvpJ++RIOyo7iZaPBdGPDs6dHQ1Q6zc3xpRRkJjPfA6uGwgH1+wQ0oVw9Xziw4zuFhf6C+5Wq0hheJ/vDLPEPQoSxAQWSfIyPtfeLKtYojBt1DeKAqHt+qaTGXjiH4cTirIvQOI3ifqsjNAdWn2gxj7lpMxuyQxgJiBKnoou2DfoOKfXB83Qn1v+gcbqxliNiWMvoVULZRbxAFY4ultyKSpQEyHz2U9+sD3BkATxS/V2wlxD1gWr7urmqVrpYYYBzabodLaCY6kTEoM4gOQQtQ+Q6tbfu/tOhAl8UUCH/PYnyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgGceCYrMdub45DUsUjmZeW321SIHfHEpnrmkXBHUfs=;
 b=sOYUtr3ZvPaDuY1KHeRn7lDx4POqoyVYSD3p2CxhjMgJqDyf+aBGl0nffExCDYOKrvYAVO01I0CghhtjsXfvLRoc9InE4//gsuGgHFaXKJHMjCe2mK7vPQ3qrWq9gPnh6BJmWFrrZP5NM7k5p0GZAtAhYhivGRrYvquuGpL+hRgsE7wN558U583ElOmnuRlm+3BFpbFxqyQUaOTCTWe5vqz8LYavDYiS8ee1HunXOJPXBZwWuHgKAKrkAzfp1GYZxceLVrVYhA+1EeZEsj83jwcnVy7MaGArvGhCMQfRO1U3mE0Q4uvOCubrvllNlCs+cyP8Czh2yV+g4z4aJtWlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9323.namprd11.prod.outlook.com (2603:10b6:208:565::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 22:03:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Wed, 14 May 2025
 22:03:17 +0000
Date: Wed, 14 May 2025 15:04:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 26/32] drm/xe/madvise: Update migration policy based
 on preferred location
Message-ID: <aCUTfM2cmQktqMN4@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-27-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-27-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:303:dd::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b2f79a-972f-48b1-cb79-08dd93332181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtwWt9xwDRLax7FQ5FzSJmdkVhN/xyYN22aKgYbfBFm82tnkAHRio5N9Y//9?=
 =?us-ascii?Q?jiqWdsSFRh6T5IjFI3+x4rz405OyY93cV4LuHLFhYE/x45hNbfrS5bvBEXTk?=
 =?us-ascii?Q?YJ8jgEsEwvK43WSBmMFB2qJQiLabKf0pYHZNjUNsJe2AySV1enZrRaII8Uo9?=
 =?us-ascii?Q?mllzLYgMbehpeENX+iK7qVibtMmFUqJkvwSNJnyZ6kfyDI0zn69j9sw4I97s?=
 =?us-ascii?Q?6cLqdoYnNJUnP+B19SHEx/5YKhlv7XSGbzZupKwdwArqGVJPR8Ujnn8NZ9+O?=
 =?us-ascii?Q?1ulqU+nlwiUWemK9g9mAbSa0ZaS1+ERE+kPO0sqemcz5YTNNushuSqhV8vHU?=
 =?us-ascii?Q?vjXcgocccTuNYhS2cqb4WHHM/VbBO323SW866vlL6ufN9kwfVYIVK6dvZKe1?=
 =?us-ascii?Q?HwSqCZ83nn4P/AxR7yg2QP1twZHCVRfLgpZG6JskuK682lo0F+W8kT7Gxh1a?=
 =?us-ascii?Q?RPWNf5sqgSmiOZzCROSR2LCKReXIWd9ZCRerraI8qyYUKRYuxN9IReXdms0R?=
 =?us-ascii?Q?9F+di+jkbGudcU/o7zyra1iKvaqmmb8Alatc74RKwhN+8nSyC9zngjxOby+j?=
 =?us-ascii?Q?iXoQtJseMKgKzo4LRv+2MOZM/47GLmam3OWmaj4CC/mOAbzQ+P4AccnnNVA4?=
 =?us-ascii?Q?FyWpemcz/QTqV6RSGkV+zHVjl2JwRNVAgCn2uRltL5ZqCI8wj8ujbU8dmoQc?=
 =?us-ascii?Q?REPRaapS8l3/vMte6tTj3AfMKdvwaIDDIZlFxBqiO2aCaHtuPSoSNSfeaRh7?=
 =?us-ascii?Q?U0sYrqmso3cVxqGYh8mwuhsfviHpaoDD7HRj+QX2n2hNVSlfq8JytnI8UIhf?=
 =?us-ascii?Q?f9ofdnoofRcgLyq9EWQPCWK9aLbPEqEjYeJZ8QBxwgsF6F/vzbjwmVjao+HI?=
 =?us-ascii?Q?r1AZUg/ETg81kJVowGETis+qnPaYl1k3tsQvF3xKn5LRMbQ8qihPvu0a1hEP?=
 =?us-ascii?Q?MmDLXYv+sbyq7OuFY8sB4P3J0ppX23kCrDd1q+mPUd6WhZEYfUIWayO7oE5f?=
 =?us-ascii?Q?urLa44pFMJY59oxfSLWgIt/3TWmBs3OrspvmSAModYwpTigSePgXBzr3JBOU?=
 =?us-ascii?Q?CkWEwl8AjQcBUA8TfldCbT5m/yvNW+tg90xDMCLRzzl48CW3gv4qy5Gzx8nM?=
 =?us-ascii?Q?syzrLK9Vi6ZgNIx0dMLNdXXepUevAXKxXykm20s+q696taPqATqw7GYxCC+T?=
 =?us-ascii?Q?/qXbW0zotjGZoAQRClBmU2KZsE4Tz06nfo92bPI5W0iXmsLO/J6kJWU9tR4U?=
 =?us-ascii?Q?sVq9/0LbmGwLhIZEn0hffjfQCC9ezFAzlSuqyz4LQbJjXwM6oDx7HiO61jSi?=
 =?us-ascii?Q?sn3rCvddG+Ta3mxKWGhBQ+gQOmIb38HG7PHtDRrTYpLbyKmntiNrZJUgXlg7?=
 =?us-ascii?Q?5HkafE0RdNCr9t+946YGCYOukx5HENQRojOPVUFD7JQazTVu5tc1c0+HXgmR?=
 =?us-ascii?Q?JmCnclKn1io=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/3P4M8ngrefRpzIHoO9CipwOfxSemdknIEXDKBBTsMyyywoaygbwwvJ1pCy+?=
 =?us-ascii?Q?uYzqrGA//D4576R/sKHRbnl7luEfkjPBDYAvpfMvalfGKYGhgpjfY5Epxvdu?=
 =?us-ascii?Q?KsYjumfLfzQJHWloectAOHw3wnDfW6mXpC7TmqXWIpzJKVLCUQoMub0O3inx?=
 =?us-ascii?Q?IerjZvzP2vlPiLSnsMSS4xkIcKuZ/nhj68UzPTytISog5dCgAFIWr/eFkjBq?=
 =?us-ascii?Q?m3YBCHPKnPgNxAncs6m9SmK1rFJyj6AmzAaiNQXuFmJnd8/MJ1KCPvX9zLRS?=
 =?us-ascii?Q?G66tybD0sI9CwQEtr4aHyGpna5r3/1zSM/Vd619YM/FWR5EbVcoOz+fh51Kq?=
 =?us-ascii?Q?nf0O6ofy1KKs/Ah00bNABTsmxFQiJWo9YCPnAgYwByUYYjVJRusxhIZF/ccA?=
 =?us-ascii?Q?yCitF1wBSjPcpJHm3U79VflW9LqKWfBg11AvtVTWODqTd/DEECGE6szKA4WN?=
 =?us-ascii?Q?o5Ofh6HJjq0x7ft2cJi+eD2pajbOFOgxFD/6jgZTdmlYFK/JQW54yCmmE5CS?=
 =?us-ascii?Q?f/5cLfACMnpnrshFAnrcETl9KyedzyEV26noSmhWd0VDAb2P+dA5e+sMIBWK?=
 =?us-ascii?Q?XSipCSC4X3LwMp5rTjvJtRBtyBrh2zmrG1hRL5sKzHRhIAPtSLd1Q0+arU1C?=
 =?us-ascii?Q?Ahn96HWSCrZMZnqfiCNErmHg+n0m44eim7rWSXF9t5tO+FEb9mPdliHaHEeX?=
 =?us-ascii?Q?9dLn4Dusy7S1ZGvNx04bl+yPMapcfG2RqISYIgwwbgftE/BH+tfzv75P3Q/D?=
 =?us-ascii?Q?vVK2USJSbnGkB/hVnsaxeG8K2FVZnohGqQK0+Rk49ta+7alhN/uhPU+9MMpf?=
 =?us-ascii?Q?HvRgfiRUPVAmZin9HVxTFT8GyBH5Im/SFSFKVV4NmUddwAXRkXROpkJ4Lf+R?=
 =?us-ascii?Q?4IGzARZqRn2Q6zbXeb3/yd5syJhs0GveU4ou4aXCt27MO+Vux1/s4RiBsztM?=
 =?us-ascii?Q?CbyuInfWXmj+J34Ng02SzDvPhd9FsWzKy5m/W7jXSHTgbNSjd17Tzh5PGOiI?=
 =?us-ascii?Q?E+Daji7meZRwN1H2XTXzBRIqpvaXElRJH3NiHyZ6QFLMoiNwOObNg3hZW+DN?=
 =?us-ascii?Q?lbZzDp3otCsQaVKxbhvL79SoXhB0waD0HAnL4pDf3ePL8FNFoH8SAEbxrAED?=
 =?us-ascii?Q?jrubMydBWSNakPdiOJ7oH8wauhtfVw8Bg8tFdHrJ0wsgX5ck/TrxZIWVKKsT?=
 =?us-ascii?Q?yWK72ptSAbfk76CPU3pL4PZiBvBLb6fdNfAxGYRFV6TNwCs158KBjTajHcPZ?=
 =?us-ascii?Q?+gySPtzU4Vk4avd7PmUVbdNAhyjTfINBTOsk4z1OeLzSL6TyQsbdlZ06CYnQ?=
 =?us-ascii?Q?3/fDNDuBUA4Z1x9UqCs9/gzz45rBfIa5XnPVrU/12rtQPyPab5rKAWNB+R2L?=
 =?us-ascii?Q?iM3bw4r5/G12vYQ2JbrxDw4i9rYr8SmnSgmI4DsZdr6PM8VK5Ft1uBrB2gj7?=
 =?us-ascii?Q?xvuyNyi5wzSd4uxaWDWYL3jbJzRPmjHNqRNT1DYBappTHu87ZvpIPh+DdV5m?=
 =?us-ascii?Q?9Umzw6ZYULBjGRlOlZMWiLY4phiZvnnopVp8AFusloGev5FZD3E4zCykcODl?=
 =?us-ascii?Q?lC0hyw3mGAePqY+u+aDZwFQYejFurRONl1Gndvtq6JnPEfOyu+vd2CasZZRx?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b2f79a-972f-48b1-cb79-08dd93332181
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:03:17.2991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMN4HbaGkoXhODjcITUQ1riV7CfjZgRShSjTBH8mzGoTO5cg4rqJTHcNIEYOrtUNoHVPUGqYnUQxc5i2yBzv/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9323
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

On Mon, Apr 07, 2025 at 03:47:13PM +0530, Himal Prasad Ghimiray wrote:
> When the user sets the valid devmem_fd as a preferred location, GPU fault
> will trigger migration to tile of device associated with devmem_fd.
> 
> If the user sets an invalid devmem_fd the preferred location is current
> placement only.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c        | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm.h         |  3 +++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 20 +++++++++++++++++++-
>  3 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d40111e29bfe..60dfb1bf12ca 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -765,6 +765,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>  	return needs_migrate;
>  }
>  
> +static const u32 region_to_mem_type[] = {
> +	XE_PL_TT,
> +	XE_PL_VRAM0,
> +	XE_PL_VRAM1,
> +};
> +
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
> @@ -796,6 +802,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int retry_count = 3;
>  	ktime_t end = 0;
> +	u32 region;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -820,7 +827,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT");
>  
> -	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> +	region = vma->attr.preferred_loc.devmem_fd;

Mentioned this earlier in the series - you are assiging a devmem_fd to a
region which is a bit confusing.

> +
> +	if (xe_svm_range_needs_migrate_to_vram(range, vma, region)) {
> +		region = region ? region : 1;

I think the default (region unset) should be the VRAM closest to the GT
of the fault.

> +		/* Need rework for multigpu */
> +		tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +
>  		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>  		if (err) {
>  			if (retry_count) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 4e45230b7205..377f62f859b7 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -220,6 +220,9 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>  
>  int xe_vm_userptr_check_repin(struct xe_vm *vm);
>  
> +bool xe_vma_has_preferred_mem_loc(struct xe_vma *vma,
> +				  u32 *mem_region, u32 *devmem_fd);
> +
>  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
>  struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>  				u8 tile_mask);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 7e1a95106cb9..f870e8642190 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -61,7 +61,25 @@ static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  				     struct xe_vma **vmas, int num_vmas,
>  				     struct drm_xe_madvise_ops ops)
>  {
> -	/* Implementation pending */
> +	s32 devmem_fd;
> +	u32 migration_policy;
> +	int i;
> +
> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PREFERRED_LOC);
> +	vm_dbg(&xe->drm, "migration policy = %d, devmem_fd = %d\n",
> +	       ops.preferred_mem_loc.migration_policy,
> +	       ops.preferred_mem_loc.devmem_fd);

As mentioned in patch #27, I'm not sure this debug info is all that
useful.

> +
> +	devmem_fd = (s32)ops.preferred_mem_loc.devmem_fd;
> +	devmem_fd = (devmem_fd < 0) ? 0 : devmem_fd;
> +

Why (devmem_fd < 0) ? 0? I'm not following this.

> +	migration_policy = ops.preferred_mem_loc.migration_policy;
> +

Mentioned earlier in the series, I'm confused by migration_policy and it
also looks to be unused unless I'm missing something?

Matt

> +	for (i = 0; i < num_vmas; i++) {
> +		vmas[i]->attr.preferred_loc.devmem_fd = devmem_fd;
> +		vmas[i]->attr.preferred_loc.migration_policy = migration_policy;
> +	}
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
