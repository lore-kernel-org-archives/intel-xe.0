Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8061FEFB6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 16:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62CA10EBCE;
	Fri, 27 Feb 2026 16:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtTktynb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D04E10EBCE
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211088; x=1803747088;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5WcDEWvZa43clHEY17yUMmLsa6sVcYnanxs5MjeWVk8=;
 b=JtTktynbu7gMVqF6JJO6395SLGea1OykhXYBesUa7ydG76LoXWRdQYyN
 nayBTI6pPmZzf6OB8oTnW3rmGlJIoQ1QOlvekpIEJt0Qg407Ikhxa9gG+
 TxTs365WL1Vkdpj7Jsnt4bMiIxWBvQ9qhrB6m7vS02qIw2IEpez3hOo5h
 2BnIajrUtWsJwI+2boHMuG98lW8vNoXlGG8MPwVU3YfSr1KdEDQIYx2XJ
 53IDwBy/80uUHRZ9pBh878p6tMJszJmOhaf4++bG4Op0ZeicerxaEQSYK
 HgYz2lAAZmGJdoLuqHRc+wbOuN7+CxBsG1RbwB/X/aHJsRyixEjG3hQXg g==;
X-CSE-ConnectionGUID: waroVMiSRAarsJsmTSe5Dw==
X-CSE-MsgGUID: fZMIbyFuSjaw8VHcD338Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73341003"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73341003"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:51:19 -0800
X-CSE-ConnectionGUID: WSirvmKwR6isJDlNJX+HqA==
X-CSE-MsgGUID: U+BgfgEhSA65+335CCm4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217054415"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 08:51:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:51:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 08:51:17 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 08:51:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysEQIE3Tj0ZVUgNtKwW0KXh1Qu80VsIz6MqMdOI4L6Fe3JBNd9S4hyxU3lcCXOD5BbCtfKkDHfyEZFEnkr1hnF23PWVmmFW0dzeLfIqm9EHwO1yOlNbkPaq1tm1uish7sDwHJpc9L4z/av0obYgebUBsjA8c/wPdOZKCspzgksRe8c6ph/T/Uz6fD7PkvpymCyT5sdVaQTwqiJqqqHHxGAd5XRwHqITWxK158RLqUBs8TiGYufx0GFZLiCYu2iB4whXlNCefvnl70xC+hwpy6knsyZ+WD4i1PcJ6GNZAYarf5kqF89YMigTwRSgqYnimTeHPxG1lUTDi7zxJfMLqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aci4rDJgMYW4POZ+GVAlVGRVOgKKS3y9WErA3+EcpfE=;
 b=c+/8BY6XYFY7MpQRfkIg4y9yX9VytkwAV1Tz1YIPx2zg9irZzXbYAb11Nnt9lDP0qtpC3LJtT8oMSVQz3n9VHKPHZZCBQRVM2i5mQ9b6IRgAyQksxJbHigPFRedFCqVJ11+/SZWal5/hCNvUtaZ+86PzKFOzlRk+7FiL8dJM9WVsFGkl+KGTicjTL0neVKZFxj+5zjwjtwZyQSkNajTQ3kfzRyG/c0o2MvMV/EHCyHEG5vq8x9v7OOmNtjNQZYcCz0KQyh+eT1rwHpPjf7Xcp7iO+4Wa0jn54WxSYyGsZGBms4SX9QTTujCeYK8QEYKkPAx5fThAQ2LPgf5YjORjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 16:51:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:51:14 +0000
Date: Fri, 27 Feb 2026 08:51:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/tuning: Apply windower hardware filtering setting
 on Xe3 and Xe3p
Message-ID: <20260227165112.GA4694@mdroper-desk1.amr.corp.intel.com>
References: <20260224235055.3038710-2-matthew.d.roper@intel.com>
 <DM4PR11MB545692395035743113E2FDACEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB545692395035743113E2FDACEA72A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: fda91b95-acdd-49b5-6c88-08de76206b47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: AJ2QcdyMaslrqMbl9piiMYe48aFB6a2HC7hJRboO7HB2ioYXHl9HlcdqNXsNMLCsHmfijgauIhVBhPWPgDBKYFk9tjVoXq40fEvq40OK+eVl4sOFU6tlwoqGFfxrYbBuXv+3mlZNemkQN5E6goW4poMKsrfgO8lAx4FjhsAwEb+qXUhXUkAtxTgjsLLztfJZYO+HMB8q/llObneUPHD9FGprvKEHg0CuGQkKlsbmo0AcmnslLs1aV2OOPDU53t1tj5tucI3OwkTwbWg/pQ0s3OvywnQxqbpwVn5qfEMDt7xMO4+dMYozw0lcECafRigiOzSP8LWIS33paBnunfH+9rnt9AGCz5NMRejGWLEW6cFB0SbvsPiHKIWsTQwjWd8TwcTYyOha86tFMzJ/w4xH+1tgBLbHk/E2UDOQj/BqUO1NVlHuHFUtfxhGAe6MPIfGQEECFGEvqbhcRWepugW2DJ80RT6voU/yIMOfdEThshQRLnpA+FpjRJLf2IQH0e1WddCxYRUjf/wJFblyHma2MnCQLyTyFkmrH0yvcCuqRNFqr+2Bnf1sFIvNLDejJJCyepudV3DwZt91305oVlluzw2eVgXzlNTMbvKEvg5llcR6YyMI31y8pmm/+MIvSZ2z8OcPAmAavn1w473dnuZUJJCd9Isad5zdL/UV+2M1LYgqHEAhaaJMYX4fFA3HumdB+d4+6lGNIwcIXKGgiMePYCndnF65igHv2vT9qVyXHww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9p0pUKkRSIzU4r8tN4ft6E/DMsVHc+Dq0e8+uFjLWGs6nA5aasL2iWclBPkA?=
 =?us-ascii?Q?oxoky0s9OaA/TgqrZRQEuJ4h5B/YpRKuumwktUHp4biqGxsAPDfTfUPSPYgH?=
 =?us-ascii?Q?wAW4X9QbykEbMlVFrdNWZsWPituhU2FWSxj1kQoQbC95L/amhRncG7Aq5xqO?=
 =?us-ascii?Q?DkSeq51qqPRbSQr2YhSA8hd3ALZ8RMUXhC53LEDEoJA2w/s4YHwZC0dChDsM?=
 =?us-ascii?Q?GMpxSoa+6JY9qLMhYRqPDgaligJMma3CRBNOyCBpLpdbmDralC//FnP+SHfJ?=
 =?us-ascii?Q?a1VN4bLGiHUl/gaNIwDujZIXcKJ12J7zwc5iY4SnI8p7cbg+jiJfkKRPJmOk?=
 =?us-ascii?Q?N18KaSxYxMhRE3tJ0z76t68b6d9BblkRiiiTkk/NyR3dxGj3G9DSI9/MBTyU?=
 =?us-ascii?Q?fZcuhj2q6COVuRiLEPsOKDvf9qbuB9hVcEnU5VOkCZ2MPFHuoQnQOHGry57V?=
 =?us-ascii?Q?5zemdBftqGAFIFE+II0G9/aZWx6sdRUKp0BioGtgYuXmK31htIgN38jBBWcX?=
 =?us-ascii?Q?L9tHgrRcJa0St6UsGiL5YLmF7ooCTa7cfyb9Jz6uiu8dHahaULr0aK5im020?=
 =?us-ascii?Q?1Wmvg80yW4D4cSE69/dpOyjJeE9S67ETSjZo8zp51GF7S0iuiuIWwCoVrX4P?=
 =?us-ascii?Q?IwBRYyIUX4JscBvpPcCGkkJSOkJ0k+esiq80n12TucKpBGwkUFSHpGw3IgMk?=
 =?us-ascii?Q?rYnock6A3GrV9tfD8UzeTzBc1Mei8PhqlN3ADC+ScffKYWVw9ZIOMJGv9zMy?=
 =?us-ascii?Q?xjrdimU9249eZl1eSNNnIoDsnghkLVHwF8wMp7Tw/R7zAx0rNzKb8DfRnZZs?=
 =?us-ascii?Q?l7nmJKZbC5G9FyF2OHF0NQJh81lAn9KZfTgDt80JJiRZjo4jilz6XyZaouvb?=
 =?us-ascii?Q?mfyezG4BX695Ghw1bWaucH1DPQQQE7EG6nIx9EJyT6KQPOZ19Q7LAPdgX4Fz?=
 =?us-ascii?Q?4FIeVTVJABCovcXcfKpFl94KumkRg3AFR/O+FK5BKzyHD73Qn7tAu8hHWC1Z?=
 =?us-ascii?Q?1PH0tBTWW9ATWrD9bjz8TcrwGYDhRhuMZ+bYqzjPm21I+WLmDmtzumVRae4J?=
 =?us-ascii?Q?Rcb9UW16N5SnqYPoGeWS0ylz7yCLui2aR+PGbrn76gwyuX5dUvrKjXUyHHBy?=
 =?us-ascii?Q?KPsNr2uFNMM6tpqo/RcPEc4AHnruYIMm/S/JTGKz6h8ux/C7SwUFuGPDbYlZ?=
 =?us-ascii?Q?gMX92K57dY9KlCsGz8MR6nJPUrioyIrkL5LGZDGiGINa1HrKB80173PVtizW?=
 =?us-ascii?Q?YQWlMuBFX6DahZjwvJhtkkfnrXlTASOC4KQVjqXLsN49d8MdRW9V3+k6blLA?=
 =?us-ascii?Q?8e75EyG3WCYO3D5Wi6ARkwOftN308RIm2LjUsda43KFusaej9lP8PDXgQEsi?=
 =?us-ascii?Q?fCQLOVFEfHW7qtnrRqu1OLACcg+B7XVD+qFwso0PKZWbnxWVTkv1W/QMlsGI?=
 =?us-ascii?Q?NYrZd8qy+DbL2FrEfDRe/iEyZh735LqWwTnHsvATU7CtenIpD468iO9duIDf?=
 =?us-ascii?Q?sMG25Q8AJlmNkxv9vyruufcQhMzfV+k32doTNziykJtBKDdWZj7Y9tQ1YXjq?=
 =?us-ascii?Q?AHSl97igNPuHSWyBVkll+61zjteZbqGEoJRIpaXlg322D8yaZ8Et7HAAuAwm?=
 =?us-ascii?Q?fJO7f2BdVocwAznriYVu5BXR3bxFVZMmxrmaGh0rK5AE9L48gVOR/kcNaB7J?=
 =?us-ascii?Q?McVx8XPIgZYFoTrnQMIpzoMdPTwne0qdjK+F12CQrc9Lf7XDtl0G3cER/ORG?=
 =?us-ascii?Q?AzWNGCZNHrBsg6Kx6RufnNOfqHcTKWk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fda91b95-acdd-49b5-6c88-08de76206b47
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:51:14.5506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmReSBRkIVQmM6uVwN6jIXOmLh5HSgX+ue4mOdQMPKdHhOLLiltJT9BOIjkoIF+5wUKIsiVsBGBJt5Qso+ZZENRPftno3J7cqzj5FSPkZqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On Thu, Feb 26, 2026 at 03:07:31PM -0800, Lin, Shuicheng wrote:
> On Tue, Feb 24, 2026 3:51 PM Matt Roper wrote:
> > A recent bspec tuning guide update asks us to program
> > COMMON_SLICE_CHICKEN4[5] on Xe3 and Xe3p platforms.  Add this setting
> > to our LRC tuning RTP table so that the setting will become part of each
> > context's LRC.
> > 
> > Bspec: 72161, 55902
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> One small comment in below.
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 90b9017770ea..66ddad767ad4 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -176,6 +176,7 @@
> >  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300,
> > XE_REG_OPTION_MASKED)
> >  #define   SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE	REG_BIT(12)
> >  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
> > +#define   HW_FILTERING				REG_BIT(5)
> > 
> >  #define COMMON_SLICE_CHICKEN3
> > 	XE_REG(0x7304, XE_REG_OPTION_MASKED)
> >  #define XEHP_COMMON_SLICE_CHICKEN3
> > 	XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c
> > b/drivers/gpu/drm/xe/xe_tuning.c index ea90e8c99754..f8de6a4bf189
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -127,6 +127,11 @@ static const struct xe_rtp_entry_sr engine_tunings[]
> > = {  };
> > 
> >  static const struct xe_rtp_entry_sr lrc_tunings[] = {
> > +	{ XE_RTP_NAME("Tuning: Windower HW Filtering"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3599),
> > ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > HW_FILTERING))
> > +	},
> > +
> 
> Not an issue.
> Should we put it at the end of this array to follow the platform version order, and add the "/* Xe3 */"?

For workarounds we've started putting entries that span multiple IP
families at the top since they don't specifically match any of the
per-IP sections farther down (and it gets ambiguous exactly how to sort
entries that span version ranges).  So I figured it was best to use the
same sorting here (since this applies to both Xe3 and Xe3p) and leave
the sections at the bottom of the table for settings that truly apply to
just a single IP.


Matt

> 
> >  	/* DG2 */
> > 
> >  	{ XE_RTP_NAME("Tuning: L3 cache"),
> > --
> > 2.53.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
