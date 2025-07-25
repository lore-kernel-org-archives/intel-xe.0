Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68847C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 21:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B910E053;
	Fri, 25 Jul 2025 21:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QR/5PdNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9309B10E053
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 21:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753479932; x=1785015932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f3EbZz9HNxKPVb1Z4TRU4KsZHokC2fsHzzTC5oc+Y90=;
 b=QR/5PdNh1DWnSAew2cezbnih3ZMW5SaTA9wihw+DV/freutVVOQs3JXe
 gPK+AOXetbxK+OMO+0u4x0qIkXjj7Qp1i0Qp/0ngMH78r2MHIai+V6Nu3
 kzJJzeOtt4yPyhh9d9kQTZRQmAakLKijnsDpM2BDx/NZg2XgmynWfafAq
 Wy1P2PPC2vOuhQkIvgbj/TJ1v6BYuLEKkI9sy+Q3HaRABkxe4JPgjVAOO
 0JCq7InQQdp57oUbg9Ywv5x+7CDr6iWk4RuENABLg1zVaSWq1L+ccR29p
 bl4Q2SLRkUkH64E+oSctv3FhSVBQKgCgHBD7dSerC9O9n8OEJA7o9XwUt Q==;
X-CSE-ConnectionGUID: cTgQV6N3SWC7czjVI0mRrw==
X-CSE-MsgGUID: sPJl+AyzQHuyHVNuWzWu4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55787111"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55787111"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:45:24 -0700
X-CSE-ConnectionGUID: T2Gk2GWoT+izAIll1vWrhw==
X-CSE-MsgGUID: eUEvPiipRCSCx3KnclxkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="166511654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 14:45:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:45:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 14:45:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 14:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux35af5qQxKH9DXOvG9QgHtYqsW8TNPXgTTfF5aLkcDnwUHDjDyaEfW9a09oSaBdQjRsbVra4W/TB2Rj+LKbatQvrHBYyjQ3RlWCH/c9QE6QXEOyN3WNBT20yhcVEVGJXKP5fIJN1Arrt7AVa0J7u2MANW7FaiorQFmzOkvarYqWNMrghr+OayaQPAQBCopIQL4DNf6GvzYb022IVTGRu4SS0lHyusW7SzYxYQjvb02GuEHeoxdcJAZ5f4MxNW1tN+/aU6fgvG6a1nh8Wsg+v8K42V37Zo3hF5j+j33nIzpX99EjrVOPgYQP5weur9K51BONEBjJcC+STpzX1p3B6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C9hUFGH8XWULfmNIGLCUyDj2gcvCkyEcfoChHkj92Y=;
 b=fHTOawGsX9yn7N6mcFT+hdP0927k1LN7GwGKP8yYxDKjqbdXNNu6Vg4A1uiHPlsowoHvOABTJOxc5c58+FvZ4C/nsQMC6DdU3W0khwfS1PVR54iv0w7LxpGoQZoKYUOhTK17B70NQFVLXBI07VAlM5tAx0jkn8J9Tm/8mfFqTiEa3d/tRN6avYlJUdu78qpBbnbpQp+UNQNxAllQb7L48/c5YJPHnUcbC5R+31+PVnOthHsuVcMgt5jshOUWMiy+guOO+MwlLyE389FLzRsDenNMwjqpxl4Ii9oK5iNLsWn0Y00nmLOu5W3bwP9gGcy09KSbz3T5s4eg6krQIIHAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8408.namprd11.prod.outlook.com (2603:10b6:930:b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 21:45:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 21:45:05 +0000
Date: Fri, 25 Jul 2025 14:46:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/6] drm/pagemap: Rename drm_pagemap_device_addr to
 drm_pagemap_addr
Message-ID: <aIP7Tgjb/aZ5N/bF@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725154011.2807655-2-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8f2444-946c-4bfe-f081-08ddcbc484c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zPMyzDEypT4ecTpSsurC58L2G+ombxWH84GZvNXRtVMhSA8h4E4EAV04xAnE?=
 =?us-ascii?Q?ockjQFlqQUiPApVfYSzuhsST9eZVvZ12Xez9Bj+w1/AgYjwqtGCauQb5FhgH?=
 =?us-ascii?Q?Sqxbf+B1uKdZ1O4qxg00CXGCk7OyxkYxAwbyq+Fxquz7hRPZ0hCSNSvLT0bO?=
 =?us-ascii?Q?tU6qwu6TKCHKPLgOSQfPHJLGGnYqooe7GR7hDCQxC0U2UT/O4PFPyDsBQPhJ?=
 =?us-ascii?Q?TRK2NquDwUEo8vT0MFHPnu9N0KlCvK94TZOoq9hDPSgXPcc2sTNyOFGMzPA5?=
 =?us-ascii?Q?Cuy+IUaw4INgGI/cRY8dSj8SMQ5J8FhOYtxGcs7+797a/+ghZF+7s2wNDiVY?=
 =?us-ascii?Q?kkiB5zeNFFQC4AxIWNQ5RbucRsKhSkdvj24zwVpeihWJihDSbsvSnYgKqGFx?=
 =?us-ascii?Q?Ycwr+/XBjN1FEgI2GGMXG2PW2LC4aWnNN28//5pjZY32tXFI6Hcxxxsw7+Yi?=
 =?us-ascii?Q?cdZ6e3qHnvRhG2mptrC1b/9RCMZy/IlisaSJq2Qic8VsMuEen+P+EUYgthU2?=
 =?us-ascii?Q?Yct6rfdvHkj3Psw6ZbR3Bxe2Y8mgF6xaBjxfvKwE2vzJEpNPIsK0pRGjACuC?=
 =?us-ascii?Q?/9LSMhKHBTsnl49MLP3BNY0XbSbMRBVb9CQhHyY3Kph6TJojwFVuTU388Ndj?=
 =?us-ascii?Q?ja8CfK3lrBxlm/q4vedAn9teJDjBn4/ZmFMo0wzi7lVmP9EHxjb5c4ZFkqUi?=
 =?us-ascii?Q?M98YbQXatrJRpcSYgROX4D+RhlHyIlFpJouvjnW5hxK/FMjyng9cj/reJzpS?=
 =?us-ascii?Q?H99AU3pECzgpYjSIN2LGAgCcico84bFlcPEYOaTbuntZT+gRrNSiHrfwTbyP?=
 =?us-ascii?Q?DUafbLr890xA6XLrQOO/bIyNj4aAxVKVq9SqUbMfVCExFPUluZi3q58Fwbkl?=
 =?us-ascii?Q?cidWnZimp3JZp5ltSHXvlqUSyE5wztJ+8XINeltAYYqlRRxaQ0Vo3CN2IsME?=
 =?us-ascii?Q?5CUtvX1csbYfyyQ5Awi8Fyette3OH8UdgYiRDhgxqNkOTMLylWz5R57aM2iG?=
 =?us-ascii?Q?NAnIRmYOv64jUel2+iyk3kLqpimhTMFENhBxxmLhhKLJ04F3SgA/iM5gxAaA?=
 =?us-ascii?Q?uV1WqCiANwyW9VnDIhOMOuq9u5fnmSYaZmDHqnuUNMpaKXuL8S4v/SKwvWYu?=
 =?us-ascii?Q?C6qepWsfyFQZbTAQNJv7tuSYzZa37Mq9rAwyjmsyjLEk9cYcjCuGP6m3k6Ga?=
 =?us-ascii?Q?wI0AmCgs52miEylyhPapJP5vUPbFMx1kwRO+/rhqyf6bN/w82sKlV4p+Z8qi?=
 =?us-ascii?Q?+nc2P8eGigJnNIYBVZg2oy0wbEwIh0wGnsqOnD60svpYe8YFh5hPZ5UMEKRc?=
 =?us-ascii?Q?NPLlgpyNBjmnTmcFCvA0tlRQ0MBlWpPtxrkuoRz2kA8/NieQYxzKz+igPbvN?=
 =?us-ascii?Q?3bgWWHAjBJpcNQmtJfV0p/+FvDVgAv8Zu+c57oDs/OJU562be4nc7MVPT/2v?=
 =?us-ascii?Q?AApgb7fe2hA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QVOB1JA6GlTdMCoAigM9xrviP0jmMz9TnYr5CB63k/FIQu4Khz9jd5UXnLOk?=
 =?us-ascii?Q?xoFjN3LZssTvEpNqbo3oRUpME5eI/TY/iHkr4nCv4g4iHPHUNRJdeP6X/ohu?=
 =?us-ascii?Q?lHR38G+xUrsPIMdkoyiDtkA2PWWvua9uWxT/T7+3sE+aH80REP9Bw0DCZx0Z?=
 =?us-ascii?Q?TL9uHiOmx2jGz7OTUBaO/zSXOLx+SQbMSj85vPrpWqJ4gUZiM2GWI5gRNdrF?=
 =?us-ascii?Q?C74hZd4dBKLKmlGcLur2lQ0XgV9v4YL7xDXqiJjXFRrRtHPnRBt/naEoipFM?=
 =?us-ascii?Q?88UMUFbKs6r4mxh0zu3RXX1Ny/CZam8QfGXcg1mk1HclfhItt29B/ZST7jeS?=
 =?us-ascii?Q?qbszSWFGp8LtxHPMoNPCAH5UUXlogBWXSpUJ1mpyfqCtMZuwfgpx5F/iyjbV?=
 =?us-ascii?Q?k9siMI1KkN4CQf7P0vNCJNBEFIMebh6F1gJDRvcj0/cujBLHio1zwl1xEIq/?=
 =?us-ascii?Q?swxJMZutK+fAwm8wfKGIKCwJyugSrxltTypbPdxs47x7cvg9paYTpjqq5E+p?=
 =?us-ascii?Q?7MvkTwGOUmwXV8d7OtdYV5HUyLTU7t7bGDixEJADgKZid2+yWxSgDMaWCaCC?=
 =?us-ascii?Q?3W3tN/mlaft9j0qbzxM0/IIUqvu/qusR8u9gf3B5O84Ccf81ATURzNQEYg+C?=
 =?us-ascii?Q?F3M+Hr2Bqc6uCc5uqQzJfuFH6s3rLLDI1S+vYfAcUOyBq4b4dB2E+9A1Oc8l?=
 =?us-ascii?Q?uAyuhg87uve0WV7HK8KWjbv39pyJORDAsIQtgb6dvS729GG0IB8Actc9ZXMl?=
 =?us-ascii?Q?wFf6qa+dSWWQnt8PVBzUd6d2kR1PS0KLIeSnjqBMQZRxZBmt6A4uFLY14rUo?=
 =?us-ascii?Q?N+/2chb/HYaF2cs4OzUvSvacbQTXzyBVnFtQHI1104sXhUrP12aqSbzIq1Ma?=
 =?us-ascii?Q?6DzA3i+ChtKZbyDmDRHz4txLw3droqbv4GsVCrf/o/sxmG4ZtiLhf5u+jWaP?=
 =?us-ascii?Q?6/eOmVIZxvgOu5zVaPDfqi9sDnqbEjaGVy1BL43ArhX4VTa6QGY9GM7V54IT?=
 =?us-ascii?Q?ufryaETMSiSKhcaiAHETc8GE+6hO4K2TXZ/LilGsskFnaSFNP43743Fcqn7Y?=
 =?us-ascii?Q?dfqCDbBbGsZrIw7pE+GXMQpjRuPQhu0793LY4NCuZJCuU59izM08zRyP4T0I?=
 =?us-ascii?Q?2UNs06NEfugGe8S5vM3yKsZSqqgovBN4wzIKXE+FmSKOUusBQniqhVLSKFVp?=
 =?us-ascii?Q?tqPO2HIgkZgVQK2QOTfNnFFlcUSCfOLweiRlJWye6Tb4ILKWNLS06wI73G5A?=
 =?us-ascii?Q?oeiMCgkvA0LgcfYPZEGBbCXV+yNXZFbj8smvTmIx0eclupCXFr9lYYd8Ivsa?=
 =?us-ascii?Q?/BAKQqCpj+2PjBL6XDauKSGI+3NcAP2me8n8dzHvI9sj8OAiP7/rWclRZLI+?=
 =?us-ascii?Q?5+S/uOi4muDHj3THVOg7cMfmCWHB5Bg6XTTgxRuCuZwJTmzXR9/GAePArNKI?=
 =?us-ascii?Q?7vjJifEEe2K5CcdC4Bb6tYPxyavhDFrqIKLW2cQq5iI4SbEDC/nli9KrR3bh?=
 =?us-ascii?Q?rXYTOIMZwBbPdfdhzzP5+8nuobXmIDweW7wceS9RxfhG5FpG1BzoasYHcZeF?=
 =?us-ascii?Q?HLRJNxgbnvtYjuE2mlfBNET2rjD0VAeSaC1e73RRUnjse5htlUADtEG/yHe0?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8f2444-946c-4bfe-f081-08ddcbc484c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 21:45:05.9281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75U55wrToAnZGQnhO7SG+64K0FHKAcfFIISxXjZ10tmSjvlL/EvfNw8DwnDg1trt8Yqwd5u8megUUrI/221AGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8408
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

On Fri, Jul 25, 2025 at 05:39:25PM +0200, Francois Dugast wrote:
> Rename this struct to the more generic name drm_pagemap_addr so it can be
> used in a broader context, such as DMA mappings of CPU memory.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_gpusvm.c       |  4 ++--
>  drivers/gpu/drm/xe/xe_res_cursor.h | 10 +++++-----
>  drivers/gpu/drm/xe/xe_svm.c        |  4 ++--
>  drivers/gpu/drm/xe/xe_svm.h        |  4 ++--
>  include/drm/drm_gpusvm.h           |  4 ++--
>  include/drm/drm_pagemap.h          | 32 +++++++++++++++---------------
>  6 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 5bb4c77db2c3..661306da6b2d 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1048,7 +1048,7 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>  		};
>  
>  		for (i = 0, j = 0; i < npages; j++) {
> -			struct drm_pagemap_device_addr *addr = &range->dma_addr[j];
> +			struct drm_pagemap_addr *addr = &range->dma_addr[j];
>  
>  			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
>  				dma_unmap_page(dev,
> @@ -1400,7 +1400,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> -			range->dma_addr[j] = drm_pagemap_device_addr_encode
> +			range->dma_addr[j] = drm_pagemap_addr_encode
>  				(addr, DRM_INTERCONNECT_SYSTEM, order,
>  				 DMA_BIDIRECTIONAL);
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index d1a403cfb628..4e00008b7081 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -55,8 +55,8 @@ struct xe_res_cursor {
>  	u32 mem_type;
>  	/** @sgl: Scatterlist for cursor */
>  	struct scatterlist *sgl;
> -	/** @dma_addr: Current element in a struct drm_pagemap_device_addr array */
> -	const struct drm_pagemap_device_addr *dma_addr;
> +	/** @dma_addr: Current element in a struct drm_pagemap_addr array */
> +	const struct drm_pagemap_addr *dma_addr;
>  	/** @mm: Buddy allocator for VRAM cursor */
>  	struct drm_buddy *mm;
>  	/**
> @@ -170,7 +170,7 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
>   */
>  static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
>  {
> -	const struct drm_pagemap_device_addr *addr = cur->dma_addr;
> +	const struct drm_pagemap_addr *addr = cur->dma_addr;
>  	u64 start = cur->start;
>  
>  	while (start >= cur->dma_seg_size) {
> @@ -222,14 +222,14 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
>  /**
>   * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
>   *
> - * @dma_addr: struct drm_pagemap_device_addr array to walk
> + * @dma_addr: struct drm_pagemap_addr array to walk
>   * @start: Start of the range
>   * @size: Size of the range
>   * @cur: cursor object to initialize
>   *
>   * Start walking over the range of allocations between @start and @size.
>   */
> -static inline void xe_res_first_dma(const struct drm_pagemap_device_addr *dma_addr,
> +static inline void xe_res_first_dma(const struct drm_pagemap_addr *dma_addr,
>  				    u64 start, u64 size,
>  				    struct xe_res_cursor *cur)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..3e4f4a8760ee 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1014,7 +1014,7 @@ int xe_svm_alloc_vram(struct xe_tile *tile, struct xe_svm_range *range,
>  				       ctx->timeslice_ms);
>  }
>  
> -static struct drm_pagemap_device_addr
> +static struct drm_pagemap_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  struct device *dev,
>  			  struct page *page,
> @@ -1033,7 +1033,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  		prot = 0;
>  	}
>  
> -	return drm_pagemap_device_addr_encode(addr, prot, order, dir);
> +	return drm_pagemap_addr_encode(addr, prot, order, dir);
>  }
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index da9a69ea0bb1..4bdccb56d25f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -163,7 +163,7 @@ void xe_svm_flush(struct xe_vm *vm);
>  #else
>  #include <linux/interval_tree.h>
>  
> -struct drm_pagemap_device_addr;
> +struct drm_pagemap_addr;
>  struct drm_gpusvm_ctx;
>  struct drm_gpusvm_range;
>  struct xe_bo;
> @@ -178,7 +178,7 @@ struct xe_vram_region;
>  struct xe_svm_range {
>  	struct {
>  		struct interval_tree_node itree;
> -		const struct drm_pagemap_device_addr *dma_addr;
> +		const struct drm_pagemap_addr *dma_addr;
>  	} base;
>  	u32 tile_present;
>  	u32 tile_invalidated;
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 4aedc5423aff..8d613e9b2690 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -17,7 +17,7 @@ struct drm_gpusvm_notifier;
>  struct drm_gpusvm_ops;
>  struct drm_gpusvm_range;
>  struct drm_pagemap;
> -struct drm_pagemap_device_addr;
> +struct drm_pagemap_addr;
>  
>  /**
>   * struct drm_gpusvm_ops - Operations structure for GPU SVM
> @@ -154,7 +154,7 @@ struct drm_gpusvm_range {
>  	struct interval_tree_node itree;
>  	struct list_head entry;
>  	unsigned long notifier_seq;
> -	struct drm_pagemap_device_addr *dma_addr;
> +	struct drm_pagemap_addr *dma_addr;
>  	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_range_flags flags;
>  };
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index e5f20a1235be..69d6ee49a3de 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -23,7 +23,7 @@ enum drm_interconnect_protocol {
>  };
>  
>  /**
> - * struct drm_pagemap_device_addr - Device address representation.
> + * struct drm_pagemap_addr - Address representation.
>   * @addr: The dma address or driver-defined address for driver private interconnects.
>   * @proto: The interconnect protocol.
>   * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
> @@ -32,7 +32,7 @@ enum drm_interconnect_protocol {
>   * Note: There is room for improvement here. We should be able to pack into
>   * 64 bits.
>   */
> -struct drm_pagemap_device_addr {
> +struct drm_pagemap_addr {
>  	dma_addr_t addr;
>  	u64 proto : 54;
>  	u64 order : 8;
> @@ -40,21 +40,21 @@ struct drm_pagemap_device_addr {
>  };
>  
>  /**
> - * drm_pagemap_device_addr_encode() - Encode a dma address with metadata
> + * drm_pagemap_addr_encode() - Encode a dma address with metadata
>   * @addr: The dma address or driver-defined address for driver private interconnects.
>   * @proto: The interconnect protocol.
>   * @order: The page order of the dma mapping. (Size is PAGE_SIZE << order).
>   * @dir: The DMA direction.
>   *
> - * Return: A struct drm_pagemap_device_addr encoding the above information.
> + * Return: A struct drm_pagemap_addr encoding the above information.
>   */
> -static inline struct drm_pagemap_device_addr
> -drm_pagemap_device_addr_encode(dma_addr_t addr,
> -			       enum drm_interconnect_protocol proto,
> -			       unsigned int order,
> -			       enum dma_data_direction dir)
> +static inline struct drm_pagemap_addr
> +drm_pagemap_addr_encode(dma_addr_t addr,
> +			enum drm_interconnect_protocol proto,
> +			unsigned int order,
> +			enum dma_data_direction dir)
>  {
> -	return (struct drm_pagemap_device_addr) {
> +	return (struct drm_pagemap_addr) {
>  		.addr = addr,
>  		.proto = proto,
>  		.order = order,
> @@ -75,11 +75,11 @@ struct drm_pagemap_ops {
>  	 * @order: The page order of the device mapping. (Size is PAGE_SIZE << order).
>  	 * @dir: The transfer direction.
>  	 */
> -	struct drm_pagemap_device_addr (*device_map)(struct drm_pagemap *dpagemap,
> -						     struct device *dev,
> -						     struct page *page,
> -						     unsigned int order,
> -						     enum dma_data_direction dir);
> +	struct drm_pagemap_addr (*device_map)(struct drm_pagemap *dpagemap,
> +					      struct device *dev,
> +					      struct page *page,
> +					      unsigned int order,
> +					      enum dma_data_direction dir);
>  
>  	/**
>  	 * @device_unmap: Unmap a device address previously obtained using @device_map.
> @@ -90,7 +90,7 @@ struct drm_pagemap_ops {
>  	 */
>  	void (*device_unmap)(struct drm_pagemap *dpagemap,
>  			     struct device *dev,
> -			     struct drm_pagemap_device_addr addr);
> +			     struct drm_pagemap_addr addr);
>  
>  	/**
>  	 * @populate_mm: Populate part of the mm with @dpagemap memory,
> -- 
> 2.43.0
> 
