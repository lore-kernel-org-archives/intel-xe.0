Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2BBC4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 01:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D3810E235;
	Wed, 15 Nov 2023 01:00:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7A410E23B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 01:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700010037; x=1731546037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CvYB4ZzvOxxYChNjtD39eVGs5j0WbPrhqDaLImrfnq8=;
 b=QH32tppVCLDUGGO1dx7qt/zYS8nBWFUtVb8v8L0qx0CfHouZUo2VXrxZ
 /2lZFi3PLl2ZjyNyZrva0GupdqFmIqska7/ne3cSmZIkkROB2J0gjab2K
 6QP3YC7wnXL5hvO2Ecoe1OnLYuoMOrNhvzI4r/AxbOxVvimZUH2KZiD08
 dS671m+EJeD+yaFilBLL1bt9BkKHPQ7JcXXIfyykxKRbQ4opGkZosZ7cu
 Km9q9m0SHZDDMn64XCUQFKvOZBQp3cobcwKvNFJIyuXIS+W/n1UhcuOr2
 juttEaiPa875Yhe4tevQLR6t2PRlaTh3Oe36FpA/NVSc9fQM0dsivQ9Cr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12327174"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12327174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 17:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="12996200"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 17:00:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 17:00:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 17:00:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 17:00:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pl3VwAzrWas58mEQMPf1E1bgHHh2UcFoYs/e23OwftcewlLNc+6hT8JGZe22ZopSMwDL25RWVFBdQR+fJBC83OBxK5y0wAd9t4DUdtyGJ72Vf5QZskQ6knZOLhA+0+T8VerqfjqxhbTL+1OYCvnKqYc9h7voJ2GmIn1N6nZKIu4C7DIohsQGS3aOLdG/RbXl2e1z28XAY3Tp/8+PjZi8SCJEr/HJq9HrslPuj7UD8D4LlRPAL0YOxEmY8b+IRrfctAhL7Tabx+x+fpX9FwtEut1NzcJyQxGqjKyeDlHn6iVM+TZpHiZxehqw0JPNOb6WWLV1sJcoejA/PFnIJNFbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb2V3B0isSRPL/bkgE/RAAzGPHH2j2BLB4him6n3BC4=;
 b=MvsmTgNWW+VjiAQgoGNHVonE7po9xeInHeMW/XhUfyma55/Anckwnip1J2z6cWYIKUzaC5j+xVFLKjfeBaIVjs99u47UeLk0iTW5LgjFX5c1G8P+ebgFwin4VbvewdApaZa2KDiQNo5D4WlVHFv3cVuAdYYc3dQy/Xb4Noi/QWJDjt9DuOIuyqxQ7H/sGOkVzgl9N6brqW+R1nFXnWCRMZKX/hPzkXEvrYnzoXhbNqBTv/TUnq6UPZZdh2tCbjrDTPBt1kWtigqeQ00Rfdn+SB/8N2hz/4ZRGMpVcxlJSStt6KAjbp5XiO/uFuvE9nJknMPIT0j6V0tg35vtZh6erQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Wed, 15 Nov 2023 01:00:23 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 01:00:22 +0000
Date: Tue, 14 Nov 2023 17:00:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Brian Welty <brian.welty@intel.com>
Message-ID: <20231115010019.GF1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231114211033.30945-1-brian.welty@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231114211033.30945-1-brian.welty@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 39747b2b-ebcf-49fc-47de-08dbe5763e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9Dxj4qXFcTbmQokznkbTAkFl8C9sWjNfqow4QrenjqjyHvr1tY990OjIvpIrCEk5goKMv8+2RExo5Mp/OTaDju9FpvZhzTd38S+1xPb6WhyeacBMhIQFlx7j0uIpoRx0QvbRXY4+6j/sVzT9FibgoTSmH867YgPVB+aSs+nXeswoYbrf4JwpDx2yp2MTFv8EW35UI/V0wWz8YDdzfZYxa6hrsTT2GFqnLkVBXhl4pa7OEN/NujCsHJQgXL48xjrPadVWKN/dDDNiTJNg2uwaS7zmfpcv7ExLBfQztSNtHsPh3UJzumsoZf+pJF8GO1MK6ChJaGjAXmuKnYaDmX+YmQ0b+VxMgV1nuorIXhJJjLVhoJ6CN/bH/QCe/G/xx9Kt3F/l5wHKjlsA9rwFwXPnxasFLoTKcq+jqudJD3p6FSsDQOMYSxu+WiZpPCRXUiqeTtrYs6XqfVSTGtuGa//+eef8qgChEs2ALKUivGqYTWu3AldO+npoMSuT8PBDFRiA8xMbvhYY+DeTWBY6/rYNY4jcEtAAa779O0wdAMtpZfe9HcY9BtW5rZDlMS3PprQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66556008)(66476007)(6636002)(6512007)(316002)(83380400001)(38100700002)(66946007)(82960400001)(6862004)(8676002)(8936002)(4326008)(6486002)(478600001)(6666004)(6506007)(5660300002)(86362001)(1076003)(2906002)(26005)(33656002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFygBbvYtzRUzx403oFkZ5u/8/rHO356Uq1FvrAZ1cG+wxtRnx+0hJWBlfNQ?=
 =?us-ascii?Q?to5n/ezpuEHUm4WDeQ7nDvJgQEazhQ2+Nv9aQVk+BLeexaWScLs2yvAZaAjX?=
 =?us-ascii?Q?eeZgJVyyMEOPPy7R668BmvBIKhVfy6MWFapFixfPov0iETkvqoge+ECEJ0qV?=
 =?us-ascii?Q?rrLMRqf79lUgFLXSOFHHt1ydETvC357NV/4KwAIqqGHEE78XnELZChVtrf2X?=
 =?us-ascii?Q?kPEIciMm7Hm7nBqfVH1hPrO7EVKL7+0XpeD2bNGIMRxvNEaRPKVIaTt0SvYk?=
 =?us-ascii?Q?PepK6ynDXmzczScQROjAsztfnkyhEkx5GI3wNniVcqfyqthmh8rLV/L5L21c?=
 =?us-ascii?Q?FadxowFTAyItQGPlqjyWBrzcTlp5IdddqjYwB7d5sNR/L6W6OXThR3wel5y7?=
 =?us-ascii?Q?IFjUlnBkJsBzdeShFYw5dLeVlbVDm2yubP2sTrVkABEjF/AWjNZizjcMvm4n?=
 =?us-ascii?Q?l0D+SqQfOlcYdyG3MAKdJl4fxw73I+UC/kRdovSzA28ZJz6bUSFxhIhBqEjT?=
 =?us-ascii?Q?HlPk15LI5YoAS+I9zvkUfShowTkKuSSTbcXOR7olKRPH5U4nAANEwUo+peEe?=
 =?us-ascii?Q?yHfUcUbDqX/NtJv+iB+/fS2eLlPsv1QAexkEJclfCpMFaTrL48iU5uMQZ1hb?=
 =?us-ascii?Q?Veg+lR++wYdHUJpXj+B8HLlZncOPcvvp1tnw5OT6TmV0vVUAnZ/I0qoVQIE5?=
 =?us-ascii?Q?eIegzzUijzNxp9qRn5TkXD3nfuGFXi5VE/rJ2Tgxyc1ZvvuW185hVQwZGvAL?=
 =?us-ascii?Q?Le3JPKGo41hMW0o30giEvulGAbA/3Nlz8UihyN6+g7OzCatSoJkqS20VwGUb?=
 =?us-ascii?Q?cz/qwg7JwHcEkpqsYepFppm4o6hUeqqVsAjena4cYnF51v3BqPNN9576DJ4p?=
 =?us-ascii?Q?nXLhaTrMXd34mkkag+MZDOiBf99ipivwN22P8nCQR4zVeyA2EVVstqNXHdGe?=
 =?us-ascii?Q?B/owbcMRHlOc9S7rUoh/u8RQkeHtD2Uoi08YuHT5NV42E3/0CkOa33YwHL9n?=
 =?us-ascii?Q?zWg/bAIDQNhAuA1AJR9GyA1ObG77socMMO6ahr5ZtlF73Ndl8xP61o3SF5uY?=
 =?us-ascii?Q?3XtI2eoLL/Z/nbdctMekcNYiOs8I0lhjEz7wgT4hJIjydio6/CkuUZLh2ZGr?=
 =?us-ascii?Q?6ecXR5U+LVxJNGMqLe6qXHF6e+foZ6bW6FNNt9OG+TYwdyVgqFod1cjncnPr?=
 =?us-ascii?Q?IP8AU6PK48DdyeybT5rmML4Gt1RERW5ngT8KTwP/+gD1jy4oHTNrZyt67A6P?=
 =?us-ascii?Q?L9v9Mu5OgUs7rIsmBYjDSJ98Oi1/XVTH4b6nysA7pTA/4yjl1UgCnZhRE6qw?=
 =?us-ascii?Q?PUbSxCt8uc9X+vv4ikK9WXCK+oBN7hSYqkM4PcEKEiJiltQMfR/Pm3hIGVtW?=
 =?us-ascii?Q?tV7EaO4LSHVuSaUG+978je+joTuKeJFcUEWPmLWz7bJuqzWC3opXtEqzK+nX?=
 =?us-ascii?Q?FAQ5PqD+juMArtN9OeYA5fMA8fWteFTRzrXdC45I+i8OLOr/geJyhDgR3HaH?=
 =?us-ascii?Q?LHBLu43sXkSGvMSL+qE+BjyU7AvRm/SZjZhqe/U10wcY1IH3HjgQgHP0l/lS?=
 =?us-ascii?Q?Z80X/exwMuzUnL3OaWGJBetwPuh/ZJ9C71dzrjduYFk+1I0BDx13n9/0rQPv?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39747b2b-ebcf-49fc-47de-08dbe5763e03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 01:00:21.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UyZ2NQeRQhlheEANrPhlp/q3WXBfFjdDunKCic55w3iLs5vCpI1plz1o+j4v2FVYvH1kyQkJzMm3pUgYXMSRVjr5aW8CEbvI2mnI/o9aJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Make xe_mmio_tile_vram_size() static
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

On Tue, Nov 14, 2023 at 01:10:33PM -0800, Brian Welty wrote:
> During xe_mmio_probe_vram(), we already store the values returned from
> xe_mmio_tile_vram_size() into the xe_tile structures.
> There is no need to call xe_mmio_tile_vram_size() again later during
> setup of the STOLEN region. Just use the values stored in the root tile.
> 
> Signed-off-by: Brian Welty <brian.welty@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c           | 3 ++-
>  drivers/gpu/drm/xe/xe_mmio.h           | 1 -
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 ++-----
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index d8f9fabf715e..0baaef53f3a7 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -201,7 +201,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
>   * NOTE: multi-tile bases will include the tile offset.
>   *
>   */
> -int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_offset)
> +static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> +				  u64 *tile_size, u64 *tile_offset)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt = tile->primary_gt;
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index ae09f777d711..54de7a433696 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -138,7 +138,6 @@ static inline bool xe_mmio_in_range(const struct xe_gt *gt,
>  }
>  
>  int xe_mmio_probe_vram(struct xe_device *xe);
> -int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
>  u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 0c533d36791d..837b522cb91f 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -62,12 +62,9 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  	u64 stolen_size;
>  	u64 tile_offset;
>  	u64 tile_size;
> -	u64 vram_size;
>  
> -	if (xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset)) {
> -		drm_err(&xe->drm, "Querying total vram size failed\n");
> -		return 0;
> -	}
> +	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
> +	tile_size = tile->mem.vram.actual_physical_size;
>  
>  	/* Use DSM base address instead for stolen memory */
>  	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
> -- 
> 2.38.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
