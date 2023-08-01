Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E20BEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 03:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1152010E306;
	Tue,  1 Aug 2023 03:32:47 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35E210E306
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 03:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690860765; x=1722396765;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JtAYLLzZfsh5HeN5Q1K3gNO3BNxtPq7plBD/1YVsS30=;
 b=bNyTNXXCzn9L4YkSJ1YabUhBGFPA20eE8ZTv5KvJnkBxoHc/m5DYrp+4
 UqrxYbraEmUjunoiSu8Cmh5aDAo1ccEciH6fDctJnV3Iht/JBjBj/5qTG
 S81jbzhcJ2F4mFdWq1YxCcfwJ1bfb86p8f2q8PyaERaJtJZAEYntapLHg
 KsXVDJ9WoDKFUJDai8sGSwm3cT/zbSP7a5SjkT6Bi3LscEAOfivxpnMIX
 o0fHkFKSzg70ZQVbpZEPVAdJZJLUFbY2ylQzk7mE0lQw0o9X9aGwT+Kzs
 yJUVPGmHoOLVM/NjOmYJkCvXSAKqfttL2g5B1CzVdvIjA583vqCZXTMjX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359229708"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="359229708"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 20:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="758168403"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="758168403"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 20:32:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:32:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 20:32:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 20:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/LsItPKlgYwATd0paUPFuO+bcbQdH7rRkGpJt+7ydUdyebH4xDParhwM7kV3z5z3AUezj7ZJw9B1CnBcOYlBcTlop3pTLcSIa1HEniKa5cNiFUdXR4Sw3aE17xleTE2rvMXDkzssA3QT+56YtuA9Aho33RhfI7Aam6a6AHS3y381v61ANxLNG2WAjV9/xf2jF7Y6eV0GO4XYivodLraRQuXHT7ZLbWwcQS5SuoGq0kPb8adRpXn7WVjoAUv3EPzwf+4yboPy260Hr6cqHfcyk27d/l9OcwIxjffDONGso9LfeAljR2jZYRILSfv69P3P2DIY3G2n4XDJJX6+9ifIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U97yUN4abAlG4RUdAS9hERS6gOYPYBaKr37OSc8Gigw=;
 b=hRuFxipFc8oEFCnG6WKG2PlRPC3ntRNYKRenTTp8hSL5gpTAlTbTwIY+LyhLjGSgDGzgbsw6noyHA2RuZi3sonLN1X3zMZ6Phj0OdDmNewxdrIKnZOeI43hgPdoVjBfBE97JmviMqvEgBoTEdWCPdU4gU0q0mup4qTKjPbRRaKemHtM6Q/wninT7tpssm1TqDyED8nB4e/PGneVFTefJ+FnoLF3/d1PCEwE39tbiro/WwaG0YNdxmChIXquYiJBbcsPES0A+gn/BmCr4aL4FeoJMBqFddfq6Vl4/1K6HFqqRYwpu1H/CmUUfwP2mMuTG25Hm0BS5hsIhMV8vPInnVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 03:32:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::538f:8837:abce:4522%4]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 03:32:37 +0000
Date: Tue, 1 Aug 2023 03:31:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMh8pgRgs2JkD5KG@DUT025-TGLU.fm.intel.com>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731191742.1130309-2-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 51574a76-e9d1-4a9e-acc6-08db923ff379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEBRewNx5WdofYKwOVl7AgrAh7EPWyOHaPwnUd+zl61PYy5hlpLLM8LFUjBWroALouxJvB2W0xY1qONwuBbc/3Ft6NZYtGGrmPLMt6DAiOZaX+RmVFroyQDZoiJC2iNcHLkiYeDIuRNGSJ/L5CAsSYlVUB1Eua2mWXSmjutVKDaB6uhWPffUetOt35Akd0zQuvc0G3X2kAlLTlo9V6Tt1569CuOVm7yJWuduIpA0nfsoY9B1o2ih/ZxAQ2VHPjbKxO8cLz6AESID0pS9ssEiD+6OHfW1bDhPg5P/PrxnALJcR446Ax8aqoVhQWN1AgppkOYxEw9D2LQLr6TAOiLC4OHT7o35BAQpGUaAGTZxVEMpHvHm5m1qVwmBmZoC+MSKiRvx6lhL9RM98p99dHFug31B/ubTyv/f7iEs5QiSI0xQzSC/4aHdnqj3DviVAhTwmOqdITrOzpJ8oTst1QHOCuJ00ywux4PEnjLCnMwWfOE9LhfAa7RkfWMiI98cjjSezu4J88bDP3Puc6jJfqeu6tiUtCW3My9XnhzsTKdel+1RdBV6N/KuCDdbWy6QaWnh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(478600001)(38100700002)(82960400001)(86362001)(6512007)(6486002)(6666004)(186003)(107886003)(26005)(8676002)(8936002)(6506007)(6862004)(5660300002)(44832011)(4326008)(6636002)(2906002)(66556008)(66946007)(66476007)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ksT1KXDJFUMkb6J4vVhpWM54aPm1n8SENn328evJQNjnBXXddJeDtwyGm4?=
 =?iso-8859-1?Q?iU/v1RslSSv2OMvOxrwSehugQOPPF8M3Euv/4tOcOsnQS/Yw2ab5HU+y07?=
 =?iso-8859-1?Q?pMxamPP0ZeFLHuBwyHBsk89vGONz6kK1uD/4qPeYeOfSpr0ehdRh0S38V+?=
 =?iso-8859-1?Q?GpC5/mWNre6V3ZpJlzxSGFHE2yHqmcQbtOrZQ0DqRfrknYmyS61CgZQUKX?=
 =?iso-8859-1?Q?QK7NuroAi1ofa4Wc2erOVwZmnH72fcwbSdDA0G926G3cpSavBIPWamu/j5?=
 =?iso-8859-1?Q?ffg1//pD8LmO1NFE+oZf35ro8Y93wggZpKllTXvM42gjiLUIRtdj774dgn?=
 =?iso-8859-1?Q?WyBwdjk+g5LLJL+0XvWYnXFW7LQ+/I8bg6A7GNJhx1xSKIp2XDp5WpRWaX?=
 =?iso-8859-1?Q?t3vg4fBQoi6uaavZc/DLCtsKi+HvKRVt7PuomRxgxA+Pzk6WhAVqLqiKhH?=
 =?iso-8859-1?Q?IfdaYD1CH5dzOlQYXfBowUuLiXvfnd61R/+1oo0jf30ask4SQ98L7cXYPf?=
 =?iso-8859-1?Q?OfuRNm4VxQaALo7dqI7pqBz9V8z4uI0YcoSPBqcqbMwLKt2jqy9db6g6hv?=
 =?iso-8859-1?Q?6clJJt8+ouYzfZCU8gu9Ry46KC8BsbT2t38+IrNMxURkUuaE6y46C6Gozf?=
 =?iso-8859-1?Q?HtOaQLnu6YWjBpFEVA/Ve9Drupm9sa6YTWYhbotMoxDupBgwdfXImC3e2F?=
 =?iso-8859-1?Q?cDZWWU7+EpSTvhXttiamAdn2G2z090XIEHIHrUsQZ+rzvPIi1xD9ujYKs0?=
 =?iso-8859-1?Q?++K2np9qnRpLkjG4qoFEZVQ0Dob7ghydA3DVHHjc8RiwzvWn4bDOX6uZ1q?=
 =?iso-8859-1?Q?tEtNEm6IugtQ4NP7GGnIx23Ga/sQhB5QFPti/H6mGkZzXmjhkYwKdw8Qzo?=
 =?iso-8859-1?Q?Ljr9YdmlWngLt+KP/M2F0IgJC7XgykXFGki7n1FeF6awVThbtL7Q8+WSBs?=
 =?iso-8859-1?Q?ZLlWLIXVIbLtx8yEu0ua34iG2sq8An5fxomnG1fSfvHs135Ltc8X9nYaBR?=
 =?iso-8859-1?Q?FOLKMBmJkGEPzEiBnG7dAQ0Vb6mJL6vS2mRRJ3O1bQ8hajJt+OIQpgVI/j?=
 =?iso-8859-1?Q?88syi/Xi4Asy+ypP952TZgChh2OuwNzt+xaPiqhWd5pUO076nQFLIrfG02?=
 =?iso-8859-1?Q?UUKfvJaY9QpTzS1DYMf/u/Hij7QC13HveiWnSECCZs4e3tXkdEDjp/jRFt?=
 =?iso-8859-1?Q?95upzRPOtXTSqZAbeQFJuGvTfgAU1tII5qg47pO2904Esx3G6hpZWoEmeB?=
 =?iso-8859-1?Q?8Hcmi36JZZdvBQPwigA/XxG5LH6xwZO/caG0zy9Yw3MT5IJ/33pyObh7Cc?=
 =?iso-8859-1?Q?UP2XYMDtWDtSjHeIG24iTPp4nIeuKmniSi/AVFwf2m9PwkRDk6rQ2NtZ2J?=
 =?iso-8859-1?Q?frNjv/Tn+8mGWFwAIaHSRrOPyZ+uQM8kOjnWsOz8idqEAtse4eRMikSyIH?=
 =?iso-8859-1?Q?7jBAMhIiGHJl2Buplg7rTl+GrdPvbLxRXCrZSJ2QL8j5shvYvMWnw7fqHd?=
 =?iso-8859-1?Q?unDet2Jt3taRgr6OrAYRJSlMVaAALs98KlJ+iswhcV0GD76Uv2rxAlc0Yz?=
 =?iso-8859-1?Q?l3ufJCoDvRYRz/gYp+lKYBwQ8ATwn2Qc/+Pf4Bwy06r5b139a/UfHANHBd?=
 =?iso-8859-1?Q?oOSOzizwOkessirQbQ79azV8dpuVfnuTp+EMUw+ODbelVJ/GBJxIojXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51574a76-e9d1-4a9e-acc6-08db923ff379
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 03:32:36.9983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFjOSUIaOQRlB/e9lG9l+cNaxGBdFEXwQsRwtBeWxK2+5PMFuMd8KpbWcAhWHri/ai2vZgXuegkZUj9wVJ0K5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 1/6] drm/xe: Add sysfs entries for
 engines under its GT
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

On Tue, Aug 01, 2023 at 12:47:37AM +0530, Tejas Upadhyay wrote:
> Add engines sysfs directory under its GT and
> create sub directory for all engine class
> (note its not per instance) present on GT.
> 
> For example,
> DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> bcs/ ccs/
> 
> V7 :
>    - Remove xe_gt.h from .h and include in .c - Matt
> V6 :
>    - Add kernel doc and arrange file in make file by alphabet - Matt
> V5 :
>    - replace xe_engine with xe_hw_engine - Matt
> V4 :
>    - Rebase to resolve conflicts - CI
> V3 :
>    - Move code in its own file
>    - Rename API name
> V2 :
>    - Correct class mask logic - Himal
>    - Remove extra parenthesis
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_gt.c                    |   7 +
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 122 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
>  4 files changed, 143 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 4ea9e3150c20..2ddae8e312b2 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -74,6 +74,7 @@ xe-y += xe_bb.o \
>  	xe_guc_pc.o \
>  	xe_guc_submit.o \
>  	xe_hw_engine.o \
> +	xe_hw_engine_class_sysfs.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
>  	xe_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 28bf577c7bf2..5436ce651076 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -28,6 +28,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_guc_engine_types.h"
>  #include "xe_hw_fence.h"
> +#include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> +	err = xe_hw_engine_class_sysfs_init(gt);
> +	if (err)
> +		drm_warn(&gt_to_xe(gt)->drm,
> +			 "failed to register engines sysfs directory, err: %d\n",
> +			 err);
> +
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  	XE_WARN_ON(err);
>  	xe_device_mem_access_put(gt_to_xe(gt));
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> new file mode 100644
> index 000000000000..7dc97fb13095
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
> +
> +#include "xe_gt.h"
> +#include "xe_hw_engine_class_sysfs.h"
> +
> +#define MAX_ENGINE_CLASS_NAME_LEN    16
> +static void kobj_xe_hw_engine_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type kobj_xe_hw_engine_type = {
> +	.release = kobj_xe_hw_engine_release,
> +	.sysfs_ops = &kobj_sysfs_ops
> +};
> +
> +static struct kobject *
> +kobj_xe_hw_engine(struct kobject *parent, char *name)
> +{
> +	struct kobject *kobj;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return NULL;
> +
> +	kobject_init(kobj, &kobj_xe_hw_engine_type);
> +	if (kobject_add(kobj, parent, "%s", name)) {
> +		kobject_put(kobj);
> +		return NULL;
> +	}
> +
> +	return kobj;
> +}
> +
> +static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
> +{
> +	kfree(kobj);
> +}
> +
> +static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
> +	.release = xe_hw_engine_sysfs_kobj_release,
> +	.sysfs_ops = &kobj_sysfs_ops,
> +};
> +
> +/**
> + * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
> + * @gt: Xe GT.
> + *
> + * This routine creates sysfs for HW engine classes and adds methods
> + * to get/set different scheduling properties for HW engines class.
> + *
> + * Returns: Returns error value for failure and 0 for success.
> + */
> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct kobject *kobj;
> +	u16 class_mask = 0;
> +	int err = 0;
> +
> +	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> +	if (!kobj)
> +		return -ENOMEM;
> +
> +	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
> +
> +	err = kobject_add(kobj, gt->sysfs, "engines");
> +	if (err) {
> +		kobject_put(kobj);
> +		return err;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		char name[MAX_ENGINE_CLASS_NAME_LEN];
> +		struct kobject *khwe;
> +
> +		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> +		    hwe->class == XE_ENGINE_CLASS_MAX)
> +			continue;
> +
> +		if ((class_mask >> hwe->class) & 1)
> +			continue;
> +
> +		class_mask |= 1 << hwe->class;
> +
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_RENDER:
> +			strcpy(name, "rcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +			strcpy(name, "vcs");
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			strcpy(name, "vecs");
> +			break;
> +		case XE_ENGINE_CLASS_COPY:
> +			strcpy(name, "bcs");
> +			break;
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			strcpy(name, "ccs");
> +			break;
> +		default:
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +
> +		khwe = kobj_xe_hw_engine(kobj, name);
> +		if (!khwe) {
> +			kobject_put(kobj);
> +			return -EINVAL;
> +		}
> +	}
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> new file mode 100644
> index 000000000000..b3916c3cf5b3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> +#define _XE_ENGINE_CLASS_SYSFS_H__
> +
> +struct xe_gt;
> +
> +int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
> +
> +#endif
> -- 
> 2.25.1
> 
