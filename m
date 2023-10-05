Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C0BE936EC
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 00:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40AE10E14B;
	Thu,  5 Oct 2023 00:21:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FC610E14B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696465315; x=1728001315;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ncj8//vPzdX+ADEamq9Wh1RdWxzonKJdWBfZVwPEVJ8=;
 b=NQbHAsBA5Hko2bhO+OMx9by/7Rk6XDLYxJwZ9SDSf+XfABV+kt/jkUF8
 Y40dRVj7hnA6xA0AUWGuxSXBJdUskwIkHNf76N73zcpCbKH4ME6t/wZzc
 7OhCRNx2EISB9SJJuls9NsllvcFRO/ipsJ12IKjGEZnZUGlIZustUEE1m
 GR7a/tUfXPk4meS7eDJjrxON5BghLaXEEBCb9Sf//Dvxdx9XKXU5NN5OU
 Mi/XyvChl4erqAsi8ucPr7iLszOPUR1a0p907MvgKuKgdFUS5xdL3fpPU
 s+GVTPG5glr0Q1cpvd22cXAeV5Goju93D0aodFhuPXJTzYz3YUCCmsBTf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1948460"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="1948460"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 17:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925369323"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925369323"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 17:21:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 17:21:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 17:21:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 17:21:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 17:21:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmB56EOcT2dyXdtnsHC54TBKNau9YzeUiPPOBsLbss3rAUWY3FJMFMomyHWSVEi+HYRy3mTbpyDsEd5wCiTHlGcUxoh71CMFmP6LmK+lTwB0corcWBZewd5cFU8FeEAJW7ab+G5WInoz0Ej+ZlQPoV7ihsfV+MiMJpljiCy0CniUq60vjwMz3GyoQ6JKhi6YFTKTMr7BX555NY9omBsEPfuwANh1L7HB7MPoqf5mWvgvk9FM56W2EINx7oxsFMAgI2PAk7T5f9rdbKUMKlvXuzhMyY29Y3/f1uzk93DLLelgKdiN3X26qaVjWhmxiDnu1Z0eJj1zTaVibC4SpLtefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozBwEbTHB+cVvP5ht461/JDodg0p1dAnmkiBvU8xy18=;
 b=D+aivQk+nkPlOE1W2awcjyHzIGC6dxrxVSEysYBRdsiBxlo3f9lDClbSduL0jzxN64iNaWBEpeDTxSgNX6aIzwtsLeMTowU1A3kkroUekYtHZScnTmWHzEHmasQ2DHc7mwjJ9uKXZAdhwg7w/dlVPA1jcOYWHgtCdzMfqOLpaQwTvxNPWneIuQeQQ3kQYCofBLCOQHrelXRQ0FZ39prTHobDuMV0c1HavUY6K/8C9+kCqdwmeqkfyaqpxqKDoyhyZNc5wkGBWSB/uDnzC4YBa3j6WMsMcKzlMhHfbgju8BEbVmPN3SvNwvJxQvK+ubdPy1FdZnjDEGtfuFWDOdIQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Thu, 5 Oct
 2023 00:21:52 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Thu, 5 Oct 2023
 00:21:52 +0000
Date: Wed, 4 Oct 2023 17:21:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231005002144.GG53570@mdroper-desk1.amr.corp.intel.com>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
 <20231003125217.3350838-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003125217.3350838-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0281.namprd04.prod.outlook.com
 (2603:10b6:303:89::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c7120f4-3025-48c4-5b52-08dbc53912a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USwU7MvXPWZ4WglQGIB3MYs49EFBXNmR/A2qqsfkgsV1GeMckLTFqRz1dW5xQKvTqvlVm2t7Qo9PYv44v0xs+mogQttLERFFamHJzvCDeS47LSz2DbTAWaAr1Z2zC8euWjrDCneQY8bzMDnGhFbm0RpqPHai16PFb2wErnE4Z6Vu/k9nMeDq+LV7GYvrn9LpqZ7ZhxuHaq1XizUtR5hXN0JG+JqM+uwpqb8ck9K2FfDyZvtZldUP+x+dfJki0YIxiS+a1POinyrK0/GFf4798dPxTS6bXyGEbQjbp5GHFrg3xW2LTN3o5syQ2TR3NW8lYi6zcpxBM+jy1CsGj+htomD2E7ER2bFU8A/XAN4nUbjiHSwIVA2eI5SpRsnqmy/WpVeyNCfsOd2C9EBOGXBewBsZ7rTOksTmV4hb/KcFLVfCCxFM4bwpbjw/1sfT/c1XI1pljfvxll6NW/3wQ4UJO6SgqjzMWtIZMOV2QE8+JQn0NihQ3BLvHbkkRmXUqDtmrrshQraX4XVZy5JUeqROmnhNLFqORfbbciH6qheWEpn8t/oRUNkyfvZZepKT/NTK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(33656002)(41300700001)(30864003)(86362001)(66476007)(6636002)(316002)(6666004)(66556008)(478600001)(83380400001)(66946007)(6486002)(2906002)(4326008)(6506007)(6862004)(8676002)(8936002)(26005)(1076003)(5660300002)(82960400001)(6512007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UHn0LgEq879S0kIveqqtQ4HSMG4At8n0PX9tUYuzTCY/US0oksBXLpqhGcv?=
 =?us-ascii?Q?QcyEIfMlvAMmBe4R6C3vmHtak2WwPtXRe+ZXmP7XEZRsTMo5xxyBRihh5Gfp?=
 =?us-ascii?Q?add2hFG+3ghJN79QwDTGOwaaIsq2d0HDJjkxejbJ/QHJCLSQQkmZT8hFMM4K?=
 =?us-ascii?Q?N35H9u045l5qw00vl1ZyMVIDmx1kkjz+h4URU4vTBAr9HyRjQJmOAP3JVEd7?=
 =?us-ascii?Q?Fje6lWmGGdFKTs0zR7GQJr0c/cqOII9Nm8l4aSrotUGhxQJYJxo+2AjV0Iq5?=
 =?us-ascii?Q?3LIQ5htiyDCY9nzm8FmlLSXGB2eViQ4cEAW2PbCrtdORm3grIkUhirIX22Vw?=
 =?us-ascii?Q?4GaimHYvBiIMlj7VRwkT9viqdkDu8sd4Z/BAQHYpMUJCnXFTmooitddUEi3O?=
 =?us-ascii?Q?IxGKAUSYI55dhEQcslt1JjNrDTvHuJa9NHd3QicV4Y66R4/ilfQbnvn2EoMX?=
 =?us-ascii?Q?pFOewiL8gbRAG4i6RxQ/lvSmdgBLD9x6cED0xmje5YLL1iqKXkmVWYBX1fBQ?=
 =?us-ascii?Q?dWO5EbCLL9nLUeFM4ehX38iCgz546+E0GsNH8P6tzyaHsuYgsKVCIpbVWIqp?=
 =?us-ascii?Q?FjkUTqAZwkSHuuc8xBqnMDxUDzHHa8FU9u8zxWRZjmctU3GAkSRZjcXari9Q?=
 =?us-ascii?Q?1N5Yi5hlX6o6EFC3C28id9joH9M+L5B1ImgJamF2cmma0FGuEc+ixOtLQ6sl?=
 =?us-ascii?Q?6vDRa8p2oehoR7ULgBv2CY4PvW5xDAEGRlj4treNkX9SOB5zBOlluPaSiO8q?=
 =?us-ascii?Q?ibCFrF+GprL8zSxh9FpYjUbieo786+26OIBb58nchJiOplYz+TUotffyFFk/?=
 =?us-ascii?Q?I8lKxejkwaB6tn87vztTmuyunof6LTDxxx+U+p/yoFks14Zkegf0d6xdx1sG?=
 =?us-ascii?Q?jr3L6OM8t/oQv9twfi+Gp1dCB/ACNwiTdEO8WiVhsxUMg42FKHFX9mRW9YnH?=
 =?us-ascii?Q?lX8b/e/tvntAxpA14xnqSKU62FryTlYXg3Jk89dX91afEKRSI6FYC7ew6+GF?=
 =?us-ascii?Q?2ikUaB7juIX+wHM89NFXOYV31J8mtGGs28R9Cx43b67sX7o2845LKx5LNa56?=
 =?us-ascii?Q?HCgScaj3cA+iVgqI6TOAI7dyq8AU08dYmVRKNo0KuODHBUFu0Nl45eQeKjyN?=
 =?us-ascii?Q?YwySaQRbtAdpAs1sBWv7zKhoV6ovECUsce6c+LA689uZA6T7ISPOIbarDJfv?=
 =?us-ascii?Q?c8ZopFo9zOjbL4PbLsp54+iHvtf3U2Ec8IPXfZXRkw7kGx4fwpXaTFhd3edf?=
 =?us-ascii?Q?gRYIYMYGVIg0pPTbFkeBEd9uDZmtkEp0+SKOyVZiK4JHGID7LUwtlL6u/gQJ?=
 =?us-ascii?Q?GqRuj9yQckdmjhRIPEaNT2M35Rsl6Lu2cMlb/+d4guORNVrpwJpw0YwJXIzJ?=
 =?us-ascii?Q?30pxGsPwojjHcCgwRwgjR0DXNOueoTnsVr0yM2fx7QE3hTRcnfxWvT1T4RMi?=
 =?us-ascii?Q?FgC4SAhF0ReDv5yCqD5x6f9WZwTFBqeqpU52mzPQq9D5omR+J+TUn1lElJXC?=
 =?us-ascii?Q?Fz5NoOhmv3PYb8lqmbFf9D9pOopiEBiPCl0mdKUfaIRENWS64pinKhydH2Qu?=
 =?us-ascii?Q?uBVeUG1YBpQ5RdLpunWq17WDJG8qWeNFQsuSnzp4DJvbk8WehfwLm3NXjYAA?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7120f4-3025-48c4-5b52-08dbc53912a1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 00:21:52.0693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wB+Fk+ceVXQz52CZ1e+t/p75eKQTt8AExxL/xCavzsIvz/seKBXBTlmy38/c15MPkV+syMLQAvlZoUQhk68DrRz8qExuwD7q2kYdPW2AaYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/pat: Add debugfs node to dump
 PAT
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

On Tue, Oct 03, 2023 at 05:52:16AM -0700, Lucas De Marchi wrote:
> This is useful to debug cache issues, to double check if the PAT
> indexes match what they were supposed to be set to from spec.
> 
> v2: Add separate functions for xehp, xehpc and xelpg so it correctly
>     reads the index based on MCR/REG registers and also decodes the
>     fields (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  12 ++
>  drivers/gpu/drm/xe/xe_pat.c        | 204 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_pat.h        |   8 ++
>  3 files changed, 223 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index ec1ae00f6bfc..cd6d28c7b923 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -16,6 +16,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_macros.h"
> +#include "xe_pat.h"
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
>  #include "xe_uc_debugfs.h"
> @@ -138,6 +139,16 @@ static int workarounds(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int pat(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	xe_pat_dump(gt, &p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -147,6 +158,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"ggtt", ggtt, 0},
>  	{"register-save-restore", register_save_restore, 0},
>  	{"workarounds", workarounds, 0},
> +	{"pat", pat, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 296763594370..1c89137fc66b 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -6,6 +6,8 @@
>  #include "xe_pat.h"
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_assert.h"
> +#include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
> @@ -14,6 +16,7 @@
>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>  								   0x4800, 0x4804, \
>  								   0x4848, 0x484c)
> +#define _PAT_PTA				0x4820
>  
>  #define XE2_NO_PROMOTE				REG_BIT(10)
>  #define XE2_COMP_EN				REG_BIT(9)
> @@ -26,10 +29,12 @@
>  #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
>  #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
>  #define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
> +#define XELPG_L4_POLICY_STR_MAP			{ "WB", "WT", "(N/A)", "UC" }
>  #define XELPG_INDEX_COH_MODE_MASK		REG_GENMASK(1, 0)
>  #define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
>  #define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
>  #define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
> +#define XELPG_INDEX_COH_MODE_STR_MAP		{ "NO", "(N/A)", "1-WAY", "2-WAY" }
>  
>  #define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
>  #define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
> @@ -39,10 +44,12 @@
>  #define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
>  #define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
>  #define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
> +#define XELP_MEM_TYPE_STR_MAP			{ "UC", "WC", "WT", "WB" }

Is there a benefit to making a #define that builds three separate tables
inside different functions rather than just adding one file-scope table
that can be referenced from each of those functions?

>  
>  struct xe_pat_ops {
>  	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>  	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
> +	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
>  };
>  
>  static const u32 xelp_pat_table[] = {
> @@ -151,14 +158,143 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> +void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, err;
> +
> +	xe_device_mem_access_get(xe);
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto err_fw;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
> +		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +		u8 mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +			   mem_type_map[mem_type], pat);
> +	}
> +
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +err_fw:
> +	xe_assert(xe, !err);
> +	xe_device_mem_access_put(xe);
> +}
> +
>  static const struct xe_pat_ops xelp_pat_ops = {
>  	.program_graphics = program_pat,
> +	.dump = xelp_dump,
>  };
>  
> +void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, err;
> +
> +	xe_device_mem_access_get(xe);
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto err_fw;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
> +		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +		u8 mem_type;
> +
> +		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +
> +		drm_printf(p, "PAT[%2d] = %s (%#8x)\n", i,
> +			   mem_type_map[mem_type], pat);
> +	}
> +
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +err_fw:
> +	xe_assert(xe, !err);
> +	xe_device_mem_access_put(xe);
> +}
> +
>  static const struct xe_pat_ops xehp_pat_ops = {
>  	.program_graphics = program_pat_mcr,
> +	.dump = xehp_dump,
> +};
> +
> +void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, err;
> +
> +	xe_device_mem_access_get(xe);
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto err_fw;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		const char *mem_type_map[] = XELP_MEM_TYPE_STR_MAP;
> +		u32 pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +		u8 mem_type, clos;
> +
> +		mem_type = REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat);
> +		clos = REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat);
> +
> +		drm_printf(p, "PAT[%2d] = [ %s, clos=%u ] (%#8x)\n", i,
> +			   mem_type_map[mem_type], clos, pat);

I guess using human-readable strings works, although I was originally
expecting these to dump in the same format as the Xe2 table below to
make it really quick/easy to compare against the way these are written
in the bspec.  E.g.,

    PAT[0] = [ 0, 0 ]  (xxxx)
    PAT[1] = [ 0, 1 ]  (xxxx)
    ...
    PAT[7] = [ 2, 3 ]  (xxxx)

I don't have strong feelings about it though since the pre-Xe2 tables
are really short and simple.  This approach looks fine too.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	}
> +
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +err_fw:
> +	xe_assert(xe, !err);
> +	xe_device_mem_access_put(xe);
> +}
> +
> +static const struct xe_pat_ops xehpc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +	.dump = xehpc_dump,
>  };
>  
> +void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, err;
> +
> +	xe_device_mem_access_get(xe);
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto err_fw;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		const char *l4_policy_map[] = XELPG_L4_POLICY_STR_MAP;
> +		const char *coh_map[] = XELPG_INDEX_COH_MODE_STR_MAP;
> +		u8 l4_policy, coh;
> +		u32 pat;
> +
> +		if (xe_gt_is_media_type(gt))
> +			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +		else
> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +
> +		l4_policy = REG_FIELD_GET(XELPG_L4_POLICY_MASK, pat);
> +		coh = REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat);
> +
> +		drm_printf(p, "PAT[%2d] = [ l4_policy=%s, coh=%s ] (%#8x)\n", i,
> +			   l4_policy_map[l4_policy], coh_map[coh], pat);
> +	}
> +
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +err_fw:
> +	xe_assert(xe, !err);
> +	xe_device_mem_access_put(xe);
> +}
> +
>  /*
>   * SAMedia register offsets are adjusted by the write methods and they target
>   * registers that are not MCR, while for normal GT they are MCR
> @@ -166,6 +302,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>  static const struct xe_pat_ops xelpg_pat_ops = {
>  	.program_graphics = program_pat,
>  	.program_media = program_pat_mcr,
> +	.dump = xelpg_dump,
>  };
>  
>  static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> @@ -180,9 +317,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
>  	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
>  }
>  
> +void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int i, err;
> +	u32 pat;
> +
> +	xe_device_mem_access_get(xe);
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (err)
> +		goto err_fw;
> +
> +	drm_printf(p, "PAT table:\n");
> +
> +	for (i = 0; i < xe->pat.n_entries; i++) {
> +		if (xe_gt_is_media_type(gt))
> +			pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +		else
> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_INDEX(i)));
> +
> +		drm_printf(p, "PAT[%2d] = [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n", i,
> +			   !!(pat & XE2_NO_PROMOTE),
> +			   !!(pat & XE2_COMP_EN),
> +			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			   REG_FIELD_GET(XE2_COH_MODE, pat),
> +			   pat);
> +	}
> +
> +	/*
> +	 * Also print PTA_MODE, which describes how the hardware accesses
> +	 * PPGTT entries.
> +	 */
> +	if (xe_gt_is_media_type(gt))
> +		pat = xe_mmio_read32(gt, XE_REG(_PAT_PTA));
> +	else
> +		pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_PTA));
> +
> +	drm_printf(p, "Page Table Access:\n");
> +	drm_printf(p, "PTA_MODE= [ %u, %u, %u, %u, %u, %u ]  (%#8x)\n",
> +		   !!(pat & XE2_NO_PROMOTE),
> +		   !!(pat & XE2_COMP_EN),
> +		   REG_FIELD_GET(XE2_L3_CLOS, pat),
> +		   REG_FIELD_GET(XE2_L3_POLICY, pat),
> +		   REG_FIELD_GET(XE2_L4_POLICY, pat),
> +		   REG_FIELD_GET(XE2_COH_MODE, pat),
> +		   pat);
> +
> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +err_fw:
> +	xe_assert(xe, !err);
> +	xe_device_mem_access_put(xe);
> +}
> +
>  static const struct xe_pat_ops xe2_pat_ops = {
>  	.program_graphics = xe2lpg_program_pat,
>  	.program_media = xe2lpm_program_pat,
> +	.dump = xe2_dump,
>  };
>  
>  void xe_pat_init_early(struct xe_device *xe)
> @@ -202,7 +394,7 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.idx[XE_CACHE_WT] = 1;
>  		xe->pat.idx[XE_CACHE_WB] = 3;
>  	} else if (xe->info.platform == XE_PVC) {
> -		xe->pat.ops = &xehp_pat_ops;
> +		xe->pat.ops = &xehpc_pat_ops;
>  		xe->pat.table = xehpc_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
>  		xe->pat.idx[XE_CACHE_NONE] = 0;
> @@ -252,3 +444,13 @@ void xe_pat_init(struct xe_gt *gt)
>  	else
>  		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
>  }
> +
> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->pat.ops->dump)
> +		return;
> +
> +	xe->pat.ops->dump(gt, p);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 168e80e63809..09c491ab9f15 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_PAT_H_
>  #define _XE_PAT_H_
>  
> +struct drm_printer;
>  struct xe_gt;
>  struct xe_device;
>  
> @@ -21,4 +22,11 @@ void xe_pat_init_early(struct xe_device *xe);
>   */
>  void xe_pat_init(struct xe_gt *gt);
>  
> +/**
> + * xe_pat_dump - Dump PAT table
> + * @gt: GT structure
> + * @p: Printer to dump info to
> + */
> +void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p);
> +
>  #endif
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
