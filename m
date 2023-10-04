Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DAFE7C4C0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:21:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADED10E136;
	Wed,  4 Oct 2023 14:21:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCDD10E136
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696429298; x=1727965298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Fkd8FXNWWT17m41k03laOlM0NAKDPkbAZaceCGO4was=;
 b=HvjYADlhZ/cCyuufcrTh2nq9zbOcj2OMRRKIvsX3pGLQF5bNagoGFo+n
 VytHSCgGPLa0klxYAoSgiGbz1jWeQi3o6xt0o64GI5W/DhatkKX4nHUIJ
 qOLXLqW5rdKJiaK/zvmwzPP9fNhFpq8OKnBUDCep3qHFK84AydscMwtzp
 7mlkb6nhZ1reaxdh0sURNBghvm1dGwJYKTew6w91AX1QkWueu9uEhgjtE
 uOCqQ10oPrVXfwAHAJzpdLSzeN/AKap4bTrwGaPQuyXqqlu3ktnwyUtov
 uCS7nuUf5BxcLaBLpdGoj8daeuCqZElbIbe9cHqqdF5AtX8Osvtx/KhAb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386003903"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="386003903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728029761"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="728029761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:21:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:21:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:21:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:21:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh2xZ35K7mQnXBz/To4Q2KQYg87TjQLov975TggbitM+0T5aoJuoR3+eeLQyoGcZOBiS2m/t//iehRe6q3khnURME9GLr95USzefcHzbVzqEvGXPZG8AI/lt6fCgm2hXXsEiBkSOBLVb6bvmYlM/ZfwrDSvBxpGu/oYTj2bUfOCsg3LUkXkg7rT11UmN5f4+QRb+h08PAjmvLW+gpqSXdEUh6u/nCxg3S24zn+elr2U50Ikn78j1FccEsIxFiJiPvXw0rl1NvpeIXNx/xWG5Mw5oWF+j0GekEF5h7EDMEeNo5FDF0r7Pp0qSVZKT+uWW1LpS7bdPfqAH1v/PEYsNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F94K7aa+qzz5k51D5BReprFBDptISFV65DPeBz3K67o=;
 b=H/EXosMgRX1IFBE0UIuyVfuOrnm7GvFp4ME428L8A+00BO4SNZlR10xPDTn8qKxjh5JfyVEovPLdGofyZCvh2Grkhek5gzWyRt21LEQFV5Vd7l8Xe3OhispYCSV5WT+B1PxRS8yEB3slWbrk4MBSR7hiXem5MaRx3pp4AzGq+qwq0RoCLdnbRuIp7CFRJkycTVU1uDmmWBzOhGlqgWj/Mks93ZT683CZNtrXXCZZF09yQDSmTdZCeHSSUXHsDdTjlPQL6drtmdhH03NRiJG5H2HvM5V++opDasn5YNrAS1I1Lz6/RCQR0WrkkZZj9kfQ6J+//MXbRab6BvdYHuDZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 14:21:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:21:34 +0000
Date: Wed, 4 Oct 2023 10:21:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR106iLK4XgTGgfX@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <696d81bccaca9c3b0a29996ba12afd1f09b69400.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <696d81bccaca9c3b0a29996ba12afd1f09b69400.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1830dc-1ae5-49dd-f036-08dbc4e5366b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9mTJ0wYljYuHqSziMMHKPrGEsYF5E7bJGKDW6MoPQCpZbpMfBOx29guDMutBhcvTpEoXLeMD0duL4eyt/iNf2P2rlNZBiOAos6U86KJhDmE9EGkKdcgKqVMvZHN89BHD16W3G1AgqwYX98skDi0IFGOoPnw/Kffk6Njm1mx8NO6CT2Ykid/bvImxm071dryJv9zmkP4Yzto8+YZna5f4Syu4A1DCm5ByET1YPeTcmwS6F9sPWBfVmHRxMDpgvSHDn3IMdISY1D+bHQcaAlzjjO2T8X+8kUwovnopSHkboXcueYw7cDCObM/x1KHsZuaOjTRJzHfSaJchpToJ37Y5RofU6Ozp5dkLYRKKe/VLYjWVsrADDKSPHyR9mrfjDn0wEOYZoGnVoDNTLTA91Zf/AKZJhwA1oBzpHWRITL4fapNcgCWn/4epI2PjmP9LDZf+1GxW4CmgAo1zmpjieAcRXJoP/enSYnBpfqfmF1ci7b3+xjb49ADXfEu0WqkRk3cYdjDR5yYX2/hqfSnSyJktrdTiM9SVO8Z7KmpiM63EiOYCbqdWIadp/pGWRy9a11+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(376002)(366004)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6506007)(6486002)(6666004)(38100700002)(478600001)(86362001)(82960400001)(2906002)(6636002)(41300700001)(6512007)(26005)(83380400001)(2616005)(36756003)(37006003)(5660300002)(316002)(66946007)(66476007)(8936002)(44832011)(8676002)(66556008)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vLY9US1NvyTtdob6BM5PslCOU4O/geP7ziwKUbhB4HahVuDo9jO7Im0ZpU8z?=
 =?us-ascii?Q?6o1lmHhT/5BJnWnVKYSNBuMnrTSv5DrxXmn7m4h1fgjSL7+lVNVz1uyC//l9?=
 =?us-ascii?Q?wkDNYYowRvrc8pNETVfwFO7n+MerO6N96WPTZomuYpXmOhUmFGT74tVZvOkp?=
 =?us-ascii?Q?5rFZjibMF71GSBVcwn0+shuXOFesAyO7hAUsY/lS5zCU4KPVStIlf5tnvgsE?=
 =?us-ascii?Q?csGdVT4GAQfVi0eq8dDNn5gU2C+48ZoSj6W3APbHA+tGctLBHqoO5ck5T+W5?=
 =?us-ascii?Q?S76hMFvz4HJywZVzOf8nlXAl+1ukzFN4M2e3G00rxMDsc2xcOXpIe+dAT4Td?=
 =?us-ascii?Q?u7d21DrXP7uZ2E3vnCR4QlivglQAkucx98/CX4pCJBCLIBPTGblk0yUrAXJ2?=
 =?us-ascii?Q?CzmoJIM4M7YMF2XYOl4eBmvUGKzcEJ7gLOwNNgYQCWHHBeQB4zI7GH0qWopg?=
 =?us-ascii?Q?NL8Ovbz9c2CgYQMwhbQJP/YWWBKHQ9wazyQh86VrHPpnRgov+ft7pXS1iWyz?=
 =?us-ascii?Q?L2I/mQLtubH0mLWk4gSE+wL82Gqedb8q8Ls18IRiSFZDcduX2ltFCf3B0tVK?=
 =?us-ascii?Q?e+/SFdxRzdGtf0JqXnN0nfw/aUDzHzHko96uPX7OwjWgrzx4WJpCKBEHLn3N?=
 =?us-ascii?Q?mEBecqemymfS6MxLOrgQkNzNzluTH2KDeJedke6qpN3LKyxwUHARlfT02K2o?=
 =?us-ascii?Q?LQN+w9hjfF3Fup8J0PCQHc4G9Ki+zsdNZWLDXfyIgM1bH2hrsZJU7EOGFVV5?=
 =?us-ascii?Q?WWZ4cflwqpBrQGo8depE49+WowS5ilgVCLSUE5XM0rrEWys0LeTJMx/smFTg?=
 =?us-ascii?Q?8y0/pwgEMBjfrcOMj2E+3ACsNMq0txxaX+lSKx7QuCEri6cAqd9p63X+xkMM?=
 =?us-ascii?Q?j+Nv7TpNjI/5s0M812G+NLhfkIoTT0/upAhC3MaWnZzEcic2Kk040c37X+0s?=
 =?us-ascii?Q?WEFLVLz0MZtoSPVzd4zjokhN0A4replDvPU05BKTQwv93PL+uXVyIl9aq8ox?=
 =?us-ascii?Q?jaFEpuwinTJgzh95fu25qM0Db1ko9ACSmTeAp7cjAs2b0/3VqK1nk+LIMmYW?=
 =?us-ascii?Q?3jqpB3BGB1fl8PA9WqnLCVnGk1ppPNP3uuwx0jKt50wIgg7g8Izzv5lwUoKe?=
 =?us-ascii?Q?XB+zrMybr5TB/HX3wSRMoYzYaOZvLRUusYfWoFNbTcFWDgDX0hDiZcZGD/kL?=
 =?us-ascii?Q?bSxKPLJ3A4bj7Ix4bGuPSFvMdtm7wgZ/j/xB7EMe7kbELjCxsVHZsfzxHnq9?=
 =?us-ascii?Q?V1m2m8RaNQn7MAQuwSGp4hA7crvIBFxh0eA9Z7KOBs8Nti2ykPwEkYzZnus+?=
 =?us-ascii?Q?YnWKk3I+TLWz+kFjqEQKagJIRqgWzTw7aeeTGOmryrGKXeHC8BE4WhH6FwGA?=
 =?us-ascii?Q?YNn5lRJSDxX+3lzGzQ1lYoQPiV0YqksR+gGRlTmLesAzDfXCaUsBM42TSMSj?=
 =?us-ascii?Q?QYDxG9YDDgnaJqIPSqQJiQ1r3EfWQuMn7st54cv7yRN5AywjxPLNBWrI4K9i?=
 =?us-ascii?Q?jD5usm+l/XwYBrqYgbcSGdMagoNrVwraGDIxtXrmMzYuMlog2R07q+mW21Xy?=
 =?us-ascii?Q?nFuvNp9eHEfHpCaA2FOrYT5kFpW2RW6zjMugsoxPLLAw8NxR6d1dVmHa++22?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1830dc-1ae5-49dd-f036-08dbc4e5366b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:21:34.7849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgTKIk1IP7SPiNXZBX2LZRwg2fpnYlGZlTxfZJul8GHIYEnulmWezdVkJ6upMLmu42W1PyIoz3wahpDcnrgu8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:56PM +0300, Jani Nikula wrote:
> Let the display code decide whether display hardware is there or
> not. Remove has_display member from struct xe_device_desc, and
> enable_display from struct xe_device.

on this side I got a bit confused at the beginning, probably
because I had the old i915 confusion in my head.... I had to look
to i915_pci.c to agree that this is the right thing to do.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 --
>  drivers/gpu/drm/xe/xe_display.c      | 51 ++++++++++++----------------
>  drivers/gpu/drm/xe/xe_pci.c          | 13 -------
>  3 files changed, 22 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 62e1a875980b..01ab0b3d1954 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -236,8 +236,6 @@ struct xe_device {
>  		u8 has_llc:1;
>  		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
>  		u8 has_range_tlb_invalidation:1;
> -		/** @enable_display: display enabled */
> -		u8 enable_display:1;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 75054f78d7ae..70e7afc0a890 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -57,7 +57,7 @@ static void xe_display_last_close(struct drm_device *dev)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	if (xe->info.enable_display)
> +	if (has_display(xe))
>  		intel_fbdev_restore_mode(to_xe_device(dev));
>  }
>  
> @@ -138,7 +138,7 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_power_domains_cleanup(xe);
> @@ -148,7 +148,7 @@ int xe_display_init_nommio(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return 0;
>  
>  	/* Fake uncore lock */
> @@ -168,7 +168,7 @@ static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_display_driver_remove_noirq(xe);
> @@ -179,7 +179,7 @@ int xe_display_init_noirq(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return 0;
>  
>  	intel_display_driver_early_probe(xe);
> @@ -208,7 +208,7 @@ static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_display_driver_remove_nogem(xe);
> @@ -218,7 +218,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>  {
>  	int err;
>  
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return 0;
>  
>  	err = intel_display_driver_probe_nogem(xe);
> @@ -230,7 +230,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
>  
>  int xe_display_init(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return 0;
>  
>  	return intel_display_driver_probe(xe);
> @@ -238,7 +238,7 @@ int xe_display_init(struct xe_device *xe)
>  
>  void xe_display_fini(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	/* poll work can call into fbdev, hence clean that up afterwards */
> @@ -251,7 +251,7 @@ void xe_display_fini(struct xe_device *xe)
>  
>  void xe_display_register(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_display_driver_register(xe);
> @@ -261,7 +261,7 @@ void xe_display_register(struct xe_device *xe)
>  
>  void xe_display_unregister(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_unregister_dsm_handler();
> @@ -271,7 +271,7 @@ void xe_display_unregister(struct xe_device *xe)
>  
>  void xe_display_driver_remove(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_display_driver_remove(xe);
> @@ -281,7 +281,7 @@ void xe_display_driver_remove(struct xe_device *xe)
>  
>  void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	if (master_ctl & DISPLAY_IRQ)
> @@ -290,7 +290,7 @@ void xe_display_irq_handler(struct xe_device *xe, u32 master_ctl)
>  
>  void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	if (gu_misc_iir & GU_MISC_GSE)
> @@ -299,7 +299,7 @@ void xe_display_irq_enable(struct xe_device *xe, u32 gu_misc_iir)
>  
>  void xe_display_irq_reset(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	gen11_display_irq_reset(xe);
> @@ -307,7 +307,7 @@ void xe_display_irq_reset(struct xe_device *xe)
>  
>  void xe_display_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	if (gt->info.id == XE_GT0)
> @@ -341,7 +341,7 @@ static bool suspend_to_idle(void)
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
>  	bool s2idle = suspend_to_idle();
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	/*
> @@ -370,7 +370,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
>  	bool s2idle = suspend_to_idle();
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_power_domains_suspend(xe, s2idle);
> @@ -380,7 +380,7 @@ void xe_display_pm_suspend_late(struct xe_device *xe)
>  
>  void xe_display_pm_resume_early(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_display_power_resume_early(xe);
> @@ -390,7 +390,7 @@ void xe_display_pm_resume_early(struct xe_device *xe)
>  
>  void xe_display_pm_resume(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> +	if (!has_display(xe))
>  		return;
>  
>  	intel_dmc_resume(xe);
> @@ -418,15 +418,8 @@ void xe_display_pm_resume(struct xe_device *xe)
>  
>  void xe_display_probe(struct xe_device *xe)
>  {
> -	if (!xe->info.enable_display)
> -		goto no_display;
> -
>  	intel_display_device_probe(xe);
>  
> -	if (has_display(xe))
> -		return;
> -
> -no_display:
> -	xe->info.enable_display = false;
> -	unset_display_features(xe);
> +	if (!has_display(xe))
> +		unset_display_features(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8ee430c6f8b1..cbbfe75eb2d2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -56,7 +56,6 @@ struct xe_device_desc {
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> -	u8 has_display:1;
>  
>  	u8 has_llc:1;
>  };
> @@ -207,7 +206,6 @@ static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_TIGERLAKE),
> -	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
>  };
> @@ -216,7 +214,6 @@ static const struct xe_device_desc rkl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ROCKETLAKE),
> -	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
>  };
> @@ -225,7 +222,6 @@ static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ALDERLAKE_S),
> -	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
>  };
> @@ -236,7 +232,6 @@ static const struct xe_device_desc adl_p_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ALDERLAKE_P),
> -	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> @@ -249,7 +244,6 @@ static const struct xe_device_desc adl_n_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ALDERLAKE_N),
> -	.has_display = true,
>  	.has_llc = true,
>  	.require_force_probe = true,
>  };
> @@ -262,7 +256,6 @@ static const struct xe_device_desc dg1_desc = {
>  	.media = &media_xem,
>  	DGFX_FEATURES,
>  	PLATFORM(XE_DG1),
> -	.has_display = true,
>  	.require_force_probe = true,
>  };
>  
> @@ -286,7 +279,6 @@ static const struct xe_device_desc ats_m_desc = {
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> -	.has_display = false,
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> @@ -295,14 +287,12 @@ static const struct xe_device_desc dg2_desc = {
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> -	.has_display = true,
>  };
>  
>  static const struct xe_device_desc pvc_desc = {
>  	.graphics = &graphics_xehpc,
>  	DGFX_FEATURES,
>  	PLATFORM(XE_PVC),
> -	.has_display = false,
>  	.require_force_probe = true,
>  };
>  
> @@ -310,7 +300,6 @@ static const struct xe_device_desc mtl_desc = {
>  	/* .graphics and .media determined via GMD_ID */
>  	.require_force_probe = true,
>  	PLATFORM(XE_METEORLAKE),
> -	.has_display = true,
>  };
>  
>  static const struct xe_device_desc lnl_desc = {
> @@ -574,8 +563,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  
> -	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> -				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
>  	 * version 13 or higher has an additional dedicated media GT.  And
> -- 
> 2.39.2
> 
