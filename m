Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7FACD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 21:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CF311287D;
	Mon,  8 Apr 2024 21:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDzY5RQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7FD11287D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712612661; x=1744148661;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4qdZ1w/L8gb9ENlP+tZxmeGjglS9ExqhzcLa/K8Oons=;
 b=aDzY5RQpJmtfGE/qvzTbXjB1JCPLLM0RZhqZyMwHbIjASxeVEhogeYhx
 T8o2kVoIKoJE59BPYPeuTi2cSm8uWLky5sZhAdkYMKW0oVH/FRcV5doGA
 /esDqOI5YfRcveD7GsvOVmjoIuUEWutH1iqWkGIORvPoa0mT0aNG/RAzz
 vyOcLOlDGgNsKwr3SI+CM8wJbqnNs2YoeX0j2zqsfbYMTCrc5DtNecfnR
 antnaIQBy9X7roGmYGp2mPePQMhhdUVSm5PzSgewyV0tRLx+h0MPO7tFM
 irMIbbJANf3rtt69AfSEUrSF8E+nwn8CCc2FxU5b/uRnTMJ970b87NlaZ g==;
X-CSE-ConnectionGUID: o0XSGTOeSlW0LR5e2Uq66g==
X-CSE-MsgGUID: qpUJqmhVRwuodqTh2v3v9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7825403"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7825403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 14:44:20 -0700
X-CSE-ConnectionGUID: HB9GBb1OTp+JOvva3yBeMg==
X-CSE-MsgGUID: jc9i4QIjQW27j4Q5bU6Riw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24724202"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 14:44:20 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 14:44:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 14:44:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 14:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3R6mt33bMCiDgfwsMQ4PUGrCVpgRK8hbbKDkxptQ9nCZIn9r+AJgM7olzr9SjqCu39ZHXUD88Q9Q93zSzrxmUz+kzl7kcvsTN2NJ0kB9iYCha5YWhhF/TMTLQ5JmxWyVGKBK/u7Pydw7RuVJ2y9ecaeNPPH4p4gGfDM/0qr/Adl4HS+h0/V3QHV2+mjUJ6/9O4nkaGHmKnVUGZ+hIY7fOR0PSTst3Z9ei+0veSIcLPzPHA0CHDXMmHlwxSwy5aZwrWXfwxmi6rlvnbakQYRsvYeq51B8/fPTKAuqSWNYJyrCrQ0BTax+GiuRaIdpp1+bZQVSilzUIPR4ebPDImduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2A3NryuBsaFwyFnvACR5rQFxh7t74gPW4rFZi6ydUY=;
 b=QrTT88mV3Wep6tntZKtlRRrpzhBjfUm3Gdi3OtKpuZvNGLo6ve/rkp16WcUdzXvyiRWuzLLRjAmSJPxfmi5Rvzqa96+8M5V46iPaNt4z95fbpguP6KQ/eOhA0gE/NdT4FNAl13nepZNcnzSALDC/5x97lUz1ZAVA2sEZHc9sxNL47VdwvUdCdTV9IIG/ehI+6oKJF3DGJIlSAKQZVTAa0r6RAHCuwX6ktMbVDl5bf6ZAOiGOYlvbRqjxOnw9ePgmOV416gwXZxCPNBdncfLGgT5QZH5P7jTiWyHhQxcylAy1l7frRsaX8xAfEONw/PBRPqKBjKOGocN6p2d/dJRYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Mon, 8 Apr 2024 21:44:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7430.045; Mon, 8 Apr 2024
 21:44:16 +0000
Date: Mon, 8 Apr 2024 14:44:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 06/11] drm/xe/xe2hpg: Determine flat ccs offset for vram
Message-ID: <20240408214414.GC958162@mdroper-desk1.amr.corp.intel.com>
References: <20240408170545.3769566-1-balasubramani.vivekanandan@intel.com>
 <20240408170545.3769566-7-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240408170545.3769566-7-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWJzZbpu5evKXwKjrqHiTE1/Y+1peurSoPiEhWAb0LRLSYJ/9x6nz4CKTLawBUDTwQUoB0neXB9kkfOUJja3AnwDT9ppYhHCsqwKY7Fb5l1jnqWz/pT8SEzr4+JqxRiWyzIJGi7Dc9Ju7zU/tLYQE/rZOqmUP0j+ulGl6IQ+RN0e1e+CDQxtsO1azTDMUm/XratV1IvbBBOAwi/cYVzIGeu29ALjEzCMpNIzvBxx6OjIFY5KZSxzROI+wd+NPHYpbonmp4khdrl3OON5O3clULEc71O6CM+89INPyY2U7LFUU3bexwkbMFh+2c3asfdChx1ub9g4ut0NUZpbnUBM9tBtJpT4V7HVfCgsmR62Dpt14OBH+2+OxpjK2G6JLtAEu0Fs9NaCC8Pif9jbBSRmCTNxK+gTvVaoTaCps2Zh+V6dUGKVTGxFAnGH1T5CpqXo11Q7xX9AnWH4w1k8Fx+3pnbTZuvX5fKS2ZQUVeuUJ68l3h+8OqPujWSKCnE7rOYX5bCpz7yfMxjUDu1QYjylpBu4j8ExG2QyWQ7oJt+hIaj0Fek7YJYk6Ry+Ax7b454RJKwS4mHVwazmCA+Wr72F0/Dp+t/9TGf7VoNlil5VTaOo0a21NPYgCF0RgGLnJSSYBwERv0aKOTeyCY1KJlUFMzoM//uEljFvaqJirG68G8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVyAZVEt4C21E0gaOmfuSpEg9goNDRrwstIH7946fEpqFnoh2n4wtULjwaBL?=
 =?us-ascii?Q?FhA0uNvwxTdxVzo2v/sezFbB+FVbboR5BrEBrKm2J6EdBJxH9KV/XGVOc9xv?=
 =?us-ascii?Q?DYS/i+1XSw3Doany+CXUgj1ohl53WRc1Vsr0P/qt87lR2VGxTvXhdnN9tzgV?=
 =?us-ascii?Q?u2o9Q2XuK5va9pJVUFYWNz422Jas0XuRAOq7u+j8vxEGrmqzFEFhMLEw23pQ?=
 =?us-ascii?Q?/R1Rgq2jddxQtQhuODVp3ldfNeuukz91rllUmhQPq26AWIrgXvrFuPXJ7W4/?=
 =?us-ascii?Q?pj+9HegMvd0AkwGPhmdZ4c7ymx66UNhFDBtPrSTkwW+mEhIygllGdq8E2jgp?=
 =?us-ascii?Q?5fMK9+/kJSOwxAW/2z9vyjhwzJHqz0v/ObQkW3jcIsNvPbNVduza6NtGp3D+?=
 =?us-ascii?Q?f8eySRHyr26uwNk2BMaM7RsF/oj1YwfwmMr+MfcN+XQE8WJNn/foz9NNR6IC?=
 =?us-ascii?Q?XwFnXQiSXgOhof7CtuqEVq+UZEiXcLlLWvnwQn5TalD5ORvNoQWtdXmV7xvW?=
 =?us-ascii?Q?hIqp93JppHtpjB/QW9kBVyHdvnwJkICHFXOrjxRWheWm7XNGT/ZjM3zd3Jao?=
 =?us-ascii?Q?Kuy7Dxg7TxOdkmOLEqVsR8ksI1KLEV6Gi/PFNSiQxnesnBIVFFCX1GW7pE4Q?=
 =?us-ascii?Q?dADB4lVw/gJDxVjyKr7ABtAJQlwaSaJtriCSKd2fzYFTVQI3ZPzuk7X8maaI?=
 =?us-ascii?Q?klvzkcIMZ45PxQRVrswjkHx8A/gMe4cSWNaA6JEX2sWus+GCXvOOXa71/X8M?=
 =?us-ascii?Q?2HIVOOJhTIJkWGpmCuGBbPSGNLnEKIWAK5za7Q2Ete3Gr3I+CPCmglz3MsAS?=
 =?us-ascii?Q?L3QykfF9vTc+KrCRAXnTrFD1NcIC3Wt5q9wvHrz0uFS4mcbIj56EWCK/0A3W?=
 =?us-ascii?Q?DxUMGFNkKxY3195jSkHy9+vgxBN8SN3oxaLNk5O1UJ4OMVXkTRW2WD9pIO+9?=
 =?us-ascii?Q?93opkGXkF0ii7qNIJ+b1w9YDJlwebqL1xDqp5H+UBH3ywDQCvbbgFwWW+HMR?=
 =?us-ascii?Q?DDaV2Qh4gkc7jhFz5tlJStHczJOKPcTidwSsHwUqLYHkOdYaBH3+8fOY6Qk3?=
 =?us-ascii?Q?k52vXGpbZhL69m18oUyLjh9dAV9lLm+KKXqM2XSOkIyRjuAU5mndiD3Rzqaq?=
 =?us-ascii?Q?ukoZK8lbDBUC7ipvkRNZxKqnyh7/uqtJp98RUCUKPwLHWzBKxxITEF/k2UoX?=
 =?us-ascii?Q?r8cbp6YPQs/0tCa5QB64tWqNwK5T3zPfBs4SEweGXSlWjX5kibmY+C4fqQIk?=
 =?us-ascii?Q?+UvYzl29QGksajAdP7zijnI8/G8CbatVtm6qjzYXE85PAXzJZtwN+AJb8bG/?=
 =?us-ascii?Q?ZyOA3nIMh6nAa7L7hjTScwQn+1TdKXhy5boeQxbCxZghFzLUKxlFYcm2r+rn?=
 =?us-ascii?Q?nkdWCwnuA98wdJ8PuDOpdkouz9XFu8PKu1EoPMPb2St5Vi7CCX+NVF4PfUq1?=
 =?us-ascii?Q?2Q/VsW6gk+Xnh8SjUvQK5YtimhCRmJeElqKcNhybnIrMTrweIntsvhQwrq93?=
 =?us-ascii?Q?tHrzf9Lupf4QzV6zNQrKeCOtiW3a6jQHPNm9fq78S69dgzgKM2NFkGth9Xk0?=
 =?us-ascii?Q?E7qgv2HchPwz4czniYseyS5ku38IaC2/eajslHgWGok4eyKPoVGrXcARDrMX?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaa625a-999b-4dd9-04eb-08dc58150a04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 21:44:16.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sWBHiBC1v83xMR9oO8X93/aPkNwwwTtKJhUf9wdIj/lIytreSoGA4QrJ5jnv2KVn478CtBpeRY+18JEd1FE6mBdX3ojGJaIo3AzGB+KMW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Mon, Apr 08, 2024 at 10:35:40PM +0530, Balasubramani Vivekanandan wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> on Xe2 dgfx platform determine the offset using Flat CCS size
> bitfield of XE2_FLAT_CCS_BASE_RANGE_[UPPER/LOWER] mcr registers.
> 
> Bspec: 68023

We generally treat the bspec references as trailers, so this should be
moved down with the other trailers below, not separated by the
changelog.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> v2: function argument tile_size changed from pass by reference to pass
> by value
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 ++++
>  drivers/gpu/drm/xe/xe_mmio.c         | 39 ++++++++++++++++++++++++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6617c86a096b..d404f211bc36 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -69,6 +69,7 @@
>  
>  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
>  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> +#define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
>  
>  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
>  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> @@ -142,6 +143,10 @@
>  
>  #define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
>  #define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> +#define XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK	REG_GENMASK(31, 6)
> +
> +#define XE2_FLAT_CCS_BASE_RANGE_UPPER		XE_REG_MCR(0x8804)
> +#define XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK	REG_GENMASK(7, 0)
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 5d13fc7cb9d2..d66da1a9f165 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -163,6 +163,42 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 offset;
> +	u32 reg;
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		u64 ccs_size = tile_size / 512;
> +		u64 offset_hi, offset_lo;
> +		u32 nodes, num_enabled;
> +
> +		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> +		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> +		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> +		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
> +
> +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> +		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> +
> +		offset = offset_hi << 32; /* HW view bits 39:32 */
> +		offset |= offset_lo << 6; /* HW view bits 31:6 */
> +		offset *= num_enabled; /* convert to SW view */
> +
> +		/* We don't expect any holes */
> +		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> +			      "Hole between CCS and GSM.\n");
> +	} else {
> +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> +		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> +	}
> +
> +	return offset;
> +}
> +
>  /**
>   * xe_mmio_tile_vram_size() - Collect vram size and offset information
>   * @tile: tile to get info for
> @@ -207,8 +243,7 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  
>  	/* minus device usage */
>  	if (xe->info.has_flat_ccs) {
> -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> -		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> +		offset = get_flat_ccs_offset(gt, *tile_size);
>  	} else {
>  		offset = xe_mmio_read64_2x32(gt, GSMBASE);
>  	}
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
