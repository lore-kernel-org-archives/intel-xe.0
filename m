Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6F0F4385F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 17:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030F10E728;
	Wed, 15 Apr 2026 17:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+SHHqqC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EB510E728
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776274163; x=1807810163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yEc8PdgbHSGA3cZ4bUTePpncv/hl6tDMaoGL1WhKcS0=;
 b=F+SHHqqC5mLdfnoaJ4VS/0d6mBy/6zyTe+BpGIqwDIzjiahOAd5o072P
 zJj1Muhw2W91JeNMr+9OP+WAeXEBFbz4Ap7Xg6t9QjjRwpj43KFMydhJH
 sdDRZirbMFYTVpXmAmvtl+yuT4hSZUdTo2hcZDO2bNCl9Hb05RH2EtFAI
 s2ROLYuzaOzYZhCU2ye/gFsiiV/Ucq/XnndtQBWZGcM1TFa8qXdNgJgyP
 hPADn2CdKkmORYk1pYBip6w6ss3ybb44Cee/EIdL4qVLZUbpEHXWJMbdF
 8CIPGQ3vBogKes9m6PZJZtgV0rX2GFauvq+9PhR8Mgzd7YJF482Nsmnwt Q==;
X-CSE-ConnectionGUID: MVPceybFTdqNfOWePqIk3g==
X-CSE-MsgGUID: DbfnPQ11SWKQaR0r69T7vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77167656"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77167656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:29:23 -0700
X-CSE-ConnectionGUID: hCVcwcOaTKi6tdiRBFWXew==
X-CSE-MsgGUID: bOGnD773Q4mUQyMgvajfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230416762"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 10:29:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:29:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 10:29:22 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 10:29:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxiRwgLAAnxXs/PAAKU8ntRbpH/lFRssKhs5S2xI2Ji3OgN1G89J4X8NXWmSHLg69/j0dsYlTxwIlP71ZBtV4sMySPX5mytVRXpurgsUhrXndAEN3Yb3uECzS+igirzxiMQrEGyNmb+nKgYoonNRGqfq7H5yZjdiW3cyGiMr1WJIEScbzh/GxMndJT0i3HEPH/+L7RNQPHqtMiy4BdP/VKmZed2Gcqoh4qVOi0yLRXRUlJnHlSq0g1IzmSNlAwPvzN8TISonB5pej6GuvXO8k1scjzogZixsyhfFYhRFsPj3p/pQHHdUuITNl3fD7zUYH/CgZEDP2m5bWuGfyQEd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw+i4Lnpgzl76bPuRVme3nsbp+OGiOLN4qXaU7FDUWM=;
 b=in4AN3cpNA4SnVFmBoaF3/GmzuX0rB/AmkpmpkXYzXPh1UQMrKXi1r8/NruxzDV66o2aigfdMrdvX/g3U4obL9wTiPl00nmNS7hYJZwd5SuDnXSuX5UCNMEiGnl8Tsjl3I4ThHa7BaO8eY8dQAS2+qrk9zD18WhIFfCqQrMOBvFVV9QFJ5oTfQ1iJJT0xf7pIfZ9aKTaqsZm7bSpRZAvaPwfhGRu8Ch+u5x/AKCGbp75nRFPEJ8UzNXJu90toc/Ru06DoifrstMIDCZTDID2TuIoNSSdgVzZOAXEBruxW4uNBDTnrzFMjbvrnviwk3E0+lDVWC78tuw/h1084BIdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 17:29:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 17:29:19 +0000
Date: Wed, 15 Apr 2026 10:29:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/oa: Fix offset alignment for MERT
 WHITELIST_OA_MERT_MMIO_TRG
Message-ID: <20260415172917.GB755471@mdroper-desk1.amr.corp.intel.com>
References: <20260415033532.789954-1-ashutosh.dixit@intel.com>
 <20260415033532.789954-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260415033532.789954-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 237903f7-b0ef-416e-3fae-08de9b1486a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 5NdKS+MNgSpD8M/OxrKOJrq7LG8BImz+Yxxysyma5aUQw+PHZGZ6s5PIqmfcR7bZT/yv6Y8aY76jLq77tEMmbM3xSIElgDHSxYRBcoa5txOg6oMihXsP14WoyMkpXShtlOW2UQC+v9gcQaXp0Blr2T1oEWLLFUIxN8ovE9yLDRhO1COmlSNGVq72yptWea2AZ7cPrRIfsprqdNFeh14xdwtRl0mezSO5ltNA29eSx2vWcHoC0PSlogdOabCmaAxIZ2CncvumR5DAqFG2Tysr1bWp0iKlvIwhYgMaAD2heSdLlmU5oWFK891QUQMtnViPSdJs5WmwbGFpydCfzrZf55HaHR1HwEC7tU5rZxWJ+SSiVnl8aqbTKbWgZiWayxFVUklsI36rpTLZVvYGYO6IboCBHxywx2npnjs+kDrq3q9QmZ8e2xJYiSxDdxB6sa0O5VvPH/D8VJWZebRcxkaH+j9ozlyKfII6L3mMd7wVIvtv3IcqyslDqQwX4misnPNE3oKNdE/olQIKZ+CKTrU/WhfQbeoScS3iY/GRxWYQfBVch/40JXK24tR7dLQChaygJ0xChT8TXwFtiMA2t+RybPf3Z9FYVNyik9u9QEmFh3YONADNjD9TJtvPl//ae2c5dOERmstUy1fMkyQdZP6If60NoAgNUWR+p0X3NECT+gySWxcj7fR9WurWM7hYnrthI1E8jBo3qaJOVqzRKGfo/IFM6L4RA1Fkb+16qpeaCbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+cnWFJT0P2/jPFeGQF6Ce8sf9NkZ0fH3j04w8ZA+IAMySw8MdjQjelTtp2Z+?=
 =?us-ascii?Q?dmb2OfMectr6EjD05ZEG2dDrPxzlYy/IlT9JbO65Wozh4DGVRLY+6SlU92Xu?=
 =?us-ascii?Q?/m85OQvNLZYSXbwz/fTm/rzynnmIbvLmpncApJwULaOIMtCourQDubSfu2IP?=
 =?us-ascii?Q?ijPzuG9hOaxk4ugj2BN5xDgv2TZYxrAE0yOGodmKrDfv8cQT6+rdWAX6m4Rx?=
 =?us-ascii?Q?/uBLhquYgSV/ERjyvw+YW6mPiLuJprrRDzpljEOzv3yRtSiBKvOxQy9yLt0n?=
 =?us-ascii?Q?vbuDz5jeI/UsStm3BZu9EakRfgjvONrrn3/HWQwL3O+1QHuq35AWZ74CdSY0?=
 =?us-ascii?Q?HRZMq8moyNMSouOSsR+6E6mbaJBRLD8XKVNs/+o93WkqMplUNE3cKN7wVyas?=
 =?us-ascii?Q?oT7a4D2KXeSfq1oOfoZ2iTdVuAUfD7AZM3qIJeJzpuZeV/1WzkDGtvuOKPVq?=
 =?us-ascii?Q?h/jVw+t9ErIJGzYr3mW2ExZbqLFW18LsOj/0njeqjMRF2dqR7GFkxVtYona1?=
 =?us-ascii?Q?5Z8hgCxx6W1L5VoxO/IP+UQosEIGLu2JXSB10cjtyxf9IAoeW2zcxQS7C/CC?=
 =?us-ascii?Q?eWEpPU42J2QMjLt43aUCefBccp7sH5aBGbm1K20wwOopcc7oVBnNufibqqDv?=
 =?us-ascii?Q?f4EXPExl1JBzTjuH0yDR4ap7+njZlMvQXk7eWY7AT2oMioCYeK2V5xxnhPmt?=
 =?us-ascii?Q?Y3Sjf4g1Yr5CQMgFSGTBRlWnwx2YkPsVOU1Jy8vngrquqsiFxJoAPDWnSaUG?=
 =?us-ascii?Q?7J9+WY1fFPGw/oQP5XENv1lqRo5wGqGYIGoBLkkARcAYTaLLEbWtRVmGIAlg?=
 =?us-ascii?Q?03098Fh8tTlmuoyC/x0NbnesMzSvQ9gtfY5Svei0O1fi/HsY7AwqVhD5fP75?=
 =?us-ascii?Q?8iMWDRroDHQ8mNuiPK3O4bQbgfelXmW1QUbPrwbkMszyfdtrf2KSXi8faJD7?=
 =?us-ascii?Q?DGnDhKdBxomUh/XgiSS6MNwT4TXiY9R65xRcM7YcIx9gA9RDppbsJfojJOJG?=
 =?us-ascii?Q?1UmUmLAmu+9Duv54CfggL9jx4eV2Iy/G7H/6jPO4fIFodv0vMQtnBSny1mQX?=
 =?us-ascii?Q?86KnKqwTfevYzYlK6GqRinYUU6Cq7wwqbFhXpPECdp3N1yipESJDYh/zNb6r?=
 =?us-ascii?Q?jOZVjoxYhH1szA49czQCtmGGMxPPzS0/+tKjTZEmkF8RRlv9+l+RLPG+GqML?=
 =?us-ascii?Q?yc0TtMAXqeeqvC11NPbVsydj3n2a+1+qhakkiV9WHX3KuN8aZwO3bevC4CaJ?=
 =?us-ascii?Q?X8ZSaN4woGk/3o8/Qn2xT3FsZyyNgEn7IFnlhpJavasDc3iSye9GIcQXEtDZ?=
 =?us-ascii?Q?WmNEjq+zeE4fL0Ujsh9PU+UnB6S9ezmeKJKEeFTfLub0zkcV4p9l/6lLnFih?=
 =?us-ascii?Q?kgbuYgcTOjb5zcJ7XP6yN9Ba82SkfnFDohyp0YY2vsY7mhPoi1aDzOZ6cqsY?=
 =?us-ascii?Q?e1PV12Rppa9GWoSEN3uUaI0cOe6x8wACICaqeXXeuf6ZjMHYoiEmkknggIeQ?=
 =?us-ascii?Q?3wsj1g4TJGKzCEev6SASlZcLrN4iHao5I9LoAv3XadYVXtRVQOdeyhhAFyjS?=
 =?us-ascii?Q?OqepQXwFENQW5TjQsAwWHQ6JVgoTQtBSf/YDui17vLb9kC9mFyn3W8oKrAQm?=
 =?us-ascii?Q?5pgeLo6YzYGxAOgRosuqm0pIi0Y4zP4WLZBEDkx093/CWb6AxP+2Sdyx2cjD?=
 =?us-ascii?Q?FHFfAU555kIlglfKs4wLfKdQ17iQf2iI4+797rWUvgrooGa4QSn6SfRu9H+I?=
 =?us-ascii?Q?dE967JdWHq6cx/2060wwQKYQx0Gh7ac=3D?=
X-Exchange-RoutingPolicyChecked: S3Bvb/xexvzeOuh9lnajff5LtaPAfNXlxuMr8fa8U3yeFuc/d8HbxqMa/kxRzTZmtXdnfwaH5Hu/8ul/i3fD2g6OuN6Jx8a8ur6I34QPa5+LvYTgJ/txL0TtkwqDMJ3HyJ+KxG0J3hAJQWgzez7nCSU0YE/Q9OgaVVDLmpEm6rZ3hZXiditf4E3P1Pl3qSGniePCTKXVhhX+Q9oFqGs6sabW0Hp6Wkpabq3bxQO2kp197Fb09oKcVJY7hOQh6Vneg5trzlV+fmSYSRESwSVUrQH0kftGV+JFBzWyqM9rsLXyNZBbz6kIMG3u6GUat+H9WmEQ5/meAVvq9kVRbBgDhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 237903f7-b0ef-416e-3fae-08de9b1486a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 17:29:19.5178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZrT3uAm1gwKLKsj7nd56hZxU+/cThIBgz7691eQWWfKYIQjU2QKCF4B4LKUtA8TNbpEu10cS9CedApP3oD+MkmeI4T4OCR+dqNEYlWjRf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
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

On Tue, Apr 14, 2026 at 08:35:32PM -0700, Ashutosh Dixit wrote:
> 'tail_buf' argument for WHITELIST_OA_MERT_MMIO_TRG was previously
> wrong (not multiple of 16). Fix this.
> 
> Fixes: ec02e49f21bc ("drm/xe/rtp: Whitelist OAMERT MMIO trigger registers")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 09dcb6a422797..796b3a2b717c0 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -106,7 +106,7 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  			      OAM_HEAD_POINTER(XE_OAM_SCMI_1_BASE_ADJ))
>  
>  #define WHITELIST_OA_MERT_MMIO_TRG \
> -	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_HEAD_POINTER)
> +	WHITELIST_OA_MMIO_TRG(OAMERT_MMIO_TRG, OAMERT_TAIL_POINTER)

Related to the comments on the previous patch --- if we don't eliminate
the RANGE_4 usage, this whitelists the tail, buffer, and two other
unwanted register offsets beyond that.  I don't see anything documented
at those offsets in the bspec right now, but that doesn't mean that it's
okay to expose those to userspace.  There could be sensitive SoC
registers located at those offsets, or they could be unused today but
start getting used for something else on an n+1 or n+2 platform.  We
need to eliminate the RANGE_4 flag so that we're not granting access to
things we shouldn't be.

I don't know if this whitelisting is even going to work.  I seem to
recall that the command streamers might have limits that prevent them
from accessing offsets outside the GT IP (independent of any
whitelist/blacklist handling).


Matt

>  
>  	{ XE_RTP_NAME("oag_mmio_trg_rcs"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> -- 
> 2.48.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
