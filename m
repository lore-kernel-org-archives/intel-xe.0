Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2351CC77B76
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 23:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B906510E107;
	Fri, 21 Apr 2023 23:28:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865E810E107
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682119679; x=1713655679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q3yZfApfFNFdxdhCa1xPBAcfZt/Adfam1nDR8Nyp5LU=;
 b=kmQo52L50KNV9PM+WeVK0nGH9zdoi/fMF0sbD5MN+WOe+iJL08NmhNel
 j3iv7APdtRmu0dD23nPHmiZilWSh7/96KcjxzRdZMX3rcInqb8IITR8/x
 l4wr9cDhvzFyQ3Bhi/Sgdb6v2UsgMWhUd/bjWbaHuS7Ox/VXZ1G7cY3nC
 jT6pwBB49lU/xcEpSH5nC8E6N0N9wVefWTJUTwFgDzY/eJSsCepznMYD1
 Ts8Fn8bSffC2DD2o9wLbRnA6BNuFq9LvmAVzIMciY2xIj5eAvdv7Ma3xp
 5zp2mME+zS/tfvITbZp8q2m77QGVngV2g6oNa53ZGAq3tAVfrBnzv4xRx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326431492"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="326431492"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 16:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695100441"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="695100441"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 21 Apr 2023 16:27:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 16:27:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 21 Apr 2023 16:27:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 21 Apr 2023 16:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5PVrnihKdPM5wcro4XpyXuJoRnM8sFuxCJ3JGJISgPShMSUaVcmsB1pvPCRoWzbhMWUhD2DvgJb/FuxCFOz2nPt7+Nl8TIDO/tiU+Wp85MzecGoZ6tdhrW7JoGvgLtXwZ2vTJNLJ3Q7OveYbPIJqqEW3h2LJDCRzjYaEis+ISQTyLpbegByXHr3uLlC11QCHoAuW0qXwYxEH5/0lbKFldaOeu+WfMsjYqTmIjkWHaV/9Nc0JEY77hJuI2/veAc3RUqUcRshHIycoE6XDBo8VzA64yLRHmMJpCTOMLZrcP8olHLyCcqbyPShRsF+qO/M0jM1FxQx/ogWcIcbMEon0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg3BhTO0J5NkXVd+iRPbVDV7TVyrKAflBc9yhq4zJno=;
 b=MZzy8sjBEoU1PifKwIDc0r+zyyOcV1I9efn0yNn7WuO+rbfRgnjlwKytrh1Yl0lHiXSnHcWdbIcF0+cy12IsYH2a8j0LAzZfRM1KaQfisOn6f5X3DOnVu4C95vRh+bRCmERXo9/fdmQnl7NO5AN7R64FRZkJ7+Tci9/ih840LNkXZYxayvGnSgs9yjrME6Aj4mGBf2fwIuTp8GrLndobZGkpK30Ir4qwJmaTkw7ABMOPHwU4mqzc3zmbUdV8iDqEzBTWYGgdpae7WqtgvEsQJhx2vOS73xYjitXF00XnDGME1SLmc6pyk+GrBrAx4912OovcnmFGIur5Uhlt9EHDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6857.namprd11.prod.outlook.com (2603:10b6:510:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 23:27:55 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6298.030; Fri, 21 Apr 2023
 23:27:55 +0000
Date: Fri, 21 Apr 2023 16:27:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230421232751.GL2825255@mdroper-desk1.amr.corp.intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230421223258.128781-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:a03:80::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a34c31-a019-4a5d-f5ef-08db42c00861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0WCLTaPpnf/TkKWDasY+zJmA3SflecdUo4MS2Exq6hwdGerfO5hbE8q7mTfyu3Ryk+uK4Eso9aR9apeLQ95VHSpMutFJMkClwxSm+kDQTnfybxN1xtrkaPtQYmzrogE7EzN2SmOeSySZe2RETTEBAlfvhr4vW0P42I//YBwSafBIcZtndqnQxtJ7FOihdo1ARuV1H5+NDqZn0vcIathaD9rPXoSPfsmD0jDNP/yrNrNW+CPYgEuSFsW3VQ50yoDdWI6Bx37Exy2a7vNVQlsjmk0V7uBn5F5iMiDmkJViMEQhzxvGBKZneDdoazyyNBB+eemG5Fn2Dn2QZ6dPJeSYiH/mPWTor0kCe5ha9Y9fu0qc5VY44O5yBHzjU7TCM32Eyp4uyEH7pa4HtYiFLOUlBZCYkFtUHS3K+gTH4KN087pj8SrqGv8P88BSg1IlEyEK/JaEnwLmE69NJ0tHpnndHO4i+gsTTfP2MKEW/3Rt7opD+ZPjp/+wb8wbncXI7BNq5NYRPbWLQOW4W//iGsu6OlmVUqxDFuqmA/lTPIZYDa/j+rTYTPTGnB6Sva1CIkRAMQX4piTlxNY3WWkoHV0c4aR8gSr3V97ifQq08ADtJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199021)(6512007)(1076003)(6506007)(26005)(8936002)(8676002)(6862004)(6636002)(54906003)(5660300002)(33656002)(86362001)(41300700001)(82960400001)(316002)(186003)(4326008)(38100700002)(66476007)(66556008)(66946007)(6666004)(6486002)(478600001)(2906002)(30864003)(83380400001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEGxQ8r6ZPRFZ4m5Zn1qhgKRMs2eX8lekIXHoGDJqsZDMZ0oFwTAkZbOVm+1?=
 =?us-ascii?Q?rkAWMzE8XqyfThUI3CB+Zl0x6yElkMCMOo2IalVnTmX5TK+vV1XzQ8j8KiLd?=
 =?us-ascii?Q?OJZndM2Q9l6vF/E5avNXEtTUWvFa1vjdstUoQZpqwi/xeAxIr6UK1ljvzmF6?=
 =?us-ascii?Q?3SWjlElohx0XBABHG1QPfpIFi0RHhGci87zGOgtfz+UVfU/hfYBjNavLodi/?=
 =?us-ascii?Q?Ok/jWGv/dopOE9C1aBz/eW9OFEcdNm71It5QRJIPlL7KnRT65CUsBLp9S4n4?=
 =?us-ascii?Q?DJAaDRm/YzbytmOvenUgMvTcYD2fGXRCw/iMUz4D2l0CXvGD+ZIHbsGkbXtd?=
 =?us-ascii?Q?p3TZwYKpK//dmflWETYNkw3OvPuJHJ3KcRMwfcs2RHp62CTSgX8jeBziAqz5?=
 =?us-ascii?Q?3Dp7moW7nhwgPYxZevG6YP3UamTqT6+VvMxjTq6Fp3xK23GwnY0A6twrJ7/i?=
 =?us-ascii?Q?KiYEbTi6ryZKn01q5D939JvIt4GXqK+EObyBcA1203PNsPBRC3bi+av99Sep?=
 =?us-ascii?Q?yZDaDTpLg0yhosgphhFD0TN7Me2hfrLYi1zN8siEOJrXAFVoXzVukXQymLzH?=
 =?us-ascii?Q?3tIHEP1IefVeRn90Q3mTVTzs7fFhHSASeueHYCGS4nH/aT73uh5Mq/pRWciM?=
 =?us-ascii?Q?1cpseqtVbAWa3bh5HX7DtFgzHvW9fAKJVULBrmYp22Jyle+9jABjQe3A3WjG?=
 =?us-ascii?Q?vCe1hNMrc7my95aTgcxsVVJ9a94cAK+zwT1NPSBR/upXK5YKsXkjvWtHCPar?=
 =?us-ascii?Q?ucTFWO8Re8e/0AQ3u7q9GExwWUPkOCjQ0g2WRoleTIpSh3Ad6J3nMrc4eQM2?=
 =?us-ascii?Q?OoWg+yxeAdoY45rzBcqJwzpKaNw/B984QNh7htLjdYpnJtKAS27AC7qIFKuA?=
 =?us-ascii?Q?aS1rn25wDhZEL7JQ6ctVYDndGI59ekRUuEr6B8LD5gQM0bi+fc4+GDYC8VFH?=
 =?us-ascii?Q?1Z2l1uOt9REYvWti4Aj4Up2lRcRJgQgFi2psdkPvYIj6dl2iWIgM6xIdtmff?=
 =?us-ascii?Q?QZljxpSPTyPbnvfwRR5e2HM7cNpApcuTYSGDDRkOe3aj3rjMiqEoZh3TbUxA?=
 =?us-ascii?Q?m3Ks5LKKDnHfrshUgJUFIBajFp8dUbjYNf0zjesCSfkDtD8MKbhNXKnhO6qZ?=
 =?us-ascii?Q?OOCc6x08k1xAviS8UPHP55zmW+t5wbv7fRgNc0g48FkAVY2iMHo45dV85Q8/?=
 =?us-ascii?Q?c7ahxuDxCPq49XNadxQXscE6yj4lSgCCiiNYhp9oWbO+4dbVGsQRJIVqZhsA?=
 =?us-ascii?Q?eibdkRp6+8ml12PqsAHigSWyzRtE2roEQG4lLjlzkoPjS7S5PU9QP3q0r7MQ?=
 =?us-ascii?Q?u9QMXFGwWhct+5sCSqYquyJY+7365GTP07dnoAXH0yvNAGNd3iQvWZLNJeeq?=
 =?us-ascii?Q?ylSkTpjRZQlvwuagMThm3MHfomaaDRfoQFr0ryvZpTFc/mKHhR6ZtrMi3Guj?=
 =?us-ascii?Q?+udrX0MTfvgXLAgL5B6p0B4vQNTTKa+x+xdyboFt+Pbg1JX7s2blxk/eY5Fz?=
 =?us-ascii?Q?K/GrWAfQLLDbpW7kgdmB4wH1s2kwXL2dAjX2AF7r4qM1OeW0sfpEpwI/Sff1?=
 =?us-ascii?Q?AEnau5ydQVNcEtLIbQ4kWs407sMnGvTEOzRbxNzBmK+pur87ZYg0WmTFskqB?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a34c31-a019-4a5d-f5ef-08db42c00861
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 23:27:54.8377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOZXAYkAmgARY+eigVb1UrM/5Tuljk5GX97DNa7kKgXy1VgVZQeR1DRGdPXMQa6EVVqCtMlEnpj8ggXQh6iDhQRdmneAkIHc1/g5WXrufOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6857
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/17] drm/xe: Cleanup page-related defines
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 03:32:42PM -0700, Lucas De Marchi wrote:
> Rename the following defines to lose the GEN* prefixes since they don't
> make sense for xe:
> 
> GEN8_PTE_SHIFT		-> XE_PTE_SHIFT
> GEN8_PAGE_SIZE		-> XE_PAGE_SIZE
> GEN8_PTE_MASK		-> XE_PTE_MASK
> GEN8_PDE_SHIFT		-> XE_PDE_SHIFT
> GEN8_PDES		-> XE_PDES
> GEN8_PDE_MASK		-> XE_PDE_MASK
> GEN8_64K_PTE_SHIFT	-> XE_64K_PTE_SHIFT
> GEN8_64K_PAGE_SIZE	-> XE_64K_PAGE_SIZE
> GEN8_64K_PTE_MASK	-> XE_64K_PTE_MASK
> GEN8_64K_PDE_MASK	-> XE_64K_PDE_MASK
> GEN8_PDE_PS_2M		-> XE_PDE_PS_2M
> GEN8_PDPE_PS_1G		-> XE_PDPE_PS_1G
> GEN8_PDE_IPS_64K	-> XE_PDE_IPS_64K
> GEN12_GGTT_PTE_LM	-> XE_GGTT_PTE_LM
> GEN12_USM_PPGTT_PTE_AE	-> XE_USM_PPGTT_PTE_AE
> GEN12_PPGTT_PTE_LM	-> XE_PPGTT_PTE_LM
> GEN12_PDE_64K		-> XE_PDE_64K
> GEN12_PTE_PS64		-> XE_PTE_PS64
> GEN8_PAGE_PRESENT	-> XE_PAGE_PRESENT
> GEN8_PAGE_RW		-> XE_PAGE_RW
> PTE_READ_ONLY		-> XE_PTE_READ_ONLY
> 
> Keep an XE_ prefix to make sure we don't mix the defines for the CPU
> (e.g. PAGE_SIZE) with the ones fro the GPU).
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 23 ++++---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  4 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         | 15 ++--
>  drivers/gpu/drm/xe/xe_bo.h                    | 52 +++++++-------
>  drivers/gpu/drm/xe/xe_ggtt.c                  | 24 +++----
>  drivers/gpu/drm/xe/xe_migrate.c               | 69 ++++++++++---------
>  drivers/gpu/drm/xe/xe_pt.c                    | 40 +++++------
>  drivers/gpu/drm/xe/xe_vm.c                    | 20 +++---
>  8 files changed, 126 insertions(+), 121 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 65c0bc28a3d1..ed691d28b34d 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -27,7 +27,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>  
>  		for (row = 0; row < height; row++) {
>  			iosys_map_wr(map, *dpt_ofs, u64,
> -				     xe_ggtt_pte_encode(bo, src_idx * GEN8_PAGE_SIZE));
> +				     xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
>  			*dpt_ofs += 8;
>  			src_idx -= src_stride;
>  		}
> @@ -49,10 +49,11 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  	u32 dpt_size, size = bo->ttm.base.size;
>  
>  	if (view->type == I915_GTT_VIEW_NORMAL)
> -		dpt_size = ALIGN(size / GEN8_PAGE_SIZE * 8, GEN8_PAGE_SIZE);
> +		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>  	else
>  		/* display uses 4K tiles instead of bytes here, convert to entries.. */
> -		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8, GEN8_PAGE_SIZE);
> +		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
> +				 XE_PAGE_SIZE);
>  
>  	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
>  				  ttm_bo_type_kernel,
> @@ -74,9 +75,9 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>  	if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x;
>  
> -		for (x = 0; x < size / GEN8_PAGE_SIZE; x++)
> +		for (x = 0; x < size / XE_PAGE_SIZE; x++)
>  			iosys_map_wr(&dpt->vmap, x * 8, u64,
> -				     xe_ggtt_pte_encode(bo, x * GEN8_PAGE_SIZE));
> +				     xe_ggtt_pte_encode(bo, x * XE_PAGE_SIZE));
>  	} else {
>  		const struct intel_rotation_info *rot_info = &view->rotated;
>  		u32 i, dpt_ofs = 0;
> @@ -106,13 +107,13 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>  
>  		for (row = 0; row < height; row++) {
>  			xe_ggtt_set_pte(ggtt, *ggtt_ofs,
> -					xe_ggtt_pte_encode(bo, src_idx * GEN8_PAGE_SIZE));
> -			*ggtt_ofs += GEN8_PAGE_SIZE;
> +					xe_ggtt_pte_encode(bo, src_idx * XE_PAGE_SIZE));
> +			*ggtt_ofs += XE_PAGE_SIZE;
>  			src_idx -= src_stride;
>  		}
>  
>  		/* The DE ignores the PTEs for the padding tiles */
> -		*ggtt_ofs += (dst_stride - height) * GEN8_PAGE_SIZE;
> +		*ggtt_ofs += (dst_stride - height) * XE_PAGE_SIZE;
>  	}
>  }
>  
> @@ -133,7 +134,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  	if (ret)
>  		return ret;
>  
> -	align = GEN8_PAGE_SIZE;
> +	align = XE_PAGE_SIZE;
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> @@ -147,14 +148,14 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  		if (ret)
>  			goto out;
>  
> -		for (x = 0; x < size; x += GEN8_PAGE_SIZE)
> +		for (x = 0; x < size; x += XE_PAGE_SIZE)
>  			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
>  	} else {
>  		u32 i, ggtt_ofs;
>  		const struct intel_rotation_info *rot_info = &view->rotated;
>  
>  		/* display seems to use tiles instead of bytes here, so convert it back.. */
> -		u32 size = intel_rotation_info_size(rot_info) * GEN8_PAGE_SIZE;
> +		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
>  
>  		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
>  							 align, 0);
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index a2ef0823ed02..d0f91f37b6d8 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -67,10 +67,10 @@ initial_plane_bo(struct xe_device *xe,
>  		u64 __iomem *gte = gt0->mem.ggtt->gsm;
>  		u64 pte;
>  
> -		gte += base / GEN8_PAGE_SIZE;
> +		gte += base / XE_PAGE_SIZE;
>  
>  		pte = ioread64(gte);
> -		if (!(pte & GEN12_GGTT_PTE_LM)) {
> +		if (!(pte & XE_GGTT_PTE_LM)) {
>  			drm_err(&xe->drm,
>  				"Initial plane programming missing PTE_LM bit\n");
>  			return NULL;
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index cdcecf8d5eef..0f4371ad1fd9 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -265,7 +265,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  		goto vunmap;
>  	}
>  
> -	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, GEN8_PAGE_SIZE,
> +	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
>  				  XE_BO_CREATE_PINNED_BIT);
> @@ -294,20 +294,21 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	}
>  
>  	kunit_info(test, "Starting tests, top level PT addr: %lx, special pagetable base addr: %lx\n",
> -		   (unsigned long)xe_bo_main_addr(m->eng->vm->pt_root[id]->bo, GEN8_PAGE_SIZE),
> -		   (unsigned long)xe_bo_main_addr(m->pt_bo, GEN8_PAGE_SIZE));
> +		   (unsigned long)xe_bo_main_addr(m->eng->vm->pt_root[id]->bo, XE_PAGE_SIZE),
> +		   (unsigned long)xe_bo_main_addr(m->pt_bo, XE_PAGE_SIZE));
>  
>  	/* First part of the test, are we updating our pagetable bo with a new entry? */
> -	xe_map_wr(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64, 0xdeaddeadbeefbeef);
> +	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
> +		  0xdeaddeadbeefbeef);
>  	expected = gen8_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0, 0);
>  	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
> -		expected |= GEN12_PTE_PS64;
> +		expected |= XE_PTE_PS64;
>  	xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
>  	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
> -		 &src_it, GEN8_PAGE_SIZE, pt);
> +		 &src_it, XE_PAGE_SIZE, pt);
>  	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>  
> -	retval = xe_map_rd(xe, &bo->vmap, GEN8_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
> +	retval = xe_map_rd(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1),
>  			   u64);
>  	check(retval, expected, "PTE entry write", test);
>  
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index effa9d0cf0f6..8354d05ccdf3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,32 +39,32 @@
>  #define PPAT_CACHED                     BIT_ULL(7)
>  #define PPAT_DISPLAY_ELLC               BIT_ULL(4)
>  
> -#define GEN8_PTE_SHIFT			12
> -#define GEN8_PAGE_SIZE			(1 << GEN8_PTE_SHIFT)
> -#define GEN8_PTE_MASK			(GEN8_PAGE_SIZE - 1)
> -#define GEN8_PDE_SHIFT			(GEN8_PTE_SHIFT - 3)
> -#define GEN8_PDES			(1 << GEN8_PDE_SHIFT)
> -#define GEN8_PDE_MASK			(GEN8_PDES - 1)
> -
> -#define GEN8_64K_PTE_SHIFT		16
> -#define GEN8_64K_PAGE_SIZE		(1 << GEN8_64K_PTE_SHIFT)
> -#define GEN8_64K_PTE_MASK		(GEN8_64K_PAGE_SIZE - 1)
> -#define GEN8_64K_PDE_MASK		(GEN8_PDE_MASK >> 4)
> -
> -#define GEN8_PDE_PS_2M			BIT_ULL(7)
> -#define GEN8_PDPE_PS_1G			BIT_ULL(7)
> -#define GEN8_PDE_IPS_64K		BIT_ULL(11)
> -
> -#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
> -#define GEN12_USM_PPGTT_PTE_AE		BIT_ULL(10)
> -#define GEN12_PPGTT_PTE_LM		BIT_ULL(11)
> -#define GEN12_PDE_64K			BIT_ULL(6)
> -#define GEN12_PTE_PS64                  BIT_ULL(8)
> -
> -#define GEN8_PAGE_PRESENT		BIT_ULL(0)
> -#define GEN8_PAGE_RW			BIT_ULL(1)
> -
> -#define PTE_READ_ONLY			BIT(0)
> +#define XE_PTE_SHIFT			12
> +#define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
> +#define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
> +#define XE_PDE_SHIFT			(XE_PTE_SHIFT - 3)
> +#define XE_PDES				(1 << XE_PDE_SHIFT)
> +#define XE_PDE_MASK			(XE_PDES - 1)
> +
> +#define XE_64K_PTE_SHIFT		16
> +#define XE_64K_PAGE_SIZE		(1 << XE_64K_PTE_SHIFT)
> +#define XE_64K_PTE_MASK			(XE_64K_PAGE_SIZE - 1)
> +#define XE_64K_PDE_MASK			(XE_PDE_MASK >> 4)
> +
> +#define XE_PDE_PS_2M			BIT_ULL(7)
> +#define XE_PDPE_PS_1G			BIT_ULL(7)
> +#define XE_PDE_IPS_64K			BIT_ULL(11)
> +
> +#define XE_GGTT_PTE_LM			BIT_ULL(1)
> +#define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
> +#define XE_PPGTT_PTE_LM			BIT_ULL(11)
> +#define XE_PDE_64K			BIT_ULL(6)
> +#define XE_PTE_PS64			BIT_ULL(8)
> +
> +#define XE_PAGE_PRESENT			BIT_ULL(0)
> +#define XE_PAGE_RW			BIT_ULL(1)
> +
> +#define XE_PTE_READ_ONLY		BIT(0)
>  
>  #define XE_PL_SYSTEM		TTM_PL_SYSTEM
>  #define XE_PL_TT		TTM_PL_TT
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 0ae373b604f6..862e810ef407 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -30,11 +30,11 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>  	u64 pte;
>  	bool is_vram;
>  
> -	pte = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
> -	pte |= GEN8_PAGE_PRESENT;
> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
> +	pte |= XE_PAGE_PRESENT;
>  
>  	if (is_vram)
> -		pte |= GEN12_GGTT_PTE_LM;
> +		pte |= XE_GGTT_PTE_LM;
>  
>  	/* FIXME: vfunc + pass in caching rules */
>  	if (xe->info.platform == XE_METEORLAKE) {
> @@ -56,10 +56,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>  
>  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>  {
> -	XE_BUG_ON(addr & GEN8_PTE_MASK);
> +	XE_BUG_ON(addr & XE_PTE_MASK);
>  	XE_BUG_ON(addr >= ggtt->size);
>  
> -	writeq(pte, &ggtt->gsm[addr >> GEN8_PTE_SHIFT]);
> +	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>  }
>  
>  static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> @@ -76,7 +76,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  
>  	while (start < end) {
>  		xe_ggtt_set_pte(ggtt, start, scratch_pte);
> -		start += GEN8_PAGE_SIZE;
> +		start += XE_PAGE_SIZE;
>  	}
>  }
>  
> @@ -107,7 +107,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  	}
>  
>  	ggtt->gsm = gt->mmio.regs + SZ_8M;
> -	ggtt->size = (gsm_size / 8) * (u64)GEN8_PAGE_SIZE;
> +	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
>  
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>  		ggtt->flags |= XE_GGTT_FLAGS_64K;
> @@ -167,7 +167,7 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  	else
>  		flags |= XE_BO_CREATE_VRAM_IF_DGFX(gt);
>  
> -	ggtt->scratch = xe_bo_create_pin_map(xe, gt, NULL, GEN8_PAGE_SIZE,
> +	ggtt->scratch = xe_bo_create_pin_map(xe, gt, NULL, XE_PAGE_SIZE,
>  					     ttm_bo_type_kernel,
>  					     flags);
>  
> @@ -229,8 +229,8 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
>  	scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
>  
>  	printk("%sGlobal GTT:", prefix);
> -	for (addr = 0; addr < ggtt->size; addr += GEN8_PAGE_SIZE) {
> -		unsigned int i = addr / GEN8_PAGE_SIZE;
> +	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
> +		unsigned int i = addr / XE_PAGE_SIZE;
>  
>  		XE_BUG_ON(addr > U32_MAX);
>  		if (ggtt->gsm[i] == scratch_pte)
> @@ -266,7 +266,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	u64 start = bo->ggtt_node.start;
>  	u64 offset, pte;
>  
> -	for (offset = 0; offset < bo->size; offset += GEN8_PAGE_SIZE) {
> +	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>  		pte = xe_ggtt_pte_encode(bo, offset);
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
> @@ -278,7 +278,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  				  u64 start, u64 end)
>  {
>  	int err;
> -	u64 alignment = GEN8_PAGE_SIZE;
> +	u64 alignment = XE_PAGE_SIZE;
>  
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8686a2a7b035..5acb227f2b5a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -147,7 +147,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>  		return PTR_ERR(m->cleared_bo);
>  
>  	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> -	vram_addr = xe_bo_addr(m->cleared_bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
>  	XE_BUG_ON(!is_vram);
>  	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>  
> @@ -166,9 +166,9 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  	int ret;
>  
>  	/* Can't bump NUM_PT_SLOTS too high */
> -	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/GEN8_PAGE_SIZE);
> +	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
>  	/* Must be a multiple of 64K to support all platforms */
> -	BUILD_BUG_ON(NUM_PT_SLOTS * GEN8_PAGE_SIZE % SZ_64K);
> +	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
>  	/* And one slot reserved for the 4KiB page table updates */
>  	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
>  
> @@ -176,7 +176,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  	XE_BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
>  
>  	bo = xe_bo_create_pin_map(vm->xe, m->gt, vm,
> -				  num_entries * GEN8_PAGE_SIZE,
> +				  num_entries * XE_PAGE_SIZE,
>  				  ttm_bo_type_kernel,
>  				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
>  				  XE_BO_CREATE_PINNED_BIT);
> @@ -189,14 +189,14 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		return ret;
>  	}
>  
> -	entry = gen8_pde_encode(bo, bo->size - GEN8_PAGE_SIZE, XE_CACHE_WB);
> +	entry = gen8_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>  	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>  
> -	map_ofs = (num_entries - num_level) * GEN8_PAGE_SIZE;
> +	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>  
>  	/* Map the entire BO in our level 0 pt */
>  	for (i = 0, level = 0; i < num_entries; level++) {
> -		entry = gen8_pte_encode(NULL, bo, i * GEN8_PAGE_SIZE,
> +		entry = gen8_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
>  					XE_CACHE_WB, 0, 0);
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
> @@ -211,10 +211,10 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		XE_BUG_ON(xe->info.supports_usm);
>  
>  		/* Write out batch too */
> -		m->batch_base_ofs = NUM_PT_SLOTS * GEN8_PAGE_SIZE;
> +		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
>  		for (i = 0; i < batch->size;
> -		     i += vm->flags & XE_VM_FLAGS_64K ? GEN8_64K_PAGE_SIZE :
> -			     GEN8_PAGE_SIZE) {
> +		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
> +		     XE_PAGE_SIZE) {
>  			entry = gen8_pte_encode(NULL, batch, i,
>  						XE_CACHE_WB, 0, 0);
>  
> @@ -224,13 +224,13 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		}
>  	} else {
>  		bool is_vram;
> -		u64 batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE, &is_vram);
> +		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE, &is_vram);
>  
>  		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  
>  		if (xe->info.supports_usm) {
>  			batch = gt->usm.bb_pool->bo;
> -			batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE,
> +			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
>  						&is_vram);
>  			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>  		}
> @@ -240,20 +240,20 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		u32 flags = 0;
>  
>  		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
> -			flags = GEN12_PDE_64K;
> +			flags = XE_PDE_64K;
>  
>  		entry = gen8_pde_encode(bo, map_ofs + (level - 1) *
> -					GEN8_PAGE_SIZE, XE_CACHE_WB);
> -		xe_map_wr(xe, &bo->vmap, map_ofs + GEN8_PAGE_SIZE * level, u64,
> +					XE_PAGE_SIZE, XE_CACHE_WB);
> +		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>  			  entry | flags);
>  	}
>  
>  	/* Write PDE's that point to our BO. */
>  	for (i = 0; i < num_entries - num_level; i++) {
> -		entry = gen8_pde_encode(bo, i * GEN8_PAGE_SIZE,
> +		entry = gen8_pde_encode(bo, i * XE_PAGE_SIZE,
>  					XE_CACHE_WB);
>  
> -		xe_map_wr(xe, &bo->vmap, map_ofs + GEN8_PAGE_SIZE +
> +		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>  			  (i + 1) * 8, u64, entry);
>  	}
>  
> @@ -262,9 +262,9 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  		u64 pos, ofs, flags;
>  
>  		level = 2;
> -		ofs = map_ofs + GEN8_PAGE_SIZE * level + 256 * 8;
> -		flags = GEN8_PAGE_RW | GEN8_PAGE_PRESENT | PPAT_CACHED |
> -			GEN12_PPGTT_PTE_LM | GEN8_PDPE_PS_1G;
> +		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
> +		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
> +			XE_PPGTT_PTE_LM | XE_PDPE_PS_1G;
>  
>  		/*
>  		 * Use 1GB pages, it shouldn't matter the physical amount of
> @@ -294,10 +294,10 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
>  	 * the different addresses in VM.
>  	 */
>  #define NUM_VMUSA_UNIT_PER_PAGE	32
> -#define VM_SA_UPDATE_UNIT_SIZE	(GEN8_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
> +#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
>  #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
>  	drm_suballoc_manager_init(&m->vm_update_sa,
> -				  (map_ofs / GEN8_PAGE_SIZE - NUM_KERNEL_PDE) *
> +				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>  				  NUM_VMUSA_UNIT_PER_PAGE, 0);
>  
>  	m->pt_bo = bo;
> @@ -403,7 +403,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	if (!is_vram) {
>  		/* Clip L0 to available size */
>  		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
> -		u64 num_4k_pages = DIV_ROUND_UP(size, GEN8_PAGE_SIZE);
> +		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>  
>  		*L0 = size;
>  		*L0_ofs = xe_migrate_vm_addr(pt_ofs, 0);
> @@ -433,7 +433,7 @@ static void emit_pte(struct xe_migrate *m,
>  		     u32 size, struct xe_bo *bo)
>  {
>  	u32 ptes;
> -	u64 ofs = at_pt * GEN8_PAGE_SIZE;
> +	u64 ofs = at_pt * XE_PAGE_SIZE;
>  	u64 cur_ofs;
>  
>  	/*
> @@ -443,7 +443,7 @@ static void emit_pte(struct xe_migrate *m,
>  	 * on running tests.
>  	 */
>  
> -	ptes = DIV_ROUND_UP(size, GEN8_PAGE_SIZE);
> +	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>  
>  	while (ptes) {
>  		u32 chunk = min(0x1ffU, ptes);
> @@ -466,13 +466,13 @@ static void emit_pte(struct xe_migrate *m,
>  				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
>  					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
> -					addr |= GEN12_PTE_PS64;
> +					addr |= XE_PTE_PS64;
>  				}
>  
>  				addr += vram_region_io_offset(bo->ttm.resource);
> -				addr |= GEN12_PPGTT_PTE_LM;
> +				addr |= XE_PPGTT_PTE_LM;
>  			}
> -			addr |= PPAT_CACHED | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
>  			bb->cs[bb->len++] = lower_32_bits(addr);
>  			bb->cs[bb->len++] = upper_32_bits(addr);
>  
> @@ -697,7 +697,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, GEN8_PAGE_SIZE);
> +		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
> +			  XE_PAGE_SIZE);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_vram,
>  						  dst_L0_ofs, dst_is_vram,
>  						  src_L0, ccs_ofs, copy_ccs);
> @@ -915,7 +916,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		emit_clear(gt, bb, clear_L0_ofs, clear_L0, GEN8_PAGE_SIZE,
> +		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
>  			   clear_vram);
>  		if (xe_device_has_flat_ccs(xe) && clear_vram) {
>  			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
> @@ -985,7 +986,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
>  		bool is_vram;
>  
>  		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
> -							   GEN8_PAGE_SIZE,
> +							   XE_PAGE_SIZE,
>  							   &is_vram));
>  		XE_BUG_ON(!is_vram);
>  	}
> @@ -1202,7 +1203,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		/* Map our PT's to gtt */
>  		bb->cs[bb->len++] = MI_STORE_DATA_IMM | BIT(21) |
>  			(num_updates * 2 + 1);
> -		bb->cs[bb->len++] = ppgtt_ofs * GEN8_PAGE_SIZE + page_ofs;
> +		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
>  		bb->cs[bb->len++] = 0; /* upper_32_bits */
>  
>  		for (i = 0; i < num_updates; i++) {
> @@ -1220,9 +1221,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>  		update_idx = bb->len;
>  
>  		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> -			(page_ofs / sizeof(u64)) * GEN8_PAGE_SIZE;
> +			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
>  		for (i = 0; i < num_updates; i++)
> -			write_pgtable(m->gt, bb, addr + i * GEN8_PAGE_SIZE,
> +			write_pgtable(m->gt, bb, addr + i * XE_PAGE_SIZE,
>  				      &updates[i], pt_update);
>  	} else {
>  		/* phys pages, no preamble required */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6b2943efcdbc..4ee5ea2cabc9 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -64,8 +64,8 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
>  	u64 pde;
>  	bool is_vram;
>  
> -	pde = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_vram);
> -	pde |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
> +	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
>  	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
>  
> @@ -101,10 +101,10 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>  static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
>  			     u32 pt_level)
>  {
> -	pte |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>  
> -	if (unlikely(flags & PTE_READ_ONLY))
> -		pte &= ~GEN8_PAGE_RW;
> +	if (unlikely(flags & XE_PTE_READ_ONLY))
> +		pte &= ~XE_PAGE_RW;
>  
>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>  
> @@ -121,9 +121,9 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
>  	}
>  
>  	if (pt_level == 1)
> -		pte |= GEN8_PDE_PS_2M;
> +		pte |= XE_PDE_PS_2M;
>  	else if (pt_level == 2)
> -		pte |= GEN8_PDPE_PS_1G;
> +		pte |= XE_PDPE_PS_1G;
>  
>  	/* XXX: Does hw support 1 GiB pages? */
>  	XE_BUG_ON(pt_level > 2);
> @@ -153,14 +153,14 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>  	bool is_vram;
>  
>  	if (vma)
> -		pte = vma_addr(vma, offset, GEN8_PAGE_SIZE, &is_vram);
> +		pte = vma_addr(vma, offset, XE_PAGE_SIZE, &is_vram);
>  	else
> -		pte = xe_bo_addr(bo, offset, GEN8_PAGE_SIZE, &is_vram);
> +		pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
>  
>  	if (is_vram) {
> -		pte |= GEN12_PPGTT_PTE_LM;
> +		pte |= XE_PPGTT_PTE_LM;
>  		if (vma && vma->use_atomic_access_pte_bit)
> -			pte |= GEN12_USM_PPGTT_PTE_AE;
> +			pte |= XE_USM_PPGTT_PTE_AE;
>  	}
>  
>  	return __gen8_pte_encode(pte, cache, flags, pt_level);
> @@ -211,7 +211,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
>  	int err;
>  
>  	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
> -		GEN8_PDES * sizeof(struct drm_pt *);
> +		XE_PDES * sizeof(struct drm_pt *);
>  	pt = kzalloc(size, GFP_KERNEL);
>  	if (!pt)
>  		return ERR_PTR(-ENOMEM);
> @@ -265,7 +265,7 @@ void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
>  		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
>  	} else {
>  		empty = __xe_pt_empty_pte(gt, vm, pt->level);
> -		for (i = 0; i < GEN8_PDES; i++)
> +		for (i = 0; i < XE_PDES; i++)
>  			xe_pt_write(vm->xe, map, i, empty);
>  	}
>  }
> @@ -280,7 +280,7 @@ void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
>   */
>  unsigned int xe_pt_shift(unsigned int level)
>  {
> -	return GEN8_PTE_SHIFT + GEN8_PDE_SHIFT * level;
> +	return XE_PTE_SHIFT + XE_PDE_SHIFT * level;
>  }
>  
>  /**
> @@ -307,7 +307,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
>  	if (pt->level > 0 && pt->num_live) {
>  		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
>  
> -		for (i = 0; i < GEN8_PDES; i++) {
> +		for (i = 0; i < XE_PDES; i++) {
>  			if (xe_pt_entry(pt_dir, i))
>  				xe_pt_destroy(xe_pt_entry(pt_dir, i), flags,
>  					      deferred);
> @@ -489,7 +489,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
>  	entry->qwords = 0;
>  
>  	if (alloc_entries) {
> -		entry->pt_entries = kmalloc_array(GEN8_PDES,
> +		entry->pt_entries = kmalloc_array(XE_PDES,
>  						  sizeof(*entry->pt_entries),
>  						  GFP_KERNEL);
>  		if (!entry->pt_entries)
> @@ -649,7 +649,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  		 */
>  		if (level == 0 && !xe_parent->is_compact) {
>  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> -				pte |= GEN12_PTE_PS64;
> +				pte |= XE_PTE_PS64;
>  			else if (XE_WARN_ON(xe_walk->needs_64K))
>  				return -EINVAL;
>  		}
> @@ -699,7 +699,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
>  		if (GRAPHICS_VERx100(xe_walk->gt->xe) >= 1250 && level == 1 &&
>  		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
>  			walk->shifts = xe_compact_pt_shifts;
> -			flags |= GEN12_PDE_64K;
> +			flags |= XE_PDE_64K;
>  			xe_child->is_compact = true;
>  		}
>  
> @@ -761,9 +761,9 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>  	if (is_vram) {
>  		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
>  
> -		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
> +		xe_walk.default_pte = XE_PPGTT_PTE_LM;
>  		if (vma && vma->use_atomic_access_pte_bit)
> -			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
> +			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>  		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
>  			gt_to_xe(gt)->mem.vram.io_start;
>  		xe_walk.cache = XE_CACHE_WB;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..272f0f7f24fe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -59,7 +59,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>  	bool in_kthread = !current->mm;
>  	unsigned long notifier_seq;
>  	int pinned, ret, i;
> -	bool read_only = vma->pte_flags & PTE_READ_ONLY;
> +	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
>  
>  	lockdep_assert_held(&vm->lock);
>  	XE_BUG_ON(!xe_vma_is_userptr(vma));
> @@ -844,7 +844,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	vma->start = start;
>  	vma->end = end;
>  	if (read_only)
> -		vma->pte_flags = PTE_READ_ONLY;
> +		vma->pte_flags = XE_PTE_READ_ONLY;
>  
>  	if (gt_mask) {
>  		vma->gt_mask = gt_mask;
> @@ -897,7 +897,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = vma->vm;
>  	struct xe_device *xe = vm->xe;
> -	bool read_only = vma->pte_flags & PTE_READ_ONLY;
> +	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
>  
>  	if (xe_vma_is_userptr(vma)) {
>  		if (vma->userptr.sg) {
> @@ -1902,7 +1902,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>  	/* Warning: Security issue - never enable by default */
> -	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, GEN8_PAGE_SIZE);
> +	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
>  #endif
>  
>  	return 0;
> @@ -2593,7 +2593,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					  first->userptr.ptr,
>  					  first->start,
>  					  lookup->start - 1,
> -					  (first->pte_flags & PTE_READ_ONLY),
> +					  (first->pte_flags & XE_PTE_READ_ONLY),
>  					  first->gt_mask);
>  		if (first->bo)
>  			xe_bo_unlock(first->bo, &ww);
> @@ -2624,7 +2624,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
>  					 last->userptr.ptr + chunk,
>  					 last->start + chunk,
>  					 last->end,
> -					 (last->pte_flags & PTE_READ_ONLY),
> +					 (last->pte_flags & XE_PTE_READ_ONLY),
>  					 last->gt_mask);
>  		if (last->bo)
>  			xe_bo_unlock(last->bo, &ww);
> @@ -3381,7 +3381,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		return 0;
>  	}
>  	if (vm->pt_root[gt_id]) {
> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE,
> +				  &is_vram);
>  		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
>  	}
>  
> @@ -3392,10 +3393,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>  		if (is_userptr) {
>  			struct xe_res_cursor cur;
>  
> -			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
> +			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE, &cur);
>  			addr = xe_res_dma(&cur);
>  		} else {
> -			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +			addr = xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
>  		}
>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>  			   vma->start, vma->end, vma->end - vma->start + 1ull,
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
