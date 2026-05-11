Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4F0CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 19:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5610E275;
	Mon, 11 May 2026 19:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yvk2slcW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B510E275
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 19:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778528056; x=1810064056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+i9GphefwF5sxvMIjpIZFJGdMrnVmvwlfwt30GaXKRg=;
 b=Yvk2slcWKI0B028soV71sZV0LjZIo8wRpwsMoqvGV6ZdIx1hVJzIWHrH
 Fw9Q/CgsxHoBkbSjmwBAu0vqjXsPoGwphAb9T5eMRdxJqGe/Lu4dBKZwS
 qdvCgZm7FSg1Vf8U4tvpVBhVFpjFfa3AfuS5sCUf0WeeYmOYRUBN8yLeg
 CKZjap/5sKu10Vh6BakjLJZETfV1cSPGepdPLmD+bLt9vzQCzcN3YS1F6
 lbAxiZjjSkL3+Yt/1Pln71KIqyrzq1G4tm9Rben9lpwvsHnMpNbi0WuyG
 zYmaY5twF4jMEu9YzkG1hNJkYNTkixx4GRUG2CjtoByn1aperSRu2vHTC Q==;
X-CSE-ConnectionGUID: qqIxeZ2oTkyJL83dWvd+/Q==
X-CSE-MsgGUID: kHw6PXe5R86O1E5LMt4HLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90892797"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90892797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:34:16 -0700
X-CSE-ConnectionGUID: dy6wnqGeRV+gif4GBLmrvQ==
X-CSE-MsgGUID: sDcTdw8dTke9q1w490Vmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="267907700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 12:34:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:34:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 12:34:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 12:34:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdzyosIb3NF4uzn7LrkAKO15e+zWrIHQHkH9NH/4oDAak4QzyNjl8CL4pWg/FiQm2vxsOGPIWWEXT0GG25R0bZ/xgAo+PNWZBCWyQihWbY0GGZOzlxjtxh9qSe0sim4tPR/+h/KZhINNY2FPL0mQiwasK1DvYRrOjI7Uffm+KDtrZj1YypuqH15zVZN3Cju6pDD98vmxAfdZ1TO+03T0ZZJefmS6q380zQblcFNeC5RmJXigLW0UnqITQ1002BwnBcetbaGXQikoEvCgMjxLiXdL+qrt2DzHEv1ybjap1d+EhTa0ggeSRmvonAVT2QfzvBhbNYWAnO6bSZtrFsK/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDTMKO4qfXPWumragv55cDYM61LRDPue07vPx4bpRiE=;
 b=NEuKjBrd3H9rG+58uM7fX/oT+LLqLPcrJNedRrqDk/KgALAfb7a7xdGz9f7b02cnyh39g7EMlN8V+7jYP78PQshhpUM+CvIWtSgXJJ69KEQ8FqQ3iicPa4kthBJJifGIngZ/X+SgjZOE/RBrsSiJdZk59SYhIX5c69nsomdmtUnRTjbdw3lh7hNlv+XqWDkZ+2YZkewVw2X1T1HLtt6k+vuxXGbN9U1untPHtdP4hqqW18pYMuGBKSri8EvBpQIWnP4LXjKrWnj3HpS3WKAfqb7HpO4wYDsEfcvs12PJBcmsejoC7MiTZJ9MaNhN7o/2rDBzaq4HihkiDBkZDPOFqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:34:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:34:12 +0000
Date: Mon, 11 May 2026 12:34:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/3] drm/xe: Refactor emit_clear_link_copy
Message-ID: <20260511193410.GU2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260511123746.616662-5-balasubramani.vivekanandan@intel.com>
 <20260511123746.616662-7-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260511123746.616662-7-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c17fe5-115f-478f-f124-08deaf9447ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info: 0XosDjoAmk5vcrre3F7clIeaMAy8S5cQ/DEBvRxWc4KsrW7ZT2Z/PbmSY1YqCXNwCdf1zMGwczIKKg++TSM4/I2OiJeRUoTvpn1BWFfMdnCmiuNF+5L3gk/mQdEVBxqF2iYYck1gYoLt70+q7L2TLLggozYOF3b7yTOR70TD5WPtcZ9VlOGgD7rP2GjIQfL9kvIl+wXBqBndcViGTMA/iP95dFtXkjuX6WukavAYualrbRFaUDhwc0k7VrcP8u35L7QsqvcbenNY0KZqu6al27+1NjVe/FY5oO4hwshpfQZgaBMivlPMXIRqf5RUEvruOOzRRyz31vRS5Dce8k41/6adS4/arTBo94/45lPzhDqOvTTN1ce3P3ri7/6549CMIdVr5A8u3luWDfcNviaAeJHOjeyhqnG0XPXUeevd6wHPMF57AQeYwB75bA4ePBQHXgQ+ygDt42VwzrFbTN0anxG4fjhn+oat7KhobwZOr3xiGU5DhHiG0rMxziWhR/keWOHhYTLsNMAH37b8xr6LeY5x18YXfZMxy6/K+tUHGZitqQkw1RcS5/RaRt425Sv6ZAxZgAGfnEx0ofu13+R0b2VdNjjz/sBwjeu//mIlWvZuOIQLQI2Vp53HuYsui/gObt8+wW+neC1HBnyqqHFPryw3gP1SdmptXdh4sBh45OXa7JhtHQQypUBSC2BVk3Q/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7sQGR2zsDfrrypb+4TjZCoAJ8FARUyEySqObexS+F4RO8gwMF1wIoPSkRX8?=
 =?us-ascii?Q?s0G40Xr4p6ft7YwT8dd5GOghOIXGNBTJG8On9Yk722x4Mx15GF4T4/YiMhlc?=
 =?us-ascii?Q?F0JHBiZkYSGuulSuCXTwOva9U/0Xx14JWY7mcY3ybaFwtNkPSP+Gm0gx4mbS?=
 =?us-ascii?Q?VkGH6WUiL6BSmfK4dOMF6B3mMPUHe39FkzOoxC6iY6vSdT019c4QPmoH5Xjb?=
 =?us-ascii?Q?Eh9TLJq6XfRXPBgIEwkJkEzFglFqNdlKuyJNtNGhA4xRojLKqIJCCoRUyTya?=
 =?us-ascii?Q?L4sfKbhBZNaVxDQNvsJc2VqskriOBZ+ozDY9vqHW7VzrpdRhhk3j0DUHQ4jX?=
 =?us-ascii?Q?rboiariwgsHinQMuv/ZBL/0auD80tNM1mY8q9GXTujMMA7xbkSnXlvhhbm0I?=
 =?us-ascii?Q?qDOPf5zO0XoMY9pFqWJUFwiXymc3UOoD4JmFHUAoz2IaAvA05HUywrd2u7lx?=
 =?us-ascii?Q?jj6o+cyXZEM45VhiOy+mzw3xm8C05JdG6OAQ+roeT3eAQhTeU/gQn+iou14C?=
 =?us-ascii?Q?f9yHcoIq1RFE2/eIplnDEn9lY4MtynVkloRjNMmCtxdU/0/4JPAe8WDJEuWP?=
 =?us-ascii?Q?8E33m6Ndbf5MToMcZVIbcb+4wwFB7+UtxW0Cms5H56kiOyrd4rzPvwYVzAQR?=
 =?us-ascii?Q?6URFBwuvSBXti4tnkDScTkTanZi0SWi9Tc+G7O2/FFRK52zdE371bZHz/hZ7?=
 =?us-ascii?Q?x29poxTHCHyZwj67oL6SzMctDnGoq7M1Gyb68VzC5WHeaoeqcbyjIjka6s1i?=
 =?us-ascii?Q?mBuxZ/ex4s2S/VqAVi232NJY89kJpz+IQNzuDTOG1hHOUN8oDMH35N6OSflR?=
 =?us-ascii?Q?HVmGq+Olk/bsP/P7it/hT3jJndfD+kv9o6sx8XeqM58P2pohNY8rg51YXuWM?=
 =?us-ascii?Q?+QqBNAKxqGoJ02vwZK6e0b21j1ZPB2cmqcphXj1nu51KE4aGuc9i4RVJxh1h?=
 =?us-ascii?Q?ncQah4YiHlH/viCX/DHG1JwF643xl2UXiNR9/MbgWHKPcgdfb077IYMFm5bq?=
 =?us-ascii?Q?bZvUQyB/6hb7XUkarohjGyUWgCzK6OJhMmkUVaWla6QLjcX6a4n9xSeyB6cX?=
 =?us-ascii?Q?lXUyJY4Gs27ZbndInh05vK0Qa1VPl/GU52jYaPEm8EIQ+cENanFHrPyfMoVC?=
 =?us-ascii?Q?E+rZqNhfStubIczwiH7HHyndsTladIllOxJTHrnt98qBnXHExB8IlokxaM3O?=
 =?us-ascii?Q?RT2NVrVY2TELFQiDKV+a5X0WEXG1H8PwE/rM4XxTv7vFTlJj58vcuLIBefiA?=
 =?us-ascii?Q?/y3x5F2PQ7ykMOlc0nIPA+DhUFYCm1aH9EXWpkUCczs6HI6kiMsU4uFOILk1?=
 =?us-ascii?Q?4XVTILzoGysWQDTgBj8Ix6j9YLW6mU7djlPQI3m/ChlH6z1d5+XpnubmjcFt?=
 =?us-ascii?Q?L9Utp4kAPRenas89tSFW7OZVVJXuE5wW+4Wr+2fHLa7KfB3WqxCMGpnYkrP/?=
 =?us-ascii?Q?L3ja40CjPeE3OFuYiqu1GF3o5y+MBjGL1C1fbpJDoRE+bz/qCm+0jfVwz1Wy?=
 =?us-ascii?Q?wmZEEn5/mfkkzhlflfakuINSfy4BrFpvHBSXFja627gT5chffQTW4Yy/jyGe?=
 =?us-ascii?Q?fQVQ6iT9PEgFp6txYdYC5wvNYRo2iD8ZPXPR7b8IbcbTrma4nlomRODRmf/+?=
 =?us-ascii?Q?pGRFxt51QcOqsr3iH1aYKyok8wMm+KB2mI8TzMUarUCkNDVf88ODFJnHmOnv?=
 =?us-ascii?Q?/uGpAjb13phYLTU2gseQ+EciiALcDGQtD/TmfgRY6NN7twEQSGvtw1lOHXLl?=
 =?us-ascii?Q?HgZAEdIEaSgVPEDD3GtN7VB+VtQQ5/M=3D?=
X-Exchange-RoutingPolicyChecked: eVY2rqt4aaCdmjzW9jxRGVNTaSYiOXY1VJJvu42/ww/k5KJP6pItxmwN1aC09jUTkQghwRagSe3FGD0kw0ye75yfy8+aLqjNgiBr2pVzB+mnB9pIZxCeq0FeyRingLCPbU5BevCYHwriaTjRiI+zwt6yKqhVnxiA0Ft/OQFbrmkgcpjg7l4i9udWiAwV9eDcp7HF4JgR73xSRchOKnV7BUSoRz3aUCYZQzb1UupQGWDIGMAwyg7NlnmpSE/k0e9fL8NO215PDh340b16XJ/ixXPKhTu26W8kUWe408aNLZ0PINB7Rajf0oFINVqJPX5GzdKtqdtmAO+Un601tCrSNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c17fe5-115f-478f-f124-08deaf9447ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:34:12.9403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQytebVbF+/ofQ26/sAZSsuEqBEtM+gSE7a1kV/1dSmfL9JlSfpcYLN/zmx/o2BVQDipdILnKGJksXC/nyQ/aAmxwWacG30uGI3x1hDb/ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

On Mon, May 11, 2026 at 06:07:49PM +0530, Balasubramani Vivekanandan wrote:
> Implement a function to return the length of the MEM_SET instruction.
> This is to prepare for future platforms where the length of MEM_SET
> instruction is expected to change.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 1 -
>  drivers/gpu/drm/xe/xe_migrate.c                   | 9 +++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index 4546c8f10516..edd204b8dfe5 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -37,7 +37,6 @@
>  #define   MEM_COPY_DST_MOCS_INDEX_MASK	GENMASK(6, 3)
>  
>  #define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> -#define   PVC_MEM_SET_CMD_LEN_DW	7
>  #define   PVC_MEM_SET_MATRIX		REG_BIT(17)
>  #define   PVC_MEM_SET_DATA_FIELD	GENMASK(31, 24)
>  /* Bspec lists field as [6:0], but index alone is from [6:1] */
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6ffd50050e3e..4f9be41b2f64 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1461,12 +1461,17 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>  	return fence;
>  }
>  
> +static u32 blt_mem_set_cmd_len(struct xe_device *xe)
> +{
> +	return 7;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
> -	u32 len = PVC_MEM_SET_CMD_LEN_DW;
> +	u32 len = blt_mem_set_cmd_len(xe);
>  
>  	*cs++ = PVC_MEM_SET_CMD | PVC_MEM_SET_MATRIX | (len - 2);
>  	*cs++ = pitch - 1;
> @@ -1536,7 +1541,7 @@ static u32 emit_clear_cmd_len(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	if (gt->info.has_xe2_blt_instructions)
> -		return PVC_MEM_SET_CMD_LEN_DW;
> +		return blt_mem_set_cmd_len(xe);
>  	else
>  		return blt_fast_color_cmd_len(xe);
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
