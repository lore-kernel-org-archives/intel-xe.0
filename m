Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC6CC7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5A910E008;
	Thu, 25 May 2023 23:14:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C212110E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685056470; x=1716592470;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WvYNU5fgOKRorVAcJaqpkuESgZdt5TEC42eNvl5h5mQ=;
 b=akOdZgzMzwG5LwFM0WFvIhZUv6cKp0bAi22mY4zUNhU5W6LaPQCwcSkQ
 LuIaKxOrhfdTACK/ocX3geEzwwY2yAUIyk098iOdXJ0zltDr1/P1Qq10a
 00ciy2a9z8GBZomWJabw2MJiN5zwyNyw71x/zgjHncc4T8BwT6x5XtR3e
 MzAoioiQQpRl3PDObwzQD+6sS+gs9NUG3NOciBiFm7McFoQltbd0ILG4i
 33JKCdVjNEmn62AurjTFNmVW5c04vLtFfZpRpiQue2/rfUL4+NKE7+o0e
 oBr0dn/yNphQYuvhOkLoRGPbgBdNnzi2K4JN8oCqAyLgVgKwZb4k4uLWJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354072753"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="354072753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699200318"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="699200318"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 25 May 2023 16:14:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:14:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:14:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:14:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RB2IzrV0YX6R5N9CCNQrz2rUqDFhyVV9D/BhI50uoUPipAEbszuezigGPDmVsf7mFOq2y4oVT2FWL2vEGRl58O58J81qECiY86fLFzyWpVIjIOD9rEWy9PoSlZhU5p1/Z4DQGGqwe+egATeikHTulyLtef1CGBQ8Nrj6bkJoH9e3SjrWD8w/FzXLtFeRx21GQ7YyCAIURl+mvaffnrHExgEPjWJggEere5vtNcoK1vOaVG2YfY9IcXfREy68t+zraVobN839v2oiJEOkySGlgqzO9Osq2c5hIvz7oO+eM9WKrA1OkKM2/0se+xMqQdS1MYZ++0XBdsCSg/OcpBJiHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqU4XOwpWSBramcirwR73NTkfmhSQ8S2eCtZ3/PD9mU=;
 b=Y2yJV/xF+L0COkzOVZJ0kXBz0m/dJOySxfFFwpoQFgHC0Ae53GjOd65Rasw9TNUSedxORX90NBe9brVhIBlmxaWEMJHOXURb0QUaigsQaVX6e6EfE36ez8io38aycNOoq6vutuOXVHUPtsnOAnW/z/43npgoia18FhUhp/ZVCQf7etRSKcN17AxC8OUIBu3RbfoiLbbJGOBVqjSYFjZ5vmG+kQFJn+SPqLXqs4HV/03/gJ4Yh1QbHnbjE7ZgVPjKvLKmjDIFOu7bsgLYW8g0akZCQuArT2QNBFaLEfzcLmiCnA22p8T1Zip/V5h33ojlmKF9aXuzqu3+Jt8A57baiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 23:14:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:14:27 +0000
Date: Thu, 25 May 2023 16:14:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525231424.GA10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: d022b3db-c9c7-4a85-1464-08db5d75c970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9kRaIfIf//FrVaksmj27NFZBfddHECLVMdi+HmdLFdLoBBiOcvU0SN+i2ciksUaKXW4cl1z2rCwKIZIsI6wqjVHvrAGAasY38vo4CoRw0n5abqbndh7uHM4CXuJcl31d5yJXTGI2XpNHN0Ti9X5AeswHnrPj8Izp7ZNlFU+Vy8LRCELE2CjFzOnmdxRfz5wpr4Tl2KO/8PWE/kbot0eSGHiMSQS6rJ/C5lVcNbO8k/0u1avSVN9eS0DfvwQjRhGak+Op2O0Qc117pVIZq7k0mBLBbaWKjjuyC4vgEs2+OgAu3PP3Q0WQn01k36Og4LsqDh0BB/W+TSuxorTI7GaGNi4YYjk8n7Dm5zhG6eiR1rM4IywAFuiNSxSPOWf5fS+SGjLUxONmurnJNrE3KtuglwiOlnlCfl+wGV/lCsOCDnvq/kLaKC7UKghtqB2yRvBjxPUDx6MEszYuHApq0DGB7YJzgxoSyQGFRGMmfi5gd3INQo2Y3jdEODwKtVff/JvGWMNj6/Wtsc10G3bE7nYJfGippBNvlO8iLV9TbIZTxnMtv0f/u+9MW+61yQMfrrw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(6666004)(6486002)(41300700001)(26005)(6506007)(6512007)(38100700002)(8676002)(6862004)(8936002)(83380400001)(1076003)(2906002)(5660300002)(33656002)(86362001)(186003)(82960400001)(6636002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+qDtDutIPiE66hs/ahPwOE/vwzeMcFA50r+FjyJPH8+QP4fux4PpRwpiaIHI?=
 =?us-ascii?Q?qz+1qXidIFZG5HPwI7fOyOQMQ4ipBcUYh50mySr6nK/JksCm23V2nM5HaAc4?=
 =?us-ascii?Q?MjSUCC9NUifPnhgjEmIEeqGfgPEToSrTFB9Ui2bleSG9NNAXOnPtycM1tf0I?=
 =?us-ascii?Q?NibNF3vivrwiehJ/jweuAkbAjfuykUAa3+Ep0QPYtbR943Nyo9zXprh63cyi?=
 =?us-ascii?Q?G1nyktOG83sy3JVfgE8iHUmhgtkKbO+x6MJNrMjlAZJgt7qdxcJBLl9GNz3X?=
 =?us-ascii?Q?3TFiiWYao5Os1S6ZxsJ7gzOqonTL1+mPRB4bcV3pjqVcdwwdYZPyx2ktBU/p?=
 =?us-ascii?Q?hoeuIvuIoLgyW/48pe5JqBcTh8fNDX1NnbplYXtzC2SkG44BCu/kiw97Jox9?=
 =?us-ascii?Q?FT+A2xepC9REUsCAbW4StgSl0m8Im9uBzftkgsajEVj4fJPZsF0wtQSPJpXV?=
 =?us-ascii?Q?J1vSrTiV0jatDhRXB13Qo8XUbcP2sJJI4Z4hGf2mmW4xCpX2Q7ZoZj0m3URH?=
 =?us-ascii?Q?mKJlaJhTUYTccqxhBUbpS9Y2urjXffkfFpR14TtifRIVBJoE44i/Q4dGoWkN?=
 =?us-ascii?Q?Mt6j40k3pfjoloeyPLRWILsAxrh/z1pLAFwe7yKAMeYYSr8OOKzc1TQWSTwn?=
 =?us-ascii?Q?1y2SRgXoSzGjZ3twL2Qxsk0N3t9NhYK9Ioth3Qeq6hx2HLH8f7y/vzK4PK6Z?=
 =?us-ascii?Q?hdCMtKWeXDGb0OWBp/pdrCUK0vWXDtZ/Vog3TedcTSYkFvKbAydhOJu/Ytq5?=
 =?us-ascii?Q?Mna4N08hCCDlxwrlgjRzNf2PzRjd3w00L+5+aYQcIr4+pt7j1jDC/J2o7pn5?=
 =?us-ascii?Q?qLM0gTlx6iQLIRY1tdHhF7j2jtJuX7xx9/oBIVNoDfEZjz2u8uvT4kOVJvpj?=
 =?us-ascii?Q?x1/3Cexpl8fySyWJOkQF0rkMdjFYzVhIR43VVX/LxRU8XbCVnY6cbu3eZJwb?=
 =?us-ascii?Q?5ATmplTUh/bbglFu4G/uDvgOBEVPd+O9MSAdoT6pymt79+sZIl7C/1kC5Anb?=
 =?us-ascii?Q?iEaQuomcymcunPi/ojalLTbzYJdEUytqDPzhrSfupRgcBC2DzLP3k7bY1KKX?=
 =?us-ascii?Q?GOw/wkSYRCy+cgGLhCDweA7TcmM4Xunb8YulzOUJTzKkPZ2ofBrGJQa3Av16?=
 =?us-ascii?Q?iVx11kzB0kcnifZPsdEsbSi15G+qC712fFxAmOXLvcsqa6aOR6ttOd/6dcBj?=
 =?us-ascii?Q?8wbeWsHx587UnYDx4AY7ADb6d4KSJy5IXGfoLyVviXsQsjLbDOTUAEn43M+/?=
 =?us-ascii?Q?XTPTGo+zi9bSezJ5VUumDhpyIzGWdG1TuMX7HWCRNYNLJghptUhQ40G94py/?=
 =?us-ascii?Q?CmKmtTooFXXUZn19uZzW2U+6wERvFXH+KrJPYD0ZsDV6y8ukM3GYnGRX0p83?=
 =?us-ascii?Q?jOgvjBD2g52/FO6PAmSk6MAflJFx8SZXAZOmYGltXXxDhSX57kSA/MZIpEW4?=
 =?us-ascii?Q?nklavFheUIyapWa15kx2V0ns8iNsfAmdaSWiDg61sIDAc0wmt0KcDTWRkVvL?=
 =?us-ascii?Q?zG7ndpbl1Jjl8YzQsdV7/w8rH5i7yfFDFgTcdyhtQkbmberOpXb9/CNI1c0u?=
 =?us-ascii?Q?5RVFb7HGfWF5xaPZZK3LoD1TCJCWFn6dxKzH+VJKXzGOhWvvg1b+Pij9Yt02?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d022b3db-c9c7-4a85-1464-08db5d75c970
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:14:27.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lm91FI3xNs6vjAUm3QY6gYGyE8QLNqEf/Iuj7nRXIPfek/hpS/KpohyuuNgTVGbsTtATpcOXcFiuF9GAbN7W4fQhPY8L+HGBRCIm1y3z6mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 13/21] drm/xe/guc: Port Wa_22012773006 to
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

On Thu, May 25, 2023 at 02:33:59PM -0700, Lucas De Marchi wrote:
> Let xe_guc.c start using XE_WA() for workarounds, starting from a simple
> one: Wa_22012773006. It's also changed to start with graphics version
> 12, since that is the first supported by xe.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 6 +++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index a8e249205bff..08362db6a886 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_guc.h"
>  
> +#include "generated/xe_wa_oob.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
>  #include "xe_bo.h"
> @@ -20,6 +21,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_uc_fw.h"
> +#include "xe_wa.h"
>  #include "xe_wopcm.h"
>  
>  static struct xe_gt *
> @@ -134,9 +136,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	u32 flags = 0;
>  
> -	/* Wa_22012773006:gen11,gen12 < XeHP */
> -	if (GRAPHICS_VER(xe) >= 11 &&
> -	    GRAPHICS_VERx100(xe) < 1250)
> +	if (XE_WA(gt, 22012773006))
>  		flags |= GUC_WA_POLLCS;
>  
>  	/* Wa_16011759253 */
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e69de29bb2d1..b54f70eeccf4 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -0,0 +1 @@
> +22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
