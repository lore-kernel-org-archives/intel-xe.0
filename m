Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F116C369D3
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F1B10E0F7;
	Tue, 22 Apr 2025 15:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcDZR+A2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7159C10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335156; x=1776871156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WeTiV+azFM+W4jetsdSgxYNx5xAHO8V60ngVRBcksy0=;
 b=dcDZR+A2q1hXPhYMZx+SUePCzMd0DKfASXzA4OQU14wubXAeGmYOm23D
 0g9E9KIHsVc6wrZCPp8YEL7rrq/CrF2j3rzuWR0Dr4LguLuMZoYj6lL4g
 wqmBEbHOe3pqjmo3BbOGEygeKZ978y3okH2XuMjutwzlC88Teqd/JETWO
 qc265BjiLGkv/9RLqhplQpxSUQuhCsKam5aQoLB5LCfMcIQvXGkZnB6p8
 5KlYdpfrCjYMfsyKx4e7qSjOp8LMQmyFk16TMvADDnR+Mk4hfdDzVZzVC
 93EcA3u5JEd5CJr1Aq2KE4L9Rqg74UxUmFHQpCDxNCD1k36p9doxcT3s3 g==;
X-CSE-ConnectionGUID: 2cMmMy1zQoyOe3Bo7T6A7A==
X-CSE-MsgGUID: PDm/fYrjRzu0zfBNwjf9Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50729263"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="50729263"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:19:08 -0700
X-CSE-ConnectionGUID: 7wJjpJx3RUm1LPq7tVqQpw==
X-CSE-MsgGUID: 8natmKZzR/KCVFaXybhKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="155239752"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:19:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:19:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:19:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg1G8XhJ+CtJbUkTji2cjIfdh2Sx5KEZI2XT07rlHhy707uGNrRQuDxJrwMyRUSCNeWDJUd7HJlDTTmKx5vFaa15UbpikCwFq2SavlVY5RWzHLCkyRSjIhN5CgHpFF7p70krGycM4Cc03h9urDScbzkSIeA0vuNpbWhOKV9XX00NK58H2CCd1D4VzFxTKHiFa02+pc59yx4Qv6W36GptFTdIJXKrnsAt+122OfSYIH5I/9HFk6mvwNT4NBnJwxnxjH+0n7qT3hpSQZ0tyo1oDGFQHfDY4t7i3OF7nTFVq8bup0xHwnS+nEMOGEXR3B8iBxs4Cn2ZjywvgDzJ6OzOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGhSdax1RuymFR49ghcM9+hWQgmkNn8rKUrp0RDHPNQ=;
 b=cFFmK7wdVBBhjIajYVU8TTtB06faCyUnQ4FhDZTMoNv6kvSlq+UKoOJNah0kwBJIAs7bQPoVzoAyMps7FI82imIWECU/KfRFSU+DaVkwiJYGUb4AVKzpuMjUISomBibaIjKb/kuxSv5d8hFRvQomtSyTF+W+Qaxil6ujbs4lyklC3Yx7UJP3CE5evaSAK+1GApw4b1oFLeYTcv2wtK/z4YjV9z12HZz4tVQmfyfdE4NR0jQfIjrIJJWGANdBO35X3q9oX/5FlvgtC7qV8GYvn1xHBZ4uQMdk2LVNBM0POecYG/PYqqYJ1py2AfWtRM7JK6YXwHQYi5ukVCEdHc5dHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 15:18:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:18:37 +0000
Date: Tue, 22 Apr 2025 08:19:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gpusvm: remove unused pages pointer
Message-ID: <aAeznqQT/fOytLZI@lstrano-desk.jf.intel.com>
References: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422095943.1198393-1-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: MW4PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:303:b4::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a98d5a-2fe4-4543-33ec-08dd81b0f4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6vqyMpGHcoH/k2BTr0b2IuC9BcC/QmXsM2xF0HUkilgecXNYUUdQVqqMPZn0?=
 =?us-ascii?Q?ilcrH8Ye6esUJqCArLUf8b/nOywqna8AbS+4jSuDFJo21IiBJ87WbepfhHcz?=
 =?us-ascii?Q?PQkc5drI0la575+kHqKQatThWlmntCcwsIFGW802K/Akgx8pphO9yvdiFwXt?=
 =?us-ascii?Q?HsYnvXWxX0dmVivVuv5oIwGQlYy4DmVV8lZt3UYhpnEvNeW1t04fZCRED1eQ?=
 =?us-ascii?Q?PUF2kA/EAKr31n6k34STo68DnRsD4ShwlE+1Ok9As1RjfLp6zC/IRvTOYJ2P?=
 =?us-ascii?Q?W57EN6z/jtcYIu1iyfLMbqnHYRHaRJ5+yUs9PhLyqevwZQksgQMXQ/FhnFRg?=
 =?us-ascii?Q?TKgPN2f4/TM/rygiCyoUhJ8HdZVq16rSn6Gdffg7ATVM8Tu3oSXbXMu42Equ?=
 =?us-ascii?Q?FbaZhZCyHRZJLSxdxyvPIUm16GVIFft+kPFrlKvsXyBrbZ5hrZRONPCL+fWu?=
 =?us-ascii?Q?Xhja7Q52OAgoe6RmvtBEDNKr/MvJGnn5OMgPRpLYcU8j7ecDu/RG2wc02xVP?=
 =?us-ascii?Q?nNKHdl1Ik1ZN0L6xX0l2u0rUc8TkgnvywB/quuf5Hd9djInCZiymew8+3G2L?=
 =?us-ascii?Q?tJR5nm9TkWSpfp32Ie20008FvuSLccYaYW+yLbe9uqjZ409lChgGy7Y1EH69?=
 =?us-ascii?Q?kqzEI0rqnbWOAjhHxz9pIKAI1fdxOrlq86K/8YYFWAvAQzUN/9hWnqoDLGHq?=
 =?us-ascii?Q?JkQLEVGdtMD6nPPgTxwd9owsKCVqWMbNYP8OsGGXYR5PTTGUQeefKLFoqAQH?=
 =?us-ascii?Q?uO+hT2KV4hLhnrE4NRbroiw9D2soQXMcqHyYrBiT9PRfsQ9wsCnCsmcIyhBt?=
 =?us-ascii?Q?ZFvjFnpG8Dfyuh2pHO118t4jSQNFM+SgJs9hsZ7fMUxuvU4LTgxE2DhRUdJD?=
 =?us-ascii?Q?QJMW5ScHDvKD2Mf/+D+zhur1lRwcMVUUqvOK6NkQLLGj9fc3adP0R1N8l5YT?=
 =?us-ascii?Q?2jFtF8QKQkssXdMbsp3uaVNjVtr2d3EldKyzuShf5SiBabntbZC3Ot/aTwEv?=
 =?us-ascii?Q?OR8Aovl3rdwQ9wHe/PUEsLDeiRZFdUCM3liowaTOk8h9e/br4b4pG5JuKNcg?=
 =?us-ascii?Q?WO+GubwAOwaEqT62Mjx6mFFIm8B3q/5V6MIfQJAYu7o8E5IAAIDM7OzXFjQE?=
 =?us-ascii?Q?ODD6cblbfdYU5on+TuOiQPbzN8y+0UY8U5Xg0WNT4MRt7sTU1wRQnC8yhMOJ?=
 =?us-ascii?Q?O6JdXt6wyk4o2UwYoEW8nbAZ99E6lcyTrS3D1l+yRop+iV/GAwp1VylkjxIo?=
 =?us-ascii?Q?I4hdJ6RdBu3zyO51SwQbrd+R72CLUfeZA/H1Zjx+d0ej85ya6Goc9xPOuZRE?=
 =?us-ascii?Q?Jokcw9wdDKorDEg5Da8TAYm3snZOG5MCqhXPKVCIZBXMOO7izocz+WQutekX?=
 =?us-ascii?Q?hOVJo0UbWLkyp3B+3doLNSLsYOtedCEcMoJT+Ba7upaboo5NHJ7PFFZStvG+?=
 =?us-ascii?Q?FGYUaW4aZWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6NnGXMX+nFB2HUcUWsH0PuAoHm5v4wF+Tq6KZoQtwaYkg/o+yXXr4qwQQwAp?=
 =?us-ascii?Q?qwpWb8P7DAHNqbvkG07LQVaaQzbYf7MzcOZbJ+2PyEa1fwdQieQtTh6shZSW?=
 =?us-ascii?Q?Yebq7ikR+5yH+ms6kx7h/vzmMJB32C9NhixiriUgltDPcXfLtHgfeEdg+PqA?=
 =?us-ascii?Q?0lTIb+8VzUtIdu2cGbDChmq5nDgb00iL2taLprPhQCBtFGCrcX7hKvmOzlmI?=
 =?us-ascii?Q?5o/atZypfMOk82Oetr5reEi9xpMfODsskKc3MByuAzoNpACpudPeqCaHHLWP?=
 =?us-ascii?Q?6GZL753GZWGcP+xc6z0toe5t8V96tOCsNIyG6siSL4uxWsbh/O78YxxKV7fM?=
 =?us-ascii?Q?8QMYwB2oB1cP6U3EhjnKClNSKDc3GFGpB2zf54SX7VEM31DCaehTLQuH0D/z?=
 =?us-ascii?Q?igwzWLErlD3/4yBAkeE4NEfZaFLOBSDK5LJuMV8CJwL5s+ypyCqXTewOy4vO?=
 =?us-ascii?Q?zjHaoCZz4MiYGqNIuOYs/eFZ/bhcfhe+4dW5UhVdA4tl5kZkFNIGD+UmVsho?=
 =?us-ascii?Q?Pn7HvGCV6QCoZzpGy+e7+5nrxep0rr1tfKH3bCXCgGL6LkepZ4ScUoxQOuje?=
 =?us-ascii?Q?QB6EhmxtB+W0XZFQ/5GW0JpPsnGmHsv/r4moYYRkka3hzuGxOfaCTU0fX/3i?=
 =?us-ascii?Q?wkPLaScvG7iKIZeHqtJrVokxJ9xva3xnnTkPHRD44LIe+EHBV+vHfLkgM+yt?=
 =?us-ascii?Q?pC92duw1U/f3Y6Wsm/4SnZ2HKR4L3r+N9p2qMYBnFwGsTUOUs4QsKbStAse+?=
 =?us-ascii?Q?ehe0C2z6RWL48UWrWKHfTpWBrf/oMJz+086r5eYcRbmLrl2y+GE5T+D2xa4W?=
 =?us-ascii?Q?93b4c3s+kYGcZNW57Mo/GMQCwpWKpIo6sM+3Xwx3Y10DOAsov5NHbYa+D6oM?=
 =?us-ascii?Q?FbuiFdrLilwguXGXEXDweWr4xdFZdPQ1aVeqGhjyfQrIvUwxvCqNJl0yAAPL?=
 =?us-ascii?Q?Xs6DbiU7ERze81zVj5xeGwf+YSdXA63luU4w4Fsl431o0ZHAjV+dLHtgsFzp?=
 =?us-ascii?Q?eRVp2eNCQcTgucHqBH0sKaIKcEmXcne1r5OKxbWzf8rEWaudBjZcXyfm5TLp?=
 =?us-ascii?Q?eJOLtPdK67Dl/S3WC2mXoX+ik5wSgjNuHlq6A5BXYNC1yrHEajBpvcNN57J4?=
 =?us-ascii?Q?NAJVLKb6P/8N3mluxNxfzbyl/ZHBhbENUroru4KpYvWrJEkyTv7lzK893Hd0?=
 =?us-ascii?Q?pleLUOZ0jQy11/ZLS6HVRsa34CH3rZPrbEKoXC9Ni/d+9/Hf9yITm2aarBUE?=
 =?us-ascii?Q?iQEkSCLED6uwn6Yq1HIcCxEcjV0QjlYa7Om8mF2/pwpfV7uGv1sVJk1Lp9vy?=
 =?us-ascii?Q?V5GD1pUxWp+UQpCKOteN3GQR6p8KWPOi+CPeqKy2M1HW/opAzTO/ksbfY7hi?=
 =?us-ascii?Q?hNdT8J2AUs3G6ZJ2aHG5Na2hvMdBzLxRazteMQ05cwR+Bu9I/FilPeTIZ5BL?=
 =?us-ascii?Q?zlfY930uf9Bl9R1T4fyYg98bIbQsvdzKSFLn/U1S4wMPn8GIxodBmrnw2+1/?=
 =?us-ascii?Q?f14o/AO8/xvgA+DTXs5lTK690vFuurYFywn9G8eHtA/ExEMhQAaBTwXoSajU?=
 =?us-ascii?Q?toAZeOYr2+YbGsWdIpg9Wz7cCD7Fvc8tQsUpWtg79TVtpju+31FfRhNgoyz+?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a98d5a-2fe4-4543-33ec-08dd81b0f4a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:18:37.8130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUY25WWAyaxG5+owy/ZJR+F8EQ6fmSz0N+FNmKBZZlKDaJROtvg9Notu8pgutrY8OKE+EC9LpPXEUR1CRBVlQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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

On Tue, Apr 22, 2025 at 12:59:43PM +0300, Dafna Hirschfeld wrote:
> the pages pointer is not used, remove it
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 2451c816edd5..30408f2dd370 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1330,7 +1330,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	unsigned long num_dma_mapped;
>  	unsigned int order = 0;
>  	unsigned long *pfns;
> -	struct page **pages;
>  	int err = 0;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap *dpagemap;
> @@ -1368,8 +1367,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	mmput(mm);
>  	if (err)
>  		goto err_free;
> -
> -	pages = (struct page **)pfns;
>  map_pages:
>  	/*
>  	 * Perform all dma mappings under the notifier lock to not
> @@ -1444,8 +1441,6 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				err = -EFAULT;
>  				goto err_unmap;
>  			}
> -
> -			pages[i] = page;
>  		} else {
>  			dma_addr_t addr;
>  
> -- 
> 2.34.1
> 
