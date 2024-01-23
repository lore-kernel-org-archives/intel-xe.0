Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA347C47DDB
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 15:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3406F10E739;
	Tue, 23 Jan 2024 15:37:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCAA10E711
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706024272; x=1737560272;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BdA8KcpQpYmWMTCpNfoqVO1iQ8CpkMrqsYmK80O5/OY=;
 b=iMFhCn0QmcX+BVE9cRl1wxw5htJCQcsDFupU+URU7UL+Ua1CL6jP+uA4
 i2cJdiWCynCM73LsTf4YJHDS7tVtMhw7CIiVoHyJJ2MWgEE+StbzRjyNU
 4hHgAYHiitWBU+6hqR3ak3DMf5ekwzJqV9ZtkKJxdzInfisZSgV4f3dCV
 xBAschmV+ivq+aSoeFt9kFOLvzVGQulmsu4WR9omdzFmzt0BvAY1baOqU
 gFJo+LcYLYCGinYAFbh/Dkyvc7tb3ywTu/HLiFHKK9quGjRuW+Yhr/ZeJ
 7ndkqDqSnFsoYaFDFczEBonP/8thkpP4KXTcaXCP2Ot5N3P4IDhhSDWio A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8924293"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="8924293"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 07:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959159538"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="959159538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 07:37:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:37:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 07:37:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 07:37:50 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 07:37:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R97LhaTwnjGnUJzEYLT2Vz+CzngfOiCvsl1ZYtMhadIXugBPqznHK5jPcVgf7ngKzrZo1VXbLgSdFe2csEAkDv+QOOX5XtCF4vGM7uUcyijHL8FqN1ud/4zqNmWr6qaoUwjJ8SFII5l5y1H/ZoFpH82QCqcfuNPy7OPHgC8Rcn6dYHzdJFdwYgCzgLLBVIo3/QHkvU9YLKfTFBJ5dq/CZAeJ4lIcQ0ErP8maGUIyW4qypxBU6QHD6ouP0o2x8H8wb53wGPKkHRYkdQqPKFEYiWOQXkv3XQbcnRrRg84dY6s2A36/5RXngQobVRRro1jn/6pz1tGqwHpYCVGkYC4O1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLI8KsJZ2Ts1o5hMq/DGMVlk31anDXTpfCvxFV7gkTg=;
 b=EhEF9xnyBUA+EjZ/+/OGcldh/OyAVNr6Dol3rxOsx1oV1FMfsRvwGAphlURuVmeQK4s4X3V1yXv2Bgy4zr4bORYUKNbaodaIrnVY53Jin5lrh1pH0JRNHv8g9qyQap6t+TkXaF7j31getN+rfS7yOneXw8RcCmR1/nVzfYU1Xv0cXeimSSik4453DrPJ4wgyGFD9bMVrPJcA63RuveXpdhIWDl3QcGSA9p6Ova6mNhKxT85DRshDIQXtnBzoPcNiU+Tr56QvgKXSjLyiC+2bue5DZgqOJFQ1VrGPsMZkQWYfrxZQiJ+YPb9EI9cZ64r7ru2YnJZyV2LXwyZBAuUq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 15:37:48 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 15:37:48 +0000
Date: Tue, 23 Jan 2024 07:37:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH v4 1/1] drm/xe/xe2_lpg: Introduce performance guide changes
Message-ID: <20240123153745.GE7083@mdroper-desk1.amr.corp.intel.com>
References: <20240123050552.2250699-1-shekhar.chauhan@intel.com>
 <20240123050552.2250699-2-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240123050552.2250699-2-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BYAPR06CA0036.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6a53db-42b4-4bef-925c-08dc1c29408f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HqvD3gzXpj9Dx/VmXOK3h5w7i6VYSV7jp8bXTe/hbyj9snGH8HiaAg3Z2edjm9WPROhKV7zGWyg20BLOzBUkOfpDl+LhP+6UkT2FWlmJgvIJCe1I1CijDaNEq3k6lGeRMO8arWKQkHjBpRCCBbVWhvzeeyUMmzkNLx1bsoUnURScXwLJM+s9TrOij5JpxB+nqNmW3Ht5eLxLAP5F/TMuAZYjxNQg/AtnXxDX32aTrWcl4ZwSMYYPIrozCIcDVAKh1rNJXtW5+s2aQtXmlVag1ysA+HVSPegdVtQjfdBdS3JKGVbAw+iBaSNkNcs85b07S+DdNd2fP/1mSZsl64WOvC68dsNWLM5rYnI7zMA1Fdexs88M5fz3PstW9xhamWcZ/ahoAC5mfNayj57ro1bTGzmB/6UUOZwNM7DpPB/VtKaULNPbJpN7mMXsqcHMvxWm3YHw8rqF7enyKzo2kiMeFbE7IOzRmXocddMZ9Pt+hlzSVM/qRMxTJNXqewwPXj98VIm1rxdEMsmfILGFahKKgNp1+DDw+T0C7vLxXsGXX7GmYGjukjQj89GbVGS/o4n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(4326008)(8676002)(6862004)(8936002)(33656002)(86362001)(38100700002)(82960400001)(2906002)(41300700001)(5660300002)(6512007)(316002)(6636002)(1076003)(6506007)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vTN+8ee4MxMfs3+naL8pU26W2Wxq3a93DE8RIHiOxTHPJzU0z3juRDDFFMZx?=
 =?us-ascii?Q?VVOpWiopGZIm1cmwtIw5J2RNkcOzcs1E+e3x9TFBN6lUYJFeekspSkzodJLu?=
 =?us-ascii?Q?PCZjAUYNkdsGnMQHUu/4t2OCTYrnWtOaTtALGIWXRQpEd7e7SZzAfQF+nXBx?=
 =?us-ascii?Q?rmzsPbkx4KdiCDJRhn5ehZ6nlD+ZK2FTVgLHx5l6Bro5M1Pm52mIUADjMfM3?=
 =?us-ascii?Q?88En56BeX32ECeAfhSHUKDKp0JyuXl7NnqglMYsCVN1qi7/tou5c3U4uhJvY?=
 =?us-ascii?Q?SyHu09QTUOB7xjNBNxEm9YkO95dNjdJIWTXZpnlceLYak8sCI2PRSjI7bSAu?=
 =?us-ascii?Q?rY44F4KnBWI4/c7/Zo4cs1OqWnp2zjddDUvVVimcFg6N4xhAXlvWj6lSW5ph?=
 =?us-ascii?Q?Xokuztcq+wYidfYpF96oqFapIhzrSjbuNSsTOItUoTzKRSzZxYMpzsVqfQ+z?=
 =?us-ascii?Q?rVpAxWTPcVnDtYH5+YKMfwIzezkfbN8PAG1CDqBxrOZEE6ot/GaxWLw6cHTq?=
 =?us-ascii?Q?wjSS0k1N8lOAvdZZAdDr53ScovLZs/vVEwghhICHP5JVUVYB73nTorJW7rGH?=
 =?us-ascii?Q?3gHVHhvyUuiawZv//J09qNtxJToW9OMo/IGUZrMEwtEmmtBQUUrY7FyAnxVG?=
 =?us-ascii?Q?DSAVFFJBVVLVWV3JRmfg2HGaZ8BMORqBOnxC1BP+bXWH8x0pFOvSpHrPMgIm?=
 =?us-ascii?Q?OTDlDX3DPjUE31top9PimSFHGuLZAWWBg3HKYTjpy4713jNEWPmh/7Ff9BYK?=
 =?us-ascii?Q?0UKowElssH8OKrhNbA+1bKTNcrsw1E+PsIXbWb7sWkUwk8v4KFB+0VATiwJs?=
 =?us-ascii?Q?Zr490DFHtkqGlIzlkK50nS2kSjE/iR+ZUDqRt+elkU7d2napiYMjIqbguQwA?=
 =?us-ascii?Q?6JWTfsVJ/PDPVLWapkt67UtA39+syRazAmkPoNmfE4zTMT98qq+0E6dXCEH3?=
 =?us-ascii?Q?IGOodQ7C51rqlx6WLOaW998+7QaqS5jMuFFhnDTc6+GNrh1PkPax7VvlJ74G?=
 =?us-ascii?Q?LvWZaA/v1w6qimqdeuaNR7HEQ1JVTsxfT2t96lIX5ofW4NXyeaKVyoEgvsMF?=
 =?us-ascii?Q?gLHFB+mCaVyMexW/JQQtz/YXMzps/ibUsfFpV1Ihp/JRsNv2l6YnpkBD2q/u?=
 =?us-ascii?Q?Pj9q5UzwlwmbwuSbc/iqmPiZBK/LbXaxVh7vWCLNU/CNxhM7cToSwFMZ7YHb?=
 =?us-ascii?Q?D9aV7iCYJEuWasiE1Oh/DsKn1AzGrSCNEcadsUG1Rh0ejCwjFMeDu6uaO657?=
 =?us-ascii?Q?4RFfLf2ULWOUNUQ4TaIn6anzPcO2Od6vzARyj7yvMe5QChopl0976FGtWPll?=
 =?us-ascii?Q?31BVRzRXo7IkAhcFfdIwEwJ8zgGuqI8MRON7YI7b7OndLlMDForhUrhQ3dLE?=
 =?us-ascii?Q?y8bno4nYh7SclgA8tndSEghgrC42sM1wBE0XOURgmjrZvrsPj066vDjhm371?=
 =?us-ascii?Q?MBjGAGSw9AiNYA41i5/1+qpilyZ3eUFYRC+2QINOmyJMYR01iRJAyxHiD5+M?=
 =?us-ascii?Q?HC4JN8XCpo6h2lz5MCpIyjhWCbhwGyzkb/XMGI2wT1OVbnSsxiV684kPNGsV?=
 =?us-ascii?Q?X+moGsexrGF/fRFnp0PoExlPDdaA34Q4ZmZ/NeHo/Y/fKuAu9G9hRfdu0v/B?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6a53db-42b4-4bef-925c-08dc1c29408f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:37:48.3320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SNYD7XVD+M2t+/4WqLymr0cdpmkO7yiS/YrL1rCeOgDHtd8yTnuYldj2OndcLZVD3A8mvMhkdqntXGf9UvwNXHytCzdU2eQPUUOrhbYIVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 10:35:52AM +0530, Shekhar Chauhan wrote:
> Add performance guide changes to Xe2_LPG.
> 
> BSpec: 72161
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 9 ++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0d4bfc35ff37..cd27480f6486 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -144,6 +144,9 @@
>  
>  #define GSCPSMI_BASE				XE_REG(0x880c)
>  
> +#define CCCHKNREG1				XE_REG_MCR(0x8828)
> +#define   ENCOMPPERFFIX				REG_BIT(18)
> +
>  /* Fuse readout registers for GT */
>  #define XEHP_FUSE4				XE_REG(0x9114)
>  #define   CFEG_WMTP_DISABLE			REG_BIT(20)
> @@ -289,6 +292,9 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>  
> +#define L3SQCREG3				XE_REG_MCR(0xb108)
> +#define   COMPPWOVERFETCHEN			REG_BIT(28)
> +
>  #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 53ccd338fd8c..5c83c75bc497 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -37,7 +37,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
>  				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>  	},
> -
> +	{ XE_RTP_NAME("Tuning: Compression Overfetch"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX)),
> +	},
> +	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_UNDEFINED)),
> +	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
> +	},
>  	{}
>  };
>  
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
