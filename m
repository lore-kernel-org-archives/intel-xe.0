Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB5DC35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 23:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BAF10E044;
	Fri, 15 Dec 2023 23:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42D910E044
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702683656; x=1734219656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OVUCWWDHRVCvzMInH6YJ73q2eh9Srgaj2YoaD73RpfY=;
 b=ZWMRrxks+S8xKSu10DA45+rmZPTedKEtAtUmrWPXiWM5LrUSDkU3K2sF
 Uh5CXRrC7lihAk5eMLqBMaASd/g1fKytgxeWQfoP6wJLMVnuiHG4BYntY
 nn8psU4VXERhNMGLmIKkmmfnPuf5ws1cD7O2YUwCf1GlVRl4+rfaMClsW
 oi85hFck0mGXSQQAXYQWiullIwho/cqy4kgrEwEB7lyhGtgRqeMrRIrxM
 FzhaZ4L3sxuOUMZOJ5b3Q2JcSkHJGQfU2dGWTB/xKflbLpcP2lz7nc0yO
 qTUMmNQ0TNq38GDZmMJI8h+7udzf5vG/BV3Svvtz89sfUtuo3FBWoVEac A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2427311"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2427311"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 15:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="845278642"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; d="scan'208";a="845278642"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Dec 2023 15:40:54 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 15:40:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 15:40:54 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 15:40:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mes2+rNH83YwKeeEFJJSee2jECXq7NgOiu9qJLpbts7qniSJ7RCdy5ktMfwsA4Q4BIL9tJ6JwIcFF7/w2KRgMQeu2zStHNLqBTbXRbnFB2gg6V+5eqBareSwXHcTpRCznc03m0+zPuTT0gA1jsrnLbbf2/RcgBPnfaDmxvto5iWhnWPSdHapY4XjZ7i31eK4xAfemsJhRoHsN4r04LOF1S3meZhJBEhoomUhdIbuQ2GEb5LgK7RSG9kkZ5/eeMYXVSulFW8eseGD1GJlFNcFFV/PF9ZR2e5Y1vDxGeCHiViesjBuIpPCyOeTJGinX0vq1D0983mWXIJIjW62Xptm3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wswu29oyh8ALSgdYDcHOxCMO9d1K+oYYNr4nx9Wyzfc=;
 b=ZZeCHZsg+3UptfVHztfTUwwHkjYkwDcLWphmRowKqiouDygNK7xELTXBp0zs/i7JzBJk5liwLE3e2GcIGbUvFLqJ/kPHSRgNKpUxWt7d5nD13ZyfH7y+w7+dIRNGXawDS95b5BC0CpbTaZ0pULmzJl/BWVmiRoQ6GdKfAwdDBGiXJ8NwJM6rURa6FVKSYrXEctTvm78hcx4MZtlOYi9ghlWfYxvjUkVo4shOlBe4jPzMjJ2/Jp4Da6YBbs0q7dOkivDMnU6hAfMd60c9S/cUko/LCIEFPHo5FUL1pdN8D8LDfBCxo1p7424zDgcCAKs+mEvACEMnnRSeepb8NDim9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 23:40:52 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7091.032; Fri, 15 Dec 2023
 23:40:52 +0000
Date: Fri, 15 Dec 2023 15:40:49 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
Message-ID: <20231215234049.GC1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: d71a46a2-2b82-4578-bc24-08dbfdc745b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJF353np5dD5AVumpeGuqdEHmWhLHQSCOn8ftBPP4PQr80Y3s9tfGv93Cg1G+ts079cENpPkhSEhhxGHgRbcv7qW/9SozKwf0KhXkwsODH+mG6E/y1/maXDRovZYkZAklUw7nyZ/KQrIAUxJzzVlMz6D/B64vLt18Y6ubHD3YntM4qagSTAhre+daD6aX/LorYk87DkGYazcuptJfSB/kTxE4yI4Z8GZJthutSz5/iAgrsFvS6pksz/eAIuow0RAhaNmZmsXm1IqLcKnZ5refyPlcxtO5P8J/AVJ2pDOmXRMc+15cBBoyviVI3E0zpJakkuhd9nixItuQOPicN6MWBIZ4e1o0F2pQJgWVFEyVKBFrG5jryjQA6kdWTn1zyYRQCBnoTH2bl4jl9DVQG6/uDUISsbVBKmd+G3RLYMhPp0iBlkv+TVm6BFGxw4isA/m8ffAl79LAuUhGAC+5iuc3qTw3S8PVMaYOjL/cMDHBRqRkhn1hJYfp/0BUsGOhjeTfcosUBU7VPTX0YqkUVAbpVM2tJ09Q6Mf1Y1shUuzv9UQaUszncH+p3wEcS2midoH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(26005)(66574015)(6506007)(1076003)(82960400001)(33656002)(86362001)(38100700002)(83380400001)(5660300002)(4326008)(6512007)(6666004)(6916009)(316002)(66946007)(8676002)(6486002)(8936002)(66556008)(66476007)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QP/REQaiwrcfKo5KgHwFaAPZTz6jsvdLdg+YoDowcCgKcyFfluqsoljY2S?=
 =?iso-8859-1?Q?4cVgt5E8FqCyS9ZW6oTiqHR8iR1MZsQZ74r7LSxIMGYYjSb6V0OyR9P9b7?=
 =?iso-8859-1?Q?sLmS2Tm4VZAwJS7yctg6SHoCPzkbGUcRMzRTmFxqGxUUTa93gVrs4+rx0a?=
 =?iso-8859-1?Q?7AtcfMMuDW01enIjBkt91Pv8rXwH1Iuhou7Ds1t67fOflBLvNQmNwYv/tT?=
 =?iso-8859-1?Q?/qu6jrS/ttvYjNH9bOFo4LBFd337ZXucwFLcMceN5euB/nbIGv3u+R8sCQ?=
 =?iso-8859-1?Q?BjI1ASSAjqbtIsUEnJp7Vc1ve7sYwzLWf6L0DD83YqCu8ybWMoVMzGsckQ?=
 =?iso-8859-1?Q?a0D2+HXBG4RzJvZn9T0v9Fc2SpTRgK/oR3yzfBf/Jwpiu6LPzgPI9/pW4l?=
 =?iso-8859-1?Q?4Nx5+Gl8Z08jqnq7L4MN8g2f+GXmEp/O1ZxK5Zyqp79h1LGFun94X4xFKf?=
 =?iso-8859-1?Q?Zx3sz/cl0uu7fQLPy9S/9XpAIOXfqblTkJJ7qxZgDNqiSTVHVzCjKoYNkA?=
 =?iso-8859-1?Q?uDCW0reflabnCHoRjGP3jB6kVkVDVNo5URznhXwR23zFLhpq2pSpy5P0hG?=
 =?iso-8859-1?Q?AeR+co8dpq6h5jJwc5xaA+Jl291nYezyjT3JffMO7K4LAgJTFCm4P0Dm34?=
 =?iso-8859-1?Q?4wewIcvWCeojy6VIwMerZ9rsOQpxFOLRAbKXGS2KIPpQonLv+UHlEIUfgj?=
 =?iso-8859-1?Q?zUevzcGggvTxpVCC1kEmuNWiFYXuSIPKZN/W1sx+ObWazV1onRbqza8OB1?=
 =?iso-8859-1?Q?QM+e+yZmOiPNwVbLnngzSFIJUxlUu1jHOvAvTBioaPjax6YqxCgQbzCiG5?=
 =?iso-8859-1?Q?Qd3YLdKbxvehAQ39B6SRc7MhOaO/8DwTVDQLyPilSmmR8EdCNF0ZKWBuk9?=
 =?iso-8859-1?Q?8w9sXM+HA5VZmkXOvvgrSPEY2ABUg0+QobLquh9YmQuIxSorDD9t23e7zl?=
 =?iso-8859-1?Q?4EovDI53bkBOicO209S3LfmZxGykM+WaS6/WvrQbL+D2X3e27XwLMpGGpU?=
 =?iso-8859-1?Q?L2C813f/o8LC8i2ibSao0mIzNEUW6yrRSvyB6w1+RGDauvOrq5afMYrJO/?=
 =?iso-8859-1?Q?1tODBE2SQX0ouEUiPAOCQLRVYPxBIgys0YTajiUy+asuCa4Z8jqGgMNGiY?=
 =?iso-8859-1?Q?GkEkW71CmBnOjL9ZVUzY+nNPo2Yh4hGkL4+CAQJM74JNc6o7tVYeVAIhD5?=
 =?iso-8859-1?Q?qlZyOq+2kIE7JPtvmrkjLj7e14ghzG8PUHJn33q5RSnwEYX8HCbQsV6WOO?=
 =?iso-8859-1?Q?kaU7owS+aedYSupwkOD3LL6F4Lyq764MmJWjngSng4sKCFVhf7hLZa55pk?=
 =?iso-8859-1?Q?mt2qI/RGqmv8hD3nLWApJ93Euau6iaBwF6YNflSx9t8HT+YIO5dtlHwznl?=
 =?iso-8859-1?Q?AOBpnB+a7ARj2UHiWJ+0Xn1n0y1vZ8y7K3Fyd+mLi/Czt3HCHSALb5/5Y6?=
 =?iso-8859-1?Q?pYRZbr5bXGNDwzqQE2ate/g6zTUnxYjk6Wq1fToharOysyE7bmPw7bDU8o?=
 =?iso-8859-1?Q?XPfFikU1kfN1V04zcNO8H9mP4N1mlKuwy4fKxHknfa8GFkYxGA3x4kZNCw?=
 =?iso-8859-1?Q?5NqCE73i8Y5sz/3Nc346D59Ac23ArYLS1V9+pZx+imKYSdotZSdV+p4LrC?=
 =?iso-8859-1?Q?6OIohk4OwvX/mTnjGw0s3N1rGqITAxlNq2g7OQZ0RFOKyKmlQbcw6zDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71a46a2-2b82-4578-bc24-08dbfdc745b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 23:40:51.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +P9cRdzieoglCkSQQ0k7C38HqyEkvVsMXahk/OKx1j8s2dsiR1rfoJZaV8mQypzq7APzHGrS19lbcEG7zgMpS/0j3pguAY2ppAVBTm3lHNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 01:54:36PM +0100, Thomas Hellström wrote:
> Since the migrate code is using the identity map for addressing VRAM,
> copy chunks may become as small as 64K if the VRAM resource is fragmented.
> 
> However, a chunk size smaller that 1MiB may lead to the *next* chunk's
> offset into the CCS metadata backup memory may not be page-aligned, and
> the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it could,
> the current code doesn't handle the offset calculaton correctly.
> 
> To fix this, make sure we align the size of VRAM copy chunks to 1MiB. If

Does this need to be device-specific (derived from
NUM_BYTES_PER_CCS_BYTE)?  On DG2 the main:ccs ratio is 256:1, but on LNL
(and presumably future platforms) it's 512:1.


Matt

> the remaining data to copy is smaller than that, that's not a problem,
> so use the remaining size. If the VRAM copy cunk becomes fragmented due
> to the size alignment restriction, don't use the identity map, but instead
> emit PTEs into the page-table like we do for system memory.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 67 ++++++++++++++++-----------
>  2 files changed, 40 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 47fcd6e6b777..5f5b416dc88c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
>  
>  	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> -		 &src_it, XE_PAGE_SIZE, pt);
> +		 &src_it, XE_PAGE_SIZE, pt->ttm.resource);
>  
>  	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 2ca927f3fb2a..0b8a33116322 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -411,14 +411,31 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  
>  static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
>  {
> -	/*
> -	 * For VRAM we use identity mapped pages so we are limited to current
> -	 * cursor size. For system we program the pages ourselves so we have no
> -	 * such limitation.
> -	 */
> -	return min_t(u64, MAX_PREEMPTDISABLE_TRANSFER,
> -		     mem_type_is_vram(cur->mem_type) ? cur->size :
> -		     cur->remaining);
> +	u64 size = min_t(u64, MAX_PREEMPTDISABLE_TRANSFER, cur->remaining);
> +
> +	if (mem_type_is_vram(cur->mem_type)) {
> +		/*
> +		 * VRAM we want to blit in chunks with sizes aligned to
> +		 * 1MiB in order for the offset to CCS metadata to be
> +		 * page-aligned. If it's the last chunk it may be smaller.
> +		 *
> +		 * Another constraint is that we need to limit the blit to
> +		 * the VRAM block size, unless size is smaller than 1MiB.
> +		 */
> +		u64 chunk = max_t(u64, cur->size, SZ_1M);
> +
> +		size = min_t(u64, size, chunk);
> +		if (size > SZ_1M)
> +			size = round_down(size, SZ_1M);
> +	}
> +
> +	return size;
> +}
> +
> +static bool xe_migrate_avoid_identity(u64 size, const struct xe_res_cursor *cur)
> +{
> +	/* The chunk is fragmented. Hence can't use identity map. */
> +	return cur->size < size;
>  }
>  
>  static u32 pte_update_size(struct xe_migrate *m,
> @@ -431,7 +448,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	u32 cmds = 0;
>  
>  	*L0_pt = pt_ofs;
> -	if (!is_vram) {
> +	if (!is_vram || xe_migrate_avoid_identity(*L0, cur)) {
>  		/* Clip L0 to available size */
>  		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
>  		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -461,20 +478,13 @@ static void emit_pte(struct xe_migrate *m,
>  		     struct xe_bb *bb, u32 at_pt,
>  		     bool is_vram,
>  		     struct xe_res_cursor *cur,
> -		     u32 size, struct xe_bo *bo)
> +		     u32 size, struct ttm_resource *res)
>  {
>  	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>  	u32 ptes;
>  	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
>  
> -	/*
> -	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
> -	 * we're only emitting VRAM PTEs during sanity tests, so when
> -	 * that's moved to a Kunit test, we should condition VRAM PTEs
> -	 * on running tests.
> -	 */
> -
>  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>  
>  	while (ptes) {
> @@ -498,10 +508,10 @@ static void emit_pte(struct xe_migrate *m,
>  				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
>  					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
> -					flags |= XE_PTE_PS64;
>  				}
>  
> -				addr += vram_region_gpu_offset(bo->ttm.resource);
> +				addr += vram_region_gpu_offset(res);
> +				flags |= XE_PTE_PS64;
>  				devmem = true;
>  			}
>  
> @@ -730,6 +740,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  						      &ccs_ofs, &ccs_pt, 0,
>  						      2 * NUM_PT_PER_BLIT,
>  						      NUM_PT_PER_BLIT);
> +			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>  		}
>  
>  		/* Add copy commands size here */
> @@ -742,20 +753,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  			goto err_sync;
>  		}
>  
> -		if (!src_is_vram)
> +		if (!src_is_vram || xe_migrate_avoid_identity(src_L0, &src_it))
>  			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
> -				 src_bo);
> +				 src);
>  		else
>  			xe_res_next(&src_it, src_L0);
>  
> -		if (!dst_is_vram)
> +		if (!dst_is_vram || xe_migrate_avoid_identity(src_L0, &dst_it))
>  			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
> -				 dst_bo);
> +				 dst);
>  		else
>  			xe_res_next(&dst_it, src_L0);
>  
>  		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
> +			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src);
>  
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
> @@ -984,12 +995,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		size -= clear_L0;
>  
>  		/* Preemption is enabled again by the ring ops. */
> -		if (!clear_vram) {
> +		if (!clear_vram || xe_migrate_avoid_identity(clear_L0, &src_it))
>  			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
> -				 bo);
> -		} else {
> +				 dst);
> +		else
>  			xe_res_next(&src_it, clear_L0);
> -		}
> +
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
