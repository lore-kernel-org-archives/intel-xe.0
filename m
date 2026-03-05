Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3205F513E1
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9660510E114;
	Thu,  5 Mar 2026 22:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tld+uoRh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB09310E114
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772749517; x=1804285517;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7WnJaJKJ1OO2Ts+Cr0y3kOJDpzgwsYLu6ba8pPl3sBs=;
 b=Tld+uoRhN/VJkKhdfyUt/H63B+voCkCwzZqHpxZlDhu1OioL1iDFKaE1
 AHvQPzJvNMyVQJtysd57o0mg/hCDOCxGePluTWML6t1scj6eeToEARi7o
 4SkU0t8vXEoPnSuQUilm88iUx/PxxvbNTHEwMtx4iP279GhNjtKbwVuc9
 anBdPcGDpR1uSQvCilzl3MTcgZTGi/F93bFFGpJxfmvPGIw8jFccpelLG
 4ROgmQ9HmCJWCa29ubadZjjEJBwpKzO8FGd25aJ7ov6KeR4VSHKfTaJCB
 Too1Jya8z9PNrnWkEL9KUNbPVrxxL5tmx5yjqALJiES4ZjA2eoelRSX/T w==;
X-CSE-ConnectionGUID: FjM+/7nwQ6am35+nxNTKPA==
X-CSE-MsgGUID: uF+ELA+2QFOA5IzCVRmQxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77698936"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="77698936"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:25:16 -0800
X-CSE-ConnectionGUID: xwtu9x0JROqVqOWweE+j3g==
X-CSE-MsgGUID: X/t+689pT0iXHleKdxvEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="249290275"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:25:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:25:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:25:16 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:25:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDwZr+vFmWKe2T4b+afhWj000dlKFHkMlFv70+b5+O21Uo48ImzjLLOWYXQ2wpI+BMKz6ODZ2tTk1Jv0kNRH96wqwRMuMGsGlTqGD3G1DCstM4LUVWoNsYuCNXDJ0u95pZbDN3SurX8FRDg3vKKfI5urZz6i1k7ZoTR8/vsz0zeWCHzZSPdEbC6kUq9Yblthd1V2eFNcr/MHoFRSEksgDXiC/mEgPSkO1kSbj7e+M0mI0LUVrABZHEORRn1A/mELER06lTT/QLKMxaxvMGEHF+fWXI/iH8IN/N1fCsJDMEOWKrxgOZAzIEaG3EgcMNzSw2MTPphi2XOG7zFYk9cS1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zUmNRco7LJweyiNBTS04JBtC8x5rB2Pl7dmyO/hPE8=;
 b=tstqlTWawIsdJXxhuDo5J+EjqLKfM1UqO6mTtFMD0iCJ5g7risvniaMiXOSztqv77I1uh7C7ATuXJmZNxAPDMWMwfF+SpP1U92tmLV4GwjytH7jZLBYEdoA+n01f3Ly7GE29unAcN4o/ggy4ea8YDe1vPuE8rLDBkHmnHLArSNVxN1FIVVmhfcmySS0xSLcRyu97WkqH9egJRB5KWdnYmva7hmPK90JApUTN2zLaZmAtHjsP4dWdmFfPyMzpP+RLYhbZpIDPz36oXgI5tzOoK7fgC3BOBM3Zol8Lk+z6j+9SWYriE4wLlsyd+5qjMAN54NaX+hvWDD+mlxVbDEBOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8402.namprd11.prod.outlook.com (2603:10b6:a03:545::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 22:25:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:25:13 +0000
Date: Thu, 5 Mar 2026 14:25:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/7] drm/xe: Translate C-state "reset value" into RC6
Message-ID: <20260305222511.GU4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-7-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-7-5020d5289dea@intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: b4d23ac6-7221-461d-c47e-08de7b0611ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: x4QGDt4xZLDvSZUa2BE6Zab5KCPWjr+fal3SM/IdUerx4rT1ddQirrN6HHjyrxwgZouZ3eFHRHSaKj8C83x9IfaPN5ZwsqZ0ZBtdLNPQMhAmE4+Jc9BSd+vONOl/6cNteVwhgb7KD6TF2ZGVqNEeC2say/scEFOzsQPeHTIAlQNdgUQQ21UI09F9vlUacLgr/r5Azh2mqS9S1K+oVdsilCbUdPwwfaajeYQfOuWuGOAJaHudxEhbsJUMPhOjVS8QpcIO7Ia9ek+jrrI8DkuT1zUplqQOvdTY4Eu7kutIZy008CTvwRm7sYWuwaiACdG8bHTJLXnDOaDUWGfGBBKu7ysLx/FCusmN9+7QXPTaO60KSyXmy51YuvFNGHYim0focA13YtsAmN0/sb40kdG9FpOk/yb+O1N2gXo8PjLnJz2UZe9X3sSoHkOk9nN5ENSy6C3MMV9g8Iy59/DB3RXI4oqpqzykID7kwsYe46i/x62SfFKSb/ldOI0EtvD2sV0chC0vjDjeEd59kcI4LBZmpIDXlG6P96pPymEBSTxM49bGWGpUIk6G3/D+zcqayeoargX/s+xlvCfv0UgRRUGPO43HRc1ySoiEcRemlDSKmTFEGuLC+VqDy8DvCQoS0k2HodIAow++8rei3sb+GPf2g82HC3btPP7QWNUOWM7l1J92VhQSkRdqKIC6K4ZS/1WO/hmCaSe+3M9xeKVhkuwQExsZGeOfMj/HcbO130B+Gq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IiDkIkjfCxANwNHLOiryYGhgpeT/QHlEgJuKqBRxZ8d5C1AcdhCcKT3BkTzS?=
 =?us-ascii?Q?Fm1/ozjDAwEzrPRAXAmfH9L418/JiKJvyZi6jZMLlQAStFx4YmXpZFmwKIMf?=
 =?us-ascii?Q?GdM/a+UCBB+kJeUACaEr7QCP+p52uQ87uHrbbf9CRwXswIjWnoDoQTXlqwSG?=
 =?us-ascii?Q?xcr3vD7wTh+Zvx5dqQl+4ZaZEpk/8VVjiSmx3WIEtkBMCafe5cYa4GZnWyav?=
 =?us-ascii?Q?LpepVBTFyPn78RCS/MjL5IS+VDwkpXzg6cywlkkNSHUzLt4Xg+Kyes9v2puY?=
 =?us-ascii?Q?DCAGSNJBXdjseBLKSGaGZwDSkzgdzqiRDHVR1EX4M1x4F1u71tZK6Yd5UQN9?=
 =?us-ascii?Q?gOa+FbMx1HA4RbXjaLqUo5jR2IRTVCVwGiCoIvdMed97JzZ+XJlr9blcmCLI?=
 =?us-ascii?Q?RhAHyqEsdiXOFwHQvoXWOOVEXIeQ5YSCIWB0djDCshf6qHAOLcfwZPg8jLFT?=
 =?us-ascii?Q?O+2GzxWv3kUOyPDVtTkjyPEHXMuZirL6wnMMisSr/axX+S+sd17wlLbiIovb?=
 =?us-ascii?Q?tFwkr779+0rne1fra2QYXB0Q7S0OSjXos7NwhSyzllKad6SHsT+REALM5Q3r?=
 =?us-ascii?Q?3e+Os9ySYF5mGGaNMvEjou9x89QZv3KUZonORA4kVtmRIbU7vJrJ1ZCfm5qf?=
 =?us-ascii?Q?4K7vN7GiIDgUB3NTkqcIJVAQ8xvbZ9/apJR7N4NF7HA2BidWtQlnxTcKQlkl?=
 =?us-ascii?Q?1xY38cXS2E3FGdbDuwer/ngF9rCzi6mG7Tl+ALyQaXOXXla3JakwSqLJQ9mB?=
 =?us-ascii?Q?9/6Q1wMT7DKVvw6TUuCLo/gGrPD3tvWvTnjpXcLO/KowZWKnQh5clYnVBLDQ?=
 =?us-ascii?Q?mlJrIYCfwBlrC+6llZoKmbWUx1b5+6wQrt5klGsxdhKCUATYpWk1LcOUOZtS?=
 =?us-ascii?Q?2lOeEmPBI+MDWIxFxmgHoTCD1TR4gKldJwbAwlhYKXYednogATQwk2dRT+K4?=
 =?us-ascii?Q?pwUL0tvYfWqi54ru8AWJ6BbrV66Yz/dfYKHv3nMPw+UcMlBeywog0Ms+QlsH?=
 =?us-ascii?Q?HSvE9w78ZGPMDSMH27GXZirCjBSm8f8GGORmy3w+qh8gUbdQ8hQDnRWVUZiZ?=
 =?us-ascii?Q?Y6PROi/qXRrjfoRvqegpE5L0wrAnV3YqUmXLh2GBEyJ1oVlK0UM5s0WMAO7F?=
 =?us-ascii?Q?CDMX2+2KmX9nBh4Yewv++GXScTAV+AK56dCMx6hJLSAkoaA25O3wB6rYtMXz?=
 =?us-ascii?Q?UHtfiITuNQzBZOGxW1Qbsb8FPb49CLilcxeqUWR3Kw/+OgBVjY2hUmxNUOTq?=
 =?us-ascii?Q?xPZdw8jB68CHGw1bYA53tA+UzY3cGxFhPUtLUrO3LtE1wOqXUERfJPtGesz9?=
 =?us-ascii?Q?Oi/lM7+tiaDURD7LdciNTkmRd5C7kHHDZhnTwHw08Zo05IIojoFQa7HqLXSO?=
 =?us-ascii?Q?G/AwHoYit3aubg9PsM4XO29lRU8vL5UV3I7o+pe58QK328pDUE5rCYwYm0JA?=
 =?us-ascii?Q?cf32B6X2NAgx/SU9hrUTHv1gDMw4YW2PIzNtjQ1cR9TOCjv+XVVEkH5d2l2V?=
 =?us-ascii?Q?8l0F7/D6VkI6edwHZ7w1rxTnV8rg1oGqaiaAvOHDCFL6/xBLhofzIf6pM1KA?=
 =?us-ascii?Q?9CSTn+DAiQEG55xUrnp7yeRR4tlGlgdgEF8VOsfNwfSnLP/p59u9KxFah34F?=
 =?us-ascii?Q?6lZBRNpvTfJo2gg6bQ0qPUZfq/iqkxj9LhOopGf6f6XfRzNG9CLLOtSVKc6A?=
 =?us-ascii?Q?SqnX1+4Ajn69cI50UiYMUNdJ7f0cCrZYlAfYNibiUZ7eX9SgHQSX0eBFmGaX?=
 =?us-ascii?Q?zSIlgJC+A2FIZhMHx3S3AcU8Y/cy6a8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4d23ac6-7221-461d-c47e-08de7b0611ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:25:13.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsNUMVml/d8iXlYSfS2UK8QPph69p08cjuRdhSWuxEJLsD2d5zXLNMyOqS+uRoPj6JYpeS1oNSB5jP7veEan+xfg7P3x/gJmqJO1dsJWtPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8402
X-OriginatorOrg: intel.com
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2026 at 09:02:34AM -0300, Gustavo Sousa wrote:
> There are higher level sleep states that will cause RC6 state readout to
> come back with an "in-reset" value. That is the case with NVL-P. As
> those states are only possible if the GT is already in C6, let's just
> translate the "reset value" into C6 when doing the readout.
> 
> Bspec: 67651
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f49a28f4a330..1cc8c7c2d379 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -20,6 +20,7 @@
>  #define MTL_MIRROR_TARGET_WP1				XE_REG(0xc60)
>  #define   MTL_CAGF_MASK					REG_GENMASK(8, 0)
>  #define   MTL_CC_MASK					REG_GENMASK(12, 9)
> +#define   MTL_CRST					0xf
>  
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0					XE_REG(0xd00)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 21fe73ab4583..bb8c4e793492 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -756,6 +756,14 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>  		reg = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
>  		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
> +
> +		/*
> +		 * There are higher level sleep states that will cause this
> +		 * field to read out as its reset state, and those are only
> +		 * possible after the GT is already in C6.
> +		 */
> +		if (gt_c_state == MTL_CRST)
> +			gt_c_state = GT_C6;
>  	} else {
>  		reg = xe_mmio_read32(&gt->mmio, GT_CORE_STATUS);
>  		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
