Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6882C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A2910E69B;
	Thu, 20 Mar 2025 21:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY1TKnpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0275710E69B
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742505859; x=1774041859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mraGf87R5R7+2ai7LB67OJB7pgkZlAeoh1APAK1ynzw=;
 b=RY1TKnplmuHSF4aP5CbjOJQDxVyqCOjqhdmvhe7b+7N+TASswEkzghe+
 WbZSB+CCoWB32FUVs5XMbJTxSZNGFepsUWPrpEhsX02Nh/VDrRpISRoCJ
 QPKTwfA/BmTq80Sb0edBPr3ChjgyTTV4/Nwwmu/cIYkNA9jUabIFBjVCm
 F9RMpqI0TXQSfWVela6Ypo2m8926is6aQuao1xbHKENZ1YLowHRrcuY5J
 5lZnolIQ9j6O2QHNY9iA9JEGqV3JjxtMBe7bEPkxoReBaBvUwUJxGYTvF
 lt93jmbl7hN0vvwNiJ/N688Eksbw4ZRcLIQp+G9XvYEVX/Rg00M/klEt3 w==;
X-CSE-ConnectionGUID: a/sgre7xT1i8lDvIPEsMww==
X-CSE-MsgGUID: DOwzAO8iQciEQ8bAXtEMSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43640107"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43640107"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:24:15 -0700
X-CSE-ConnectionGUID: oZJHEha0RNCbYrGII0jLBg==
X-CSE-MsgGUID: yvIbHAKFTtu47w6xtv/8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128328807"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2025 14:24:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Mar 2025 14:23:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:23:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThLwiwrDNgYtCmUdipC9QPUKxCUjwWWDZbot00bopOPyDf/KL31vdSzXt0vJHU5qNogV2WGr+5wjikmgToTPPh+CtyQBxnb5G2SPeuu9pSk6Z97Cd3FftlOigApujHgbiTCQfYZ3YlhLoRzre1OUDepLks4KjrKdLmBplnSO+fAEcjb28+84y5YAzP+vIHZm/B/Zk6kDp019P2OzdrziJQprUzu1K72yXdTIZlD9dKJtlF93vfslKlwX7Xt36xeYnmjb2jUYwYVUrK0/Qig4MCz97+7c4ksg6kabYfUdhCbMBqHl5+1HHPaWu+OCAgbbnHXWIYTMD4FhbxLPV8rv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1vi2dEn431rJngDihkSIONkO3wkomIKb2Gr6APIECM=;
 b=OHicYtd4U/mBP+H7yhnkckQfhHicjhC6iB246Zji/TU3O9wwJ/Vhp7RGoPqBT7SgkZKix0wgxmUxfdRmkPrviWUJaoLy6ljTi/A4zjGY2Ex+CS1Mk6ODVg3eSxp/Qhl0fkJOmSWlnf6j8lIj3x7wEzxzLzqCUsOcjWizL0yqZUuC4Kasf/ZDh7sdzvDuiAngTpr9PwxixjAs5JaJTEfm1zj5ZGqlVo39b6z70pFcLULoFCsgarDYxIua0EwvzygZjtwT+/qjWsMr2eenIJNF/2kPFT3K95XtN0/ydzd6ZaGwl5cO9VFxBx5jZuiastKhIPVjtdbeo9TFJIsSp9Sh2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 21:23:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 21:23:39 +0000
Date: Thu, 20 Mar 2025 14:24:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/5] drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Message-ID: <Z9yHoRH5t1tZfK78@lstrano-desk.jf.intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317104132.8200-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:303:16d::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: f420088b-a4d2-471c-12ea-08dd67f57b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?d/m45s9hM0WTgw9FaouvUTlyN1uOT6OH6hGckLfkcoEcHP+xfyLnU+sG21?=
 =?iso-8859-1?Q?2OKTYlUI+kgoa7ABCNLfBr5fUiAQYlJ38RRNTU4Q9rbww48J1V1KV4h8Lx?=
 =?iso-8859-1?Q?X0I6We6tTQq0YsVUEZpRH0crphDW7xsZ1U73z3ihDIT6BlLKdJf+t2oIdb?=
 =?iso-8859-1?Q?PTBBfOQDhLgeW8wiby8mGbZfyHDn9bcMvFbWh+5VKznhKEfC4y3nV0WAae?=
 =?iso-8859-1?Q?uVfY2pAGLL6hAjMUtvx+zT8pgxeizqmlVFUg6i7FDeEDY5p5Uzci89572M?=
 =?iso-8859-1?Q?6nICknSkFPfHs5DCO8ojFn0YClK5iDQA+PvvTJMaEgPkS5soTpeTZNWliw?=
 =?iso-8859-1?Q?C9b2P5rmZOrVhvlIKmnGiG+Bwr/pWU3vXch3JqUZdKeDpLqXLIs7ZSZCJ+?=
 =?iso-8859-1?Q?DHX/UCLrs2sGF80y838QBXY4e99jFj/Ihmv/5ehzwFSnTaTdLnlQgrwhFy?=
 =?iso-8859-1?Q?ngzFgPVGcXsdlPxSp8fKAMdK4cFXOuuLI3/istoXgmWlSQ32Y8RoDT6hkm?=
 =?iso-8859-1?Q?6U+puBD6VkLUmBs7xF8vGxUiYSYNYxCnNBKhv+X2HyS5L9rSMnZZXJtNh3?=
 =?iso-8859-1?Q?VFSG0IO6RMT+8W1G8/qBPb3uHy+XayRlxPARosXuACSu0ZiEu3h4dyNHwz?=
 =?iso-8859-1?Q?0a0IjUPuoC4kC0EhdBeQbwQ+Wy6IpB2IIdvo3toLqIV7rgfCuTH3N169+B?=
 =?iso-8859-1?Q?Ir3aRj/YYyXz4BflPYQ7hb+N64qjxPNZoWcVOSCTZzjU5hWdm3DXYYNqwD?=
 =?iso-8859-1?Q?8JTeYromjjFbn/w0dYvrMxo+Vjg9j301bSXPa4LjGuKimuvKXI4qXVC6A7?=
 =?iso-8859-1?Q?ysd3B2xrVgUwLZX7jUs7V4ERsoGlsoNqy8zpv8rIscKRXeRzhSP62ZBwha?=
 =?iso-8859-1?Q?0dMLtnt3TkqqA8MMTzy86j9eIAM0WlO2+Bzr8CHA8w98k0I5cqm+Sdphgd?=
 =?iso-8859-1?Q?zfaZJhL7bsRv4lM9nWyHfsv4Cl4DxgdxWELoszSIwc0NqV3fEGZCgCPl9n?=
 =?iso-8859-1?Q?GP9wEMbYKLhZuKae1G8GASmaWALrQjejs3Afb0ImRWAEsBMmWeASWRRnks?=
 =?iso-8859-1?Q?4CVEdRhxvCR2d5HxATCJrLEQd0/4kJ2cF/iqFEAOXKQRH8Hm6qLk6qKZhB?=
 =?iso-8859-1?Q?I+bzOchRzuvPwXIjO+mEXG6QLroF+xLfizMJANPR+SEKq1l/gKow1gcz4m?=
 =?iso-8859-1?Q?DrNZRB2VgE2ihMcbaR/QtB4741guRrEPUXq2UwP94HOqPcE4rh/Nm3KhHi?=
 =?iso-8859-1?Q?VMT9fNkZ92q1Nfm3VYgRJUbj3bNmDYzhVspVl78KqxCTgrCZi7myKYMaGG?=
 =?iso-8859-1?Q?Vm4h9JunjT/jJtWu97t+rz0gvugvsj4Z+nOlDfSkrgtBVI7wvENyMeK1Ea?=
 =?iso-8859-1?Q?UXle4wfHzFaDou3din1JOLIODthCx71qlxZ6u1OfZfmLe/J6G0gGiDqdAQ?=
 =?iso-8859-1?Q?DajW5e6IcZvtdJdh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IDHlLbwPSicnOvbWXzs6bTvkEwSjwkCCenPCP2qIguFoCqCmO2unVvvRs6?=
 =?iso-8859-1?Q?N8KV0dm/afrTOiot0QuvSlKYaro0kwc7ezSDkZmTdVlLl+UFG0IDK9E/ec?=
 =?iso-8859-1?Q?AgwC2/SoeE6+nhYQoGS0FsOPMgILtxmkI+ak/XZnYsbq1o1aBUNW/ZvIlY?=
 =?iso-8859-1?Q?W1OhTQp0iMwL9p8qntRWkLFTedU9BarjcKR0RNNpB9LlBuZV4EWzLOOOWx?=
 =?iso-8859-1?Q?eiNvye2Sey9HkeB8Se98g14H7TSI1dLc7iSzLx9IYzD150hTHPi6b4qLkB?=
 =?iso-8859-1?Q?v+ZG5vk5ub0TvGyt4k/wYkyBfQIQw2l1FMBYQ09wbWQguq56W2c1gQnLTc?=
 =?iso-8859-1?Q?dTBe2zhZAk4iDUOEan9ikRh0bCEFzckAjYw8QTZHPoZBWKOoTpKcceMpMs?=
 =?iso-8859-1?Q?nFd+vwtV9URjAvpIUed6qIPyd8prza2WeCWchSD5OhJam4W9HUa9D2kFz1?=
 =?iso-8859-1?Q?JPQoSxe26Ae+ZbY3yt4H+LhV6bqr7z/jQdyS7OeUFxA3beXVSm0qkGqu6o?=
 =?iso-8859-1?Q?SNxwxAzi1ka3p9NCXKlLGbggMGLqw0in5h9v6RuHWqBZkmbJaVF8JC1SsM?=
 =?iso-8859-1?Q?/A3IcwCDcXRB4fbT2rtmosLOs9pkT4zAu+jawyNsq8wSohUBedpwXd9hgI?=
 =?iso-8859-1?Q?wAvEAkNItkIVuP/4Kpyf8r+Vv3/Nm4Karli+TH2rQ9qhdgCIdSr9/rl3Lx?=
 =?iso-8859-1?Q?brAILPuTMb7vXaBNEtxmVtfZ4B5q0sNltSQtiKgwPzQ6DQIr+UCiatRP71?=
 =?iso-8859-1?Q?rZQCCLcJq1pwwKiq7UENMeuEJfpgGeoFm7yAtx0FUFJ4lH9g6AOhJXNCUQ?=
 =?iso-8859-1?Q?5WFaZQehvFP88yyzXu8hW2eiO6NBkQlQ5IB8z22+HKgEzl+n7KqsRRz7Y8?=
 =?iso-8859-1?Q?4ZbHwUG+tkmUPuzUOscjlHjrr954+IQ0k6Q/Zux9ooQvPdXczrh7JWM31I?=
 =?iso-8859-1?Q?xCpujNC+pInJx1IARWePb3+HiT6LjfoBc65nfHEr4aNiAnImEITibpFqyo?=
 =?iso-8859-1?Q?0oLz9B7hKifADgK2oqx3e+4riVCBK8OFPAA0jMzmC4vmuss1w1vIC9dUvW?=
 =?iso-8859-1?Q?H6RGMRSc520ECZkW0cKyKNRJBsYbuXljPODTXZWw9+hEU12V4+gcgeUWd9?=
 =?iso-8859-1?Q?cJRLddyV6T6rYthXXYNP3FWg/mXb8k4e5gK4wQgV8TmrlSJiQH9iOsYyG5?=
 =?iso-8859-1?Q?HvUR+6kpaweetUPuJq07JaFmBjTVStPRgk9myyIJx0oDzLWZnWjVN1tuZt?=
 =?iso-8859-1?Q?wpZ9/63v1/ShVQ26m7wUo6I3SdRBVEJm5+1klAa4N9t22qeyxmnnxAHpWP?=
 =?iso-8859-1?Q?d8KbUctgPyyvZYNGBduJXHjAY0XVUXYQAt6rqP8np9vpFJZ15FFTVe2NKr?=
 =?iso-8859-1?Q?lpgmNPVvrXWlsaaVoogb9v0DZQEVUAi6pICyeGqmm44eH9T23bubNZdluS?=
 =?iso-8859-1?Q?V4GhIX13WvgS/RMnBNwMgHRdtgoyVo8MoEUHZhr8v5EXNjo8W7m0CaUa7T?=
 =?iso-8859-1?Q?9ROD+ls/NDZ5x03iBHWnTdCfsmZuFRYBMtBYzW+fyedC7LnVOXN/qJBhyn?=
 =?iso-8859-1?Q?UdzgbabCGud8gnt9dq9WbL+y3uxYFWituVrhMPeM3AqZSCxBWLOylINwRZ?=
 =?iso-8859-1?Q?db5aWNGJ4/nLsxM2RzQ0VuwWoBjo8Th617b4FUrBB+XySO+bGV4QiUPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f420088b-a4d2-471c-12ea-08dd67f57b47
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:23:39.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgxbeLEahskC84Gsvg0t2oEHwdfFffVA9XMI+qJFSrNl42yL3hp9OnDQxiIvU3yIMJa1heh7hU5Eux0f9mwPZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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

On Mon, Mar 17, 2025 at 11:41:28AM +0100, Thomas Hellström wrote:
> Don't rely on CONFIG_DRM_GPUSVM because other drivers may enable it
> causing us to compile in SVM support unintentionally.
> 
> Also take the opportunity to leave more code out of compilation if
> !CONFIG_DRM_XE_GPUSVM and !CONFIG_DRM_XE_DEVMEM_MIRROR
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig           | 16 ++++++-
>  drivers/gpu/drm/xe/Makefile          |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  6 ++-
>  drivers/gpu/drm/xe/xe_migrate.c      |  3 ++
>  drivers/gpu/drm/xe/xe_pt.c           |  6 +++
>  drivers/gpu/drm/xe/xe_query.c        |  2 +-
>  drivers/gpu/drm/xe/xe_svm.c          | 15 ++++++
>  drivers/gpu/drm/xe/xe_svm.h          | 72 ++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_vm.c           |  2 +-
>  9 files changed, 97 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 7d7995196702..aea4240664fa 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -39,7 +39,7 @@ config DRM_XE
>  	select DRM_TTM_HELPER
>  	select DRM_EXEC
>  	select DRM_GPUVM
> -	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
> +	select DRM_GPUSVM if DRM_XE_GPUSVM
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
> @@ -74,9 +74,21 @@ config DRM_XE_DP_TUNNEL
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_GPUSVM
> +	bool "Enable CPU to GPU address mirroring"
> +	depends on DRM_XE
> +	depends on !UML
> +	default y
> +	select DEVICE_PRIVATE
> +	help
> +	  Enable this option if you want support for CPU to GPU address
> +	  mirroring.
> +
> +	  If in doubut say "Y".
> +
>  config DRM_XE_DEVMEM_MIRROR
>  	bool "Enable device memory mirror"
> -	depends on DRM_XE
> +	depends on DRM_XE_GPUSVM
>  	select GET_FREE_REGION
>  	default y
>  	help
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9699b08585f7..e4fec90bab55 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,7 +125,7 @@ xe-y += xe_bb.o \
>  	xe_wopcm.o
>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
> -xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
> +xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 72ef0b6fc425..8aa90acc2a0a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -107,6 +107,9 @@ struct xe_vram_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @ttm: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr ttm;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>  	struct dev_pagemap pagemap;
>  	/**
> @@ -120,8 +123,7 @@ struct xe_vram_region {
>  	 * This is generated when remap device memory as ZONE_DEVICE
>  	 */
>  	resource_size_t hpa_base;
> -	/** @ttm: VRAM TTM manager */
> -	struct xe_ttm_vram_mgr ttm;
> +#endif
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index df4282c71bf0..d364c9f458e7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1544,6 +1544,7 @@ void xe_migrate_wait(struct xe_migrate *m)
>  		dma_fence_wait(m->fence, false);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static u32 pte_update_cmd_size(u64 size)
>  {
>  	u32 num_dword;
> @@ -1719,6 +1720,8 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  			       XE_MIGRATE_COPY_TO_SRAM);
>  }
>  
> +#endif
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_migrate.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index ffaf0d02dc7d..9e719535a3bb 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1420,6 +1420,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	return err;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  {
>  	struct xe_vm *vm = pt_update->vops->vm;
> @@ -1453,6 +1454,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  
>  	return 0;
>  }
> +#endif
>  
>  struct invalidation_fence {
>  	struct xe_gt_tlb_invalidation_fence base;
> @@ -2257,11 +2259,15 @@ static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
>  	.pre_commit = xe_pt_userptr_pre_commit,
>  };
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
>  	.populate = xe_vm_populate_pgtable,
>  	.clear = xe_migrate_clear_pgtable_callback,
>  	.pre_commit = xe_pt_svm_pre_commit,
>  };
> +#else
> +static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> +#endif
>  
>  /**
>   * xe_pt_update_ops_run() - Run PT update operations
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 5e65830dad25..2dbf4066d86f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,7 +340,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> -	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_GPUSVM))
> +	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>  		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 516898e99b26..c305d4c351d7 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -339,6 +339,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
>  	up_write(&vm->lock);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +
>  static struct xe_vram_region *page_to_vr(struct page *page)
>  {
>  	return container_of(page->pgmap, struct xe_vram_region, pagemap);
> @@ -577,6 +579,8 @@ static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
>  	.copy_to_ram = xe_svm_copy_to_ram,
>  };
>  
> +#endif
> +
>  static const struct drm_gpusvm_ops gpusvm_ops = {
>  	.range_alloc = xe_svm_range_alloc,
>  	.range_free = xe_svm_range_free,
> @@ -650,6 +654,7 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
>  	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>  static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>  {
>  	return &tile->mem.vram;
> @@ -708,6 +713,15 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  
>  	return err;
>  }
> +#else
> +static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
> +			     struct xe_svm_range *range,
> +			     const struct drm_gpusvm_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  
>  /**
>   * xe_svm_handle_pagefault() - SVM handle page fault
> @@ -863,6 +877,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +
>  static struct drm_pagemap_device_addr
>  xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
>  			  struct device *dev,
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e059590e5076..c32b6d46ecf1 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_SVM_H_
>  #define _XE_SVM_H_
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> +
>  #include <drm/drm_pagemap.h>
>  #include <drm/drm_gpusvm.h>
>  
> @@ -43,7 +45,6 @@ struct xe_svm_range {
>  	u8 skip_migrate	:1;
>  };
>  
> -#if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  /**
>   * xe_svm_range_pages_valid() - SVM range pages valid
>   * @range: SVM range
> @@ -72,7 +73,49 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
>  int xe_svm_bo_evict(struct xe_bo *bo);
>  
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
> +
> +/**
> + * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> + * @range: SVM range
> + *
> + * Return: True if SVM range has a DMA mapping, False otherwise
> + */
> +static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> +{
> +	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> +	return range->base.flags.has_dma_mapping;
> +}
> +
> +#define xe_svm_assert_in_notifier(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +
>  #else
> +#include <linux/interval_tree.h>
> +
> +struct drm_pagemap_device_addr;
> +struct xe_bo;
> +struct xe_vm;
> +struct xe_vma;
> +struct xe_tile;
> +struct xe_vram_region;
> +
> +#define XE_INTERCONNECT_VRAM 1
> +
> +struct xe_svm_range {
> +	struct {
> +		struct interval_tree_node itree;
> +		const struct drm_pagemap_device_addr *dma_addr;
> +	} base;
> +	u32 tile_present;
> +	u32 tile_invalidated;
> +};
> +
>  static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
>  {
>  	return false;
> @@ -124,27 +167,16 @@ static inline
>  void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
> -#endif
>  
> -/**
> - * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> - * @range: SVM range
> - *
> - * Return: True if SVM range has a DMA mapping, False otherwise
> - */
> -static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> +#define xe_svm_assert_in_notifier(...) do {} while (0)
> +#define xe_svm_range_has_dma_mapping(...) false
> +
> +static inline void xe_svm_notifier_lock(struct xe_vm *vm)
>  {
> -	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
> -	return range->base.flags.has_dma_mapping;
>  }
>  
> -#define xe_svm_assert_in_notifier(vm__) \
> -	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> -
> -#define xe_svm_notifier_lock(vm__)	\
> -	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> -
> -#define xe_svm_notifier_unlock(vm__)	\
> -	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> -
> +static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
> +{
> +}
> +#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 22a26aff3a6e..9948a123da9c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3112,7 +3112,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  
>  		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
>  				 (!xe_vm_in_fault_mode(vm) ||
> -				 !IS_ENABLED(CONFIG_DRM_GPUSVM)))) {
> +				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
>  			err = -EINVAL;
>  			goto free_bind_ops;
>  		}
> -- 
> 2.48.1
> 
