Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3EC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 17:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2054310E037;
	Thu,  7 Aug 2025 17:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ0a9TrF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2EA10E037
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 17:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754586815; x=1786122815;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tAdGTUCkpBkoe6Um3g60YyFq797qq+P2gS1LmMIDAZA=;
 b=DZ0a9TrFMeVchS1VC4xzhUsx9Y6JRnKWbmnQM3MifQyzE28EQ/sv8M5O
 sQBoqpBjOnW2hqUfH/Yd1Qk2Hz3zFSzUnlSjB/B0pN0DfrsYFUg3I09h9
 YD/c/CzyvOJh8byjn3ZSLfXFwbK/re+h8K8jKIosFu8FaGLZK1xCBJRmz
 QdM1YkipLizjej5F54SqRS14JKc9aGzpySsAdfr7Mwj8NO74TZRFCVEHk
 wQNwSXpxfo/OyXpeL1mmbTHovamlUxlfF64Tv+Dh/r0ycIhMDmi3kVt5D
 s0Mwq+fYVQ4c2ZtnOyQLwfEqOq5k3C+oqJQGrUSWFdwAa3cgYtAnmOLvL A==;
X-CSE-ConnectionGUID: OPbpGfwFTzacmsswPNsptw==
X-CSE-MsgGUID: 8tFxLlUZTfmgDjo4VGTZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67198872"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67198872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:13:35 -0700
X-CSE-ConnectionGUID: AJ2Yhe8zSGGqm5alzd1cYA==
X-CSE-MsgGUID: gt18jdwoROKwSJ5m5iIoug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195949481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 10:13:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:13:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 10:13:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 10:13:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXwkwa186EeWBm0ES2k33kCJdMoKlPZFG04iQzKJMj+aVsHT5xfhoS8qWQPjiYLjrrRZS0djeci1t5KgOB+BZn+HAbxNaNVON0n+3LXLOInSl4Ndsqx/S0dxLaN7mSa71WGVYDeXN8qC8UarDthE6W/qoWxYzMtvpnTFA1xFcLt3++45SreTMjypakGEjbmvwP+6bYgh2p5TPByX/d/boQTir4RPAODQkFi6sqjuTMJcwJDK3Lu+JD4vbtLg26L9JJtbNerhSFq28QA7uJu2AoQH6gOZdpK4IZFsiKn4MRMIt7LmOcFLC4aK8bsFIU+dBZXsJNIXWmXaiUM0iDMA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi4RLScToLbRGZhRFRq9476FHentiQcDkb+SPcIC38g=;
 b=r9//FDxKM40ychvXayk4TUAxdNBIYNsh/9EW/vJ3IbGYVCecmtASpnYVkHD0hef5nSVfr/3SeBAPs+qm7G7i8lKlhVk4GQU5oKQvhPNrpipUOgJLzyAbO7mHR8X3BFGbCB6Nq3xLUPweewA9EPXu/Y452FxlmyLfldyp+KJ7m7HQAhw4BDlthiM07mFaYOCuU6krX11aMBintsoSz3qyo5DRFxPxKJkRX3Lhxhv96PsXzfShV+e8BW4xHSWPuiuOvFUAUti8/E04uz9gb816IhQTMzTq6NagAiIDeXSZ+Gx57ltyL0WXUIt7w5zDahFdqpHaP/PG+KYV9y5LIT9YiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6623.namprd11.prod.outlook.com (2603:10b6:a03:479::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 17:13:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 17:13:31 +0000
Date: Thu, 7 Aug 2025 10:13:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 24/26] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Message-ID: <aJTeuBPW1qUh0+/F@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-25-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807164338.1832254-25-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: f8be2ae0-7fa9-446a-fa58-08ddd5d5bbac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5DYZy/RSFIOEuNERI4jqUDyRxgcjlHiE5ZCZYOPSjrGZOsx0j/8mJIO2zs61?=
 =?us-ascii?Q?NfRb8LcPiI8WKWconN6UhstlIddiV/NFSQxDiSd4ydW/6ymk5udrvr87L98h?=
 =?us-ascii?Q?WhDgTCQGxzQEF4eeAUSNkqtw/IplJmeriFtcJLPNzEGiRiU4D5ePVZ9Lusa+?=
 =?us-ascii?Q?k5Qcvzovbll3DXyGfD7GvJ54YNXg21v8Km5Nw8Zc64yxWQsFjUgCkddjQYx3?=
 =?us-ascii?Q?YtYoOPRgEKFVt8ML2oFtd8zdIynIrUNhiu46Qws6BLvDp0oXLGEryVDnur/D?=
 =?us-ascii?Q?MBON2JWrRW25W92rGKxVyJxdL7lC24SRqsmdyDTelvxh/V5EA/o4p1+P5MnM?=
 =?us-ascii?Q?DDkEZMiycvC4lJ0qZQCKyQv5wH0VEnJfpMRhxvbcfF/JPgCEto7V/Y6DBlAI?=
 =?us-ascii?Q?oFWTJrB9OD3TfPXS7As1SsQJKuDLvM06XkzkGeFiZOz3M1EFUNFgxNodHmfY?=
 =?us-ascii?Q?rLMqFxBTppRjK4XJP8XuUmXWm6BPSPmHw5t4UrX4pfcPwE92P8XYhgoxBni8?=
 =?us-ascii?Q?PgvI+rkoShH7rIOLhvjX9+F/3Vx4YCdSXPh+g7Mdg765v04+SiMwg1SFRxPK?=
 =?us-ascii?Q?5OtJpk851lLwYOAxtf9t180E5+4GOWeE4x50QLkW81nI/BsJBj5KjMIsSPl+?=
 =?us-ascii?Q?qWRhsc4QGZarvlWVsAErvwTWYMN0TeVu5LoMAHvcRYhSEnDDGAHu+IfWwHgk?=
 =?us-ascii?Q?0BrlN7BqUJ0XqYBpHrSCN5Mvay90jTza7VGZ5zDN7K3aejYVIx5WdSVKCptH?=
 =?us-ascii?Q?FlHIvBjVT43IDfyRKZ2xQPNoDuOqKZYkKB14v6qvtJtnhIZV+/rJIa4pLyt5?=
 =?us-ascii?Q?a79CEfsCSmF4U0DCv95jF4LF6WBaXifZV/RWTBjHhubXy31Wt7t2zDrcyqN1?=
 =?us-ascii?Q?Fcsmjz8iWeu+RELqA5YNauT4AC/OM+adQa+PrHgUBbZDf8U9eZxZsBnhaHM1?=
 =?us-ascii?Q?F1DQiQRLs6pLnookEb8ePvRbHYLpdCN1Ka8b+vnjBc/eEqEI07TdiAd/K7qf?=
 =?us-ascii?Q?3D2qNJTi1vw4YI5Xj4rLElXcxM2QNYP2JUVItPbqwWBm5hloml5KupXQihgE?=
 =?us-ascii?Q?qnQ5Bxldxrudryn2ox98zaY2ALARgMSX/hXfijTrBrmpJeOv+cBfXmHCi9Ov?=
 =?us-ascii?Q?OOusYLKaOYwtS17LE1AG3N8ltr0liPDq9YXWt2TKzfJNEvJjnQaQzFe67to6?=
 =?us-ascii?Q?PrpyVgqPKiRPsBFIAyfU+ZytL2Lu17Q5B+EMurrHxMv5cABq8dh5DfM+8cTf?=
 =?us-ascii?Q?2F8Gy1oBadi/Ff/Bpo9uvmFI4WT1Jv+SeEQkwBJIxwN/TqY13MOa17d2uBAj?=
 =?us-ascii?Q?eOQWtGgB/QQ/yfD4FTcwpGmbKJ84/sHzutSLlUABYHqCVJ/SG+Y+4K0RzI5l?=
 =?us-ascii?Q?3QzEyVajwkgfC+hO6mx5Vv+co2S93qiMTHXibO94i7+E6sB3VGieRO1Cq00E?=
 =?us-ascii?Q?RWECs2ilUk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hb5I4P9nYAzXUNo42jJPUs308gfsc9b4cUpvvaWjsquao6QLON+ivVxuvGtq?=
 =?us-ascii?Q?IwOl2C07r/N3peGWiKBGctNcZ/f4GR6azxllJ9c8Ycoaud3xfj/FFO8k1kfX?=
 =?us-ascii?Q?4ykNHbqnAVmUyP8A4SnJ3KPKtv0H3qIWd/bdgj+/JrUyZ9VNKXfeWlcDopa9?=
 =?us-ascii?Q?OoFT4XvNVUHGPFhMkkBtOxVpx/3c3lWw2wTHxRcTt+XCnFAvimn8ZNJ659wE?=
 =?us-ascii?Q?OKcOiGBvnA+QQe8SfJ0Vq0yUZfY+mYPW+jBBNjV6T+IROV+5vzb43UrxEqgP?=
 =?us-ascii?Q?1Crepm2ZiDuMUxZZKNtmdzk2PvHFymCG8YOJeoUcFQxj+tBv9sjDSNP2atpf?=
 =?us-ascii?Q?LeBImBqM9fXj+S3RgvMx762hsy551aN0BaSPmX333/b98ipAsmcaSy350eZ4?=
 =?us-ascii?Q?LQcXaULUzIM6KOa7HxUiIeUXG69cfrqzlpwTz9SoADLLaYX8GX6BoXYkmNr8?=
 =?us-ascii?Q?q2rXloSwlTqHjAFkA4IAKfI5BchuOss4WOTpYfgElhnPX3VHopoouSg0L4xX?=
 =?us-ascii?Q?Kdh2bfulX7UcVhICIcTjcTx+i3WBkW5fQUC2mGb97Vk5sq6esEmYURifoh0P?=
 =?us-ascii?Q?Ckr4VYdrmnoA6YepTBNgHc8PIIrj4ZtXfRqXJdIwiojYrTwPOTgxkotuQxDw?=
 =?us-ascii?Q?malAcWlLS3FjCxh+JmRslcuRt2KIZ4hQPBl66wtv6EXDY+XeZRoXA+lQO0oC?=
 =?us-ascii?Q?vInjwYseQoOq0UOgwj25expEemNYHCoGr3mSg4guWyj2BzvqXYatHlwN6crR?=
 =?us-ascii?Q?QAZdjLlTsL2DhtkoP8Rv3PchH3fN9OXN8kcj4bP0THX8hPZA5kjZiHnC2ftq?=
 =?us-ascii?Q?eWC04zms76ynlXcYhyuGES777YYnOEJc3ok76Te9s+r/N7vrlAVT/Hx2+ct5?=
 =?us-ascii?Q?IW8/gRR3Eg7JbolPFySsCUhabuXtMH1gn5eb9ExuyrF4PfbDjHJ/bfAPXdCN?=
 =?us-ascii?Q?tAYTHR4vZwgxAfXMtXTp76bOpTNfhwOW9slq4cssSuVCt5BnsOkuO9hLboiW?=
 =?us-ascii?Q?b8+GqBBx+77tUnu1paBptgvXS0QC+nZofa97KF6+VgmhWVxLK81myRWq+cVC?=
 =?us-ascii?Q?mmzdEWuvmex70JcYxLQgJTU8rkhwvYWIxaM6ZOq1ZDEDJD+1rmOGqv8YkR7D?=
 =?us-ascii?Q?QaaNdN5pL1OT+LRyfXVIsZK/xFZcSmfSdCRps8wUsS4Rberi4N40+ul5u0XV?=
 =?us-ascii?Q?RSj7R5zZ/+31Vaz6g8T/xoV97JNRq5BxJlpfR/1wJ9WnugouMF+SFrmfztAv?=
 =?us-ascii?Q?KQecT2j+h5pN2YgPyX7F19/picVzuxxFFemcJ/BqvZzvoHWZ4JROeZE9qUIx?=
 =?us-ascii?Q?pI0LtygjPPEItuuguRvDoh3ly1+MwK0M3NpgHUkKJY8kO/UJKnizCwXmgvB6?=
 =?us-ascii?Q?r+n0+EVxusOAQFV9FDWXLykNjP35s2wIH3GA5YGsWTQQa8/A9nloJ/X0kked?=
 =?us-ascii?Q?to11OcG1hJTeAsS8Iv4/uuEvvFk5qNaTgL9LpdCMdYK2wIqv68yT4DKi9Bq4?=
 =?us-ascii?Q?BLyVCYJjVEyYIvvmISUVa0qWKLEPoyEJ1oqokbYrnIBoqaJSMdRsRsEvoPaJ?=
 =?us-ascii?Q?b6sSRYGEGkQc0VyfjdMtFYzxLwygR30kQNXSfcYekLopRxfzsQqFPmp6M9J6?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8be2ae0-7fa9-446a-fa58-08ddd5d5bbac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 17:13:31.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITt007bJhVuatRPsD5aw/UGnKT/jk16JrXcWW65CuX6MhI8tapCURhpFrrrsCIVM1paHVecPtU5aAHayPjn/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6623
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

On Thu, Aug 07, 2025 at 10:13:36PM +0530, Himal Prasad Ghimiray wrote:
> Restore default memory attributes for VMAs during garbage collection
> if they were modified by madvise. Reuse existing VMA if fully overlapping;
> otherwise, allocate a new mirror VMA.
> 
> v2 (Matthew Brost)
> - Add helper for vma split
> - Add retry to get updated vma
> 
> v3
> - Rebase on gpuvm layer
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c |  82 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c  | 155 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_vm.h  |   2 +
>  3 files changed, 190 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 19585a3d9f69..5163634d003e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -253,10 +253,56 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
>  	return 0;
>  }
>  
> +static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
> +{
> +	struct xe_vma *vma;
> +	struct xe_vma_mem_attr default_attr = {
> +		.preferred_loc = {
> +			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> +			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> +		},
> +		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
> +	};
> +	int err = 0;
> +
> +	vma = xe_vm_find_vma_by_addr(vm, range_start);
> +	if (!vma)
> +		return -EINVAL;
> +
> +	if (xe_vma_has_default_mem_attrs(vma))
> +		return 0;
> +
> +	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
> +	       xe_vma_start(vma), xe_vma_end(vma));
> +
> +	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
> +		default_attr.pat_index = vma->attr.default_pat_index;
> +		default_attr.default_pat_index  = vma->attr.default_pat_index;
> +		vma->attr = default_attr;
> +	} else {
> +		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
> +		       range_start, range_end);
> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
> +		if (err) {
> +			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
> +			xe_vm_kill(vm, true);
> +			return err;
> +		}
> +	}
> +
> +	/*
> +	 * On call from xe_svm_handle_pagefault original VMA might be changed
> +	 * signal this to lookup for VMA again.
> +	 */
> +	return -EAGAIN;
> +}
> +
>  static int xe_svm_garbage_collector(struct xe_vm *vm)
>  {
>  	struct xe_svm_range *range;
> -	int err;
> +	u64 range_start;
> +	u64 range_end;
> +	int err, ret = 0;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  		if (!range)
>  			break;
>  
> +		range_start = xe_svm_range_start(range);
> +		range_end = xe_svm_range_end(range);
> +
>  		list_del(&range->garbage_collector_link);
>  		spin_unlock(&vm->svm.garbage_collector.lock);
>  
> @@ -283,11 +332,19 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			return err;
>  		}
>  
> +		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
> +		if (err) {
> +			if (err == -EAGAIN)
> +				ret = -EAGAIN;
> +			else
> +				return err;
> +		}
> +
>  		spin_lock(&vm->svm.garbage_collector.lock);
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void xe_svm_garbage_collector_work_func(struct work_struct *w)
> @@ -927,13 +984,28 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
> -	int need_vram;
> -
> +	bool is_retry = false;
> +	int need_vram, ret;
> +retry:
>  	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (need_vram < 0)
>  		return need_vram;
>  
> -	return __xe_svm_handle_pagefault(vm, vma, gt, fault_addr, need_vram ? true : false);
> +	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
> +					 need_vram ? true : false);
> +	if (ret == -EAGAIN && !is_retry) {

I think you can get -EAGAIN multiple times and this perfectly valid.
Unmaps are fully async to this - think the main part of
__xe_svm_handle_pagefault is just big retry loop, this is just further
extentsion of that.

With this nit fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +		/*
> +		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
> +		 * may have been split by xe_svm_range_set_default_attr.
> +		 */
> +		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
> +		if (!vma)
> +			return -EINVAL;
> +
> +		is_retry = true;
> +		goto retry;
> +	}
> +	return ret;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c4d1c3e1c974..6d1ae88313e9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4263,36 +4263,24 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>  	}
>  }
>  
> -/**
> - * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> - * @vm: Pointer to the xe_vm structure
> - * @start: Starting input address
> - * @range: Size of the input range
> - *
> - * This function splits existing vma to create new vma for user provided input range
> - *
> - *  Return: 0 if success
> - */
> -int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +static int xe_vm_alloc_vma(struct xe_vm *vm, struct drm_gpuvm_map_req *map_req)
>  {
> -	struct drm_gpuvm_map_req map_req = {
> -		.op_map.va.addr = start,
> -		.op_map.va.range = range,
> -		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
> -	};
> -
>  	struct xe_vma_ops vops;
>  	struct drm_gpuva_ops *ops = NULL;
>  	struct drm_gpuva_op *__op;
>  	bool is_cpu_addr_mirror = false;
>  	bool remap_op = false;
> +	bool is_madvise = (map_req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
>  	struct xe_vma_mem_attr tmp_attr;
> +	u16 default_pat;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> -	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       map_req->op_map.va.addr, map_req->op_map.va.range);
> +
> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
>  	if (IS_ERR(ops))
>  		return PTR_ERR(ops);
>  
> @@ -4303,33 +4291,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  
>  	drm_gpuva_for_each_op(__op, ops) {
>  		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +		struct xe_vma *vma = NULL;
>  
> -		if (__op->op == DRM_GPUVA_OP_REMAP) {
> -			xe_assert(vm->xe, !remap_op);
> -			remap_op = true;
> +		if (!is_madvise) {
> +			if (__op->op == DRM_GPUVA_OP_UNMAP) {
> +				vma = gpuva_to_vma(op->base.unmap.va);
> +				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
> -				is_cpu_addr_mirror = true;
> -			else
> -				is_cpu_addr_mirror = false;
> -		}
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				default_pat = vma->attr.default_pat_index;
> +			}
>  
> -		if (__op->op == DRM_GPUVA_OP_MAP) {
> -			xe_assert(vm->xe, remap_op);
> -			remap_op = false;
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				op->map.is_cpu_addr_mirror = true;
> +				op->map.pat_index = default_pat;
> +			}
> +		} else {
> +			if (__op->op == DRM_GPUVA_OP_REMAP) {
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				xe_assert(vm->xe, !remap_op);
> +				remap_op = true;
>  
> -			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
> -			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
> -			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> -			 */
> -			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> -		}
> +				if (xe_vma_is_cpu_addr_mirror(vma))
> +					is_cpu_addr_mirror = true;
> +				else
> +					is_cpu_addr_mirror = false;
> +			}
>  
> +			if (__op->op == DRM_GPUVA_OP_MAP) {
> +				xe_assert(vm->xe, remap_op);
> +				remap_op = false;
> +				/*
> +				 * In case of madvise ops DRM_GPUVA_OP_MAP is
> +				 * always after DRM_GPUVA_OP_REMAP, so ensure
> +				 * we assign op->map.is_cpu_addr_mirror true
> +				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
> +				 */
> +				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
> -	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
> +	if (is_madvise)
> +		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
> +
>  	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>  	if (err)
>  		goto unwind_ops;
> @@ -4341,15 +4352,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  		struct xe_vma *vma;
>  
>  		if (__op->op == DRM_GPUVA_OP_UNMAP) {
> -			/* There should be no unmap */
> -			XE_WARN_ON("UNEXPECTED UNMAP");
> -			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
> +			vma = gpuva_to_vma(op->base.unmap.va);
> +			/* There should be no unmap for madvise */
> +			if (is_madvise)
> +				XE_WARN_ON("UNEXPECTED UNMAP");
> +
> +			xe_vma_destroy(vma, NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>  			vma = gpuva_to_vma(op->base.remap.unmap->va);
> -			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
> -			 * to newly MAP created vma.
> +			/* In case of madvise ops Store attributes for REMAP UNMAPPED
> +			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
> -			tmp_attr = vma->attr;
> +			if (is_madvise)
> +				tmp_attr = vma->attr;
> +
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>  			vma = op->map.vma;
> @@ -4357,7 +4373,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  			 * Therefore temp_attr will always have sane values, making it safe to
>  			 * copy them to new vma.
>  			 */
> -			vma->attr = tmp_attr;
> +			if (is_madvise)
> +				vma->attr = tmp_attr;
>  		}
>  	}
>  
> @@ -4371,3 +4388,53 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
>  	return err;
>  }
> +
> +/**
> + * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct drm_gpuvm_map_req map_req = {
> +		.op_map.va.addr = start,
> +		.op_map.va.range = range,
> +		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
> +	};
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
> +
> +	return xe_vm_alloc_vma(vm, &map_req);
> +}
> +
> +/**
> + * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
> + * @vm: Pointer to the xe_vm structure
> + * @start: Starting input address
> + * @range: Size of the input range
> + *
> + * This function splits/merges existing vma to create new vma for user provided input range
> + *
> + * Return: 0 if success
> + */
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
> +{
> +	struct drm_gpuvm_map_req map_req = {
> +		.op_map.va.addr = start,
> +		.op_map.va.range = range,
> +	};
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
> +	       start, range);
> +
> +	return xe_vm_alloc_vma(vm, &map_req);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f735d994806d..6538cddf158b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -177,6 +177,8 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
>  
>  int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>  
> +int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
> +
>  /**
>   * to_userptr_vma() - Return a pointer to an embedding userptr vma
>   * @vma: Pointer to the embedded struct xe_vma
> -- 
> 2.34.1
> 
