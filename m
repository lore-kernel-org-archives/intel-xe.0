Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801CC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 20:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658C710E00E;
	Thu,  6 Feb 2025 20:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjTs65Wx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888B510E94F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 20:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738875193; x=1770411193;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5u83i9pX+q80e8A9tpiNC3ZXPQZ/hlxMxr4HWNa6qgA=;
 b=VjTs65WxaPm+LZBpnjOhNgfbxpaNS4qHZ9F5lRP1d0ItRRLxB5GYK/Ha
 ANNon4XPwm1JgWUtK+bgrAhuYl0J1aX0c4L5k7yM3X+jHWXDgoEWDSCo5
 qnWmnUnz9JAV9sBOeYjJ7tUJbyKFrT0vhjPeNyB2Mj7gltodJUVtO7L29
 CoyqSWNjeLQp1pll3to5IhCt/fSKG8H0nNvbuUcA17Lkzs+3JwBs6N+hX
 xnBFZigXjZ/5tyi5wYoKRZIVYViJr2hyzFjoXKBiy7WQRHkIiZaApHvPR
 Xv+ablnmHxkYNcRpFvl5yoRrDeWkZfWj0/nCaI+lot3G+WN+0/7mMjoWt A==;
X-CSE-ConnectionGUID: zHL9IxDpSIOXJU5iRYUfhA==
X-CSE-MsgGUID: Rfj/6NQ+SduUXxg0YnFq9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39620066"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39620066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 12:53:12 -0800
X-CSE-ConnectionGUID: 0Z3YhFTpTDCodUdRlI8h6Q==
X-CSE-MsgGUID: Rst+EeV8TQKiYF/F01UrPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111757738"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 12:53:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 12:53:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 12:53:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 12:53:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6DRBWqF/Jht9+VPR6AoqE/t7MjeSREQqQm0Gsl2a62gWXP6JexCsPlGbCVUNOko4avhhoO1w6S537Gw31VkT0ek7BY5W6611XcFlvG+k+Y+na/aULKHSf0LtWeo8xLNAp83uk5Bk3GF67eG1fH1gcMhHgD3rYRNl9ctdZ6n9GDSjE3wLHCOsIySGNoA3phhuWhSWnaFsA6ARTna5vDTmedgfvlmjk0HUb+4vz2mEDSxcpMYwT4+6eZe5ABd/LnqOkv+OCg8VSeSA0/qab/bjWIhbfYSJSbYPPnlSRNUg/wdHn6uT01qvWG9TQ5LxQnHGVAxtWtK3jzohXrl0xL6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPFRX+pbtksH6aXMD6tyxweVibrNAdmHrkLHaBl3e88=;
 b=XE0q57xjY5HsygfedGWwTbd+8rPUG8jX95cUX8GdQzeoFmHb95K6WeU9KrWaeXXyPSmky/mrZXr1mNq9yop2m4gxO627evPT13aeqM39GeqnCzL7P3Zdau6r6NeQFBoy/a1Zf6+qcz8ROz5Bw4Wc6p9LpDxg/4yzwqk09yD6PZvzPR5IJnVklNsxQQsL/AXpL44mw4wFx4KRkdsYZoDFBLz1+Y6DiJN6j3hvO6J68MXrrKFjmFzkMVhVMcnRkhYJx76ETc5kAEqU0/+Zu9dkKEnU0VCpwsyWKW/PGC2o9lPmEzTiNI+2cS9tgoNH3RneATHdJEz/p0zsllQZB00xHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SN7PR11MB6971.namprd11.prod.outlook.com (2603:10b6:806:2ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 20:52:27 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 20:52:26 +0000
Date: Thu, 6 Feb 2025 15:52:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Move VRAM manager to struct xe_vram_region
Message-ID: <Z6UhB7OM6iaEbcno@intel.com>
References: <20250203135359.735832-1-piotr.piorkowski@intel.com>
 <20250203135359.735832-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203135359.735832-3-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MW4PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:303:b5::35) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SN7PR11MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 54539cf0-b6df-42b2-2fa4-08dd46f02973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jf95lemUaXWdRa93grZ6PkHGN0EJPuitGrpg3KMM7tBRwF1FNSP/mLFLiP?=
 =?iso-8859-1?Q?iulhAietHXP/cv9ycZudIMa3YPvpC+Wm8hBHHdZnH/x74r6Y8JIax/c68R?=
 =?iso-8859-1?Q?BH6AT3DFuEsrXhOVV2B5+I+rGUadKrd71zXcImcSLMd7U+MUuSL9pK88A3?=
 =?iso-8859-1?Q?TqyS+sKR0+2JQiUxHcgAahKjFLAOkQV0zT/t3B+JCBf/DdehyBf/YFGgmL?=
 =?iso-8859-1?Q?EfVD3uj1yixlSOlkHmeB1Oeu8Fe2y8lXcem0cVTkMd6ZsAlUYlL6WDrnem?=
 =?iso-8859-1?Q?roPsP8CKSGXOaZz8XsKEN8qNyR8pNqFfU9R8PfS+jx5HUljbznNNUoHClW?=
 =?iso-8859-1?Q?K8m7JEUZ0IMq7c5or8e8CLmzRthXNqINUxmy7/35xBhcUQpMy2wCKy0fXa?=
 =?iso-8859-1?Q?uikz4pmfgNujEIa20ljgU0nq4o70hEAXJDG/xle9cOUx5ZaOxqsKhXjRel?=
 =?iso-8859-1?Q?jHkzHmIaBOoujPeP0ztiCp9Xo16ZgFwgIDectWvlFOs0OGPqQPQux8H/SC?=
 =?iso-8859-1?Q?YiIQzLbs2u/Am1w/YGpul+ALebdX6G3R5PSZGuNwKhjGSmI7bflRPJnW1W?=
 =?iso-8859-1?Q?VXJlJaZzG2k7rob7TRiwpqWWbZQ03Wjdks+Fq6R11xotpt5+PI3xaFqY6X?=
 =?iso-8859-1?Q?c36KB74gO9jrAtlcrDet87znv3i1QKcZ84tTm7kUB/TpTVv+QRdugSAGYG?=
 =?iso-8859-1?Q?8acQTuqeUxq4SDvBrScTHrov56/E8r3uUWvAF4zpWF4x/JG6dM0fGf3fPr?=
 =?iso-8859-1?Q?Q9OfqdXo5MQ7B8jYlwjfsoKSats6nF4uJB7OkzcapJX//Fb1kLxbaAm5qU?=
 =?iso-8859-1?Q?SJ7Iy13GB7y9Tkdv0+0zmSkjGLQ+6EKDNDIcHR/U0FrYRuZ9dAg1fdMKV1?=
 =?iso-8859-1?Q?M28gLxA5zdq+1pUlDX/AT7qSeCzm7QXrvg75/NRcYbTLFrjhpqGuTubUEi?=
 =?iso-8859-1?Q?SqbIE/vkHKeb2N3Z2TrMAInnRKSG+Vsn7GPHWJaTVNpLqbhODa+4BNlrhw?=
 =?iso-8859-1?Q?hC449pEc/aFMeoH54GccMhXoaxnkG2xwTZAi41YzrxMd8rJJREM/xN04Fw?=
 =?iso-8859-1?Q?kRvDu865oELaKgLcMttJ11Q/k6N+UUZRCteot2MxCRreSTMBM6T40voFTL?=
 =?iso-8859-1?Q?GmTlN/llsP1GP+pgSxrAU7RclrIyudpVI03mHD6Z8hne8Irj1IrEB5K1G8?=
 =?iso-8859-1?Q?1/HMv81VmMh36Lea64rMthWN4EIlGD6fXhYzuY4gUhFNCo7jX8zPrTgxKa?=
 =?iso-8859-1?Q?uFyvV1+FtU6Zder6FoQzTkXeOZRfEX1VqzKE2xQUOfTzSQyKjZ1tiCn5th?=
 =?iso-8859-1?Q?GgnznLdgWeANCAXCQrHojBVXWPzRB3Jxx8BRSH6AIbRVz4aeSgnm5rWp4G?=
 =?iso-8859-1?Q?jqKYAWqGb0w+DMsjHYREmzw6ntbgIomXIdTvrciOohcbi8cKyeAZtsfEs2?=
 =?iso-8859-1?Q?+FtCjxCxCQsNkAvV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3aP12+xkar5KprxwUb8et52iJvH+JinS14ejkL5BjzUDMuPXhRsi57h3gT?=
 =?iso-8859-1?Q?EnQG2ctEoc5fVDGBIRPJWHFUmwynPBdCd48gGueYEENSEd/Rrl6FI2gQVb?=
 =?iso-8859-1?Q?Sj81UXmEQVoqxkHJW3zLXnlr9KOABKscbSTDLd0czIilo2Wno0bQMdUtqv?=
 =?iso-8859-1?Q?iiorOLYmrJaqbK6yQckDHysAY4FticSGm40o2EXXEmVUMQo7ZSW/mGsRYA?=
 =?iso-8859-1?Q?4EqQ9Xkylo3zAvzcSBIocsYft/OCxgE+l6EFZhrsjHXsFN38JVbqfOFPMQ?=
 =?iso-8859-1?Q?oja9bHupVAwwFqWLqlvLOvOqmHaZ7zbNbCPSIEawPzE3kj36EjMEfixYFu?=
 =?iso-8859-1?Q?VAaggSu3P/47D4pjiDl9LrS46bXHHQqw4dtEutWFfEsgpYycxuU1DXk9U4?=
 =?iso-8859-1?Q?hPKxfXYLUnAHy+A3QZ8v8BOH2RQaIX5iVN/0/xrt0FMUEqT2JTXKN/9JgF?=
 =?iso-8859-1?Q?xTjf9P8tXKeptjEvBl46mxjx9keVg7moAP6Kgjdl+EpqCwI6j5UPA3Dbs6?=
 =?iso-8859-1?Q?+Od3JLyUsSymBL6InqaN9pJHBocKTtcelQ5wq9awXHiuaESs+5iKRpLKWO?=
 =?iso-8859-1?Q?hiBboWFjxhutomfmmTzEwCeqfOE+tJejkgf4BHtV1ZB7GMVI/dwonrCtuV?=
 =?iso-8859-1?Q?5liKiqVwTdkznY1Acjwx8hn7TTuM+VndCgWLq29o1huw4CHswmubgz2YRx?=
 =?iso-8859-1?Q?OYh7ahAOvoquVr7l3H/cAg3caKMnM7UeWPpbjZrs4FEgsP8SZYtrJGkcyR?=
 =?iso-8859-1?Q?ATUMc65KasVWUJHLvYq5EyPVCqTABVVS9fVjmptOudaLyJQ5kswUp0/v96?=
 =?iso-8859-1?Q?0fzSwqXeBdoE7xEztUBmlML53Rlc+lwaZcKsEIR4moO8tHuVcQXvdZmNhc?=
 =?iso-8859-1?Q?jrJah5CtCRuQIcJ3+ySVSFJ3kT6HKOV/JtcCV5ImE1SJFYCqV0WYmXLFeD?=
 =?iso-8859-1?Q?/qHC8hCCgO4PhNYPRmhY7cLTkesi7jEn5FRbEFcxCalHQBRtl2XGocgKCh?=
 =?iso-8859-1?Q?23bjzt+ogPBA1a+90j4Etf9a2Fqi5aku8c1nVuYVe7J3cV1x8WTs1ZW0Gl?=
 =?iso-8859-1?Q?22Xb7cXxnJDx8Cq3/F/a+S9g5giqDRuZ0xvE86Qm/43nb6j3M3oRpWOdnC?=
 =?iso-8859-1?Q?6RrAHkCUPVlEf0btdOP9GluYgMKUsC/KleaL6D6Y1bgVEvFNkpEQDJaaUl?=
 =?iso-8859-1?Q?qIWU2pkaAzXPm8/hJ/xaK7XDHa8cCOKPeJMRV0/wZtHXtsbWYaKFB7SlAS?=
 =?iso-8859-1?Q?7axzSp3d+cdNpd0zXxMJAkgYvT3jiHHl2wpstBciRLvvwudD5VzezZFPGL?=
 =?iso-8859-1?Q?vJQSIlmB4AJ8+7rokqMU7iKdOVL1AyteXXjUQBHgJGimxS/GvaAB7LBeW1?=
 =?iso-8859-1?Q?fHTKy6l5pST9wohTxTkR68JKQ4ejKHyWi7e9D9qjWcjc+Qiu4t1IMZRER9?=
 =?iso-8859-1?Q?OHC6P9Pn9BF5FQ0TeNC86cLgGCQo11tKY6yic7V0m0EYFmdI/bIDQiHZC4?=
 =?iso-8859-1?Q?mP6wgQqBfa/68inhur7dJ9CaSEdnbTFj3KH7youKS9ip3RPGM1A5HhSTS1?=
 =?iso-8859-1?Q?XfqRuoEeN6ov9gGMKfluMxxHZN9rQZMuuamibtWg0qMo2PQ70e4i3v5bWa?=
 =?iso-8859-1?Q?XAFFWljOqin3d+unloyDMkDMm4CcZcd9/fV7eMxgw4BEn4N0P52HQLeQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54539cf0-b6df-42b2-2fa4-08dd46f02973
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:52:25.9768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEsjqx3MnsXN3Cc3fcZiNJrtQQl9R5k6pjVOcIUG2dXrVi9RS/8RQGE4NwomR2rvzL9n+P0EyJ9TqEY5AFjM3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6971
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

On Mon, Feb 03, 2025 at 02:53:59PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> VRAM manager is related directly to struct xe_vram_region so it
> should be inside this structure.
> Let's move the VRAM to struct xe_vram_region.
> 
> v2:
>  - remove xe_vram_region pointer from xe_ttm_vram_mgr
>  - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
>  - rename struct xe_ttm_vram_mgr vram_mgr to ttm

When I read this I thought it was too much in a single patch,
but looking the patch below I got impressed on how clean that
became.

Thank you so much for addressing that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c                 | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_device_types.h       |  6 +++---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
>  drivers/gpu/drm/xe/xe_tile.c               |  6 +-----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  1 -
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ----
>  6 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 095794200438..c2724847ae25 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -145,10 +145,13 @@ static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>  	struct ttm_resource_manager *mgr;
> +	struct xe_ttm_vram_mgr *vram_mgr;
>  
>  	xe_assert(xe, resource_is_vram(res));
>  	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
> -	return to_xe_ttm_vram_mgr(mgr)->vram;
> +	vram_mgr = to_xe_ttm_vram_mgr(mgr);
> +
> +	return container_of(vram_mgr, struct xe_vram_region, ttm);
>  }
>  
>  static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
> @@ -177,12 +180,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>  {
>  	struct ttm_place place = { .mem_type = mem_type };
> +	struct ttm_resource_manager *mgr = ttm_manager_type(&xe->ttm, mem_type);
> +	struct xe_ttm_vram_mgr *vram_mgr = to_xe_ttm_vram_mgr(mgr);
> +
>  	struct xe_vram_region *vram;
>  	u64 io_size;
>  
>  	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
>  
> -	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
> +	vram = container_of(vram_mgr, struct xe_vram_region, ttm);
>  	xe_assert(xe, vram && vram->usable_size);
>  	io_size = vram->io_size;
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c7c285c6a6c9..6d44de9a31f6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -23,6 +23,7 @@
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> +#include "xe_ttm_vram_mgr_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
> @@ -104,6 +105,8 @@ struct xe_vram_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @vram_mgr: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr ttm;
>  };
>  
>  /**
> @@ -198,9 +201,6 @@ struct xe_tile {
>  		 */
>  		struct xe_vram_region vram;
>  
> -		/** @mem.vram_mgr: VRAM TTM manager */
> -		struct xe_ttm_vram_mgr *vram_mgr;
> -
>  		/** @mem.ggtt: Global graphics translation table */
>  		struct xe_ggtt *ggtt;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index b1d994d65589..af788c147ca8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1560,7 +1560,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt->tile;
>  
> -	return xe_ttm_vram_get_avail(&tile->mem.vram_mgr->manager);
> +	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
>  }
>  
>  static u64 pf_query_max_lmem(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 2825553b568f..d9a7a04ff652 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -94,10 +94,6 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  		return -ENOMEM;
>  	tile->mem.ggtt->tile = tile;
>  
> -	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
> -	if (!tile->mem.vram_mgr)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
>  
> @@ -139,7 +135,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>  	int err;
>  
>  	if (tile->mem.vram.usable_size) {
> -		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
> +		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
>  		if (err)
>  			return err;
>  		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index a8c37fb4fec0..9e375a40aee9 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -342,7 +342,6 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_vram_region *vram = &tile->mem.vram;
>  
> -	mgr->vram = vram;
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
>  				      vram->usable_size, vram->io_size,
>  				      PAGE_SIZE);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 4c52ced4ee44..1144f9232ebb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -9,8 +9,6 @@
>  #include <drm/drm_buddy.h>
>  #include <drm/ttm/ttm_device.h>
>  
> -struct xe_vram_region;
> -
>  /**
>   * struct xe_ttm_vram_mgr - XE TTM VRAM manager
>   *
> @@ -21,8 +19,6 @@ struct xe_ttm_vram_mgr {
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct drm_buddy mm;
> -	/** @vram: ptr to details of associated VRAM region */
> -	struct xe_vram_region *vram;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> -- 
> 2.34.1
> 
