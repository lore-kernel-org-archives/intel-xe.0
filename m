Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DA6C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BDA10E008;
	Thu, 25 May 2023 23:17:38 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF4710E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685056657; x=1716592657;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2ayvaf+Aq4RMmRolOOoc3fDuvCuOO49A7k/CuZwNfqA=;
 b=JO5s8VRmVsgZHRDDS+R0rQfxsZn4KYvo66El+mo0ecpZ7eQ4kZJR3zTA
 hRHJ4R0HdiGsdUevOISGcWjg8nJ7hrMzO3xaH9rlXYCl9wi2N9G+AOLh0
 LLQBELKwwN+c7EiDKlIZF0JH4/KvLv5dePSvT8QGQF5SXsDKFNzzBRhZ2
 DnDxOa1i6adCaPTFeBYOKTjqc8zjQgqZEevU2Rwx+XH3mdJ2lrapPnkWK
 HCMjd225bgDEW8PtuKDyKRdD2T6P++Jrg/r2aFjcPtrgPH+GueeGr+LIt
 bX3Zxxd5x/pADh7E2zm8NCrvbfDYzMnC74yaFT5taq4hP7SdcNfnmayor g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333685063"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="333685063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="794866650"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="794866650"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 25 May 2023 16:17:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:17:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:17:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:17:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0tlisNtJMA1P9jmakINiuwO2CxCTUD3ZXpagjAarrIs4UMe+3h0dewmsmmvSCvieMSz8WcZmbvOuYySF1BpS1rLtTN7kEuGMlv7VXt5+VBo8j9C5+VhNljH6a4PyfkQ6xfD+fIOxaABllJbDo52iMOzLKdu5GOEYUK1N+9diYOgpVpc08NPaa0HEftrMEn4spOqyVw4HLG7Qgx/R53qoQCucjIfcP5TJPhY6e7EsMdAkawTAzhxV4Dar88cxz76yZB2pX+lPPE/DRTgw7tyaeobghD4LfvmqlFiCdIFeKEds35JKr9IXjGEWQI1vaABHrisoDTv00r2U7GgY6ooYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmrbAdZjG73YYWPg3i5ttKbk0gzfIJ7flICVCA1Cgbo=;
 b=oLA686u29mZnOW0i5I4EPxRaH+AYggwq0rFP+xKqnPijjvEFF/oowfNc0Hhl8hJomWDj2iIEGDDNPhJkeH02A3eN+wCwPyBu4XnLrdb8cQtjwu2ucaXgxsrjh7ztENURylScAiUekZn+k7j6r0eKYRKVqtUhTCM8yHiBOPOQBCffwUwSRVBiOmGUZH/gJ21wakB/OzFuDJHlvweMKPU77r7FT1J8+yFkbVd+iNoT+u8bMhADe8G8WIujWN8PW4w58yRQlkbRCma/XgrDvWo9AMkx+6pnmMuGq+aaWXqz32Fl5HG3i+t25yp6I0q4v+fgJfB8lUQyw/7EEKNH3mFlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:17:33 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:17:32 +0000
Date: Thu, 25 May 2023 16:17:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525231729.GB10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-15-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-15-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0367.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 05333bd5-4d4d-48a5-45ec-08db5d763758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18yQlbRcRhv0bB66fhyT60+W115/sjUJi9yBIeHpeSmSwtkK/dGOXebshU/5mnz4LrNL3fAV67dMmr6bRaVFZtpgCB87Dn7OIj0uYDJ6Jj8lSONr5T+Qj3Xxfs/XxQov3oQUilBZMUYFHzlZH35Cyi/lu6AFtsQEGJHzkGnvxztODxJ621u8/kgjm153qiKePn++FgA1rzBj1fthILTo6xPHASd5LRzJ63Mk63m5GBTkgrTNJIqr5/6Wn7lkG2xiRN7nBjXvb1KuEWxveNBTaOyx1OZAFVj2XA/hsE6zytgvyXwhD9+lJb9c3OmcHFZFYxma/HkayLfzZ20ZuR71Z2zhxRaZA7JkTi47PGHKr6Uw7WoclM0Fd4iD67Q8Gn3QlkS4C5FNmnRmsQdfo8oxv6jKZ5fjA5NKcMlA4Oqrk1jhUR9LCKk5/vaYwhuCd7viLRbi6RgwU5OWzmtbaOc0Nx25IW+jjCogckJ3b1ozEktOWUwXB9/Vd81O7GBzwv76d8L+zeDpkurOPVwCftbEli3ZfwUkzWBuYmG1S9ZTgqkx9HKqEHYrlRa356nQug7k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(82960400001)(33656002)(186003)(6512007)(26005)(1076003)(38100700002)(6506007)(2906002)(316002)(6666004)(41300700001)(6486002)(478600001)(86362001)(66946007)(6636002)(66556008)(4326008)(66476007)(6862004)(8676002)(5660300002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?09agm1fighJeLVdebnnZ5h3arkPNtXOYWyLwet2nRb5xIV9EIimnUjkGaSs1?=
 =?us-ascii?Q?HQkb77VWtoosc8u1yIWnhiWvid6FnpHqEt7LSOxIGSuvDco/2h7au5V9ZgY6?=
 =?us-ascii?Q?R3zCCpYgTbbHAjkT0xmoDLl0amAVvMi8+CEES8rnJZ4Jnt6gehkPcIi5et7I?=
 =?us-ascii?Q?M6KQZ6fDaDkmikDD6AVgXwtd1pn0SWxUSpaCbPFkG0cTGaUX46PQca8gcMho?=
 =?us-ascii?Q?2tmiEeOPvvAzzs35pLDnsnWhJFrTkrE/gsLPL9YuUnTQxddUllsrQRCkhbso?=
 =?us-ascii?Q?d6DMxEjcn0qDJVBH6y9MJm4x6R3mFOMtTyhvy2FIA72BCtTIaqHj7iPygxcP?=
 =?us-ascii?Q?Nmtn9FDwIi1hkCSc0Vs7baXDZugzdneHpHLZhbvTPbHisqiyk1yLHz3lJaiI?=
 =?us-ascii?Q?hxeXsiRugst+yq3xjdpU1UwAqA1TMAY+Gti7e3gEdcS0NKyEs2/Q9QI9h0O2?=
 =?us-ascii?Q?TJrm/wDfIq2XkfyVPgPRJWOlS8BFYCIvR2tLMlS9Zp2KVnaYeUhyD9mx15nY?=
 =?us-ascii?Q?Vvzy8mfvDZjKkPGTJt0pNOU7VkoDaKi2dqcO6Zb742LAygUZtBdWudyi3rpV?=
 =?us-ascii?Q?8sVa4esCnAhTa5W1IoaVvjjna0OrLPWZY6DPMbXLZ5ICTty/UGniO4JS1hc+?=
 =?us-ascii?Q?MPlhwYOYfPBmOE9ynF5aejjdkyREisQ3PxrUWDjS3JrOkCXSIC3W3m1RYlWh?=
 =?us-ascii?Q?9rXPHbVsIrRKvODf2Ejy6l98Jz1qyy/0TpTQYqYnXyZ7Fd9xZAPWWuIXHeR6?=
 =?us-ascii?Q?r/ev7hLZXSUtPq2XMxM7l7lTpySsJ82PObyBNqAUOQw6cTZh68VQlIWKaqfH?=
 =?us-ascii?Q?RTtV5Pqv6iVhBM7pAKhdmyruDzGHjT5/YbYPN1tyGRC+CoDWu1rNWlbCyoF1?=
 =?us-ascii?Q?+H4inZ0QebBPJWdPaPbZ+Ke4Ul3//fwrtOEnsC9RiWAFUBq+CfLf4kZ2o5b5?=
 =?us-ascii?Q?Ceub9TMNl9wlOGo/V+0zOGRVA9H13NBcrM92b5cwDzBJ1H8t9zNo5tX1bjRT?=
 =?us-ascii?Q?Gzq4J+AyefIJDFw23tIhcE7OXi0Xs+V72qAPtxPsVPScoLSnLRuQ1vKK6xEt?=
 =?us-ascii?Q?PdOIlgp8w/DkOKkfZIyaSIIZ3Re4S6eI29Fm5LBryEbKzECczNgKRj5/w2WN?=
 =?us-ascii?Q?5X20BWoR7LtOCrp9O4k1z0cRMAas7oHXEeqZf5zU8wPHQ/UWIp4UgR7AeV5G?=
 =?us-ascii?Q?H34iwH9usoLW13uKqSmfiwJpd51zwAb07HxJK0/xilR3m4z55AMB1E0RbRLL?=
 =?us-ascii?Q?4PmoZZrZ7WFPDOETEAUo/xzpYNreBeEzI3d4EGOXJ43r0jsGM6ipmllKrB1u?=
 =?us-ascii?Q?OmJTJrAAvt1A0u6uALHfb/mOgKs6+KvJH9fDoi3PhYzwcUrKGcbbVOyYYuKU?=
 =?us-ascii?Q?P5ffmw7x9CTqnw7SLRnM89M9888UDwNys2aFQhrEDmrjQFz2p/NJ9Df2+JKL?=
 =?us-ascii?Q?Fjsns7KMHzZbjA/T2+UwZTJw86IRAnkvtW79ZfW0Ja208vpoO8DXGt+4UMys?=
 =?us-ascii?Q?lvqHcsCWk29ZJw+qK3luIc7Fc2v9NzE6hmvkCo33FurbJg7m9Hfe2UcQcLHW?=
 =?us-ascii?Q?xgoMz2F5pOa+0kLiI0EzQHC1Zpr1WYhAuO6fysXpqtYf/NvpTc58zZNX2tt4?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05333bd5-4d4d-48a5-45ec-08db5d763758
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:17:32.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQmuXM2z34n+Do1HEEtv9LI6506beqUevAEf3W+DW81cS27IYzIPN19xSZ871U5zAxq4DzDJP8oZiPfvCBfQ7vLwdUM3vSAcdlUkae5Dcuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 14/21] drm/xe/guc: Port Wa_16011759253 to
 xe_wa
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

On Thu, May 25, 2023 at 02:34:00PM -0700, Lucas De Marchi wrote:
> Port Wa_16011759253 to oob. Wa_22011383443, that has the same action,
> doesn't need to be ported as it targets early PVC steppings.

Technically Wa_22011383443 is also targeting early steppings of DG2.
But we can come back and prune the DG2 pre-production workarounds later;
this is a correct conversion of the code that already exists today.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 4 +---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 08362db6a886..1b3fbbd74923 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -139,9 +139,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_WA(gt, 22012773006))
>  		flags |= GUC_WA_POLLCS;
>  
> -	/* Wa_16011759253 */
> -	/* Wa_22011383443 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
> +	if (XE_WA(gt, 16011759253))
>  		flags |= GUC_WA_GAM_CREDITS;
>  
>  	/* Wa_14014475959 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index b54f70eeccf4..9b29a0dd0934 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -1 +1,2 @@
>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
> +16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
