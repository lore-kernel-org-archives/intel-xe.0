Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D72C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 17:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33E10E32B;
	Tue, 22 Apr 2025 17:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLayhohZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B912F89ECB
 for <Intel-Xe@lists.freedesktop.org>; Tue, 22 Apr 2025 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745341412; x=1776877412;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=51lzhFuLYQNlKvFDRBSqJ/XcVOabr4j9ZEVOShNZTF8=;
 b=kLayhohZ1BKb4YQ8tl+qfvmpPLQNsLmh9kud0EA6eEdEeOtbuDeGZ1Pp
 EOnmYUSv/rkkZijY+0uScUGmtEV3F5RdFT+1zmencrdV7Sp21JEXJxk9A
 V1VZh3toskI0ecyLLV0wZrcv2F6d2tEyNEhZXX25aQWrcFKWGG9giYNCr
 IxaK4pU58LeLN+OtWMmDkFwELwubVuEnxxW2/YShw8VZb7Aevnwbjvq51
 YvTPybIsqel67Kv5oBJWb3yS3gG1u5VQvyaepMEi9dd9RzI1RafED+JUM
 swjZAoZIvXIP0NxR6bqJfLTOoMPz62optFDH5wre/mRpxY8VBTZPY7gzB A==;
X-CSE-ConnectionGUID: u/3Xm1lyQ+iJULYdGnCecg==
X-CSE-MsgGUID: gZwoTlU8RVqLIe3xr1/FOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47090963"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="47090963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:03:32 -0700
X-CSE-ConnectionGUID: 6e5rs+GiQQuaTShVEW/rqQ==
X-CSE-MsgGUID: FBo6jb5FT3uvxhhXNR/1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136933668"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 10:03:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 10:03:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 10:03:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 10:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlJ5oim5t+Hzp26DI6WjhvPRuimpDjV1eAeOGimFP0Uxm+j3ldx1zc18T4B42YHp2bfUlqRWKi/Y951kQ6B9GTX6qqkh7KLJzODdDwZRLS3CQ3xNxHDquCFxS/IkyBC/SyzCBdUupFz+1eU20GWxNR2BDmoKTUn6Rnb6Y1Hx4eq3yP1g3AMUcAlHCenzP+bgxJecgQMKHGYNvjq3ViFtnKw39FImYuRl1X2YdE1JJgPG5MDoAoLBceqBFnwqgN7PtWHcu0fya4bqBXwwtXO14rKt+mjkZkr5jaaJH9cH+zbPPu3nxw+/VWsNbgCEb3s6dapmMZv6ITz4VkiK+f8YwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCKXfC7ZJr73h7RGvLY7rxZp5DxxzSWO/vMcQSlBfuQ=;
 b=xNd6wEbb00DrXpiDhghpw/Vt08gPNG6jCEKWqaSXnBcji1qePd+SwuwnbaGXgqWhZY7HS3MQld3jP4QA30Oe6qvRqhP37VRmcSblwi9BQJ9VjIcYb5VeifL3vPZ0a8f3HPvqpjGB2WsYecrf3T0/fCY2AUOk1isGLb8P60jrizTmO3LBs3wfM1XH3T70mwO4jVmIElSmJ/+VuHLMB/kajpdqumkrRpmDJgbe+vqMldQoSp6x5H32LSqS2tTr/pzT+2Vz/Ua14Z9ixsSxRfJ2wbnYJoy/XDF2xT0wrvHCFwpKfoRwhHrnr0/MaG/i7HUpoamx/1llfnlmTqA1wZVgHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 17:03:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 17:03:28 +0000
Date: Tue, 22 Apr 2025 10:03:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Cache DSS info when creating capture
 register list
Message-ID: <20250422170326.GD5080@mdroper-desk1.amr.corp.intel.com>
References: <20250417195215.3002210-4-John.C.Harrison@Intel.com>
 <20250417213303.3021243-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250417213303.3021243-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc50c02-1706-4dec-c141-08dd81bf9a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rMCx2SDrH2u4Y2VJcN2jVqqyNd/gEluHC2rzTp273/vCyYc5tKQsgPsoiKiG?=
 =?us-ascii?Q?JMVQ/3kVBXNKgefLOQxsZAMfCa3vj1YsF3TTK58AMX68XC1G9DryNuWRVy4C?=
 =?us-ascii?Q?b0RtTFFqb51PIMq4eGeyfchNrnquoyhOZWuvIimot4sPhM66uUQvMMs9h4qr?=
 =?us-ascii?Q?Jr7FQn/1PczDkFLI0TjKIyJMQiupMNA/rxoTN4pyNLxyaZwWlIys97WkRelb?=
 =?us-ascii?Q?czo9iNnrWd47Dk6EzI7ZKeXprA1PD68X6PI8/+LbTEjbdvBuLcI5h83H18by?=
 =?us-ascii?Q?6T0GYIaNAZHBJw4YWy1lJbtWK7p/6THCkPMf6r2asURTqCYkrlBG/9b8wUay?=
 =?us-ascii?Q?y96d7D5/HS+HyDrpe8MbJf5YammXCUDdIEH/dmlgC1lq6MdIymXhdFgd7gNM?=
 =?us-ascii?Q?/O5D/uA2D1HzuarBpAHVDbkfAE6v9dnvxzwPXVVwZrh70fFEl2Wm3/K4XwMH?=
 =?us-ascii?Q?ULnreVAg2xKV08CUFsj4gN4/SNCEfW4OUTScy++QTSlM5cavB8Pha2PNXKGc?=
 =?us-ascii?Q?CJJaC1RaJhrQKxW/sJ4cPiW+x4eYKACL9FSa4nd38d64eXCEIHTCjATxSbWy?=
 =?us-ascii?Q?t16UbYN9TrFZZVw9a/XXVevvi9NPyBJpf4qHEBzl/PiNFADOW2pyrEkxQYmg?=
 =?us-ascii?Q?7U1yok6xFJ8AFaa3EpYzPFZEdDnIs3ejnkRvmcUeSjpTBoTWV0vc9aiPa3mr?=
 =?us-ascii?Q?ScGvGHXt5n2VEnyeTor0kGfPtLEqxO9pdQ2+0ieCgwwZH28sV9upwSrAp4E0?=
 =?us-ascii?Q?8WkbLfrancqkFpfceieNR9WsR8V+2GO6k8uk4QRzKZBhegjvkyv6mevUju4Z?=
 =?us-ascii?Q?gPJCwEhOym0v0GEjy13gPlcl700WCHzayTGQc9pki+zFkjc5WxWpJ1zlYFZY?=
 =?us-ascii?Q?Yz2WJgaExAKn1Vr+DJeoFkb1SknPigtD1LDEGs4M5KKOu0uOgoeNjjlLtVwB?=
 =?us-ascii?Q?vzWH7QVtgVtzcxvxL+QfwTSnyQmbV1fA0AfiJNNODHWMvlKaVhz2S+MMfCEr?=
 =?us-ascii?Q?3lnvrGpC1A5Iv3kOwXccBt6ElpJ8+PU5TiLziyL6P6HTKA8cPiZhcyD3fn75?=
 =?us-ascii?Q?v6wWkhttrW/wsoiUUmhVu0fpfVaF2dKC5qOm2tOZmgbR3FyIRbxmAuXgV7WB?=
 =?us-ascii?Q?sVYoA9E9dtr63ElvPe7QBflOiyhuHb17bi6voY8H20bdtOs7x/jr2aix8fDV?=
 =?us-ascii?Q?YuLg/6k8PTzuGhMQbBXSgZfXG87o+qmCJPQDhY/wjR54gQxNCAOd9mZ9uVLR?=
 =?us-ascii?Q?cd5fgRB5Sk0vQqBlEZeAiw5EUIfI0l0UEqrM6mSkDfswY5dGwCQ1HZBQaMuA?=
 =?us-ascii?Q?P4QunEQxjNkKgT49UadislANCHDewGL/isxkJqYSsUjDlXCBAlvq4YWM2zru?=
 =?us-ascii?Q?i9E9Rv75/6wSopsKcQwMbppQWFiB0ag3J2gXIZO6WVWYd/DVkjaxfurag381?=
 =?us-ascii?Q?q0bYJrCuiRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TlB0TOP1zPbcVS2hrC477pjJFvyBXj3Jiedgxl0xbwugRbiPZz3FRSuXHj/D?=
 =?us-ascii?Q?jYghnsK1dIx5fSbPh6pA5VzCDRCUJY+U9dC47tPJaxWDN48E/IxzhenrX+As?=
 =?us-ascii?Q?GJWJIvLXQJfpzZIx2v9xuYlCKcsMF+T1BpzbVJ1CsyoG2Y2jYM1jMDDVGl+i?=
 =?us-ascii?Q?hgi5Vg3ughuQnLBI6wsW2mrsTbFAtTajuwlSneZQCV3LUA5xP8bx4QFriZh2?=
 =?us-ascii?Q?XpJLllRnMcFqlAT6MJlN874O08d6QEseI06n7ARuOtQrBD7Z53zT5iU3Ipgq?=
 =?us-ascii?Q?dMzl+pLU2vYXsZwkLLRzwLTkNXEkUnGFwAefI1VvQFDj3/W24maykMlZsGyD?=
 =?us-ascii?Q?7EDoPT24vITvQBq3ergE1akzCp2AlA2/YWXy4Y/pjgpoP7G5dYk25D2FP1Ck?=
 =?us-ascii?Q?GoBbZoKy2KTJbQsUYYNmU0oF7wcVnhNvgn3TL5U2rH59/eij1d2KFUD3mhhg?=
 =?us-ascii?Q?/FrRC6a2+dDWT01sJ6ZdqzYBPZbmGJsU4Pdv32NRIPiCZbin4bf3aD8FHkOR?=
 =?us-ascii?Q?OOMmWXFElJ4WOkX4MG6dS9rR3+zqDTLm7oWCB8eakUMf2T0XMRMxdQp4wmlg?=
 =?us-ascii?Q?cKwzRn1kS6BfutXuVIMzLd0O7XD4Za0La0mg5DxmXc+lzdvxDStsSlsDXEQh?=
 =?us-ascii?Q?0NSKCAjq9O17f9mD/EUGuu8PqEoNwakYcLGdHosaxigTszxo8WpuZhU7Dl+u?=
 =?us-ascii?Q?cfcETXKqK0tZlKrH1m2afSht9RNhZuJ1SNraUSYhQeND528jXP/MyUZEfT4v?=
 =?us-ascii?Q?j9aFsU7qgHh4dxk5BXAREVxCtGD4fSXVJPybFBzw5GeoV13zHkXTcZsAs0vk?=
 =?us-ascii?Q?8PqzrCDe4dJY9uz+YH7qk4w4askJ5c3r4gWfqk1rl+2d9HSm9lHkED3m2UWq?=
 =?us-ascii?Q?rG9SgdUN0RtE49NPp3hegYmOQvdrdMlIo/howNg56Z6sQNnfXK41BPU5x4K4?=
 =?us-ascii?Q?EHVymoCRrbeiyWm9Zefh60PTPuU4KY2T+Xy4plkQIocCsKKK1nZvePpvVyb7?=
 =?us-ascii?Q?t4WllFA7bT4Ri/7FrNxpjsneODmpzUVa2wHBIsYQnWccRHmS63rdp2IMEBk6?=
 =?us-ascii?Q?t2qjFH1tYoTUK7hIOhKLJ0LoRFBYP8pD8Ceitt+90cczJ7cf49wYUofniIWw?=
 =?us-ascii?Q?qI11kih5/PlgdKRd5BpxvOSohxUXuYyn4O2r+Mypwzy+IT2jqpgLRrrK0oDP?=
 =?us-ascii?Q?KD6sCIzgRJNEsSVErfahHWyT6TPV0zd2i/QxeZa6lziuIdL+Cdqeq+nRop51?=
 =?us-ascii?Q?cSDv6BnL305un5oNc5GRFjXq6/wqE0s/1X656rbLJ1Z4vyiSS9Bf6RKPIwsD?=
 =?us-ascii?Q?gXq9QPuSUleFHOYQpYRRUVeXthwi/UsMo/3aPCrfoWh1AetokBsKyuUGyAbn?=
 =?us-ascii?Q?ImdrgArFMkM2FyhBuFXMjXuT7kadCINS+N+qTxEbXSNo8ijeNLrTzUgxz90x?=
 =?us-ascii?Q?orxAew2yUeGHoKnKo7Oul88pRIBZjFkX1JcoqhUtL6t4GjT+8khm7T5qwX8u?=
 =?us-ascii?Q?tLIKaOiXvwN4PUsw/7SGWmnrry+hxhre/tf3958OSxmDT6orgg+apziDuagz?=
 =?us-ascii?Q?TA4wDNzdxjB0iFpGMAv8WO0U7Qono/zes/WHP5mRbJz1D1iQKJL5j6w8+whq?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc50c02-1706-4dec-c141-08dd81bf9a76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 17:03:28.8528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kV93kRphoNQUn1j8/dmj3xO+fxZjvsGggnPnzxgI6d5r+wXUBhZb1hQ9fEBw92drrJQsbFjlT39VkvZ4nDPYbSmPdsMH90EhshXc95P3No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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

On Thu, Apr 17, 2025 at 02:33:03PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Calculating the DSS id (index of a steered register) currently
> requires reading state from the hwconfig table and that currently
> requires dynamically allocating memory. The GuC based register capture
> (for dev core dumps) includes this index as part of the register name
> in the dump. However, it was calculating said index at the time of the
> dump for every dump. That is wasteful. It also breaks anyone trying to
> do the dump at a time when memory allocations are not allowed.
> 
> So rather than calculating on every print, just calculate at start of
> day when creating the register list in the first place.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c       | 96 +++++++++++------------
>  drivers/gpu/drm/xe/xe_guc_capture_types.h |  2 +
>  2 files changed, 48 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f4b08136e472..859a3ba91be5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -105,49 +105,49 @@ struct __guc_capture_parsed_output {
>   *     3. Incorrect order will trigger XE_WARN.
>   */
>  #define COMMON_XELP_BASE_GLOBAL \
> -	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	"FORCEWAKE_GT"}
> +	{ FORCEWAKE_GT,			REG_32BIT,	0,	0,	0,	"FORCEWAKE_GT"}
>  
>  #define COMMON_BASE_ENGINE_INSTANCE \
> -	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	"HWSTAM"}, \
> -	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	"RING_HWS_PGA"}, \
> -	{ RING_HEAD(0),			REG_32BIT,	0,	0,	"RING_HEAD"}, \
> -	{ RING_TAIL(0),			REG_32BIT,	0,	0,	"RING_TAIL"}, \
> -	{ RING_CTL(0),			REG_32BIT,	0,	0,	"RING_CTL"}, \
> -	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	"RING_MI_MODE"}, \
> -	{ RING_MODE(0),			REG_32BIT,	0,	0,	"RING_MODE"}, \
> -	{ RING_ESR(0),			REG_32BIT,	0,	0,	"RING_ESR"}, \
> -	{ RING_EMR(0),			REG_32BIT,	0,	0,	"RING_EMR"}, \
> -	{ RING_EIR(0),			REG_32BIT,	0,	0,	"RING_EIR"}, \
> -	{ RING_IMR(0),			REG_32BIT,	0,	0,	"RING_IMR"}, \
> -	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	"IPEHR"}, \
> -	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	"RING_INSTDONE"}, \
> -	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	"INDIRECT_RING_STATE"}, \
> -	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"ACTHD"}, \
> -	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_BBADDR"}, \
> -	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_START"}, \
> -	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	"RING_DMA_FADD"}, \
> -	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_STATUS"}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
> +	{ RING_HWSTAM(0),		REG_32BIT,	0,	0,	0,	"HWSTAM"}, \
> +	{ RING_HWS_PGA(0),		REG_32BIT,	0,	0,	0,	"RING_HWS_PGA"}, \
> +	{ RING_HEAD(0),			REG_32BIT,	0,	0,	0,	"RING_HEAD"}, \
> +	{ RING_TAIL(0),			REG_32BIT,	0,	0,	0,	"RING_TAIL"}, \
> +	{ RING_CTL(0),			REG_32BIT,	0,	0,	0,	"RING_CTL"}, \
> +	{ RING_MI_MODE(0),		REG_32BIT,	0,	0,	0,	"RING_MI_MODE"}, \
> +	{ RING_MODE(0),			REG_32BIT,	0,	0,	0,	"RING_MODE"}, \
> +	{ RING_ESR(0),			REG_32BIT,	0,	0,	0,	"RING_ESR"}, \
> +	{ RING_EMR(0),			REG_32BIT,	0,	0,	0,	"RING_EMR"}, \
> +	{ RING_EIR(0),			REG_32BIT,	0,	0,	0,	"RING_EIR"}, \
> +	{ RING_IMR(0),			REG_32BIT,	0,	0,	0,	"RING_IMR"}, \
> +	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
> +	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
> +	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
> +	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
> +	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_BBADDR"}, \
> +	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
> +	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}, \
> +	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_STATUS"}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_SQ_CONTENTS"}
>  
>  #define COMMON_XELP_RC_CLASS \
> -	{ RCU_MODE,			REG_32BIT,	0,	0,	"RCU_MODE"}
> +	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
>  
>  #define COMMON_XELP_RC_CLASS_INSTDONE \
> -	{ SC_INSTDONE,			REG_32BIT,	0,	0,	"SC_INSTDONE"}, \
> -	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA"}, \
> -	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	"SC_INSTDONE_EXTRA2"}
> +	{ SC_INSTDONE,			REG_32BIT,	0,	0,	0,	"SC_INSTDONE"}, \
> +	{ SC_INSTDONE_EXTRA,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA"}, \
> +	{ SC_INSTDONE_EXTRA2,		REG_32BIT,	0,	0,	0,	"SC_INSTDONE_EXTRA2"}
>  
>  #define XELP_VEC_CLASS_REGS \
> -	{ SFC_DONE(0),			0,	0,	0,	"SFC_DONE[0]"}, \
> -	{ SFC_DONE(1),			0,	0,	0,	"SFC_DONE[1]"}, \
> -	{ SFC_DONE(2),			0,	0,	0,	"SFC_DONE[2]"}, \
> -	{ SFC_DONE(3),			0,	0,	0,	"SFC_DONE[3]"}
> +	{ SFC_DONE(0),			0,	0,	0,	0,	"SFC_DONE[0]"}, \
> +	{ SFC_DONE(1),			0,	0,	0,	0,	"SFC_DONE[1]"}, \
> +	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
> +	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>  
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
> @@ -352,7 +352,7 @@ static const struct __ext_steer_reg xehpg_extregs[] = {
>  
>  static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>  			   const struct __ext_steer_reg *extlist,
> -			   int slice_id, int subslice_id)
> +			   u32 dss_id, u16 slice_id, u16 subslice_id)
>  {
>  	if (!ext || !extlist)
>  		return;
> @@ -361,6 +361,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>  	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>  	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
> +	ext->dss_id = dss_id;
>  	ext->regname = extlist->name;
>  }
>  
> @@ -397,7 +398,7 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u16 slice, subslice;
> -	int iter, i, total = 0;
> +	int dss, i, total = 0;
>  	const struct __guc_mmio_reg_descr_group *lists = guc->capture->reglists;
>  	const struct __guc_mmio_reg_descr_group *list;
>  	struct __guc_mmio_reg_descr_group *extlists;
> @@ -454,15 +455,15 @@ static void guc_capture_alloc_steered_lists(struct xe_guc *guc)
>  
>  	/* For steering registers, the list is generated at run-time */
>  	extarray = (struct __guc_mmio_reg_descr *)extlists[0].list;
> -	for_each_dss_steering(iter, gt, slice, subslice) {
> +	for_each_dss_steering(dss, gt, slice, subslice) {
>  		for (i = 0; i < ARRAY_SIZE(xe_extregs); ++i) {
> -			__fill_ext_reg(extarray, &xe_extregs[i], slice, subslice);
> +			__fill_ext_reg(extarray, &xe_extregs[i], dss, slice, subslice);
>  			++extarray;
>  		}
>  
>  		if (has_xehpg_extregs)
>  			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
> -				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
> +				__fill_ext_reg(extarray, &xehpg_extregs[i], dss, slice, subslice);
>  				++extarray;
>  			}
>  	}
> @@ -1747,17 +1748,12 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>  			 */
>  			XE_WARN_ON(low32_ready);
>  
> -			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags)) {
> -				int dss, group, instance;
> -
> -				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
> -				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -				dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> -
> -				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
> -			} else {
> +			if (FIELD_GET(GUC_REGSET_STEERING_NEEDED, reg_desc->flags))
> +				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname,
> +					   reg_desc->dss_id, value);
> +			else
>  				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
> -			}
> +
>  			break;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_types.h b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> index ca2d390ccbee..6cb439115597 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_types.h
> @@ -39,6 +39,8 @@ struct __guc_mmio_reg_descr {
>  	u32 flags;
>  	/** @mask: The mask to apply */
>  	u32 mask;
> +	/** @dss_id: Cached index for steered registers */
> +	u32 dss_id;
>  	/** @regname: Name of the register */
>  	const char *regname;
>  };
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
