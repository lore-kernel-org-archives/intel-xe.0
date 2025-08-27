Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295BFCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 14:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0010E133;
	Wed, 27 Aug 2025 14:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayzZlfKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4210E822
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756303823; x=1787839823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UDy3Fzq5jYNdz8tYYyf1JHpz0aemROrxv59AguKe8Rc=;
 b=ayzZlfKxrxznVN875mmHUZ43GBIRPWW6HK++VKoo7qHRUZqGALpU06r2
 0Qp3M3VFu33YG1uxb8MK73LL1Aox4IuwvOacyxgYb3TzjmmBux+lH+oWz
 u9PvDaGjSdPH4yWL6uk3pYIO9kKN7jkwxc09pZVa39N6yzR2bmzbvoN8I
 sKUUFdTi41ZV0JIT9eZQqtPuGVyWgbhdiUCBxxxCSE2epcAvWRQUhC/Ow
 u8kLLafAfyO/b6L7o1FwB7Hx0OF6X59AFbeUfXJ+bLRGAQuxaKkOQBrvt
 E1nFJbMrkI6oxrHq9Pf/S+rKHLYUA4QBXIDI8nhEfB1rth0Cq1mB8Nkui A==;
X-CSE-ConnectionGUID: 7JZaNTe4Q1m60Gs3GcDfBQ==
X-CSE-MsgGUID: BnJClpIYSiOKChmcQEM3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="68826480"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="68826480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:10:22 -0700
X-CSE-ConnectionGUID: On43sm8DQWe0mbZkwpRJ2w==
X-CSE-MsgGUID: PQdbUICWRb6qXY3p4OpKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="170250264"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:10:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:10:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 07:10:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wbg9erv7yj1npxf9I7QvR37/SaQm0xVwlwHde0T4iWcv+0ITv1UTRcVAV9/sWGwTjeKApwtDxljLrMgSgfzUckRUQDo/dWUT3bcGbzMrvGMKCo8Ox9U9ms9esFQ0n4cgm/KmArQL1kjFSugJk1aL85HJEFsyAsPAjbSvuXdRmZTQ+cL7CjNSm2mnG7N29oGIGHBZXsfnXHanNP8R2M9VCvGdeLiAe92tTuQRHf05WliwYBoTfAzhQ/Bspyj0JgKpcENI41ibri1DVgQ9TlzPVNPbb//hEHHCVrXzd4Jld02cBR3Dik48igDa2ymbQeiyqNwUyeSIO/XtqwvIj5Zy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgP5BjmJVVXWlNk4VAjFthwE1GECX/TuNEhR8Y5Wkcs=;
 b=EQgDB2NnUjEuM0Nbowk0m9MJgrTsLWXRrKhzOb6eXerjQS5u86+g8ulzuXBwfMxgUeZ+gu0/ttddpygPeEG2SeSvONnWjo+ZlsFDO7b2CpD1KXRGyra+/kyso92J84pYLiao9RJDJ2M5JootfHYR4OdyGMEj0DlGaVwHsVwggctla2yGrw3KthoPKpxIVgBhz/3XtATCUp8srg6uT5/wZNlosnZMhC8dRpRBvKGBIDfjzUbKtX8uNq6p19WVt+UR0qenWIRoXcxNAeNT/sew/jpkdy1flYzgiHZ9FBZWeo+DCX0d09IAQBjn9Yt2cHNJ1pGhi5WEt5CbbBVyTY61LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 27 Aug
 2025 14:10:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 14:10:17 +0000
Date: Wed, 27 Aug 2025 10:10:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v11 01/13] drm/xe/xelpg: Flush CCS when flushing caches
Message-ID: <aK8Rxk5yxunqXz0G@intel.com>
References: <20250821141458.72876-1-tvrtko.ursulin@igalia.com>
 <20250821141458.72876-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250821141458.72876-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f94ff2-ab08-4e42-aae7-08dde5737307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ybVEWhkGJcAI/2+Jy5dmTW/VBnuEcXChAVgwjrq0+AEFbvJ+zQYR5OdG0VRy?=
 =?us-ascii?Q?BDB9rZoAJtGoGdts6qOk5ve02+bUo5AiBP38q5upuZn5uUH6np7H8CZiu17h?=
 =?us-ascii?Q?ayGIuC4qwzEAputCvVDjn8dgoNvD9brsgDasd1YFtS5U6fpnNZ17CQRCRQoi?=
 =?us-ascii?Q?yNmLYLTaDvX1eCO8N8Meti5iGEeYd0E7rrGC9ccNZbbmMKsSSunVAeD0xXn2?=
 =?us-ascii?Q?ONgSkQUQJoNyBO+ZEfJeCxWGWt2y6D2O17yLVe1y7qD23A4tbCfglawq5eVv?=
 =?us-ascii?Q?thhmhLVX2G4VVQmuq99Gc2HQ3Q2KgW561Fnr2bfvmr8VPzVbrKUWpk+fTgH2?=
 =?us-ascii?Q?MMYNf80Z+m7sdeL/hSC7dTqyU0AIDlR0+jUBPepog/59z60KAjzuwxPQdv3p?=
 =?us-ascii?Q?p8DoO3vav38OauAjsSEx1q6WAPBkngykTqjFcTGPYBTXE/ZIoiTKsIPUFCDF?=
 =?us-ascii?Q?RgXmj/Zhr3r51Tgx+B/T22/hKLW7raeraWVzKep+9F6rV9LN4+1dL9kf05Ds?=
 =?us-ascii?Q?TYVIRj2jcLLoKeS/TLGz2xshYh2j+azlRcRLhoj5N4eoFv+txw5lhZ7jVS6D?=
 =?us-ascii?Q?5wECI1SlGfQfQGDSerKUVQOsDsbmC1Ye4NyZB8oO/jAJg1H1pjawTNTUJQgK?=
 =?us-ascii?Q?tS9iNKfYKgJ5VdkYOhO2JBTxoCxtQrZ++ccNcXwkD1BG5jTV+3eLJvcewiMU?=
 =?us-ascii?Q?UqZ5DjT2FHb2RMuX6fJwdSg6RM8aiKpIjUA9VIbUE5pthZIedhc7P5al5EyL?=
 =?us-ascii?Q?NaiZPRVWwg9jnIknHDcKVUeWhAymkAy1PXqU/ytA9cOemzigPXyF/t7Cyghj?=
 =?us-ascii?Q?PDY99AlWJGe16Sy3HYeyRvupkFDOxX/Jf7Py1s/Iq//0h5tsfHyzXL8Ci72t?=
 =?us-ascii?Q?y2IkKk9ETqZaZby35vmB5FJeUbW/HBAWPIgwpWRJdDZaQbCUMP0jm7pKkiCi?=
 =?us-ascii?Q?JQ7cPqPq/3U4xRVkF0mljzTplrBKdcktZ1ChA562qxYw144sL7Qcz4mpXNHI?=
 =?us-ascii?Q?VzBgUmjCyLFeARckYNliGGc+kAZ984vRYYzMARvj+QWqefCKNGAIjAy+sODt?=
 =?us-ascii?Q?c8bnFs5Z/GSzukrCDS8NmlGj9eCX5UENOejbjP7SLZcb2fIG57twUJiuWH7Q?=
 =?us-ascii?Q?pMVLXdelrLbmuwgT6TKIEgmfpflD0dPLGM3G0QN8uQO9U6EQWqSTJSeMlDoT?=
 =?us-ascii?Q?djaE4GRfX3kDuddN0LQ8zfff3G24leocGRfS73lCkSkaJ34JJUDypXSkp31t?=
 =?us-ascii?Q?9A/hpZ8+556noUP5//eYQqIOWMGyHjTp0/QxvUcmNE/T+oKtysHNwER/ogAu?=
 =?us-ascii?Q?PD1t8NWspaiZR7ikeX0cxpb4/FeemacT3sEJ9/nXTMPenucIxdEgzSc/IMPW?=
 =?us-ascii?Q?/kuUreS9gX+OilEoB3YVV0bpaBzJH5ni0n5Msqqkqf1t9pLqEhxo8GxqL3ep?=
 =?us-ascii?Q?s7rinu4ayF8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jo2qYR7gdu7NWLa6sogDy6aGTpbkDCkKk5gchwMCY+7y9n6OtuQCt3rrcZpj?=
 =?us-ascii?Q?S366/BfjURoa0cmebcgko/fqoVOkpJjdIHe7rog+2iA2oK5vLsnI0vKnUBZG?=
 =?us-ascii?Q?t+VtNXCWPgTQzIyj3tWSLQUC0qlo7uNQzCVzlR9A9ERK+xGzYACEVDUeKmVv?=
 =?us-ascii?Q?39qBHVE6viaPrkf/zZKUgB7jR+OxK+LmWmnjX32KLweHfqjwXea6l+4qLrN7?=
 =?us-ascii?Q?omQGqXJOhjKoBcYYlOsNNrTvelbJ5G7l6HleQSJZGCCsqG5SqJgYoI2OA0Jd?=
 =?us-ascii?Q?aRdikN3+lAE44Mznr4HziACHGqPgkN9F6ZBYA4/2bCYSXqTPyJ1GjYKY1CXj?=
 =?us-ascii?Q?EZHu9jicT5cpYtdCp9uipk3ySdog+DndKxXthsQuo5ZXAxKbr175czs87kAO?=
 =?us-ascii?Q?dsa3yOinetBkjIyYq4rvetG9ECilW6Rf6wL/lF43M4uwMIa6Sh2QloiYFO+n?=
 =?us-ascii?Q?tYjJ884UWyDSHn7F9RDdqqJGXFVlpUnRWX/llILRfuMGOZ1cgQeBc/RVmjGb?=
 =?us-ascii?Q?E52cyS72xTu3VmAV0GurYRF10oiJ9TU0hJLTCjrgTv8bYmNIn5uEbKFDnZd6?=
 =?us-ascii?Q?9OucYmUJd1it49m/Mj/vtg0Stj2St6xx07J/UqBCwKWZ0L87JkKzeQUxD4f5?=
 =?us-ascii?Q?64WhC4WGEb5GMQBazfkgiro+whkPLGLChQeXq/ySXyzZr06RH+sfQgDJuuPJ?=
 =?us-ascii?Q?SALFfqugqPtQ8OAW5907MM54Tegv7gyfh2tSrLxjZn39QOGltk7KYnQ+R8LY?=
 =?us-ascii?Q?CmlO03dLZAOSEKh9pwGXghtP+o0qcnTEh61OPWJmzc2qVilBJ9cxRsPdwhtW?=
 =?us-ascii?Q?Fp0s7asHS6UHW+TL1PhmtAFrA3UXDz2JxxVhKfkCXznt908hguFILPHZz06j?=
 =?us-ascii?Q?lMRSPVpa1mrW2PvR3booJ+Br0ecT4LN5Pku/Upu6HmaWrilI3xhCxPk7fXsM?=
 =?us-ascii?Q?mYBOkWVsu7qKBMcD8hZIsV9el3UVRO8hmlVa3epdPGJoiQPYvYMxhJBogHuO?=
 =?us-ascii?Q?N+itAevlR/rXLMdbl7gPEYLp+cX6dONR16g5SrreH3MtHFWsmYoz/8HpNZWq?=
 =?us-ascii?Q?U33cbwMH1pdhp32zusrAbvkWLJLz4zYkhWRmrsBsragBUVlk6alut9BFaOSl?=
 =?us-ascii?Q?63kinmsz/wTFJCyG3AKTN4qDoPfj2CaYyMRF4JXt+1iaPi4se85XfZtG5dED?=
 =?us-ascii?Q?GF6EV7d6nhSox+5wrmSBuzaH+imcBUUjsGpBEc8eULdQFW7UbLH1Fn775jCJ?=
 =?us-ascii?Q?QB2pv569UuUz12pzjUqYbbESu/s1/ZaLgZSEwamebwrE1+1zaLs2byHen+e0?=
 =?us-ascii?Q?hUruRg54YL2jGAHalEj2jfW5qKNDiiMmgKn+s2QMEN4VAHIvIemQdMw6i6Pe?=
 =?us-ascii?Q?JM0DMSaGjAw+WEbGs3un+SthbCpgiM9x1bw0p3xM2TnntJ4xHNQ2npfZFdYA?=
 =?us-ascii?Q?nTBR/6YN2w+GsqagvFkTSDl5oIfUjZDSZ1Vfqq6qDqB0s4aFt7C7hz2Y0Qy7?=
 =?us-ascii?Q?b25TJL5CEpz5Z7BN6WrEWPDUkAbQPuId9wVytNeNMrlbZFEpw7WSGrRk/3SI?=
 =?us-ascii?Q?yh/vgN1w/mi95NoMjSfvtv4v4OfXCZfaSEH7gd6P/fIG3EKBk+mIyd6o1sRD?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f94ff2-ab08-4e42-aae7-08dde5737307
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:10:17.2400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9BHdTPkhUrkmC2Cjfe3JzXNCky+fK7YLNFgyyLEcTxE5Mtvjrylo7SO/piMm5lcCcG7U4Vx6xkecVeALsc/JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
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

On Thu, Aug 21, 2025 at 03:14:43PM +0100, Tvrtko Ursulin wrote:
> According to i915 PIPE_CONTROL0_CCS_FLUSH needs to be set when flushing
> render caches on gfx ip 12.70+.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c                  | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 8cfcd3360896..78c0e87dbd37 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -43,6 +43,7 @@
>  
>  #define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */
>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
> +#define   PIPE_CONTROL0_CCS_FLUSH                       BIT(13) /* MTL+ */
>  
>  #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
>  #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 5f15360d14bf..761740d7769f 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -176,13 +176,18 @@ static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
>  static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  {
>  	struct xe_gt *gt = job->q->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
>  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> +	u32 bit_group_0 = PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  	u32 flags;
>  
>  	if (XE_GT_WA(gt, 14016712196))
>  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
>  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
>  
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		bit_group_0 |= PIPE_CONTROL0_CCS_FLUSH;
> +
>  	flags = (PIPE_CONTROL_CS_STALL |
>  		 PIPE_CONTROL_TILE_CACHE_FLUSH |
>  		 PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH |
> @@ -198,7 +203,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
>  	else if (job->q->class == XE_ENGINE_CLASS_COMPUTE)
>  		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> -	return emit_pipe_control(dw, i, PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);
> +	return emit_pipe_control(dw, i, bit_group_0, flags, 0, 0);
>  }
>  
>  static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int i)
> -- 
> 2.48.0
> 
