Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1ECCE7AF3
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341CB10E13D;
	Fri, 29 Sep 2023 20:50:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826C310E13D
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020605; x=1727556605;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+5l/EjPgvhmGes2QlbPLuulIuZ17kQnKyzU2qDqkyC0=;
 b=JRHgb8wdY1Cx0eOFMSDyizBXmOBpwHIZnn+XaBK0f8wblCda88HrO9bp
 ds/X6Pzs4C8Tprko+YQ0kc8rnFCzCso7T4iCSLbwFo0QzgHmcGRBqlr2g
 uzL3kOfiH/tA0q7dzn2CH8t48RndwhV0CzLS7o0uDW5OLbdI1zzxPW8s1
 ZAXYLZEpd209F32F/x6V+g63tK4fLLNcUY/qldI4gBHYRFL7yaRKXANfX
 iz7lJTP2jyuIL2kf8f6dLCN+RkScpvIcZzJcspN6Rekp8pnT+0Wjn+Idz
 uCpxnwbPLJ+GeLQ6H9p/9XcMdpyOL5bfnIZtA9clIBorlr6rAmp5+h9d6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446534153"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="446534153"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="699758771"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="699758771"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:44:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:44:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:44:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:44:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpWwuxHIEZMlsyLNoXFBwE/l9vtYnT+pH4Zr7ULgBz9XNtVg+o4Mk+dKcFooa/hJ3hpt0XZvABbqW3ePUKOru4CFHirUlJSyx1mZI1kqdjhBViCE7XjQtB136o+qbfEZR4zd5okKYLoLS3wwjy0rFt2XX2uNKN0o2ekOHnH6Z3UwQmBwUYCQMk2OfYeMOSdddp8bHgHBry9aWaMy7tVF9Et2WNhktXdAd2M6uPFqBcq4s5JVytcI9wXdoObd+5pv1uXO1JTDXd4fuhYUx3HMXQcBpKFjZAFwdbCg3G33Gh4ZIWA/DsUQuhFBYTd9iG6kjy9ihPfOEgD/LpXgLg0iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njZYBsktime2uzY9bDS/RTAeF2sK6znyhMEZnNPVi58=;
 b=ik1PV8njdjaUzUVLOSdoYrZh1KFJkdrnHvTxz/SFlaRDwJwyZtz7mseNkwsKDhgkT1b/qU1WeoqxBXK/Q437HfjngNQFIH0dKPgtSo6oUJzzfFS9BZyzDkUDmHFHkuRZHmUHwybcv5acHZPYGETZIz31Qav/GqRol+cwYCzc1WvO96616gUYaO8vIxuoIltE4W1XXNC9xcU0FTGC8Jw6iOU7sIeGYwhfSCCciKArn/upt0b01PXPJ1uW6Xgbs8QI4x3rCiyhIjh1ZdqXZD8YggGzdpxoVELC6xMhmS7s55+ud2XEXUcJtqJdNlT7hcqwLbUtz1+ZdqTjdUL2v7+6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Fri, 29 Sep
 2023 20:44:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 20:44:39 +0000
Date: Fri, 29 Sep 2023 13:44:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230929204435.GO233750@mdroper-desk1.amr.corp.intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
 <20230929050253.3153804-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230929050253.3153804-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c372ee-becc-4c88-4b71-08dbc12ce5f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PL/Onp7sFvNnu5EI2Vm2eAHyHykWBOQ6T694SPEbgvBvP+CBUeLzfBTSvqr84J90S5gIvCytx2/BQsNuXTL1e19m3BDrfK8/O1mx5l3jjHiEZY3cZ5oFdhkDH1m/AhSDvRa9yjgDKED3ReiYIk22gXlIoP4PpEyMSTQN8ObvuDcKqwLiD9qji73pBC3uY+KOz8mgPXY8vdLmEzNXKAa6Kqf8o7Kqp+boAQe+b41nM+8WsaVkteqVHrhPtbVox5SkHk97+FybmnP+eoDUUb/WvxAkl+4ScEqu01Bix8mXCONHmBv6E5L/qMoTyEjrGeKPF6Cit69KkwtIGtT/ikItg/s/ykoKOMLAAC8fuR0o0pg7PgX/g7pfZtpfH3J1EJwsPVbSFrLlJL7oI5ITl/W+nrT1SFrcSOwHEnzfTRkrVUkUOPbupe2JQgjftQl98GpwuigYb8ii7SOcMr2XdizjnbzLeQF0y+1Lqm6QrxSEkJdZd9TjIiObP92ms6oDQulqLH8XF5wV5dDTffncxoIdhFxCI/MS9niMPWuwZ2haDbsF26CCK7u/ANE3GQMtu9hL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6506007)(5660300002)(83380400001)(41300700001)(6636002)(316002)(8936002)(86362001)(6512007)(4326008)(6862004)(8676002)(6666004)(2906002)(33656002)(1076003)(66556008)(66946007)(82960400001)(6486002)(26005)(478600001)(38100700002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o5QPAaJXekectNKWknTomY3EPi3z+WcWyklak1rO6J2p97V5Crk542SQKHnm?=
 =?us-ascii?Q?2GCwetWe1FYTTtlVT6H7Pmnyegk98BC3pH0y9+7aRffNOx2tGNEgxTVHXCmG?=
 =?us-ascii?Q?E4CCLIof3+ASrQwbow1a4EIk6+7cMzh7LT25s+y6TVb9P3vBQ/D+du+5amXX?=
 =?us-ascii?Q?OxzOG+mH1S6R6Z0+mP9/m5X2O3/4B5ROZes2HD0P5k4H7FpKYYvu4T1SVTt/?=
 =?us-ascii?Q?lStLMFCn145XnuzmAC+Fm0vqxlp4MjORZkCIawlmjbOjgUnlAuUamCVpjVty?=
 =?us-ascii?Q?IiiQD9pHCDO6/LPCbgYo+L0H7HI7Xitb+7EsgnvIXwtb7zzwLSt43zdOS6uo?=
 =?us-ascii?Q?fltTT3fZ+mFdflwFT0j6ovPXQOv5U+yua9JLudo8moKDDw8b+0vVTpRzf4H1?=
 =?us-ascii?Q?TREjUdPSrCUm5Xkh0i0jPy3p0dvZVB80MvRH1UxIKzcOOrNwHTAtp4PWjfy9?=
 =?us-ascii?Q?sSS7Mm6sBNDoYwbdzK7557KgUU3FJn9p7aUkn9zIsI4lQtXteZPVbPeuTMkC?=
 =?us-ascii?Q?qTdR4A1KdcYkla7IK6LiqpIDj265P0BmkVrin23pFMBNsJ/RNFU98KFJg4ts?=
 =?us-ascii?Q?kXG0GGEuwCE7ImdYfpZsLKTYmZs7n2Aa+VfOWU1kSZuaAU294MSxr3lNDeYY?=
 =?us-ascii?Q?at1jqpL1ukr6xgodHqrgtN6++TIZKqS5K3n4BpQKHNrPkcg7yBvwWxSIlP23?=
 =?us-ascii?Q?A51jFtssH/ZISJAFsxlqf3yWB+AHReLDtwHJD/UXTXfEtuq6DNNG7ZaEmNwv?=
 =?us-ascii?Q?/FNqSTm0B58+2yryuSD3WhQgYpefS9tGBEz3Pd4iZ0KTJZ5HiPTUd5AL/R6l?=
 =?us-ascii?Q?gQ5jc82+mK+hFfLHZ7Y/H0IolLslnTj7qP721NbyXhHrhGbeoJ717QiMTa6P?=
 =?us-ascii?Q?hS3TzoHiiPtiArNTQBHjKFy5MyS+eS22BfwWgD/rdIgOMCl0KP8AxuDmkHuj?=
 =?us-ascii?Q?LXxuQGIYaffM3Pyct8Si/xfAIsOBLs5tWpeRYGvXi+sYMsHZUOFz1IFRC0oJ?=
 =?us-ascii?Q?5kpfm6Rkg81PHAnxPz2dbH2UbJ+mjyqXGNXAp64lRVPji57lEovueg7XzbDK?=
 =?us-ascii?Q?WQ2DdTKIjakpqNGaU8nUgwEl5qQlBcq2a4OtW4N1O/Vk+J4lzTS+InIFIYni?=
 =?us-ascii?Q?vnnYgDN4nTDLX91E0MevVOylCigMFYA27wWvXTB6QkN8+xMmf1GWWDtw4Ful?=
 =?us-ascii?Q?IN1ZP5bLsI7ZvMKLRBx65S37tcnn8LowJNKqV+pNTLbiUFI/AXix3Gr9XdsA?=
 =?us-ascii?Q?iNQGBUMyNZJh6wiUm+9v3dzXbkNhN7Zd4iCkZ3lmACxa32I+QHw53XhmUxGu?=
 =?us-ascii?Q?zTQ4s8qV7Rlm9WK/mzLDs05nQb89y4j6aOzpKwEBty45ZNbhQ12zq7MDDayM?=
 =?us-ascii?Q?KL6YTigkDgJ4SJRWk00aH8bEM7+H22gVWi9r1Ka+UpGq6ihLB/8sJIvqt3Ah?=
 =?us-ascii?Q?aHdq7a1CWaVJPPtY5C0scQca2Vic++ldpDLJhhNHYmMNeuQNuWRJl0pCnXqt?=
 =?us-ascii?Q?thTO2ueoFlfrI4RzjzyRi9alH7/clZx0RqC/c98UzXa9hvv4ndIdozyvAi4D?=
 =?us-ascii?Q?az8Oe3c/1lgUgalShEVyhYw6BGKDIOfMurIiF6VHgOsS2as0BkTfJph3kHRt?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c372ee-becc-4c88-4b71-08dbc12ce5f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:44:38.5624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RH76OuO+/Y9L8fvCGjRH8kCT2DBqqeW8kxBrg6OmEOkVwUIM/7Pz8qt9PM2rHGhEoo7dN0nv/7YrpPVQEWfJy1h2zxcqX0+tk8zEQo8JTeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 6/7] drm/xe/pat: Add debugfs node to dump PAT
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

On Thu, Sep 28, 2023 at 10:02:52PM -0700, Lucas De Marchi wrote:
> This is useful to debug cache issues, to double check if the PAT
> indexes match what they were supposed to be set to from spec.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 12 ++++
>  drivers/gpu/drm/xe/xe_pat.c        | 96 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pat.h        |  8 +++
>  3 files changed, 116 insertions(+)
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
> index 296763594370..20714888a5fa 100644
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
> @@ -43,6 +46,7 @@
>  struct xe_pat_ops {
>  	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>  	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
> +	void (*dump)(struct xe_gt *gt, struct drm_printer *p);
>  };
>  
>  static const u32 xelp_pat_table[] = {
> @@ -151,12 +155,38 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
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
> +		u32 pat = xe_mmio_read32(gt, XE_REG(_PAT_INDEX(i)));
> +
> +		drm_printf(p, "PAT[%2d] = %#8x\n", i, pat);
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
>  static const struct xe_pat_ops xehp_pat_ops = {
>  	.program_graphics = program_pat_mcr,
> +	.dump = xelp_dump,

If we use the unicast xelp dumper, some of our reads might happen while
another thread is steering us to a group/instance that corresponds to a
fused-off mslice, resulting in 0's instead of the correct values.  We
probably need an xehp-specific variant that does MCR reads.

It might also be nice to have an xehpc-specific dumping function that
does field-based printout ( CLOS, MEM_TYPE ).

>  };
>  
>  /*
> @@ -166,6 +196,7 @@ static const struct xe_pat_ops xehp_pat_ops = {
>  static const struct xe_pat_ops xelpg_pat_ops = {
>  	.program_graphics = program_pat,
>  	.program_media = program_pat_mcr,
> +	.dump = xelp_dump,

Xe_LPG / Xe_LPM+ need to choose MCR vs non-MCR based on GT type as
you've done with Xe2 below.  It would also be nice to have field-based
dump output that presents ( L4_POLICY, COH_MODE ) separately.


Matt

>  };
>  
>  static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> @@ -180,9 +211,64 @@ static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entrie
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
> @@ -252,3 +338,13 @@ void xe_pat_init(struct xe_gt *gt)
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

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
