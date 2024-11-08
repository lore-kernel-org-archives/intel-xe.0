Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2E2D64087
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 20:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4AD10EA42;
	Fri,  8 Nov 2024 20:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ah0p6hRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED410EA3B
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731096786; x=1762632786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FiDk85ngV5OLwIxl/jBanH8sdI/SvMq/E6ZPwfPVzA4=;
 b=Ah0p6hRWS/aoh65Ugh4k8xb3m4NWeh6peyx8CQiwjpjdiTBmUyU3+g8z
 Hyozzv33/VIIEmvjqioFRrd5v/JeKQTu3VFDxeZHAMPUZP+sn81Z+XFaw
 iFb0XTbMrzteRATwaLr0BuypnHEvNXLeDMUH4K1CvDTd6DmPa/7qRyCx+
 pWA/6O5w6wDBFL4E7roG1MySUlMT9CMNCtiqncrwfXcNWvdo4H8v4tyk+
 lBC+5FssKBTQOEFKu0yYAZ/R0XQd4zhwRNZjA5ZH8HokXtH+aTqQYQnCj
 UypZIBdrlZ5deVB+QTWVtF2JYzybllD6TllQmla8nRcl7OYnMMUpMiaAA A==;
X-CSE-ConnectionGUID: 7SLvZJu7SgWBnRXI6xTsDQ==
X-CSE-MsgGUID: lwYyfl5XRDehMocdSCjjPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48448158"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48448158"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:13:06 -0800
X-CSE-ConnectionGUID: HYmC1d0RRUyBNDA6XivSqg==
X-CSE-MsgGUID: GRLfRxtrRcWfqWgFkJ8Kbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86083966"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 12:13:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 12:13:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 12:13:05 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 12:12:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3ISqwtQudRtHdf6Lk2hEXhIgBlFa8ha9Fy9O92Yl503BVT6KYnsIutQXK1rQy1hh7y//HHZXn75w3keYzm9Kb73IaYm9cP+FXViOi6nXBLFASM6qTkunxAH0ot7ySCoygicjPwoWdpr0n7sBoBYrRPTr9IbGQfIFqSRr5i184J2jcaUfv8gGxMuPTCrxjNt8wHAmDFI1OSZGkCDUmmlKrAp9uE7MUAfDF8kmVM/u/mlQjwmXu8Q+P1B7nALMduCWY9AaAC39NLPnSsa6rb7SLRRxwX/PJ566EV6GP6O2NEmkuelnJbGq8MTC1OJp2Bq5x1dnfVK0tssqTxJPFK/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m32Xzke4OhmtsVKDhXQHYSVUF3NzlfejQ8FHNzTzOys=;
 b=e8mfQggc2hN9+u4I74aAPjATBQktGIj9SIzxRTLgyG1AAq/QF2XQCNxw4wIjV2+Oge8qJrGM+v9USE7pUX5zbMIJwsFpFYGpC1c1o2c9RR4i+lekChEMqza/jqOwWX/7OnXpDrDTVRrau77vDXWia+FRYMrzcjEhJyCfPHS6laNSsyQOkfx/9lli6I2xahodbPH3p0VKXnSM8B5N2rm4/SK7Xdwqsldxk9h8Utkc5v555ehJ2SxZm3O57UIHY6SFAPlHxnvbtHLyZNNDpjvVddI+TdSm8Enl4sxXxwjccop7caTJDvyM4SNiJiB0JER6CinOX6Q7Qoir9WY+U5aD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 20:12:45 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 8 Nov 2024
 20:12:45 +0000
Date: Fri, 8 Nov 2024 15:12:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Message-ID: <Zy5wum_Gxfo8ruDn@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108174312.272792-3-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 765d7232-9eda-4a64-506a-08dd0031b533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3j2un6RK44YNioPqyzLsluthKecFqm/LHPDUEdml8/wyIh6p3XBBoOp8C8c1?=
 =?us-ascii?Q?eYWrMaboe8kgbLOkT5S/g8dnm3U8NgZacDiY+shtNH2cFypGVaoRpDanouLi?=
 =?us-ascii?Q?aEUEvwKQLu/iQQFTdgk7zkeMWbmc2BR7w5EbHTxi8hiY3Ys7IoBnr114DLIr?=
 =?us-ascii?Q?27SpT9eAULErsriMgpEFkqIXuOVaLoKeE2uOUdh+TE26nAR8QBFvwW81nhyE?=
 =?us-ascii?Q?uF0C1ucZoNFnv4zfZS4zlaIPEkGzzFKm2qwbwDU3UCfflPrUk+N5mPcsZfvY?=
 =?us-ascii?Q?Wy+GzgkyUQYIzpFASfcHVwm68ZGPmwD27B1Af8LZ7fJORyCfQhGuGPfH7QCi?=
 =?us-ascii?Q?1/798xDEpnsv5gzJnsKXoZEhPh9eEdAOvIqaBhdjfjm4FYw5D0Cd+4YrjAtv?=
 =?us-ascii?Q?ZLOdnIACyleXrJlqLQvFr8V+HQyqXsMiX/aAU4nIz/tF9QkAQ41l2g1MPLjr?=
 =?us-ascii?Q?qdnxQUjymLcDMG7ERiZx5l42MvccrhbkGvA2meMLKmtQGAb7GL3bmjEruZsq?=
 =?us-ascii?Q?lGlJRWyJq7c3fqC7yD63PZgYa7rCQgql9/2Bw19iqqYiEAuBNJVpwPtanije?=
 =?us-ascii?Q?YRfuJBUz76GLgdVgncuhDmRrU+zVk/5dwcnP87+xqyi4svzo4FnSViiPsG0l?=
 =?us-ascii?Q?XLaZGEfVC1yl4rShoczLsaFlBrJ34g1gmTQwVFrnoIaBunwux9+c6uGtlyH2?=
 =?us-ascii?Q?Wfo2AVXhO3/rm0rKLLUUKS6mq8Qc+qkkbUYNPn+7i/6i/0YyAPq+SSFwaSHJ?=
 =?us-ascii?Q?gDwhnYVrjJBbCqiqxo9UUsR+P5ZxGVdmE0MprMRXymlFamOLsppxOg5jKihj?=
 =?us-ascii?Q?K50StgAO09l7EE4++pw02k8fcv8vACfsmLH0B7/f0WR6hYZdQ8gxnFFWL02A?=
 =?us-ascii?Q?05hqAortuxpb/AH1VLH/LAFcuSFtTjzoJSjiBfjWMeK+N+h1FPzLeMVH7Y+k?=
 =?us-ascii?Q?o0LX96+tQOdjxJ1Bm36rG2Im9fKr6Kd6eJ38P86kc1fAEInDaqu+sAjEGx5q?=
 =?us-ascii?Q?TwYzIW9hBtOEw7atTYWqXsZoMBO3XsHtnNGz4OyuI+EqOuaNXHDh+UMxjpm7?=
 =?us-ascii?Q?ry3pipKuftnDLSH0nfMetMOiyuyotVKME3s5R5vWqWnw2R4px5VcUzhHBQT8?=
 =?us-ascii?Q?XorvcjWME3tjn896DxY+zUk+bJpYhF8HejRYZfDkSbFbBMfyIqaThNCoMH4Y?=
 =?us-ascii?Q?nv2dUavGtLn9ImZF92zFPR6mj+Zno3kcqgdJ+T61Mwf1S/HroA1b+Dg0DHJs?=
 =?us-ascii?Q?RYbW0FgNHnEPf+LLLevZ1z7hZWQ1+2vuHQX3udPukFrHeCU5qSr9j0tqklGu?=
 =?us-ascii?Q?5JeZQfPAxb8i6PJ9D3RE5TMA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pea1L37vuqSdbG9872CbaOOaZ6qBUN+YPRroQVqLFk3oIpdK5O3qdoIf2HQ6?=
 =?us-ascii?Q?BBTSieeJRa40v6YaS69ITw61C7fn7JUTkT2/L/Cb7CLd6na8IWKRw+VjdRaq?=
 =?us-ascii?Q?2pWwmN4TzTao3g7VDRpf2DEXExB3vGRKF8Sp8cbpQoxTfd6lxoGa5h7KYRPJ?=
 =?us-ascii?Q?hA4N7rmgGTMotS2QE7qTqexgl7Xwf76GmCj8je42avGZ+O84f33mUkfId+B2?=
 =?us-ascii?Q?4HB4WYgbPu5c41NmJviCe34aoUpQwThjvg/SuzSE4+Zjl09bTDdTqiWztMzV?=
 =?us-ascii?Q?hyHaTykXruc+SX2JYlPXFl85TRF+7+byZQF0nOZT5tDBK7Xrov5jcr7VQg3x?=
 =?us-ascii?Q?i4jqQ3Uo3EwjlpuXK2JahFccqpDOM0AsXKSQW8blQYIc5vhloLcWZPo5vhsX?=
 =?us-ascii?Q?kgzBfxf1Kze+0HPHfW3/JCxX6jh2DGcaTUW71h55I1Da7dBfOE4ebnvCBYjs?=
 =?us-ascii?Q?s6cmabHjSupKygNOHM/Vo6HW1KuegGdrXUs4K7KcsiDHfKUayBmsvEJUMU+6?=
 =?us-ascii?Q?WN+xb3nQLnq2qRf6o+nJNEl5HzVpJx6xREabp9ZSMsIg1vltbCKZzmy3U/u3?=
 =?us-ascii?Q?2qyDcLo7cmAj6iUouXN2MMhOcZedRt++u/CNBEeGiirxCkUdZoavwxetGrWQ?=
 =?us-ascii?Q?esxbvnFHrMZaK3VMVjUqauxJCyeKu/bpPEwXqvxj9FDyWR5jX5mTKF58/umZ?=
 =?us-ascii?Q?DDRNu1htbqBPbomtZy+lKKy24gIZEQTpsVDd7LW7TPNjqZlEJi6yGSAQSXU0?=
 =?us-ascii?Q?NYZdADSah3Wj5xGA3xkL1YscjCzyhu23+Nd2lqoNi7y6B6f7vu32J0oBVsJ8?=
 =?us-ascii?Q?q82SfOAkwjNhofoikO5jvj/5kK2OokCq04DgM7Pst85eP1FPnKQzLrydXc0u?=
 =?us-ascii?Q?v3rMEmrTJqVHVkZGw/eZUhNq7gg+OsvCYlZsFqzCDfqY7j5LKHZGBorXqOH1?=
 =?us-ascii?Q?2pS7ZWG0jDPOM+9Gmc4HXFabmCTRayU3IR0qx3PbAtVxIjwENbHI1QO8wz9J?=
 =?us-ascii?Q?kWx4R055Z0vUvRQPq6Y5d5jDOvINMLeTA2Usz9wQbUP6A2fF5OApi4p2BtsZ?=
 =?us-ascii?Q?FeSWuycYL943Q4MR17zF0Or1KMeWKXh9QIepyJtr1aeXH9LeqkvOQ5/Y7om4?=
 =?us-ascii?Q?XE63lrQbQQss3F43yDF0OMWiywThRKi7SKqmwqbDI7QEYMdK/dwkk9Sqv/gB?=
 =?us-ascii?Q?cZK+/M4ytA+dVk0HiFeAjMchCoQec1am3zfQmr1yHEC3eNo4n74d1omDy0Xm?=
 =?us-ascii?Q?w9+hGPjSdesLV4dHhPXEOUol6Zb7QECWYnz0qFtwchI6jozKicooRDtxxH+p?=
 =?us-ascii?Q?NxyhYZFlqL35DxH4VZ1zZKrLa+OfpOay4pBppNwPPUqHnfNpwZ0LXu61kyP8?=
 =?us-ascii?Q?01lIpfqcBBIWxdFuik04qSnVzkcb/+stL6K89T4VaM2AbfxAh/yxObJKakKj?=
 =?us-ascii?Q?71J9Aj+jI6235hMEVmuXLZSdXTPZSEn/aazv5ki5B4CLDMx9daHHptmWrThl?=
 =?us-ascii?Q?bXxdlmEzGWNXVnecvyf5RLb7M18mDZemLAsUs8H+FXNhunK+27NtragulwGm?=
 =?us-ascii?Q?7MlZvqAmD955rVo7GL6vN6V4tuaRLWIfbKtD9ZU3vafB1yBElgFmg6e1t0R1?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 765d7232-9eda-4a64-506a-08dd0031b533
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:12:45.3397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuKCelykdc9KqaqBMAPIpooNtDqV4iPYc8ADy7y16jtMpPf/PVp/0qbyhU4GlXsXqAUbqBl8yeqB/K4ITea92g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
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

On Fri, Nov 08, 2024 at 09:43:07AM -0800, Matthew Brost wrote:
> The ring is currently in LRC BO but this may change going forward.
> Include the ring address in the snapshot protecting again any future
> changes.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 3 +++
>  drivers/gpu/drm/xe/xe_lrc.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index e219657535cf..afb0f4f44748 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  		xe_vm_get(lrc->bo->vm);
>  
>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> +	snapshot->ring_desc = __xe_lrc_ring_ggtt_addr(lrc);
>  	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
>  	snapshot->head = xe_lrc_ring_head(lrc);
>  	snapshot->tail.internal = lrc->ring.tail;
> @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  		return;
>  
>  	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
> +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> +		   snapshot->ring_desc);
>  	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
>  		   snapshot->indirect_context_desc);
>  	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 9d64cedc4d14..a2058a501353 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
>  	unsigned long lrc_size, lrc_offset;
>  
>  	u32 context_desc;
> +	u32 ring_desc;
>  	u32 indirect_context_desc;
>  	u32 head;
>  	struct {
> -- 
> 2.34.1
> 
