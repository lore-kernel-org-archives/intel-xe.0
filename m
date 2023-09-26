Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D1E7F144
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0189D10E435;
	Tue, 26 Sep 2023 23:18:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1DB10E435
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695770301; x=1727306301;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hoFYZHTiTwMcGuC/7C9IJQdIlk1q+9d/c4QPeM+m3I4=;
 b=e42P4/tC3P/hbF/hga6zbbuffN0jWwLbofI0wXTi/FLfzqf95pHxffSN
 +AJ51brid2kPZtJ0vtkMqj+2GBkIMsSFNH5b8/1ZYKSvA3l6Votw3Rz0v
 tSyhuPrBbGguMVBu86GsWW3NWONxKrR2/PsGx6dHDwZmivALxwBBPz/K3
 jmZU4gqcojWKkoKIME8iw+vQ17G9gaVtcro9v02psJu/ZbcRE3854iibr
 c9NiRYw0XW3u6ZUnSwFlytEyebOqo/Xcdy8WdqQUCY55KlcuFMrXGJUNb
 /fx3KK+Nh2eSYLRly7PyNkufwf1Vpa3TTPabvNO0sItPxlkY4IY8AeELA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361938844"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361938844"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922593962"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922593962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:17:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:17:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:17:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:17:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSaVikPTLw5EOu5fW1ZA/ayz1fNUn0LphVGsB+ma3I2aDtN2WSc/qj8J69AM6aPBwDwZnre/roTMoaIo3XS/eDNLbCD9vXz4e6SdZqXNTtrpiTbJ7bf3gZx++4uUScOJmAjSg8yXvurplgrUdXX8XZ81TKlAZlOE5eRJORLli8Pj6N7Zy/NoeboEdUHPRpV6qDO7WBFvpvYSbTzeL7Snb+R+/vtTEdvOLIXN4f3+5bNMjTSLCChOdqSGoQUgyGKp4JvkZYZ+TUDhfdTwB/SiWt0Lmmjkl7qtDm634+FRHxJc1ZtKUtx/lvYJ8Iagg9zEFo9BuUvkykKNx9Jc8Uvy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFuVWo83iovWNR+olEo4GiwJ7rGOvnRH3smPPtBV38k=;
 b=Fx3PiJuFE7CCq9gvf0LZsQevN7EoV/s08Qz+g3x3inQv3PD+DbxAcW5clBC8e/l068tUPBwamgIcOqUUlOOhRYicV7KEimDlOO/e9A1zeDOIdnz2UhM8emgdvwxMYueveYRFOtSV1kZV8zfbNp4+AI6bHcAql/g0NbpAkj37Y7/F00/f2G2rJK52qFrLK2D6i0rVu4QhREccW7Hu1VunwAJ2reHQKJfXEqj6iC0Zo7DTybjFqLYEqJcrasikIfIweLDi1VIIRpPkequy0XRoz51/0UYGdfVlMAQlIf6LLn7jLziaSrx+4ywH9G7eoAJ2o8anQUCCkfVproPVz45ALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.34; Tue, 26 Sep 2023 23:17:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:17:50 +0000
Date: Tue, 26 Sep 2023 16:17:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926231747.GV2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 525903e1-f8c0-44ed-9308-08dbbee6cda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yqX8032JKFv6TJKFefhEtHoGNDaNrCK3TWSLdbaDrpgGotzYp+kLPH0bZTd4ZUVfej3iu+bpJL+imH3h5X0ozXn3SlPwUoeS0l+is1dw7rujhP2hlQJ+a/DecfkcxkZWdOroyE6sOAKMQ6zPK/zcfV507Mqchm35qYGZaor56JXaVbWx3Jr1OvY7gYTtODfbk110vWy6V9OYxX305yLGLe82FodpzIGMj1hAeAMT7aTFmgQmvuNAx0XfPSv9gboyXzjl5Tq7j80Yqo/vsQyw1O3yB/Axs1KF6DUPuLpu7qf2ir82AUxy6xDyeZczpmlxHOSISRpGrUQwMT4hxsh55EWe7D33GW2fRoKh8Ts3uzvZh7+lUfwFDBevGZe6KTXHZKW3AlECq9apNUZL8gIrIwgS91miFaQqH++7fi2pgHZbklIxzDc1jCm0C6vdROwndFniXeQM2EzKRBNnWZIygv9lahtfHyZnGcXXdFmfoz7+5s3gKq1eEA9aVz8Il19OouGf8DUA+V/rBOCk4es1gu8RenB2lCGETi+UtHOEIHKexFhyfHKMCOa5S2N1kACg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(1800799009)(186009)(316002)(83380400001)(6862004)(4326008)(1076003)(54906003)(6486002)(6506007)(6666004)(33656002)(26005)(107886003)(6512007)(41300700001)(5660300002)(2906002)(66476007)(6636002)(66946007)(66556008)(478600001)(8936002)(86362001)(8676002)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O03gbQFmLB/5ducN66T/7j5UwuKGQVTuJrxL7AM5qhdJUF49RZCekr2GLgt6?=
 =?us-ascii?Q?JJABsbuhoaAC38tK8Vn6fD8fDKhrOvyjbVx9rX3PJ+mn0v1/JX9eEb1Hru9M?=
 =?us-ascii?Q?eN7ygTnc5nfAJ5L3uz38JnMtu4k341u2MiYZuAOhKrldVjrdEpUF5YzyDf2c?=
 =?us-ascii?Q?6ty+2PyiUdVcrjs/7H5NKVYpRor0FBpRSxWGZCC+eF3s3Pejjqw8G0gUpfax?=
 =?us-ascii?Q?MUYohyAk+oIT/5SCM7hGqGs1ZPKIgr+ZeIB/KmxFr5rirFeD3Z16WBLdjhV4?=
 =?us-ascii?Q?d5had10VnTEHMep5ucOCx5qfNfO6R3iXSnyEQdq077KcFh4WftAswl9rvgSd?=
 =?us-ascii?Q?he36KjK44/CC4cao97rAYGzvGAMBlLAQRbbBiuaOpUpvfE9fLdBUTJCF8YWJ?=
 =?us-ascii?Q?nV1bqPmtueU5opdBnMEM0RWAj2rLIAXGbj0lLcMgkhz5YCIciKPTZGUK3/4T?=
 =?us-ascii?Q?JgFJkBVSoXUXKZSgrcBuUMZG2z2LylEGAXY/cz9N2mG4MQDEoAarkZhoXP6F?=
 =?us-ascii?Q?fYLqq6GYOVj6HCVZMs1APujQX5hYhv8hf8c6oI4Lg0TLqHBw82vNgANo2nUd?=
 =?us-ascii?Q?3qKWrpZxG+jCF1R4M5lmQcC+T5UtAeM+tjS5kdgPG0mMsfheqbOEClUs6B+h?=
 =?us-ascii?Q?/aztWtgKzf1dJSFI7yzguTgL9ccIfK2qxynDHELttrrj8wqbVx4kYOOlNXSt?=
 =?us-ascii?Q?5MmNJmy+F1YWQo6m3R8h57M+09WUsQKZ8LruEpDHYU+f+gRJAmauUo6ThD6L?=
 =?us-ascii?Q?21CDTMdzN95V56OGoXJqxSfiGSL1lvFgdBdKOf2/c5KtDzxGHNlIbHJGmD+t?=
 =?us-ascii?Q?vOLoQtIGbB1Rpf7lU7UEFRO58+WvUN62CBDnxIfO5jcg8w/w2bYcFDXAkTvC?=
 =?us-ascii?Q?GMwK8xKVdql84YQ1TIlq/tsUaLYCGnr5TseuR8VQL06Af+BDglBJoZzjPjJU?=
 =?us-ascii?Q?1qL52VdmAFTlTcN5FP7nNu3GEMXvnXyoZLKLZskjM3oBUlhFk1o2mFfNpeos?=
 =?us-ascii?Q?eQROB13FFGX6E4i9i7OUd+vQe/ZuXwBMJztbxUsXmuYyzqep38CrJzoNRxPx?=
 =?us-ascii?Q?R1dBV9GSiz8gUSw/2k0bn9D4DwrWLYv3B4mO/b06ZgwVjoA24d7SF8a/dFq7?=
 =?us-ascii?Q?njE0A+c39+9+rdQvn3YYrMP+99XFPgQqV0PCCtCcAuxiaS8Yo7WYhj/L8/v6?=
 =?us-ascii?Q?5DDwckZ9rWrHiBiYCAZqo7sT9y6uOxy2AMZVpCItBFiDC0nA+RS2vwzvf2SV?=
 =?us-ascii?Q?2HG6+ExcAzo2OEKkzbWeQz4C+SVs3aCUrZUB0DIP5eyfcK05oz4Yq9f0VtXS?=
 =?us-ascii?Q?7hRw6VakdYiQ8esMyFlK9D6SyD9fIfJco71plpT1Emx22vmOrPnvkvfjd71p?=
 =?us-ascii?Q?9yu88+mXDtQXg7LFmxo82+0Cqp7hho2NPZKfj+a6FrDR3rJuN1qi4p7Ex3B1?=
 =?us-ascii?Q?wC+obvLXbWU2EqZ3TD/bJg3K9cNlwSF77p3DM7c9OZGoRzr51COgdu6aazJd?=
 =?us-ascii?Q?YghIQbG92aW/CuoQmVLX+9DElTK9d1iUX44+90J2rlnidv42EsuTRq0dX8w+?=
 =?us-ascii?Q?T3dHCnTDTAuvttrhyCQb5UIctjAwn34Xwkr/0y6YH2wyymFhulJj0AHc0teO?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 525903e1-f8c0-44ed-9308-08dbbee6cda6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:17:50.6329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHHSzjTLX2iArR0U4j3UD++Qf8KSfplQudm8zkNFOLOzwQ4xBwdsYbts2UUnU++eHwx1Uh9P2UeESlMzs7U9BxPsSv/bwqnt9BtCR+KdW6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Use vfunc to initialize PAT
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

On Tue, Sep 26, 2023 at 03:36:25PM -0700, Lucas De Marchi wrote:
> Split the PAT initialization between SW-only and HW. The _early() only
> sets up the ops and data structure that are used later to program the
> tables. This allows the PAT to be easily extended to other platforms.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  3 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++
>  drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_pat.h          | 11 ++++++
>  4 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 687dc3d79a66..046b7a087451 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -26,6 +26,7 @@
>  #include "xe_irq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_pat.h"
>  #include "xe_pcode.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
> @@ -276,6 +277,8 @@ int xe_device_probe(struct xe_device *xe)
>  	int err;
>  	u8 id;
>  
> +	xe_pat_init_early(xe);
> +
>  	xe->info.mem_region_mask = 1;
>  	err = xe_display_init_nommio(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 32ab0fea04ee..98835ee058f5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -25,6 +25,7 @@
>  #endif
>  
>  struct xe_ggtt;
> +struct xe_pat_ops;
>  
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
> @@ -331,6 +332,18 @@ struct xe_device {
>  		atomic_t ref;
>  	} mem_access;
>  
> +	/**
> +	 * @pat: Encapsulate PAT related stuff
> +	 */
> +	struct {
> +		/** Internal operations to abstract platforms */
> +		const struct xe_pat_ops *ops;
> +		/** PAT table to program in the HW */
> +		const u32 *table;
> +		/** Number of PAT entries */
> +		int n_entries;
> +	} pat;
> +
>  	/** @d3cold: Encapsulate d3cold related stuff */
>  	struct {
>  		/** capable: Indicates if root port is d3cold capable */
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 71e0e047fff3..86386633e206 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -32,6 +32,11 @@
>  #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>  #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>  
> +struct xe_pat_ops {
> +	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
> +	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
> +};
> +
>  static const u32 tgl_pat_table[] = {
>  	[0] = TGL_PAT_WB,
>  	[1] = TGL_PAT_WC,
> @@ -80,24 +85,37 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> -void xe_pat_init(struct xe_gt *gt)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> +static const struct xe_pat_ops tgl_pat_ops = {
> +	.program_graphics = program_pat,
> +};
> +
> +static const struct xe_pat_ops pvc_pat_ops = {
> +	.program_graphics = program_pat_mcr,
> +};
> +
> +/*
> + * SAMedia register offsets are adjusted by the write methods and they target
> + * registers that are not MCR, while for normal GT they are MCR
> + */
> +static const struct xe_pat_ops mtl_pat_ops = {
> +	.program_graphics = program_pat,
> +	.program_media = program_pat_mcr,
> +};
>  
> +void xe_pat_init_early(struct xe_device *xe)
> +{
>  	if (xe->info.platform == XE_METEORLAKE) {
> -		/*
> -		 * SAMedia register offsets are adjusted by the write methods
> -		 * and they target registers that are not MCR, while for normal
> -		 * GT they are MCR
> -		 */
> -		if (xe_gt_is_media_type(gt))
> -			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> -		else
> -			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
> +		xe->pat.ops = &mtl_pat_ops;
> +		xe->pat.table = mtl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
>  	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
> -		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
> +		xe->pat.ops = &pvc_pat_ops;

Actually, to be more consistent with the rest of the driver we should
probably name this 'dg2_pat_ops' after the first platform that
introduced this.


Matt

> +		xe->pat.table = pvc_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
> +		xe->pat.ops = &tgl_pat_ops;
> +		xe->pat.table = tgl_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> @@ -111,3 +129,16 @@ void xe_pat_init(struct xe_gt *gt)
>  			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  }
> +
> +void xe_pat_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->pat.ops)
> +		return;
> +
> +	if (xe_gt_is_media_type(gt))
> +		xe->pat.ops->program_media(gt, xe->pat.table, xe->pat.n_entries);
> +	else
> +		xe->pat.ops->program_graphics(gt, xe->pat.table, xe->pat.n_entries);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 659de4008131..744318cab69b 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -7,7 +7,18 @@
>  #define _XE_PAT_H_
>  
>  struct xe_gt;
> +struct xe_device;
>  
> +/**
> + * xe_pat_init_early - SW initialization, setting up data based on device
> + * @xe: xe device
> + */
> +void xe_pat_init_early(struct xe_device *xe);
> +
> +/**
> + * xe_pat_init_early - Program HW PAT table
> + * @gt: GT structure
> + */
>  void xe_pat_init(struct xe_gt *gt);
>  
>  #endif
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
