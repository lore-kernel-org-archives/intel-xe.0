Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A82C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 23:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B410E75D;
	Wed,  8 Mar 2023 23:34:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFAD10E75D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 23:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678318483; x=1709854483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0QlDaX+yfZ2J5RoeWeZdLcTj8zJrPDYFilCmJsFXZOc=;
 b=Qb7Neok1cexG8RyxzeTh/ZmO25A6E+hHMYDDzq610HFpCL92MByv7pHe
 LmUc870JG3f+xrk+OSUWMtp7IpytK8wszcwXIUeaH6KWUKafVz3R/FQCm
 8MWUk46Ge/DroZkoAdkarggPjNTJ+bWtM4uH7lQzVyPbenltwfln9a6J1
 YuUJDzOBPvKPJwN/N+EeEooe2QR8spREiT2xgGaS7IZipfNLw+x9422NZ
 AhIsTj9u/yrKqhQlSIr9anYZZQ8ZAEaupCNTSueyRsc4unsORqPD/pj58
 PIjyFcZRaaaldc5F8mqmcQ+zNcp8S+d8rHVPdcjtIYtkgAveuIff4xr1+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422576562"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="422576562"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="746095435"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="746095435"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 15:34:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:34:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 15:34:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 15:34:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVjBqDG1/hvN4ivQNpckRfIXDA67UUaA6IZkmzbI/WYir4BPSdirHCq/Rb/rbODkmNCS6STS7HwbsF5JFei8GM0M8NFuxylBcLJ3KR7uF76LY85+ghfQERC2SGoKKpL1eIOuyYii8FOPYk9B9XVz2zefjJ60hE7T5Kv1wtLKVw4UBnaFDOT0IyENTmY9M96bhhpyrx9MsyUr52dmJmny3E5Fvaa7A8faj3AdMSe2T0HG7UpEKEOVJsjfOXTwK6QTftQo88s947tE0LzSJrLs0n/YCZ7vyQ2oLyogK+wTAfLoXVNztS99eauhjo+OB8rjSDLeLTqNdkzEjB4jQSU5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlhVimTpr1vNHx55b50+zh7EBR2Wg1lYr4WgfeOUQzI=;
 b=Ca6vUH6/SMm5sWmVWg7LIMLHInSvMyuP98ioIJ22HRP4+AG9VeBq/6MJrDiyTEo/rCYdbK7lJWYqDmY3mhYy96ITyXc4oXN2WU04G1nnEjcxxhywMUbP67BwWHnxN5KwzDk/X/ZXPpMPOcik8W1wCK+3MKAYWjguDrcheqFh5R5oba2sKH7+2fWt9WDquTvTUINjMiHB/ZOLDRsWWatn2u5VRQNAAU/z+qJ4NDcYMy2Ab9sCwcEuV+dUPDisqBoFD2I4sNg0ug695eAUPp2+ukewvolN0BDRCPMsEPN7t7l+t0kdXrJ/KKuOklmjbBRuTiOYDEc56dtQcSDTGb7fTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH0PR11MB5524.namprd11.prod.outlook.com (2603:10b6:610:d7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Wed, 8 Mar 2023 23:34:40 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 23:34:39 +0000
Date: Wed, 8 Mar 2023 15:34:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308233436.GM1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-17-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-17-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH0PR11MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3bd74c-c3ae-4c0c-9504-08db202daf6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Y2rgSgwwjJsMhPHY/SlHLK3O2PdWatiN5z+amx7fpimOmfH5OoK6M5oJ03cUD4JjS7ZJmwQvej80Rumyfc+p+LOxk1iRJGCaxH7d4bJ1vLVmG5q5zE9pR80UupZh4tndijvYl055OaysheJYY+ZnXM7O+Zh13G60bvBaeJerd30dR025Ysg/6zxi7MwZm4IcZGZLH7bABh1ZjYc5o/Yd8Qy0e8QVCqvAiTxJyKU63x8QO2Q+Sdr12cXCFmEhOuT4ZLmK5fG9A95i459PSfONov6kDpnV1Lj5S3NfPRFFesXyRsPKCHWusGVUhmLGWgmPqTHXVNRdX84aq8B27va3h/SrZ7guIF93T7DfwLv+EkwryiejKfhRrbIT19CoJko45wcB+n4mQTnHzDsJlOLC7fwMuY8O+bZZl1Ra4wJa5fImM+zaBRL4WGs4mNJyvLFejEb9n/9JZSGVp+Di5FX8UuoOsYchKtGP02ToXmnUv2j5T52zfyjrLa6zMoPV1NqdTBYbYuN85lw3B0IWOvSSAKkFUI5EklCRA9H6HJ008rv8gZwkPVlWCOIX6OP5kUNAB1BnCA3FLRsMeh/pebG3X1iH0eBEFqK7J4O2T9afhuX/iOBpF/s/18Qu5G0zpHQmzFTBFJQFqZoK164GeXmWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199018)(478600001)(5660300002)(186003)(33656002)(83380400001)(1076003)(6666004)(6506007)(6512007)(26005)(66574015)(86362001)(6486002)(2906002)(316002)(41300700001)(8676002)(4326008)(82960400001)(66476007)(66556008)(66946007)(38100700002)(6636002)(6862004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84MtVbPEZqDpJg9kNO8aNbrsd9oTpSEtFvGEAwf9HVkRAkg9NPMLHUMI5cns?=
 =?us-ascii?Q?vyn0KviWauKSQnZtbAp4qUs/yF9zuMv9tTEG7iAyj24eS4rua6AmuVeivLU3?=
 =?us-ascii?Q?i/BwRtF5KGWL3DaH2XGocy/mtP6S0HmbMz2Kf0qsy4Lzbvweks2wUyQgbgA0?=
 =?us-ascii?Q?P065d8khSTYX/FijmLYaXHCxNmarhgx12IufoCaDA5C6V6O4ANDEizNwb16t?=
 =?us-ascii?Q?KSm4HhGRbKz/0qf8Q8MyFDBC+57qUGR0Y2+akYh2jdI7QMacfQ+6NmaFeieV?=
 =?us-ascii?Q?suHOYmnXAZo9l+P3ydWuZrp3sS1+/ecZ4ziK5ZR8P9H3wX87k1F4MHl8zmwa?=
 =?us-ascii?Q?sHucNrf/xbyda6BH/38XynmzQdfgupnwt0LDyyvUCTkg/5wIO/cAVIo47gFN?=
 =?us-ascii?Q?NvMhhhsrPrKUII6MFNspEvVN2nXloOBW2niVrc0OBaZs4IJbjlV1TD8iicvt?=
 =?us-ascii?Q?WIFf8+r0593871vhjbSvoaoCYuDHns1ez7oVd+vDab0KKpUKNM0m2hbqDXWq?=
 =?us-ascii?Q?hYO5i6Om3T7CclfewryTAH2W/Afn0Y4bAeKY5IvDYMsr7ZXVphDejlPrEV0R?=
 =?us-ascii?Q?8iVW5e3NDDvTXoubRaUVHQKt4W0i/vl2yAxzf3WAOI1wF6Jhr4HYdJBXxdZ+?=
 =?us-ascii?Q?Fioim76wmW4nHwFGNwWE1olHNWjXb6O5d8sVFCME/i6r433bKXRn0GrTpNM2?=
 =?us-ascii?Q?zfdq3nXJu1NP4wu7IhVPmkswmMH/R9J6arQLibU8D64d4fuxIOIXsZW6dLy6?=
 =?us-ascii?Q?zKfWTh6YCBG3fZLPloGPkNTpKC1VK9PK+p39vpFUlcD14/C/58NgYDiezM+L?=
 =?us-ascii?Q?PX6KJgpoACr0D1RYluf8gWF3S6GgidC4ivE4vkhSFahBvwxJamK5GZfbNxEx?=
 =?us-ascii?Q?PMmKUuXOTz36OjQYC2jmAkB9fIdk1VP/EdIy9Ddg8tQh0gqEpbO87DzImmIZ?=
 =?us-ascii?Q?VjoFlxV5IddjFRJBi2BKDCr+WUrnJIP05yhKRWS9+2TEXZ4BDVB/LWbQ5zea?=
 =?us-ascii?Q?zIVuzAp9Fzf5TUDiVptgn3OcmR8f5/XZN9jrDfkt3Xa4hIISWs0bLT7xXOB/?=
 =?us-ascii?Q?ySyWT4M5WV1pwljofSghFmGaSLaxSbZZXofS4vygniHbJhfWFY2tHZi00ci1?=
 =?us-ascii?Q?fpVeeuiVu93IwquPYamvwiTWGCbjhe+qJOchB05kMwtVOYj6kVf2ad1Ij6Du?=
 =?us-ascii?Q?thCWJ9MkNpaVgHAST795Kngx8g8yACsMHooO4a8g6BehcJrE2PSHbPr3mii7?=
 =?us-ascii?Q?22nv9ekgVyCV8/m3JuaVRLA02TWIoO3rIiJjYSFbSg1Y5W/TlF9uBps8T+0q?=
 =?us-ascii?Q?/hiToAg+JoJYKlVRXGc1wkkoalFK4b2eGqyjonrMAndeSyDxckHvpFHLn/HJ?=
 =?us-ascii?Q?kjsZ0vMO4i9g1e52E+9GhjRAcfFvYsRt/kl+cjZoFvCl6SI0JE6ceTcr/TJP?=
 =?us-ascii?Q?4/mku9qeZBtTDrPFQxoHTzi4ckqlZD2ILpHv6jwIOGh+9C3dqLHpcy+XPtRE?=
 =?us-ascii?Q?CYBJecbpMxY8ikv3/Fw1bI5s5hPHUUfMyDBdU/HERBojtEb6jDSPclFuPpF1?=
 =?us-ascii?Q?BqsFWvdx92Wce8rx5E2odWRZ8Td1PVizfiSTZvFzm1FalUljyLdyG8ZNyGA9?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3bd74c-c3ae-4c0c-9504-08db202daf6e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 23:34:39.3966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbVuPHmep3oW/WGzcs45MifwLb6mV9SD4U75Nq6tLnRhcSb8BscIG5GTT4hRwOBPVn0poHG+7WvKTQE/ehaxOrTCrRhxBL1pnTuVH8fnl58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5524
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 16/19] drm/xe: Add missing DG2 gt workarounds
 and tunings
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

On Tue, Mar 07, 2023 at 01:24:43AM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 gt workarounds as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 17 +++++++++++++-
>  drivers/gpu/drm/xe/xe_tuning.c       |  4 ++++
>  drivers/gpu/drm/xe/xe_wa.c           | 34 +++++++++++++++++++++++++++-
>  3 files changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index ab9dd70c0534..90c270f2405a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -168,7 +168,6 @@
>  #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
>  #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>  
> -#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
>  #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
>  #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
>  #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
> @@ -222,12 +221,28 @@
>  #define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
>  
> +#define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
> +#define   XEHP_LNESPARE				REG_BIT(19)
> +
> +#define XEHP_L3SCQREG7				MCR_REG(0xb188)
> +#define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
> +
> +#define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
>  #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
>  #define COMP_MOD_CTRL				MCR_REG(0xcf30)
>  #define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
>  #define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
>  #define   FORCE_MISS_FTLB			REG_BIT(3)
>  
> +#define XEHP_GAMSTLB_CTRL			MCR_REG(0xcf4c)
> +#define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
> +#define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
> +#define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
> +
> +#define XEHP_GAMCNTRL_CTRL			MCR_REG(0xcf54)
> +#define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
> +#define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
> +
>  #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 2861a014c85c..47b27dccb385 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -16,6 +16,10 @@
>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>  
>  static const struct xe_rtp_entry gt_tunings[] = {
> +	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
> +	},
>  	{ XE_RTP_NAME("Tuning: 32B Access Enable"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 6931efb3b7bf..65f51f1473fb 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -132,6 +132,14 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
>  	  XE_RTP_ACTIONS(SET(GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
>  	},
> +	{ XE_RTP_NAME("14012362059"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
> +	{ XE_RTP_NAME("14012362059"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
>  	{ XE_RTP_NAME("14010948348"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
> @@ -142,7 +150,7 @@ static const struct xe_rtp_entry gt_was[] = {
>  	},
>  	{ XE_RTP_NAME("14011371254"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> -	  XE_RTP_ACTIONS(SET(GEN11_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
>  	},
>  	{ XE_RTP_NAME("14011431319"),
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> @@ -172,6 +180,13 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
>  	},
> +	{ XE_RTP_NAME("14010680813"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
> +			     CONTROL_BLOCK_CLKGATE_DIS |
> +			     EGRESS_BLOCK_CLKGATE_DIS |
> +			     TAG_BLOCK_CLKGATE_DIS))
> +	},
>  	{ XE_RTP_NAME("14014830051"),
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
> @@ -180,6 +195,23 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> +	{ XE_RTP_NAME("18018781329"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
> +	{ XE_RTP_NAME("1509235366"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_GAMCNTRL_CTRL,
> +			     INVALIDATION_BROADCAST_MODE_DIS |
> +			     GLOBAL_INVALIDATION_MODE))
> +	},
> +	{ XE_RTP_NAME("14010648519"),
> +	  XE_RTP_RULES(PLATFORM(DG2)),
> +	  XE_RTP_ACTIONS(SET(XEHP_L3NODEARBCFG, XEHP_LNESPARE))
> +	},
>  
>  	/* PVC */
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
