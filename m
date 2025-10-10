Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1589CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 19:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A723410EC7C;
	Fri, 10 Oct 2025 19:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6r2ASoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415C410EC7C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760123415; x=1791659415;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DlZYcUT0ftkwiPyEILWeq0Oetb+NmJ6UuDm2dm9VqvY=;
 b=H6r2ASoPcr0Tz6rI44FP6t74B+YsxwIFuG4Oz09DxijevpJwW03WiBPN
 Yn67XyssBgTev7f1/7+yy/WI26qcEa1sGD0vX0nCc+tU7erv6LRUCGmLV
 xtrJ20gcXT3aMtmbWFIOJnKO+oWuk0CnGAFGw9reb24wQjO2pbmjU2KX/
 Qpn8J8J/PzPtbb+F+s08q3bVtigqcQFHPL4qPzq1QEIBr4TbQRlfne1JY
 d0Jy3KBJj2QI/6zIfn1BXC0d7zBx2eIrtZFBD2npboPWoz9a+TMPY+QAX
 oKw5tBdozVFPdi5XlJkkX95DfqGBn4jA4MVySiK+l5vRo9YpPmwbaAb8j w==;
X-CSE-ConnectionGUID: fUBiO9ggTZ6q2Z5SeAb/8w==
X-CSE-MsgGUID: dqkonjeFQPOSjweSmkyG2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64969223"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="64969223"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:10:14 -0700
X-CSE-ConnectionGUID: 6zXnriyeTteafb0kSmasew==
X-CSE-MsgGUID: LEzdmU4YQ1OKsfHAH1L48g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181059121"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:10:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:10:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 12:10:14 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:10:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKk69VXIatknh1zfNO8w03iRaFTHD5gNaJgsTsNjGxqg/b5kEcz4OLXXVNAPFozcg+CEdlw1zUJBR7AuqQggzHUvN9BXCFB0D4t8vld0zxCacXWdiSYaUM+qCrjnWmgjuCNuZCG9+gSucAdr3QQwQYdlcuj1nK+JhQLBllsy1xx3Huy7yG9ymOYAmqqYapjGDhS5+t8AtXjO17WyoYd2zLwSK70y/UAD03xuL9lgqT99YOzlwEAf89ia0kjQyu8AU9Au62lr7lTYrbYutXQ1TkiUi39Tqpzjrq4K6ZvnXC4BtrfQZ96RlZ/44heVmAjySV3DTPByNkXau/XXLN5Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+zyJIwSzINfyLgMbyE55KJZze/16PaVitKn+5JOxKs=;
 b=o8k8oTPt1pQkIAaRH55s+RY015UBW5sfeYZ6yOPNal9r+tNlwDsMp4YCBse92KS6pnimZzCvPBP5F0nzqJ3GaICC4YqQxHPoUdJV9mx809bYx1tbGm52EUDFz+/hpOF2rzNSCzRaXMH3mcG8nJ6m+xriTQJrSMDsBqi18ehXFtQwn0qXLeaK2ZNfIrDwkxok/3RLriZyRARhD4o29lw0Itda4+PbgXjp6n8VESuzv5yKOKceVVMX2TYeCD0YT4Ww49OXnBJgMxgMiwiqmhqiJnGd6f+32NCzqWYlHBPqexcN6s3nXVK5d6PLXM8ZIZaVtFsvfqiLmSufIbtiWUcpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:10:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:10:03 +0000
Date: Fri, 10 Oct 2025 15:10:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Message-ID: <aOlaCVZw22eejIZu@intel.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
 <20251009230239.2830207-8-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251009230239.2830207-8-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 631a05c5-8c5a-4984-855f-08de08309df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j1ggXTFHYe3jNJfauPocRHL/GzRIt6HlWlx28soSLrBjj8DghEceq7oBruoM?=
 =?us-ascii?Q?AhasdHZRNH9uPGEnkedjxZRVtDC2JXzx3rC/rOaE0yFoHgNubs0bho9KedhQ?=
 =?us-ascii?Q?GaX8q9anczFsMPpT10EYlrihIY1OYAKHfSeN5xFTkEud+PUT/XeMYGoBpSzS?=
 =?us-ascii?Q?AeCMNiN0ci/K4sQ+6tYbyjo0hGPglHa2LoO7PKDSiwUjJSroOtD4AmZ4liqp?=
 =?us-ascii?Q?PFBS6xGM4Bu2jZX959CkDJqYOCDhMmtO3c9h7IkyPOwvdhA33uVgseDBooxN?=
 =?us-ascii?Q?o/LmKba4O/Jyh7/qqltQLQzJrXuNHQMis/w7Oc53wYJ0OWFraTOS3+XPdLW7?=
 =?us-ascii?Q?sFkhsxWBge2lhGnqRSUEUfROG1H+ZRUQGW63Iyz30iSDFCt3nKhj+x5w+Ube?=
 =?us-ascii?Q?l9fUlwgrygjWLwFdNHDYA0dq1DbMSBoo0Mk6ZIEXepIHbuWVa4USov8DYD0Q?=
 =?us-ascii?Q?0Y5I0EbgZqSmI7/jFWyUxmcEW/mQIfJaGUF3DV8UKbeLgjPBi4Zd/cBRxzW0?=
 =?us-ascii?Q?V0vMi04AVIdxgbILzqIQCP6CxVX4juKKscIoNuVX7hCfruIrAA+EtUgndSGU?=
 =?us-ascii?Q?2dEOz/1e/C39KntdZGxdonPkK9mWrc2oRhEEphb7hIv5bdSnw6Jf9fHrPxmx?=
 =?us-ascii?Q?DLQuYjUwX14aSjJnz7k03z1c10KcyrEwuKzHb0J/48ribC2qrwxFNFo5jjcI?=
 =?us-ascii?Q?OOua9GPmjpdaWpbYJMQVq2vwPlzpM0Lwo4pD2zIZ6oTFjrGEmJlj/qwRg27a?=
 =?us-ascii?Q?zNMDtzyCW7x8ZAFn7sYn2uXInwvgAp94iNshZsDsZEgH4Sb2xhXzr408Mhj7?=
 =?us-ascii?Q?k55m50APiInASbtQhV/paYtQOH1YQcJ/PnWpT81s7Y9rm3uGNtXt2NtuV+KM?=
 =?us-ascii?Q?RuXrvt1TlD1910jGKMHTQgYew9iij5Oy3YwduFCur0ZaWcyjC5UDukP9RKV0?=
 =?us-ascii?Q?udpW9EZur8myx4XZF5Tg0pOSrhZ/cUc83IT1Jt8y5zOmoV3ZOAmRGzebG5dG?=
 =?us-ascii?Q?XRfsZzG5f4DWxBNBskul+Dsp3BVIGojSq9b0/zopJadC+cbvlmfdH8xyMKlJ?=
 =?us-ascii?Q?ZqLLAUhjY8lUufmBKW/tqJqPfGmk4pMR1jOsAme9eDOCbeLy4bvcP5okYM3j?=
 =?us-ascii?Q?koKkzBaiFdbXDd8ceVWc0BnbFTfFKqif8eJkLhqpUQxffurgcIlGFQ8Ln6uB?=
 =?us-ascii?Q?GP2p5IBz6jnpFYK37uJ7mMjQvFBmXc+ofpoL8/gii3J3/IVqFxRsztUOGP7S?=
 =?us-ascii?Q?6ISO0b0+hicNEJwFQiHrslxKYCd3UvSPtGEWBxSdpcRNFOfAT+rno/Ku863H?=
 =?us-ascii?Q?8XSR9sRPAyYHNqh4V/6/cF1mWu4R9SkuEATK+ZDaiMIppy8L64swer0qyNej?=
 =?us-ascii?Q?uwq5Rn8vTv+fLuo8h1CNh+UQ5Lz4VsEBKqE0KCaeHZ19H+fJIDxiussKCQ/S?=
 =?us-ascii?Q?WbhqNmTtRyB8Ai3g9reENtBFmlJyxms8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FanBK3uC6ki0oJp8tRgfRm+d8cQsD6Idzfqgzhhi5IuzFbo1cTer9LDjVpV?=
 =?us-ascii?Q?zWzMPDl+q+GBVba82EPmltehebvb7j9Gg0feEYwBzZATgXyXjqMGUgACYjIC?=
 =?us-ascii?Q?miqO8yrTtcVjrZSAvF+DpGXMIqbCVOu6ShK8rZmDs7c9/q15oK5JihHJ1pCI?=
 =?us-ascii?Q?d1v6p1eKrrqyHoYalNYyVgupgUFYqNLZez3KCexl8tLE6FfcXFTTGxKdlTUJ?=
 =?us-ascii?Q?wlDq+bbQvfe8cmMiZN3vX8/Ik5tYSYmy2zeFGYfM7jWm3lNcGydDPJ6/SC+q?=
 =?us-ascii?Q?nt0D/pE8bGdwhAWe/lhBD2gBtveX3KEwilyYyUE0K3dJJZrrBzM4g5iqgq5m?=
 =?us-ascii?Q?JdLFoxgKmpO0XQQPMVLTOqgHHI9SUSRku7Mhm7WkxyxycoAeG5nJ2M7/BdCa?=
 =?us-ascii?Q?q4PaVrUre+EQsAfdKG0kNh3b3G8W0xs1irtfbsn67kz/4a1XWkzMXbJe61AX?=
 =?us-ascii?Q?0jsDuS7cKPAcTqZ/p4VAyPmh4chrmyCv2bVftWFrQzpeJjsZpjmrjImK38DM?=
 =?us-ascii?Q?yhNqZ0+4nc6mpuBtRffQXTvHKR6o9PQtAAtp/sdT2uVFkv1dcskWdBRfBzHR?=
 =?us-ascii?Q?GO/2GM6lPXbwI6ZirgaKFfKXUrPdMvE8gm9u+KXPxJs54y5Csa+pWgitGOfd?=
 =?us-ascii?Q?cZAm8GB+HlunhXDbEElCUKKmZylTXv0ueLZLUJs6JOB202ZGAE8RWMWIwElO?=
 =?us-ascii?Q?udT5crpIzuphZvIvxGstlVES2Hmd9pCnG2p9cDmzUQb15MsofFpBWKyR3zdZ?=
 =?us-ascii?Q?8OmYzCA8A7oLmp3IybfmCI70HZiNVgVtDBPPjAjfgIIdyyqi0mO94igKkoOf?=
 =?us-ascii?Q?nYMAcDzktL9ej7Ztt1wAYe98navmykhiQPdd94qWtm+DjVjkyr1N3ptQpGNf?=
 =?us-ascii?Q?nIWVO2xApp9kiX4qVaFrOz92gG/ZXtubuYrFgDCOenmAq8gUy64NgeJuiAu7?=
 =?us-ascii?Q?w09ciaMBHffDhV2lHntLWV3+Wp/RAk2EMrzMJI2kjXc7v9rSlNrsSXoifuVW?=
 =?us-ascii?Q?fHxnm4t/StreRGhjG6KI4fvdoRrh+zErblwg70slvnMqc0HPcMf9C5mSuMZp?=
 =?us-ascii?Q?x1XEkoa68nUs6IKzIwGMx+SzBhLYA7hAgr8V3GKd990xaHuWziIYHV9/Rzv/?=
 =?us-ascii?Q?w9Ndm3l55knmDyjB9lwAtz7mhSe3ofVyNg5ig93VQnQ23AJ5S+TrHdtsRWa7?=
 =?us-ascii?Q?VsU9iPj4TPKcUnTYwW9osqnXS/WsPBlbAyvjZ4AY2D4qGzeYJhc+jiOiccpi?=
 =?us-ascii?Q?yQrK+QACoj7Qmy/xJiBEF7UWqn674ebHbWFat+Gbfk7WegsMLx4lVISrJN5j?=
 =?us-ascii?Q?xFVztHyilKwdrKJfK5+VKlOA7u+MwUEXMl3T1KGFeF9+12s6TBp4ajtblE48?=
 =?us-ascii?Q?wkI5myyO3ZZFl7Esf2gSvvu8uOz5EwKu723YLLKUZ5115eg8GhFE+HeLheMU?=
 =?us-ascii?Q?I8dViLfe1i4t1idCz3GNMXdOKqlwjYW8mIjkooHzqhPfWpcM4jz4LYt71nIJ?=
 =?us-ascii?Q?tFrNsNRwIUYzdW/q7oN9ybJ8tLKt7BNHfvl0F7QPMXSxcTW/DsLgQiDB/Xz7?=
 =?us-ascii?Q?jl7VlmI+p7wseH64jN81xo+ydfjOUF3mzFGqQ/X/0OXX+5EBYX5C7yLHiJWy?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 631a05c5-8c5a-4984-855f-08de08309df1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:10:03.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gkt3y7h7SoYJtCgCICL78Z9fPyFxLaYepGsH2rzNmxatu5NAmBKDaB3B4kwz3ZPsaQDxKq4sxx8hJppjdvoBnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Thu, Oct 09, 2025 at 11:02:30PM +0000, Shuicheng Lin wrote:
> The function never returns a negative value, and the return value is
> assigned to a u64 variable. Use u64 for better type correctness
> and clarity.
> 
> v2: add assert to catch theoretical negative or zero stolen size. (Rodrigo)

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing it to drm-xe-next now...

Thanks for the patches

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 9b00bdc8ef1a..e368b2a36bac 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
>  	return wopcm_size;
>  }
>  
> -static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> +static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  {
>  	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
>  	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> @@ -105,6 +105,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  		return 0;
>  
>  	stolen_size = tile_size - mgr->stolen_base;
> +
> +	xe_assert(xe, stolen_size > wopcm_size);
>  	stolen_size -= wopcm_size;
>  
>  	/* Verify usage fits in the actual resource available */
> -- 
> 2.49.0
> 
