Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C58C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 23:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D5A10E0C0;
	Wed,  8 Mar 2023 23:58:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3822E10E0C0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 23:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678319881; x=1709855881;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OJWRrMOfu2K1M39WcGLrItFnk1hEtDUR3CWyhnc4hMs=;
 b=cTzdkc6BVWfrCRvjkCL3GYcgBQa8jCattxKdWYoJnn7md+FvmnB+QTCq
 0GOicZFxnzCA+5+T0q1AJFYfHYGoeYrVSGDvUaAnb5YkWwfBiPzcF3B7N
 oa9zsdhNsUin0SAUDMiyG1BGl1ctDzlKjqn1MgsaJgBrvnUE7vlJaqs6B
 N2VaD+Wz38mJteleHIUfyr9RLBtYGcnapB91ElSUlpnSdwJ8MtReBqV/W
 j8c51A39/y1fI7qLIySN4cmLmURmBZjcMUxDz90NLw71uu8ZVgZOI9bO3
 qXd5//ACRUKNd6H/1wbRiylkZiczYOa+vJnN2VNotggHEAC4DOoomUzLj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333778837"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="333778837"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 15:58:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="787336241"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787336241"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 08 Mar 2023 15:57:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 15:57:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 15:57:49 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 15:57:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buwG3mK1YZU27cIIJSnQ7jsC2GCokEOjXWw/ayO2+CUMtk1SlYSdeYnCEJ9m8ih7QN3bAoq+MAQlg1FigBw4lf3Fa157RYfbsrKqUsVcqNSjdHQtD9n4gVcpNzIKBKBt7EEG6NPRCBgWnC5RMI/LZSOWboj3xMuMXScfncx7MPOE2K+GCEU1s7BBgvCx2uU4aJpqrMZMubsmR1JVht0EpnGdmUrwXwG180sH+xtHggT3GFkUzVPmjjRFadry2ax2wLHQG3A/PZGlxdlw/nIdhfzPWkDY7i2YjQBeUde2cnmdT0pR95rEgkkMsAj8k7JRS6TL5XUVCdYar9ysxoQaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhU6SSfKSguDj3a6OjdNsgADIi33nlm7l0wJ5dCHHnc=;
 b=kKSjSPybSQ/6C55l8+7tOPssfxUpuv+z4ce96kqAOWX8l4jyN8uAS1oiSiNyHSnCk8PR6hkJ5qX42WaztfQU/IhZ2clAnPwihBZTu+3NeJlZoTyWS1e18Btl/qgKczvSsN2miZChY83f8wh9vD5S9IBDVAqTDvlUiEkwgL3cLvmETv16WaInQnDl+hGcfNiCki8BVJBTUpb6kb+5S+rMebQqWJOiN05Ch9oKPcnA7kU23m01jFHEujSpJLg1qNPhhP481sY10aKuN7JMVwluwXxYDq5efMsPvLcoNmPonTeFxdFiUOEykSACXGJiFhU7OXoDriMh/22ZLcxECMNxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 23:57:47 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 23:57:47 +0000
Date: Wed, 8 Mar 2023 15:57:44 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308235744.GN1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-18-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-18-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fda2e5f-6335-4500-fefd-08db2030ead2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfmoomLbKl2t9qkWC+6fIKDAvDJJcRjRcVI0ZhdpgRSG15KJhqY07NsisogtaHkN0LZ2wOdWftVD8eNLuFszwhqmE2NsISr8EhctByKdxgVn6Hth8zXqdLN5sPfUjRkjgC1jMC3FjtbGYDcnSUJ6E/tWh3WeRRQbh0k52//3fnuMzP2OAcqGwpfrRLtLkraDMw4AwVMQsIJwjaEnOTo6ji8Jc3p9wM4sFmuSR9+I/gndLzherdxL32d88bVE6up5R80tTNRYxP9JvEA7J+l7ugFFxB1uAt9tVg+jO/fWH4XVePBCRMdl+6tX8uZoxGADtUsaq13s0KfRk2GvCEMaIJUBG5/Wn+Zc362RH3MdqbNG/lnzmNLyafAvnvuN3tDHjzE9WMv63NyApW/7rIAkyTv56LZH5wIIEzMiDUXE2aeEQdPsQ8Wb/sQcJtsDIjXD9ZBCLyJZwNIvFVlkdpcKwVFaZrsIG6VxHFZrzrSizI4UQ1AihWD8iXdymRyu4auucKOlEOC+Zy2zMcYqZFQx0Y2AxEm/gFFYEMQ/zE0rIOvhiVoMTYCS0ZIjtCwBgCKo8AF0QEYdG5CRNDN43gpA1Ipv0TiAGfeGXR8dwd9W9ngOLIx+WDI6ayBm9ZkWJgXq4zMfg5IpCp5Laq38CEqIRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199018)(316002)(8676002)(478600001)(6636002)(83380400001)(1076003)(5660300002)(8936002)(6862004)(30864003)(38100700002)(66946007)(4326008)(66476007)(33656002)(2906002)(82960400001)(66556008)(6666004)(6486002)(6512007)(26005)(6506007)(186003)(86362001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S3DyNQDuoL82ON8p+uhc2BE9V6I8ZKx4ze5vq0Wucby5u7B9bqXWXNZCu817?=
 =?us-ascii?Q?rN5NIyLIAl4K12Jt6kJTHn5HdkSTOHIpoHg6EYOCLYd21O//i1EbXt7Udl5K?=
 =?us-ascii?Q?aRI+tsSQc4e/V+HNfdgjxxSMKfASkL2exF9lMg7H8dnGPzPTQWOiNGxe1y73?=
 =?us-ascii?Q?2OSZ+c6XPlBQ09frgTnSRaTuZ2Q4vaOVPpc+2ium6TnBOmrTKBH3BHv9Cpxh?=
 =?us-ascii?Q?gX0i7faRpv4VLYD+jsnpKix+sR7YLLXDuv1t6idnyQ9crWUmPKlBPwdckE9M?=
 =?us-ascii?Q?A04zZ/zMjaD59k9QEiA67AASIa4XyhwFH7DK4tIChFVpJn9mrJPhHmoPxbaA?=
 =?us-ascii?Q?1Gr4JHDmBSJHOemggjH/PeQYlq+2FCdd3MEBkRtgL9ns3Le5fn3sDV/gy9Mk?=
 =?us-ascii?Q?TfWDz800fKHahgSeO6ktBAA1jaINoXiZNlZl59KD1PRhDHopQEPOIZxItzIT?=
 =?us-ascii?Q?FKuaA66eSy6/v2QW+JNCzJSGhRZ4ZzXqiMueTNFRkhfbRFNjuj2K83VcmS9H?=
 =?us-ascii?Q?Y665yzoqfamcXp8+c5kjpVdeEyDbNc0VXVwINGt0YDo3TIg77fyl7TF4I4ln?=
 =?us-ascii?Q?cYWHb4SNEbaL6U+Qu0Mpx/qgrzD/thiP0mdCPexMdW6uaMLNamMpAn/SFJxD?=
 =?us-ascii?Q?HUu0dUv8x9a1elHwUmw7gHAKLDifI+KtIpHn9J9f0qtwjV2CJ0SUEdWTl7eD?=
 =?us-ascii?Q?z/ziZSr0eZcSsKjK7vcW6WCLmygUhvv6C/cnEMpAZ1tfj5jGlYRqatOqHq59?=
 =?us-ascii?Q?Wwy675IPQMMTmJ2V4gqaKw1qIqPY9HVxcLPFwRGADrvyo5PhtKhiDu0QIrER?=
 =?us-ascii?Q?7YsmC38wWHUW6yQEnza/EXl1l+sx2+cMO7+JlFojpO+RgTK0Kx7OKCu0x7CL?=
 =?us-ascii?Q?9oKnqEg+9Hmp7/ImgBUb8TQ+54L84tOlmkqoNVpJDSFVv5cgrDdvYQz6LjAB?=
 =?us-ascii?Q?xnIx+kUyFLLjTeWI3QeYtlb20zvMnCfIL7Ub70xdur/NDPs+zHo0Bk95AKtj?=
 =?us-ascii?Q?UO/aRC1oeDOT0mxbXGxRQk4OfRePWiEFnei7h9qjGAmqrtPNA4e2fWLqcmo8?=
 =?us-ascii?Q?RJtIJ3FmwPZ+BxP0gojOY7scAXfhV9IqguLYv9Y76MLCkDstqc0CBwu5KKtb?=
 =?us-ascii?Q?MQDXHMoiB+seUNkoDkBxqsLLGiuKrbs5miZi41kiq/hUhWsaGJGiJbKYvYDW?=
 =?us-ascii?Q?uYHZyngVRfXGkdddM/aGXBcTZC55eCdugXjC0w9jUvHFSDaUd7t1SPegwrZR?=
 =?us-ascii?Q?wKvUowkVSRPcmyRuvRTPrYZB2yETWqxtYDsuJYA3YFR5rFUjgzFVqi8octMD?=
 =?us-ascii?Q?1uPkKxT+aICkq7wsGsvsr2C7m8bBLIzZwFUAK0D+NM9nVWubIfLIUjChm+5d?=
 =?us-ascii?Q?yTBoZGtPojM0LBm+n4eDRbPNVjQosyyTcQi+MMMhE9rTazQfKG4p1AqkKE9Y?=
 =?us-ascii?Q?0jRHT3FHMlegxKzmIeqi6Y6W+GTXnE32TwTlDObGrh6ttfynKsA/TT/P5iel?=
 =?us-ascii?Q?nqlZIgHYVC1syWU+p0IDzs8F709Ejfh04xoCJvDzeiTSysOhw+jjShs+JZ0Y?=
 =?us-ascii?Q?d0ZqGcYJPJesX+swwylH1S8ZbCjyJi8nPimzQ+HcCQyswGXTuYASh04aMYKe?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fda2e5f-6335-4500-fefd-08db2030ead2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 23:57:47.5147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpDZK/Y6fT8XvpBqUF+Et2WGnH/RGz3OGnE/J1eVYkP1UhoIzYKZULrXv0P89BoJj1SY0NUdGHMtEYG3kgY2eZ64c0FbT8/sh0bhugrvFg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 17/19] drm/xe: Add missing DG2 engine
 workarounds
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

On Tue, Mar 07, 2023 at 01:24:44AM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the DG2 gt workarounds as of
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
> order").
> 
> A few simplifications were done when the WA should be applied to
> some steps of a subplatform and all the steppings of the other
> subplatforms. This happened with Wa_1509727124, Wa_22012856258 and a few
> others. In figure the pre-production steppings will be removed, so this
> can be already simplified a little bit.

I don't see a separate patch for DG2 engine tuning settings.  There are
a few that we need to bring over as well.

Also, I don't see an implementation here for
Wa_1608949956/Wa_14010198302.

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  23 ++++
>  drivers/gpu/drm/xe/xe_wa.c           | 185 ++++++++++++++++++++++++++-
>  2 files changed, 205 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90c270f2405a..b1ef6ce72269 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -48,6 +48,7 @@
>  
>  #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
> +#define   GEN12_REPLAY_MODE_GRANULARITY		REG_BIT(0)
>  
>  #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>  
> @@ -91,6 +92,9 @@
>  #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
>  #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
>  
> +#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
> +#define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
> +
>  #define XEHP_SQCM				MCR_REG(0x8724)
>  #define   EN_32B_ACCESS				REG_BIT(30)
>  
> @@ -248,8 +252,13 @@
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>  
> +#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
> +#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> +
>  #define CACHE_MODE_SS				MCR_REG(0xe420)
> +#define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
> +#define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
>  
>  #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
> @@ -267,8 +276,22 @@
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
>  
> +#define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
> +#define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> +
> +#define RT_CTRL					MCR_REG(0xe530)
> +#define   DIS_NULL_QUERY			REG_BIT(10)
> +
>  #define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +#define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> +
> +#define LSC_CHICKEN_BIT_0_UDW			MCR_REG(0xe7c8 + 4)
> +#define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> +#define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
> +#define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> +#define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
> +#define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
>  
>  #define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 65f51f1473fb..50e16f18ece7 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -91,6 +91,9 @@
>  #define _MMIO(x)	_XE_RTP_REG(x)
>  #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
>  
> +__diag_push();
> +__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> +
>  static const struct xe_rtp_entry gt_was[] = {
>  	{ XE_RTP_NAME("14011060649"),
>  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
> @@ -274,6 +277,11 @@ static const struct xe_rtp_entry engine_was[] = {
>  			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("18019627453"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>  
>  	/* TGL */
>  
> @@ -297,16 +305,185 @@ static const struct xe_rtp_entry engine_was[] = {
>  
>  	/* DG2 */
>  
> +	{ XE_RTP_NAME("22013037850"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
> +			     DISABLE_128B_EVICTION_COMMAND_UDW))
> +	},
> +	{ XE_RTP_NAME("22014226127"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
> +	},
> +	{ XE_RTP_NAME("18017747507"),
> +	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
> +			     POLYGON_TRIFAN_LINELOOP_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012826095, 22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
> +				   MAXREQS_PER_BANK,
> +				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
> +	},
> +	{ XE_RTP_NAME("22012826095, 22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
> +				   MAXREQS_PER_BANK,
> +				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
> +	},
> +	{ XE_RTP_NAME("22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
> +	},
> +	{ XE_RTP_NAME("22013059131"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
> +	},
> +	{ XE_RTP_NAME("14010918519"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
> +			     FORCE_SLM_FENCE_SCOPE_TO_TILE |
> +			     FORCE_UGM_FENCE_SCOPE_TO_TILE,
> +			     /*
> +			      * Ignore read back as it always returns 0 in these
> +			      * steps
> +			      */
> +			     .read_mask = 0))
> +	},
>  	{ XE_RTP_NAME("14015227452"),
> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("18019627453"),
> +	{ XE_RTP_NAME("16015675438"),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
> +			     PERF_FIX_BALANCING_CFE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("16011620976, 22015475538"),
> +	  XE_RTP_RULES(PLATFORM(DG2),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
> +	},
> +	{ XE_RTP_NAME("22012654132"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /*
> +			      * Register can't be read back for verification on
> +			      * DG2 due to Wa_14012342262
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("22012654132"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /*
> +			      * Register can't be read back for verification on
> +			      * DG2 due to Wa_14012342262
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("1509727124"),
>  	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012856258"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_READ_SUPPRESSION,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +	{ XE_RTP_NAME("14013392000"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14012419201"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14012419201"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("1308578152"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(CLR(GEN9_CS_DEBUG_MODE1,
> +			     GEN12_REPLAY_MODE_GRANULARITY,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))

As you already noted, this one is missing the 'first gslice fused off'
condition.


Matt

> +	},
> +	{ XE_RTP_NAME("22010960976, 14013347512"),
> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
> +			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22010430635"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_GRF_CLEAR,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14013202645"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
> +	{ XE_RTP_NAME("14013202645"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> +	},
> +	{ XE_RTP_NAME("22012532006"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22012532006"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("22014600077"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> +			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /* 
> +			      * Wa_14012342262 write-only reg, so skip
> +			      * verification
> +			      */
> +			     .read_mask = 0))
> +	},
> +	{ XE_RTP_NAME("22014600077"),
> +	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
> +			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG),
> +			     /* 
> +			      * Wa_14012342262 write-only reg, so skip
> +			      * verification
> +			      */
> +			     .read_mask = 0))
> +	},
>  
>  	/* PVC */
>  
> @@ -369,6 +546,8 @@ static const struct xe_rtp_entry lrc_was[] = {
>  	{}
>  };
>  
> +__diag_pop();
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
