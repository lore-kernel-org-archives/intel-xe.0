Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291FCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF1B10EA6D;
	Thu,  9 Oct 2025 14:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbLUZTd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF68910EA6D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760019818; x=1791555818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+MzLHdfMYXQLgY/RCNaeKHYUF22xm0lkBLkJpmqGV7E=;
 b=hbLUZTd0meUKzg5x+/ZuB+gxeEAKNxwelSmY3JgOP8R62jLalEVhA+tQ
 slkBF6m96z1ebFMy3IjebPtdowBnBzjlMQ5xo/2NrEx1UFKJa6xMwkCoK
 d5Y3RKvvgvDrhY/oOk9hS498J1IViK+NW06FTkTDanPzSwlrw3snvdP/6
 D9KokVANAhQkh4w/JGPZD3SdKCdEsp7i/BsE8rYAnRbrR3QiXtmyLN8ki
 DJ+FSWRstxHbC58pni8NNVhoNg3wtqtxLQyIb3gcYr4KNDKN4BBgTFj4l
 sa91S3qfm3C/2DWs0YWQ/qG6bN76JxvVw4izPV/lRiaHLUIpWjRyjJGK4 g==;
X-CSE-ConnectionGUID: C8JJ7a1MSfKhaQgQLX3jRA==
X-CSE-MsgGUID: f/wvqyXmRj2HtrJrfjQUwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64852385"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="64852385"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:23:37 -0700
X-CSE-ConnectionGUID: ZCQh+fjXTdOy2EcH7igBLA==
X-CSE-MsgGUID: DAeXX2lORqiDHWhDLIqqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180406783"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:23:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:23:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:23:36 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:23:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6ELX9NaGEeim4CeZxnXA/YM5KNJ/nNynagH4LKcpBFiN8d6RdyMcjGF0fwxd36wF8EnWdwlAZMz8H3zfJl3mZpfipD6P0vTZHiaocpCwQrfoSLHrhFrXlJOzbUykk/L2O7jbLjkEYsmCP6AHgzj7bwe/hNBQpAGN+FwrN5f4RjHMG9EdFsSdSrOuJ7fuvu81gLMBuWuomZcfcNr19Lj/0hyYDRQStUpDVuNtACMe/7tuiDe1XCNuzhfD5afbegv7BfURUM1GdNiiMpKCim3IsEDtmdDZ6ii6PLYvTAKp/tlFBpRcH5M2fWNdD7+IwproVj4Z/xItQfI7iGjzI7n3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwYN1Fe/fOEd4v8xA0+QcNEURa8PMC9rpwt9gooD/PA=;
 b=ysPHMxe61OnomSaLi36pqednlQjkVr8NXuzNW7i7RjEk/iV+ceGFSs4rDLi7tjcctN3VsvLrPqzJIYYd3Xu4v7oVJBRab1Vd7ILlYYklN1WBrhkx459QTnt32DuINRF+5Un8MbH+1MpxqGML7xzy5MfrkQRb94EF41JFzkjxByK73s9sOsN7DkgMWe3co8s+XVDjY08aYwAVCAJNwH2zVqxrV5310z0mkmPAeNreUSHiOK0PuOcTiKCxcjeIUjtUgTCGnievGDxa0oi+AKK+T5A6aY6KohFRg8+KQKxEMJ1wNBpAxvdcYxP1KKMUW85W39LhkoO3Wphm9qXScKmV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7057.namprd11.prod.outlook.com (2603:10b6:930:53::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:23:34 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:23:34 +0000
Date: Thu, 9 Oct 2025 10:23:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Enable media sampler power gating
Message-ID: <aOfFY1alTToqR7_W@intel.com>
References: <20251008172119.1630380-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251008172119.1630380-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc685f1-97f0-49a8-2b35-08de073f6dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C94uhRdUfbvH71LtxguhavreOC99f+KLNbOsuinBgntjGA5DxJUG34erp7io?=
 =?us-ascii?Q?r6vnFyIvEbrzVfB3/2MF5BPHHUe9acZcMHPxDX1Y4ss8hax8VX4dIez5HcLE?=
 =?us-ascii?Q?jL9UvLW1fXns5vIwkhBt3K5U5zgA9LmB/k2lHdPJRANASu1c27owfFLmNdy3?=
 =?us-ascii?Q?d5V6SlJTbJ1p9b1wiZLzw6p6hsCqxPD+Ae+7wf7IqO6G1jEemmwofLQN9qAj?=
 =?us-ascii?Q?49sZ1X1mOxnwgiSO2E1niO06Rf+oEj4U47waBS/nfQ3/aXKdsqbmEDqS8mwS?=
 =?us-ascii?Q?nWJXPSlty0a3vilufAxeM9Ztj32miaX9V/XAcPOjsEqnf4frtDsqw75n0/Kv?=
 =?us-ascii?Q?uScZHfPM2D2rfMMKX59Fud20Nr/ZTNcoaBRADgxF1pH9b/h41CJ15dxJ/+KH?=
 =?us-ascii?Q?SxoAF4UXm6XW7pKhi7mnjlOBsjoCVU0jE+dyxBMUZ+z8LiY1ue9i/pzkE5g0?=
 =?us-ascii?Q?pMK2BAkiDHDQYC3Jgrp1toFZd5mSD9V34YETUvX/PuJpZpX6KF8KbNIuL5AS?=
 =?us-ascii?Q?DFr33MkCVTv2wc28Y0fWpVtKDIa24pv2JUhYb4Ycba1c0Ft840tVWKYHDMlb?=
 =?us-ascii?Q?H4x8s/Lk3jY5mgYZPETJ3GFxeZqJD0xEOSbrmBtXVEEQRNv5uWS47xgBPUlv?=
 =?us-ascii?Q?8i1cmnI/UPFngbO69EI5ZO3xPpZsliLyko8W5r9RUpBV6JWn5QaNRyao8gF6?=
 =?us-ascii?Q?JWxuPXMs2syUoUVnUX2sqAneLuMxyDtoVxyvJ/Vgk/wzvRawBrPHLVniE8CU?=
 =?us-ascii?Q?H7r33RLn25d3pLNI1p9H0CDh0qRJgpZgM+f8REkCp4CWyJK82Yjl3EfEZkG3?=
 =?us-ascii?Q?8mQyCkXHpjTdE5A5589G9wf89s3OWOXj6Ykps7SF3tP2g5DCzS4orKj2SEp4?=
 =?us-ascii?Q?JGYE7NCTQbCkD89fn6wjOTTti/u2qkiEEcmy+X+tkSrAfD2MvXMRxc9PSOpg?=
 =?us-ascii?Q?FW/eCA/qOhTtDgNiPvE6h5yrAl66/y+7k3l6U1lvinI+oR0HUwW4nGvkCJDa?=
 =?us-ascii?Q?eFlvbQQ3de0BKjBwfiZnA4BB4UaN76Orz0okqGYDpoUSZaDXEFae57KeTihP?=
 =?us-ascii?Q?fcfH9CbNt/5c3CPkixyJKM4NMzwzzIETOaV/FBVE5MQzcY09Kl3ozLZtekvg?=
 =?us-ascii?Q?W08PiNGpbp2m5X0D+7RDV2AYews3vk0ZAH22KouXc13g0zkEryOruqAF3KWO?=
 =?us-ascii?Q?O7cQAprcWTFlrEys2dsZBLacHvoPoSbsC9iw04ZJp0Uf13E22//k1bRVAPIn?=
 =?us-ascii?Q?T4NIZfoKwDrr8Szhfptu2/dEs/my0Vl6pXt25nhXQMHlPA/JEl29Vg7IjZyC?=
 =?us-ascii?Q?F1m8U/JuiVPHYdI4MYyXlAk2ljbJuGIRUaGn2KzB/NVSi59I5BWsm7Hfjmdl?=
 =?us-ascii?Q?UkOAbTCDgB9wvSCZUMOYpLgrQjJ8g7dbt0xYhBtPRvjvFrcc2jO1IZU4Vk5a?=
 =?us-ascii?Q?KH1VGchH4lZHRIKDtrv6w8/y1U6a14TT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ECJEve7V+1PdDq8/Xrs6kZeBfQUehsG2gr8bcYD5ZcG8iu6dVQ7bhJfO/l7X?=
 =?us-ascii?Q?2HfWjXz7wg/v40ePUG2BQbLWmxUbZAZ8QJ4txxpCOHn6PCwMRcpuYQ2XcppF?=
 =?us-ascii?Q?OATIGT8O7++md26hABgHd9xdOZh28gR+A+gqCT3vaCUlygQNN5hAMsHUKpG3?=
 =?us-ascii?Q?LEwokImCfYoVqLcgiWBm2w10j9wu2XaD8BioXX55NCsDroDmDSZT1mHrmiKk?=
 =?us-ascii?Q?B4U3THVhSec3i4uFDYPLSHK+S9whi/s1ZpgFf8/45qDniwJ99QCK92+J9M9u?=
 =?us-ascii?Q?QZYPPbnfmW0KAXTReryL5KMuER9H9hfUapkuBsCtNkKxKMPvE2SnC6tL2fZL?=
 =?us-ascii?Q?mvsMWNSi/e1d/akkxA9WtDmzw5uDnEkzARGQzFEw5b1hKdqQZDFQnLX3Jk41?=
 =?us-ascii?Q?zfn9acg3EYSbjHtyDmgXJ0cvJWejaj4trgiTYv27mcBMRXSnVHenM49Pifth?=
 =?us-ascii?Q?fH4JL1cE+HiTrPFQSec7STg0gPx/589fnCudW8JMcR/m4Cq+2MRUAMFIUAAo?=
 =?us-ascii?Q?R5s6Hk4/XDTX4I0QAxXhubi+Y1/SEv1mYxe9alRHbqWPKGq9dceBh+cn/B6E?=
 =?us-ascii?Q?idQPo5yjCQ989iRv8jMa6N2Q1ECmqcLolEsKBe9b/Xl096c8r42CRbzdeWbg?=
 =?us-ascii?Q?Q/o0tDmjyFS1u21le6+ySKafdwkUhgtSIv5VVyzFffbIWNK5JEBxvyjpjqE+?=
 =?us-ascii?Q?/h9Uokk1fVPaccFaORj/jK7MV5YkgqOLxTuRkgx9hXSEgj15KRHkgVl/9cge?=
 =?us-ascii?Q?3ZQF5meXuPx4A68aOf9e4VaWRKg0J0TuC8LHvTeJnBUo3rr66SeveYjFflCN?=
 =?us-ascii?Q?NGnRaJijG/CN6SKfLLDrsTBUp4Iymc9nAHOFX/ZLCHGgKkHoNxwHY/HVkgSf?=
 =?us-ascii?Q?/VTMhxNkBb14rZ4U4qaATI68kIPQf3VvLbADtjNC5gWRCzLwBLW6yh2lh8GS?=
 =?us-ascii?Q?Tjco4gVmrzNUJxkft3Li/82ULo7OHZUk0LK8+PuUOEAARk/gwKvy+BdaIwJ+?=
 =?us-ascii?Q?JZgJoIVend390gSbWq0wnowmsYugKCIUnLw6rZcRvWg9Z/Tr8kh6hUIG27UG?=
 =?us-ascii?Q?syhNsJWMSkG+bkwo98wgNHvam1MtzRlp7CUjKe95detMcQDfCYk0cJpX7J6f?=
 =?us-ascii?Q?xKh1sdfmjXCczBMMC5gtrwfl9IM6yA+jWSd+xmETAR4qYRnMy1iUfUabEjLx?=
 =?us-ascii?Q?nCmWiOJUTCqRE9MT4xIEZSCgtqQBFkxZTJFjyD2OLIMpGPx3cj/zGm0cjfEz?=
 =?us-ascii?Q?JbYtxwNJWoupx4FtkywnBUMCrxoG9B7Z7kjAbQSwwxntpns0PARFCKpTJi9/?=
 =?us-ascii?Q?rlPyt3GUee2Ubjhpl3UNQG1UTtxY2UtHnG05vITMkyTWw/GJnQPUf5oZ3/jc?=
 =?us-ascii?Q?S5hqsf0b9dDtR78/vP5NwN2N6oaaaUMkcZGT43pf5QF3IVqx6n+27umCUMaQ?=
 =?us-ascii?Q?1ASBhnEMLDPEWW1oR8Se4bsS1q7fikMGlM8a5mIh0Rppb8AzGWX2b8cIxt//?=
 =?us-ascii?Q?4UswAZ3hT/hebAlcvtUt1ULA+M2zAf2jraOm4J0kVAy9zTM13wdOE6G88w/J?=
 =?us-ascii?Q?FJXzfj+lt/BXApGTluNI79U8EcE3xi9BmPuaVUtU5S8xq79+lthBsMMpjHEy?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc685f1-97f0-49a8-2b35-08de073f6dc4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:23:34.1588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHCjnXhHGMmR7ElBxQIBkG1ZUCiDjuuCVKAjcBOqRHRDHr2B8b5k+PvtFhTVZCy+XwV8n4Xm8Q9FkcCJWClbqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7057
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

On Wed, Oct 08, 2025 at 10:21:19AM -0700, Vinay Belgaumkar wrote:
> Where applicable, enable media sampler power gating. Also, add
> it to the powergate_info debugfs.
> 
> v2: Remove the sampler powergate status since it is cleared quickly anyway.
> 
> Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 06cb6b02ec64..51f2a03847f9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -342,6 +342,7 @@
>  #define POWERGATE_ENABLE			XE_REG(0xa210)
>  #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
>  #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
> +#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
>  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
>  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index f8950a52d0a4..b5f89d15276a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -124,6 +124,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	if (xe_gt_is_main_type(gt))
>  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>  
> +	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
> +		gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;

should we do this conditionally on vcs_mask and vecs_mask along with the
main media power gate?!

> +
>  	if (xe->info.platform != XE_DG1) {
>  		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  			if ((gt->info.engine_mask & BIT(i)))
> @@ -246,6 +249,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
>  					   str_up_down(pg_status & media_slices[n].status_bit));
>  	}
> +
> +	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
> +		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
> +			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));

I was going to ask you to remove this print, but then I noticed we have
for the other bits as well...

We should perhaps remove all of them and put in a single debugfs,
but that can be a follow-up work...

> +
>  	return 0;
>  }
>  
> -- 
> 2.38.1
> 
