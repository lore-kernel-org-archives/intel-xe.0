Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB5AC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 20:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E65B10E2A6;
	Tue,  5 Aug 2025 20:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1NqkLVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B5D10E2A6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754424669; x=1785960669;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8qtJ4cpRyZDaGgvcIbVB6otlVIrtu/wUOajldRj/OR0=;
 b=C1NqkLVKla64GGs10QOoMtcOsi/GrfyXFcYOe51FDq7nFjCL+BEAbk2K
 CuHq4RXi6T/KdD+RCUu+C/Hzwx2ul+SRuxt+7LmszCLpwMWHTCpuoOonR
 YFnoKFYvvdzL6mtabFCiBfSIvNKQZIqH4g7AAioG1HgW1uK59W0khc1yY
 pj8113iXqpRpv2Jmar0kNSStQk/I2hfe1im/CNKL2SaB4ikL24PW1t4hU
 jXWzH/UNtImjpLGPtvUVwSNxlwrLIO3ckTa/BQi/N261XWo8pLN7nEqaj
 b+OgK2WipmWRORgQ/79nowbQ6Y3k33vSr5ZCTL59vW+VkM0aBvEBaJfsJ A==;
X-CSE-ConnectionGUID: HOrv8zArSpSYXT7I2S4Q9g==
X-CSE-MsgGUID: UsyRK+wJRB68XbrmeWjStA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="82181461"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="82181461"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:11:09 -0700
X-CSE-ConnectionGUID: KnEBYEdHSP+oMjTQjOAvdw==
X-CSE-MsgGUID: Alv4nYzFQjaaESs1PAL92A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164121509"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 13:11:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:11:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 13:11:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 13:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7Jls7hqYrzU+gxHO9FVE8InLUKuzf7phYarJbvhMjNpUvJqrrN+v4IxBZt9aJbzJAfXnmhw7GXZH9sPbPFhjjBULMYu9YIyDRyMymtD5nCI2/h321cbIMpJk60mAS76lLuP/Cu13GHgyJF9M4Xsio2C5DKRFk2+cD7ms9pE66KCBV2roVUjRxptCZHg8DVQYhHOyBPzb8CSIc2UfEfnC1iTa1ERH6HrtBqj0ZXOU4Echvj4JA7+aAGzXEGgrktjLODK8ryesf3SKMj7HnehVzWs7ZiznmBwkkmYywSf9BXdCBXnBee7hvwnv9EyXr9XDRwhse8VaNkZMZUJjjRSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzCOkYx5RpoGgFPxfTQb7rm4FbwNtuzRpTEKsMP/X+c=;
 b=BjC/39qjmrHd6Om7JY97fbWIN2NxxEx6ss3191/H4yL9Cl/SE4d1F8Obmn9Apv72CnxeggW8H+d9bB83Zn5lGdX9AdfDeaUTS8b3rbnfEunIjDfRS8K6rw4qHwvjMaaAh4CcKYr+w7E7S3+uDfOkJ6KqWygGIy0BIHPtyUNcuPju786VUFx6xTQkxgmjCRg+EmpznzLZKOBRXawgsDHzjNclT08rQ1NmsgHKpmrrOF6DrbCzqpkGhvtAvi6X35/AGP+CfQK+80DDeZuQdxykobYAMo8/Nochnl1qV34tzeuOp8OBxbGl8TKWTN4rEDMLJxxzFm7P05/IhsXO9osMxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 20:10:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 20:10:38 +0000
Date: Tue, 5 Aug 2025 13:10:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 14/25] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Message-ID: <aJJlPMHRsiQQmfNV@lstrano-desk.jf.intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 9adcb05b-235d-4068-baa9-08ddd45c2574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+zmJZnpbHvoirOgWp55ZSPMeEBhnTDcxseU1bOk+855x8k3PchuHqcnSonGg?=
 =?us-ascii?Q?yv5PLm39s9mnRg94S66Rk5SxSXMDT8s7lTXQ9zWkiv4Bzv8DTRJXa1W1zv+v?=
 =?us-ascii?Q?p33UMs9n9RUZ1kFytFK7qC2SYGTbsVFgI0yv4p/LjNxUXYuYGHXvBTDPo/DH?=
 =?us-ascii?Q?kc5WNmVLQgejl2O/Xq/82xI20Vs9cbAS3Kgs1v2aYE537kTWJBenZuE4ywMX?=
 =?us-ascii?Q?sMKOk/A7QFgoUUf6s+VI4OP9INrBREFKIcklQ5ZjwS2ADw3pxYt/ww/O/uuq?=
 =?us-ascii?Q?Mm89SDlpQQXst8p4jgP2bkUavSi7/tRVCLEJ4GIb2vwujU7q2bNQFlpqVePs?=
 =?us-ascii?Q?WFKI5SNsvNrRSggEz0JID5oBGbTIm4UyvRSyuBt5l+lgf8aoELpYdHOdmvqL?=
 =?us-ascii?Q?rsJm7hBVqhavn59rxVNxRp1+lrlr/ibI2V3JiptiyxOWaRPKUL91w9pztQpC?=
 =?us-ascii?Q?ML8s6mF0/GM+Ui+uWkP3d9wOEFpTIHNjIeH3MstetQiKG9PJnyRAxTYB++wb?=
 =?us-ascii?Q?2GgD9zaOJ0WbXYtGBR3p7MMhH4JNWS/B+yoY1h/S1KQVjA43KYudMU5LIW+H?=
 =?us-ascii?Q?G5dBEMwP0q//wzSen7u5PGPmrWoIGSqlt+6wYTBTbqvvtnLjExC5KUr196Ta?=
 =?us-ascii?Q?DS3DYuUZ7CZn5ywyBcktJf40vuoBcllvl8aX+IPLGm28kmh2Gj548rcZQ6Hj?=
 =?us-ascii?Q?L6ooGBJQrIHqVe8dvErRszfy7JVEEu0JJWS38nsyEe8vTKH4ZfH2J/MtS9Ei?=
 =?us-ascii?Q?MNBTg/pZImxcxJa55NyOo5xr+phgwMc1yJBNhSDPznP8bR2l/1czNsivDh8Z?=
 =?us-ascii?Q?n6YJJku8MVqCWE7ILxwFRBMsbBYkz201ARRImroaicgTHDePdUEEANGsyLas?=
 =?us-ascii?Q?zgjKYA9DzsJopTdlLLaNpox+mPWxcpkBhb+9XUMSbMdJzjPSWxBQdrAIS82M?=
 =?us-ascii?Q?gKSzq2mYh1ROTJgibFcx6Tpr6WiZniBBzVl/u1+NkzrFw5UKs6Sed9cRcqm4?=
 =?us-ascii?Q?R39JWEdgTqCpkGydqV0xlRiWCPhRH4SDz1y+LBogg3fRJYQrZiysoacuaODZ?=
 =?us-ascii?Q?Y7fXAlVnmo5QJBzG5vEEzYlxDNQj00j6FBgq9e1ovEAIc3Og1ZrTyQA93wY6?=
 =?us-ascii?Q?aPp3UEdV7cZr1+R5F9hgfEKQ1/wSU7k+ScC/+E0S6oN2Hn6xV/+dnQsWb9rX?=
 =?us-ascii?Q?wF2/xeOO2OKJfn2TCG42jGNkv+hZEYrDB0SL2eWXyu7qpdKJ/Kw0uwO6m89k?=
 =?us-ascii?Q?SisM4zwAcOR6UNLCi2okF6P2qPztWz6FzoFcEYx4zK+4eUhVXCkon+3ouU3F?=
 =?us-ascii?Q?0zUz7X+h7nbPh3PLodEdMn2DV5OF38I9D8kNgrmBlA4c35l5/wlqjuNUVenx?=
 =?us-ascii?Q?8qQtlF3jceLsOWDJ2utx7m9WP4fw/BqbFDZuKzNDeWfHPfY1WtJAQLaJJ1tW?=
 =?us-ascii?Q?N15slfuk0vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcvbTIvmX8qFDKinsEcLqY14xU9KwbyUJODtbh5g/o2aW3eLjTj7HUOGVeCc?=
 =?us-ascii?Q?2/unTGeaTFcH09sA0QahaInf1I2n0y9e6X8OLWEfvX5HON9fRiP4+1p5Xq0u?=
 =?us-ascii?Q?JFBnouHNcNglzua9PssC/ERfdUEl+9GjFi3gMqXVqC7ppsHCwXYfmL+xch/U?=
 =?us-ascii?Q?+xMNt4Aq/iY5Hli++Mcp2XOTfiIJH2GN2GF1jgJBRXa8qjZNqqIbqwwu0ujZ?=
 =?us-ascii?Q?BEBWmX8LxJQD8B71uK7+fcVGRg7moLNc36zjiS9wyMCN7Q5f1Pjl/aCBY7wB?=
 =?us-ascii?Q?PsK8Fgl9GnSMO6GWkEY8TEBtj93anc82IzKdWfA0xtQeMHTBQPqjzbRITgS4?=
 =?us-ascii?Q?r5LIYbGAqVpyb2bCTpVv0cCrtWui6bv1oigJD0HHEKP6fXB3qdGmbBjpP91U?=
 =?us-ascii?Q?0Yj1ks2AmH1cMHghgQtcFsB1boUAU83xUmdXOCempy8LfnhFFIxKKagV5vcY?=
 =?us-ascii?Q?fKGKE2ewGs2hAZI5zVl2Gl8kPafDcfA4ErCP9wFafA4Elx/JplYh3mRRSJ52?=
 =?us-ascii?Q?WiT5NEygltEwlh3tOy6leIAlQqykna7/Hx2MzJFKSJunlmTNDUQTCzwvXrZm?=
 =?us-ascii?Q?RSkFJcfLfhTR+e6nZf0IVO+3dyDyOWxfd5STtmH/fOCcffRX1MpPw2ydwuFE?=
 =?us-ascii?Q?zt3Tk6MWLn++b44QiCoFtSXJ1IgJW5iEfGjNQFymVQWgkvNkyA8tvXFwYFID?=
 =?us-ascii?Q?F07Sez4AK3ZxrhPmcFARHi3R2MHor0hxcAi5x4LTmRQySLftMHF/k0ac2CsF?=
 =?us-ascii?Q?4KlSWi1bBEBtgJHB7UhhRY6K0C8jweyGBiSkhwwmicTuqLEHYZmE0Q4BgR4O?=
 =?us-ascii?Q?HCbTtIEa9dwpUhtOAxJSxOg+Mri4Uw41KnR6JvwUOW+bA6qNYlYIQKqxygsR?=
 =?us-ascii?Q?UPXZML6URmA+jzSFjBMCr4+YNC0zkV3ZAk2+0J5IuTzPP4NZVxDrAiGCcOh8?=
 =?us-ascii?Q?XJM91c2GCXIdjxgeqkHmTIfIQW6vI9tOm6zP1UTcj8t+7mPkx/lUI9zK0Jbe?=
 =?us-ascii?Q?823qeKLUFlCNGpz+yobRbZYA12JQnFbK1yyeP7hbdMp/UR9BhfNwP+eZ6Jb1?=
 =?us-ascii?Q?HzkXBRKuttBmnIycvZNp7j/WOTJjfh73DL8svVsKBucnkrUT34eTujLkTtdZ?=
 =?us-ascii?Q?TUTyDxRFb4uORMSqc84nkuv1SxA6g7syu6PBTUzHUcs1V1DMpS2jrSmsbt1M?=
 =?us-ascii?Q?JrI5wrhfOF9dd5Y2r1/APcJR6L65hAgmP+MskTIcdYDfpdXNFYOlr1VTZFv8?=
 =?us-ascii?Q?KJWr+axpkbQeG/kmfoUcUPumnVX5hLMkowHg98ffvJMs7xb9+YIkttZKZH6x?=
 =?us-ascii?Q?vzNACgpx/ilZObGIUaRGsZ1tdrNI8hBWbDk8wJ99Vzkx/AvQu2+mUAUvvW+D?=
 =?us-ascii?Q?xt+AGDcoz3wzYOJzSlcwunRv5JQXPJLsXz5pyw54aiN8pRo9W8JQ5ldGhLWT?=
 =?us-ascii?Q?a8ObCwkc2z6bpQogzZJ5d9YLOWW8n2wg+gCbgMxb4FDSjm6iORMfISbqmxvs?=
 =?us-ascii?Q?LjE/Mr5dFwo8mThYJbqwGjTa9z5Ddjx/By29W528Pke2Y3WNsA9dsF6wHAkG?=
 =?us-ascii?Q?1Gaj9bK8/9/i7Cmiw84qJwhlGhh6c8+BUw/IMh5/kGszgsew10L9jUBh8O4U?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9adcb05b-235d-4068-baa9-08ddd45c2574
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:10:38.8503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srO6kVyRTF83T0IEN5BX1teVfQSkXHG0v+GSEOClp68vDODg3O1hnbigh3Hw3xbzbz2SeuLONQNhIhNH2GFhfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

On Wed, Jul 30, 2025 at 06:30:39PM +0530, Himal Prasad Ghimiray wrote:
> If the platform does not support atomic access on system memory, and the
> ranges are in system memory, but the user requires atomic accesses on
> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
> operations as well.
> 
> v2
> - Drop unnecessary vm_dbg
> 
> v3 (Matthew Brost)
> - fix atomic policy
> - prefetch shouldn't have any impact of atomic
> - bo can be accessed from vma, avoid duplicate parameter
> 
> v4 (Matthew Brost)
> - Remove TODO comment
> - Fix comment
> - Dont allow gpu atomic ops when user is setting atomic attr as CPU
> 
> v5 (Matthew Brost)
> - Fix atomic checks
> - Add userptr checks
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++++--------
>  drivers/gpu/drm/xe/xe_svm.c        |  8 ++++--
>  drivers/gpu/drm/xe/xe_vm.c         | 39 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h         |  2 ++
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
>  5 files changed, 74 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 593fef438cd8..6f5b384991cd 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   *    - In all other cases device atomics will be disabled with AE=0 until an application
>   *      request differently using a ioctl like madvise.
>   */
> -static bool xe_atomic_for_vram(struct xe_vm *vm)
> +static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
>  {
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
> +		return false;
> +
>  	return true;
>  }
>  
> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
> +static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>  {
>  	struct xe_device *xe = vm->xe;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>  
> -	if (!xe->info.has_device_atomics_on_smem)
> +	if (!xe->info.has_device_atomics_on_smem ||
> +	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
>  		return false;
>  
> +	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
> +		return true;
> +
>  	/*
>  	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>  	 * atomics will cause a gpu page fault and which then
>  	 * gets migrated to LMEM, bind such allocations with
>  	 * device atomics enabled.
> -	 *
> -	 * TODO: Revisit this. Perhaps add something like a
> -	 * fault_on_atomics_in_system UAPI flag.
> -	 * Note that this also prohibits GPU atomics in LR mode for
> -	 * userptr and system memory on DGFX.
>  	 */
>  	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
>  				 (bo && xe_bo_has_single_placement(bo))));
> @@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		goto walk_pt;
>  
>  	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
> -		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
> +		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 1d0b444bf2ae..5e78beebe114 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -793,14 +793,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> +	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
> +
> +	if (need_vram < 0)
> +		return need_vram;
> +
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
>  		.devmem_possible = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.check_pages_threshold = IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
> -		.devmem_only = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> +		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
>  		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
>  			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d039779412b3..463736db19d9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	kvfree(snap);
>  }
>  
> +/**
> + * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
> + * @xe: Pointer to the XE device structure
> + * @vma: Pointer to the virtual memory area (VMA) structure
> + * @is_atomic: In pagefault path and atomic operation
> + *
> + * This function determines whether the given VMA needs to be migrated to
> + * VRAM in order to do atomic GPU operation.
> + *
> + * Return:
> + *   1        - Migration to VRAM is required
> + *   0        - Migration is not required
> + *   -EINVAL  - Invalid access for atomic memory attr

Also how about -EACCES here?

Matt

> + *
> + */
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
> +{
> +	if (!IS_DGFX(xe) || !is_atomic)
> +		return 0;
> +
> +	/*
> +	 * NOTE: The checks implemented here are platform-specific. For
> +	 * instance, on a device supporting CXL atomics, these would ideally
> +	 * work universally without additional handling.
> +	 */
> +	switch (vma->attr.atomic_access) {
> +	case DRM_XE_ATOMIC_DEVICE:
> +		return !xe->info.has_device_atomics_on_smem;
> +
> +	case DRM_XE_ATOMIC_CPU:
> +		return -EINVAL;
> +
> +	case DRM_XE_ATOMIC_UNDEFINED:
> +	case DRM_XE_ATOMIC_GLOBAL:
> +	default:
> +		return 1;
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0d6b08cc4163..05ac3118d9f4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>  
>  struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>  
> +int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
> +
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index b861c3349b0a..a53b63dd603d 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			   struct xe_vma **vmas, int num_vmas,
>  			   struct drm_xe_madvise *op)
>  {
> -	/* Implementation pending */
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
> +	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		if (xe_vma_is_userptr(vmas[i])) {
> +			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
> +			      xe->info.has_device_atomics_on_smem))
> +				continue;
> +		}
> +		vmas[i]->attr.atomic_access = op->atomic.val;
> +	/*TODO: handle bo backed vmas */
> +	}
>  }
>  
>  static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> -- 
> 2.34.1
> 
