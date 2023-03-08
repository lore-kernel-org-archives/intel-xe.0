Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DAC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 22:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3F510E0B5;
	Wed,  8 Mar 2023 22:37:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1444510E0B5
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 22:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678315074; x=1709851074;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dtF1WlfDwai9vz8U3fEUPaXx12y8QDvcvzjbTmctohc=;
 b=QsOa1wp7pD2yGEAZO6q8wGz6WIJGD5eL+DdqPhfj/HEXW9FDG1Fp2qY5
 nHjL+F4q58hGdKnDYsKvbkLBXluIX8J4Ig5ldebGiPVKdT71uIMA9+NNG
 wU9h0WbojpHh6wgQLOAaYU8K0MwNyN7uRBErUozt+1TY02/VFfj/FpdXM
 3neWa8H64SG7xIrPToFFi61W94DjfllYNG8GlbrhL559+xRXBf3DGDa4R
 kWLuDj60kDt6xZsbjnP+5LCt0ULoVqzMW/Yz2PS1glOJPxfiTfa5ylxmP
 NMGzk5lISChyecZfyPJoVzDd+1p0Il+CVXB/JzrgixNOYMJuxBdmtejpv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315951273"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315951273"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 14:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627117507"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="627117507"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 14:37:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:37:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 14:37:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 14:37:50 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 14:37:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul0rcXB83Tx7aTSuyfoNkcV26D4d88zc3tGd9U/J3gH3lRzGbhxfKg9fCJ3pUN6nY2PoFNkZg/2RbuZnbnQLU8ewlF28b259bJJajJVxcmsjE7VF2yap0W5o4tZanbJWfA5T90/tu2khPP0+m85UGR8sAcuk80pCS0qcWH5CMCwyceBDJEQuO4xvcWznsHL9IgEoH3fcE7vAReAHvlElYsHXpT1kV2VDFnJjv9a8HoUDceoyezDpmQMn+jGxNYCD19qYAz/jUdg5RXuwvJwSWCu/tJBBmSFlcW88beiOMFAf02eyn9hrCWeivQvT7v09JEG3lCUseaMOi0FYKljkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tXyYYSNe8/7K7Jf9b69acPOILOTUYYzsi2CfxBpKO8=;
 b=UNA21P+T6mUYXW1YCJAH7aiw8T9+pHZmwyznLRjHTIJYk37D/XPnrZqDBCeybtBcFOkbTB+1kcA8PCDiZlFpi3fKSd7i6FEAv6rSV/Cfd/ITqhkA6weKDzugq26qycXA4mwrnPWbOyHinZaBuG/SxhPHqx7qFpiMv5E/5SK6C0DrZ17xe045ti411STroKOlRoDwgrgkdNufWWmx+tCPjKaPguznnmxRa891G5J97Nf3U8FZdMIBBOeB51bX2cgFDSiOHsC4EEUcE7OY7ziE2rR9LerTsKVY5rdGWgUoODbuPN+1Wfna9D02JmQVlcgLX7zQq/BnshhNJMgZIhMJFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 22:37:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 22:37:48 +0000
Date: Wed, 8 Mar 2023 14:37:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308223745.GF1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307092446.1263266-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BY1PR11MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: be2b4d3a-a737-4941-78db-08db2025be00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ainU2qo0H20Za2FJr/jVNFB0BK7NHXeRRUVW4/FAlpGlsfxMLBEUF6HNgyeJ65ix9VSpt2UJ2LUVFZgYsvwpmRtAzLaQeVhvqXnKOxu8AuXSS38ehceIsHqqTx7SqkSppc8bSwIsKNmx6OWYSs3Wb0m2QPh2dHIQ3HwDYDTtTRvspyLY5Z4osez6jyYWoH3UoBQkihm3FP3cR1IBBA6cft6RcpOC2Cjl8wCCa1zDmOrSZBccrOKFL1R4bCckMpEuEoZYeW1h4lCiiChRcGel7QfRlP4P7uFiDVXFg2vAMQi/O0/Jt2FCpCbROGbe7dYLbtlanrbiq+tIUbP6dilpKAdu12sRIN4kPufNwN0W7Mb5PmRBDNzPl734XznEaGsK6pocSo/QdX6yuYWKLsS29eILQt8yK8M5JrCoTZccmyR/HpNcNuTH7WzAsFgRV7Q0IDb2bG/mfXlo/WTqtO+BCE4OqJMEwz3h/YyA293jwWmgG+mCHTO1rCxuPr3CWZzmjOwmzd4iiSWyrSq0OSemhPL6w1t3+04ysKOxnAIsiXEFsb8Khj/xaKreOlXUu9vlO0SkVZHFJH/Siw92NkCpjAodCVN4QkckPGJxsaOPNROyCyHBaBrl/5b8UCjsjq4roNKnfzXVvovRlCuEvGHMGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199018)(6666004)(478600001)(5660300002)(2906002)(6506007)(1076003)(6512007)(6486002)(26005)(33656002)(186003)(86362001)(83380400001)(66946007)(66556008)(4326008)(82960400001)(38100700002)(8676002)(66476007)(8936002)(6862004)(316002)(6636002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7NazYsF5swsiV43W+nIRaSl/qc2L2KK5enkragVebXmQmSz2KHwid9Ctvq45?=
 =?us-ascii?Q?e+4JA4Q9levwNOjOHQPMvkyYUhoMcBR7Xdl5nW4SVAE82V1K3DAm13Pa6uoZ?=
 =?us-ascii?Q?s+ox+6W+SZ4UGst2vbCySeE+0tKoJpe077qEQxoDS78LmFPeMTt5i70Rf+8q?=
 =?us-ascii?Q?AHRfAfWwTTvI14k4YLOCyc4+Oi4cOWMzjyCThFlRV12UDEZuJUzbMA0hRI3D?=
 =?us-ascii?Q?BizBPZm1i1dS6icGcFZTUir5njz8FBUWzq9qZztJXf9CyCppLj1w4e6RZgnm?=
 =?us-ascii?Q?jTv9Uj2pU3wr+a+fxSomKNZny7nySjhqRBOMNuTF4kcCMuXRlmYhLaYKDYg9?=
 =?us-ascii?Q?bg52IvLxS6zvSa2iSzBAEaus2+XU3NvfLdvtpY8b83aN7ntLzGIFQEimFPv9?=
 =?us-ascii?Q?TBAJ00K9oLVnzdOwjvahyWVmVWXr+fyrYpEgjRdbeazODf5/80jTPO3264PA?=
 =?us-ascii?Q?RowYDWNevInpMuHm2unlg8LhitImzaY1UpqqWpgqXBFtztKnjF+riJhlBgo6?=
 =?us-ascii?Q?cZOtjx9HQwcZc5lAHvB5+oRNd4orS99izA+jfCbH+uZRlYnpBRTbzSc3vRiA?=
 =?us-ascii?Q?MrwFhG+n6+rYOwZUlNQJQXh5l9XXn1Dl9R/+xn3aiuPnAyV/d2pWIyvgvQye?=
 =?us-ascii?Q?HIIJAO9b1+q8HYXwlUNPvqY6uUALaQnBexHYosJpHhElwCML5Bdz/0/7sg2h?=
 =?us-ascii?Q?WW0bEn71dC+U/U4nbAaSkH15bMWWVr1csCVvB0Y999r9ksYeyltEIUya4G55?=
 =?us-ascii?Q?YP/4lnJiQmXaL87CC2AaAOaRIvyD0/3XxGQMFBIP/mFrAVi9Bx1FuwLfObRG?=
 =?us-ascii?Q?INnGW4d/kVPbwYjWfERgoK7YYJ1rRR3iCGfkpwmSkhodrQJR20yrfJjKLd4P?=
 =?us-ascii?Q?kWqgtLlnUlGs9hKItLEmS08tvEPtla9cyE/wzm0z8wyWcNZiAMNeDplJ0pAx?=
 =?us-ascii?Q?tQOQrkV/EjhpXxP6cW5pCDNwpAnRQuQDjJm/8/8m4z+W/037/zRNsFrtWyf/?=
 =?us-ascii?Q?0R1aAc86xVxaxuHrdfidKGBTgdlgNV6PGzgQr1hnCDb5l/mcEQLNtgYaHo/N?=
 =?us-ascii?Q?Uxtxi10rZrsfixIQXIHBtQPoqmY+XJyrHhPDN0l9P3xGUCWB+53oBfx/Ffc0?=
 =?us-ascii?Q?m3wjK8Wvw3ekLu+ewvDF8aihDq/uP9Tu4YIVBFtuURnNrbPxwTxr+JOskVRM?=
 =?us-ascii?Q?4wWlhzdC13gZLtsLSI3cdFsRzST2irpxyKLLoYni3tFGqPI8UZIPfCI7CMkw?=
 =?us-ascii?Q?Tf+25/gTR9oQ5QadAUJX+XMGEEdfpK9OofZb5tQikYA2aoQahHt3VQv8aPVC?=
 =?us-ascii?Q?fDBbiFtNXrtgMKxrNc89sB6FGFUxX5Rq97dFzbk9R6LVq978KO0tkofrEIHC?=
 =?us-ascii?Q?951x9dCogZtMMZ5amZar2gLnhpQb5kT469JW2NT6tOiabMza53Ovsrgd4bxO?=
 =?us-ascii?Q?BVDfrIPMeMwAdudxh9S0DBpiC8qvbNn4wsMP+kHn1yuYWwwKzQCi6eanu1fG?=
 =?us-ascii?Q?KTLLcbiYZdtXoXs9UJjg3fgPDhJK0BG9iwSoR8twmRuEE5wgXzNTDAIoxdHY?=
 =?us-ascii?Q?h0EfFXyoJKCRFna6VI4uZeaYjZN1TG0lU/Doc5bl3cotHobwA0Oh+arSNEDW?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be2b4d3a-a737-4941-78db-08db2025be00
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 22:37:47.9138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIca4H/JiAXxCGIbArZz9SmaHLSMlWALHRtSeq5Ge51Z/hbkfFbxWGm5QqQxKqnfse8A6Yg5l0b3rXxOMZSZjbKlIZlHwTNoX/GFajY0a1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/19] drm/xe/reg_sr: Tweak verbosity for
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

On Tue, Mar 07, 2023 at 01:24:38AM -0800, Lucas De Marchi wrote:
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
> On the other hand, contrary to the save-restore, it was not printing the
> registers being whitelisted, so add them now. On a PVC system it should
> show something like:
> 
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs7 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ec3a8] = 0x10000000
> 	[drm:xe_reg_sr_apply_whitelist [xe]] Whitelisting bcs8 registers
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=0) REG[0x4400] = 0x40000003
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=1) REG[0x4500] = 0x40000003
> 	[drm:xe_reg_sr_apply_whitelist [xe]] (slot=2) REG[0x3ee3a8] = 0x10000000
> 	[drm:xe_reg_sr_apply_mmio [xe]] Applying ccs0 save-restore MMIOs
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0x20e4] = 0x00008000
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xb01c] = 0x00000001
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe48c] = 0x00000800
> 	[drm:xe_reg_sr_apply_mmio [xe]] REG[0xe7c8] = 0x40000000
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 855d86a6c43a..8ae803393ff0 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -169,6 +169,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	unsigned long reg;
>  	int err;
>  
> +	if (xa_empty(&sr->xa))
> +		return;
> +
>  	drm_dbg(&xe->drm, "Applying %s save-restore MMIOs\n", sr->name);
>  
>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> @@ -196,6 +199,9 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  	unsigned int slot = 0;
>  	int err;
>  
> +	if (xa_empty(&sr->xa))
> +		return;
> +
>  	drm_dbg(&xe->drm, "Whitelisting %s registers\n", sr->name);
>  
>  	err = xe_force_wake_get(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> @@ -203,6 +209,8 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  		goto err_force_wake;
>  
>  	xa_for_each(&sr->xa, reg, entry) {
> +		drm_dbg(&xe->drm, "(slot=%d) REG[0x%lx] = 0x%08x", slot, reg,
> +			entry->set_bits);

Printing the flags in hex form seems kind of hard to work with.  Should
we actually interpret them so that we print a more readable message with
ranges(when appropriate), read vs read-write listing, and allow vs deny?


Matt

>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot).reg,
>  				reg | entry->set_bits);
>  		slot++;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
