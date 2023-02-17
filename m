Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09586C636D6
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 20:28:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98EC10E169;
	Fri, 17 Feb 2023 20:28:36 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80E10E169
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676665714; x=1708201714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lR0KeCiSVknewihQw2YEaI136TET4Zm4mRtf5jU+TfU=;
 b=hfwRqa3J0hGWVGErnPvTHeqVRVDNLbFMzTJTpwxIMrxcJgsp2/pXlgWy
 BVrHb08/72eMpXON2lG53Ta8bRfLvdBsFv8oPh9q4u3/azQ1S+FuSc6KC
 Tasj1n1H2eEA7kSA2gmAzM18IUm1UVRFwgK0wiVbDf05h3g2c0fKSnHfz
 KPM1Pyuly7qMmeU1N15vDNk+1fgfIe2HK13HsGNjUyQCowMSpWTDwQqMY
 HwE6THEw4YuMxaPcvZyeGsxfu/rN5tatietKHuHVM1E7yB6Qz0WnArcGV
 I1LUZhSMNus7bAHjzR7L4hWhqu/7nSHMD1r/vu3JgbCPKQW03tOIOrg/R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="394563368"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="394563368"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 12:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="916205981"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="916205981"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 12:28:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 12:28:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 12:28:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 12:28:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfnvrhhkoNleFNwVdfpIOXLDK1q5VICaeG4DP+BLuBNG0/kQxdPmdwe0MG8w4LZnMObYKauG9rtj8Ts/yVk4OwbxBTWfmH8+wOecBKc7HtdcO1huM4yKwGOAHePvZUWokRAgBfsM4H2Cj29ZxUOCD75TeklDN7DJHTC3rBFNYMDo6RPKPkF2YLpJkMSf0xAVLzvFBIyDR/Nub1ClVaxwpB7wARbVt2wLa5nvOntdmrepOp3j5wC7TuyLx0cI/3QH77r74Ec2FES0hCtZVnrgPzuMu58l8F1/avSHbbUkCwenSwMsVM3ajZCAvajRAoZr+rEdFoqdwXbvZdrQNQ/Law==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaqV7lhIMWhJcEYZoOSRK4YG4GuafZzGyMPuDjiGjp4=;
 b=Jlm24Ich1z8XjcBLwr3PyjdSRFmkCbKNJe8BAj7dGdaSzu1KuKlKHgI8h8nldIAC9VozNY1hpZL62XLnrF02BYcioDaMqWq/URfjNw5Z7IZLDcbjz6Gepr/3fw9goHMGEb+hS8pPUVoK8Scu7SptqgZYDNPfSOm1SNGplFhFQF7DvWtt9TmVPxBQktx0t7WVOOsdGXWioqtM1r2FP0f3+qD8j3C50jGh/HCW0xWlhZiCK3SvIl5MrN6Nm3sB8kooO1rbAIyPYKktKDuXmeOg2LHBCeDWpgso8MSIkYDVo63VEjHSNQ+Ca/SlMbUZjraBjNJ7ZFf+kaMUqiOXLQDbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 20:28:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 20:28:29 +0000
Date: Fri, 17 Feb 2023 15:28:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y+/jaCK7TSG+qHa+@intel.com>
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 973574eb-8f4a-438a-0fba-08db1125878e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZykNX0t9bCkRmv+1iro1YSa4UArM1leQG5NSxHaGCp69hpIxgmF1YJgygvO49O197e2h5ji5OdTg3krzub6nBwf2GxpEvTGrpEPivPy5HDitb+7H8itpjhJqpBsY1UijfgNZiQpMCmzwMX6fUOW2GZCeyUhGzalPEQVpxwZzP576D46HtMhoHghqRFPB75sWY2juU4MOd+GEBeXv0hLfrp5xH3YNCB19UGfoEjZkN8hT6VSoMYbJhw1X4qEz615hBlosM9OfaNl4/nHAcxPnh3mPy4oR18oiFvFkpVWG9LnLjvM9lcWaN4dsuIIaeOwysKU9mVtvyJuLOmHLFWnLcE6GVBg0/4aMMf+VFyi3BsR1gpDEf0njp9O4LQLCh6WPxeITsn1W6mDaZQBO9/3lqgOInQX7hJGkX8pB9Cjxz3v81HYBOlVGQBgwJh+SxtvfvPtiaODS74wNddoo0mcisb+fLAyxx3PmB6caA3cBL8D+KNx0plcPen94JCcb+hr2e/KAD7qUHBuf+QM630B1U3xoCrp94nfSFVtPVTLut3xBY68DzAg9VcZe5rDhQ5FRKjXf25j90aMUglEo/cJKjBqnxQV/1SMx+vTA910RD98p6ZXElh8Csj+nWGDTRMUEDqBQgbUxjaM1EyT7R0kQXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199018)(44832011)(86362001)(82960400001)(2906002)(38100700002)(6486002)(6512007)(6506007)(186003)(26005)(6636002)(54906003)(478600001)(36756003)(41300700001)(37006003)(66946007)(316002)(66476007)(8676002)(66556008)(4326008)(83380400001)(6862004)(107886003)(6666004)(2616005)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UT1VD0IHVKeiRiXrv2y1G8wXLUafvUagC1nbBMJm+bCZMjVa9dHJjCtqo9xH?=
 =?us-ascii?Q?tZval0DfeeO0geQQCEQt7XyPx0Jbomr4fAWIjCSby8N/0d+DawmSpyJ+EW9t?=
 =?us-ascii?Q?kNWtfjuwv3BJ14E9TaHuH/c8LcbeziEPiLKnUR3BqbI12loLjs5w835s+H09?=
 =?us-ascii?Q?JndE3eDOiTpgaNUDN5C8Bx78GPKCy1S3Apjkx1EUXcIK6U52LwMDbPbsDGGi?=
 =?us-ascii?Q?hKREzR6suFe6OfXPkmKmNc73WUmxRZPyKxjrJfprt5QsV/+VXKsHeWaigvqq?=
 =?us-ascii?Q?I6HEUcFlrgM9MMHvWu6uTcTOL5pDqvuE3jL6yyqBsGGBuwpK6tmzMTIpQAaJ?=
 =?us-ascii?Q?S16bKINTR4O18fq9fs3qknlfKEFgUwOfPua54i/PHiHzUQDtw3HySBNPKDqC?=
 =?us-ascii?Q?yRl28c93YhHrbjjU6GsOnoCXTzVEoJ6KFslgBeBlRF8QK5cjeiuhFm3IVIjg?=
 =?us-ascii?Q?Xku5StSAZDo4OGHNH31lMlJsStMBVqEty0HXEJIsSvGvQ9MegPQefBgCywtx?=
 =?us-ascii?Q?A8XJIxHVS3RVIvOf2z6LsiwZZNNpG82mj7u3iLnV2F1i3lqAylq/O1VfSLWP?=
 =?us-ascii?Q?PYU1d7urReyKz/eGlNl6NV9xG0AGefT0OOrr/EhitID0iAZ9OHknVHyBYuDW?=
 =?us-ascii?Q?SgqXhUkwCXPZTHfHMCgvWR29I/ZOOp9798Xc1qFl019FqFLG0cHK3Bth/HdP?=
 =?us-ascii?Q?XXXBfdqcMwEZ3zo1GZGPAFPRI/yp3iXsCaxPsPYLiMt+AXZ/KVct3oUx8Yqw?=
 =?us-ascii?Q?WCB+QM9x6xH9fX6Ngzs22pCWBSbxsQCLzqnb4cVL+K/O/CzLIv/L2pydvY3l?=
 =?us-ascii?Q?JukigXDH7InU4hTLan8ADW9Znu06MYHlzO22G9I9TGDMO6kaKtWv49wtG5SX?=
 =?us-ascii?Q?Yr+r1RypzvT03y/urdJP8xP/Ao6YnNNi2H/HAjh5bLTLMyERqEegzBhiumGC?=
 =?us-ascii?Q?yl3TOKBTwc0+kYqkx6DVGeEV7ZWegntJzKkjFigWlhX80cG3tAwWCFzlmhS2?=
 =?us-ascii?Q?g5PM97QG2iddUiKliYMqY0NSjlZ8eWsCrj0Cpzhqk3q3NFBARGAenbUtUvz2?=
 =?us-ascii?Q?EWxsaAGDdQSInKAubf1Ys7Q2Zw3YTmltPF2k5PMR86kEGZPyjfRa71IECNTI?=
 =?us-ascii?Q?F2RIAN0u7qBrJFqWo7PPL1smEM+q/YdkwiIl9wfBOP473tlVahq3z19pQrT9?=
 =?us-ascii?Q?zzIY1SKUVvC//BzgZpb3+nqnl+fORj1FCUN5HR/cufkeMaFktRFnO/wV7dBO?=
 =?us-ascii?Q?c5kvZkZV/JAucW/H2buKffxG2CLqGsiX6inCtr858qF2WYhygTDiVQfLeInj?=
 =?us-ascii?Q?zYwGK63aXsXbh90eC1MoNbJOFxWyFdac2iMxuCN5nWkGesdHBW6qXjKd1Cay?=
 =?us-ascii?Q?gZhyAUGivE1mDHdWM5+0iJWnXbzCCe9naf+6irDC1ocF7k2d4HhEYjoLkt5i?=
 =?us-ascii?Q?jTTV5QD+8oxFxg93ZmCRpiliT7VeVCTzR3+SEYJ3/eIm77aF7LwIPy7KjXQP?=
 =?us-ascii?Q?IPEdjJlJeKD8uZhLW9TxgEyuns85s34X+SXb1hVW2/CPIoZ1FQEleuv4Cdfv?=
 =?us-ascii?Q?E2R/fYczl9Ei49NqSZXyvQ8ny+j6HNz3mhX35/6W5ksu3O7OIAPBdqzQeXgl?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 973574eb-8f4a-438a-0fba-08db1125878e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 20:28:29.3127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMigbgBldVZP6FMtgTbSLriSgiChW6z2KZtKk5HhbK2U2oI43zLo31zB0QC3ytJtrUAqPj7kiAclHuwD/XWIaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:26PM -0800, Lucas De Marchi wrote:
> With the goal of eliminating i915 includes from xe outside of the
> display area, it's better to use relative includes for the only shared
> header, i915_reg_defs.h.  With this the build system can be changed to
> stop adding i915 as an include dir.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/Makefile      | 120 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   2 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   2 +-
>  drivers/gpu/drm/xe/regs/xe_regs.h        |   2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.h           |   2 +-
>  drivers/gpu/drm/xe/xe_guc.c              |   2 -
>  drivers/gpu/drm/xe/xe_guc_reg.h          |   2 +-
>  drivers/gpu/drm/xe/xe_reg_sr_types.h     |   2 -
>  drivers/gpu/drm/xe/xe_rtp.h              |   2 -
>  drivers/gpu/drm/xe/xe_rtp_types.h        |   2 -
>  10 files changed, 125 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/display/Makefile
> 
> diff --git a/drivers/gpu/drm/xe/display/Makefile b/drivers/gpu/drm/xe/display/Makefile
> new file mode 100644
> index 000000000000..eee576972427
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/display/Makefile

shouldn't this patch also be modifying the drm/xe/Makefile? 

> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +subdir-ccflags-y += -I$(srctree)/$(src)
> +
> +# i915 Display compat #defines and #includes
> +subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += -I$(srctree)/$(src)/display/ext \
> +	-I$(srctree)/drivers/gpu/drm/xe/display/ \
> +	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> +	-I$(srctree)/drivers/gpu/drm/i915/ \
> +	-DBUILD_FOR_XE=1 \
> +	-Ddrm_i915_gem_object=xe_bo \
> +	-Ddrm_i915_private=xe_device
> +
> +CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> +
> +$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/display/icl_dsi.o: $(srctree)/drivers/gpu/drm/i915/display/icl_dsi.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORCE
> +	$(call cmd,force_checksrc)
> +	$(call if_changed_rule,cc_o_c)
> +
> +# Display..
> +xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +	xe_display.o \
> +	display/icl_dsi.o \
> +	display/intel_atomic.o \
> +	display/intel_atomic_plane.o \
> +	display/intel_audio.o \
> +	display/intel_backlight.o \
> +	display/intel_bios.o \
> +	display/intel_bw.o \
> +	display/intel_cdclk.o \
> +	display/intel_color.o \
> +	display/intel_combo_phy.o \
> +	display/intel_connector.o \
> +	display/intel_crtc_state_dump.o \
> +	display/intel_crtc.o \
> +	display/intel_cursor.o \
> +	display/intel_ddi_buf_trans.o \
> +	display/intel_ddi.o \
> +	display/intel_display.o \
> +	display/intel_display_debugfs.o \
> +	display/intel_display_power.o \
> +	display/intel_display_power_map.o \
> +	display/intel_display_power_well.o \
> +	display/intel_display_trace.o \
> +	display/intel_dkl_phy.o \
> +	display/intel_dmc.o \
> +	display/intel_dp_aux_backlight.o \
> +	display/intel_dp_aux.o \
> +	display/intel_dp.o \
> +	display/intel_dp_hdcp.o \
> +	display/intel_dp_link_training.o \
> +	display/intel_dpll.o \
> +	display/intel_dpll_mgr.o \
> +	display/intel_dp_mst.o \
> +	display/intel_drrs.o \
> +	display/intel_dsb.o \
> +	display/intel_dsi.o \
> +	display/intel_dsi_dcs_backlight.o \
> +	display/intel_dsi_vbt.o \
> +	display/intel_fb.o \
> +	display/intel_fbc.o \
> +	display/intel_fdi.o \
> +	display/intel_fifo_underrun.o \
> +	display/intel_frontbuffer.o \
> +	display/intel_global_state.o \
> +	display/intel_gmbus.o \
> +	display/intel_hdcp.o \
> +	display/intel_hdmi.o \
> +	display/intel_hotplug.o \
> +	display/intel_hti.o \
> +	display/intel_lspcon.o \
> +	display/intel_lvds.o \
> +	display/intel_modeset_setup.o \
> +	display/intel_modeset_verify.o \
> +	display/intel_panel.o \
> +	display/intel_pipe_crc.o \
> +	display/intel_pps.o \
> +	display/intel_psr.o \
> +	display/intel_qp_tables.o \
> +	display/intel_quirks.o \
> +	display/intel_snps_phy.o \
> +	display/intel_sprite.o \
> +	display/intel_tc.o \
> +	display/intel_vdsc.o \
> +	display/intel_vga.o \
> +	display/intel_vrr.o \
> +	display/xe_fb_pin.o \
> +	display/xe_plane_initial.o \
> +	display/skl_scaler.o \
> +	display/skl_universal_plane.o \
> +	display/skl_watermark.o \
> +	display/ext/i915_irq.o \
> +	display/ext/intel_device_info.o \
> +	display/ext/intel_dram.o \
> +	display/ext/intel_pch.o \
> +	display/ext/intel_pm.o
> +
> +ifeq ($(CONFIG_ACPI),y)
> +	xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +		display/intel_acpi.o \
> +		display/intel_opregion.o
> +endif
> +
> +ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
> +	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
> +endif
> +
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 6dfa3cf2fd43..a8f48a43b854 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -8,7 +8,7 @@
>  
>  #include <asm/page.h>
>  
> -#include "i915_reg_defs.h"
> +#include "../../i915/i915_reg_defs.h"
>  
>  #define RING_TAIL(base)				_MMIO((base) + 0x30)
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index ab8c9e51f62e..2a2ebc7baeda 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_REGS_H_
>  #define _XE_GT_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "../../i915/i915_reg_defs.h"
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0				_MMIO(0xd00)
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index 53f1ed54fb1c..f81f537c1ec1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -5,7 +5,7 @@
>  #ifndef _XE_REGS_H_
>  #define _XE_REGS_H_
>  
> -#include "i915_reg_defs.h"
> +#include "../../i915/i915_reg_defs.h"
>  
>  #define GU_CNTL					_MMIO(0x101010)
>  #define   LMEM_INIT				REG_BIT(7)
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index c31987d2177c..3f76233f88c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_MCR_H_
>  #define _XE_GT_MCR_H_
>  
> -#include "i915_reg_defs.h"
> +#include "../i915/i915_reg_defs.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index a2a124a7fc0b..6eefefd80ff9 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -21,8 +21,6 @@
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> -#include "i915_reg_defs.h"
> -
>  /* TODO: move to common file */
>  #define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
>  #define PVC_MOCS_UC_INDEX		1
> diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
> index 513a7e0c8a5a..234236833239 100644
> --- a/drivers/gpu/drm/xe/xe_guc_reg.h
> +++ b/drivers/gpu/drm/xe/xe_guc_reg.h
> @@ -9,7 +9,7 @@
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> +#include "../i915/i915_reg_defs.h"
>  
>  /* Definitions of GuC H/W registers, bits, etc */
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> index 2fa7ff3966ba..8a317ce428a4 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
> @@ -9,8 +9,6 @@
>  #include <linux/xarray.h>
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> -
>  struct xe_reg_sr_entry {
>  	u32		clr_bits;
>  	u32		set_bits;
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 1ac3fd1c0734..099047af89b4 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -11,8 +11,6 @@
>  
>  #include "xe_rtp_types.h"
>  
> -#include "i915_reg_defs.h"
> -
>  /*
>   * Register table poke infrastructure
>   */
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index fac0bd6d5b1e..e87f1b280d96 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -8,8 +8,6 @@
>  
>  #include <linux/types.h>
>  
> -#include "i915_reg_defs.h"
> -
>  struct xe_hw_engine;
>  struct xe_gt;
>  
> -- 
> 2.39.0
> 
