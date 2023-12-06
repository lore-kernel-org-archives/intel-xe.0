Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E963C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B85910E0C2;
	Wed,  6 Dec 2023 22:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E160110E0C2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701901683; x=1733437683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xEIelMYZsyMcStqqqDrZHEx756q/JhElqoVOYLLtBcQ=;
 b=OI5VS7Rk/5ORvC0UMFuZ6X1Dr0pvIQE2nkjwnD9PWlV/DbF3cMWEzrNK
 RRvg3rjjTc7RWC/vzccNe70h51Am+Lo6WE1z5OVhHFjdmLUEdPZZXzHlh
 XGctWsVNDD6N4muS6drXNCPkt8KbYsXXOUx5v5hAMBMR3qzQhEKHng+Dt
 pWxxthCvXXA3F/JkI8WgQIfYdZc8C11Nh04WCCVEhOPpWLWMgIqhEXi0A
 MC3HE0NHvMXpnMLbdwi2GTlqktqpN59DsBMnoU4G+w3syblihw+tDffrO
 Pr7qb55rzt3YLJ5uiCwbjbRvqrnNXB81lEYAKBmFvX2zJnhN10kJ7N8HA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="15684147"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="15684147"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:28:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775166756"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775166756"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 14:28:02 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:28:01 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 14:28:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 14:28:01 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 14:28:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSWf29k7lhDt27WvHhbBDZ5cnUDa+uDrecScJuT6WJHXtMTEHZj/7/+ZPAhUgYurkVogbumqapZH1jnBN9kK4YXPdOhCIBCvQ+sA1XQ0yB9Ld2FtQTkOSJ3icG+8RJQFR2EciDyHDNzzqEeIQfGD1GVAgHVW6okESdrxrD3gB6FJItQh8A/9Sn0yB6AHuv5ji72YgZoM20q0hsNJROdWrCAfc6KPxOvCpeQjwSDhYf3zszmtVlFLOHnFR/h9Fy5x/YWwOAaT0VWWVNfvLU4U3WAZmOVndPSLb5ILF+QcirSZN6ViyY2h42GR6GTqGwCqKutsUtq94nbEU/n9UrRx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lDvNuM1ZgZUsy2cHTvGAQROQXlLpObu5+RL2Dyq4Vg=;
 b=fi/GQFE0Nw9SYpjPYrDJMgAaf99bbwZkZdMd5L9IA7A3OF8mfoSt4yFTEHuF2ZJGXHU/VBqJdfyy0ubg3tfpSXGz1ShLjqLiMMNLsDiNgoMKXMmXDAbqrCxP8J3eBGkCVC5hL4HiX/x5Pxwi6VnioKwndSCI9n3ZI5Cz760mga8BSX2SJfbjlMwXn1buzU7jJaGJqSNwyze44e7+GlXyOoUQF7GGxFLrgoTIhF3Y0SIlonHUnELL88qXxi4YSCdOFWBG1lVb4Ks3UiJTNuNyIVaZglAa9SURiW2lewY/FHA1Jmf1tAzt/LcmbwTm8XvscWGSxzAbfcA4INUtEiaVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 22:27:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 22:27:52 +0000
Date: Wed, 6 Dec 2023 14:27:50 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Message-ID: <20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231206043126.984049-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d82ab2-1373-4aed-9801-08dbf6aa9636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dYMzaACGDP8wCIVLTmPuAQEE0S7puVek0pmSxUD26WGx9brs9lUxMmSZUxGQ86TjdSF4s3Y3nSmXfW2cc2ueUVWU9jv+76N+8pc/H3OgSTf2QMkJRCf6TNpMjC5K8F1UmcebllnRQu4qIG4Om4W1kREGCyyoopdQZtKQUSTS53QVm0jeflPlduDo7nUGjPGMMWHeCk+rsFTF1xAtolV3aRUmGjcFMoj5CRA0c9/Z1zWWgHirUaIVZ5h8rU7N9hbxFrz730E2pxk8LXchQve1MIOmjLsixl0gQ+Mo4VRj00VoUcqd6XTJ/+M+iXoyYoqFoQrUnS9hUAxdKjK4MJ/UpXROicT8tVFcw0/OqZrvLizJGRrQErLUlxXQwzcWlTk8DGTyqGy5yEOMp0RgZmHlWhazL5E0m1VBxsbb0KfSo81esRGMj0kLaqn9e8smkfwH/Yej0XV9YtDPpiLwWmwN2E0nXlgusP4vKaKwwaCbVXmuX5E2ZB4mRH0eAy3wHjXZQ9sxc9Kjl8qbul8sZ6QTE0fRC3HADU9IZ+t3P06a690nbW5p5oENbhhd4fEFv28
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(136003)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(33656002)(2906002)(316002)(66556008)(6636002)(66476007)(6862004)(66946007)(4326008)(8676002)(86362001)(8936002)(41300700001)(5660300002)(38100700002)(82960400001)(6486002)(83380400001)(478600001)(66574015)(26005)(1076003)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?d2ppy6TDcoxWrRG7kF+8j+44VTP35IFycGuZ9u/e+iDXaYqbPN5rM1GUKu?=
 =?iso-8859-1?Q?9NrxFB+R3SX0sNJUoUx3ctO9PKBFpdrpnCXlqdIlzV/K2g6W/nwtt90b+e?=
 =?iso-8859-1?Q?DaFBQMOCdG1/lcIv/qkNbe0gVy4+QHRkgJg3JJdraTNIHlaYtBAFAPjU6h?=
 =?iso-8859-1?Q?a7MzI7IkyfYJaVeraYawWQ+C4XujRIsB2vP0S/XDoRGVQ8EfoGszKbhVKI?=
 =?iso-8859-1?Q?seBMnfBSfhowbvDhgJyAdzPqBon4JS0OhKNe1YD4vKE1+pnkaIXFLV8+aH?=
 =?iso-8859-1?Q?ZVFAjQalrGYyj5DV1wmJELlg+jAyF8ppc/aIPZiRFcejgXJITV6Zibva2x?=
 =?iso-8859-1?Q?vcPFaOpY4QSt5cRuGSts7TgaLBouf1cJJCuytFrla6QEPgMwmoc8kXIINK?=
 =?iso-8859-1?Q?loD0aL9MLPviQmZK8k+TA5fKBUmCjWFgQBGPIN+fsdxdGTnncAYFWIHFEo?=
 =?iso-8859-1?Q?oSPpa0FI+Q6NV8ov6fe8+aH+odlCJ4iwfuKahZlR1Kx+ntONqmBKuLgo52?=
 =?iso-8859-1?Q?wyXEkMfLlvz4LMqlumjcly9+DtzN+IFRjmlg7OJF400m0bH9FpbOoBQEDg?=
 =?iso-8859-1?Q?HyWth+rk7qILUPmNTpSsj/JsKNv2YenvIV3rwGOa+vNr1B/vkrgL5FJYRe?=
 =?iso-8859-1?Q?1j9FW3yHqroKT5y/bz6GNg3TRHM8O7WXBtPPHAkj4RlKOK/gFOA9lnsJMH?=
 =?iso-8859-1?Q?vbhN9FodbcmPAtjJVc0kZb2gFxM39LkTHm5z05eJ73tM3WGSTWTyW0nC0N?=
 =?iso-8859-1?Q?zzS3m7SQ+f0pDWg1HyYPDfT/n8l5cxXNtfFuYMftQMlO/6Kh83b5N9bfgc?=
 =?iso-8859-1?Q?uDj9c4IgJb4aYp6njMgP8UKTTCqnId22z8oNlOzCapAPvvfonOPyuWvqtB?=
 =?iso-8859-1?Q?ZkEJLYIxGZVY1NQ9QqoYrVuLmRAVRs07cgB6AonHZ8rmZQ+tG5GNbnC1iU?=
 =?iso-8859-1?Q?hAzKh74+wNWkTRFcwxE58G0defbCRi6FNxaSLHjDsRfRIGnARm6o5a2w3J?=
 =?iso-8859-1?Q?1I+idbFgNpZu95esParOYxrvy2o2WYrbPSSLmjIES1uhVEC8uZhZjWSB39?=
 =?iso-8859-1?Q?nbAvzWIXgG3d/sHNIqwsH7Z2ylhSbzp1Degd77LerG4858FNyqbslQbel9?=
 =?iso-8859-1?Q?9FTLhkFdja7/c2TO/q8LviA89o8yJmWpvbTeUqs1ez3631dLsg3ZVrUm34?=
 =?iso-8859-1?Q?K7VGe267DNJUiIqveNbtMVg6El7NUI90bxR3MJUfPYlF5VCw/QNIQPobXc?=
 =?iso-8859-1?Q?G33e7FpAb2cYZoqLDm6dtUcl9GLLo2HTtPL1XeJjLMsrou3pfi2DFQAD0D?=
 =?iso-8859-1?Q?aaBssLVC4v6E8siVLjZoS5H2Mh2t/QWRGBNZpn0gCeJNJqI/8a7laO+GKJ?=
 =?iso-8859-1?Q?53Swr+loiqfeOxl4pjyvLv56H7EdiglgSVjXsj8XjH87NlF4XG9uR4u8qh?=
 =?iso-8859-1?Q?nzcdqqOTK9p+bStvbhfVDjdw5ZkorJmSXrnitr+AGqdScekZ1xeAL4oo8J?=
 =?iso-8859-1?Q?cyYIH6aK44BkB9dCAga9WCiuK5UwV0eggye+d72oNxsRPu9oAOksuhsLGF?=
 =?iso-8859-1?Q?z6JydtM8VSqv05aCdwLT6YVNelbcPHLC4gUBKJKebtnDmW+E1BD/Xv/orE?=
 =?iso-8859-1?Q?hsIdKQ23X3q4XbD2h3086h9mXJymlTyb6nRZtgjlsbeOHZjTmRhKT1UQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d82ab2-1373-4aed-9801-08dbf6aa9636
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 22:27:52.9349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdvcgy9175AR958g53Els8T3iA7gGxZ932rqLCGZuEugOUPwfCB7yQLy7KhZKFrrolguFaPoU6M0/eq+j2b5+PzI/Xz7s2CZ3Nf0ViR1Wj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/9] drm/xe/xe2: Allocate extra pages for
 ccs during bo create
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

On Wed, Dec 06, 2023 at 10:01:19AM +0530, Himal Prasad Ghimiray wrote:
> Each byte of CCS data now represents 512 bytes of main memory data.
> Allocate extra pages to handle ccs region for igfx too.

This description seems confusing.  Explicitly allocating memory for CCS
data sounds more like the legacy AuxCCS rather than FlatCCS.  For
FlatCCS, the storage for the CCS data is already pre-allocated at a
well-defined location (I'm assuming it's in some kind of stolen memory
on an igpu?)

On discrete GPUs, if a surface was being migrated from LMEM to SMEM,
then you'd probably need extra storage for the SMEM copy.  But that
doesn't seem like it would be relevant to an igpu since there's no
lmem<->smem migration happening.

As a general comment, it might be worth starting this series with a
patch that describes and documents how FlatCCS actually works on an
igpu.  Since the main surfaces are in smem rather than a separate lmem
area, how does the CCS work?  Where does the CCS data live and how are
addresses of main surfaces (in smem) translated to CCS offsets?  Is
there CCS space set aside for the entire SMEM physical address space,
even though a lot of that memory is going to be used for non-graphics
purposes?

> 
> Bspec:58796
> 
> v2:
>  - For dgfx ensure system bit is not set.
>  - Modify comments.(Thomas)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                | 14 +++++++++-----
>  drivers/gpu/drm/xe/xe_device.c            |  2 +-
>  3 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> index f1c5bf203b3d..1f9c32e694c6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> @@ -16,7 +16,7 @@
>  #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>  #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>  #define   NUM_CCS_BYTES_PER_BLOCK	256
> -#define   NUM_BYTES_PER_CCS_BYTE	256
> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)

Changes like this that change platform-specific Xe1 vs Xe2 details
should probably be kept in a separate patch from the more general
"support FlatCCS on an igpu" work happening here.


Matt

>  #define   NUM_CCS_BLKS_PER_XFER		1024
>  
>  #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 72dc4a4eed4e..81630838d769 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2173,8 +2173,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>   * placed in system memory.
>   * @bo: The xe_bo
>   *
> - * If a bo has an allowable placement in XE_PL_TT memory, it can't use
> - * flat CCS compression, because the GPU then has no way to access the
> + * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
> + * use flat CCS compression, because the GPU then has no way to access the
>   * CCS metadata using relevant commands. For the opposite case, we need to
>   * allocate storage for the CCS metadata when the BO is not resident in
>   * VRAM memory.
> @@ -2183,9 +2183,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>   */
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>  {
> -	return bo->ttm.type == ttm_bo_type_device &&
> -		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
> -		(bo->flags & XE_BO_CREATE_VRAM_MASK);
> +	struct xe_device *xe = xe_bo_device(bo);
> +
> +	return (xe_device_has_flat_ccs(xe) &&
> +		bo->ttm.type == ttm_bo_type_device &&
> +		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
> +		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
> +		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 400fa1ac6168..50c87f03c51c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -605,7 +605,7 @@ void xe_device_wmb(struct xe_device *xe)
>  u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  {
>  	return xe_device_has_flat_ccs(xe) ?
> -		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
> +		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>  }
>  
>  bool xe_device_mem_access_ongoing(struct xe_device *xe)
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
