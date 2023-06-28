Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC9EB64DD
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 17:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B223310E371;
	Wed, 28 Jun 2023 17:54:21 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8967A10E0BA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687974859; x=1719510859;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mXRVxrVWTa44ibTD3FU9ipvp0LFouiPCZRZj9k9ay7s=;
 b=dovRHI2dsFzkGIT6/fft8FdTXUOQfaq34L5rqlbQ38HOqAHdLJd4vP1N
 kNDywWfNCvQxmVcA9uY8SFHj2hAu6CyF9fvBuoxgVJt0X8ajpW1rQrsiL
 EJxMAOpYqnqnnWL0TPNr/r5VfKOFKVcDRe6OYjQrgafJnlwVABO8fM/T0
 54o8uK3nTYa5/s9AxhJF7ErVRlxGJfVxuMdsCQsF3YLf7CtSopahgzahg
 Sp3EnL+5SBviXlOMp6snHZIkjaVrNyawF7cdmZWT7ChHk4sFdmhuQx3uj
 Joll/c1xcaHUIxunaavy6Uoiy9Hw+xDnJZ5/0PGHa6xnSYhm4ZCCo16Iw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351708197"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351708197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 10:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="787111899"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="787111899"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 10:54:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 10:54:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 10:54:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 10:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBvqPMviPSieVdqAVWIHRLJbc2NU0DG9zrDN2E4SbL0qgkLMkSO5VQMkTcjkZR/ixbWnLdls3/aFc0/vutuz6jgzhCz6x2w1iXM/w3GaJ84PA3L31S8SCi45yDyDC6W/DalqtbJbHpFoiBk1/CsVOs1XGWiCHsyF0P87+MbmeBBvEcA3zpCcTgMVuyrOGf9Sym5r+1I4C4hHnFyN0NpWplLy+Y0210zk3JxFt/YGeiWyuEWuI0EPvmTviaWKJWyVU7dTBLBnyeSFsUlCn19rw9lVi6K91z8DmuT9h7KxVqJfvaTpYynSzZLQuYAdu/bJ7SFznBJeaBdY9inen1tRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMKwWbZP7QjvWp9iNR+RJERa5DJ+l+CHWjNm6yStjZs=;
 b=ZXSjGM9WhFWOkSpwgSX7gGrx3bDmimo6wepGck8NKJnlQxcq2PwCk83mmv37DSwFYWBulVBg9tSlM1jUsAc3MX4F89y56xuM21la/Xkdxr9bzKtuSf/LzZmo3lyomJfWQ47OeT5fyzaYnqGb1z+Ivq9Q/lviqlGX3RiK0OlaUCMN/NVuNaNnBlUOFI5HmZ4HXls/sHDFL4LdYd6j1mwXUbjTHXOINz8+wf1nqaSg/TUwu9r2w1Rum8nVboz5xs4Y3v2hvxQSfc9nmxOKjoIfIBEmy8j5f7NzPAva8RIASX3NAEqYHnAbl874YxLB9kFjmogaQtwqCyNFGZDPART+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 17:54:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 17:54:14 +0000
Date: Wed, 28 Jun 2023 17:53:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZJxzn9Nd8vuOI3Go@DUT025-TGLU.fm.intel.com>
References: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
 <20230628071527.3579428-5-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230628071527.3579428-5-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: be02bb63-c770-4f71-1176-08db7800af54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1iH0qNr0kZpys2u3cv2QSYiVmJF2uv3xC/7pkj0GJw4yBvv0eUBNBnnNWFeMu9qomxLau9z8V2lBoCZUOtAVJfnRF+z6lM4Iq9Rjo6EC8eUoFL5/IKqalqRB5uiPA0xOebKV+loMnJ+MNUaHhlMlbcp3PH/djxoGf1t3Ez1cgwyP+EPILW4FhdZYPDXs+8S4n4UScoKYHuT/9ZMc+7M9aTlubOPwbdYb0jIlMlvxXRGN7U9W15r1WMvk6HZRWzCBH1Lmsb7I38niN75cOzvFG6h2a/Nerhj5sYc/gDyPbBiZvvITPSDzLKeLqF47d1gnKx8s562cPjNgx1AMMwCbTrYyqUN0uIurUJ+/BUqdse98A0yfT79WPWzszO1uFCKh8rIB8EitX85f2/XYwAZ8EY0L2sRsuodQei/jnZ0AXXGlJU2bWEPoltY/rwVSKWtTxl1B+WsTeGWnlmw06nwnWClaJkIlGM65htmdsqBBuZypWDxTdLUGdIDRgOZP9L3onPN05OQlsclLDk04xX8vSJEyatCFxbwoRBK2/XvjusKJ1lbp6RFZSGdvo3TJSTC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(186003)(26005)(6506007)(6512007)(83380400001)(6486002)(5660300002)(8936002)(8676002)(6862004)(82960400001)(6666004)(38100700002)(44832011)(86362001)(478600001)(2906002)(316002)(41300700001)(66556008)(66476007)(66946007)(4326008)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJPs2zcQui+sMCz7j6C4OseTTfu/h5ju57q0K+BTIJQESpHWYfbHH09W7OnX?=
 =?us-ascii?Q?NZBjCGfRlxGNSr9yt5vYHMrMtkSpMvU85C8SX+WOwP8OC4eU8dfZzCOy5qrt?=
 =?us-ascii?Q?PJB+PHlK7oRnXof01IbGqBDFAudC6J0FjdAizIFr34CK0vItZl2UIwqTIn79?=
 =?us-ascii?Q?OLX676AVzj8/DgmgjvPbRxcJOAcvA2daS8msBmkkip/FKYFFKfqbifRI23c8?=
 =?us-ascii?Q?g9uvq5SHy3mokfp/L/llbgb7YLwN+91I1eIrg6z6a/NZbnS+XBdXIl+dTv5P?=
 =?us-ascii?Q?Xk/k7YAlln7PCdePkiRmANDby+pFtnLNUedCC4I90VmGdKrc3Wvk5nrSEaIV?=
 =?us-ascii?Q?1d71kF3dwOYLm7+R/sRbVCnEyOmR3gxcxAzIm6huYjS+CXf4SIX2TpWzOOvF?=
 =?us-ascii?Q?viBL8HWmOnnQMA4ENO3uYX1CB6q5z8AR2EO1vKBks75jaSDPKRMxiWDqgylL?=
 =?us-ascii?Q?mIom2PgnZEGcTW12hdf95/+2Pp/ljdC8ygt+uz4IfHDvMUm1h84L/jBnCbHL?=
 =?us-ascii?Q?GfpiXVosNKeJZHtzy2HN6NKDhDjBLc8/9lutW3R+zvIz7j1jx1AwJzv7g0Bm?=
 =?us-ascii?Q?v834IUNJLsgqra3GGRKbwTPSevHbcoyNWzjlwSVcGR9jH9tbz3ClQhIEdrHc?=
 =?us-ascii?Q?wMFuCtMCkA07bnPIZNS3BwAV1N/qaFTQfscoxjgMHk1ZAZ1JLxANO6f0QklQ?=
 =?us-ascii?Q?tXreIHrj840kCv5cFMSKYXf+c6f1QDHyVOArW7z/Dte8D/+XQnY2NnuKqJCd?=
 =?us-ascii?Q?cqysBlvKNfwBchcbqSX6rLz5re32l/CxXgzAtDpFoiwpniEPjoJtSFZuS9Tg?=
 =?us-ascii?Q?3h3BdiKKFlavP/8q/+yzMflQ/cCBjLNkgERstWq7ZJsOidCyE5miBPf+BFnH?=
 =?us-ascii?Q?JVNOiMmXUSW09qB0p9PxtMfV5mvWXNDEojyOY5fjjsYToP5lWV7PuHfO7TbJ?=
 =?us-ascii?Q?IHgJufqF57zqWbOefi89oocNS2SJgKheGLAP0w+F4KkxAbOOwSV7QCjeAj8k?=
 =?us-ascii?Q?fnN1Pk5DbDod51wUpk2zALEPP0TIkx2f7UqXr2cyp822PJuyGb54Zg4nDtml?=
 =?us-ascii?Q?ixqzxosp+PNF8VGGSkCq7AfLK9ErwI11Lxi/KyFxCRfK2H6CZflRl5w0mJeU?=
 =?us-ascii?Q?HUkt1MDb7TTboTpne9tAws9swenzM/vcXg4l86SWKZKGl3qeQZcIz2GkNQq9?=
 =?us-ascii?Q?laA2jg9Zh5JeD8vtUjXq09e5qzorlTQRs9w4mWm+/Jup88o3HCaUDQwiFX6+?=
 =?us-ascii?Q?QuP1c7esEuHRqflOCCgwWw+7EWAVNb2NLsdUFAD1ip0Gn1ul0YJI4/lkrHff?=
 =?us-ascii?Q?4sLJn0VNSeLNZYBJOKaLKhweQfBD0MhE9C6uiFSjO2Qx8VLhbK7rbZdmDwVM?=
 =?us-ascii?Q?XOcL2xuRNwsZSpjX0A94GPQGJ8XCupdCKXLTbSQL72f3xpbZWioYNxxNhG5i?=
 =?us-ascii?Q?WmlEaqfpwTA6CbZyr3MuD7sd+K66kgDgZJ/fuWzINn0+MVPkFvZt8ug+XTER?=
 =?us-ascii?Q?LwJMVU08dmwT6A1NgoXMhBB9B4zfGYrEDzwR+ahZ1F1Mo/AsgYYzheJbl6+P?=
 =?us-ascii?Q?QLk+fICjZSd2SUDGbuK+hQD7izJY8cMGB7LG2bgkA2TKMqt+a1uwQOmX/xzm?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be02bb63-c770-4f71-1176-08db7800af54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 17:54:14.1453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KphWLwcu0XTxCbf7ViDCLD9ueDD3sIjKwCGFsddRIC9hfA5xI8MAemgUnPCNK2NhkadvYSgOxwZGBvWWUoHhvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 4/4] drm/xe: Make usable size of VRAM
 readable
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

On Wed, Jun 28, 2023 at 12:45:27PM +0530, Tejas Upadhyay wrote:
> Current size member of vram struct does not give
> complete information as what "size" contains. Does
> it contain reserved portions or not. Name it usable
> size and accordingly describe other size members as
> well.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_device_types.h          | 13 ++++++++++---
>  drivers/gpu/drm/xe/xe_mmio.c                  |  6 +++---
>  drivers/gpu/drm/xe/xe_query.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  3 ++-
>  7 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 99c35a4ef673..fad4c66a8226 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -83,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
>  		 * We don't currently expect this to ever be placed in the
>  		 * stolen portion.
>  		 */
> -		if (phys_base >= tile0->mem.vram.size) {
> +		if (phys_base >= tile0->mem.vram.usable_size) {
>  			drm_err(&xe->drm,
>  				"Initial plane programming using invalid range, phys_base=%pa\n",
>  				&phys_base);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 21fca198a882..e240df6c7ae6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -125,7 +125,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>  {
>  	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
>  
> -	XE_BUG_ON(!tile->mem.vram.size);
> +	XE_BUG_ON(!tile->mem.vram.usable_size);
>  
>  	places[*c] = (struct ttm_place) {
>  		.mem_type = mem_type,
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index bd3e20ce3a4b..6afe37c8704e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -129,11 +129,18 @@ struct xe_tile {
>  			resource_size_t io_size;
>  			/** @base: offset of VRAM starting base */
>  			resource_size_t base;
> -			/** @size: size of VRAM. */
> -			resource_size_t size;
> +			/**
> +			 * @usable_size: usable size of VRAM
> +			 *
> +			 * Usable size of VRAM excluding reserved portions
> +			 * (e.g stolen mem)
> +			 */
> +			resource_size_t usable_size;
>  			/**
>  			 * @actual_physical_size: Actual VRAM size
> -			 * including stolen mem for tile
> +			 *
> +			 * Actual VRAM size including reserved portions
> +			 * (e.g stolen mem)
>  			 */
>  			resource_size_t actual_physical_size;
>  			/** @mapping: pointer to VRAM mappable space */
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7d92258cd35d..5effb21db9d4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -289,13 +289,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  		tile->mem.vram.base = tile_offset;
>  
>  		/* small bar can limit the visible size.  size accordingly */
> -		tile->mem.vram.size = min_t(u64, vram_size, io_size);
> +		tile->mem.vram.usable_size = min_t(u64, vram_size, io_size);
>  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
>  
>  		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
> -			 &tile->mem.vram.io_start, &tile->mem.vram.size);
> +			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
>  
> -		if (tile->mem.vram.io_size < tile->mem.vram.size)
> +		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
>  			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
>  				 tile->id, &tile->mem.vram.io_size);
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 15e171ca7e62..9acbb27dfcab 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -188,7 +188,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->num_params = num_params;
>  	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
>  		xe->info.devid | (xe->info.revid << 16);
> -	if (xe_device_get_root_tile(xe)->mem.vram.size)
> +	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>  		config->info[XE_QUERY_CONFIG_FLAGS] =
>  			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
>  	if (xe->info.enable_guc)
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index ac70486d09c3..e0bc2b60ab09 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -101,7 +101,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>  	struct xe_device *xe = tile_to_xe(tile);
>  	int err;
>  
> -	if (tile->mem.vram.size) {
> +	if (tile->mem.vram.usable_size) {
>  		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 1a84abd35fcf..a10fd0366da3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -360,7 +360,8 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
>  	mgr->tile = tile;
>  
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> -				      tile->mem.vram.size, tile->mem.vram.io_size,
> +				      tile->mem.vram.usable_size,
> +				      tile->mem.vram.io_size,
>  				      PAGE_SIZE);
>  }
>  
> -- 
> 2.25.1
> 
