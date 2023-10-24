Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55214C07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5F10E0A4;
	Tue, 24 Oct 2023 22:17:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D310E0A4
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 22:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698185875; x=1729721875;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1zQZwudpAChRQp+BFQLJnRmFkZK4zm5ZRDq5u/rT1ug=;
 b=EOYi7uSmYkn94rcyU9rfKOxjGBwEfwJQeAhuy9j/U4RaScg6CcBEl99A
 dr83THIl0wFSBbTYZyxu4TYH+0PvqOWGsSy+kX1mOm9rgY8CXeDe6fulK
 ZXBDJDovbyP2TgWAunFTsb20vyo7jl09jviUWq8C0904pde7k3xqvWReh
 wyXqtSJ9r9z9UWjE4IbasEjo5SvD0Uv8xRnORHFWoQM46CIT6k6u/yucb
 PMxg4ZLOczbr/iwZxvQ/VTgZp/NGPJtOBIkXmyJUCdXhe8mFsFg9QCxRB
 YIv79AFawhN2Hjj4E74AbSkVRe/fTR5qYoMoKoDBbRaql0jCJaiPYV4VK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473422333"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="473422333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824447706"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="824447706"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2023 15:17:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 15:17:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 15:17:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 15:17:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 15:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLNy0Ayjd8mncIPKGLkupAwUlUDDTIx3jGx488Vtp9sCvgvJQXDGZYVP0gcdVLphw5g0jEdz8eoTcn0i/hniecKzT+h3GUGiLQRS+3HQAENtSZaYylK7AEJxleHf/aSV6+yFXeleUKHB1I9pYTwdZAIsL6UJGIELZ+cg1EkTvCVkJbLq/EHFbh11Od5iqhZEQqoVcYwwYthprDUgWRHxPoaUWH+xD2SPTuQJkM2V3LuXDi4BxagVhSdBRA3iZq/IZWeoXS1AYel41EgLfEaZZTEKXHfB+WNYSrm1zyiQ7D9k4ZtCLvKBSLL3mNUjSNgqFR6JGNfhFSw8EHBFQo9OXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkaMoX+m2zqMvh2dXZq6heBxFdmPm2kwMfeMrZnZ3Jw=;
 b=X7eeHOFY6mbZvMKFU9XqAE4/26t82UrG7zxUgATUY36eXOkdmp/AUSFXCxMP7DpMN7+cZW/RgXGigqHWxlAm5mZQLsgSSvzgu7fvO0U0TFpmrdx3gIzfc4EZTLn9Ow7qCg3aO2vFc6P1zf4XweImAH8FYc1dzqyYSvgWBWryAsI3Lpnvg8NCpqJ2jukI5au4NIVgOdQZ+zMqcWcgEdTPe0qTch5jsUQw5DX2TcRgYz9JCVxmuPk+4AkNkC91aT8iGK6+iDjEwO+N9rBhj+tF3N6bj3b5KVryz0kk+qxURAubGmgbF2iqTmAjYGTTv8goacbLHMMYiFTbSaJTXcnkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 24 Oct 2023 22:17:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Tue, 24 Oct 2023
 22:17:48 +0000
Date: Tue, 24 Oct 2023 15:17:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231024221745.GW5757@mdroper-desk1.amr.corp.intel.com>
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231024220739.224251-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 09550949-03f7-4316-5671-08dbd4df0e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1fOXX1g66yd0gwOlqfNiMhrpcy+kFiUWw2d20TJpTd/vbQ1PChd1OD5ZeSAHv+FcCj0tHEMuNC/S2C3UqgdM/bOen5Z/OtsIiCaNXkT4WzfBt7LUZjsOzezBp4rNa9JfCfDfbf06CH41EcG08nRPoaQGJAD032p4dVEf4HTQ35pYx99yqGKMnri7gD80HEaPeJfJN6lgC58xOy/KW7zwyYnA/yv+iJexVpspAenVidRUnU0HLzf3iqrufYdzsBQ+wXXsmyuKmjIGWyqcZuJpV226uzSLOwTJpW9spWqwGOKRaTGjJhSf15CK0acyVqwRwPo7FB6Oc2/TJg1sKCF20ehowxf8jYyuW++kOjjK2Gu/BCyMd8Rl+aJc21VcOIJULzkxNFEjDZpfUovALQUdNbTx/vrmmPpNEqHSPKHNm3M4iBRlrRsPStLCkaVeZxTAT2JA2bTIloGR2W2A5PVQ8WPVxANXX+8w2xp0Wwh69jiyTfsQ1mSkkJFlidrQBBth4LXK3UcqaBwuXO8+N8aPaJSgrjzvh+BxDSf+yqrlvarAIhMYiqOGCN4qvJD3AVxV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(82960400001)(38100700002)(83380400001)(33656002)(6486002)(478600001)(6666004)(107886003)(66476007)(6512007)(6506007)(5660300002)(8676002)(4326008)(8936002)(6862004)(41300700001)(316002)(6636002)(86362001)(66946007)(2906002)(54906003)(66556008)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gx1mdqf7N2i2xJeeEzWXqvLEGb6Q38Q/3FpxyQ8OHdbrwU2njdLr6rYznUxd?=
 =?us-ascii?Q?YCRBNvmSxJhGRQ7amlZQehIoMZDFvZa7AwCc5M1CW9vlRq2WT+Vxkus61/YH?=
 =?us-ascii?Q?faimBisKJjjQhNHpK0L5YN9c2aJe0sloJ6LVvs/wi1CKaFEAAdX+XJ0W92GY?=
 =?us-ascii?Q?ua5UIVf/9mMOLQGEKNrBZQTZbu0xrSW5a2HGQ+8ydkXar0lHIhHu2xpUrgQE?=
 =?us-ascii?Q?+3qS/4GKvh6omjG1ARMxYrDKv5qu2EvhvfnRyRabUKFVGkX6iRFMLY9DSCji?=
 =?us-ascii?Q?vsGJsLQT5eKKNVCvcys8KLUzsIzn7fTcmwJrUhrTZbFHCU1qyn9Uh1Qe8piP?=
 =?us-ascii?Q?oLndy5p7ZPOSG7lJ7Tfwi2HIzJxY3pp4QOj2ios1HkqlJ7R7NoUrakq7XhNz?=
 =?us-ascii?Q?3/SGAf1cQc+xO5s6RjduYCB13x8DAYDbvPZXWRg/I+gMTDJfMVbDNx6CkzZ0?=
 =?us-ascii?Q?7EZxh4LM3jGCqjPGWqSydhFvgAQF5saXdSa1xrfJzcreRxcewCuoSGDMG/yk?=
 =?us-ascii?Q?6KMhwyJgQbcld5HtVx5i7zYrBOH7lr79liBP2KskCzVyNdkm2RR5XYokIrck?=
 =?us-ascii?Q?ajdQuwEePebwYe3AzwxxwTUOyluA1A3hTpNxwiA9bpjvnuoMB19M5XZRw54G?=
 =?us-ascii?Q?Mvn4VoRcXQ9Vog6xkHHTf3HVrw4XlkALM1KTCm5oVRfvSBVeGK2easHC6iER?=
 =?us-ascii?Q?X/skijWY4+7EQX62Rga0t8q/bq0pXr0CcfMQf3QqmvZTG9yS9JAXpAiqQzbh?=
 =?us-ascii?Q?jy5zmcMPmjob/q5XLxxLsuhfjyVJ0itr90lztojXQlZJDoBPpCKySUrX5X6a?=
 =?us-ascii?Q?MNfewhMftpArur8z+Ndi0ZhjIc9wxMsU6EGX6O8FiiZ6Qfp2/3xzCO4cJOSy?=
 =?us-ascii?Q?6WyGIrp2Nwy1IAULKm85UgSCxdhOLp8j2cgVuLcubAA4Lt0QgLb+Cns+6mPY?=
 =?us-ascii?Q?I4QnjxTfS13MsHZ5XHCe/TLv4UDsrcujMDiP7y7TaLopMPqGI6YoWjS66Ype?=
 =?us-ascii?Q?jxNKbEgTYf+j+S6dOChBQK2fqJ0TI/QELvGl5hMdZh6sA8hOwAEYaawgr5Yr?=
 =?us-ascii?Q?CNNiL+SeY4gq6vzJJe5BnOK8VUAJ7sBiaxTDUiDi/dIem7HaEvyisxNFAcC2?=
 =?us-ascii?Q?x2MD1ej7IlNg7TfKjKWA23u8KLKjYIwwyevsEl2crEd3qtbpC++HNRy9+a5K?=
 =?us-ascii?Q?MxaZiX1GN7WupHcfCpou4RAoSZYGzp4fyRrz0EzEgjV0YHz2R+L+rQ6+GH6Q?=
 =?us-ascii?Q?HIfuJCu3K0hFkRD/P/pgYFTxYDYAPI1BpISY+XUHnETVg2fCpw6cVxse3krK?=
 =?us-ascii?Q?3nV6156xc8nzorAmUXKKAdGr2nlGTE7j+TUdRDhmuLpxfAxN/CFOfeOC356J?=
 =?us-ascii?Q?CY/9Ql9zQkq6W0gRNYgX1zGE2wfV6Vfhurmzx2Sp27NLQ+so1DU3XQy8SZ2d?=
 =?us-ascii?Q?YvCT1hA0BsdeOKeWDOHxrqibgrg9uSP/nVtWbBORZ3l2SbelP4GdPqbFT1VD?=
 =?us-ascii?Q?OifnoYDtouzcTTPsotCPHm66bu0wBKksQh6o4cFqn0+k4wJQ/APWlfgCbvKd?=
 =?us-ascii?Q?8qOx+FH0neIBEPrZEh/y8Ctt6gOoNQ2dxgG6m13vr8haimYOcuZiuuUqOTcY?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09550949-03f7-4316-5671-08dbd4df0e30
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 22:17:48.5475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bor2eoJ3j/CbNkP0eq084ilSjzKmuLHIBFotMCyBreTzHfoTbONvFLBuFxdfOW8gsec3zH9uRqOmcki1yXWvglCzJFpFr65xWhHUeZeanV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/3] drm/xe/xe2: Add initial workarounds
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

On Tue, Oct 24, 2023 at 03:07:37PM -0700, Lucas De Marchi wrote:
> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> Add the initial collection of gt/engine/lrc workarounds.
> 
> v2:
>   - FF_MODE is an MCR register (Matt Roper)
>   - Group 18032247524 with other Xe2 workarounds (Matt Roper)
>   - Move WA changing PSS_CHICKEN to lrc_was[] as for Xe2 that register
>     is part of the render context image (Matt Roper)
>   - Apply WA 16020518922 only on render engine (Matt Roper)
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 71 ++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d..5ad75011aa70 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -94,7 +94,14 @@
>  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> +#define FF_MODE					XE_REG_MCR(0x6210)
> +#define   DIS_TE_AUTOSTRIP			REG_BIT(31)
> +#define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
> +#define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
> +
>  #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
> +#define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
> +#define   DIS_AUTOSTRIP				REG_BIT(6)
>  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
>  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
>  
> @@ -111,6 +118,9 @@
>  #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
>  #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>  
> +#define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
> +#define   FD_END_COLLECT			REG_BIT(5)
> +
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
> @@ -133,6 +143,9 @@
>  #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> +#define VF_SCRATCHPAD				XE_REG(0x83a8, XE_REG_OPTION_MASKED)
> +#define   XE2_VFG_TED_CREDIT_INTERFACE_DISABLE	REG_BIT(13)
> +
>  #define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
> @@ -225,6 +238,7 @@
>  #define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
>  #define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
>  #define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
> +#define   SBEUNIT_CLKGATE_DIS			REG_BIT(4)
>  
>  #define UNSLICE_UNIT_LEVEL_CLKGATE2		XE_REG(0x94e4)
>  #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
> @@ -276,6 +290,8 @@
>  #define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> +#define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
> +
>  #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>  #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>  #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
> @@ -299,6 +315,9 @@
>  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>  
> +#define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
> +#define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> @@ -328,6 +347,7 @@
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   EARLY_EOT_DIS				REG_BIT(1)
>  
>  #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>  #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
> @@ -345,11 +365,15 @@
>  
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +#define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> +#define   SEQUENTIAL_ACCESS_UPGRADE_DISABLE	REG_BIT(13)
>  
>  #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
>  #define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> +#define   XE2_ALLOC_DPA_STARVE_FIX_DIS		REG_BIT(47 - 32)
> +#define   ENABLE_SMP_LD_RENDER_SURFACE_CONTROL	REG_BIT(44 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
>  #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1450af6cab34..31801f0e7aa9 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -245,6 +245,19 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>  	},
>  
> +	/* Xe2_LPG */
> +	{ XE_RTP_NAME("16020975621"),

Nitpick:  we usually have a blank line between the platform comment and
the first table entry (and you already cleaned up a couple
inconsistencies in engine_was[] and lrc_was[] below).  But here you're
missing the space.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, SBEUNIT_CLKGATE_DIS))
> +	},
> +	{ XE_RTP_NAME("14018157293"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHPC_L3CLOS_MASK(0), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(1), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(2), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(3), ~0))
> +	},
> +
>  	{}
>  };
>  
> @@ -539,6 +552,41 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_NOCHECK))
>  	},
>  
> +	/* Xe2_LPG */
> +
> +	{ XE_RTP_NAME("18032247524"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> +	},
> +	{ XE_RTP_NAME("16018712365"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> +	},
> +	{ XE_RTP_NAME("14018957109"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
> +	},
> +	{ XE_RTP_NAME("16021540221"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
> +	{ XE_RTP_NAME("14019322943"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
> +	},
> +	{ XE_RTP_NAME("14018471104"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> +	},
> +	{ XE_RTP_NAME("16018737384"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> +	},
> +
>  	{}
>  };
>  
> @@ -625,11 +673,34 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  
>  	/* Xe_LPG */
> +
>  	{ XE_RTP_NAME("18019271663"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
>  
> +	/* Xe2_LPG */
> +
> +	{ XE_RTP_NAME("16020518922"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_TE_AUTOSTRIP |
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +	{ XE_RTP_NAME("14019386621"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> +	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
