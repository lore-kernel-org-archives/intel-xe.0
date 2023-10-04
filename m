Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C9BE7C4EC
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 19:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DFA10E1A1;
	Wed,  4 Oct 2023 19:13:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08CA10E18C;
 Wed,  4 Oct 2023 19:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696446833; x=1727982833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7MmKLesKu/DLABtBLzuICmONCutGo1yzj//U9COCZlE=;
 b=VaX4MTsIn4homstGcrHmsgeSmm24NgFAkoefhy1ItFEjGwgDQaiBSpGh
 9NBkrV4gpDzJR7CfqAaeuUUqHzoqxwQ746tqEn7xUg2LUw0kaSIWWvUVP
 55OziYeYgeflhzC+QI+gs13Rw2DRImdsA37Q3xh9SsG5lo9ZwCM70kNnR
 n3iYuCGoL4KCjPRKts2HCMZTLZLoUgWNHJGAUETvrd097xygdrxWW8mUq
 YhafJ5DU9cSzhxvCdt4UMfFp2bO4uliA1XqXVXrH0qmT8VGDPDny67XlO
 T8BJi4wpzipt+vHaL4wRXu3eD5iqDVooaWfdUsj+1sL7FB8+Dh22RLYRi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383178919"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="383178919"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751449360"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="751449360"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 12:12:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 12:12:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 12:12:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 12:12:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 12:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGQfL9Yzw+DJ14H/zxSilEUkbVZHxMBNRYlOeMQJGWXNMw/ftenl+oCAjpXId2QxTJaFi0y94nfC2FDtzjzI0lffrCBbt1z+hZNJJiOzRGN4R7cdx2G3aJJhBY1PfOfsTUhxmJDy0mfcfPv1DTshQ+I7kzD7MzlfyWI3vGljaKgQwmZXg5rmphlFhiISA2qLr2iu09g92uUm7m4ye9aK4u5fsukZN6GgRi4R4PANJAIEexFs17fs0I0Cc/TCt+sT8HeF4SJlkZnM7o0dHfSLfeaVIwJpdx2lTiehUJ3FT6bx9GySG/XBjkvqSVnHlif+9UqJM6owMbkbnzwdk4xZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l4zq+N5+jQsWEHV2/A8biK3XmVKnH2kH1+IspFLh48=;
 b=GHkxFyWkYCisjnKl5ZFqJqik9A+Rqg1e2RcmPIm4ZZ+ehjt0Xh5GnIjAjpE/xw7pbB5Tw3jYkLKLTPG63rhjzswUA/8MSW6Bw1o+Ra8jJT2AFIYMjjSj+6J7pSXLRQzvh0ucJSSLoRNl0JP8vGPkp5kLwL1frwY0+Fk2n8WfiLPvtq7Zssbwe1G+uELD86FrNLX08feop5jWg+EzRWFi6f/HCbp8wHNr83M1ydwtYTyps32Inxs0PPlEF2Y/dfKlr/hPbiO6+oWvXzpb6btJ+6OC6U7cnRtX8lA2YwXbUAeQ9D3hRHRG6YpzEXP1BgpSStGCKdAuaE/aEmnNkKD3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7896.namprd11.prod.outlook.com (2603:10b6:610:131::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.30; Wed, 4 Oct 2023 19:12:34 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 19:12:34 +0000
Date: Wed, 4 Oct 2023 12:12:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231004191230.GQ2706891@mdroper-desk1.amr.corp.intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
 <20231004031023.3444455-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231004031023.3444455-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:303:6b::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: e05085d5-3030-4998-4b09-08dbc50ddd1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MB14ooVotjvVHhZ0CqfAJBlxDYLCpd02sG3JeUd2wjEJFaVpgdKNOiHtLJrDbYW2EyZh4YoYZPM4oPg8QXbF+PCxrGZVyateQPacllpt5oS6yCd0z8k+tRHliI8idcpBUoEfAKcrWaIVKjSCOI9bBP1i4Z2enGHwEqbkPRWUKGWPVtE6Rlyo0Kx+luJMet62x0KNL2DNsWbonO9bImH+U2WLsNHelSiobyMLUlA9TXE6DWkfIdAh2GkB17ih+1ADc9AZo54I4tDiyTIFFezvEciSSqwP/o+wG3hLJeKNlktd8S8G5SnCeJQY9n4FDG/lKG+EFQNEDEo0PRWewNcyg9KO2PCUzMpKdkqfALFUYHR/d0BA4M5Bo5cWlYde7eHuMbLXKzKMZ2EHOfmxFXiK0tms3clQtC85EVQRymEU2JnI2iW785hd7pVTPUkNlP2moqCaHpLoP01IjU54KQSk/ImDbJLhWDG2XyfbzdxRvcjuDxH4nABv2XQgjopyGV378sIRvIzrlCUPAPp3Ja/l/y0uUF3JV8aGrFCz5h+Gr3ftjKK5aSKevc1ktmdwqLz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(366004)(136003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(66556008)(66476007)(6636002)(26005)(66899024)(66946007)(1076003)(38100700002)(6512007)(6506007)(6666004)(83380400001)(86362001)(82960400001)(33656002)(6486002)(478600001)(316002)(2906002)(30864003)(450100002)(4326008)(8936002)(8676002)(6862004)(41300700001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JimXV08NHKrfAv5XKv47OJtMftTENGTgJey7x6NjHf9ZEz0LKAUtu7LFUtDu?=
 =?us-ascii?Q?ugR5Wgi0OA1eAzd2QhRUYQwcoZrVu1SWF5mbyBtnyyCBH4lgZsVue0hpoeiZ?=
 =?us-ascii?Q?AldNn09KvKQWCrqCun+3Wm3OQLM6iBGRq0QigL8ebQlF6g9Rw81g97T6c1La?=
 =?us-ascii?Q?W6nHML6BFWbMvSXD43lsyCbwWx3A3PKXR6IpsTx4+jot6V79rAqUDtQvqT/q?=
 =?us-ascii?Q?w5ZMOk2sHtDV1+ojQpZSF2Zeuri44GvFphsvVebTwyuYWbIA5USAaw1sRTON?=
 =?us-ascii?Q?rnZ7trXqr1LUvA4+Tvpp6yomVZGMKMRNOOQYZkxCEjiOjnKMpH9Ixiz636M/?=
 =?us-ascii?Q?FXTaT4AZGOW9Cq7m4KzRP0OltxBruwKwR/JnspX1S78HjfvRP7XhJ+9mGImp?=
 =?us-ascii?Q?cyCjvZ8yDH0yjpz+mhv9CsNy4UcqrnjuliIm0f8eWak2RLfK41IceNjNfZNG?=
 =?us-ascii?Q?lHPox6nnUYWzxxDYKYXopYbor/9JlgCHbaaWCWeusolHH0YoGk4aF224+oHU?=
 =?us-ascii?Q?9K33tPlrjX3a94dykmTH4iVRVO/NveNfEKbF9feeOPltfcIW40uuSJPWLf0g?=
 =?us-ascii?Q?39GudOPDwUQXLfsXoLynmRgtCXY6KOomFIT8rTNnEiMxon9kF8nGGuLuUcCy?=
 =?us-ascii?Q?U8yg7rpmvRGM68FDQ2dq3BY6ZhqVjSwhZutx2q/5JLTzcmJQRbVWRI5k4qtA?=
 =?us-ascii?Q?JMLu9SZG6Jo8Mu3fbEvNzdW4cZr1PFWXFIm0uX1mgVy5/pOsXOkI8dhSTyot?=
 =?us-ascii?Q?pTvxo6kYsZUQUYO+KDjBzWe1uyCmwpl52FYY/y6Tz+SOyt7R2LihqpSeNJx6?=
 =?us-ascii?Q?c6ii0ObeE3lvbRcbJGe9jSJsA9lQ8wEjMEmxl1kFuR1czeN/Op54Ix0ILiXD?=
 =?us-ascii?Q?dvfWy0Btklg2Vlv83+4qFTYnnZObWnMNIyEcT9U/BmFbkgLgJzqM+IxifUxW?=
 =?us-ascii?Q?5dCku7DcQ4dpi8iKk3xehZ+6B0U3CWmol6ZtwKH7q+iAxVQ5HeQHaIttgtqt?=
 =?us-ascii?Q?5ZU4vtKs3ZG6ocwcWhfXrr9ALb2RySu5TOhGghcAjInm/6xI+hV4XdDbJX2k?=
 =?us-ascii?Q?l60ctZxI45IJjnvLTarpdL1ukc6xY5ztL/XVmxDUarKQVf8oHZEse0tMceyB?=
 =?us-ascii?Q?xQJTyP+jgWsJBL7L3YcnG+llJNT9YDjN7m+ULXU48HByekeB9fJd3YPDGBJk?=
 =?us-ascii?Q?2VmN1mMo/8X0du86fSFKbeGOtd+sdG4wYKKuynsX+qR4gXI565mRc5N++C5c?=
 =?us-ascii?Q?AjSesNM1yCIhJig4IDd9FrO7zz4qpDGjyz9GZPxm9DJXXXPPesOVwziOGpSy?=
 =?us-ascii?Q?Kj59yAnINvR9/Oyt6pSD9fjOfuoYXdUjLXEtbgImhKQtHHPYo5IOFKJVOwBx?=
 =?us-ascii?Q?xMQKZSCO7Zo7rMu1ZBlS4pPlgyTB5Zb0pw9HIpi+rrKdEkgR3sKjBbIUIEW9?=
 =?us-ascii?Q?n2xlqv0OurK2SU4KHOxQRF+CgZvzLji7qIOmW0yvh06BpUW2bJaLBUKXslbo?=
 =?us-ascii?Q?al2brvkgwVJGtaQaGeY3gmVI9TNJOLyAg9pvyR6rmKoo8YmIF2aex8KiP4u2?=
 =?us-ascii?Q?+BIbJ2GYOdBgOsw5x9Q8pm7PnfugqXuVB7mT6LxM2jELyXxoh8jiiTv9SxZW?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e05085d5-3030-4998-4b09-08dbc50ddd1c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 19:12:34.0414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPSh3VhKg8AqPxLQUMfKiuYulYrUzuVYX2hecZq5x/8X/Iqmc7UdzTn0PRQurncsSaH5nZgZLRfNzwpe5AAM8pVDIOBjEPZ3SjRiZYv6RVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7896
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t v2 07/13] lib/intel_mocs: Stop encoding
 mocs
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 08:10:17PM -0700, Lucas De Marchi wrote:
> From gen9 until xe2, the various gpu commands use a mocs object that is
> defined as
> 
> 	[0]   pxp
> 	[6:1] mocs index
> 
> However this is not true for xe2 anymore. Also the way it is coded right
> now it's very easy to double shift the mocs value and end up with the
> wrong setting. Avoid this by separating where the index should be used
> (intel_mocs.[ch]) and the encoding on the various commands. To help with
> clarity the following renames were done:
> 
> 	intel_get_wb_mocs() -> intel_get_wb_mocs_index()
> 	intel_get_uc_mocs() -> intel_get_uc_mocs_index()
> 	gen9_surface_state.*.memory_object_control
> 		 -> gen9_surface_state.*.mocs_index
> 	mocs -> mocs_index in lib/intel_blt.*
> 
> v2:
>   - Use I915_MOCS_PTE instead of the hardcoded 1 in the gen11 media
>     function (Matt Roper)
>   - Fix a wrong shift by XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT, result of a
>     copy and paste mistake from lib/igt_draw.c to lib/igt_fb.c
>     (Matt Roper)
>   - In addition to the conversions in intel_blt, also add a _index
>     suffix to avoid confusion
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/gen9_media.h                |  3 +-
>  lib/gen9_render.h               |  3 +-
>  lib/gpu_cmds.c                  | 14 ++++-----
>  lib/igt_draw.c                  |  4 ++-
>  lib/igt_fb.c                    |  2 +-
>  lib/intel_blt.c                 | 52 ++++++++++++++++++---------------
>  lib/intel_blt.h                 | 10 +++----
>  lib/intel_mocs.c                | 14 ++++-----
>  lib/intel_mocs.h                |  4 +--
>  lib/intel_reg.h                 |  3 +-
>  lib/rendercopy_gen9.c           | 12 ++++----
>  lib/xehp_media.h                |  3 +-
>  tests/intel/gem_ccs.c           |  8 ++---
>  tests/intel/gem_lmem_swapping.c |  4 +--
>  tests/intel/xe_ccs.c            |  6 ++--
>  15 files changed, 75 insertions(+), 67 deletions(-)
> 
> diff --git a/lib/gen9_media.h b/lib/gen9_media.h
> index 414001dfd..a422cf7fe 100644
> --- a/lib/gen9_media.h
> +++ b/lib/gen9_media.h
> @@ -45,7 +45,8 @@ struct gen9_surface_state
>  		uint32_t qpitch:15;
>  		uint32_t pad1:4;
>  		uint32_t base_mip_level:5;
> -		uint32_t memory_object_control:7;
> +		uint32_t pxp:1;
> +		uint32_t mocs_index:6;
>  		uint32_t pad0:1;
>  	} ss1;
>  
> diff --git a/lib/gen9_render.h b/lib/gen9_render.h
> index af3a2b3af..8ed60a2a5 100644
> --- a/lib/gen9_render.h
> +++ b/lib/gen9_render.h
> @@ -42,7 +42,8 @@ struct gen9_surface_state {
>  		uint32_t qpitch:15;
>  		uint32_t pad1:4;
>  		uint32_t base_mip_level:5;
> -		uint32_t memory_object_control:7;
> +		uint32_t pxp:1;
> +		uint32_t mocs_index:6;
>  		uint32_t pad0:1;
>  	} ss1;
>  
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 61b18d20d..f19f93b28 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -215,9 +215,9 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -276,9 +276,9 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -295,7 +295,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss9.base_addr_hi = address >> 32;
>  
>  	if (is_dst) {
> -		ss->ss1.memory_object_control = 2;
> +		ss->ss1.mocs_index = I915_MOCS_PTE;
>  		ss->ss2.height = 1;
>  		ss->ss2.width  = 95;
>  		ss->ss3.pitch  = 0;
> @@ -909,9 +909,9 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
>  	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  	else if (mocs == INTEL_BUF_MOCS_WB)
> -		ss->ss1.memory_object_control = intel_get_wb_mocs(ibb->fd);
> +		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 476778a13..d7c3ac64c 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -676,6 +676,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  	uint32_t devid = intel_get_drm_devid(fd);
>  	int ver = intel_display_ver(devid);
>  	int pitch;
> +	uint32_t mocs;
>  
>  	dst = create_buf(fd, cmd_data->bops, buf, tiling);
>  	ibb = intel_bb_create(fd, PAGE_SIZE);
> @@ -715,9 +716,10 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  		}
>  
>  		pitch = tiling ? buf->stride / 4 : buf->stride;
> +		mocs = intel_get_uc_mocs_index(fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
> -		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
> +		intel_bb_out(ibb, blt_cmd_tiling | mocs | (pitch-1));
>  		intel_bb_out(ibb, (rect->y << 16) | rect->x);
>  		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
>  		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index f0c0681ab..dc8994902 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2766,7 +2766,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
>  
>  	blt_set_object(blt, handle, fb->size, memregion,
> -		       intel_get_uc_mocs(fb->fd),
> +		       intel_get_uc_mocs_index(fb->fd),
>  		       blt_tile,
>  		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
>  		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b55fa9b52..d1aa0872c 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -58,7 +58,8 @@ struct gen12_block_copy_data {
>  	struct {
>  		uint32_t dst_pitch:			BITRANGE(0, 17);
>  		uint32_t dst_aux_mode:			BITRANGE(18, 20);
> -		uint32_t dst_mocs:			BITRANGE(21, 27);
> +		uint32_t pxp:				BITRANGE(21, 21);
> +		uint32_t dst_mocs_index:		BITRANGE(22, 27);
>  		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>  		uint32_t dst_compression:		BITRANGE(29, 29);
>  		uint32_t dst_tiling:			BITRANGE(30, 31);
> @@ -98,7 +99,8 @@ struct gen12_block_copy_data {
>  	struct {
>  		uint32_t src_pitch:			BITRANGE(0, 17);
>  		uint32_t src_aux_mode:			BITRANGE(18, 20);
> -		uint32_t src_mocs:			BITRANGE(21, 27);
> +		uint32_t pxp:				BITRANGE(21, 21);
> +		uint32_t src_mocs_index:		BITRANGE(22, 27);
>  		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>  		uint32_t src_compression:		BITRANGE(29, 29);
>  		uint32_t src_tiling:			BITRANGE(30, 31);
> @@ -565,7 +567,7 @@ static void fill_data(struct gen12_block_copy_data *data,
>  		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
>  	data->dw01.dst_pitch = blt->dst.pitch - 1;
>  
> -	data->dw01.dst_mocs = blt->dst.mocs;
> +	data->dw01.dst_mocs_index = blt->dst.mocs_index;
>  	data->dw01.dst_compression = blt->dst.compression;
>  	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
>  
> @@ -590,7 +592,7 @@ static void fill_data(struct gen12_block_copy_data *data,
>  
>  	data->dw08.src_pitch = blt->src.pitch - 1;
>  	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> -	data->dw08.src_mocs = blt->src.mocs;
> +	data->dw08.src_mocs_index = blt->src.mocs_index;
>  	data->dw08.src_compression = blt->src.compression;
>  	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
>  
> @@ -660,10 +662,10 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>  		 cmd[0],
>  		 data->dw00.client, data->dw00.opcode, data->dw00.color_depth,
>  		 data->dw00.special_mode, data->dw00.length);
> -	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs: %d, compr: %d, "
> +	igt_info(" dw01: [%08x] dst <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>  		 "tiling: %d, ctrl surf type: %d>\n",
>  		 cmd[1], data->dw01.dst_pitch, data->dw01.dst_aux_mode,
> -		 data->dw01.dst_mocs, data->dw01.dst_compression,
> +		 data->dw01.dst_mocs_index, data->dw01.dst_compression,
>  		 data->dw01.dst_tiling, data->dw01.dst_ctrl_surface_type);
>  	igt_info(" dw02: [%08x] dst geom <x1: %d, y1: %d>\n",
>  		 cmd[2], data->dw02.dst_x1, data->dw02.dst_y1);
> @@ -678,10 +680,10 @@ static void dump_bb_cmd(struct gen12_block_copy_data *data)
>  		 data->dw06.dst_target_memory);
>  	igt_info(" dw07: [%08x] src geom <x1: %d, y1: %d>\n",
>  		 cmd[7], data->dw07.src_x1, data->dw07.src_y1);
> -	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs: %d, compr: %d, "
> +	igt_info(" dw08: [%08x] src <pitch: %d, aux: %d, mocs_idx: %d, compr: %d, "
>  		 "tiling: %d, ctrl surf type: %d>\n",
>  		 cmd[8], data->dw08.src_pitch, data->dw08.src_aux_mode,
> -		 data->dw08.src_mocs, data->dw08.src_compression,
> +		 data->dw08.src_mocs_index, data->dw08.src_compression,
>  		 data->dw08.src_tiling, data->dw08.src_ctrl_surface_type);
>  	igt_info(" dw09: [%08x] src offset lo (0x%x)\n",
>  		 cmd[9], data->dw09.src_address_lo);
> @@ -946,7 +948,8 @@ struct gen12_ctrl_surf_copy_data {
>  
>  	struct {
>  		uint32_t src_address_hi:		BITRANGE(0, 24);
> -		uint32_t src_mocs:			BITRANGE(25, 31);
> +		uint32_t pxp:				BITRANGE(25, 25);
> +		uint32_t src_mocs_index:		BITRANGE(26, 31);
>  	} dw02;
>  
>  	struct {
> @@ -955,7 +958,8 @@ struct gen12_ctrl_surf_copy_data {
>  
>  	struct {
>  		uint32_t dst_address_hi:		BITRANGE(0, 24);
> -		uint32_t dst_mocs:			BITRANGE(25, 31);
> +		uint32_t pxp:				BITRANGE(25, 25);
> +		uint32_t dst_mocs_index:		BITRANGE(26, 31);
>  	} dw04;
>  };
>  
> @@ -972,12 +976,12 @@ static void dump_bb_surf_ctrl_cmd(const struct gen12_ctrl_surf_copy_data *data)
>  		 data->dw00.size_of_ctrl_copy, data->dw00.length);
>  	igt_info(" dw01: [%08x] src offset lo (0x%x)\n",
>  		 cmd[1], data->dw01.src_address_lo);
> -	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs: %u\n",
> -		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs);
> +	igt_info(" dw02: [%08x] src offset hi (0x%x), src mocs idx: %u\n",
> +		 cmd[2], data->dw02.src_address_hi, data->dw02.src_mocs_index);
>  	igt_info(" dw03: [%08x] dst offset lo (0x%x)\n",
>  		 cmd[3], data->dw03.dst_address_lo);
> -	igt_info(" dw04: [%08x] dst offset hi (0x%x), src mocs: %u\n",
> -		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs);
> +	igt_info(" dw04: [%08x] dst offset hi (0x%x), dst mocs idx: %u\n",
> +		 cmd[4], data->dw04.dst_address_hi, data->dw04.dst_mocs_index);
>  }
>  
>  /**
> @@ -1042,11 +1046,11 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>  
>  	data.dw01.src_address_lo = src_offset;
>  	data.dw02.src_address_hi = src_offset >> 32;
> -	data.dw02.src_mocs = surf->src.mocs;
> +	data.dw02.src_mocs_index = surf->src.mocs_index;
>  
>  	data.dw03.dst_address_lo = dst_offset;
>  	data.dw04.dst_address_hi = dst_offset >> 32;
> -	data.dw04.dst_mocs = surf->dst.mocs;
> +	data.dw04.dst_mocs_index = surf->dst.mocs_index;
>  
>  	bb = bo_map(fd, surf->bb.handle, surf->bb.size, surf->driver);
>  
> @@ -1435,7 +1439,7 @@ void blt_set_batch(struct blt_copy_batch *batch,
>  
>  struct blt_copy_object *
>  blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> -		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> +		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs_index,
>  		  enum blt_tiling_type tiling,
>  		  enum blt_compression compression,
>  		  enum blt_compression_type compression_type,
> @@ -1460,7 +1464,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  							  &size, region) == 0);
>  	}
>  
> -	blt_set_object(obj, handle, size, region, mocs, tiling,
> +	blt_set_object(obj, handle, size, region, mocs_index, tiling,
>  		       compression, compression_type);
>  	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
>  
> @@ -1481,14 +1485,14 @@ void blt_destroy_object(int fd, struct blt_copy_object *obj)
>  
>  void blt_set_object(struct blt_copy_object *obj,
>  		    uint32_t handle, uint64_t size, uint32_t region,
> -		    uint8_t mocs, enum blt_tiling_type tiling,
> +		    uint8_t mocs_index, enum blt_tiling_type tiling,
>  		    enum blt_compression compression,
>  		    enum blt_compression_type compression_type)
>  {
>  	obj->handle = handle;
>  	obj->size = size;
>  	obj->region = region;
> -	obj->mocs = mocs;
> +	obj->mocs_index = mocs_index;
>  	obj->tiling = tiling;
>  	obj->compression = compression;
>  	obj->compression_type = compression_type;
> @@ -1516,12 +1520,12 @@ void blt_set_copy_object(struct blt_copy_object *obj,
>  
>  void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
>  			      uint32_t handle, uint32_t region, uint64_t size,
> -			      uint8_t mocs, enum blt_access_type access_type)
> +			      uint8_t mocs_index, enum blt_access_type access_type)
>  {
>  	obj->handle = handle;
>  	obj->region = region;
>  	obj->size = size;
> -	obj->mocs = mocs;
> +	obj->mocs_index = mocs_index;
>  	obj->access_type = access_type;
>  }
>  
> @@ -1589,8 +1593,8 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>  void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>  {
>  	igt_info("[%s]\n", info);
> -	igt_info("surface <handle: %u, size: %llx, region: %x, mocs: %x>\n",
> -		 obj->handle, (long long) obj->size, obj->region, obj->mocs);
> +	igt_info("surface <handle: %u, size: %llx, region: %x, mocs_idx: %x>\n",
> +		 obj->handle, (long long) obj->size, obj->region, obj->mocs_index);
>  	igt_info("        <tiling: %s, compression: %u, compression type: %d>\n",
>  		 blt_tiling_name(obj->tiling), obj->compression, obj->compression_type);
>  	igt_info("        <pitch: %u, offset [x: %u, y: %u] geom [<%d,%d> <%d,%d>]>\n",
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index d9c8883c7..7b4271620 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -78,7 +78,7 @@ struct blt_copy_object {
>  	uint32_t handle;
>  	uint32_t region;
>  	uint64_t size;
> -	uint8_t mocs;
> +	uint8_t mocs_index;
>  	enum blt_tiling_type tiling;
>  	enum blt_compression compression;  /* BC only */
>  	enum blt_compression_type compression_type; /* BC only */
> @@ -150,7 +150,7 @@ struct blt_ctrl_surf_copy_object {
>  	uint32_t handle;
>  	uint32_t region;
>  	uint64_t size;
> -	uint8_t mocs;
> +	uint8_t mocs_index;
>  	enum blt_access_type access_type;
>  };
>  
> @@ -239,7 +239,7 @@ void blt_set_batch(struct blt_copy_batch *batch,
>  
>  struct blt_copy_object *
>  blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> -		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs,
> +		  uint32_t width, uint32_t height, uint32_t bpp, uint8_t mocs_index,
>  		  enum blt_tiling_type tiling,
>  		  enum blt_compression compression,
>  		  enum blt_compression_type compression_type,
> @@ -247,7 +247,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  void blt_destroy_object(int fd, struct blt_copy_object *obj);
>  void blt_set_object(struct blt_copy_object *obj,
>  		    uint32_t handle, uint64_t size, uint32_t region,
> -		    uint8_t mocs, enum blt_tiling_type tiling,
> +		    uint8_t mocs_index, enum blt_tiling_type tiling,
>  		    enum blt_compression compression,
>  		    enum blt_compression_type compression_type);
>  void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> @@ -258,7 +258,7 @@ void blt_set_copy_object(struct blt_copy_object *obj,
>  			 const struct blt_copy_object *orig);
>  void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
>  			      uint32_t handle, uint32_t region, uint64_t size,
> -			      uint8_t mocs, enum blt_access_type access_type);
> +			      uint8_t mocs_index, enum blt_access_type access_type);
>  
>  void blt_surface_info(const char *info,
>  		      const struct blt_copy_object *obj);
> diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
> index cf3b8e4fe..6a4ec25e4 100644
> --- a/lib/intel_mocs.c
> +++ b/lib/intel_mocs.c
> @@ -51,22 +51,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
>  	}
>  }
>  
> -/* BitField [6:1] represents index to MOCS Tables
> - * BitField [0] represents Encryption/Decryption
> - */
> -
> -uint8_t intel_get_wb_mocs(int fd)
> +uint8_t intel_get_wb_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
>  
>  	get_mocs_index(fd, &mocs);
> -	return mocs.wb_index << 1;
> +
> +	return mocs.wb_index;
>  }
>  
> -uint8_t intel_get_uc_mocs(int fd)
> +uint8_t intel_get_uc_mocs_index(int fd)
>  {
>  	struct drm_intel_mocs_index mocs;
>  
>  	get_mocs_index(fd, &mocs);
> -	return mocs.uc_index << 1;
> +
> +	return mocs.uc_index;
>  }
> diff --git a/lib/intel_mocs.h b/lib/intel_mocs.h
> index 255eac0ff..278f143ec 100644
> --- a/lib/intel_mocs.h
> +++ b/lib/intel_mocs.h
> @@ -6,7 +6,7 @@
>  #ifndef _INTEL_MOCS_H
>  #define _INTEL_MOCS_H
>  
> -uint8_t intel_get_wb_mocs(int fd);
> -uint8_t intel_get_uc_mocs(int fd);
> +uint8_t intel_get_wb_mocs_index(int fd);
> +uint8_t intel_get_uc_mocs_index(int fd);
>  
>  #endif /* _INTEL_MOCS_H */
> diff --git a/lib/intel_reg.h b/lib/intel_reg.h
> index 3bf3676dc..f97154d2b 100644
> --- a/lib/intel_reg.h
> +++ b/lib/intel_reg.h
> @@ -2562,7 +2562,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  #define XY_MONO_SRC_BLT_WRITE_ALPHA	(1<<21)
>  #define XY_MONO_SRC_BLT_WRITE_RGB	(1<<20)
>  
> -#define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
> +#define XY_FAST_COLOR_BLT				((0x2<<29)|(0x44<<22)|0xe)
> +#define   XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT		22
>  
>  #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
>  /* dword 0 */
> diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
> index b8959d073..6c410e8a8 100644
> --- a/lib/rendercopy_gen9.c
> +++ b/lib/rendercopy_gen9.c
> @@ -138,7 +138,7 @@ static const uint32_t gen12p71_render_copy[][4] = {
>  
>  /* Mostly copy+paste from gen6, except height, width, pitch moved */
>  static uint32_t
> -gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
> +gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  	      bool fast_clear) {
>  	struct gen9_surface_state *ss;
>  	uint32_t write_domain, read_domain;
> @@ -173,11 +173,11 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  		/*
>  		 * mocs table version 1 index 3 groub wb use l3
>  		 */
> -		ss->ss1.memory_object_control = 3 << 1;
> +		ss->ss1.mocs_index= 3;

Nitpick:  missing a space here.

>  		ss->ss5.mip_tail_start_lod = 0;
>  	} else {
>  		ss->ss0.render_cache_read_write = 1;
> -		ss->ss1.memory_object_control = intel_get_uc_mocs(i915);
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
>  		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
>  	}
>  
> @@ -187,7 +187,7 @@ gen8_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
>  		ss->ss0.tiled_mode = 3;
>  
>  	if (intel_buf_pxp(buf))
> -		ss->ss1.memory_object_control |= 1;
> +		ss->ss1.pxp = 1;
>  
>  	if (buf->tiling == I915_TILING_Yf)
>  		ss->ss5.trmode = 1;
> @@ -282,10 +282,10 @@ gen8_bind_surfaces(struct intel_bb *ibb,
>  	binding_table = intel_bb_ptr_align(ibb, 32);
>  	binding_table_offset = intel_bb_ptr_add_return_prev_offset(ibb, 32);
>  
> -	binding_table[0] = gen8_bind_buf(ibb, dst, 1, fast_clear);
> +	binding_table[0] = gen9_bind_buf(ibb, dst, 1, fast_clear);
>  
>  	if (src != NULL)
> -		binding_table[1] = gen8_bind_buf(ibb, src, 0, false);
> +		binding_table[1] = gen9_bind_buf(ibb, src, 0, false);
>  
>  	return binding_table_offset;
>  }
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index 65a72d950..087eb2ec0 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -109,7 +109,8 @@ struct xehp_surface_state {
>  		uint32_t double_fetch_disable: BITRANGE(17, 17);
>  		uint32_t corner_texel_mode: BITRANGE(18, 18);
>  		uint32_t base_mip_level: BITRANGE(19, 23);
> -		uint32_t memory_object_control: BITRANGE(24, 30);
> +		uint32_t pad1: BITRANGE(24, 24);

Should we name this one 'pxp' to match what we've done in the other
structures?

Aside from these two minor nitpicks,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +		uint32_t mocs_index: BITRANGE(25, 30);
>  		uint32_t unorm_path_in_color_pipe: BITRANGE(31, 31);
>  	} ss1;
>  
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index f5d4ab359..ed149ef9e 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -100,7 +100,7 @@ static void surf_copy(int i915,
>  	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>  	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
>  	uint32_t *ccscopy;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(mid->compression);
> @@ -323,7 +323,7 @@ static void block_copy(int i915,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> @@ -439,7 +439,7 @@ static void block_multicopy(int i915,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(i915);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
>  	int result;
>  
>  	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
> @@ -475,7 +475,7 @@ static void block_multicopy(int i915,
>  
>  	if (config->inplace) {
>  		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> -			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> +			       mid->mocs_index, mid_tiling, COMPRESSION_DISABLED,
>  			       comp_type);
>  		blt3.dst.ptr = mid->ptr;
>  	}
> diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> index ede545c92..2e0ba0793 100644
> --- a/tests/intel/gem_lmem_swapping.c
> +++ b/tests/intel/gem_lmem_swapping.c
> @@ -486,7 +486,7 @@ static void __do_evict(int i915,
>  				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
>  		blt_set_object(tmp, tmp->handle, params->size.max,
>  			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> -			       intel_get_uc_mocs(i915), T_LINEAR,
> +			       intel_get_uc_mocs_index(i915), T_LINEAR,
>  			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
>  		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
>  	}
> @@ -516,7 +516,7 @@ static void __do_evict(int i915,
>  			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
>  			igt_assert(obj->blt_obj);
>  			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> -				       intel_get_uc_mocs(i915), T_LINEAR,
> +				       intel_get_uc_mocs_index(i915), T_LINEAR,
>  				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
>  			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
>  			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 20bbc4448..27ac51380 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -96,7 +96,7 @@ static void surf_copy(int xe,
>  	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>  	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
>  	uint32_t *ccscopy;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	uint32_t sysmem = system_memory(xe);
>  	int result;
>  
> @@ -294,7 +294,7 @@ static void block_copy(int xe,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
>  	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
> @@ -415,7 +415,7 @@ static void block_multicopy(int xe,
>  	enum blt_compression mid_compression = config->compression;
>  	int mid_compression_format = param.compression_format;
>  	enum blt_compression_type comp_type = COMPRESSION_TYPE_3D;
> -	uint8_t uc_mocs = intel_get_uc_mocs(xe);
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
>  	int result;
>  
>  	bb = xe_bo_create_flags(xe, 0, bb_size, region1);
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
