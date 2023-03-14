Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5F1C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 23:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9B10E1CB;
	Tue, 14 Mar 2023 23:47:10 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11C210E1BB
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 23:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678837627; x=1710373627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wJLdZEQbCj7xA6o0NyX09gxH42BTuDLTm8W9VP4tbWM=;
 b=LUL9ecvBFxg8rWarGbFd/Cp+6JGN8H7bxFG2BhAXUnXak3X1bndzn1er
 GmgjsV+tZqTFR1fn8kb+sB+LdzOTjdJtAyvRhXSwr6FRAIXuPkNwlFFFX
 N5KcxdQbTZp2eyflVFvxsLAzWSfEl2qVGeFPY9y+Jd8lFs3y/E+wfg6eD
 Vr4gcbJM7Rs9ceCIT5c8/VwhF5CT0kS9rOo6Brc09cqnmrevWHAid9Sfx
 ZmlveTfCuIj/rJpnaffZSwlK6CSyr71aeUtHVwnsBusRqOxZAN3OHO4nC
 BG7FYwbQmTR2WmGa6hHmZBFQAIfyxcTNujqPpFZUXj/GJOO5mcHvwU6qT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339934224"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="339934224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 16:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="743490933"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="743490933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2023 16:47:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 16:47:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 16:47:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 16:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joGa4yg/IxkPp07g3W3Sk4kYswPvvd2LzUJlB7wxktPfWutSbmPD3RD/NMrKboKYWBO0ynEG6aQqB6ThY3eoKPQeNcxc1vnf+69TVnhRZ8uOcrAN809mMkx5ORSsoee5N90Iw7Zb8QmSi+o9ny7m9LXthlT/ElX3/OcKkYAGXGIgvOm46m0njTJDasTcpss08A/vKxLGeWaTQf2a+N4Gsb0QaZk80+ckSy7Qmj+R0UySefAhdhBSR4aFQkiMGF7g7Owg4sm0WLXCaD+wZ9qS0HtiHC4ffSiBpKMuCqwPMJOf0RzJ/DpPYmQRkXjyB6gFp0SUiBUwR3NuZXYAFgwl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rnuia+eiriDQGdQPz3JesOewnLIzmXiNlsaPsq+Mqg=;
 b=U+xPRX2KWCUOZoOHHs2gsIYCOEgLD95hSnlf6KKDqPVsjDQ0BuWrOcwjbT1xgFgwbaon3SOgsly1P3WOVFxsBzxxsznfFhTQ8e9qcFqbyr0LeMcav7h4bzs80eVEQsnqFnXD58BJMg86+tatmASvmK90OiwOMrX9+bFm3SLJ2S/UxnqP8kcuQFps/Q3aHuRgtb9tVQBtZCkGjeqF1sY8QIeIpSuO28nBY29MakF+CFKZ0M4GHHUzDSpQdFYmKVWsrVGbngKvQO+ZiiY26GLwQ0Rymxwu0wx8flEbhMN35d7h8pINCQ8hVc2owxMc/vCfq9/HIACHWel2aAaPANmqPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.24; Tue, 14 Mar 2023 23:47:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 23:47:02 +0000
Date: Tue, 14 Mar 2023 16:46:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230314234658.GC4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
 <20230314003012.2600353-15-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230314003012.2600353-15-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::33) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 626cca09-00a3-44aa-e7a2-08db24e6689b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: siFDAoKqWB38vB4wZGlklIHeobzP4iLv33XcfQl0l9Zh8whHoT2GfF9CC43HP5G7thlGEPeLFcBfMeDFt86sYiQ4Z6/eEtRbtC2HpA9+ulnQ3GKqBkc4EMM0FDk50Cv2gxiNfUatgFlJKuL4FbOx6yMxjJhQtkt42V04YTrxRximsyuSUtbUwx/eNpcWSSlc19rN0KYFMZRCQd1ASRHtNTQG30+kyRN516Y+WXut9btcf9hqeTSZ13uyLGr502CkqKzz+fvASlYOXtdsU8rrYvF7y5VJqSLRkuWB375vmDeP+0q1ZWrGPhr0depuMkRKDbLRwfzLfTgWV/hS5g0LPjG0ZIzSCdKT176hD3+sQwK56ytVQfSwW7A/KILC/10+F6zJ/pQ8Zfl/C3ZfSXeuVUzsGeZR5hWd5R7CCXG/2yiPu8H+BnFhq5oZ+o1WTsTXAtcEFZSwRZ051GldNzgQG2jukRbdM5jrAfhGBes9IB60qBFwLYG2tjslcN9KPlquhQywkHbo1RvtsMkH40xQ1T7p7M4YYccBZusNULCB46sAOEWZy0zb9nbz/c+hCdakLQzNXexiaaOf/ETn9D6+SNxg40p1nmUtJQ53WQglPK4fZ927jO0RLVaibeaepKzOnWM5pqoyR8RmAneScEkp+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199018)(5660300002)(41300700001)(186003)(83380400001)(66556008)(6506007)(478600001)(1076003)(6512007)(26005)(6666004)(6486002)(66476007)(8676002)(33656002)(8936002)(66946007)(4326008)(38100700002)(86362001)(6636002)(6862004)(316002)(82960400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mJ+bIRocAohWBYHoJqiMCboTGFPNQjdhEXP3M5FaiZOK1N0f0mr7TnJJH54Z?=
 =?us-ascii?Q?AeWAEal29WeBG77fgxqkg3KQmGfPVDDK+EB5AvxvrUPPmnYgu1GjNYbdKzET?=
 =?us-ascii?Q?jw7+6xC1ImROQQpsiaeI9KXpcS9389LCG1IniFYXsMoXaJG7/iMeu9Iw1rAR?=
 =?us-ascii?Q?8jeWQA2Cv4QdzcGP/N8nHextlLuxw6nQSjUrafwfV5YNcoZB3hL3xYPBN558?=
 =?us-ascii?Q?jOrWa4UTrHOV6BHkTZntZ5eeibeDvwAidbUyEDwGi7QIA4BQ3gGW8233yCFU?=
 =?us-ascii?Q?I0N21VA4RAhfr7Npn62xKiRdZmiKZVXXcfEL0W+1DqnZ8VkD5WrCV1pBL7tC?=
 =?us-ascii?Q?3HXHhDnPkEDw2DRIW2+2IJ5ioVhIpa0fH/cR9EjYeNWEsyZvMmNo9FEtuPyK?=
 =?us-ascii?Q?T3EUsK7lMH5Qhm26tyMol5QXHTKWDij84WtAu3FCuVReDTMe+h6T+BrqsYfT?=
 =?us-ascii?Q?e1hjzJ15R4Cf+tZxCy+/X510LwC4/3a9Lpd0gJJKnfpBhCO/Qbinjizkdl9z?=
 =?us-ascii?Q?xpaftxXVXZizzYkXGHJeVf07eX3caH8C+LNXnQIPZnYfZgpZogPnkFg2fGV6?=
 =?us-ascii?Q?4be01W+bXI4VCZoiACXcCM8nmSmo9rZKi7hft0wjVPI6AQSl7LRaMUBTBwya?=
 =?us-ascii?Q?s/hlgF9+DDa9bRF6xSJzS1SgNiTDEKYylR1vWMvx50kfj7I+kxEdqOUtcu8+?=
 =?us-ascii?Q?D7Y7qWQhxFHm56W9TBFZ2inndqXpUoOj6C50h0VRMDogd6upz5mnMIhp4jIn?=
 =?us-ascii?Q?5vIbOQ9e+Ut2PdxhViayMxxsXIx3E7erZLaaFmTVcqQO2KYPD7rNe+oBpoOF?=
 =?us-ascii?Q?9pwdTqRSzt6AHdUdx4cQcRhyuO4IjxpfK6/TDMpTN/7lNKEQdGkYBMWZV0aH?=
 =?us-ascii?Q?DpcYwyVRb/V5S7sPZGqBDslKC8GN2CHWazbM8vOWJvHBhzHAOQhQzni45OSO?=
 =?us-ascii?Q?7wUZiV51HJxKRhHS85XwHKBYDjmekmPOIt5RCBfSU1hOV+ZafHJU95kjouD/?=
 =?us-ascii?Q?go8klPblJCI3ynSISPiCmfgHWD8LOzbry6vZfQuq4w6QPbPsavyFgj5y4/TZ?=
 =?us-ascii?Q?EwaDFskh1oUhWjBOGDvmRk6nWMlcXzggnarNHFa6Zij/03hyFFxNnR4ww7fQ?=
 =?us-ascii?Q?BynlPeR+icMem0mm7BQxlkRfW4zH7unX+nP+zB10mHxR8dDOudQ6+/OoOhbj?=
 =?us-ascii?Q?IYEXzsmMylbd9aSIdHU6RdfDvQQy4DW60a9E9IkU1VHCXwP39OLILfjQsnLb?=
 =?us-ascii?Q?z8jvygsw3FZMprvURm1396YC/ldbW7zIqrSdyOWt2vXTG7tuhFvtekVja/Vu?=
 =?us-ascii?Q?M7av69yvbZQwljZujnYojn9dIs6a/upw5D67zMa/qzFK6r6NG9UvCAjL15QN?=
 =?us-ascii?Q?kLcys6QHRsNMGV0FdWW5WBoWjwByWJo9PxI0grgHCNwm6K0wLJGVvL/twBDF?=
 =?us-ascii?Q?O1qQff+3NaER9Q0foRmM1tsxcTM8YKA+cn8zOi+1OWqQfxpwvpux5phyr7vD?=
 =?us-ascii?Q?C9fgsjJoFj3ajmU9FSzXgap15SG2xlPEu8jVdpt4I0nv1AxQdQtbrE+vwl/7?=
 =?us-ascii?Q?GPFyTyuHbB+3i3vSHqnmc3gdi8QRO+JLn3vFYrCP4zUpS0o/QwsS5VjOgXuf?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 626cca09-00a3-44aa-e7a2-08db24e6689b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 23:47:02.0433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnzMRW9znl6wi9/x+TirzdQZISZ/AafNF3E2esmX8mCeBq/kGLb98YhH2PPoiZTtLLKUAqZNrOoXvsU5N2fdO6nNDxUEskgT1AV5vhYaGhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 14/14] drm/xe: Move policy on preemption
 from WAs to tunings
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

On Mon, Mar 13, 2023 at 05:30:12PM -0700, Lucas De Marchi wrote:
> The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
> and is not a true WA: it's a policy chosen to allow preemption settings
> to be controlled on a per-context basis by userspace. Move it to
> xe_tuning.c since it's more in line with what his is doing. However
> since it's not something suggested by the spec, prefix it with "Policy"
> rather than "Tuning".
> 
> Also, there's no reason to apply this policy only between graphics
> version 1200 and 1250. Apply it to all versions, like i915.
> 

The big mega-comment in i915 was explicitly requested by the i915
maintainers since the way preemption is controlled is kind of hard to
follow from the bspec, and there aren't many people around who still
remember the old discussions about this stuff from a decade ago.  We
should probably bring at least some of that text over to Xe as a comment
as well.  We can drop the stuff about gen9, but the explanation of the
two control options and list of related workarounds is something we
probably want to preserve.


Matt

> v2: Apply for all graphics versions, not only [1200, 1250]
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c |  2 ++
>  drivers/gpu/drm/xe/xe_tuning.c    | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tuning.h    |  1 +
>  drivers/gpu/drm/xe/xe_wa.c        |  6 ------
>  4 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 63a4efd5edcc..53dc342cc3a3 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -22,6 +22,7 @@
>  #include "xe_mmio.h"
>  #include "xe_reg_sr.h"
>  #include "xe_sched_job.h"
> +#include "xe_tuning.h"
>  #include "xe_wa.h"
>  
>  #define MAX_MMIO_BASES 3
> @@ -293,6 +294,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  
>  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
>  	xe_wa_process_engine(hwe);
> +	xe_tuning_process_engine(hwe);
>  
>  	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>  	xe_reg_whitelist_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 7ff5eb762da5..c8045872c0a1 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -27,6 +27,16 @@ static const struct xe_rtp_entry gt_tunings[] = {
>  	{}
>  };
>  
> +static const struct xe_rtp_entry engine_tunings[] = {
> +	{ XE_RTP_NAME("Policy: FtrPerCtxtPreemptionGranularityControl"),
> +	  XE_RTP_RULES(ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> +			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> +	},
> +	{}
> +};
> +
>  static const struct xe_rtp_entry lrc_tunings[] = {
>  	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> @@ -63,6 +73,19 @@ void xe_tuning_process_gt(struct xe_gt *gt)
>  	xe_rtp_process(gt_tunings, &gt->reg_sr, gt, NULL);
>  }
>  
> +/**
> + * xe_tuning_process_engine - process engine tuning table
> + * @hwe: engine instance to process tunings for
> + *
> + * Process engine table for this platform, saving in @hwe all the
> + * tunings that need to be applied at the engine level that match this
> + * engine.
> + */
> +void xe_tuning_process_engine(struct xe_hw_engine *hwe)
> +{
> +	xe_rtp_process(engine_tunings, &hwe->reg_sr, hwe->gt, hwe);
> +}
> +
>  /**
>   * xe_tuning_process_lrc - process lrc tunings
>   * @hwe: engine instance to process tunings for
> diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
> index 2b95b0c8effc..4f9c3ac3b516 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.h
> +++ b/drivers/gpu/drm/xe/xe_tuning.h
> @@ -10,6 +10,7 @@ struct xe_gt;
>  struct xe_hw_engine;
>  
>  void xe_tuning_process_gt(struct xe_gt *gt);
> +void xe_tuning_process_engine(struct xe_hw_engine *hwe);
>  void xe_tuning_process_lrc(struct xe_hw_engine *hwe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 59d2daab5929..a607f476a6ed 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -272,12 +272,6 @@ static const struct xe_rtp_entry engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
> -			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
> -	},
>  
>  	/* TGL */
>  
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
