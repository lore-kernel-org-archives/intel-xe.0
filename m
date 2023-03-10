Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36CBC6FD19
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 23:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9793D10EA32;
	Fri, 10 Mar 2023 23:59:12 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5468710EA32
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678492751; x=1710028751;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5kiBLLnJL1qjGoKEBroftEJR0jndmUdCvWO1SgJDu5s=;
 b=ncJ2UEmSQ4tyyJOfU/Wz4xdtXtG+GCa3DJTN6GYfkm8zME06jYmfANef
 Au1+Fvh/ZKUCwOYT3qFtl1b7GLYA210QBVadDHskuIXwz4f0b3tmSTrKP
 WL43220v/p//66FUGeNezfPWgsRgVxfQXydLeVtLMB72ZWlbaxZACqDHl
 xiKXVrJcxMPSKglugw8zSGdMsJYcNMuku/9aVsQA8P3dE+QPslISYzCUX
 wb5UG4T+i7djR+KvAtx74kPCasnWGOZ4BZsB4pmagi0DJP5H2iC+F8raa
 PA8Wq4/11ExlZPt6t2R/9Av5PhmUXOoElIcBtu+q2pKEPhke3HsM6XrXq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423121518"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423121518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 15:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="742177530"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="742177530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2023 15:59:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:59:10 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:59:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 15:59:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 15:59:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0i4R9xUCiNH4SsAsqgMNp0ol7kmjC09SPf15Sw6hIdPAsPfMpIqSEr1F9AKg7+OZCxfhmlFqWzZQgVXCSHD/fMJWYo1HXd91sntQwi3fAfFvTK/YLr64pshtFEH1WJLCCcvL83m+Y/QLQI5F0bb+b4GieyR8rzOBu8fIqqsXNWcb1XzEtkjgXwPoVqxB3OuKUVpwg2fKu4NWToFRunlrNENq1KfT5Eut4/6BbMtJEElysNVwXN9CPszGbEiL1y7dgWD0qhud+yOqcWbyKAufxEvU3wP3nfRNPMktQtSW2snDfrQwtDG/wioxSyCwFcWjVq18Ct9MrqoF+tampQ3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pxN7Q7BxXump1jImQQiBrbNwbnFVkA0lfdnmniAka0=;
 b=GPYpW1Y8WhAs7EWmOmsT0c+ntoK+1RnwYPGiH5U/QmP2quh9vzuiQLvqtz11R0Eehv2ZvdFn9nbvV2JstYMxfy0Z0vffo0YKnfuM/1xqNgnM6xlNe1fC13mdot3ruyUDA9aTTJ1XLePTIyio0K6ljs5pSMNVgl9UEeD8m18CY1DDikCms3hz3q8a/SeUCvDRQjAraMYe5UFD3Hx341nXmIdH1JOUd3C4CGTV8hp7f0pcJH05mvMGyFPou8dWvvSJmfG/zK0w95mMB0wlBEEXNFivKrIZhiI6LQVUsBI2spFp3RrNDKtvleFL1s+P3nqaMGBzkkFTa1N0RGMu61ZFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7827.namprd11.prod.outlook.com (2603:10b6:930:77::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Fri, 10 Mar 2023 23:59:02 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 23:59:02 +0000
Date: Fri, 10 Mar 2023 15:58:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230310235859.GX1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: f21bfc73-ef47-446a-ec01-08db21c36c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BeqWgrv8u1/GJSeETvDhUcx/mnOJq6Nq7rHt5a0cEA5GwbNY22ZbXzn4ZHO2cut6O0c2fBwE4NnAqQ3/LUb/v0tzuDZETAvszFtmqJDFMKqTao6q9MImOHJIC4gesCY8mxwWKaZR8/d4GpjPVRDm19VcfJ/rosvnkLvGV4WGHN4lIINwyDKaA9z4uFlH20uhKflA4LW1AbqzjWLnrIAEfdLxzEc0ZZ5yWPgCQ3PNVpBb0CuTNiigY6rOUl5AW82SDxdgcmql3oBn67j6PkF8YI48i0K2dehuBPRjVXGI04GN2kjCN3UBa7uwpTD+i/e8CBS2sORawOGHigNXK/wFrSiCaQVBz8BaPPcD4HdPljt1uZw+nNsyh34ck+Ks0FY+Eo0WqYBZvKJ7CDvd9TSjnnXaKaWp+wJIGNuh1uD5oGn6oWoKilIPfaPK96Z1J1U1of+ZnC6whkB8PXJWR2ISzzEqKi451X2aR/Bz3UvSsw2eKTQ9e8Q+6hs7h4nb280nXVbx122ftwOUxstNJ6GekN5C9IvM2o9yZBBpF5dhtyAbm8lAXNCVCgjyV2ec94abHUW/sgsAP84QaF8qRO1TRwFx8V0lLAqT378TMuZSjoPrq6Vx/M48kfXHH92ABaWbzURyqUX50CpPiDv3FnIsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(136003)(39850400004)(346002)(451199018)(6862004)(8936002)(5660300002)(26005)(1076003)(6506007)(6666004)(38100700002)(66946007)(82960400001)(83380400001)(186003)(6512007)(41300700001)(316002)(6636002)(8676002)(4326008)(66556008)(66476007)(33656002)(86362001)(478600001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kte36bHkvRAfpVRNyZaFKlIEyyOVmjSrunQhJEu5m/RAgmeJejh2/nr+T1lG?=
 =?us-ascii?Q?XgzouHqFH5hpgOD4swgsLYK1hFrsIDQhK8SZpqBtSyAJ0Brrhd7bza8oPTMD?=
 =?us-ascii?Q?WbM9edCzQswLoNmkuDPXMZZI/slWmJ01Ee2pIo/SLhnYNUGtQTh9RPG4S5YD?=
 =?us-ascii?Q?y2zSmxE4fpeznCcs0Qw1F+ukJEuC17At6WVA3gzlnzxXA8AsCRsgIBWQkcax?=
 =?us-ascii?Q?AgZRPp80CskHu5wpiElntl9fHAMpABr4hy/6Znj9o8zrYpEZnk6G2HQUHJxQ?=
 =?us-ascii?Q?Z2PtA/v6EMDoe8xOwiVGCvvIIfQa8G/dW5WWDvnpHvSVO5MV0GYjJW7vvBXV?=
 =?us-ascii?Q?VtLsonKkwENlGzBYaOFuW5G3aWas7FGn7UmmPYAJRaOErqcAW7sp6argd/lv?=
 =?us-ascii?Q?N5JRvL7R3C+h6AseNexXNxduZLnwDqxh8+reR8d70f4eN2sDjXMU/bUQsdmr?=
 =?us-ascii?Q?ohytyl/4LSxYCYQwpN2TsPr6OHR2alk8Vi7+RgCDV8qzLDvZeWDZamwCCvo1?=
 =?us-ascii?Q?LO7onG2bdK5IrfCD+2Ae2eag8WPVBgm/MkQtqCrmdXA5FmOLR7tNNuaz1Wkw?=
 =?us-ascii?Q?a9RL68C2xYHMY4lTxTo2KhHHAYNKGrRfKvoTN3eZABRKo8h57D7y2OYC8s+0?=
 =?us-ascii?Q?0a8ROYKOiKx63H+QwaM9eM9xReM6e0ZpAnvz+ZQJpnjhP5NxdTr6c5dyWN//?=
 =?us-ascii?Q?qaDqk90TmAZ6Ozg8TfAy0oAUufucMDPgP03ggeAsmnGoY3yTiOI4i7AqIg8H?=
 =?us-ascii?Q?TjR0qnSWesuJc8nLuIHw/yk/ySI/e6rSxp5R4+AmoBYDE2/imX0iU/LldyKu?=
 =?us-ascii?Q?g7IK/dX7tj1A2iJqJ1WKDimQ8Hb3E5Hn4d5t7+AgSdSZhRCDrBsxlWgnRf/C?=
 =?us-ascii?Q?FNYBxdlkW6B3v+pIXee7Yqk5gFHpyHaf4MQlnTYkPmcrSEIHlOLI6MdmY01L?=
 =?us-ascii?Q?Vx6XR4M+JL7v4qIm7j/M+wGJ3wTKsf+HBYULZKr8/TDXkmzk+TOHAVLctLQN?=
 =?us-ascii?Q?G9a2bclOTpTgMn/tKSAFutBMGrA+9CEWr/b11u+3kSL/x1aao2aUN+4fG8of?=
 =?us-ascii?Q?jClSaaZVbhOa/78eDAfGsQl87f6wA9FqtmOefIMr2LZ8S2LOqAwp5Zw5IL9d?=
 =?us-ascii?Q?KeXKMu2x2q7gnx+VBT2t3CGPvgyyEXkb6lFpjccI6hMc18a4pzuSQgpMNTLJ?=
 =?us-ascii?Q?S/mgT9/vnuSMD4xZNRxNqoBPe+J2UQGaViR3ThhkTUfAdjGqowppWIFFwKKM?=
 =?us-ascii?Q?zfkisd+AOxiif2tKEKMN0cGRiR+VKPPMia4tbuO1A6nQJnovkuz//aVxZrxy?=
 =?us-ascii?Q?3/jcHuBM443YgtzttrYGl2Kj/Q0EzKPWcMnut6lFK+6kR22HuvneDTotwcqz?=
 =?us-ascii?Q?6rscCG2X3ERvyYwnc3R76n2KfNwQImSBiqONK63sr0HvpFMbHbwRZ7dZCogi?=
 =?us-ascii?Q?lkxRjFqxEjE9jl+zmL/33wUUUfAEPXN11UWNsw0gFiXECvB+/n7cMbaqr24z?=
 =?us-ascii?Q?Ub+5V3hE5h5+Ks05pDMY5qTcbd+KfEmzpR44h12I5TaC1mG1/NInzol1QiXp?=
 =?us-ascii?Q?L3mTfaH+w7JHh7gQbjDpmb7Kz8cGiA/oF1xKf8wuYIJ3tCEcOhVILdGHGwcD?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f21bfc73-ef47-446a-ec01-08db21c36c57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 23:59:02.6379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxHlhjiO5Ei5yuhPdJ0m+xk3/QyUULHxcoaDz6SN+rp4BQu7jC+sxs8U0/zGF0KcndrFzU+uk0keHtE3c3NCE3gso9r5i8dJyvknrmBtMTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7827
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/12] drm/xe/debugfs: Dump register
 save-restore tables
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

On Fri, Mar 10, 2023 at 02:15:41PM -0800, Lucas De Marchi wrote:
> Add debugfs entry to dump the final tables with register save-restore
> information.
> 
> For the workarounds, this has a format a little bit different than when the
> values are applied because we don't want to read the values from the HW
> when dumping via debugfs. For whitelist it just re-uses the print
> function added for when the whitelist is being built.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c    | 30 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_sr.c        | 22 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_sr.h        |  2 ++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 18 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_reg_whitelist.h |  3 +++
>  5 files changed, 75 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 78942e12e76c..9fab8017490f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -16,6 +16,8 @@
>  #include "xe_gt_topology.h"
>  #include "xe_hw_engine.h"
>  #include "xe_macros.h"
> +#include "xe_reg_sr.h"
> +#include "xe_reg_whitelist.h"
>  #include "xe_uc_debugfs.h"
>  
>  static struct xe_gt *node_to_gt(struct drm_info_node *node)
> @@ -98,6 +100,33 @@ static int ggtt(struct seq_file *m, void *data)
>  	return xe_ggtt_dump(gt->mem.ggtt, &p);
>  }
>  
> +static int register_save_restore(struct seq_file *m, void *data)
> +{
> +	struct xe_gt *gt = node_to_gt(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	xe_reg_sr_dump(&gt->reg_sr, &p);
> +	drm_printf(&p, "\n");
> +
> +	drm_printf(&p, "Engine\n");
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_reg_sr_dump(&hwe->reg_sr, &p);
> +	drm_printf(&p, "\n");
> +
> +	drm_printf(&p, "LRC\n");
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_reg_sr_dump(&hwe->reg_lrc, &p);
> +	drm_printf(&p, "\n");
> +
> +	drm_printf(&p, "Whitelist\n");
> +	for_each_hw_engine(hwe, gt, id)
> +		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
> +
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"hw_engines", hw_engines, 0},
>  	{"force_reset", force_reset, 0},
> @@ -105,6 +134,7 @@ static const struct drm_info_list debugfs_list[] = {
>  	{"topology", topology, 0},
>  	{"steering", steering, 0},
>  	{"ggtt", ggtt, 0},
> +	{"register-save-restore", register_save_restore, 0},
>  };
>  
>  void xe_gt_debugfs_register(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index f6ed9e6e5697..9eaf1be27886 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -8,6 +8,7 @@
>  #include <linux/align.h>
>  #include <linux/string_helpers.h>
>  #include <linux/xarray.h>
> +#include <linux/string_helpers.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -230,3 +231,24 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  err_force_wake:
>  	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>  }
> +
> +/**
> + * xe_reg_sr_dump - print all save/restore entries
> + * @sr: Save/restore entries
> + * @p: DRM printer
> + */
> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p)
> +{
> +	struct xe_reg_sr_entry *entry;
> +	unsigned long reg;
> +
> +	if (!sr->name || xa_empty(&sr->xa))
> +		return;
> +
> +	drm_printf(p, "%s\n", sr->name);
> +	xa_for_each(&sr->xa, reg, entry)
> +		drm_printf(p, "\tREG[0x%lx] clr=0x%08x set=0x%08x masked=%s mcr=%s\n",
> +			   reg, entry->clr_bits, entry->set_bits,
> +			   str_yes_no(entry->masked_reg),
> +			   str_yes_no(entry->reg_type == XE_RTP_REG_MCR));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 9f47230c8ddc..3af369089faa 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -14,8 +14,10 @@
>  
>  struct xe_device;
>  struct xe_gt;
> +struct drm_printer;
>  
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
> +void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
>  		  const struct xe_reg_sr_entry *e);
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 6c8577e8dba6..c4b3a2045299 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -108,3 +108,21 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
>  			  deny ? "deny" : "allow",
>  			  access_str);
>  }
> +
> +/**
> + * xe_reg_whitelist_dump - print all whitelist entries
> + * @sr: Save/restore entries
> + * @p: DRM printer
> + */
> +void xe_reg_whitelist_dump(struct xe_reg_sr *sr, struct drm_printer *p)
> +{
> +	struct xe_reg_sr_entry *entry;
> +	unsigned long reg;
> +
> +	if (!sr->name || xa_empty(&sr->xa))
> +		return;
> +
> +	drm_printf(p, "%s\n", sr->name);
> +	xa_for_each(&sr->xa, reg, entry)
> +		xe_reg_whitelist_print_entry(p, 1, reg, entry);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> index c76d81c528da..69b121d377da 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
> @@ -10,6 +10,7 @@
>  
>  struct drm_printer;
>  struct xe_hw_engine;
> +struct xe_reg_sr;
>  struct xe_reg_sr_entry;
>  
>  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> @@ -17,4 +18,6 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
>  void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
>  				  u32 reg, struct xe_reg_sr_entry *entry);
>  
> +void xe_reg_whitelist_dump(struct xe_reg_sr *sr, struct drm_printer *p);
> +
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
