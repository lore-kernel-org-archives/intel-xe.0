Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88135C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 22:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4618D10E1F5;
	Thu, 23 Jul 2026 22:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hp5hlB/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42F910E1F5
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 22:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784844392; x=1816380392;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cmAkWmM8GokqPzCAHPhtNzkmmS/QFFnIq5+nw51CHC8=;
 b=Hp5hlB/s8owuRtcdkLuXUsVGr6pvtaNSCI7RsI7w/Ad5X70j1tF5y8pG
 urjo5JJZ4BWzfrxoMU7paNRArQHTKUMY/6AS7QpcLdKaNBTD+Dwvd30JY
 Yvj4ogolHyd53A6SWO4EnhEOUljpNWYAQQuBknKgGgFlRTKv0CoYuL4y7
 jE7M2DWWxmopnXeSSlg6FFSijgzXygu5wkrSpEQuSU6dW139I0GXlHpVP
 +dSsAAVkwUjn21xDQg6ThaiBD1xoLPMbixOM8dK3T2Eff7hTnuH+m/nKE
 eYe5FhKeEvqoPOrRTT7Jz6lvOzJx3/VS9xXGc54VZCUeKtZ/8BTgrMTUo w==;
X-CSE-ConnectionGUID: 087VNLOBT2aMcZnOfvjcaA==
X-CSE-MsgGUID: kiGeetTuRS2nltVtC655VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111054285"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="111054285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 15:06:30 -0700
X-CSE-ConnectionGUID: bWFUGQFiSxiIrGwqWPTzkg==
X-CSE-MsgGUID: +fCCXUBrSeG+OJ2J0lMzyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="263511851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 15:06:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 15:06:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 15:06:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 15:06:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZQqoVodW+vEEzk1OIoSu7eNNuvb0ilEXt0siyh0moizFQi01x7xE5rt56f3iF7qFOwaSWc9ZTjfAptGqvx4L+fuEaG7QiDT4ETgCkS0MMq/PUTkO62QDthXiyUN3U3i4Wc/RUAp8GR4kkZo6zGjwaoTZgPRoFYj3HM+A6dZ5rh+HmVT6WQoZ0yXisIPS54w5FbiMAE3lcsfrX7pKNj8G8Sa4qTTqKTxJF5Fo0c978SNTOR49Pi8IAg4rsoczBx/vfbqD+B/hURBaFZwMLzd57swUa0Lt1q6GHDpoJ0Oeq1lBdZLmFrNknGZ6FAmqgMEJt3wROcrcPJp5fqA4UkIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFYJtWpF5gPyxaIo/c7bByooQwGOCsfwqujr+aCx5gA=;
 b=XV84aD3xW3KOP65EJnxC4QcoWUupm5C7nNWayEPUQG0yVH4uI+sbrhOIHG1TG1EgxYOm4U3vUnwZ1asN8TBO6YyVvlqqvQ6eJLqZzW8dzY8CYPN8sHmwJg1ltSJBrlAWyHrzHwanRoDP4foSTgZT5jU+Scv16Ek8zN1FZm1+LAilO/kCiy7a3DSfmxwGp+i9oBNUwAF9tBD4vTRT4gi2Vl50akOMZ0hDL/+ITuIsKlPIVDwSXmJalBrov4NQaX2vZyWodKiWqNkGtRH2Bh1WDzrPs1/2n6OoC1n2GMxlzscggPY8Hw/Ou/gEoiYbMI9wroEAuM5DIxCi6VDbbSHXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Thu, 23 Jul 2026 22:06:23 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 22:06:20 +0000
Date: Thu, 23 Jul 2026 15:06:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH v2] drm/xe/bo: optimise TT population for DONTNEED BOs
Message-ID: <amKQVEmRGTuh4QhC@gsse-cloud1.jf.intel.com>
References: <20260723161542.1220276-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723161542.1220276-2-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 958ed4e9-3468-4a59-29d9-08dee9069d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: FuobqQ98pU29HSKcJt/J0d+gF/ezJBuqGYTi3gwk/+9iLTQxPULilkIdJw3FzsRoq6FhekZN0KLu2x1JeZEGrBKm3ojUJjyhZEfLCNq2fcEbKfWe0FBfpeRzE5eEK5bYsgO3B6zr7ybQ4OHGbrZzmF7vkAOoroi45YTLHVShdY5ATSo+NT2eF17vGWevTKW8CtjjkZrNmtqIz/PXS1Hjsos2ElQtVUIHrxb5+EqcJARrR2O4PrEOL8Xq0W0oKVIXtf1PbX9eab/hdoVXZk3SKiGNnf3JoAgFjdgt8KtlCLafnx6n58chQ1aUFq3EZXbA5Z5mth/4RvfN6ZZnp5nVZriSg5CFqr2Cm64ODpJ/U57MJvQPtjx0F4UcC+eDDXdinMlcySYyQ5A5ccl4yDkwo5S3mmKoVTYUkx75qmqEK3tFuoDG8MgrIAmeQ4KloMSI6KldKqhUcY3kJGSz2nlGUDPq6hOkUG06xVWL7m1B6l4ld6s/WKVYNrEcsxIsNd664UuCUW6Y3pEuShZcmU6BMrYfJBHXQ0ATK10xyhHKLwHJ3rjbZmMlcs+O8Awo5oFNYXOp9kuyF2ox+UToEgftJZInZA8GM/UMxFtEIwuGXyqlSceaN97Xjtg4TarkJWUE6Ymr1cNtwQkKhh3G9YRpWt3Rug+Z4vBJVMouJVjUjZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TlYLcPt/jZx5vKGO8XFqTTPD23llzYRl7XIEH/rNw4B+kJRI0YHElzkaS7?=
 =?iso-8859-1?Q?LBwCpYTMvtxyJXsC6AnMzQrt76OrlTalsIh3LrydfVaoTJGaQN5yU5RJEB?=
 =?iso-8859-1?Q?U1X8Gf+JDTYPscLCNL3hhYArt4JpYM4MESMQOpF93AQlHI4og69bqpb9p9?=
 =?iso-8859-1?Q?Cv6qUqKmg0UROefQg/IwBTLY0rjuEsz7BdcNL3u9QDjWry/bsWPeCVwbdt?=
 =?iso-8859-1?Q?ZaF0+abckcsCH/UdduN1VrVGfZ+1uLOaFgoRCw2SawA/4LVhWEjQeKXtQb?=
 =?iso-8859-1?Q?DVL0Rc4O95MhhMOEiPViCt43c8fe1ArA3gNoH/fiMa3dAsriv8qFNcJOcn?=
 =?iso-8859-1?Q?ewfJsA2U14t2OOyhMSs9VW49Hebg+8Li9pTX+BOfRahr4jvh0wUSWmSXpY?=
 =?iso-8859-1?Q?cEm3Zh526lKex2RVb7D1umnGc/UFc2hBTrjvcwGplEiSNkydnXdpRZ4LOp?=
 =?iso-8859-1?Q?wpzzbhAkwiLDyOISsrDY0z3naaIHdr5xH2PY+2Pl3+GFYzNoAPTYf05iuU?=
 =?iso-8859-1?Q?035OqZHnUB5GklzTp53qv+60stzgvT/D1itd+bz8bBbDVHDCGzjAGR2aNL?=
 =?iso-8859-1?Q?n1xKRavqKKJbnxD52DaofAkqObOeWEycBXjNk+HJIlafx43MmzwIrI9O86?=
 =?iso-8859-1?Q?A/VrwgLBVFFXWKVDbYP2EC2b+LF7/oWf6n7r4VKgrC+UkCkEp5nTNbPFxE?=
 =?iso-8859-1?Q?TUnbB7QZ9VMaknnmIqp25OxtlObgMP9hLUQQ1JRcQnlRWqpgutnNCiOROc?=
 =?iso-8859-1?Q?xuOOjmypZ6StxfEn0Qw6cYQ1xhBQikMA+hJ5fNKboMfvw4yj3mfUj/tkKD?=
 =?iso-8859-1?Q?LXFEQU0O4CPNQLzwhiicS1SeKWoB9iWMTn6dGYdpKnXRTYMXTIs/fQLN7b?=
 =?iso-8859-1?Q?jTVs1Snl7U6Y9iJiq3ZPIF4jfjSmJYTbPz35Ratw2ACMKpLEQznn5Q6Zd+?=
 =?iso-8859-1?Q?GguJer4C2eugBz09t9n5e0yZdSjyq8BJDoGFZekHLdU5U1K2if6XFNJfmD?=
 =?iso-8859-1?Q?SoOARM71V6WiYQRxr0a+3m3DRH0fQjDwGaEn1Qp7eTJ0X+lO6+CT9cqdLw?=
 =?iso-8859-1?Q?6cu9CxOHD5gIobXlx5PEsVkuBnC56TWyUCHhYPtQ1nWI794Av8zmCDMqCH?=
 =?iso-8859-1?Q?7j7F6JtUbP7tgyWzOdGPzV5S9qC6Qj4KPxGmq1pOCaLYYS7SOLAEYZuYpH?=
 =?iso-8859-1?Q?7L4BhOHUsWE399Gf8ny2RbK12Z3mvN4bJ4XGdVRqYCdlVjumHn2Y6i86ba?=
 =?iso-8859-1?Q?g6IUimQX/nXdNfzXsled+wYZL/uFJJ76YHZGIMTSQcUZnVv+S3C6I3j3Ep?=
 =?iso-8859-1?Q?FwluOzRdT1/Ry5yimhOsVHq5uar+ze2ZC5BKUevubu5m0xpR3BOuQH/iZi?=
 =?iso-8859-1?Q?4g1iheNtA5XWDbnau3jWl7pxnxe8k1he2c7EwM0J6brSHs6Z5bXL0OjpOt?=
 =?iso-8859-1?Q?7ZpYy85nU9PsGypLKSHaDbYj4mei4IM1tTy9QrqxoIdaFKvzoxNffRFsdL?=
 =?iso-8859-1?Q?GUtJ+nzj6ZQw1k8vgMLWPIGrvCexcLSGeUeAfHSfnHFGN6BWvS6qZPdReA?=
 =?iso-8859-1?Q?AXC9+zfbMtPNEu/C16YlmfgbwbljSIurPVD7UePwEM+nU2nYHR/YPOw1n6?=
 =?iso-8859-1?Q?nZAB5WnQzUdFMRVG8gjrs4MmIC0elg3e5lGn2QCF9c2beLogvMwTJOSWDo?=
 =?iso-8859-1?Q?tZUlEJVN5qB1f+m2mD4EDWHfmlsye08Im98rjcQJhov1cW1UGJgYQ4/6Eu?=
 =?iso-8859-1?Q?zf0fXhKK1v1MMdA/s/d1J2GhXmHvJ2N7TFymJsoxj89pEJGSMdvimkv5w4?=
 =?iso-8859-1?Q?VzAwTN5kIw=3D=3D?=
X-Exchange-RoutingPolicyChecked: QSW1eeJTblemJdR4G/6iWk6pyQU6vU/MjcRNBf/jlfMIE4aF5Qb637S/nwQUbfLqnyzysLeEP18DnQGpRRjVbUfoMAlbLRr+N8Db8hQlCFyxzUICiwiMWORGsOTWJwjXzvBFbD2EuaNh8OlNv7GEZkFfagbKrYzvcQ97S3RXITfGRrz5vOXry3+AlkTHTmqtZxHl7DaoOBTGk8uvqangvfi4MbiPdADTCzRI045zXNlowIlGAVItQiU1m7tOXBZ/+gKh/0JJ39sLeKGCMwGgZxNgYOxHbDcH/D4i5Rg74kM2rravY3LpPV9ZYMGRF3yB9/xye/C2KuN2fti4VvSrQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 958ed4e9-3468-4a59-29d9-08dee9069d80
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 22:06:19.9885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfHWkQPxps+Qgxwq94lEqQY/ypUX6RolyLHNqaj/i/PdTOQA9CvURNME2ro0WfX8i8JnQ60xmC3cJT6M44geow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
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

On Thu, Jul 23, 2026 at 05:15:43PM +0100, Matthew Auld wrote:
> When a VRAM buffer object is marked as DONTNEED, like in Mesa, the
> driver skips migrating its contents to system memory and instead purges
> the backing store during eviction (via xe_ttm_bo_purge).
> 
> However, xe_evict_flags() still returns tt_placement (XE_PL_TT) for VRAM
> BOs even if they were marked DONTNEED.  This causes
> ttm_bo_handle_move_mem() to always call ttm_bo_populate() to allocate
> destination system pages, only for those pages to be immediately freed
> right after when xe_bo_move() calls xe_ttm_bo_purge().
> 
> Fix this by changing xe_evict_flags() to return sys_placement
> (XE_PL_SYSTEM) for DONTNEED BOs.  This causes TTM to skip the population
> step while still ensuring that TTM calls xe_bo_move(), so
> xe_ttm_bo_purge() still triggers.
> 
> v2 (Thomas):
>   - Add a comment to highlight why sys_placement over purge_placement.
> 
> Assisted-by: Copilot:gemini-3.1-pro-preview
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index c266fa6bade1..b1fdc802d27b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -341,6 +341,18 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>  		return;
>  	}
>  
> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		/*
> +		 * We can't use purge_placement here, since we need to trigger
> +		 * our own purge procedure at the start of xe_bo_move(), which
> +		 * would otherwise be skipped. At the same time we don't want
> +		 * ttm to then populate the tt with dst pages, before the move
> +		 * callback, hence use sys_placement here.
> +		 */
> +		*placement = sys_placement;
> +		return;
> +	}
> +
>  	/*
>  	 * For xe, sg bos that are evicted to system just triggers a
>  	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> -- 
> 2.55.0
> 
