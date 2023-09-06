Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15E9EB8FAF
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 09:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5510E5B4;
	Wed,  6 Sep 2023 09:29:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE0F10E5B3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693992539; x=1725528539;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IFNOmJjwA/IEIeWM6cHPjv7iwIf5UNMAGG5HSw9U+Kc=;
 b=ZGkUYyGQ/LUf8rlus9J0srp0dMbeNMhTs+SGCzOm664nUeG1ULRXqW4K
 oFkdEtdO/BpfszIdOw8WA7G4w1OtI5Fm8t2tKHeO/SGhVF0mnWwWdTKx5
 80w1siPcaI7UOrenTReBc3QhrN8mviTdzaNGOeGL0LM14MqycYvFUzG7H
 ppgEKYImgWfq96y+tKFkiGChoSTRdrtW8Tku7DdnEao3h2yoQ94Z0GsN2
 sfFvQcPbSxi8q2TFAj1H1VaDkg/edMmI5KEH4F4ZQu+1C6fjSsv2828Zv
 WTM3bkHAjb1EbdOxGgQf6/UUhT0ZqTlnOctghmq/I9IRWbYJ7L/DuXiKn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="362043486"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="362043486"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 02:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1072312780"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="1072312780"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 02:28:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 02:28:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 02:28:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 02:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvaGAQMUHAeWtVgpzYHmlg8wUlqJpYWbBmfFVbVvpQO07Tcwck04jZwoV8h6nPFO+tq1iVnKiPK3dLW5/QKBNxLjunCcw9Utw3ubltR5IhaLwu4DSRQ3mJXEDcvFIPVuUAAFk3xGSr6WqhAHBD4lEsboZsLnLIgyD0PBx59vUsZcroCOQ7Ict9uTW2MWiahtAlpa4UtsJSoVzjnBzKkHngc1AJFHu62qgXtlJElY8iuqZKImw0lOW6szx0FiMGrJPvtErsWdy1IA2/p9Ag1GhcfbUNxjGTGGDaLllgIPjyKHK5iT+Syc2hfjEu1BYw1GrB862Obkfm+llkLWnJUkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=905YIS89OtkgW+oodI2SKc7bq9i2icGOdgCXfgQm/LY=;
 b=STnBWX5u3nPVBlOYgT4LC4jTbg67oZBoNHOoA8XJ7af8SZ+nkfDoRRc4WFJRMcgjgxC+AU1f0sTUzMOEonJ0MzVGbt+XuxtjOGfkRmrJNa4iKCiMivHWWuV1LlN8oEayuunhqq+c8EALQ0hLCUUA4YuBZXLLdtBjvlg0QVMOQv7wS019EiZ64nXccPdo6q//pxra5AWvrMqLS8Naj+4rU39/8fHbvHe9zrAh2Iiqw7N9QU5q+LTHbMUzXgkul71LRk8b2r0iytJ6aJRlGWWTFA+JuFZvIfumnnEwhm1qob97BKlDM5hIr15b+YVZC39e6+pIGNYrZK3yI9p6/jI0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 09:28:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5772:f514:b746:5723%5]) with mapi id 15.20.6745.026; Wed, 6 Sep 2023
 09:28:48 +0000
Date: Wed, 6 Sep 2023 11:28:41 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZPhGScPaRFjtgsMl@fdugast-desk.home>
References: <20230830214715.113435-1-rodrigo.vivi@intel.com>
 <20230830214715.113435-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830214715.113435-2-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::17) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|LV8PR11MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 678d008e-2717-412e-d010-08dbaebbac98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3NH9QhPE2ZI7z990CThONFNYC2kQi9NKI574YrkAVP51WIlxDYpTLrjIS+iD4qo9aTpDdoWVCM9DQ4CqVWkrOBY8u0rIh7RwTffSgWsA+gYZpB4xEh9QIjXeab1VT7YTu1ZurvW0YPrTHmrfY8DRHfN+WZJ1frnohSBLwzjKnoSN/D8Jry0kRAD4S+puz0tUesVo6bDml8XL1TA5ZupjkqB1R/J97Bs8kZpe8tPeCJLs3bBY54UuesjvO5lELlV6iKt3l9OxzlAM8QLE0tW3Ty/2QF3936fvDKCKE6krR+VnuXTenbyeHi47NJB+aRNHH6+t6W+8QFfxbIJuDhDAw0Y8PVOXr5Cw8XKtubEYyrdMh8wTyaoseGVyd+wHaN0dZWj+v75ZP1aXcUSyjQrf+Shw/E/iUH9l3Jxfaz7zT9Kk/6JDBSgsDzLUZH4d9Bx8TBmMuTBxR1PMJfm3EonqQFJT4/2PkBviSpn9SxSHm7j8BB0RTH/G1jwWjYTO9swSU7EP8V8H8+t31EkrXRWvcujJUtGpS9xUPlBcmaaKrDS9DEqkvX+ozkhCU56bwsP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199024)(1800799009)(186009)(66476007)(6636002)(82960400001)(66556008)(66946007)(478600001)(38100700002)(316002)(2906002)(8676002)(44832011)(6666004)(6862004)(8936002)(6506007)(5660300002)(4326008)(83380400001)(41300700001)(6512007)(9686003)(6486002)(26005)(86362001)(36916002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ri4sqwVrW5v/vvZihf0PktYjTlQyDwreYnbqCjlevwYctLvKqQm/bwUliI?=
 =?iso-8859-1?Q?iVNkulYuaQdsiQcQBWm5/YNZ5zVxA3aQ4so/N6uBejPgGruFXh7XQIxIN8?=
 =?iso-8859-1?Q?TP2JsF+OBSBIAxaXnjMevta8beo+AR64d5s7oLYdWyWy/ZqD9lhaUiErkF?=
 =?iso-8859-1?Q?3KjNRaHngCVvZRODtGtZOng9leq3p09cj3xjt8fvioA5t8Q5p6PBlRxwKw?=
 =?iso-8859-1?Q?dbwhtbqLD03EBk+1o4JtXSOc12uVYfNVp5sbjk9xETQMAUIbZaNHuGX9tG?=
 =?iso-8859-1?Q?q7Yfkvf4mm8K9k9RuzH8N16WoT0XZ+mxL88lcVccgeR2Oi0C4kLghOCDej?=
 =?iso-8859-1?Q?vjrrLXu444Y4bkyc6NINNqdIWeB9i3vBXpZA9smCGcMlu9uN3UDSaUREHY?=
 =?iso-8859-1?Q?D4IBg7Z3VhXXBmQxgrrrzP2yCPTUoGYj0xL0W6xRmCFKws/044U0iDTpGD?=
 =?iso-8859-1?Q?qr8SbjaQ/qfQqiEE8r4V66SyUvZ7mUEOilzhDPYmlcXGaBx/1D8e+sq5Cg?=
 =?iso-8859-1?Q?LL2RyBZBLStwpHrXECjjThoOIYuylBJOt7NIfzj3zAzTKxGiT3PahTP33Y?=
 =?iso-8859-1?Q?qwiVbb0yaaDmNe4B05x6HUf9OKdZZaTTAsptARM0Ev7lL/ZNYLhd6P1uUV?=
 =?iso-8859-1?Q?VVS1xAScwNzN0egQ1ToRIFTWTh7IihbnlNwIH2shr7t3qZpHC4vMfz3leb?=
 =?iso-8859-1?Q?ELCdYobF42TZczp59xJ2nDHUin4ibhvt8LvE/Dna5CBQNeSxZRpYp4ZYST?=
 =?iso-8859-1?Q?gvEFxDAQZZN8C0txWuMXN6+JF4fMJFOkDIsv3A2fXiLLFkUWotJIwNbfNo?=
 =?iso-8859-1?Q?Z61UqXAO/J0JdM6Y1lCHzFushGF4uNKxRGz0+ApSl20zwFAaoe33b4apRC?=
 =?iso-8859-1?Q?hOm6QEAZKUicActdJWXekZSaGRiAIQGNozcQUxyqq/LLUQIlH48RvykbB0?=
 =?iso-8859-1?Q?anRrTGIXuuUqtheYcDjZPyU93Yn2LHlUxeo3XCLZ6I1xRgnu7MCWr5QmeG?=
 =?iso-8859-1?Q?aHbb6mPY0LTWdf6Yg7frvvfTMMIzEk1+G+tUDT2Yn47rxSJoPujgBZGr5x?=
 =?iso-8859-1?Q?0rn1FbuglErmNadXOg6v0xG+9NpVwyy+ub/1euuYSr4JzJr7kZ//jrhe3V?=
 =?iso-8859-1?Q?0+O6PCwEXyOCzzauE3L5zNaP0YERnsuePVagxc40jxs9I/PcIVu4XZ80Gl?=
 =?iso-8859-1?Q?W4KfOkqBHLnPS7grphORQdHRU408UrUJA4+XnlY9g3DaKNtYRW2uM0M/X1?=
 =?iso-8859-1?Q?v95aoJmDBYGLHKYi/xsV0gTIfhARaEwVvotpwo7U7g0dNgtVDEZldB74Ao?=
 =?iso-8859-1?Q?wnm1a7JdcXs9WX4UieBbUyYGU3Syhc+1Lm53FF5g3xKJsNpanCP/WUiI5I?=
 =?iso-8859-1?Q?qBk3A3PeAPxWYB+M1/JrwP7+53+dX4G4axKXAtrWV02NAiQBCIaIRzFyqX?=
 =?iso-8859-1?Q?T4APda2rrA/fKpAnaE7YWf6PX0hH8F8WzFNnIw3uE3jyw56UWzHvk6gsiG?=
 =?iso-8859-1?Q?C8YHEm6Z3yGo53O3/Rd7sVUfjNyMg0B9/sF1oNMeYdF2hEzgXq0MQ77v7Z?=
 =?iso-8859-1?Q?9sd+4XaOMgAdycrF8ZjOHvmFkZX2wHDbmgtPEj+sQKiCPKGpTlSMwoc6KU?=
 =?iso-8859-1?Q?H4JptmAAVxFfJLkLz4v0mHaGnvhDX4dA+6Cf/CFe/yfsVFeYgxej2xPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 678d008e-2717-412e-d010-08dbaebbac98
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 09:28:48.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Un2ZdLpkXtoWNqiXCh6UnMisuc/IFp3XsIO/f/8Cq6DIS9ZwlqTFwtoiBiCSpbVJxcIrk1gYqFkazfsQLrV5t4lKGTEiadqgVC4BiGAvlZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/uapi: Remove useless max_page_size
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

On Wed, Aug 30, 2023 at 05:47:15PM -0400, Rodrigo Vivi wrote:
> The min_page_size is useful information to ensure alignment and it is
> an API actually in use. However max_page_size doesn't bring any useful
> information to the userspace hence being not used at all.
> 
> So, let's remove and only bring it back if that ever gets used.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 3 ---
>  include/uapi/drm/xe_drm.h     | 4 ----
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index c3d396904c7b..a951205100fe 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -127,7 +127,6 @@ static int query_memory_usage(struct xe_device *xe,
>  	usage->regions[0].mem_class = XE_MEM_REGION_CLASS_SYSMEM;
>  	usage->regions[0].instance = 0;
>  	usage->regions[0].min_page_size = PAGE_SIZE;
> -	usage->regions[0].max_page_size = PAGE_SIZE;
>  	usage->regions[0].total_size = man->size << PAGE_SHIFT;
>  	if (perfmon_capable())
>  		usage->regions[0].used = ttm_resource_manager_usage(man);
> @@ -143,8 +142,6 @@ static int query_memory_usage(struct xe_device *xe,
>  			usage->regions[usage->num_regions].min_page_size =
>  				xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ?
>  				SZ_64K : PAGE_SIZE;
> -			usage->regions[usage->num_regions].max_page_size =
> -				SZ_1G;
>  			usage->regions[usage->num_regions].total_size =
>  				man->size;
>  
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 7c08bedbeeaf..0722dc634cb5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -174,10 +174,6 @@ struct drm_xe_query_mem_region {
>  	 * kernel.
>  	 */
>  	__u32 min_page_size;
> -	/**
> -	 * @max_page_size: Max page-size in bytes for this region.
> -	 */
> -	__u32 max_page_size;
>  	/**
>  	 * @total_size: The usable size in bytes for this region.
>  	 */
> -- 
> 2.41.0
> 
