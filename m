Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED0C6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 23:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89A910E06C;
	Fri, 10 Mar 2023 23:44:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684B710E06C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 23:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678491860; x=1710027860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/h4coxcbyJHpohV2CWe/LCfDbIsa93u7uJoyR8Syts0=;
 b=GoSjn2WpjahixZmhf1f/rLSFufaDtAHPwx8po4sAtcYNAMKNrFqYwh6l
 zOsifVFma/7Vakc6rDhDY863MnhVAlSPxsCR71/+GS5XMPeTWvTgeresL
 nn4G/2T+VlnFENf9fZgnPfXLlb5QN0SbkTiJPbk8Jz7oJrPoKC0+o+fKx
 fIk1iOApPjhDIidEk2cfPCa4eUUMEoWe7UqEwl8w98TmACamNFoeEAhoX
 dq8qJrxYGFbSA/S6+0atEpYLY+NzDjim74uY/DNprmBQCelOVjqV9Qn6Q
 ++liDaaPsOEcYE/b8uOc6eXhQCMUXaeFfOcMnyFnUP0EmdzlJAniX31ng Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401714625"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="401714625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 15:44:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="742173248"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="742173248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2023 15:44:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:44:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 15:44:14 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 15:44:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxckWt+j9vuC63xq+AA0z+1Qr6y15CKhJg+iEF0rhymC6wpsit/d59xb7vr/EA9PNZaT0Xy0deE32ZBYb4HBWpZZxLsnK42HTXkh/H0IRaoQm4RA2vfiNbA6246AlOT0846EZRw8yrFaMQhUI8ejUQ5Df1+NWzgZOxXBLJMWCd6Xt1PIUOVnVfWUygHh+ZArVZjWYihSYC2T2I5IwDkd4ht8E6D1c8HyW3xpH06kYDoEyJR/8FapXuIUqEiKH2GWfrpZdjoIW27h5H0JHMSFzGtaM9qCDd5EAO+iGbgD/4GDVDNqYhhb3AHLerF1F7TlIz6I0NphiqyRure/J5Z3Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3W9Ssl3eISeGpVIdbn5a4vIST/8DL5S5FVj4Ap/Qhk=;
 b=QcBY6CKDoZT9zD2t+gRFZnC8vXKNAE5cXPF4GHS7Nqbt3XViuj44RJuNpXjz+CIxpdw3N65hwdI2qGYrXwMR4JfT3iYBjDOoavQkE697nOwy40yvdwh+g1mIo1XIPPH1H8NA2o+cZWI5dIBGNVot/CWYhhhdpWvZEgs4j09puNK6Vi14JcRXMXqMOcaLBC8AhQMZDRdWNc0e33XDbrc14sFK/mLA7e1/kAHVVWdg0BaN7rSbsNys2Pz8jYEli7yAH1y1xJt/EIbVdUmGhpzXImietNOxOnc4HX/kM4m/bj+TiwqD0fCW6KLSPDuiIN0LyHe2WR+ImBaonwDka523ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 23:44:12 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 23:44:12 +0000
Date: Fri, 10 Mar 2023 15:44:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230310234409.GU1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ecd618-4db7-4fd2-ec6e-08db21c159a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4uLfHWg96o7hf8tAQRwQ8W5KvFhSK+wnz8s6IiTZ+1PwARdSt8jEtOo9G8DmQbw9zyQvWc2TLbjfj7M8BEyCP7neyK+gxDLAmUoT/i5zgSa1O6MhzHl7xoT1haKBg65wfe7Y7awGQDdvoJk47xTBDNhFcqFz/e/HPZ6fue8Df6IsND4iWBha4VWcuXPNpHsV+SRvLmWUCSrGnQ2heK2KM9p8Hvv0D21H/Np9fDxXgZWRiTig6Y/UNZp0UcRy5Oeht5Xm94rJliEpe7i+wBP0yOCwnQfxkJMe4mmNdYw0ciMyK+tz0LVTU2GbgdHQF/scq4fI8l7wHcX1Ien1HAh6/BdnwLgcrWEzmLK6PEIe8VSLElxznJ8wTPelL8wKNQ2ujnHRKsdXDOybuyD4M2R/lQ/sgnT1Qtlm01TevrTZJl6ru8I3itM57jCddjHmP4SKFYpWPst46Zuyn7jCMimcMt/G+LLdlRcsgI7TCdU8bFQrk7qOV3U1hA9HYYqROyvmJRXsAiYS5l01Z82XoMgR9ImojMSDpyh8uq7Kx5Rw5nkRCOwo9xSc1h873wW+Pv9q0WYI1d0gGtXyUsfUKCvtv1W20NN1UoP8DGof17J50dbzQDMXClFwG/ND7D4yfjHIpxQrrFbMH78lzFgzPk+IgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199018)(83380400001)(2906002)(6512007)(8676002)(66556008)(66946007)(66476007)(5660300002)(26005)(186003)(6666004)(41300700001)(1076003)(82960400001)(38100700002)(6506007)(478600001)(6486002)(33656002)(6636002)(4326008)(316002)(8936002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzxBKWmIK86xPRrUyMecFjeJEftK1X1Fn11zhsvESP1yUt8Iar2d2Mvg5dZj?=
 =?us-ascii?Q?57bhCUCg1fZdeBrGrHiUfyF8qVJioPxIxGETeSL3+iVXGWC4pazImmkJ+aVw?=
 =?us-ascii?Q?7pSuSbTP22Ai/mSMM4CPue4eDVZ0bxjJp8Pdzl16oL5br/p13NoxU1Oh1kj3?=
 =?us-ascii?Q?YMpS6Y2R9B0pjSPsd56lCz0MXM2odn/rnT8quTrBmE+6IRKAxynwsgp0B2q/?=
 =?us-ascii?Q?YrqihaA3X4C2Js8CPWI1TBBDmqVerrDIIziefBnqfVkGpGxSFQvuQDQ1bvCO?=
 =?us-ascii?Q?OouPzq4lB6q0MwywL25H2bzw6lsvOEDnkAAo3H8ufbyps4520XYmM1zxsxPC?=
 =?us-ascii?Q?Q2aELM0h/LFxFeAzdHijerje6xTvZo299JxuLkHCc7XcDjYALMNcD3X7Sp1O?=
 =?us-ascii?Q?GnJHAN2NQRzv6uH0M9tyKHWMZcC2UJZxQ+ce+gCRf4rv1w/e3h9l2CzFC4ig?=
 =?us-ascii?Q?eLILh5m1YQjjxFJpZFq5vJ7P1h+L55MMPZjx0UO+sFOY1vHXzyR+3tOTOuux?=
 =?us-ascii?Q?n1/VNoBlqDARQjmO1cVr8YyrkcS0qex0VljBOg23Ex5H81wIlwSkAUIF1g2W?=
 =?us-ascii?Q?UHve5yC4ZapWstatO76n4Xmuo+4cFj7sS1ft4R2Uzpjaa6XoQZi16CIZPkwE?=
 =?us-ascii?Q?XIyq7EyC1FXCbDYNMqQL6fJBnWJ1/xO1y5u63mMwW0kfeGqyGmNYJYdvKGBn?=
 =?us-ascii?Q?NaQKO6SwZcwopyxETBg3+HH/+pCM8uQM2FxtJUWUr1XDNGkC4uGlS/YsYbpI?=
 =?us-ascii?Q?zi8CtIEsQ+gWuaNU29gp9h6Wn1Y8/sMT9dhymd6yRCbIBKQ2q8xaxvzHBJWZ?=
 =?us-ascii?Q?Cvnga7qYy/CK2t3Lvpi9iGyxppJnuJmTtgAf2YJqpHxSjMlmRzMbaUS6IhJ4?=
 =?us-ascii?Q?nSXO2VpZ8FgQQLxtfgMCBf6l3/PEbFzb475bgta6EFWZ6d0WZhC9Yc/taAQa?=
 =?us-ascii?Q?1C1H0Oygj/CyNZVH/+bEEF2ZLANYV4JFnP4sPsRMgG58WQUrCpydPCaSgsNr?=
 =?us-ascii?Q?/tM5fuNxFsWPEmMoX4aTgJAurWcPqEx+PIB+aczFW13Y3nLjdsLwAtMUz1cQ?=
 =?us-ascii?Q?WPBa9l2FCpywj8ZUZMTglArYK/eEn/+lhVJkHtg/KO0KjIwo7o8SwecEwdDO?=
 =?us-ascii?Q?cxaJM0NVrgsHQvzTe4Up28sURgKpxLQGfu0bv4dBL5zpYwL+GmJF/swXoUea?=
 =?us-ascii?Q?E23zBRfMON9osbdNTUqeMqMrFguG0OPxrI3kRiVZEoH2TJ+EzmPT4s7Zqjqw?=
 =?us-ascii?Q?pk05TsC7geLcsVxMcfu0xxOlI+DuLjvKn5kHIusSZv5iw+3lGAqjD6ONHk6n?=
 =?us-ascii?Q?Jj+mx9E/g6gEW7Gh29fyy6d5mbwvdotCdosBfEsMuZBeNpezptcQlAV0Nj75?=
 =?us-ascii?Q?BqI46Z+S4AJgdI1b1aCM0fdk/KHVUgfUdsqtuSVj9IIdyMMenoz+4QMbq3im?=
 =?us-ascii?Q?unyBtI/bLQOaxuQuFSRHVMERi8/pVOQL5vhSW1MGkplTCWeBN/8LhMupof8e?=
 =?us-ascii?Q?yovfXPG8raSRVJkVejEUF/ZGGHolk4wu8NojhFthj5fmHtrtQSOXnrY4zuNv?=
 =?us-ascii?Q?/v10gRx7wfbJJCR91PjWOejmPwP2GGOVuF1cplLZJXsbFBc8qiNcLbsWUjHL?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ecd618-4db7-4fd2-ec6e-08db21c159a0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 23:44:12.0743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCE4AqKVEz1rOupw1NrI69hsDVB/C85t28TqwLFGK3iQtjr7yFOHxo8W048g3BYgYHZXifFpExDl3tZuRNAy5+0SvvAbjEGCQEiAHMrXwso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 02/12] drm/xe/reg_sr: Tweak verbosity for
 register printing
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

On Fri, Mar 10, 2023 at 02:15:39PM -0800, Lucas De Marchi wrote:
> If there is no register to save-restore or whitelist, just return. This
> drops some noise from the log, particurlarly for platforms with several
> engines like PVC:
> 
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs0 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs1 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs2 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs5 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs6 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs7 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying bcs8 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
> 	...
> 
> On a PVC system it should show something like below. Whitelist calls
> are still there since they aren't actually empty - driver just doesn't
> print each individual entry. This will be fixed in future.
> 
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs0 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs1 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs2 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs5 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs6 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
> 
> v2: Only tweak log verbosity, leave the whitelist printout for later
>     since decoding the whitelist is more complex.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 194a5060f1b3..c6f92fe9aad1 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -168,6 +168,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	unsigned long reg;
>  	int err;
>  
> +	if (xa_empty(&sr->xa))
> +		return;
> +
>  	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
>  
>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> @@ -195,6 +198,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  	unsigned int slot = 0;
>  	int err;
>  
> +	if (xa_empty(&sr->xa))
> +		return;
> +
>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>  
>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
