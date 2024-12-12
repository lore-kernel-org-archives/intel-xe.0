Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E351E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 03:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1231010ECA4;
	Thu, 12 Dec 2024 03:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXzfBnsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B461010ECA4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733974428; x=1765510428;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5gCxi8OdrxZS2eZLEodZCRtbKQeqpuGzJ6H2y3DAaP8=;
 b=UXzfBnsOAlpJW93R6Ymvm6tyNTT1qCNNO9getf7N9qcMFbmb4bF05bVf
 wldqz8Pq5CdfNHDxBF/hIbu3eAJ5QBh3NAoPHIJVIbkKFz52GJH00j8Od
 ymWLevrgBqg4VvM/ET5kDmzz9t8+mS4xhHba4tdtxbPNrB+GKj2cvKq15
 CTAyRLAyAuYtTK4r+lYjXoXmCLKtFk/YBr3pAIQhAjb/Ug5Yn8QpKJRiD
 8/W0ESi4WCZV9lZiJWi6UgPsS9bI3OHoMKh+Ox0R8/k6d8KMcE/fgXoDt
 xRcqftj++sPbCs1MTBiUzWkpcKSTbyYHlCGKLvSly02+oIbSyqRVdMawZ A==;
X-CSE-ConnectionGUID: 4H3zGo3AQRSFvUZK+sdkpg==
X-CSE-MsgGUID: bgVMvbz2QUeoFFcpoVKPAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34506334"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34506334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 19:33:46 -0800
X-CSE-ConnectionGUID: uY9Y1cncTsCu2EMUun7iHA==
X-CSE-MsgGUID: cTV6GUdhS8+jdW17xMDN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127050256"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 19:33:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 19:33:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 19:33:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 19:33:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHpYGyYvn/78xqmmbtQe/BWrhijtQ81M2Een3G6Ru3uiQMoQBXBymT4EMwL8C5Suq2vj+zoMRfMK04dEZ40NMY8kU1tb1df2gydGSdGBOyge9Dd6+g80foZBQgRFhdoM79X0qmVNjUcbER0xytLF77fSF3II7Qi+2CFAY39RxF02nQPy5uQNLpWf/vHHkl4h4dM6ugSHcf0dv3zQVPhmmZnE7QBZzTCwErWCygI29RBS/HRfKJaRz/99mVLu0MkH0WSueATNXe+yymHIdnbQQVtKLdQL6xIc8n7x4FP2+baIpG3gi67ezvlNdZZ2rFSMkv8UcwMVERdnieeJp1c7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znnKNqj2rAMbHb5Mfx5gDlnATks5k3w6BtTMV0qpEKo=;
 b=GlZkyXH90HT5Xy+/cr3b4a/EbBNx8UsFlm64v6OyaCuuflLRTDaTW5cjk7Id/ia3hditj6b+UFJZeT9JdwwbODdN1AoQZZ0m9ZBagc4iFhV3ARxiBNCm+El1Wjz96GSWzRV2g/fk24pgnacfg4yBhzRgSTIkyqnt1LMbgUrqga2k2ennAN57+Djmgq2hMibkoKgZOJtqxkamsZ5Znycu8xmakgc5igakgEp42l791KCMaT3tUlEDdMIDcKa01y/rxpO5yECz+oj2K6Liw6FcAwSUM5UtCL2q94Zjccrv7zGVuO8kpuel59BhdfPcSc91c+YPHrkM+Eyfqv+E9RtPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 03:33:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 03:33:40 +0000
Date: Wed, 11 Dec 2024 19:34:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 11/13] drm/xe/pf: Use GuC Buffer Cache during VFs
 provisioning
Message-ID: <Z1pZvUzL08Z8zzNH@lstrano-desk.jf.intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241212010141.389-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4583:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3a6a1a-40bf-4555-f712-08dd1a5dc520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5mUuaPadjXv65n3N1IGPa+zjRJWwSHUC+dLxbET/RW8s/UJtCRsjTfKSlZTS?=
 =?us-ascii?Q?bB9Z446x7QKTa3GbKy3P3IkSvPolIE+J4E+g+aKOayKhCKQY/CcCViOc8VBW?=
 =?us-ascii?Q?J8VPWOLcm0Wf7J6niRvgaTmEiz/EA2owdlXHMXGOjbpm2HP91512fQ0mhDxn?=
 =?us-ascii?Q?JOo8T1wXvdXj4J9nc7SmEE1KVEohMDmqyDWqKh6mDt1yhZk9aDzXPc1GTA6M?=
 =?us-ascii?Q?WQXBwF5OpFRksITafiycSFWhJSpI7r3weTSIWSAKeSkxqvkTdEJfPmXetye7?=
 =?us-ascii?Q?dLeVFi1yON+yIQUormS6UrcOw1ABFhQwuD3JYOqouLLxOToG8ziJIeZa5WAv?=
 =?us-ascii?Q?/wQli4Mv2bzvzwZI45NOW3AaRTYSR7l0y43kukg5OITaVXm6o7PySy0K90dV?=
 =?us-ascii?Q?aPvpW9kjrwdHOnveDOFcRyECUOAZYC98snowZ/OIjgzuHt6I42AvLnTqV3/E?=
 =?us-ascii?Q?7BduIvHUwW+R1Xv10x9+Y1pxhTFNF05/ixkETuKM+qxJJmrYqx5Ol0QerHDm?=
 =?us-ascii?Q?5atIh0mJRe54V5B5OHssILowb4v5uQ8Cdxqy3XCbiRZODJoVlWfAMGBF74W5?=
 =?us-ascii?Q?1Eg3/Jvt5r2rqQ9Lzw67/AIXgkpOi2AzWn/7Un5eipZi1TLwZIMau+x+kkcn?=
 =?us-ascii?Q?V+88gSOnh8mdlx8mNEoPxq3KQr7/VzrJcKJ/K+4zccMYDY9w2Qo0Q4KQ7q47?=
 =?us-ascii?Q?l4EvCGYytUSzGJmVXVmyT+d9UIejtAxaBW5hTQpg69euuoPFrzIVb07LVRNy?=
 =?us-ascii?Q?XiPFFtB0u+qTpMWY7Yj3mPl19vBBlr+If5nKk6Z/Ltwfe7HWqPu1HbM05idI?=
 =?us-ascii?Q?iURyCzZkiD38MmsXDaJ4KJCwJVI5+oCNtGOPbYt+uls8G94ofNgA5yuPSu5d?=
 =?us-ascii?Q?M+ul7uO1M81VtLAUgUQmuWfnReQUPldsTcZqitOAP5oPUXxzKLVsZirn2tyC?=
 =?us-ascii?Q?z0nftKzXfH59Vf1RX0leUDBJNOSG9N79+WHgYrav9BbrSIym9IxkWbtP/bEZ?=
 =?us-ascii?Q?93zVt1YEW4kx7V2kF/lX73mW2UMmzBZ9qL63hRIFgEDe7CcMCXs8kwrIEcXK?=
 =?us-ascii?Q?M4NJ0+aIcizvFwY9gzaFDsovD3H6ykzJed0HIswmQLYCDdH5f1dA98HkydaY?=
 =?us-ascii?Q?epl8YPq+S/7J5D4rJ3J5ogmWb2FElKb4wVJ50WGo23n3p44KaRCEyPGiD6Y0?=
 =?us-ascii?Q?DxXSsUicBsxv+y0xBqywaHRx5cuG0Ct2Cy3RbdCJn11Pad53nDFmYkRcA9TU?=
 =?us-ascii?Q?l5+LgNF7MH09WDPzmCHNsBbvSJ4qojDPVqlN2Uy6R97DMYHO6/VYzOkQxcnW?=
 =?us-ascii?Q?m1Z/mv2WE6mmh9pd6boc5XelFHcgo+A+WqlRdmH/Wdfdnw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sCN7WxP12AevRg+Xtbsrn5uFAxImbZ20unr57i3e7ReiRhK53U0SradMfUFJ?=
 =?us-ascii?Q?xDpeJTvbTN/R+h0CjwI193efclIxFROnDU75omDov9gx6WqV798SfrA2MLUq?=
 =?us-ascii?Q?6j+dBhXxC5Yk8nljAVa0MC7jTi9xLTGm0xwJ8w8JF2IpcuT2RirB1r/BohvR?=
 =?us-ascii?Q?sp28mm7qhYmGM8AIEax1mDo3zJJiFKDJ92FiqLXWvldjre+rT2b0TQ/302al?=
 =?us-ascii?Q?Gr537jhMFktOQlMvwnLYyrJtMJTGlSppJ4iMk5x2fazZspxmlMFWWihuic5h?=
 =?us-ascii?Q?gOiy2s5W9TlP+venMU4pp/MSOxa6jeTN2PQJs7KtWXw7FVqiNFrjaOR2DzPQ?=
 =?us-ascii?Q?44JuzEkrJlN9OI86v7lgJ6pWESoFqL3lyHc6uwF6ADKDYX5h9GSv06iYRWQV?=
 =?us-ascii?Q?TyRohcEbQI2LrdDH3OMa2h8Djpxlqs2+lTOMjMGWyU0EQSU6QUWZPcaVeGgk?=
 =?us-ascii?Q?VbmvEzPIB6QK50iCqNzDMv1bVxxVG0Z0PtyrG9xmixL33a9aNGWu8a7oU/uN?=
 =?us-ascii?Q?DUKT8LmluChz7kRqbYs8ErjsttunMiRhdewrEMJ3STkK62O/bH3jtLm9+O2R?=
 =?us-ascii?Q?1i77+F7GkRIrxXHnP3xyMBMsPHvLV8Kz6J9BOnaYPBLHlmrTPLHr7gtUJwU4?=
 =?us-ascii?Q?fGI+pjq4LQrWAYZei2GyZoDBshyaTht8KcTSA3TCf2ls04ythgQQi40sdyVC?=
 =?us-ascii?Q?qignWuEUsaHRbI89ogxB92x5IF7Chc7oDYpxUIVdcAwVzchUM9b7Fi+Se3sG?=
 =?us-ascii?Q?inAc3ZOkqAIQpiO0PNgv3ArS49r6CavwdlY1DObNgjEcZ9h65MiZokvo8slB?=
 =?us-ascii?Q?5r1auMjWaQ6Wd1ZoAgtKQfGxxEHxo8OHNg8fuB0KgLp0QmEzLJh8Th5mXwU3?=
 =?us-ascii?Q?Bb97Q+P02r6p214DUSttumViF7HcPLYophE1PjyY0ORhgTHUw+MknwG3/FbE?=
 =?us-ascii?Q?okjWb1xU5cwboNN/tWlsjq2ex2gQMXqrZh/qhJP/+VuP1Kh3vp1L6NU52htO?=
 =?us-ascii?Q?XfoUiZFMr6txLcyiMb3PUILE3T8iwu22WTGWOJJSrcyiuT/qCkYEDWRNqr+0?=
 =?us-ascii?Q?3ZkGecV9SuhJsQ4YGwlVuUFQQ1GYm9hyPSRVx117LOng/SXzelD8dpiQEnZj?=
 =?us-ascii?Q?mN6XiFW/elRmyO5h0PnKQj2BGG8luay44VHGD4+495BS6mZ2mfjt/4govDEU?=
 =?us-ascii?Q?LJAEmgF/lhbnhGMq2RdUgw+8rdeydkIGiYcBo4w8pto3pRlvJtNGqcKlUiiv?=
 =?us-ascii?Q?E5X6cOcKM+QQL0LERGoBjInkm5sToqIOBNkPF8N+061MQwPmUxEK5Sm//XIS?=
 =?us-ascii?Q?ZwRXuLxvHtVBUarA4rnRRheE2M/6KbO6WKU//nD1BSrKcZMu8ve8C6smNV4/?=
 =?us-ascii?Q?rs+yV1baWJ2guZ2OzMmlD9GRnDu4yVdVQIDQcAkZfzOZzf1u3To8IU8L3gXN?=
 =?us-ascii?Q?5tQXVLcONW+xuTUWgA+OyP70Ck3SaV17KNmlucGcxZNaLNs3xuHNvoo5SyCi?=
 =?us-ascii?Q?jLvmePlnGsjQoIobXYAvEh1t4Jc5JR1zoE4bRyQgB9HkniOTC4d9bVswHSee?=
 =?us-ascii?Q?evCIxdDKOY998u62f9KB/FsShTdn/mPluv4G9PeyhtkcbBWrK39pxTSHc3u2?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3a6a1a-40bf-4555-f712-08dd1a5dc520
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:33:40.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsfBZ2opjhE0Qjc+qzxcbdDyxyTv+YkgVsb3aLaMqQGxkHatCBT45X0XTxSzJBlu3tc52g59goLjB6UaAJ818g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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

On Thu, Dec 12, 2024 at 02:01:39AM +0100, Michal Wajdeczko wrote:
> Start using GuC buffer cache for the VF's configuration actions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: rebased (Michal)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 69 +++++++++++-----------
>  1 file changed, 36 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 65082f12f1a8..8f756f81bc20 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -20,6 +20,7 @@
>  #include "xe_gt_sriov_pf_policy.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_db_mgr.h"
>  #include "xe_guc_fwif.h"
> @@ -71,48 +72,27 @@ static int pf_send_vf_cfg_reset(struct xe_gt *gt, u32 vfid)
>   * Return: number of KLVs that were successfully parsed and saved,
>   *         negative error code on failure.
>   */
> -static int pf_send_vf_cfg_klvs(struct xe_gt *gt, u32 vfid, const u32 *klvs, u32 num_dwords)
> +static int pf_send_vf_buf_klvs(struct xe_gt *gt, u32 vfid, struct xe_guc_buf buf, u32 num_dwords)
>  {
> -	const u32 bytes = num_dwords * sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> -	int ret;
>  
> -	bo = xe_bo_create_pin_map(xe, tile, NULL,
> -				  ALIGN(bytes, PAGE_SIZE),
> -				  ttm_bo_type_kernel,
> -				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> -				  XE_BO_FLAG_GGTT |
> -				  XE_BO_FLAG_GGTT_INVALIDATE);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, klvs, bytes);
> -
> -	ret = guc_action_update_vf_cfg(guc, vfid, xe_bo_ggtt_addr(bo), num_dwords);
> -
> -	xe_bo_unpin_map_no_vm(bo);
> -
> -	return ret;
> +	return guc_action_update_vf_cfg(guc, vfid, xe_guc_buf_gpu_addr(buf), num_dwords);
>  }
>  
>  /*
>   * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
>   *         negative error code on failure.
>   */
> -static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> -			       const u32 *klvs, u32 num_dwords)
> +static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> +			       struct xe_guc_buf buf, u32 num_dwords)
>  {
>  	int ret;
>  
> -	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> -
> -	ret = pf_send_vf_cfg_klvs(gt, vfid, klvs, num_dwords);
> +	ret = pf_send_vf_buf_klvs(gt, vfid, buf, num_dwords);
>  
>  	if (ret != num_klvs) {
>  		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
>  		struct drm_printer p = xe_gt_info_printer(gt);
>  		char name[8];
>  
> @@ -125,13 +105,35 @@ static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
>  
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
>  		struct drm_printer p = xe_gt_info_printer(gt);
> +		void *klvs = xe_guc_buf_cpu_ptr(buf);
> +		char name[8];
>  
> +		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
> +				 xe_sriov_function_name(vfid, name, sizeof(name)),
> +				 num_klvs, str_plural(num_klvs));
>  		xe_guc_klv_print(klvs, num_dwords, &p);
>  	}
>  
>  	return 0;
>  }
>  
> +/*
> + * Return: 0 on success, -ENOBUFS if no free buffer for the indirect data,
> + *         negative error code on failure.
> + */
> +static int pf_push_vf_cfg_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs,
> +			       const u32 *klvs, u32 num_dwords)
> +{
> +	CLASS(xe_guc_buf_from_data, buf)(&gt->uc.guc.buf, klvs, num_dwords * sizeof(u32));
> +
> +	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
> +
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +
> +	return pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
> +}
> +
>  static int pf_push_vf_cfg_u32(struct xe_gt *gt, unsigned int vfid, u16 key, u32 value)
>  {
>  	u32 klv[] = {
> @@ -304,16 +306,17 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	u32 max_cfg_dwords = SZ_4K / sizeof(u32);
> +	u32 max_cfg_dwords = xe_guc_buf_cache_dwords(&gt->uc.guc.buf);
> +	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, max_cfg_dwords);
>  	u32 num_dwords;
>  	int num_klvs;
>  	u32 *cfg;
>  	int err;
>  
> -	cfg = kcalloc(max_cfg_dwords, sizeof(u32), GFP_KERNEL);
> -	if (!cfg)
> -		return -ENOMEM;
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
>  
> +	cfg = xe_guc_buf_cpu_ptr(buf);
>  	num_dwords = encode_config(cfg, config, true);
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
> @@ -328,11 +331,11 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  		num_dwords += encode_config_ggtt(cfg + num_dwords, other, true);
>  	}
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
> +	xe_guc_buf_flush(buf);

Nit: It doesn't look like the return of xe_guc_buf_flush is ever used, maybe drop it.

Matt

>  
>  	num_klvs = xe_guc_klv_count(cfg, num_dwords);
> -	err = pf_push_vf_cfg_klvs(gt, vfid, num_klvs, cfg, num_dwords);
> +	err = pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
>  
> -	kfree(cfg);
>  	return err;
>  }
>  
> -- 
> 2.47.1
> 
