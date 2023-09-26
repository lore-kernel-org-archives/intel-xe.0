Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24B8E7F144
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7320410E435;
	Tue, 26 Sep 2023 23:27:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C0A10E435
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695770864; x=1727306864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Du+/BQmXOvlZZXx+UvIBKrneV8eh5g5Z46nr87mTclw=;
 b=IvxAHEiPRhriIWlki8AjvJG0SfH8QMFBF4jWVTDb2YuCJmRWLpsIY2lJ
 vMxPHeelq1foEuqGgfK3R6KKyIgvC9W9RQ73oIthdgQF8nLYO9TQkmmOZ
 iCT09EdqatInkWISB0+XIeWM797OIx31v0piBe/ZZeKWks5EWrRDsTsvn
 PlQ4wYsRy3P6yeiTt/JYdRfmy4n7ZrIsKirg0lL3N8YWfGqiSjPmIiYZn
 YzrXG5H+dVtBSU64v094IXNXk1euv0OD/CkM33fajW3HqKm8YByRBfvET
 6X2S6663diviVSFZ1OR88CfuEQ0EhHROPgZlhX+TiDus7MNbme4D/X0jM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412604590"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412604590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778315596"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="778315596"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:27:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:27:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:27:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8up0qbmszp1lkveJLC+EMIZAIdt35ganMuCdtf3UosIbizsbgmpdrbOKZcs71qECQSlnG+IUHFasyJT381q7tzTUFNKsZDJhbGeGg0q/agwluWbvXM/nYZ8hFi9Mm7lTWOhXGA7Jys9UfS6kC/oEnYCd9JOwScRAuFXMqvZlyrkfZe7JpJbfoWPabGzgnbfcDUZNwsWnPiTciCFsNzP4Z9UJ0Yxh87cFGEQbNjkykAHBIDkwvXtX0lbsHGAJ/hvzRhe5czeXSOnOjQNZROageCnkm5fnwbs17YAK5bSPIY1lQrFkTPlrqblZ/wavoA5yCjvvKW/sS7aA6QYqSY5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqHGQwSPt2SWVLPFv5O+I7yvtzOCkihR/oDKEm/nuRM=;
 b=oNIpsDMl/8f0CbTL+zV07x8u3MZqkiOVUGOLGBoGXWnW7iX+ef/KRyPYINWqanS+UnJ4nAcd8oEoir/GbMUmEmi3FPW1chnroTJoL0XWXotuZbk7A2C9oUv67uwx5XtiUFRlT7hUdC36xo9MY0ZcVlhx7ieqCN+pHGbnvoEahZfz6/ve7ciQOOOxll89n2zRZt1FXpP1gRNBBiGQbuLxMcqu0ME2vFm/7ceZZKOHY1PL1gbDvjbB49/sfpHqDDw5b0FNPuM5wHjJaUDV1f5+BWgmhqGzQefWC8wSM2WYTd+WZXrDnQ1uBPQhlkjAmulBzAnpbPvL4cNIgcjSP/PL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 26 Sep 2023 23:27:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:27:41 +0000
Date: Tue, 26 Sep 2023 16:27:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926232738.GY2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6e1889-95a0-4b1f-6e2d-08dbbee82dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ocSK9uPdZY5N5ftOs1NYhRfs3jC79fAwLdGbeTZaqYc0+ROHlkfyQutA9NBvUx1ClYG6ZxmwnOVlDa2Crc/O7qCbnLL7ZOIYz3v4oQffoA3sid0Dz0rOmxS5pKJ8l0IetMW0GwwmbrZc+vXzClxT8boQxVr5rvEzDEgIIwNcwvWOYEv9U7nnVJy+10tPN7WHrG1nqCSWRl9UvWzBqEKxS6ox5J2jD2iINpdAZQor4YdfR50DovvjZZ3NL/iFj7a+2o08GgulPQW5KpnE2NerI5HiHaWD2/q8H+6ZgL/+5f3jQuQ55dMaMz82Oc02+Xz7CX9Pt0vOGqYO9Ju+vYq7l6JF0AHHmlh8D8v9eE/+HmzyQ/gDQo8oEQXWBYgcuCgrOSuHOwZZZEqzaih/hHlgUqgMoFksr3JG/EvUzhv/0tVmv4CjYoJ3dPcIhFUWHZIH957bXmQW5JT4GJUw8TkE1z6HNPGphJ42jMwi2bpYMtmz1HZW2YNXMx8AyQ4go9F2GqjCZR7m1s+POE4RWPJw/ppHiGUruqwAH5iRy7jeILNtAG7afqYH8WiuQTsSR45g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799009)(451199024)(186009)(6636002)(86362001)(316002)(54906003)(38100700002)(33656002)(82960400001)(2906002)(41300700001)(66556008)(66476007)(5660300002)(478600001)(6666004)(66946007)(6512007)(4326008)(8936002)(1076003)(6486002)(8676002)(107886003)(6506007)(26005)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bU5P/NeZadhSzQPfVDBc6wkc9utmA0kunXEdb5Pkjt9iwl4h4XQqXGAGjbfz?=
 =?us-ascii?Q?NXGzxlbZh/6xSCHxTNsW+EP0+j3YiKap2gOWscsOOpIgYpREyDP6yYyKQxxF?=
 =?us-ascii?Q?JOERbQWVFbM8boWxDUKCbAcqVGOKFmGzujd5Zz8l2U48QHTFXY+Iryqa6Bg4?=
 =?us-ascii?Q?nvTd7/mMEgeX0QznllY+sxMLkZ52LBOfxkzkgs1J+6niwu+oSgsgSquo/fhc?=
 =?us-ascii?Q?0ijUrpFiWO08q1NM6YBGoQOLi0KbzuumU/qpT2ayx0WfWUYW+ylP7+OVTpXK?=
 =?us-ascii?Q?k8Z0/A5W/kSNcejc6HJQteEmKEO4rYwVwuoAga5ZTaKsm14lscU6Bm3yWHjD?=
 =?us-ascii?Q?XTTjsraoIkBQskgX0C0AU24qMDYiNPGEIg8GZiUREMgZqPknhk6WrlC8onNK?=
 =?us-ascii?Q?Rf+kyDk1NzNQkOr/IJHm92HKzoEb5g4cMWMirNUKbvS3/C3P5YWcPBlOzJTU?=
 =?us-ascii?Q?bMiR50v4q85fEwPTy2zWbuE9jbH+jdvZvuO1emEJ/dAEvfdEmb6ekIQwGle1?=
 =?us-ascii?Q?CYBU8FLlr0Vtfr/Pa7qgmdzhfggEeJuma7ddzHqn2kfJVe+ib2t4Dg8qIPpp?=
 =?us-ascii?Q?DtpRYfiEmtlbTZJDIBxNxcvRLSmneRoBu0B0XQxnSSvk05PPUV2qtoLlfYdR?=
 =?us-ascii?Q?DMZTvlnn9/boiD9A01ZgaaUIDnFXt8NEXPPNzeMNgLc25gBQlm38qSqNyZ5i?=
 =?us-ascii?Q?2FC1wC7NECSBjsLNKaX1c5pz2YZ+7fREwpE0+KE0TZcGOU4EP7GZQ1Hrihbg?=
 =?us-ascii?Q?lobJ4mJCbGHNkkpgt4on/O9ZzMAFEH+QUmEBhT77nlhbvdntNKbSRdqHYgz0?=
 =?us-ascii?Q?7c+k9Y+CYekgVYl96z4hUf1HkshU6bZq978Hpg/rvS3fK/TFSmB7G5I6J491?=
 =?us-ascii?Q?2tNpRbNVjEfcg9Hk48qDXCE0JALkb66q3noHCAi57RR1I2x1/i4xJAJVq7fY?=
 =?us-ascii?Q?3POPgd1tIjN9OuUDGbaqzRIE71U68E+04c5qVLLVl3+Z9qntSE5jvhrZoUkx?=
 =?us-ascii?Q?GdXelHRdiKrac+5j7ICGFtxQi6efbM9aM8pploDzrQQSGn6vyWL2Ef7AYqi9?=
 =?us-ascii?Q?98am3sC4zBw0oHAEsV+s4BadUwhk05jdgk5oFJwp74o1sbwhCz7mIJUrdPCE?=
 =?us-ascii?Q?wEXAWBXQOQG2t/CI7JCZh7FKciau1Q+yJv2N9418kxBqn904Dyhz8fHnSUr4?=
 =?us-ascii?Q?edLr1duWFFKX7+v1iSY6dQxharztKHB3Nj4Qw5XqhrqGc5K2SdauvL5iag8E?=
 =?us-ascii?Q?o2Am8wwlYEksbFpOKdljY+uBa1nlrss+eo3NDbaF8O/C6VsCmmTY7ru5OwHy?=
 =?us-ascii?Q?uygIsTSKOEHi92wtKPXZsjixAw9pudgdypG8xm3XXD0qfyWtbFj+Wfn9Vues?=
 =?us-ascii?Q?2PErDhFS4o/U828GnJ/3aa/rvTeBq8jvmQ8ePKKAjr/IIKelRck/tu5uk17M?=
 =?us-ascii?Q?L7gg2CzPceNnkukYZKtKwSvO5nS0+RVZE3W5iwW1sW0yfxHBuQ3Na0pTSz0k?=
 =?us-ascii?Q?ePtU5B/EuNTmahMpFqPxDD8FDAXDs0kbr6K1x/6AcilH6vW2Cilh6BOlN0Za?=
 =?us-ascii?Q?K9csYm2aWd08W17rwQ+MRXYBU0lmSbJBpm3WTze+IKMmEGXP0MKfvcml1ZCU?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6e1889-95a0-4b1f-6e2d-08dbbee82dc3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:27:41.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KAUUUazzVlv+CNYVLpEVWdSF+fFAlXcjSQoBL+4T47HGBgnw9CdyTL4pWVmBK1rg5XmaojtXbPGdGvLQ341btSx/36Uq8DUDrmULjskuhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 08/11] drm/xe/pat: Keep track of relevant
 indexes
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:36:28PM -0700, Lucas De Marchi wrote:
> Some of the PAT entries are relevant for own driver use, which varies

"our own?"  Or maybe even "internal?"

> per platform. Let the PAT early initialization set what they should
> point to so the rest of the driver can use them where needed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

With a fix to the first sentence above.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_pat.c          | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_pt_types.h     |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 98835ee058f5..7d0f2109c23a 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>  #include "xe_devcoredump_types.h"
>  #include "xe_gt_types.h"
>  #include "xe_platform_types.h"
> +#include "xe_pt_types.h"
>  #include "xe_pmu.h"
>  #include "xe_step_types.h"
>  
> @@ -342,6 +343,7 @@ struct xe_device {
>  		const u32 *table;
>  		/** Number of PAT entries */
>  		int n_entries;
> +		u32 idx[__XE_CACHE_LEVEL_COUNT];
>  	} pat;
>  
>  	/** @d3cold: Encapsulate d3cold related stuff */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 234d0ccd97c9..6efa44556689 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -108,10 +108,16 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.ops = &xelpg_pat_ops;
>  		xe->pat.table = xelpg_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xelpg_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 2;
> +		xe->pat.idx[XE_CACHE_WT] = 1;
> +		xe->pat.idx[XE_CACHE_WB] = 3;
>  	} else if (xe->info.platform == XE_PVC) {
>  		xe->pat.ops = &xehp_pat_ops;
>  		xe->pat.table = xehpc_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 0;
> +		xe->pat.idx[XE_CACHE_WT] = 2;
> +		xe->pat.idx[XE_CACHE_WB] = 3;
>  	} else if (xe->info.platform == XE_DG2) {
>  		/*
>  		 * Programming like XeHP, but same table as previous platforms
> @@ -119,10 +125,16 @@ void xe_pat_init_early(struct xe_device *xe)
>  		xe->pat.ops = &xehp_pat_ops;
>  		xe->pat.table = xelp_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 2;
> +		xe->pat.idx[XE_CACHE_WB] = 0;
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>  		xe->pat.ops = &xelp_pat_ops;
>  		xe->pat.table = xelp_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 2;
> +		xe->pat.idx[XE_CACHE_WB] = 0;
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 64e3921a0f46..bf5000499251 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -17,6 +17,7 @@ enum xe_cache_level {
>  	XE_CACHE_NONE,
>  	XE_CACHE_WT,
>  	XE_CACHE_WB,
> +	__XE_CACHE_LEVEL_COUNT,
>  };
>  
>  #define XE_VM_MAX_LEVEL 4
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
