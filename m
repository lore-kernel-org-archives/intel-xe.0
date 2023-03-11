Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D7DC6FA99
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE2E10E04B;
	Sat, 11 Mar 2023 00:12:19 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769B910E04B
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678493537; x=1710029537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JVQh5UhX7RAIK9rxXuDa6LStX6NF9wOT4AISZDphMYE=;
 b=mSYHKycIuHx9IWqLK6UKZ4HcoxCvbf8vqISjWTTmb1AJO+buyXQC1xab
 mll8FZa74YCvsdojpzUBG2kCa8/1/V45hmE9L3cxVYH9hAnbzS+P6Q70P
 bW5o5GEa3NcbxLPVvxeo5uJITg042Oy004xYS+OyewhjXEI3J83qOpkBd
 +O0j9dYvM7LL49RBOEALdhx+9j+xdpuVeuiiDvgwwmu8SVlv9FgRUrwbJ
 GGIYskYYetIA4aoI59Z7WRSI4J4lNgbAV3RKxr5BdojhuEGMvyK1giWv4
 tLXSjcFyVXkblELajokxG0c9fvrLR73j9L97ZlD1lBFXtawy4uhRi5F+k g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423123390"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423123390"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708201164"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="708201164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 16:12:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:12:16 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:12:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:12:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZkOoi7d1sQoYbP1dBKpDARVHb3Yn7fuMHI/fsZifnTRc7CS4vBI7u1kv3AWQsy8JmvInjRaQfS0JbtOWsRR1ZtoFBjDK80SDpa+3Ph67Ji1OcSKnrug08PB3jvYFBgc5h24I3gB0ec0oqjSA5TOJhkUVoq4tvsAAR7YsBMMp6l2kzWTwMuOoswWB6MKclHT9ejyQwNE/mU5AnhrZOTMkR1tMYXF2NjWPWrG/Amg07OtegPBsabMniUcjLHSWnsnO0yi5aCK59qq9OM1jmn3qFnueyGXvItAkoUl9Rh8mTA3K+FzFSPiCnT+faMmHtLvJiAy8XBi/mtcOPfiOp0IwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krq8SaZbO7erlKsNtZMUBBs+ga4IpJik5WEffJStlew=;
 b=PcpeEfH37/+s/o3fGHtqlxr+1TI3tq7HhE2cfX12UoGBmg4fyCqTuLQw4QE2OdKe6WHdqyJkEDbITvzG5fBYx9AwQ8g69r3RM5DnWf/k4Vdda9ddhpkPy+Vj5cUhOaQROPtfIRVWNfEOHQGHeaFQDSiiuxL5VyLAfo4rBuYWOvrs2x71ZfSSH9lz0IHDzjq9qimp3b3FTks5psPI3xjwO3xug6Maox9B55+QpgbyvBNtYPvCbZErGjXKlVR8zuokSsi7FilgVmX0WTFWzP1wGuaMbWXv981rcSqDQYT62mqJWfqfHPnWFx9SXW1+KzHahFa/J/bY+Qmy/xVOAXuGMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:12:14 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:12:14 +0000
Date: Fri, 10 Mar 2023 16:12:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311001211.GA1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0204.namprd05.prod.outlook.com
 (2603:10b6:a03:330::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 9435d468-6505-4219-36b7-08db21c54429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NMGK9i0zijXlkj5+J+5D8n1Lckkf0qfMEpRl5cA6B51YWg0orj5wQQ/iugqNs3cHn84eaqr/CZYL/6arkVCmquP+YH66u6cXiYxjzX1FHAbN5JveHh+jMARWhHLc45hL6uiP/hrE0XoFiPZSaIUTTjzrVLB4q+eYHGn3Jk1OUTDHF4kglr+5iA1FUAfKeWIkI+tBdhNX9PrdaYaMoaLTjg+EMvGGO4rs9130V9dsGGNm5CUqTYG1LbMn7jQ6W25mBwH0hiy0eH5T9kripXg3zuY+HzZL5b/8E7jYzxA3jzjWpECZHVp0DI3mwz8JdMMXcEYYVwN8heFl8ovtEV/3rxDEZ2mNePre+G+zuCEk2eF7yYEqSQNcSWrzxA1eTuFI9Frt0BuNbdmFhsOfk9+riaAdWwvVkbwzXKTV57iN52uDiZKeV6xPO2e+eRsnfIN+v/h/HonHcyMKp+lhrQbDMeYkRFj1aFDo1uROZZJjfE98FPDU6T5o79lK6kiGAtk7DIwaTBHd4VXzzl63p1Dr6EwO1W5CYwkKYpXIhcG3O6XQBucfLFK+jhx9oYKK68nCQVDGcxjrVprOTpuKBPWcC7UqgMx4+l2CD3p87jTaO1LmIZGA+Fp2gwzGw+4EIkQ7MoeA3AaEO+WTn5lFQAOAUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(33656002)(186003)(6636002)(6486002)(5660300002)(316002)(66476007)(41300700001)(6862004)(66946007)(8676002)(66556008)(8936002)(4326008)(6506007)(38100700002)(26005)(1076003)(86362001)(6666004)(82960400001)(6512007)(83380400001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bau+dJTIx+k+cMqqFQeqzo+iFNKyH0w6KWluvrmmC22sFTX7/cxGHTy5ifBR?=
 =?us-ascii?Q?rN5/L7Y2ThtnWPR5uQcjJG8DGnjyimTbmnpx6pzzmEthY+xcFRlbvU7hwM0r?=
 =?us-ascii?Q?jS5Rhz58DNupNiT+tLU31zcxuPoeY/E7u4QzoZhe9L7PjUCuozTETqdXlEpJ?=
 =?us-ascii?Q?FjF8JVWuRRhxIZP1Uc4E0Su4/JztR0+UQr5U1xLe88dSz0/OZxIDDuiXcE6T?=
 =?us-ascii?Q?nwnRDjWCjSZmu6C71z8doNt5OAGZQHJGkDej0TPKmTUIZGGVpbfYiC3XgkU0?=
 =?us-ascii?Q?vt/pl6bFMfEZt7dyYO0QDE6s34S3Gt/wIDuPlzFA0Un03dZkVU9Z2y4MUmZT?=
 =?us-ascii?Q?xifu3XACvs3m/bF+EVtY1/pijxcyYhS2Fq5Z9VGBrItGgSNv8HUcKi+l6LmO?=
 =?us-ascii?Q?h9J1TlidSuKZ3eD5YgTUnjIJ943z7hXdNBimp2VaEHF0xMG6xtFt9nsBC9Sr?=
 =?us-ascii?Q?lxPhfflBwDLNLFKXbS8j9/P+PiQqbIV3PeNjNlEkRXeri/TPwsC/xX4zslAz?=
 =?us-ascii?Q?Z+mZXI2gZxAuZR5Lb7aj32ee2GmanmJqDM7mA3nUqnYhWa2Vhn8DdIwk60zK?=
 =?us-ascii?Q?572Da/LiZiqXP/UD5D93BQA3E7QpZD5RqAroaQcU6xMRl883hd3YAcslSBWn?=
 =?us-ascii?Q?C3uQJqf6Yo/o33Jqi/H1jK3gW2orFESBvtt8SU827Q3cGS++1j9rrcwHP7yj?=
 =?us-ascii?Q?UwuueN7v1vaUtLAWGbq5x4QTpbdU9QPpSpXSeyYUReHj9B72hUpcuTjNMiIs?=
 =?us-ascii?Q?hRSfvyMfJpDzg8LOA/LRIruWLp3c+9g4hqFh/tyGBuUad6qE60d1lyAShpx8?=
 =?us-ascii?Q?E6USs05bj4fykSU+2BTLhA57LrxjZNsb1J/UdfMTaoQLpJ3B4sxl1skdCz/T?=
 =?us-ascii?Q?tQkcjzdc/A1ciy3lCmSJxaoz1k6MnL7MbtvQTnkqbd+k3VeevqtnKsGPT65O?=
 =?us-ascii?Q?KBGH9Q1wfx6Dl5RA4lQqcpo3koCaSE1MireZ0Wbb/5z0PFlTF2sjF3x01iPx?=
 =?us-ascii?Q?89SscFxU/E4ygeufwYzUuUW5Vs1AA0SDVl5tUwT5cPxyBEjHVa6sDQVnun4H?=
 =?us-ascii?Q?JsCEs5f4MBkOxaIits4OhhN6Nq8/bjXj+Q7z7rS+YRD8zB4JoX1GKnwYUMbZ?=
 =?us-ascii?Q?qe0P/V514iip+8oFwkWPIoCDO9b9pJ9P9vt2jSgV6FaXPX7eSQfYgVQHvQM3?=
 =?us-ascii?Q?buP3izZ/58poIMk/5keQN25ebcjhtyFid2H/bwYkm4jZGqHP47aEnYHgU8ih?=
 =?us-ascii?Q?hU3O3B7Yzo8O3eH4Py7mIrPWWS0/QFFtpo0JbMAsC5j+Kte7om7HpVnqVnVC?=
 =?us-ascii?Q?9xj6LoNM0f+jc0Wx9sbMsR/L9VAwjWLFGhzaO0juNPWAkKTgChg2kjCYQyV+?=
 =?us-ascii?Q?BX4EM/QJQ6/6XHXSx9HoY3+PMhTKd2GEEzskP+1bZru+T8ncYIBSKxWQ6xlj?=
 =?us-ascii?Q?Pz0iKY/uEBz5A+PABCa7ypXEiF6L09uZl9mJXiH5N9US9xg46VbXTDbXKzUd?=
 =?us-ascii?Q?dxUxPBhe1uuQ/46oLjIXgcudt7U/jr5TSRUkIhE4CPvvAb6Ls9xFGAj/Bct9?=
 =?us-ascii?Q?npsqeZPDU7pp0F9mPKxmrGyvYI6KD6ZxD0eLS4kCq9o+ZGynplqWGGiiqkuR?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9435d468-6505-4219-36b7-08db21c54429
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:12:14.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pi01r0HuTB4EIAuxGf4Rl2mD4Md/keRpCRTLS10/P98tXquS83qkALZn1ijd7FhvoqPWDk9Kh4t0jryi0tKalOrtcTRXnJ8GNoH3wwNI+HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/12] drm/xe: Add PVC gt workarounds
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

On Fri, Mar 10, 2023 at 02:15:44PM -0800, Lucas De Marchi wrote:
> Synchronize with i915 the PVC gt workarounds as of committ
> commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w
> access order").
> 
> v2: Add masked flag to XEHPC_LNCFMISCCFGREG0 (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 19 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 70457c0ff4a6..1b39a209898b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -216,6 +216,15 @@
>  #define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
>  #define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
>  
> +#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
> +#define   XEHPC_OVRLSCCC			REG_BIT(0)
> +
> +#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
> +#define COMP_MOD_CTRL				MCR_REG(0xcf30)
> +#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
> +#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
> +#define   FORCE_MISS_FTLB			REG_BIT(3)
> +
>  #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 26b94d580e56..853c8b602cbd 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -180,6 +180,25 @@ static const struct xe_rtp_entry gt_was[] = {
>  	  XE_RTP_RULES(PLATFORM(DG2)),
>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>  	},
> +
> +	/* PVC */
> +
> +	{ XE_RTP_NAME("14015795083"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
> +	},
> +	{ XE_RTP_NAME("18018781329"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
> +			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
> +	},
> +	{ XE_RTP_NAME("16016694945"),
> +	  XE_RTP_RULES(PLATFORM(PVC)),
> +	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
>  	{}
>  };
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
