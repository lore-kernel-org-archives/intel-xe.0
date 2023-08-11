Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899D4EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F410E6B3;
	Fri, 11 Aug 2023 16:21:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CCE10E6B3
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691770872; x=1723306872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jYpMl8MYBQ1sOS2bTxJx+ILJMXkUzOXzdSwxijdVWAk=;
 b=KEK7QJbu38d1Fra/Gi2zYGp2WC7LlpikO1iP6YazBowgVIfFKA9nliHZ
 ILri3sdAObJ1oBGCfOEjUmZ7xPfVxnUR9+EW5nyGpqLFd+R/eJ3dvFy3f
 J4P0XaSp6dkzcomcMp1K0n7C7z1p2+VdpzLUoEVZjATjMzzjqDfKyAv85
 tblX2j8zdUYaNm9CZc28hpb5Y0csmfbjJlK0DuAKgjvdnaDFBn4dQYOY7
 QXVeh/hp8FvFkTzO3jMwA7zWoHCzO6i+GmUdmK4DBb2YOID39kicfTlnM
 VMpqDvFm++H5mog0EqbrjA2K2BooQtqF3/0+WJ+O9KP6rpbIm9/jbM/jG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402683271"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="402683271"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="762242321"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="762242321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 11 Aug 2023 09:21:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:21:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 09:21:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 09:21:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 09:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKBAYA5zsq89Jps31gk09oJ6mzJSK+uJnJWAUMP+QtepEY583g67xZ0X6e24ax+mq7BVm10gTsVYZS8/PpJcv+/k7J6FzM9H+COntjse5Ht83dZlm0ljihTFkFHssTgc0w2IZDwOdLC0yxpi1ci5MalNp5SvVB/nY0eENH5j2DO8JltLrZwwVJFkqJV7z19h7N7efz61/K1om6Hn36KXX0bRiCfsOLryhNp+1sQd9bC3p0vHpR74evVfBgvOU5hTIGNSiqcI0XjI1l/Qj0PtJWZBqFscFgCFQFuPDoXWIGeiY7MiiJBwt50xWUkA7Ixv7LoZx5DW/F7z7jl03F07+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpGhNwfuCB4zcndr+1+ORWSFDMX+hYkbPN74ScM7fok=;
 b=Tn82DqE5nA4r6AdAimRAol16hUeoFjPi7AsZIgmInTZ5C+alKITdbIUvhKNUKwRw2q2EsfFBvhK0s1UU8oC7fn3B0q5Asmxy5KLrJiLCL9DEzBEhn8VDqcqpKFOhDvT+vsYqg/d1CHnOEPrb3kxYzGVx1Mowo/gJumj2z+0BaD9YGT/mDxMxPL8DR42J8/tjNpMxZgyhY4YXUKhltZYTlzuHTN4mXM+NW+8uvOrmBiZPl00yt42/7bjSrCXaaMpBo0nrxhilWLgyZJBHFoVG2EYTa5PbsFbp0vPeWwt/81mbwdEiVEVNaklLekH9JYtqWvDgfQP7EuuMADhHOtambg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 16:21:09 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 16:21:09 +0000
Date: Fri, 11 Aug 2023 09:21:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230811162106.GF3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: c3712b14-0d31-4599-2ccd-08db9a86f88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7V8m5qXdjksFdtQ3w5D4x/xFB9sBbVHeOOhKlCHw3l30mtbnBwRG1LFQxw7AR1gYSt2D4rgf4e+7oVXIJdLZi1mpFoELVRXGqYnKN1zQqnE641w5AuhYj+GPa5X32pROvAQU/nwNhY3bBtnFHsbw30sHlclPDyTVTDN4WzXkBbWSZRPJjGogkoP/GfAC3TVU0P4DdZV++iIf6uRD80YdDgtV6SIvdFLW1x6ByAxQyrO9vHc/Q055p02+jUqDlP40+77lheYjGCF23QmBWUUFBiYLFCQNjM9e5gHqgpgjhZ3lnx7aeVR60gZf8yvNYwFbfyYREnpBMDxYkSnFVsg2W3BtCviQUhuf6FFmPlJiZUI1AnASggN6eY2o5Kcby+7CNFrSbLT8WrEv9vbjgfZ0xINZjGL2EuhAvg01RHEcFbx1AmRsbRH8l5gFYGNt0wwfY/6yeYm5CIIiuTeiq6mTE5WlzVY5r8DInDhJaC51hdIcdnt87QBJMpjBu4ZphEo5/sYtGqgpIN41k4czqLWRrpeW9mBd3FL1yKvHt97MtlOPtNQaKdmGsiTaS2iQ8NL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(186006)(451199021)(1800799006)(1076003)(66556008)(6506007)(6486002)(26005)(66946007)(66476007)(107886003)(478600001)(6666004)(33656002)(83380400001)(316002)(6636002)(4326008)(6512007)(2906002)(86362001)(41300700001)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tyVOAFx3rz7r1IWnvwhLtp/u/NMr4ZqoBdN7sMlB8/3+RKmcntYwlbQ5S/xf?=
 =?us-ascii?Q?BW8/5XMy0ti0k7hsxtpc9mLZxnYqTj0VdYg0+wT69zVgZCCnMeO2qK8Q7xLO?=
 =?us-ascii?Q?cbIUzGC5OAC71+lh/StrPqAP/izCxILveOmPB5zkzh7mZT/M3Nfo3yOxnGr7?=
 =?us-ascii?Q?U3rb28yqB3YcpY4YiW9zDW3xW/LO8rk5hyQjecxPF2U9fHmfLz9yCe81m4tp?=
 =?us-ascii?Q?CWifqYqy3QQnTAn5FspE14UbSKQRrUXaUwGG+ZCKhnAbKMw7vh7DgPdWzipD?=
 =?us-ascii?Q?gLwbmI9QgoD38Y2IJlnq+sH6TEGNhz9MzQxPqqWz82S5p/PGlxbJkUcBvpen?=
 =?us-ascii?Q?/pPmzmUmpWFQtnXzz0gVmIDeS69UidNnv7WW3fv4r1eeUIqWKf5HvXmmKTtW?=
 =?us-ascii?Q?zFTRa3b/Zpkws3/OFZTR9u+lv2Gjg6Du5adWFE7Rq0t6Pnt7HIwl6JlZOJ2s?=
 =?us-ascii?Q?p8LQYI5XFF3u85DzM1bMW69WbtU2GH2RDzgZ/aalt2iFf0SuLmwjptYOL05q?=
 =?us-ascii?Q?OrwNLn1dNABHUv6tn/39sSCeGa8KrVBsVSBBOVGXCtx25whcjpKaZTWIvNo8?=
 =?us-ascii?Q?3buR6bC19pTFRI+lo9EQZAT7NN41RD4jfohgQ/DikVUs+Wo9Y/YYNwqFttll?=
 =?us-ascii?Q?sgpcPSbkIYsuB7Y5V5e6Uy7vKIoM4Uo4cOoCihc9iWdQPKX197bqfFM8ZBKA?=
 =?us-ascii?Q?f74Y3oFZGx0Ct2bYpBWcJO5jvn8HLunWUUeiVsUrHXBAmUMSrOm+UDkWHzmB?=
 =?us-ascii?Q?hD8lhL9xu2RwUGV4mlDppanVoGYlDEnU3hB7ipHlHy5JqKqJ82b9bo+Ys4bF?=
 =?us-ascii?Q?XdYH9eJkCgIPuMBjEW1njO5wRBCeQTW+k7YadWsEo2ONsQYjX7WqOw29qare?=
 =?us-ascii?Q?4AvCtKOpBk0PsugtY7D6oTJJgYwmZvFTTnm+KTmC5n2p7iyYghdhqrnC2Nc+?=
 =?us-ascii?Q?CR60qHQ8cAZm8UtuAwY0QbPh5fLBl8yEGlQEysN4C0dwkaPvEakhnGN8Vdmy?=
 =?us-ascii?Q?TOE/agMtkd55dIPgfReNHUZFnG6xyssf/HdfTi1ISZocfQNrpU0dkR0HguXY?=
 =?us-ascii?Q?E5MUqW/eMYSbaQ/A/F9gjZwqKWSzDRkI30omRKFHFpTm61eXjMJseQ9HWVwt?=
 =?us-ascii?Q?9CJ32U1gbQWi710q4Fn3q+SYeBw85MC4zvjoT4bbiNCZbj2E3i6+lEKXXVPi?=
 =?us-ascii?Q?99kZ7DAZxkF8YNqe5v0czjgMnMijSk8cPICrkloWaoL7T06j9rIBRv9XulTy?=
 =?us-ascii?Q?cSynb2mmXoHT+GCHTVgux1ItIqTsESBlp6qlmlOnGlAKGFvI5y0vKVk7UQTV?=
 =?us-ascii?Q?0qC23oUjjqODGHzIi5UoKyLemjJBgY1RxNmJeNcQPFpxS209FJ1phFIANaE9?=
 =?us-ascii?Q?q8hU9p5UQu/xe/beKSbV2C/aOnFbBazEa9XH42BAFCycNLd8kMiw+ci7i8Jk?=
 =?us-ascii?Q?dYCqy9jTeRVPEAFnK9C7cZmmqLd+T2rU5pH1VDX09O9kjLNg4L3IZWR0JkuS?=
 =?us-ascii?Q?no8oMbnH7MuMR4j6tGC+zRR2o3UszSC9psb7OZc3Ou0nX9b8PkCwxCCMPuF2?=
 =?us-ascii?Q?HEbO2JMHH8HSvFCBaRMDer32igUQNIlJWuNIKoynmVW/2kkyDZbZvDJCvcyR?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3712b14-0d31-4599-2ccd-08db9a86f88d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 16:21:09.1141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gf1p+PZAg32lOGdByeOfgZaFnEUTWyjiZm8ZLLZET9sjIPZFVfmpuPQYwBd8lWtGfRGI0Z1oQ9vdtrSYXheuMZ3mXw8sKAnc7pcC7jqRBNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/15] drm/xe/xe2: Add MOCS table
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

On Fri, Aug 11, 2023 at 09:06:14AM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Additional minor change to remove L4_2_RESERVED, which will never be
> required.
> 
> Bspec: 71582
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index c9653978fc9f5..d779ab8466d32 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -62,13 +62,15 @@ struct xe_mocs_info {
>  #define L3_LKUP(value)		((value) << 7)
>  
>  /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> -#define _L4_CACHEABILITY	REG_GENMASK(3, 2)
> -#define IG_PAT			REG_BIT(8)
> +#define IG_PAT				REG_BIT(8)
> +#define GLOB_L3_CACHEABILITY_MASK	REG_GENMASK(5, 4)
> +#define L4_CACHEABILITY_MASK		REG_GENMASK(3, 2)

It looks a little bit strange to have "GLOB_" on the L3 but not on the
L4; should we make these two names consistent?  The symbol names
recommended on bspec page 65553 are "L{3,4}_CACHE_POLICY" so maybe we
should just use those names (with "_MASK" on the end) since that won't
clash with the old LNCF define?

Anyway, it's up to you if you think it's worth renaming anything or
not.  All the values look correct so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  /* Helper defines */
>  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
>  #define PVC_NUM_MOCS_ENTRIES	3
>  #define MTL_NUM_MOCS_ENTRIES    16
> +#define XE2_NUM_MOCS_ENTRIES	16
>  
>  /* (e)LLC caching options */
>  /*
> @@ -93,10 +95,14 @@ struct xe_mocs_info {
>  #define L3_3_WB			_L3_CACHEABILITY(3)
>  
>  /* L4 caching options */
> -#define L4_0_WB                 REG_FIELD_PREP(_L4_CACHEABILITY, 0)
> -#define L4_1_WT                 REG_FIELD_PREP(_L4_CACHEABILITY, 1)
> -#define L4_2_RESERVED           REG_FIELD_PREP(_L4_CACHEABILITY, 2)
> -#define L4_3_UC                 REG_FIELD_PREP(_L4_CACHEABILITY, 3)
> +#define L4_0_WB                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 0)
> +#define L4_1_WT                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 1)
> +#define L4_3_UC                 REG_FIELD_PREP(L4_CACHEABILITY_MASK, 3)
> +
> +#define XE2_L3_0_WB		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 0)
> +/* XD: WB Transient Display */
> +#define XE2_L3_1_XD		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 1)
> +#define XE2_L3_3_UC		REG_FIELD_PREP(GLOB_L3_CACHEABILITY_MASK, 3)
>  
>  #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
>  	[__idx] = { \
> @@ -370,6 +376,17 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
>  		   L3_GLBGO(1) | L3_1_UC),
>  };
>  
> +static const struct xe_mocs_entry xe2_mocs_table[] = {
> +	/* Defer to PAT */
> +	MOCS_ENTRY(0, XE2_L3_0_WB | L4_0_WB, 0),
> +	/* Cached L3 + L4 */
> +	MOCS_ENTRY(1, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),
> +	/* Uncached L3, Cached L4 */
> +	MOCS_ENTRY(2, IG_PAT | XE2_L3_3_UC | L4_0_WB, 0),
> +	/* Uncached L3 + L4 */
> +	MOCS_ENTRY(3, IG_PAT | XE2_L3_3_UC | L4_3_UC, 0),
> +};
> +
>  static unsigned int get_mocs_settings(struct xe_device *xe,
>  				      struct xe_mocs_info *info)
>  {
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
