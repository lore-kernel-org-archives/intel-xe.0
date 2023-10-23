Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42222C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 16:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8F210E145;
	Mon, 23 Oct 2023 16:29:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9489210E145
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 16:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698078572; x=1729614572;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M6LdxrL3ctzXxtCo8HjcQ4eob8Ops9pfc1K0xuGbl+s=;
 b=HwuQkNJdsWo79OJvN3VPVeJQJlPP4qKKQmpb6RU+A/6b+YpMHTcGtZ6N
 cazhGgV2ekmnaNFNFU9QrsS6FuF5RGDGRySeXi//zOeiNi1GEZO7OqGVh
 IHCctlVCMydEqDC3B5JkYgrFWowE+hTlmE8tTXYBs0TImHdCze4PvYwZb
 aFSP8txOJabYrLLv0wwaQZzIaDu3OR1guliCC6Oc4atMAa29qTfBgWs0G
 lbUIL8MfwtzyK18cqmFDO+B1t1qdlml5VwuDmcQ+0oQ1h3DuJzUjCJsQ5
 Y4UZDcJ+SZ0b07qXMfAkeIk8tnSIh0vdcUplj5+TdS+ojpS5fe6tJbR5C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377255449"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="377255449"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 09:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1005356950"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="1005356950"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2023 09:29:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 09:29:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 23 Oct 2023 09:29:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 23 Oct 2023 09:29:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 23 Oct 2023 09:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRJDp3Q5IlUvAyNAIiqLj+KJPXM5ETXQmT3X+hhhMgB9RQnlZkiDPnSKLFcdncjIq48Ua00zKtFOfpYf+XtKljj1Plviey/NZHqcpbwOmPRBn2RuRet7j5sPf2Hn036dR0vl9sMvOiLoIuI4wmcV22iZo/Ansx69wa28TdqEG43HtmwPOu+bLx3P0Yyi/TRBI8OB7wxvOZayid5fIgZ70FNFoZsLVCOobhPVtZc5dNOt6zpgz8oAZ+Xi6tNnhfGS/DMlz3Ve3hRq3dGJLs2EYeHPC/84DOX2JKPtOz/wV0UdVNpKK2IO7+BpzOpVeQapNAL0qRykxhBCHi+Hvv+gfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UWou508LKBK15I0ZQ+TtP2dQOjrr+pdToYsyTJH/5Q=;
 b=YW2ROJBW9GXfbPMRx0WNs1lTRn6mlucOKRkvi15Dtl2EKYjPzmOcWDNyY8cJhl+IMYEJ2NTmGUn7LbI+1mHUQiMVx8qR6uR0jBddwPeaqdjPsamkgnihcZJUpaD07fpnhTWNqHt6L7072n8SBf7JTkuCUyPf6xRTddKOWmboK5/aleNbuOWs4oZLV3zyM1sYQ/0X7hHJYv7DjUTUM0SSGsTuVL/LftBVMguZFGRffE9ug0jMU85KJ+lYF3Bu0jE+QyECcCTVIIaT6U19FZvfrQVcbebznE738aJBOpri6zq/kkyfPDbziK2cbl+qcwxx94Ot0IbmHzuuXMyuPs9GYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 16:29:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f723:f4d9:c12a:5b62%4]) with mapi id 15.20.6907.028; Mon, 23 Oct 2023
 16:29:25 +0000
Date: Mon, 23 Oct 2023 09:29:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20231023162922.GR5757@mdroper-desk1.amr.corp.intel.com>
References: <20231023152138.132614-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023152138.132614-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b4e520-ade9-456c-5db7-08dbd3e5382e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqVVj9wh9kOGe7QxDV/UIpWr3V05ag808l5JqXevf9oQBEGIC/gBxQrNIXSDEeZwtFpAJW8Tq+nIhbrPH9Ws1Y1cERH3Xdgm1PdZOBEYAZP4sR8vB2lVkzFK5bFKHBgS137IulMQpZQMs2GLNkLx5/huetUzawbFLM6m8fyu72pFhBXPZo/GeRBOZXF91AQv/eGSR0dHKoFCcKP090Nb3cD8CmBqBpE/+0iXAf/10Wd1pRbem6+lyduWdFOWT+TuSCK9/xfdswB8zR/2Lom3x0Gfs4w1Oj/tTSZ2IDxXFQP8CLM6CKC1hRM7LcpLK8hOLZNH08J21gNjOIbtKc9GY+g+KSBEfR3uGgtQ7FCRENCjULarD/YwnS6LVRs4fzCwOp0nvg0hAC4/2JqGsv5EiNzqpC0LuYHBc7DfAVDzt4rP6mE3DluZFyFeqNuOSyqXkqx/vWp72UP7rECBfXeFYgvMwIWtPSXoR5aTgsjwYL1VYqCem882F0JOIEogNAQVJtellzOale/rsrGyDf35j2zfDS9lGfqgp/h1DA0CUknE3PYeL5g2oMYX+MzckIYV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(41300700001)(2906002)(38100700002)(82960400001)(316002)(66556008)(66946007)(66476007)(6636002)(6506007)(6666004)(1076003)(478600001)(6512007)(83380400001)(6486002)(86362001)(5660300002)(8676002)(6862004)(33656002)(8936002)(4326008)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKHgbXbSKLO4lzU0YBhFB9GEKFCWwAG6QbdnnBjPGq7WKUH9F4tp0/aPhBgW?=
 =?us-ascii?Q?zGrZkG9n+hipr4LL0zrJ7wuX6rPFncpm/9LRPVE2cS+U7mXNuoLtAqNf+hko?=
 =?us-ascii?Q?tfJlayoWZP+Aq8BoVpoxvJFeL/b50akcJE0URgS7CMDnxzRCmPq0INgeWWPi?=
 =?us-ascii?Q?8Wp8PGBwpiZvwIQbRd+B9sxHsyO4zoq3R3Yk1xEuWQUOq1CTvD/Xyyea5W8t?=
 =?us-ascii?Q?9LhD4+J2iXINfbPGCNUIjUGxLcITqJhHjj8iNcSFWqMAVZ06C1jN50NL8gYk?=
 =?us-ascii?Q?mwO3FgS8my36Kc3iN9hWmPqMr5f/553eanqDalbCCZEbnSEUE5xAOCd1iSvh?=
 =?us-ascii?Q?JxceTcqh6xPZZAGDhcpGDgIXyL37eVktznoiKxrRxxpU+lbAWWdW5bu8alUQ?=
 =?us-ascii?Q?x1hedUoDm6Csx1osKgduIuadbPoycGDtzwYNLy5qtu++mcmP00+EML3N7Coh?=
 =?us-ascii?Q?Vjgx02TBjWnhB5BheKfW3wEopOyctil6gG1XwwZcHoOYmYX/4hk7lRHQmRwM?=
 =?us-ascii?Q?WvWOZJFzZY3fsXBQTUeDfZxnpDbEKcaTdmt51VOZYQbA2flgmhVYjA3cZItM?=
 =?us-ascii?Q?Nql0rAi1+5FNFNdfKU4tJH6K5eccLNG6I0SPhJJLkF+CeByKbVCSBp9wZjC5?=
 =?us-ascii?Q?jdbWfoZ09n6iQeeAIYITQQuuMkBWB3dNy874TQiJufMXBoxuBEwi8nd89SsN?=
 =?us-ascii?Q?62WIK7UW1mRhCYIOPT/IsrV240Z9MikuVj94jv7WzBXwEwOYuccuQIARWLnb?=
 =?us-ascii?Q?fO022QVEtYsB7DviYYskgvr0w9GFtoSbhCdZVra/VW0K8cFVDgDH1rFBo7Cg?=
 =?us-ascii?Q?I4zEnWbds8rqM6ipTCxHpbG/ytgVF730TccpBc/EO4cDEkn+slwSA7fpHGry?=
 =?us-ascii?Q?HZ5b9o3tgYqbctslkQ2EgIBt6ta30r/8wFFceSCfACj+2wvZ2iAxp3LMGXHv?=
 =?us-ascii?Q?tt5WTurH9aIkD4e+a1DC21wUa57c6IebGDVD9QUTeQS0ImTngD4mnnyRhyz2?=
 =?us-ascii?Q?9ssKAi99YqemZIML7JgtVhamMWifMTG67smEpQqcgS+cyPh8HHcFpiQZtR5K?=
 =?us-ascii?Q?pmkIrXBhjnt+FEnUXKA4B327fdjfo+18FZuyDQHL2/i5z0KQsOH/xncX3SIo?=
 =?us-ascii?Q?AWXOJhKwkSeshkoo2v0qpZsMZE+BBOEXUon92T4olAmX/8ygJILzfy7PEkly?=
 =?us-ascii?Q?G4krTZXD6XIm/U83fz3IZ5lF6wdxjyGXM2LSWK8kcu+Gjkp/dEOPEHHBNgCt?=
 =?us-ascii?Q?C2Wt8uf1VguXKUPWQknbuikMPnov7RoR8GE64TWgGyE/T6h5vMaymhXpo67b?=
 =?us-ascii?Q?B9VUKafhJe9GFMD4AgfYVipxVqBPJVQYANEEmwjVQSFHC+0LbY/NXfZAwuV7?=
 =?us-ascii?Q?MfUvJkauEhB0gaLXzn94mfnVf60yOkyjEZZiq3s9nnerQgrcifbJrPFGHHR/?=
 =?us-ascii?Q?XL/uv9lbtRsMJVDjB/8+oC3sTPQIb5Zylxr2nc1xyAzaOWGNqoe1MPVPeI0d?=
 =?us-ascii?Q?umRNCUZYCCiDfJcPySVSUqWoxh7DM+sKapv9vX7RLfsIryP9tV4RM/apczru?=
 =?us-ascii?Q?HoJpziFcAxdvwQUiJthgvGHPCLRWsIdzMoiSL7vrkdCSpiOoyRVnDR3ZJ+YU?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b4e520-ade9-456c-5db7-08dbd3e5382e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:29:24.8305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty3QAjCdzZUfPOSvH1hkDixvjavSe9PFeUDQubDvCyMjr0jbbVtIwu0SV4GhJ7Q6hiLeCjr4+ILc90KF6r4xxHPH5YJAGiUfcag7iDDM3/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/xe2: Add initial workarounds
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

On Mon, Oct 23, 2023 at 08:21:36AM -0700, Lucas De Marchi wrote:
> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> Add the initial collection of gt/engine/lrc workarounds.
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 24 ++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 68 ++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cd1821d96a5d..8e01ae49ef21 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -94,7 +94,14 @@
>  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
>  #define   TBIMR_FAST_CLIP			REG_BIT(5)
>  
> +#define FF_MODE					XE_REG(0x6210)

This register should be marked as MCR.

> +#define   DIS_TE_AUTOSTRIP			REG_BIT(31)
> +#define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
> +#define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
> +
>  #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
> +#define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
> +#define   DIS_AUTOSTRIP				REG_BIT(6)
>  #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
>  #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
>  
> @@ -111,6 +118,9 @@
>  #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
>  #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>  
> +#define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
> +#define   FD_END_COLLECT			REG_BIT(5)
> +
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
>  #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
>  #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
> @@ -133,6 +143,9 @@
>  #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
>  #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
>  
> +#define VF_SCRATCHPAD				XE_REG(0x83a8, XE_REG_OPTION_MASKED)
> +#define   XE2_VFG_TED_CREDIT_INTERFACE_DISABLE	REG_BIT(13)
> +
>  #define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
>  #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
>  
> @@ -225,6 +238,7 @@
>  #define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
>  #define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
>  #define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
> +#define   SBEUNIT_CLKGATE_DIS			REG_BIT(4)
>  
>  #define UNSLICE_UNIT_LEVEL_CLKGATE2		XE_REG(0x94e4)
>  #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
> @@ -276,6 +290,8 @@
>  #define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
>  #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
>  
> +#define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
> +
>  #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
>  #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
>  #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
> @@ -299,6 +315,9 @@
>  #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
>  #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
>  
> +#define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
> +#define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> @@ -328,6 +347,7 @@
>  #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>  #define   UGM_BACKUP_MODE			REG_BIT(13)
>  #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   EARLY_EOT_DIS				REG_BIT(1)
>  
>  #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
>  #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
> @@ -345,11 +365,15 @@
>  
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> +#define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
>  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> +#define   SEQUENTIAL_ACCESS_UPGRADE_DISABLE	REG_BIT(13)
>  
>  #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
>  #define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
>  #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> +#define   XE2_ALLOC_DPA_STARVE_FIX_DIS		REG_BIT(47 - 32)
> +#define   ENABLE_SMP_LD_RENDER_SURFACE_CONTROL	REG_BIT(44 - 32)
>  #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
>  #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
>  #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1450af6cab34..b22c9f90b080 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -245,6 +245,19 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
>  	},
>  
> +	/* Xe2_LPG */
> +	{ XE_RTP_NAME("16020975621"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, SBEUNIT_CLKGATE_DIS))
> +	},
> +	{ XE_RTP_NAME("14018157293"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
> +	  XE_RTP_ACTIONS(SET(XEHPC_L3CLOS_MASK(0), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(1), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(2), ~0),
> +			 SET(XEHPC_L3CLOS_MASK(3), ~0))
> +	},
> +
>  	{}
>  };
>  
> @@ -266,6 +279,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       IS_INTEGRATED),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> +	{ XE_RTP_NAME("18032247524"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> +	},

Any specific reason this one isn't down in the "Xe2_LPG" section below
with the others?

>  	{ XE_RTP_NAME("1606931601"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_EARLY_READ))
> @@ -539,6 +557,40 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_NOCHECK))
>  	},
>  
> +	/* Xe2_LPG */
> +
> +	{ XE_RTP_NAME("16018712365"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> +	},
> +	{ XE_RTP_NAME("14018957109"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
> +	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))

According to bspec 65182, this register is part of the RCS engine's LRC
image, so this probably needs to move to lrc_was[] and become
RCS-specific.

> +	},
> +	{ XE_RTP_NAME("16021540221"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
> +	},
> +	{ XE_RTP_NAME("14019322943"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
> +	},
> +	{ XE_RTP_NAME("14018471104"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> +	},
> +	{ XE_RTP_NAME("16018737384"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> +	},
> +
>  	{}
>  };
>  
> @@ -630,6 +682,22 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
>  	},
>  
> +	/* Xe2_LPG */
> +	{ XE_RTP_NAME("16020518922"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),

We also need ENGINE_CLASS(RENDER) on this since this is specifically on
the RCS LRC.

Actually all of our existing lrc_was[] look like they're missing this
too, but we can update those in a separate patch.


Matt

> +	  XE_RTP_ACTIONS(SET(FF_MODE,
> +			     DIS_TE_AUTOSTRIP |
> +			     DIS_MESH_PARTIAL_AUTOSTRIP |
> +			     DIS_MESH_AUTOSTRIP),
> +			 SET(VFLSKPD,
> +			     DIS_PARTIAL_AUTOSTRIP |
> +			     DIS_AUTOSTRIP))
> +	},
> +	{ XE_RTP_NAME("14019386621"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> +	},
> +
>  	{}
>  };
>  
> -- 
> 2.40.1
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
