Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88889C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 21:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E55B10E52C;
	Wed, 10 May 2023 21:05:37 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9623510E52C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683752735; x=1715288735;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ce+yT3/erncJ/Prl5PfM+2tJ4TgTpEbMRsJJOpvmGEI=;
 b=PgUFQR8sZMAnQ8mZ73TtmcyHLrLHlmfy0PKgKjWLcYkOXQR2j885dm1X
 aAjFZPwQphKw13s52vfPQFjWvJAvrFtDoLnA8uqdLSsWo2m/0FpyBITOJ
 wyxXi72WsF1xOXbE30bldRoiYnThiLGVhiVrAwri/lZ1WSSXHHYXd4WXM
 M5ZiIqQPi77aDiKn705KsK1yXuQAvFP3ctoNgCwPZmCKYYte1omUFctUn
 Yz469hfiqzZyP8ET4Mg2GGZYpL4mx/rtHHOb1ozLdS7e8cQu16PFlK7Gu
 JIu8sw2IAApk7XVQStziH0nGpNWnQhjJRoD2kU880/Pl/VxQyYJ5+tPAH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="413635677"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="413635677"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 14:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732290800"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="732290800"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2023 14:05:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:05:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 14:05:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 14:05:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 14:05:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mByQUn3z9SXmnRw2zmesdqtZQss7jOc+u2lBIdEg1AdEFU4XeAzw+63L9GRQ//GmMz5GJd2BsbDXXi4mXrDEJWrDoZDPJ0F/cLOFRT1/9ew5tP+EIg+N2OAt/nzAd3vUSotPL8BNilacOr9C6ZZ7DUcELbct4IpzFrK03EGmgNw7NpvSd9oPUXcietktNuzrk1ltJxvxIdrvXqBET1JzlNJB3srN2tjLBUZvVY/tiacvkw47/nqNycrl5Ouare4j9s/1gqWg79SkDkn8oUHBFBSeJvbS1jxr9ax2IR4Envg4fUa8Cvhz31WYf7nvuKHgEryOUytiynSpNwO/6j/rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iruwhBWuBTodG3GiCwfuY6w8gJoNA5p7Wu3gSvGlY6w=;
 b=LpCY7PCoGlTY95gFYJQWcmEMKK4GRtb1cpE6M4hGNUHhFf2Tk5lWEs1Lulp2eNw97zaWD2evvxjlhz+tvt6NMeXXmFcrGCZWi2j0sY51Hfua4mLMrNciwXLnH3u5TvrzyQQvUppe/6ct4USUSPiad75pOq71R3gpse7Pvi/aBAqpYiM9vOiQ3IseCbWPv52Nb1CKwi54xZo6UGeSqmkfKB/V4fKv5uP3Qo6xst1Wl3WQPI8HdnmmkEV8CnEk3Yx0s8+JGMNu4y9zsNlJrnedl92o7fzmHupxBjhQPG8GnWvGqHI+Ed2egK2A/qrll/QE3azk36Aiqiex4JDiyHcCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 21:05:27 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::e585:1863:208d:7e7b%4]) with mapi id 15.20.6387.019; Wed, 10 May 2023
 21:05:27 +0000
Date: Wed, 10 May 2023 14:05:23 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZFwHE57LReb2mWjV@msatwood-mobl>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510195424.3045127-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: c58f20dc-0858-47b6-0e35-08db519a4746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T90rztLkGIj9j/S4Ps5f0DzcDBZPem3CvqJ5bsVMmqs4xpxAF+2k95/OkrYoJMeqJJ/nanKYPFBoZfxPZ+jUSWmxOQuGcnzmuOz3+4tNCUeJcOYuwiZD7Uj7Gq3iEP5s1LjB7rsSNa+AkZYU9fd7zxZJGF3H2yG9I4pNwvJqmdAUxCMfral2SNelqPRxLvDekTjepl0Y6UwsAL+6wZbwQSkqDUwt/SF5y/WPH0e6OL0eGiTX6qvshVdmGM7yTTGRc4CR66QLVW+1FGy8SWEMpTSelaTzbjF69Pal+rP2TjlQ6PooPiBFAqWvlcktNpmkMmm4Ih9iTHn0fwvxT6VTLAUfpfuiE25qqpXfMRc82Bc9f0jYoGZQoN9puDb6u5FO/vWXWT7yax70CEEHdJY2USfyinVGACbIvrFkBBo91xxzYPBM3u7dQetxoNYLk2I8IhInB6dtX8seOuC5A6lGPYkzjg1U92MktV3m2hbBrWMEhsEVU8x8AIBLninppjz4pQcWTAXEKvE1/xPnPo6IwxI418j4L8KlCrP5UP933goBfOwpqv1oV/kfF9NCOGOp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(83380400001)(6486002)(316002)(186003)(5660300002)(4326008)(66946007)(66556008)(82960400001)(66476007)(2906002)(41300700001)(6666004)(86362001)(38100700002)(9686003)(6506007)(6512007)(26005)(8936002)(33716001)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlJ0aTBDT3RMOVp2WUh5S3V6VTI5aklHQ2hmTS9lSG1LK3lKNWNJZ3E1OGV5?=
 =?utf-8?B?c3NrVFd4VFdrK1A2eHdCMmRvelBMSDlXUUpBVkNaR0U5TURiTkE0TFJIUkxO?=
 =?utf-8?B?UkgrN0oycWovLzVLVmMyRlZIWEd6bUdUdXRha3Q2d3VQR3RReHMxSGR0RkFu?=
 =?utf-8?B?cktabFZjbTluNEJoTHVjRTRDNFZOQWhqUk5tOXFzbGlCc2VXaFlDSGNiTTU5?=
 =?utf-8?B?Vkp4RHp1azdNMXZIVDFPZS9zQStNejFHZlBaMnVpM2dtWFZRM0NoSEZSa0d1?=
 =?utf-8?B?VDlUcVY2SkM0YzRSOGdiQnZQaWVWSCtYOWpaRS9JZXFFUGtWNGJNdkVQSmI0?=
 =?utf-8?B?ZEdYWnd1cnZLZUQvN1FxY1lsWU00S0NOZnp5UDhTZUgxcEhuRG11dEt1UXFB?=
 =?utf-8?B?bWFuc1RkM0V6M2pGRHRnVjU0ZlpYWTNoM1NIeDUwV0NiMDJLampDNkxzU2Jt?=
 =?utf-8?B?clplQlljY044bW9jN0xGcXg5RDd2ZnRuWVRSNFREbWMxMkpvVDBMNCtORlZM?=
 =?utf-8?B?eTZEbUlzTElCYTE0VmN3ajljSWd5TW51WmxxV01qZ0hyYVJnMlpCRmkxemhs?=
 =?utf-8?B?VHpoZUJYR3lESnNSdFVvZHltbzA0Q2d0VmJLaW5aSGtaSzAxMlI4eDU0dDVu?=
 =?utf-8?B?blZ4dEMvcUN5NzVjcFkzY1dvNEpsWnBmc3RHRE8vaDI3bXpSZk1kS2h4cHZH?=
 =?utf-8?B?SVpuU255NnVDV0txVUYwbk41eHA0TVMxZnhNdkE1QnlRdWQvbDhhSFpQOXNX?=
 =?utf-8?B?dWFqVkRXN3hQM21XRC9pYXQzdGM0aDFFUmZSWXdwemNMemQ3ZlZnOEhoWWEz?=
 =?utf-8?B?eTg1T0JqQS9YenRhSFJLRHBnbXhQT2YrdGdKS1BnUFRmTlZ3NCsrWGpwWmJv?=
 =?utf-8?B?a2RMbnprZ1J3R01lU2c0MFU4SmdOcmx1dUFDa1IzOHJkR096TGlIY20vWVhM?=
 =?utf-8?B?NWpmcExaMXBwRjhKL2J2MEY0bElPeXRYT0QxUktSNlJkckc5azJzdVJsaVQv?=
 =?utf-8?B?ckRIVUNVYVgrbmQvYlBkYncvZzdDNlBiV0YxNW9GYXpOWWwrNWo4d1FhSUJR?=
 =?utf-8?B?WGMzODR0K0oyOEVOMXBSWmVpUStTTU8wcjNHbTVTRVFoZ2xqMzNUSDZSQ3dW?=
 =?utf-8?B?K0FHanNMV0hzeXhqRkZsenpQVFJzTmpCTE9CRkVZUmJ5RVVxVUhZeHZyY1Rl?=
 =?utf-8?B?Q3Q0bjdITHJEakJuL0s5a2t3ZXY4SnVjb1VGSEhoUTh0dm5sRTlVL3NFd3k4?=
 =?utf-8?B?ZVVXREIxQm5zUHBOeUd0N282OXFaR1lEUExKbHFWNXlqZW1jUjlTdk9vVEZL?=
 =?utf-8?B?YTd0SVJIL0dFcExSVEc2VnArWVY3am1TTldHTnFlWk5HMzRHRGlhaWR0bDc2?=
 =?utf-8?B?Smd1MDNkMlpKZ0p0SHFGWGozZ3BYZ3U5eHdURHVXQXYvL1A0U2JlVjFEWHdM?=
 =?utf-8?B?M201TlRySENkY2E5eWVwSExId1ZGR291YUFYYzkwTDRxQ2V0aS9GbHVvZ05Y?=
 =?utf-8?B?TEtRQTVMZVBvRHZQYVlzNXdZQ3hCRXVIK3I3Umh1ak5Nd3pORHlXWlN2bWE0?=
 =?utf-8?B?Y0lXTG1SNzhuWWl6UTl6WkprcDJZdkViTS8wV1B5YmZ1SnA0L0ZWSExHbjk2?=
 =?utf-8?B?bFpNZTMrN1AzcE9UMlJwbHo5SFY4Z1FsSEhTWHlHeXh5T2V3KzlvK3NoZHB3?=
 =?utf-8?B?QUUyakEyc2ZRbTNKU1AzSlNLUUZvdk5Rc0ROamx3ZWlMb2xzcGpqZm4yYkpU?=
 =?utf-8?B?K2ZjcEQ2VkVIaTROTU9sU0pFYk9OekNkR2ZVNDJnYzFnbjdwd0dBZXhZdU85?=
 =?utf-8?B?OXhicm1reFFjeFJXSjdmYm45NzF2OXJ6anplV3M0VlJPNTBOaHcrcXZXbDBB?=
 =?utf-8?B?RThKSjhTTnBONTNjOStndHUyT2ZoeFB4NHBVOEpPcWl3dlUwS2h2WjdoWFNu?=
 =?utf-8?B?MklEMlVGVlFYWExTeEdxSjdvZEYyQ2cvcHBsRS9QeTFHUCtPTHR6eGF2UVFD?=
 =?utf-8?B?V2NwOStxaEJmQ09nK2gvdDlUTmRyV1BuUTJ1VXBuN0hSMi9QN0c5QldTY2cw?=
 =?utf-8?B?cHJDUXh0b3F6VUhhbFNKbFczaFFpYW5YRTJ5R2Z6VTNNOHFWVWQyd1lPWWZ6?=
 =?utf-8?B?VUc0WVdqcmVUYVdOVUQ3bzZmelVZZ3VFYk13czNLRnhKZk4xNGExeVRrd0ZZ?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c58f20dc-0858-47b6-0e35-08db519a4746
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:05:27.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A94HxiX/UAkahmaNGVk7RZRm9c0GKZWVNKI2lr8sZIpk3NAIFY5k55+LyzLsu8SbMvOMspT7QDqLSHe44Yaly41XduqkSpwVQfv8LMV3Zvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: Annotate desc of platforms with
 display
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

On Wed, May 10, 2023 at 12:54:22PM -0700, Lucas De Marchi wrote:
> Some platforms don't have the display IP. Currently those are PVC and
> ATS-M. For PVC the current initialization order works as the display
> initialization can check by platform. However the display side can't
> differentiate ATS-M from DG2 to act accordingly.
> 
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a6858fc7fe8d..7dfbc4fa138a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -52,6 +52,8 @@ struct xe_device_desc {
>  
>  	u8 require_force_probe:1;
>  	u8 is_dgfx:1;
> +	u8 has_display:1;
> +
>  	/*
>  	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
>  	 * already determine that from the graphics IP version.  This flag
> @@ -179,7 +181,8 @@ static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_TIGERLAKE),
> -	.has_llc = 1,
> +	.has_display = true,
> +	.has_llc = true,
>  	.require_force_probe = true,
>  };
>  
> @@ -187,6 +190,7 @@ static const struct xe_device_desc rkl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ROCKETLAKE),
> +	.has_display = true,
>  	.require_force_probe = true,
>  };
>  
> @@ -194,7 +198,8 @@ static const struct xe_device_desc adl_s_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ALDERLAKE_S),
> -	.has_llc = 1,
> +	.has_display = true,
> +	.has_llc = true,
>  	.require_force_probe = true,
>  };
>  
> @@ -204,7 +209,8 @@ static const struct xe_device_desc adl_p_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
>  	PLATFORM(XE_ALDERLAKE_P),
> -	.has_llc = 1,
> +	.has_display = true,
> +	.has_llc = true,
>  	.require_force_probe = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>  		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
> @@ -220,6 +226,7 @@ static const struct xe_device_desc dg1_desc = {
>  	.media = &media_xem,
>  	DGFX_FEATURES,
>  	PLATFORM(XE_DG1),
> +	.has_display = true,
>  	.require_force_probe = true,
>  };
>  
> @@ -244,6 +251,7 @@ static const struct xe_device_desc ats_m_desc = {
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> +	.has_display = false,
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> @@ -252,6 +260,7 @@ static const struct xe_device_desc dg2_desc = {
>  	.require_force_probe = true,
>  
>  	DG2_FEATURES,
> +	.has_display = true,
>  };
>  
>  static const struct xe_gt_desc pvc_gts[] = {
> @@ -267,6 +276,7 @@ static const struct xe_device_desc pvc_desc = {
>  	.graphics = &graphics_xehpc,
>  	DGFX_FEATURES,
>  	PLATFORM(XE_PVC),
> +	.has_display = false,
>  	.require_force_probe = true,
>  	.extra_gts = pvc_gts,
>  };
> @@ -284,6 +294,7 @@ static const struct xe_device_desc mtl_desc = {
>  	/* .graphics and .media determined via GMD_ID */
>  	.require_force_probe = true,
>  	PLATFORM(XE_METEORLAKE),
> +	.has_display = true,
>  	.extra_gts = xelpmp_gts,
>  };
>  
> -- 
> 2.40.1
> 
