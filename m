Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FC3C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 18:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3B810E0E8;
	Thu,  9 Nov 2023 18:24:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FDC10E0E8
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699554244; x=1731090244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9E4DTopFhfSj4+YUgnYL315qklp+QtMsf26FDwRWzy8=;
 b=lEUSTATayQGTE644cTInPfGAuNv8IbhrpaL/BzgcsEJkzQLR7COmYh/R
 A6kLEWsWu5czXxC0DWmqgY6ljEmvNyk+mshOV9GTR21+A8jKZK7Cqk8ou
 gGI9rBa0U5psCVMZOrpJO2Oo32kftGtAKNaJ4cC3yjqBVRiSW6z2UGKhr
 9w3VuL4Zn87SRvIVZL0/9AM05h0pHkCTc5Lbj1cMAjRnVDWaci16O+zhu
 VQiojt0xV9OREBHbIGXDqSvU/5Vpa758/8ui5k5fpGyAP1VK6HC25jij/
 A2ARKTQAJsEnNPBv9GdUehFqxVQu26fDmp//+GgMGTt78E4FeZHANC34R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392919499"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="392919499"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 10:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="739916592"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="739916592"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 10:24:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 10:24:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 10:24:02 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 10:24:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYRNemGAyRtUwZ5auauVcauMJ+iq+rSb2jJM9wt8kvIN0vfEdnEK+X733pDQUrzMcIVuJ1mPQwwcoJjniyum/NrQmZrGVwadnzXF1dgtu7q6079UYxr0ruDM/wZATWg/+hTg5opxnB4SeytrOT1rFzwsB3tODEgJLh1lOp+cVsoJ/b5pJNaaI81GQapMhX35RMMOYLMnsSHtw2PGW3n+1Jw0or7Tqiqf2+bswJoSQcvLEA2fKL9PkfLc1hrMeVEekilC3XuMARNdN80RgpFnbJzZVBWe0/SkrZ/act7u3mHiiSaHZ2J3+V+Vh4X2T+4LmexQGMz58woNI9VZ/rgQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BwLhPPwc8+4+SCGUqOJND2iEqU9dUgWVTq+ycZPPVM=;
 b=W8vy87jGjv2+M5XhisZP+deT1tE8AoaIiWApPlHtMKBSbVlj6ZJW+s7d8/ifLW5j1XqK7DBS4rOm7eCW38q4WDRN4TAq48vrQ4VUSBWgi+Yaegzg+9ZWQzg46hUP1qhRbjWLBU1H1dggwpM8MN0KgqyaUOTAC6cQ0zBouw+Ep14GNr+F0ostT/E7biLEujekd+7D7aQKzt3/UT1LmAzfKcSM6UtJzQIOalzeDhqiIOPSlbw6GrjqgzGLUEfaYfJFZz6BG63cyqSq/R6lQdyIsHl7LTG8j/YWbhESRYVaqqjoirzaNZOzifNDg1kgwnFoZo1j+FQKMXfYOYHGMqn6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5164.namprd11.prod.outlook.com (2603:10b6:806:f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 18:23:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 18:23:57 +0000
Date: Thu, 9 Nov 2023 13:23:53 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZU0juVb6n9JMuMnP@intel.com>
References: <20231109003339.399480-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231109003339.399480-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: db4213f0-7292-49ba-c035-08dbe151098d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38/d2kh9FIQgaNL135ZuOr0cQzGr2LN0EXBvvcrLU49EcCFI/D/5C/xcyToadM2Coia5ZzAJpMBADMCvApJff6U79uzYMM4i12l/D47NMIWmdPFU0SytWlSG3EYvySCtMGiqR+X6ygLBCNYKyupI0lEQJ4A3mYcE2QR19VFcXUjdv0A6i9yZO9dAkcqnM0USdZ2RdC3VWclgYeugnW4B9v6+beq5Dwikw6hhfjqpbqI4clTel615f5/d7EWn9flBZmsx7DEOAMSqUE4i/eiXJrySgEUT6k2Au7qL/PEU0/e+Y2NVXICI2YqpkpuAx+WtEiEzl9vi6YuRKwRmB5l0ZdDCDqx+/YBK819/JZbeS98zuSoHlguO0mBD0xWUKMiPqC2NB/ifyPNHgC0aEl02hrlzSi00y4Dc0XybW9hOjGSaXjWUeIIWfOW5FKcDvxzSb1wR5fpFQWIIFGgaUQzRzKpJvf6MEOvKTJ5p4m8D8BflVZAf3vW9x6E/j+3crwaoDlH6yig0Ak9I/6NTwyfKunA0YGSuVceBiLzKp2yw8Pab0w8rzGeInDYV65kGPLqj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(26005)(2906002)(41300700001)(83380400001)(5660300002)(2616005)(6512007)(6486002)(6506007)(44832011)(36756003)(6666004)(316002)(8936002)(38100700002)(478600001)(6862004)(86362001)(4326008)(8676002)(6636002)(66556008)(82960400001)(66476007)(66946007)(37006003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TJJzRK6nqVeWZFtSd1J9i6BIY7tdkUMRtRxVq2Nd7NgDYTDcd0q5iRO/QjX/?=
 =?us-ascii?Q?HHY/1RzrS/HiFIJczVRIroOeRm9DQvg5KkQDo9W+2EZwfJWce3R+1Xl6la+0?=
 =?us-ascii?Q?lRqrqb5Hv+8Kuf4JvrgEWMz2TW5QSun0K1ak6V42qbAATFwN8dpTIDMGfPvo?=
 =?us-ascii?Q?tWRQ2Sc4MGod7seqniqVKmo0sy64MdS4QwKNwHwqK7C+eMljcn1AdpZFGIAM?=
 =?us-ascii?Q?azUC4PT/681JKGf3Ho1tWpRRhQ4cmu1cidp1PN+eQMdRkbnJJWgVeuvjKNP3?=
 =?us-ascii?Q?RgykhQC/WNLAAGCX6Wyn3EfAXQHo/y1rvka3LcXTfqoVWOvNZbE3Bn9IKds9?=
 =?us-ascii?Q?/QsHi01L07/6heigYY05CydcdaRa8RHfWCzw3myKNF2xVieynOAmq9psTKSQ?=
 =?us-ascii?Q?1Qv2LJ+BgmxpWmwqziOtRRpIWRSAIrpsY893yfPBF+zAJZDHaIapk0XsZuJ5?=
 =?us-ascii?Q?Ho+WNdjbIZO8DeDXsvdN3OyCYTQnXQ6bWelvqI1VtYYs43Z4gvX3xaXY+a1n?=
 =?us-ascii?Q?iTBb+Lh6DYlAwA9e5ZAbR8i9dZ7XxvWdCJ7qVvHwMoUNH/le4+KG4uHKebCs?=
 =?us-ascii?Q?pRtlrnLq/viGl4UB7lbpuceSRm2i4lzt3xfxTcUrrdy+VN5+SSAEtpoT21Yq?=
 =?us-ascii?Q?DYeylG2JqO/Hc/rQFWX6Mx3O+jEChTF+E39wNTZhhqihx2dmwrzkT3VmG/gb?=
 =?us-ascii?Q?GbfkeDAUMeoRHktXL/hvek39/5dRE9NIV8x5HAImWidbCJ5WDWzDhnShxEff?=
 =?us-ascii?Q?5Cpl+XyA7y0dL+8ZxUhwO0NgjqJisHq4+qzmIWpzsPC/+Fc1thq3BmpE6Q3K?=
 =?us-ascii?Q?gf7/qMSaQWFDQe+BGctHz0+s8r8gJPneK4iibdA24++VonIhKeXj3xR/WoMN?=
 =?us-ascii?Q?4TtjCz5bX4JMXB2IZG/HH8Pw4Mmhg5233dqGFz9CLWD5LSE9Av6FicHGLadZ?=
 =?us-ascii?Q?IhU1tufqrAOYRkv6cCxPSzlDXNPajcGpxbbmja7JhJk+13PIfRWmcTuXwW9L?=
 =?us-ascii?Q?X0xilxn9WP7zXFWwPbLEBphRfxQt/Tv9Vm8AfichFGXpidkmwxZYtB22s2Rj?=
 =?us-ascii?Q?wGPCF8Zv28JWwDxDbDc49+2iQF1cf/78GPrnpiSsmUnhxTYf4ekCziI2Ebrh?=
 =?us-ascii?Q?b2VUUIWWQELIHkP5BlsT+zf7KTkAqJDo3+nXSTCgStgoWUIIirqr8OoumuPc?=
 =?us-ascii?Q?CU//TExcDiLkNrGDALKj0BwIlyBVhQvU/d14rqm/Ne/oMiiR+gkuia7/UMyi?=
 =?us-ascii?Q?VqE4W8CIdNvvxpinXYf8/td3EaRa94vkl9z37vCPh7Vcfexj7yf9JE/n/dm9?=
 =?us-ascii?Q?2900D2ec/mtdWZsP7g4yHlgnni65wZcMipaNCidkaYieWBTWZ25/tXYn+ZXA?=
 =?us-ascii?Q?43yp2r5YJoox/Z2QS3hInMMkM6V/Z90XmKM5zoME6cHO2f/ML4ASeGGGxDEf?=
 =?us-ascii?Q?EeTcYvXwNBd8I9DsY++8iO3chUdfbyG/co/vKuSe989gXH3NGk4vH1RD96FZ?=
 =?us-ascii?Q?5txGChpAoX8CKySfBZzUHpfr+iyB+qsZjcTGvKTK3wWht6yJQpcyH5Zrqru2?=
 =?us-ascii?Q?gTDFTDkIiCvTOfzspWwqaY7feJZ22EWTUld3IySe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db4213f0-7292-49ba-c035-08dbe151098d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:23:57.5232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk0pPeedyVdO63p0QB3rBRvwKV+LA7TjaUmOpUjB2OzuJM6VKdQoApLiBo1NVn4ihjcQTF8yyvanexN96bPCHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5164
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Raise GT frequency before GuC/HuC
 load
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

On Wed, Nov 08, 2023 at 04:33:39PM -0800, Vinay Belgaumkar wrote:
> Starting GT freq is usually RPn. Raising freq to RP0 will
> help speed up GuC load times. As an example, this data was
> collected on DG2-
> 
> GuC Load time @RPn ~ 41 ms
> GuC Load time @RP0 ~ 11 ms
> 
> v2: Raise GT freq before hwconfig init. This will speed up
> both HuC and GuC loads. Address review comments (Rodrigo).
> Also add a small usleep after requesting frequency which gives
> pcode some time to react.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +++
>  drivers/gpu/drm/xe/xe_gt.c           |  4 +++
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 49 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>  4 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d..12651d280591 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -244,6 +244,11 @@
>  
>  #define RPNSWREQ				XE_REG(0xa008)
>  #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
> +
> +#define RP_CONTROL				XE_REG(0xa024)
> +#define   RPSWCTL_MASK				REG_GENMASK(10, 9)
> +#define   RPSWCTL_ENABLE			REG_FIELD_PREP(RPSWCTL_MASK, 2)
> +#define   RPSWCTL_DISABLE			REG_FIELD_PREP(RPSWCTL_MASK, 0)
>  #define RC_CONTROL				XE_REG(0xa090)
>  #define RC_STATE				XE_REG(0xa094)
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 74e1f47bd401..a0b216b87bef 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -29,6 +29,7 @@
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
>  #include "xe_guc_exec_queue_types.h"
> +#include "xe_guc_pc.h"
>  #include "xe_hw_fence.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
> @@ -340,6 +341,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	/* Raise GT freq to speed up HuC/GuC load */
> +	xe_guc_pc_init_early(&gt->uc.guc.pc);
> +
>  	err = xe_uc_init_hwconfig(&gt->uc);
>  	if (err)
>  		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index d9375d1d582f..c6884f9df5fc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -247,6 +247,12 @@ static u32 decode_freq(u32 raw)
>  				 GEN9_FREQ_SCALER);
>  }
>  
> +static u32 encode_freq(u32 freq)
> +{
> +	return DIV_ROUND_CLOSEST(freq * GEN9_FREQ_SCALER,
> +				 GT_FREQUENCY_MULTIPLIER);
> +}
> +
>  static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>  {
>  	u32 freq;
> @@ -257,6 +263,32 @@ static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>  	return decode_freq(freq);
>  }
>  
> +static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
> +
> +	/* Allow/Disallow punit to process software freq requests */
> +	xe_mmio_write32(gt, RP_CONTROL, state);
> +}
> +
> +static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	uint32_t rpnswreq;
> +
> +	pc_set_manual_rp_ctrl(pc, true);
> +
> +	/* Req freq is in units of 16.66 Mhz */
> +	rpnswreq = REG_FIELD_PREP(REQ_RATIO_MASK, encode_freq(freq));
> +	xe_mmio_write32(gt, RPNSWREQ, rpnswreq);
> +
> +	/* Sleep for a small time to allow pcode to respond */
> +	usleep_range(100, 300);
> +
> +	pc_set_manual_rp_ctrl(pc, false);
> +}
> +

I believe we should move this functions to a new component...
but this is for later... maybe we will get an xe_freq soon and then
we refactor. But the gains are good and the patch is clean,
so let's move with it:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  {
>  	/*
> @@ -685,6 +717,21 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>  	else
>  		tgl_init_fused_rp_values(pc);
>  }
> +
> +/**
> + * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
> + * frequency to allow faster GuC load times
> + * @pc: Xe_GuC_PC instance
> + */
> +void xe_guc_pc_init_early(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +	pc_init_fused_rp_values(pc);
> +	pc_set_cur_freq(pc, pc->rp0_freq);
> +}
> +
>  static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>  {
>  	int ret;
> @@ -918,8 +965,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  
>  	pc->bo = bo;
>  
> -	pc_init_fused_rp_values(pc);
> -
>  	err = sysfs_create_files(gt->sysfs, pc_attrs);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 43ea582545b5..054788e006f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -17,4 +17,5 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>  enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>  u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> +void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.38.1
> 
