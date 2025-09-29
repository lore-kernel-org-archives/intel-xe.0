Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FC9CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 23:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD8010E4B1;
	Mon, 29 Sep 2025 23:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IqJ6ySHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4808810E4B1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759188317; x=1790724317;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xolgaz1sizVAaTdFvrUrQIhFdJM0hfufLzkM3GDqEis=;
 b=IqJ6ySHdHf8f1Sz5ABhjfLuwN/wxRBa11VdjIzP6twUGJb3yK05toDr9
 APTPWD/mRFJC8W/Y7d6Ch4L0FSN2Q94iNb1NlbGjAqKEhaBjfNnnvu2As
 4wR+gX7+suAK9hqGrgmN2k/tr9j+HhKVJQsDaU6Kq50LAz6yJl/RwXIVM
 4YPD9/o1qD+Bm444hhX5t3d5fpfjatcbISwKYazzmOs8ZIcimqK0DNzIH
 ZP3xjZBiGrtrdRspEfNt7Nnn0RFGwOt9mYdMoEZ7Hnapk8Igqo4AUiBIW
 YZRPag40IZvYjov3LidgTdSXesis7zhUodkdTgwoR6lTjqeks6UzdySXg A==;
X-CSE-ConnectionGUID: FlfCeAPySKeZ9PWQF/HdCQ==
X-CSE-MsgGUID: TEW3Gy+zRJ+EXCGwyK9miQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72541037"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72541037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:25:17 -0700
X-CSE-ConnectionGUID: 70t48A0lRk6Dw2tLq7qmFQ==
X-CSE-MsgGUID: NKgLL42tSeivzxevwMKmlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178399904"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 16:25:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:25:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 16:25:15 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 16:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czY3qzdael1puzCjicsej4Aavl8n5MDhzTInnQ6SpzjWj7ppGV7brdzKMsf3FOfxYo/cmgofEDxB6U/8y/W9ZNQf7fidf1RxeeK0a58E1xv8nkmOZbVxEIEcY/I+4IdlpP6MnMeFAkHTbHYoz/4hM2OhTE+FupQRPVR96nNuExfruiS69SthM2fZcT7qNt7e4RC14jm2wgrSI7+KKwss6/xlsKNUCna8xZhimhFxNlah7EXhke32ecHvewcxOgGxyDVOXFuER78L2X6HJIW2cvdmWVIxtrUWE7KagAUAYvPy6fYyqWDk5Q8kApttuR0eHSAGKu8skrn9yXyY9gwXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NOA97+tWgfm2vOvTmJAnYcgd7vJrigyvBlxsQsgmn0=;
 b=bP2yXH+jfd4ioHUiRy56FkjcYf9MIv9dhnCfKMuW3fi2mAR7Q5H/JzVLn91plMlAOAG5xXhzXUFyNhIMM+5/gY8Veeu1D7kfandXVc/rnZBN5uSaSkwLd5oAA7OF92hQ7MWj1AlZmlAJDIqlYO0MBhbzll3FcBXes4JXuVcfCIspd4JrwkSRmZd97dYO69ioZWDZX7apnf3isSi45nBj5NSVzrAGphCKniHkU9w51vjnObYhnhPcgWAKcqrEKDSykCDyW+PCRCudTsY48GZbkrYP/fOk75XDyjtGrNiQ1iPNzPZZFkAO8/022K8J8xFJrIO3uMFGf+bX/o3afKQN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 23:25:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 23:25:13 +0000
Date: Mon, 29 Sep 2025 19:25:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/debugfs: Update xe_gt_topology_dump signature
Message-ID: <aNsVVckCaae4aLC0@intel.com>
References: <20250923211613.193347-1-michal.wajdeczko@intel.com>
 <20250923211613.193347-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250923211613.193347-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:a03:80::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6cefee-851a-4089-9d47-08ddffaf7080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8a9jj2dRiVlLuJKA0rLyfXRNytmUCGaaebvPph1uw6EUTnQdZOJllQ6GA+V?=
 =?us-ascii?Q?raT6bUuKkOwYMA0CXiTDX/tMfxuKTaIkl7EVlEOj5sgsmZFU/Vx+kqRIBmpP?=
 =?us-ascii?Q?wkTzsr99I87y//ecmsPxsRc6qgcM+f67ZoPmlsOASyULu8MY+NYwnDx78J+A?=
 =?us-ascii?Q?epEUgM4m/ZzHBR50xsP1myZMtTsXuJzNe172BpSMfn8fKC+7MNx+cgQ39VTc?=
 =?us-ascii?Q?B/gFNw5bRgJMyibmuEpgCQlrg8zliimho/6DZ9IQOO4pP2zB73Edksa4goFx?=
 =?us-ascii?Q?tYw92Sh8g7IqtZNCSF4allvHiGbp9anwcr98XgwCQVbrSoQrPEL9zSMEqggy?=
 =?us-ascii?Q?Q4WLLHbbFzKVSXXGp5MqYVwnYUp3Z/mzuCvy4Liz30za3kmoJ7TDLy2E9dRl?=
 =?us-ascii?Q?Mxqt54bVKKt4aOZxA7M2UdGlj9DXqwJ4XyPtX6nYnEDbsgtNwqjqvtWm2baf?=
 =?us-ascii?Q?SCBm8zAvJ80rwo0D5FZgsBJl8qGbBQJ6L5up3B4Q93smximMhWrWkPh4Lfxg?=
 =?us-ascii?Q?7Zyrz99Cl3j+O3BqJxd8MeDZulcRrprqUK6gZ4CcCe2ij38CAyrpkJpFXYHq?=
 =?us-ascii?Q?J2qSx/VWQfv71vd1D/N5GJp6MBQZdTqrw+zOa8+ZR/E0mWpj3lQawTjIw9Dw?=
 =?us-ascii?Q?aYvlEu5INGcJeC0Vbb4wQFT7mVtpC5FDPwUtPquu4I6b5/Pcjw0iA8SL3B5b?=
 =?us-ascii?Q?LxL02z7e7LSFfcjUT2ken8tJ9f+nBgMJK5nC0q92V2vbBJcekUigtrrA05az?=
 =?us-ascii?Q?awN+5DSwALjNAdfbRAT+/f7wFHhAhGYokRYxwd7oprkZw9ENWYBDweTuhpHu?=
 =?us-ascii?Q?xbVMq+uF3xPkK/BxDtClLImNOVv9eGJdSqNJ6vH0/vnXlQj/twLAU97G1Lj9?=
 =?us-ascii?Q?Hsd34LBGhqAhggdlwp1PT3Ywh7K9pCHy9KGwxifBPgg9xc0Ahnff3JEN/bRW?=
 =?us-ascii?Q?7MVd79PV+rrIlX3kNwNHOdQEBTY91qPwSKMVgjAiU3pHapnXjU+OvY8sVdkL?=
 =?us-ascii?Q?chZmaiGpH2asqqQOCtUevP5O2OSwy33B07DHZP9PkDoNWu7be4dZG3SvNR3n?=
 =?us-ascii?Q?S2DTFUn18RLA9LCUIh4V3q+eUtHhTRApY8WnWop8bXeS8IoIKX25K2+xPULp?=
 =?us-ascii?Q?iNxg5YouyJkIUW9plkNRf2ky3Lh94p/9Sj+Haglek8x+xNXo2Fk+6Jg3dkMc?=
 =?us-ascii?Q?y7MAkMyZkSUgN8kqLPvGzQ5k0TLpXOHt5BsZN6kXBveaVPJx5tsYLb18Hska?=
 =?us-ascii?Q?2JIKT3WWFzt035QWI3GasnmH9alsBwzNLCRK2Kk2klAW0Xd946tFvckmsOMz?=
 =?us-ascii?Q?Jh7qceK1jgHQ4beQ04o2MMyEJiHSW4O51zmKOjVV76QypkSJ/51pT8koCiHE?=
 =?us-ascii?Q?LXdJMeuRce/Jl4PSGgj6++ML4SmH0Af+WPUmIjU/Pn20ImuGCULtnZYEBrOR?=
 =?us-ascii?Q?a1Wx5i2mkWQW/HuneL/WTJNV0z96MVsT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fh/p9lNXuAF8X9d/PRD+cxSwZBI+6CyN9zBg/x0k97tqpJYW29cNJvDt5oK?=
 =?us-ascii?Q?iqj8KGGJA3eR0y4kAPfcgocieRl/i4JSDE1A1kWkE9KiAwNYavUCih7sGDg3?=
 =?us-ascii?Q?Jfd8LescqK0fLf1KanhkxEUhL74a8pTBKNEaQGLzyMDA+ZPD7ZoKdTluaeTo?=
 =?us-ascii?Q?/2NrpTO+r+4rXnmkdVGTVVlsypb21Lg7M+dFlK3qsX4P8sbEm1NXNDjfVga6?=
 =?us-ascii?Q?i0X1NFelKZRxTm6HnpIXEEkHL2j9XX9KUiLC5oG2aq/2RbEUMvJ4QMc8Te/a?=
 =?us-ascii?Q?QXaYl8Q731chTOqbg32UMhnnw5QvLtFxGtQTczJV8ZkxQzM9EC0V07wVdWiX?=
 =?us-ascii?Q?ES58iQDePI5TgI+UcJ3LXvkhDhtRxXDHm47kZw3cKnDAa/FInNWsde8pVkqd?=
 =?us-ascii?Q?mJFTM1gzXPjQwh2PVUR9WNY18h9g1eQEOgg/wmT+OnC0nYIpi4eUPTIkSLHS?=
 =?us-ascii?Q?cR+dsvFvwRGMzEJZk/76lA5daQYaT/Wg3D6+jsJXXUyoE/gOgtd2ewXjnTHx?=
 =?us-ascii?Q?YCT2srCcIbVkBZvDy6LaS++helNX0E60vKFSYKlBfx6WDsN7joNkuyWTis4u?=
 =?us-ascii?Q?Vod8q9pKv2LR+fzFzubn/EHe70TlOnHMhN1Lz/cRGVyaSHSY76WPIhkVbHFx?=
 =?us-ascii?Q?KbpcoMRv7XRZ+J/d5xCFxAhweXG7X0d8S6S8X2E7zGZyDHUsQ9SRv50FN2YC?=
 =?us-ascii?Q?shI7zLBGFz9wjrC+Fnao+a5ICrSZ/Sz58yQJHGLX+9qVwxoo1BGYZlxDB+cW?=
 =?us-ascii?Q?qnhX3ORPmxMBWWil3WarUWgnAV5gcPRLVtlbXhufQ479ohSr+kH1HF49y2Ol?=
 =?us-ascii?Q?RpcMaYifffWnBXYJOCV4SJyR7Tywhul9nXqMzEJAE6FSGFeC4IhIbStAH9Hr?=
 =?us-ascii?Q?ZBoFCGA1kDCcqjfav9YaA6ndQ8FBMJ/dMRj9iUrhOpfDUbxdaU25190kC8s/?=
 =?us-ascii?Q?vmAqj7cFbrJJWPGccN0mAXodI/FdIJzCFOcoBw80ZSqBX2IJhsmEUQ/uB7L2?=
 =?us-ascii?Q?mM7o+peSXJDXtr70Tyivz0Cyqmgaf8sQKL1+S2axMZ2wGHbnDe6ZCMaPTfJl?=
 =?us-ascii?Q?j/3rm9JroanlCAPEfC4NMfbFwO98cyflJ/HcR4iWnGOHo1z548pJ7Hs5vZM4?=
 =?us-ascii?Q?N1TypltF3xuFT/v4BI5zZXiELlyLmhxrwKxTvMSt6G0OtdNcgBdgT6f8RQo1?=
 =?us-ascii?Q?0yKfGacPqzL4o8Em/ZUXn31L5ECPAic4m15tyQpATf+2z4ioq1456L2rP8jm?=
 =?us-ascii?Q?1b8Tpt5Y/ygolt0A52WnuxImFfKFx3TVvKWTuovKTaREbzco9CyIkc4R29Ys?=
 =?us-ascii?Q?TONiW9E0k0wnIa+bVO7MYl/dwMqkhU9/z1jOCuSAdkHQuVPjsFb/mJePpqgK?=
 =?us-ascii?Q?sFo1h85VOZC4XQV8b1HZyo35NKE570LAwbJxaddYTMznS4CBSl+MMhPoXWQu?=
 =?us-ascii?Q?8U4Zp8oD21Wn6hrI596LpuiMlH0zk47jKl9slJCXFNABi2Q4M0ab3jH+iceu?=
 =?us-ascii?Q?aYgVql2eheRUcJyVDvkbiNsjrvcpvPzHzqbXefwhaHe/SzvyaNJ+Zv+ixYUl?=
 =?us-ascii?Q?v96jPomAMvZC1VtIgWZqW8d3ADwJwpjji9NO3SXH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6cefee-851a-4089-9d47-08ddffaf7080
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 23:25:13.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKN1oEOPEqW3Xem6LE/oFnwHVni+qU5KQDadEa9rll8BkIhQc33RmtCHpj/ysj2jVDl88YtROK+WDzqNz0Xomg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On Tue, Sep 23, 2025 at 11:16:09PM +0200, Michal Wajdeczko wrote:
> Our debugfs helper xe_gt_debugfs_show_with_rpm() expects print()
> functions to return int. New signature allows us to drop wrapper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c  |  8 +-------
>  drivers/gpu/drm/xe/xe_gt_topology.c | 11 +++++++++--
>  drivers/gpu/drm/xe/xe_gt_topology.h |  2 +-
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index b9176d4398e1..6694a38203d3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -136,12 +136,6 @@ static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
>  	return ret;
>  }
>  
> -static int topology(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_gt_topology_dump(gt, p);
> -	return 0;
> -}
> -
>  static int steering(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_gt_mcr_steering_dump(gt, p);
> @@ -239,7 +233,7 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   * - without access to the PF specific data
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = topology },
> +	{ "topology", .show = xe_gt_debugfs_show_with_rpm, .data = xe_gt_topology_dump },
>  	{ "register-save-restore",
>  		.show = xe_gt_debugfs_show_with_rpm, .data = register_save_restore },
>  	{ "workarounds", .show = xe_gt_debugfs_show_with_rpm, .data = workarounds },
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 4e61c5e39bcb..80ef3a6e0a3b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -269,8 +269,14 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>  	return NULL;
>  }
>  
> -void
> -xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
> +/**
> + * xe_gt_topology_dump() - Dump GT topology into a drm printer.
> + * @gt: the &xe_gt
> + * @p: the &drm_printer
> + *
> + * Return: always 0.
> + */
> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	drm_printf(p, "dss mask (geometry): %*pb\n", XE_MAX_DSS_FUSE_BITS,
>  		   gt->fuse_topo.g_dss_mask);
> @@ -285,6 +291,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>  	if (xe_gt_topology_report_l3(gt))
>  		drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>  			   gt->fuse_topo.l3_bank_mask);
> +	return 0;
>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index 5e62f5949b7b..3ff40f44bf2a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -23,7 +23,7 @@ struct drm_printer;
>  
>  void xe_gt_topology_init(struct xe_gt *gt);
>  
> -void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
>   * xe_gt_topology_mask_last_dss() - Returns the index of the last DSS in a mask.
> -- 
> 2.47.1
> 
