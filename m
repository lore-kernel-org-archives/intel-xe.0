Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160DA10AB810
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 19:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CAB10E0E0;
	Thu, 26 Mar 2026 19:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkaVRZvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7AE10E0E0
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774554504; x=1806090504;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=W1OQ58iC6SpG9S3XWp0GdfukiB+kHvNt2r4tFsG9lvQ=;
 b=lkaVRZvTiiZUaSQYKwM+JYcvPK0fy8jmYc1UtHw6N1pEvnfsc6k6ALz2
 PKjl97uePoJvXv2OhCUAat+ZsWmJBa5VYlpmEISIm/wO/lPt7Bg1pxkBo
 Y7myaYLkKO7WTuYMGJVWt3ccZuKDQ7Bmnney7eR/sikfw5tp0RCWW2+j/
 RlZvgDCxPI95g6sbcU3+Dp/yxfweXVw5NBSwKzghEESljNHxiHnMQETkU
 SJJKPyO7VZwi2VYP7S8ulNojnms1k/6DPOPxepDmuQXh6jWyEN/VQ5C5L
 0O6ItDOuTzybvfeegDxNQ6hiIYCWTcuV+4d8ZTyFmEdyFJcgpHeT3vlY2 A==;
X-CSE-ConnectionGUID: pGlaSMYcSkqiLx/+3Ic30A==
X-CSE-MsgGUID: 8N/D++NVQGyQk4FFquXRJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75823729"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75823729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:48:24 -0700
X-CSE-ConnectionGUID: 1bXWcPrtRICPKS8Jiy8ByQ==
X-CSE-MsgGUID: MxP//jMySC2/Nh+Nitk/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224157715"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 12:48:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:48:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 12:48:23 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 12:48:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiyWVXH9LwBXB0uTz0wbBhwGljtgLqTVy6fu2uBPpaDELPhJfNvGFyrYBT3PC6UjYMjLYoh0s0cKBXor4a8nvKkETAZtMn7QTGf7tWVIwOss85akrrNGwQZr3Kt/N06zA9Vt7spY6KPi1EaEfOnISKNGgbP0aS65yjEOj25bUSWCCdnxFjG6BvHu0Foh0RZVai/Zm/lhTHM8GnYITvGz+335K7XdwzXM3ZIdQSmSRubTsAHi/IS6wKWvTqQQPcq+CqPpsgajl+vA7IyRPwuaMcXtbrYL3+uaO8+O1+AKEXzO06oARVf0SVpah6nNCXa73e2/7xGd8EKWRn7iZfCFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMyF1tCJzengVRLUtqGGrCo/EBF2nb+G2cpxzTHnfoY=;
 b=Y4HnhoUjfmhKRvdVwR4w3DEzCa1RB8a53bkYa3vM3LopoAuwl57CqA+shYJuX754evP1P5ZCkzVp6i+mvLVJv77OAjLbM0hQlVLtJxVEUaSmt41bJCwCFyOS2Ppb+dAHr08v+ejQHdlVQ2ItY4s0mSU+SMZkXseaHiwt+MzWnDb7P5bYAouWbDkeKjkihezFsN0ZpzzYF9aWa4fKFX+DGNjahRlVPp8hnQZRccHq4sT6J8FhU8jEKvgMJy/bwvGPMsVQjUZ+Jc9Xe0epdSY3y7sVBjawFvtawVn80N9hGSDeL+rk/uRvrxIGJ1rMyS4FnSgaP8agbsl31tWCoUvL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 SJ0PR11MB5037.namprd11.prod.outlook.com (2603:10b6:a03:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 19:48:20 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 19:48:20 +0000
Date: Thu, 26 Mar 2026 12:48:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/mm: add XE DRM MM manager with shadow support
Message-ID: <acWNgikBoPxRNHGJ@gsse-cloud1.jf.intel.com>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320121231.638189-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|SJ0PR11MB5037:EE_
X-MS-Office365-Filtering-Correlation-Id: 351bd0a5-e70b-414a-70cc-08de8b70a210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 4SWWUAAJRo/LBD3ltYJe4uqEqUFS6UL8yf0IjIam8W4KKJ7eRDeon1r8cTkCytPW2L8Jcu9KBBg61iqnGox52/WFO+KJawPOp1icxsjiFINtL4+UQMLGX2zpGNxbOYylGp2Cur83tIrx8bf6qbc22l3sKc7sW36MntJ8ubX0GaQiXNjKdV1huKZcRikr7KNPQR3ED+hO/r14MZNdZPtYH367Y9kLLij3btvTX/xHgmT2zxHW6aKx+jyFttnMiFWQ7/XX9f3koW2Gu4dQG6kw/+EQTgs1P3AxfTScnB5TucVBjHlAnxaLoatUs6UQ15MVU0dFlAkL69/GrQGcH3DNKYjSIDoAqsbabR6MC3BExZTlJBLXWT1ioqcOfyr4ipNuzTCkB2tYRFlk2LPNVkCnosg/jwqoXFMkihgLx/4IW87SlsHRVNwqbJ+qWsTRlOShlIO5ONvW6grIcR6afFN59XgqK4uBOpj4crxMcvSUw02RUT9bjG2+OLMNdP7/j3Z/SqbSmTWgI7C+Hl2EiB6xhn4MPmGGd4TZf5cEz4lbUOfnwj8CSoonEii2KJpTV31n0dDxzHc8N70t+snM7zv7nUpYBtoofWXKnXo4JwCKHssFFBAagKmfnY+keGkceFdpdVA7fm41zIEKrAxBC+pybtbbPKpic5aS7QtITf81mY6f3EGzcP0jb4YYHan3lks6YgixzX0F34ueXAN11rTVSjc+rninRJJ6n7OhhVUg2U0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lcsQtyrH0e6jXBhemLYYy9Cwm27vzEhk6/6of+8jBro1SZ/HIJ67ddgTcv?=
 =?iso-8859-1?Q?qQI3ONem9GopLqngjefRvP4kt5ew2k5ibQACirxvB3SS7yZJnQqO0QBfna?=
 =?iso-8859-1?Q?D/rY4sEez1xvGXurIP1IWfyVsfB9X/tXNIheNz0MNdVjBVGFrieB6xaGnO?=
 =?iso-8859-1?Q?8P50zsQwEMFpyFMDL7699dNQIS/SPtxv/jlC/J4jIbggzdbQF1llsY2bVs?=
 =?iso-8859-1?Q?+OxPq+zwkMWjk3RzBEN12Vm9wmHaDGhskPfIaEY5634uMEBt39xhel2WwS?=
 =?iso-8859-1?Q?xiiDgn813axN44LdCuGWtInD7I4uscTCKforSC/dM4Y5nirsuXACN+dwmW?=
 =?iso-8859-1?Q?6f7qZCYTuDs/qnCxvWMW8mr0FqAt/c7JCFx3ckzi5qV/i2QwNGwDjM7qOd?=
 =?iso-8859-1?Q?6xlJriSy/ykGX3d651t0ouvo7aqUMUKBGJcuoAysImxeiiecmdwtJMVu1F?=
 =?iso-8859-1?Q?b4DwVRlj1Eg9XjMvyh3xHuROQq6zcdepajENDopznLTVM7yfmxdHkv/yla?=
 =?iso-8859-1?Q?+UVjP3yD3yah/6r7iOMeuWTjofEMtUe8S2ibGsGAB5CFaahO9jC0J2hmgZ?=
 =?iso-8859-1?Q?+nerLPX9Y03pNZxxNBSTpPeE4SU6zuq85/bCygRiI3MH3vQ0DCsw8AET7D?=
 =?iso-8859-1?Q?FhZXKkZOVtU7cvcLggA6pECJBQbDM9zP2nK31qaJ3YlzRCH+Q0e37aX6hJ?=
 =?iso-8859-1?Q?4aDZWGs3sSjcDuAGrIfA7F4FtIV7YggWIgcn2h3dANOVnA1BV0vsH0/Zop?=
 =?iso-8859-1?Q?u1jhEwHX2tDjVh1bjzoWEnX5/fnOeWlIFYobYEK8QdDwSu4AY6s9bfNEzc?=
 =?iso-8859-1?Q?oRthYC0gB0+gCfhiio9KVKgxOvHAvOlRTqc66MUk2CwN7BuH2Uki2Izxz+?=
 =?iso-8859-1?Q?CT4oh+xWVTuzY8EuVtGRcFj12ylDJl/yKsIugxs0RLKVOiXgn6D/JTLopb?=
 =?iso-8859-1?Q?iaQBtQsHE6mrk16ytJIRoa0xbaR0uWnVt2LPp43R2MckZuCBalKZCaJ+vr?=
 =?iso-8859-1?Q?zuCjTwNIw1R5znBe2DC3s/gkmLi3UZLueQpy+RyRisgJ4P5o/6OijQJvai?=
 =?iso-8859-1?Q?MBauKgUj27a6NmcN7vg/eMn0trn/aOmVYgfUwKeJo8ozXl8Skgwp1hQEL6?=
 =?iso-8859-1?Q?TlmGz/vh6NNpzeQ8sREvo6ZQtvqDoFbNj8GOdV8vwNnCw9PLArfeW0Nc0D?=
 =?iso-8859-1?Q?XdQj7/ShPBErB75kLRiQYt0jBH6UNfPk2JFCrmllV7tzWARex6RJ0CWXMZ?=
 =?iso-8859-1?Q?n2Va987slXbhWBbBxfPMsRbf9Um5fQezqkzwN3DdIo8/sRgtl5FbwBD0sy?=
 =?iso-8859-1?Q?kYmvBp2CssPP3KlNHzAbdXLuFE4V5EKHBd49RIg3y8WEohAxCBj5tfm4EB?=
 =?iso-8859-1?Q?1h2SBz5RGWSGAavsLtyn3/gTK2d8mshDMqjyZVi5bTViTqwe5TatmbbQlw?=
 =?iso-8859-1?Q?CwJH9b/NETgPdc/hYd0an6S2v5MPUbhBAEWQp76NaGMAZGWaYTqVLt84+2?=
 =?iso-8859-1?Q?nzOhyUkf8TCdN3UNSTBcVmpUozvkrAUpvl0u2iMbQwkWRKOJFtWV0291Kt?=
 =?iso-8859-1?Q?IR62WJjl3hIKDeuG1w0LGFwf74p2JssYMCaDqktfqzpc0NIo3AbRvyr/Zk?=
 =?iso-8859-1?Q?SagyZ2McBGCErOTVSvUKJpYXs61kOut0k6D6qIqFdtm4MYgUkv6kaAnGVC?=
 =?iso-8859-1?Q?9Hf5oShZ7tbre3muvRwu+LOuYbzCGcX7DcxPf0hLOUTIfkSb7UbUEZ5Ntc?=
 =?iso-8859-1?Q?yJ/oifsRPcFAA5aRjRE/0zXjDx2npPAyY19TDODXTkwNw7XKMCjM94nQUi?=
 =?iso-8859-1?Q?trcM0A95A8Ul15Gfv1bOvxR+beFzV8o=3D?=
X-Exchange-RoutingPolicyChecked: B77QWclh3x81CDa9IgVuFD0NIxpzUdX4DyWAysm47yj90YAGpAMTfcKlgM0bgGmqROvyGGAR0dqeO5SLlxbQ9f8uq+zRXe9Z9Z98PzPXT5PE5CzYrxhtJd/LNplBcR/CZQF2WNGl3R8Rneb+EECIR6GTtCeZ/WwD+TDI2S+pnNj6tpzjfDRq9oP7RLKucvxWAMmCWwj7TucP+mHtzv2KoYZNQrW/HZZbTbDxcCrwlG1/bwZED4sL/GhBWG7wQiJaa3NlT9VCwbL2cZwfF7hRPff10WII9StqT3fQJrgv+YXw7pAM5QK80g0w7OVbA9KkPOrsp9KnTgP5Xqo1VRr4fw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 351bd0a5-e70b-414a-70cc-08de8b70a210
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 19:48:20.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BYgxbzZ8zNmwPwepmwVQpzvZ/iUWETOIhgemY6PWVU+O0MoDGLb2EryCZCF/A/rjAfEUc79MS2t6/qmVoPUXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5037
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

On Fri, Mar 20, 2026 at 12:12:29PM +0000, Satyanarayana K V P wrote:
> Add a xe_drm_mm manager to allocate sub-ranges from a BO-backed pool
> using drm_mm.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_drm_mm.c       | 200 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_mm.h       |  55 ++++++++
>  drivers/gpu/drm/xe/xe_drm_mm_types.h |  42 ++++++
>  4 files changed, 298 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_mm_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index dab979287a96..6ab4e2392df1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -41,6 +41,7 @@ xe-y += xe_bb.o \
>  	xe_device_sysfs.o \
>  	xe_dma_buf.o \
>  	xe_drm_client.o \
> +	xe_drm_mm.o \
>  	xe_drm_ras.o \
>  	xe_eu_stall.o \
>  	xe_exec.o \
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.c b/drivers/gpu/drm/xe/xe_drm_mm.c
> new file mode 100644
> index 000000000000..c5b1766fa75a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kernel.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_drm_mm_types.h"
> +#include "xe_drm_mm.h"
> +#include "xe_map.h"
> +
> +static void xe_drm_mm_manager_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_drm_mm_manager *drm_mm_manager = arg;
> +	struct xe_bo *bo = drm_mm_manager->bo;
> +
> +	if (!bo) {
> +		drm_err(drm, "no bo for drm mm manager\n");
> +		return;
> +	}
> +
> +	drm_mm_takedown(&drm_mm_manager->base);
> +
> +	if (drm_mm_manager->is_iomem)
> +		kvfree(drm_mm_manager->cpu_addr);
> +
> +	drm_mm_manager->bo = NULL;
> +	drm_mm_manager->shadow = NULL;
> +}
> +
> +/**
> + * xe_drm_mm_manager_init() - Create and initialize the DRM MM manager.
> + * @tile: the &xe_tile where allocate.
> + * @size: number of bytes to allocate
> + * @guard: number of bytes to exclude from allocation for guard region
> + * @flags: additional flags for configuring the DRM MM manager.
> + *
> + * Initializes a DRM MM manager for managing memory allocations on a specific
> + * XE tile. The function allocates a buffer object to back the memory region
> + * managed by the DRM MM manager.
> + *
> + * Return: a pointer to the &xe_drm_mm_manager, or an error pointer on failure.
> + */
> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile *tile, u32 size,
> +						 u32 guard, u32 flags)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_drm_mm_manager *drm_mm_manager;
> +	u64 managed_size;
> +	struct xe_bo *bo;
> +	int ret;
> +
> +	xe_tile_assert(tile, size > guard);
> +	managed_size = size - guard;
> +
> +	drm_mm_manager = drmm_kzalloc(&xe->drm, sizeof(*drm_mm_manager), GFP_KERNEL);
> +	if (!drm_mm_manager)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bo = xe_managed_bo_create_pin_map(xe, tile, size,
> +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE |
> +					  XE_BO_FLAG_PINNED_NORESTORE);
> +	if (IS_ERR(bo)) {
> +		drm_err(&xe->drm, "Failed to prepare %uKiB BO for DRM MM manager (%pe)\n",
> +			size / SZ_1K, bo);
> +		return ERR_CAST(bo);
> +	}
> +	drm_mm_manager->bo = bo;
> +	drm_mm_manager->is_iomem = bo->vmap.is_iomem;
> +
> +	if (bo->vmap.is_iomem) {
> +		drm_mm_manager->cpu_addr = kvzalloc(managed_size, GFP_KERNEL);
> +		if (!drm_mm_manager->cpu_addr)
> +			return ERR_PTR(-ENOMEM);
> +	} else {
> +		drm_mm_manager->cpu_addr = bo->vmap.vaddr;
> +		memset(drm_mm_manager->cpu_addr, 0, bo->ttm.base.size);

I don't think you need this memset... As is in alloc_bb_pool() (patch
#3) the first thing done after calling xe_drm_mm_manager_init() is a
xe_map_memset(..., MI_NOOP, ...) on both the primary BO and shadow.

> +	}
> +
> +	if (flags & XE_DRM_MM_BO_MANAGER_FLAG_SHADOW) {
> +		struct xe_bo *shadow;
> +
> +		ret = drmm_mutex_init(&xe->drm, &drm_mm_manager->swap_guard);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> +			fs_reclaim_acquire(GFP_KERNEL);
> +			might_lock(&drm_mm_manager->swap_guard);
> +			fs_reclaim_release(GFP_KERNEL);
> +		}
> +
> +		shadow = xe_managed_bo_create_pin_map(xe, tile, size,
> +						      XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +						      XE_BO_FLAG_GGTT |
> +						      XE_BO_FLAG_GGTT_INVALIDATE |
> +						      XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(shadow)) {
> +			drm_err(&xe->drm,
> +				"Failed to prepare %uKiB shadow BO for DRM MM manager (%pe)\n",
> +				size / SZ_1K, shadow);
> +			return ERR_CAST(shadow);
> +		}
> +		drm_mm_manager->shadow = shadow;
> +	}
> +
> +	drm_mm_init(&drm_mm_manager->base, 0, managed_size);
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_drm_mm_manager_fini, drm_mm_manager);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return drm_mm_manager;
> +}
> +
> +/**
> + * xe_drm_mm_bo_swap_shadow() - Swap the primary BO with the shadow BO.
> + * @drm_mm_manager: the DRM MM manager containing the primary and shadow BOs.
> + *
> + * Swaps the primary buffer object with the shadow buffer object in the DRM MM
> + * manager.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager *drm_mm_manager)
> +{
> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
> +
> +	xe_assert(xe, drm_mm_manager->shadow);
> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> +
> +	swap(drm_mm_manager->bo, drm_mm_manager->shadow);
> +	if (!drm_mm_manager->bo->vmap.is_iomem)
> +		drm_mm_manager->cpu_addr = drm_mm_manager->bo->vmap.vaddr;
> +}
> +
> +/**
> + * xe_drm_mm_sync_shadow() - Synchronize the shadow BO with the primary BO.
> + * @drm_mm_manager: the DRM MM manager containing the primary and shadow BOs.
> + * @node: the DRM MM node representing the region to synchronize.
> + *
> + * Copies the contents of the specified region from the primary buffer object to
> + * the shadow buffer object in the DRM MM manager.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> +			   struct drm_mm_node *node)
> +{
> +	struct xe_device *xe = tile_to_xe(drm_mm_manager->bo->tile);
> +
> +	xe_assert(xe, drm_mm_manager->shadow);
> +	lockdep_assert_held(&drm_mm_manager->swap_guard);
> +
> +	xe_map_memcpy_to(xe, &drm_mm_manager->shadow->vmap,
> +			 node->start,
> +			 drm_mm_manager->cpu_addr + node->start,
> +			 node->size);
> +}
> +
> +/**
> + * xe_drm_mm_insert_node() - Insert a node into the DRM MM manager.
> + * @drm_mm_manager: the DRM MM manager to insert the node into.
> + * @node: the DRM MM node to insert.
> + * @size: the size of the node to insert.
> + *
> + * Inserts a node into the DRM MM manager and clears the corresponding memory region
> + * in both the primary and shadow buffer objects.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> +			  struct drm_mm_node *node, u32 size)
> +{
> +	struct drm_mm *mm = &drm_mm_manager->base;
> +	int ret;
> +
> +	ret = drm_mm_insert_node(mm, node, size);
> +	if (ret)
> +		return ret;
> +
> +	memset((void *)drm_mm_manager->bo->vmap.vaddr + node->start, 0, node->size);
> +	if (drm_mm_manager->shadow)
> +		memset((void *)drm_mm_manager->shadow->vmap.vaddr + node->start, 0,
> +		       node->size);

Likewise here, I don't think you need these memsets as both the primary
and shadow are initialized with MI_NOOP, then on each SA release set
back to MI_NOOP.

Other than that, patch looks good.

Matt

> +	return 0;
> +}
> +
> +/**
> + * xe_drm_mm_remove_node() - Remove a node from the DRM MM manager.
> + * @node: the DRM MM node to remove.
> + *
> + * Return: None.
> + */
> +void xe_drm_mm_remove_node(struct drm_mm_node *node)
> +{
> +	return drm_mm_remove_node(node);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm.h b/drivers/gpu/drm/xe/xe_drm_mm.h
> new file mode 100644
> index 000000000000..aeb7cab92d0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#ifndef _XE_DRM_MM_H_
> +#define _XE_DRM_MM_H_
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +
> +#include "xe_bo.h"
> +#include "xe_drm_mm_types.h"
> +
> +struct dma_fence;
> +struct xe_tile;
> +
> +#define XE_DRM_MM_BO_MANAGER_FLAG_SHADOW    BIT(0)
> +
> +struct xe_drm_mm_manager *xe_drm_mm_manager_init(struct xe_tile *tile, u32 size,
> +						 u32 guard, u32 flags);
> +void xe_drm_mm_bo_swap_shadow(struct xe_drm_mm_manager *drm_mm_manager);
> +void xe_drm_mm_sync_shadow(struct xe_drm_mm_manager *drm_mm_manager,
> +			   struct drm_mm_node *node);
> +int xe_drm_mm_insert_node(struct xe_drm_mm_manager *drm_mm_manager,
> +			  struct drm_mm_node *node, u32 size);
> +void xe_drm_mm_remove_node(struct drm_mm_node *node);
> +
> +/**
> + * xe_drm_mm_manager_gpu_addr() - Retrieve GPU address of a back storage BO
> + * within a memory manager.
> + * @drm_mm_manager: The DRM MM memory manager.
> + *
> + * Returns: GGTT address of the back storage BO
> + */
> +static inline u64 xe_drm_mm_manager_gpu_addr(struct xe_drm_mm_manager
> +					     *drm_mm_manager)
> +{
> +	return xe_bo_ggtt_addr(drm_mm_manager->bo);
> +}
> +
> +/**
> + * xe_drm_mm_bo_swap_guard() - Retrieve the mutex used to guard swap operations
> + * on a memory manager.
> + * @drm_mm_manager: The DRM MM memory manager.
> + *
> + * Returns: Swap guard mutex.
> + */
> +static inline struct mutex *xe_drm_mm_bo_swap_guard(struct xe_drm_mm_manager
> +						    *drm_mm_manager)
> +{
> +	return &drm_mm_manager->swap_guard;
> +}
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_drm_mm_types.h b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> new file mode 100644
> index 000000000000..69e0937dd8de
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_drm_mm_types.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_DRM_MM_TYPES_H_
> +#define _XE_DRM_MM_TYPES_H_
> +
> +#include <drm/drm_mm.h>
> +
> +struct xe_bo;
> +
> +struct xe_drm_mm_manager {
> +	/** @base: Range allocator over [0, @size) in bytes */
> +	struct drm_mm base;
> +	/** @bo: Active pool BO (GGTT-pinned, CPU-mapped). */
> +	struct xe_bo *bo;
> +	/** @shadow: Shadow BO for atomic command updates. */
> +	struct xe_bo *shadow;
> +	/** @swap_guard: Timeline guard updating @bo and @shadow */
> +	struct mutex swap_guard;
> +	/** @cpu_addr: CPU virtual address of the active BO. */
> +	void *cpu_addr;
> +	/** @size: Total size of the managed address space. */
> +	u64 size;
> +	/** @is_iomem: Whether the managed address space is I/O memory. */
> +	bool is_iomem;
> +};
> +
> +struct xe_drm_mm_bb {
> +	/** @node: Range node for this batch buffer. */
> +	struct drm_mm_node node;
> +	/** @manager: Manager this batch buffer belongs to. */
> +	struct xe_drm_mm_manager *manager;
> +	/** @cs: Command stream for this batch buffer. */
> +	u32 *cs;
> +	/** @len: Length of the CS in dwords. */
> +	u32 len;
> +};
> +
> +#endif
> +
> -- 
> 2.43.0
> 
