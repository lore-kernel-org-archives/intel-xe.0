Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E42C25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 22:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB5810E5F0;
	Wed, 25 Oct 2023 22:31:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EB110E72D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 22:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698273063; x=1729809063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xNJf/5bdpfpdgKD2ecMvs3wukulF2Q8dphSCwejn9Ac=;
 b=FcaJxoY3XKG7PM2TcrlUpii5HXRdmZRXUR0rzR4ysSilbzvmfT8++5tm
 jMdgQ1NcT/DwP/HAT/RtcvfUBohd7nLRcI8A2jyCBshPVFZsYU0sWe51B
 PceHLsDogL7uCoaQSyJby5HF+Z8VIezVbV4NQbZZBt7DbqpUUAas9BfOE
 eM8zw8GEEvO05WFGsgS8lKtZrpXZTpV9EDM19iaKczX8GYYZ3NwcVS/Gq
 MdupPMc7DeNuKXRMQbhO1ATm4NBTHAlunjOpnsgyCJwpOK1uVyUKWvTPe
 8qLgG5dvraIKeUM0nLDP+pfo0WK/ESKfaSr8VwKoaeFywb3Iz/P3WNdZY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="390271032"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="390271032"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 15:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="758991080"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="758991080"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 15:31:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 15:31:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 15:31:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 15:31:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 15:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5AdPYDSbaoEfK21YuE7qLAMa4kMIkocCPZMl8tvhusx1eA04Y8e9TmXVB0SjGTV9ulH06JUb8J8Io6ONZEaNPWMdZ55YT1b6HmvqlYQB9Hul200o6vV0YahUxv8kAHTopsPt3TH+IKGRJOTYOAiIG9lIJeaBiEG+wTc6O7EjTnYmKW5z3jckztaVtvVYPtE99Cdr+Q4rMm03QIlOOzYYbeMlZgUUwEHugb9Vr7TItthFp9TdZnOeTtBFFbdTe3PWghLM6bh2hY5yTlpwW+ENsji/ZBudKvX3aCTVYuT4tb9EUxKWTceqzxKjYMjaJGb+1sRv/cV/LhYLRuJ0XlNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49cBTnNx9Iy+pqRBVYotnyfDSltndKJ1/jn79w3FWg8=;
 b=Z8Fqjajt4UVrQj5Wx09vxOVXDCm0USfK5QMdHTrOjkguKpalkGZNsPBYl+WTRPvUMPINzQ4vhpbFuzm5b/bCDncnl59v32bzbWXb3IFDk7oj6Ar8x0xcCr7GQErIvGE3Mh7WOlcR5nyFfFEEr5WFizHURLfIivgIFsOFLimPL29sSZdJrptI+Vxt7Wrat4r+MgxZ7NMkOTK9JuHxWEmEposgWcAWzf9fqfTqT2RsDFU5XR1AzSBVHccTkPzWhG2C0Sm1uXjxiObbOZAOWimNV1j4r57HFdEWbRLfKIude/6ZVjpIc6OKdIMIB6APerEQpTB/2o7MMUvTKgdEwWnkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 22:31:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 22:30:59 +0000
Date: Wed, 25 Oct 2023 22:29:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <ZTmW1014iohgM/zA@DUT025-TGLU.fm.intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
 <20231025180008.24167-2-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025180008.24167-2-brian.welty@intel.com>
X-ClientProxiedBy: BYAPR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: d19895cf-629f-4178-6cca-08dbd5aa0ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTM7xkGnEidtZTq//QXWBPC62RsfJODo/HYe2Avkm7XcPDPWEkU+z+/HjMSD5hu87QjoVRfd1eOrLXAhTQCYjwnCqws3iTw4C9WDOkDxyWKj2Fs3Q12Gr4PoZ3RQduurqoQ4O+juecq8tkjyiYcAmPgso/8s+7Uwoeaxr9ruf5uf0Nlqb7rXVxoOEmPL1tX9EOaS/c3HJkFsqonuxn5FjXITrIwTYFKDrvagt9yupngI04goRDvuI/UA0q1KHubJyLzP2W7pFHu0E9NjYqT6KN9tMHSua7shE4Irj+nxMZDI5d/OEECCzdu9tkB10NNhjxOxgw+VcMbzGjIY712MpeTjS4gGmXZ90Lqp9CbbU5PfT9lUOc/igPmqUps+6JU+An/zX6Xwtm6/6M0fA8LGzgFCT2C2e5VZzxUm9cHkQSqHXuh7NtM6BMY/jwG1JYFjpEH1E5+v4h6OLAofCM6GzYlGQddMYpw1Tf/XGQqgoSJz2oUvRRXtqHA70Wi+p0ep/OW2w0nWmy0BRPqVqcIbgVENGcXE4N9sGzvLNwqw1ZNFvwL3+44T7Fr3ZfTwL7Pg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(82960400001)(6512007)(6666004)(26005)(66556008)(478600001)(66476007)(316002)(6636002)(6486002)(38100700002)(107886003)(83380400001)(86362001)(66946007)(41300700001)(44832011)(4326008)(8936002)(8676002)(6862004)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tmgoyn0UH44ugavuu8rH+yjHbNxy23yU2vIXq5dqxUwEKEuCQ1DBBzQsNChD?=
 =?us-ascii?Q?88VUO3qZ3ByjEeTfxlBr7AlxqPaxVSPg0x1JhEr7W+vPSV4O2OnfioOr4+8k?=
 =?us-ascii?Q?X1s3AhDhoXaPlWn7f/Psdqqjt3ReKRTlUxIhI8CU8VGYjJuZNJOpsD5WPbdv?=
 =?us-ascii?Q?KY1119t1hyMc2LDUGiTHJBnBz6wQkGZ8DQgvxoKCqifYnd1aKr5a8MgiL4Ho?=
 =?us-ascii?Q?MkKsQv4NXSED3Hgd7bDE3V2F+sDg9EMYw2dB57McNkeIq09npKw4SaENS9/B?=
 =?us-ascii?Q?uwOmogqukw0MB2UQhNrUIOCBe0X8bjuiXc1bj+FXMFuhYSiaqGoSnYhHMFz2?=
 =?us-ascii?Q?GWCfgiPhuwxtF//28LZGNdIPsAiSodTre9vALdhiUVrFIFGzDQEx7oapGpal?=
 =?us-ascii?Q?8qEMLv7shN9A7RMpw68nOE3qAGy1EBtCaO2gX9bR86gi8dty+3QpEc5/mnJU?=
 =?us-ascii?Q?xlF43Z+dsEzk8t+qbHXBfHWnCBhhYWMD8qqcie+SVuUEzlH2GRSe0L0HXong?=
 =?us-ascii?Q?7NrkBYe989uPfYiTyKQ2kBRpyPL/M3SLHurqB9/y6jDovZOPTT+GJFG5TDer?=
 =?us-ascii?Q?NzGi45w4zBhV25p3Hxqx5UBIxxPMHz8UfSM6fNVWrAWO9Wmps3l+00Ci9C6p?=
 =?us-ascii?Q?WoqCPhArAvRL0+c9uef+NcyW2TvJ5MRXDPsKG7URU/7H2ii+A3Iix7VO0B7q?=
 =?us-ascii?Q?+7utLN5n7M6ReT0zPveEhRRLM5fIf9DoIjaH8UxQwPplc3Nal+SE2b2EvBXh?=
 =?us-ascii?Q?PyeAIZPyHDwwk0sKaqh+4lgGmTHmEYUKqnuuvJQEoiQZ7aYu9WfMiplT3wyb?=
 =?us-ascii?Q?mVqS5sPYmXDdmf26HHi/wqw/sBg+PfYgBJ9VVA2FnWsB6W3QPOWTg/18rd/p?=
 =?us-ascii?Q?cTfPsNsTZn17jN4IHHRvy1ktdTvvWnxoQgxOdGz1xeG/CqC8UhV61a/nh+q2?=
 =?us-ascii?Q?mjQdrn8qkswsX36Jy3fgp+sWKwqUM0UjT1Jtvmq5MgDFWw3HtEQmYHX54oVV?=
 =?us-ascii?Q?vAzx0Jj35BCyy5qECXMLHwO5ndCq8CUHltv/eAhLplU5Q/Psle1QscH+Ilxu?=
 =?us-ascii?Q?ClMHImCMVOmBWYpS9TaszD8GkuXlbl9v//8TuzYapN+sg7fxFtnVnnSnczoR?=
 =?us-ascii?Q?tgEpKNk2knKQrwDiSqLOJdJxhhBycUSujlatoxcIxdsH6PozEa5vT3KSMC3v?=
 =?us-ascii?Q?l5tSXQYVCEiOXhxQGIcyju41ikIUI39rSmRud/Ae9dVK51bBfLd5Idf7LhqB?=
 =?us-ascii?Q?k18OsvBHfQ6aFehDDvXo8rpGV0QhISLcoSScq/usZxWAp5ah5sPB2QWBkjJ5?=
 =?us-ascii?Q?XgDXQDVJ657OUYj23s6HgWw4erEvrNPvgcnj6pJOcg/SI6S+aC2faGEV8fVo?=
 =?us-ascii?Q?TAd0Hbv3ozSdO3gZJSegC5B1cjOgI1u0R5naLQWqvJdPr9e4CIdD4zT2YxAu?=
 =?us-ascii?Q?b4LBfiZSU0Td+CIPbeIdIaF/CIu66JBs99t/ap3H4f1pCxyDpDvPBIM/lr1t?=
 =?us-ascii?Q?tY18+zUV5rsAhf+149K7qR8eNdcJA6AkVL9bxc+3JCysjCDG4Lx2FIC5QWlT?=
 =?us-ascii?Q?4/+wlpgW7QSBvVzlv/nybVkxUairnlmowOVS3ckwYlMUN3piP9DD5CYAHqUP?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d19895cf-629f-4178-6cca-08dbd5aa0ff1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 22:30:59.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK0gBZZ5QwnR+aqmLatB7/fdbk+IzYDMjOH5zZD2RPnUmg3fKgVX8ENW9fS9RsptjIhMRIfB+IqUEC+iRz1vYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Replace xe_ttm_vram_mgr.tile
 with xe_mem_region
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

On Wed, Oct 25, 2023 at 11:00:06AM -0700, Brian Welty wrote:
> Replace the xe_ttm_vram_mgr.tile pointer with a xe_mem_region pointer
> instead. The former is currently unused.
> TTM VRAM regions are exposing device vram and is better to store a pointer
> directly to the xe_mem_region instead of the tile. This allows to cleanup
> unneccesary usage of xe_tile from xe_bo.c in later patch.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 7 +++----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 6 +++---
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 285791eb4a79..953e5dc0fd80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -358,12 +358,11 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mem_region *vram = &tile->mem.vram;
>  
> -	mgr->tile = tile;
> -
> +	mgr->vram = vram;
>  	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> -				      tile->mem.vram.usable_size,
> -				      tile->mem.vram.io_size,
> +				      vram->usable_size, vram->io_size,
>  				      PAGE_SIZE);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 48bb991c14a5..2d75cf126289 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -9,7 +9,7 @@
>  #include <drm/drm_buddy.h>
>  #include <drm/ttm/ttm_device.h>
>  
> -struct xe_tile;
> +struct xe_mem_region;
>  
>  /**
>   * struct xe_ttm_vram_mgr - XE TTM VRAM manager
> @@ -17,12 +17,12 @@ struct xe_tile;
>   * Manages placement of TTM resource in VRAM.
>   */
>  struct xe_ttm_vram_mgr {
> -	/** @tile: Tile which the VRAM belongs to */
> -	struct xe_tile *tile;
>  	/** @manager: Base TTM resource manager */
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct drm_buddy mm;
> +	/** @vram: ptr to details of associated VRAM region */
> +	struct xe_mem_region *vram;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> -- 
> 2.38.0
> 
