Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55860C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 23:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F374C10E06D;
	Mon, 13 Nov 2023 23:31:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8110E06D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 23:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699918302; x=1731454302;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2RTrTO4NfX6cuaNTBwnZ+4XshI1M0cHgeY8UJ6gtRMg=;
 b=CtTPQ38jZKKGfgcZfeVKn0ygwgecDwnOkWB4XBKeGF1RRnzYOChsYO0s
 ASf5xlaC0nto9W+0f8guFgyzEl1QKdRq7ojg9zxfAXNfqEGmhvQthZWXi
 Z+jLtgdnIEngAZd0o14jSKtkAL/Hux6uLKRTq1OT1GWQW8DDdxB/s9dpe
 OQ3E7lI2rh2E6zarYW10IEaNXXtsEMkdmHWycr6GwgzmrhFfucfMBriGw
 g9gZ7vlB8TAipp9Pw7Wm/7dXGHqtgedNfB7uaK2+AOSksOryqGD/8T1ML
 AtJex89CboJ/7+lpOe6hx1vOObwxAMaLITR59fyiiOUEsVeAk3++N/vPE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375564850"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="375564850"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 15:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="888055668"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="888055668"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2023 15:31:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 15:31:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 15:31:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 15:31:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqGavtnPeTkO+3ybzifQHB+z9ft8qHzUnfgdxDeYvyFsoYP6uucaEmBkh2tUH3Vp4UM2yLH9O4Xd8lP+do0JNTlpvg5aMSxUXHJ+P2xwGiCkyyra++9eAnfjoYn2WOAi9M7XDGK2Rj6ESJlZAFBYghG/EFkvUlVnqk9Nhnw3xsYKKmLLyhSfeAFbMMZXze7eaBWt6jhWVTPm2OtRWv/umkHVKPabiLdcr7SV7BVKzl75Wo7yY4e4TSqB0q7N0bTK0InPFxcdMw4BCcaff02zSYkf743GkMXppcVNDP8Z+IJ24op9/IId9ra7Y5UrzJ/wIq1SwUlXuLRUgOtJ9+3zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TS+fEmyCl5DpyNf9zdS15tosRyY3excyBu+v1OTmY+k=;
 b=MT82maYBbfXQa3LS6HIWXt32aTWAunvTnJ0BgzNQYXYLLe3/xmxSZqbedbcJ/iJyriaYFAcISJVDP9XwMj3JOcn1CmpjqUBiBO6HOVG65OL/z4xp0x+yrsHoMfmRPS2utLWKPyX37mKhveH2/DzeZ98auYN55T60NstI5n4q9rZajVDdR411MB6zLaxx28yWQOAHtZ74CMsUnVx62w6/1e8YTeEVXF+p5dAxMPGLOtmrLqzPUvpto9sBsSTcgXZZX+ADgBGBHx9Tvhoz2onOpvZtvjaXzKw2r1T6Ztyo1M7uKIVh9/hg9YjHFeQXDBUkh3SwIJsXv0rLqBfDvJgLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Mon, 13 Nov 2023 23:31:29 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::a247:c62c:764f:85a9%5]) with mapi id 15.20.6977.026; Mon, 13 Nov 2023
 23:31:29 +0000
Date: Mon, 13 Nov 2023 15:31:26 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <20231113233126.GD1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-5-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231106111845.2333093-5-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: f9720600-2780-47ae-7228-08dbe4a0a950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oaeVNy4NyP2kwgPH2PQzgXjF0BhQN2lTRxSWyIw2ldZQZlr+u4jK5umIGX3V/vv4FDYj4RT6Z/iMz/WpLapybFNfQbrQVoZhH9lHX7Cc5c8B6QF4qdFV2c9JZauoKB5EVSOPWevzEUPWXShZNhYIdmrtLHoD4/j9KYAQkVaau/7Fh4idFDSYj5stvBl78z1PJl6btPVW4ur10e47bUJgGKfHP/kpfEYntbDjoBF9gtPi/zf9eEimm+ukKE191XJ+uRUoXPItHdRtVEtmEVdDbsD2kXUCCp/7G3na27SH3l8zfXGxzKBZOgG1mmGkvUX5isQgCfsxlcRvBQ+dzLg1A9fvMJwkARLE7lzkeRp4xYNYSWKIUILwg1NimRLvgx7R/hp6FW8W7pdunIORIiaXGpOm51KkWXF1gsYWsmx/QOt5fnHJ9BGr6wCUeo1LB6AAjqEZj553eSYAdEFOBJdKbzGG8qUEG/UdUKPF9xw62bipBYp3/sc521E5lo8JZceJ+Ls9n8tc7aTHRPFjTXk6pSqsuSSEdefeBOyWS1/7j0VRzwYThZbiMYxdVerySgT833clARoD3QgLfkmc/aAZHTbcbnH7y5a3FufH2Jg5dLtzT63NcZgxRvnYyrsQcH8+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(86362001)(5660300002)(33656002)(6486002)(66946007)(6512007)(316002)(8676002)(8936002)(4326008)(66476007)(6916009)(66556008)(41300700001)(2906002)(38100700002)(83380400001)(26005)(1076003)(82960400001)(6666004)(6506007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RVIhui20wkYI0Qp0035QQSHo/2P3qBpQahWCR9IFV92sUCDOE9VhlyccD+sC?=
 =?us-ascii?Q?fvVdH/vJFCe8NC1aIotd4kfpBV5iF3uiBe6/UCX3ySxe1PmLcXXa6qRRBte4?=
 =?us-ascii?Q?9H3SwxBSYESVDo6xrWSvgsqztnsCQxHQQ1woLrh6hz61rU2q6hX7HQSHmR7Z?=
 =?us-ascii?Q?QKXDJv15w4YJf0m+rKOFQzeooSmFBMbdRSa68pGa3FHZBIBnMcFR40YO9lgZ?=
 =?us-ascii?Q?SpTGkseaMACVXzVoORXKQQ6JaHxe2Uv+y2buo9QbS9YZVM//exr4obIwigbC?=
 =?us-ascii?Q?CcFTFa997Z9W/9aFmjtNG4DIf1l7wu8/PFvIUurPUiXjSXMq0/kVBvoM3C9x?=
 =?us-ascii?Q?124/iG3IkSkAcW7BmNky2+2QGDhHvSkUxqhTI89bhUK8FTT8bY3nyjEF2oqD?=
 =?us-ascii?Q?BuJ4UKKRQ6KzRsTO/AMwFgPJkdnfokweC5sWbgCP6ciEV8oxRfmU4EBQ1PYo?=
 =?us-ascii?Q?uck9zjvNBqo6JPuVlc283BCpFTHt6WSB+kTCD7ztwQlgUYCBY/MlHlH9OEuI?=
 =?us-ascii?Q?HwwBw5uVJQgJGqMkPD/+eGgtv3To2CP02xjS3C7K37c9Wj3SlpwCTOpzwoAf?=
 =?us-ascii?Q?dz5Hd7Ot6LCIKwJ6OFhFxF2wViWxCEgi384247YrZV5AolaLHWcOG1+ZuRxO?=
 =?us-ascii?Q?TBQZyGMOImh8nriEvKWcXK2FdgY9M86v7t2G5SnbVSnWXomGvobuvyZdoc5D?=
 =?us-ascii?Q?qMK5Wdpp60Me82buJc9hp2hEg2fkvz7Go9N9kranzjnT62AkNAMbmR2AwCme?=
 =?us-ascii?Q?qxNoUiP5QZ0iVfknBTrizwZlv5rNvPCOlWvelMEzvZtOAIfcAfRwKaSr5WWd?=
 =?us-ascii?Q?r2S3TyxUViecdq8qy+xrlNXvAx479euooE/oCDgrq+81GqULtrjKRJG+vw1+?=
 =?us-ascii?Q?VHor5MiiflJtwcc+vteI/ZDjwPrMHGByaNY/EaUmXX3zlQWuqZCJJLjq+hrR?=
 =?us-ascii?Q?ukXkVJrtAXCiA6KnEvlfMKnVfmMZ9lAYEqeXjfUxmPGYVinGYCDyY/unWI5B?=
 =?us-ascii?Q?cAEndUNE4pYDHOkzLUtMOKUpDNSV3DRz7fOgS6r/AehTgnMU8jKcmwuHqIya?=
 =?us-ascii?Q?ugv7sXPkk4JB+70uUIn72aZZVUpK8kqCGk9TWJSnXw2tcFpdoo3m95ycPxX7?=
 =?us-ascii?Q?X39Q7Y1LpEiGrbazaaaVmY+mYA3NffQUPi3rlKyvAztNysHvOmHD4s2p3Hn4?=
 =?us-ascii?Q?NxAqrtX7s6y+57oa6dMORR1REH+wSW/cuGM7m5wBw+ZwH/uj1KpOikXxCgPA?=
 =?us-ascii?Q?8zogvMhrQCPg9Bls5SB1fn9QEHnRxpoR5CNKyBl9deAQ+lio0/BD/TOOvX5I?=
 =?us-ascii?Q?McLHe6wc9F4n6XSTanp59iMoyiJoqkD8CXsrb2YkQs6Qkh0JZa/NDRdl6ku0?=
 =?us-ascii?Q?m80sRIWlUvdlhgwSnH7v+TFvAZnEOX3FtDFTm7BdYHnxTvNmVjzK0MdiMCYD?=
 =?us-ascii?Q?2OZLXgejuyKjmXFPXu/QtXexHs/PIww9Iu2Nwpwn4xN9HB8g2kTECcqWnzzN?=
 =?us-ascii?Q?s9Pl/dNuHUO1ReIdSsGfpOjk5wJpYD/g0Gfa7v0IRhJMtVc9Y4pbmvSy3XcH?=
 =?us-ascii?Q?YKpY+fwQBlKMFeJ26ervrYsn68Qrb7t84vKUV6f7I+fRyzyE/NuWMtqpUxs+?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9720600-2780-47ae-7228-08dbe4a0a950
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 23:31:29.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JP2xFLUYXw46Dl2dIIPChsNXmOV1YpgcokaY7cfqlYhcBB2jB6jnon19lRf0BVNMylxC0RinpAueD46cFMJFRuiDa9J8DDIrSLsGUp1WoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 04/25] drm/xe/eudebug: hw enablement for eudebug
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

On Mon, Nov 06, 2023 at 01:18:24PM +0200, Mika Kuoppala wrote:
> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> 
> In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
> and some other registers needs to be programmed. Implement eudebug
> mode enabling including eudebug related workarounds.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++++
>  drivers/gpu/drm/xe/xe_eudebug.c      | 48 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h      |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c    |  2 ++
>  4 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 902c60543de0..a1bed8b9171a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -60,6 +60,10 @@
>  #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
>  #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>  
> +#define CS_DEBUG_MODE2				XE_REG(0x20d8, XE_REG_OPTION_MASKED)
> +#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
> +#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
> +
>  #define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>  
> @@ -334,6 +338,14 @@
>  #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
>  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>  
> +#define TD_CTL					XE_REG_MCR(0xe400)
> +#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
> +#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
> +#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
> +#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
> +#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
> +#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
> +
>  #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
>  #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
>  #define   DISABLE_ECC				REG_BIT(5)
> @@ -355,11 +367,13 @@
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
>  #define   EARLY_EOT_DIS				REG_BIT(1)
> +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
>  
>  #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>  #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
>  #define   DISABLE_EARLY_READ			REG_BIT(14)
>  #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
> +#define   XEHPC_DISABLE_BTB			REG_BIT(11)
>  #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
>  #define   DISABLE_DOP_GATING			REG_BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 3598c0f352fe..99939176bbb9 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -14,10 +14,15 @@
>  #include <drm/drm_managed.h>
>  #include <uapi/drm/xe_drm_tmp.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
> +#include "xe_gt.h"
>  #include "xe_eudebug_types.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_module.h"
> +#include "xe_rtp.h"
>  #include "xe_vm.h"
> +#include "xe_wa.h"
>  
>  /*
>   * If there is no event being read in this time (for example gdb stuck)
> @@ -824,6 +829,49 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  	return ret;
>  }
>  
> +#undef XE_REG_MCR
> +#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
> +
> +void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
> +{
> +	const struct xe_rtp_entry_sr eudebug_was[] = {
> +		{ XE_RTP_NAME("GlobalDebugEnable"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
> +			       ENGINE_CLASS(RENDER)),
> +		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2, GLOBAL_DEBUG_ENABLE))
> +		},
> +		{ XE_RTP_NAME("TdCtlDebugEnable"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(SET(TD_CTL,
> +				     TD_CTL_BREAKPOINT_ENABLE |
> +				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> +				     TD_CTL_FEH_AND_FEE_ENABLE))
> +		},
> +		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
> +		},
> +		{ XE_RTP_NAME("22015693276"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),

The actual workaround number here is 18022722726, and the workaround
database indicates that it is only necessary for PVC (version 12.60).
Is there some other workaround that tells us we also need to apply this
on DG2/ATS-M (12.55) and all later platforms as well?

> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
> +		},
> +		{ XE_RTP_NAME("14015527279"),

The proper workaround lineage number here is 14015474168.

> +		  XE_RTP_RULES(PLATFORM(PVC),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
> +		},
> +		{}
> +	};
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +	struct xe_device *xe = gt_to_xe(hwe->gt);
> +
> +	if (xe->eudebug.available)
> +		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);

eudebug.available is always set if there weren't any errors (e.g.,
memory allocation failures) during general init, right?  So even if the
user has no plans to use EU debugging, this flag is still on, so all
this extra programming happens anyway?  It seems like a lot of these
things are programming that should always happen when EU debugging is
actually being utilized, unless I'm misunderstanding.


Matt

> +}
> +
>  void xe_eudebug_init(struct xe_device *xe)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> index 44b20549eb6d..ac89a3d1ee1d 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -11,6 +11,7 @@ struct xe_device;
>  struct xe_file;
>  struct xe_vm;
>  struct xe_exec_queue;
> +struct xe_hw_engine;
>  
>  int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  			     void *data,
> @@ -18,6 +19,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  
>  void xe_eudebug_init(struct xe_device *xe);
>  void xe_eudebug_fini(struct xe_device *xe);
> +void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>  
>  void xe_eudebug_file_open(struct xe_file *xef);
>  void xe_eudebug_file_close(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index b5b084590888..59ce9574b1c5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -13,6 +13,7 @@
>  #include "xe_assert.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_eudebug.h"
>  #include "xe_execlist.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> @@ -409,6 +410,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_tuning_process_engine(hwe);
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
> +	xe_eudebug_init_hw_engine(hwe);
>  
>  	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>  	xe_reg_whitelist_process_engine(hwe);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
