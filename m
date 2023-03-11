Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637DFC6FA99
	for <intel-xe@archiver.kernel.org>; Sat, 11 Mar 2023 00:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55710E311;
	Sat, 11 Mar 2023 00:19:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD7410E311
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Mar 2023 00:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678493941; x=1710029941;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iHN4JCeQKSAzvEbmqBwgBHGp2OD0NJLDtRStKvug8eM=;
 b=oC97PUSHFURI8PYVD1RoBrq/O0LTFI6cP3NgXuJP4ibki+SH6F0/9QCY
 vJDNiVWTzU7YKSL1qS3xQKkwr1KH7J74rs9oJLQwJiCIxohsZCfSCkXjE
 /j64drOawVeQFltjrRivEpg5HBittVaiDOVgjwpr6m0NcD86mZ2Pfofq3
 uiJaAPhyDJ6pDk20M3qPGmgSCbdmivMrpW5bKjM0+W+8QLJdqBqpvwuib
 4HMrEtC3fVyDGMkrEnPx5F4OTX3Vfbn+fx3+fouRDeys0BJxNDVo8kZSk
 5dTcSOvAW+I1IsmT1J3kCuWyuIea5/EBfk+ADXzQGnaT2Lq3kfmBvThe4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316504231"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="316504231"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 16:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="628007477"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="628007477"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 16:19:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 16:18:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 16:18:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 16:18:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH9q2Z24Ui1kF/o0gMIL+IRxzu+FH5F/jLKQn2H6yjumX377PlxJiI1R59H7xiRn8xcRu6bTpLTeLbKIewi1hZ/aonFSfNBrjiMkCKVvERS2gY7H0Gw8brkEgz3NFk9ErzmzsB/+jr+YZRfWuV0M1FLPNAKra0UGLpkc6oxjpfbK1ZfG/4K1cvykw5NFKkFGqPyQXkOxOYqH78sLQB1V9dr+NdsOcgC3CW438KS5pWFK8k24HL6lKjiFbnEzxCAW1k11Ck6KH2dETLNe3Ft12YBrt0pCHyId5BWxfNXh/NpFAx0IJk9DmaYFqzLBSVFxp+N+YylfHfK9iS1eEWAaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWohvxIpDV5oUDhKZah251pQlt3ycVkWA8gNfyVJVQA=;
 b=O+ZQLFaQ8xehLH7pOLbBStZQQO6zIyC4SwQnPC0aICGeH+tr7Oxz9swNY9sHq+HGutHV8p3Rucr56yyRcklrauW/2NUeUbsun0DoR9tNWynesywK9AsWfAcva/U7FT6kGfEigTsxHcMHLy1IELmULT9KrLY4gDr9YtPOJ1+z3yMlH69U/O2R6r/O80y6SZ0syhM3KwsIYJUAcVr32SOSycWAWKBfOAJnfAEjSSNwNQ9E5mDAOd8XHV54YvzXJpsDaMzHQ13zcieHnasfEugobHLtMfXrp1esl2hhI671rK9UWe02a8hK7Yb/euMjDKWXCqzMD3FlnPxXMBp3sUe/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 00:18:57 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 00:18:57 +0000
Date: Fri, 10 Mar 2023 16:18:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230311001854.GB1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb9fd98-5d88-4903-5f32-08db21c6347f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0HyG5hNZoN5o1N923HCX2rLO9lzfDAqSBOS8SUzhWs2+0M3rK5iIaJdS4htPqTyil9sLXqlnEQjLnQJx8CvOf64+rdk5xnvrPb+qCsjfRwHreCXWQNO/dTNQz05wQEtRaG6I+1iaWAnCJURcZ183lxF8CN01Vl2znf7XS4g9gq4GlxMLUOM3XcrFSJjJXG13mUqdZ/aSGYo3uKuvwRbzwaHrOXE3MDAnxinZ33su7z4uE2S6EwVPTNbTAISiVJvfLWcUR0zZWARQNz2+HD18lvPhyOEP0hKzYPiJmW1HabP+tXGhfeS8EhUKbwBkH1+tZvNrUGAc1QUXC99QXZziuD7WeCN7hCfsPncrpgAg5RxItf5nRYhAjQpwrlrRxq92GgayZhUlCvXx8U09PGy4iTYbB6dNRwLWNHYLpN7stkIFnzQlo6H28OuljF77JUI9B774JqrSkMpZha1nuMjvQLiWEH//CWiJJgq76vf2ftHFfydP1v0y+NWNs71d/eSpEMFraFfj13pdFZDYqZ82JkiJVv2B7do/hqehtmt00FcPkOXGbbPAwP5jxBgwgutmohqvM+FN14CCwExYmRMeSjtqXpU0I3H6BYzfon8ff3Z+9+anUA/k/xLXRZRSUz066tZbj68m06rjXnpSj5S3/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199018)(33656002)(186003)(6636002)(6486002)(5660300002)(316002)(66476007)(41300700001)(6862004)(66946007)(8676002)(66556008)(8936002)(4326008)(6506007)(38100700002)(26005)(1076003)(86362001)(6666004)(82960400001)(6512007)(83380400001)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xeSaMOYqrkGEw5SxA8knToRuBm3MiqF9OKW4G+1HJI3Oou19Mh27Pb59GT6N?=
 =?us-ascii?Q?NJQQ5hByQu2pn7vCfGemlOWJWOd9QgkFlLUjz19gFT93qJdSe0Pu4klM9qXX?=
 =?us-ascii?Q?+IAA/nzkyGDRqR4XbZf84/JLl/L3Gi2QzCb3uLKbCrKnv1qHMi0c9CiJWxnx?=
 =?us-ascii?Q?d3CgKbXoYC3d2faSnqjugEsDOppaZEYFh3pCqAlZ2kM5ZPclJYpPDJ9ZH67p?=
 =?us-ascii?Q?CzCysKzIMMxLIlD4URILF4CmWSc/473dJUvPLmXClJnpNxd57Cy/wcjStWai?=
 =?us-ascii?Q?vq6AGQPnhFolZKjMHDaJfZ+6PutT7nvL2pkGF11AJvkjzjx4ZjBKSZKgnlgh?=
 =?us-ascii?Q?g0dNwYDce/TLJdUgPFKkxJVcEdasmdJ7uQG4ifkmoOj1Lc3Yg6+sdPWLvuCb?=
 =?us-ascii?Q?CyNUD2neLPjUC+a4VMvoDl2hmJ1S11OKx2N+QrvlhEOGgdklD7Larytxawsn?=
 =?us-ascii?Q?Dj9mDlktQHtvBEKiTolvNUtsPpNVwSKk2ZS5mftUiQ55PQHIfo9C5rOjR7Nc?=
 =?us-ascii?Q?c4pHjUDj4VM0E2ewaY+JxXN2ladVHIOEF2SayUiMkpJn4F1UDao2mmIW4QJM?=
 =?us-ascii?Q?f663e5a5h76+UevDcnbqp4LMhZZMdD46mo0D6PXhD41QhvSk2WHQ1vjszFQ2?=
 =?us-ascii?Q?zi2ZbjsLnms/lpwUaLJSN9R/jcAe7TdhzlA0M+TJTtZRt+xQeJyfU/byOXzK?=
 =?us-ascii?Q?TaFLbpbjCYyxpx1BI9ciSq2+/APenfoH4h2wVsSzRaMOdTw7NTFHRLr6c3vk?=
 =?us-ascii?Q?gdzFgP5NVOrfe1iEGWX/0YGIRwKMlQRAEuqYl9lmKL6Yrjio8njVlWkJozsd?=
 =?us-ascii?Q?lwoEijRA7JFfa9ivwSqFJ+G12dZMUgJ4luVXzTLD/NEK5rguqDn2xkoRMDsA?=
 =?us-ascii?Q?q7SwvVTK1776sR3PWArl+aVluLWL5cN0AeQp1CbGepSpdoZ+U43NKtcatpWK?=
 =?us-ascii?Q?DyM48+XJiAjXS/QneA3CqANobY+uxAPRg9dGnoeV7r8vJagmZKXVl4FwPoB0?=
 =?us-ascii?Q?qbw/WH4ceIEc3xYhUGN/sf7CU5cvq3C2hWYo81FMUs+TBRlIooPiqJCCI2t4?=
 =?us-ascii?Q?bmft4jHKHA+5ApVtRQAIimUaVPiOoSvDyYjFxBoev6PPzcpOtj4LOQNOzdCG?=
 =?us-ascii?Q?o6BW2YrO92Gstl3ofUDGJMswu5JKoabun4x4VXS1cGxJekQsSRsfxTVswdPU?=
 =?us-ascii?Q?kMIvlVx6iwmqNcTkuGMOVbBEP/91n+A+jk8ngcdnQ+fV8FcMivSN5HYVcZCy?=
 =?us-ascii?Q?cXRJfsQS94W97IBvbP7BOLNVcJFIx1XDnpjPiVNAvF2mrkA+coYjQ7PucxR9?=
 =?us-ascii?Q?UHjbyfT043joFaGOn2q89ZOw68avo3f2tqeRjJvmXHuhmE+K4bVdaRC+X00q?=
 =?us-ascii?Q?Fnj5B+gVfPe1FQHuVZwROFxHEGxLDbhlWoF/VtqP10izOmIU6v6IkguiN+mi?=
 =?us-ascii?Q?8wV1NlteLnXG1B1gKmTuXpVlww9xjNy5PiG8QiZv8SCiVlJRsboOL4oDr1OX?=
 =?us-ascii?Q?+aZ5up45UidWfVf+DDsaOkeaknNlGsurbM2p+IZGN2P1aaTBtl2Got6W6dFQ?=
 =?us-ascii?Q?ot0w826M4yhdU77IpvqQuzYG/0YMV7llrSaYoIADL1WjiyzPHdZTj6I2pwlM?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb9fd98-5d88-4903-5f32-08db21c6347f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2023 00:18:57.3264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxqkjjXS+1hC4PcysL9WUsFLtmNL2wG5OpS8FOFmaUc9YuckaNIvERVYMaSp+whzYGVbEtvAdPZavXl3h65lWqclK3i3d12ArFVxnSqFcns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/12] drm/xe: Add PVC engine workarounds
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

On Fri, Mar 10, 2023 at 02:15:45PM -0800, Lucas De Marchi wrote:
> Sync PVC engine workarounds with i915.
> 
> v2: Remove 16016694945. It was added by mistake. It's a GT workaround,
> already present in the GT table (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 22 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 1b39a209898b..ab9dd70c0534 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -43,6 +43,9 @@
>  #define GEN7_FF_SLICE_CS_CHICKEN1		_MMIO(0x20e0)
>  #define   GEN9_FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
>  
> +#define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
> +#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
> +
>  #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
>  #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
>  
> @@ -230,6 +233,9 @@
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>  #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>  
> +#define CACHE_MODE_SS				MCR_REG(0xe420)
> +#define   DISABLE_ECC				REG_BIT(5)
> +
>  #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
>  #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
>  #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
> @@ -246,6 +252,9 @@
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
>  
> +#define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
> +#define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +
>  #define SARB_CHICKEN1				MCR_REG(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 853c8b602cbd..03663bf98bf0 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -270,6 +270,28 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> +
> +	/* PVC */
> +
> +	{ XE_RTP_NAME("22014226127"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
> +	},
> +	{ XE_RTP_NAME("14015227452"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("16015675438"),
> +	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{ XE_RTP_NAME("14014999345"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
> +	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC,
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
