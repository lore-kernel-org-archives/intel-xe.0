Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF46C04FE0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Aug 2023 08:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4EA10E365;
	Tue,  1 Aug 2023 08:28:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE0510E35A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Aug 2023 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690878492; x=1722414492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XQX2eAYDSsFSuym2SHFZdoAN1+lqD1f9pUE2edYNs3E=;
 b=d1qZ1QYGV79t7QH4JqyTQhtVh79HIIPW5k5IPzbUEDHCj0xDLgpkNvrK
 oxrrvMW6AkltBad0lWS2E/wECqF3URe9vtmWuEI/HzhaNwObFBI4nzhoo
 GPYlAHjmJkmC/zwqZmlw6lWsR9ZdCVQWImmrfhjbk+UEcsmyMfssMfILD
 iATU6tc9ZTX1sqkNAxotRXq/eK1274LGalAbo9xUc1lgwt6/OGZRypycF
 DHyaQxCVzhJ2ap7Sb7q+zFn4fEmVUuL3fXlu+ZCZYx5DCmkLsQq25bY9K
 GEFSIJdUl9EfgMLC6XeP36rs4Q83ubBRlTpt1imKiV7+dvXwPMcKm0Wky w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369231304"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="369231304"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 01:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731886489"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="731886489"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 01:28:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:28:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doExHbeaTjUYCvW1eKTBpdgwzrxdQWOwv6xrVdGpG0rQ1KTTcDcjwntzQKyd7mCkVEcUNtO7xEvZgEMd1BIsnWVjLutPpeX4MWrp9MDSkObU1nPbg9nb+zSq3NSsocKeIHGLHAvhKLSTzpiNkTUbhEbGysCQhMm+MLF2fwwjHQbhdTZJG6joyp90c1lrgffoi69bCjUKxHvMhVk0PKV9aLeeQIpf4YwzSY/Dg+aL71CP6begDWCnVRD3RR1EGimnhuXDgih98uvTuvFldFBKM1xkE8aIhc95/W7h+8UIwM/xyHAlutjoRML+Ok2uQasrWfiics8RyeQuhFz55iVgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGX6mPelTlH6cbrOA0yCm1YnKuznz39hElXoIxfjp3k=;
 b=AI/cSemSb6EB1i2/lp9LyhTD3O/36cLGeLR/VM/brYiJO5G3vGimNIUgr9cj2FLoFmokDb3up548OtobraWXfRpq0t8017fFALDhVxq6UzTVwcLQ04u4VTCiCpvWIRiDJ24yCArvEj94CFAJzAZXV7S95Sjft31COM6/TkWA7RojaapU8NttqqajXBHpYH7dDTwTM2eY4T7i8c0eaVAd7BY4Xw3QhtjzGPnQk6+lne739ZK0KNGJLtF/iVnS7mtTaW2qrkd0BQ/kGBL6mLr832DoY/ETcocAvorsN5DsOsZhfTplhASOOeJlpVgbaemchYv4xCljOzKi5Ot/gnEjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by LV2PR11MB6021.namprd11.prod.outlook.com (2603:10b6:408:17e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:27:53 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ee81:9c69:6117:358c%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:27:53 +0000
Date: Tue, 1 Aug 2023 01:27:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <ZMjCB3jQAg7Y0GxF@nvishwa1-DESK>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
 <20230731191742.1130309-3-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230731191742.1130309-3-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|LV2PR11MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: db07a673-1896-464f-7fcf-08db92693360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4NnX0iBxwTsWbqqp6I8FFdh+sxhdGHtRzZWlHtXfDROoJiKL9DQ0GeuDG4bLysVo4nfEiiME6QgJmfGv5s+Yc9uKyv5GkvVJmIwPcfQogji6tepeiNnhkivFeGcr6PCVLXlPDGWnF9KSkTwvJWNazLTv+fIFJUHJ1q980Uvppl+KlHQKWRYb27w1msRjSpNOoe6RMNt7l+WstkIe+2Sv1HvA3y8pL5P2IBcU3VdVb1RNoXE9EdTWS9YsAdziSLmEmuuWCDK7D/Y4j6Nkh0zx+9Iz6dD3+vE3Mb5rgC1sqjIXGLogiaq6cZaltagcZ6GZrgbu5zlt+dLSdcYZOIXkepfmSOKLDmRtztEofHYuelbPXsp7TYWxdaMCQWrNj2emXyF6UF3J6Kixu70qQPjv1qgjFDzoAfvO6wYVuQewqI4rC/UmVVY4xHK+L9eGiCLtuVvi2RZl27wfnLU5U5g0W65r/CkqXgr7icLWB4sCe+PHcjBOdzWjK/Drv83LQljUjFYkEgQt6RS+79QpaVWAiTbLvBDKIPcUgkSVKtF6lXV1XlhCvZG4+h7gegEhHiu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199021)(33716001)(478600001)(38100700002)(82960400001)(86362001)(6512007)(9686003)(6486002)(44832011)(186003)(107886003)(26005)(6506007)(8936002)(8676002)(6862004)(5660300002)(6636002)(4326008)(66556008)(66476007)(66946007)(2906002)(41300700001)(316002)(30864003)(66899021)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2zaIltT1Wpx8WF0gaBuopREfkfys7GuPgRQC7sx+Fu1TLBeEZBcSEO8NQBN?=
 =?us-ascii?Q?pDPB1tU1Ch0/DlwAkTAEy1Qtzqs0uNNpYp1Hf2R7zchx7kKAZsQHLVlolarB?=
 =?us-ascii?Q?OONs/tnyjERlgXxM3O3UjBoGHOtdt+yB8wzDu/4Au6FFKFa9LbYwo1yoZlRq?=
 =?us-ascii?Q?+cSb3CbBAwLNcPYChbb+CKsras3M0TtAtoOTiySyDsDMU8vaxChoWHskM2Dn?=
 =?us-ascii?Q?5d/93JmEsrxfrplrTZN8dGd3cpJECqlyK1Vp0G/e8FF5eR43XGU1xxq+26r0?=
 =?us-ascii?Q?SjJrDWNbtwo58sOS3yU4gy8rg+88MeRNSpUeOv2jz+o+P+svNNhu37NACxPv?=
 =?us-ascii?Q?vhWeFCPgy4bEb/Ov5QvSxSQ7TfS8j0ShKTFQGCIrNWKCck/g3PTBtjmrKZwC?=
 =?us-ascii?Q?TrTR8wPb2+m24uqJhf43KwomgVWju2cplo9JKqFDCJh7l/OEA8OHNi0eCOiQ?=
 =?us-ascii?Q?OZEm5GfrNPVPS9cKKoYfN5cKG7ETz51MpfP1vB1BSNr1CtlurE2DnW/EteWI?=
 =?us-ascii?Q?Op2TUC2WeBjz+9DvYaLVGQArYzkm2cF8Ym67fyY2r3Gvh9IVPZYjF5SU35hS?=
 =?us-ascii?Q?utAtGOdKM5wMqTf/GeIun2nU/oqsN1tNo6CL/eBvTvPSrsUjGupcSPDyquoG?=
 =?us-ascii?Q?4QclZHx9v+OoxrWkuX6+pXR8XdS4V16OoD65QfvMXHzXcq4e+PhIM3RMFF3Q?=
 =?us-ascii?Q?/T8tC/cjVp31EHe3fKekgx6X0+0klZMZTr8Mi4VJ+ztCy6TvBXqw/r1nR3Np?=
 =?us-ascii?Q?VrYT9otuW4Vw+ONbwVRmtsnkPArYwjrnIVMmfBNsA3NeTV8gRx6l8MbZdrtx?=
 =?us-ascii?Q?PyjqZHY30eCwrC0TAuHr8rvpYaZ5LKBrl9REdGMcx6EARYa8VFb9ac9dGVf1?=
 =?us-ascii?Q?rgkeNJuQT/lg94kA1BuALfFDkj1fwBGCwj4e2zwZZ8BhA8VM6AA3IcbPDh/A?=
 =?us-ascii?Q?4ShqF0sL4sOYXFiscXAbVCL+fuLtDkV0dHtNOZfQfCXcjs+uH6EvfYouUWQj?=
 =?us-ascii?Q?FOVEWSxmnXMgMSj8rZmkcb5gPDyUJ32P/mCqUOrpoTzrjlzYq5HwFYPobSoM?=
 =?us-ascii?Q?w+59heEcHsAxSAGgnPWnRGj3jvciQSRIhoV9TQLOo2x0oSfD6uXP+YD7kdEz?=
 =?us-ascii?Q?UFpiXEJ/8RZ8BlhTkDmjbpB9l/bW9/xxzYMJS5j7/rEeeBEYhfl7ph60o0vh?=
 =?us-ascii?Q?pUNkcTb96kmvsLa9Aw76kged9QHKiWzKwVmZROaeOIpds6+EZxxmqlqv7PdP?=
 =?us-ascii?Q?4CfnRtSDf15Qmkc4H9u+e84PB2MrpIjuVut32F4+uj4BXrv/b/FjY6jO9wYK?=
 =?us-ascii?Q?lTL1FotLjzxddaha0QCecrnkZ0TP/SDnyQwWkKVgseD4xoYbC4Wn6zdosPuj?=
 =?us-ascii?Q?5y4OBuUadPvBpCRvFoAI/N336HQK4mvHrKWfuQp2PRrKUpRZttO/SLx6vJEV?=
 =?us-ascii?Q?1BCaxY9nEIfZ+r+17ZP+Elkmyq+qkRJRm3fpgJOu2V0Vr7BW3Hr54WwDedcw?=
 =?us-ascii?Q?lKUk0GUojCI2c8ixhXQmdSMIVwDeXGcn+dOOfTTJaocRv6xjP03aZW1aWlCe?=
 =?us-ascii?Q?aKf87CqVDK3Kv/VvgwUYPSA3XAkOyA8t7WWbM7KBwMjdgXb+1XmuhVsF2750?=
 =?us-ascii?Q?iN5qCbRah+dEnUXNy/EDz3I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db07a673-1896-464f-7fcf-08db92693360
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:27:53.5384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2LCwu93qw0VvnCr1hjt6CCYWO8f47NfbyvCbk0yKtsHT2UZHYEu1RW6n5sKaXutPWW1qgGMAH/+ad/YqGB5O7r/aWmbMbDbwnSqWTL1Q3jkay8qHDicaVol4U5dgNl4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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

On Tue, Aug 01, 2023 at 12:47:38AM +0530, Tejas Upadhyay wrote:
>For each HW engine under GT we are adding defaults sysfs
>entry to list all engine scheduler properties and its
>default values. So that it will be easier for user to
>fetch default values of these properties anytime to go
>back to default.
>
>For example,
>DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/bcs/.defaults/
>job_timeout_ms         preempt_timeout_us     timeslice_duration_us
>
>where,
>@job_timeout_ms: The time after which a job is removed from the scheduler.
>@preempt_timeout_us: How long to wait (in microseconds) for a preemption
>                     event to occur when submitting a new context.
>@timeslice_duration_us: Each context is scheduled for execution for the
>                        timeslice duration, before switching to the next
>                        context.
>
>V10:
>   - Remove xe_gt.h inclusion from .h - Matt
>V9 :
>   - Remove jiffies for job_timeout_ms - Matt
>V8 :
>   - replace xe_engine with xe_hw_engine - Matt
>V7 :
>   - Push all errors to one error path at every places - Niranjana
>   - Describe struct member to resolve kernel doc err - CI hooks
>V6 :
>   - Use engine class interface instead of hw engine
>     in sysfs for better interfacing readability - Niranjana
>V5 :
>   - Scheduling props should apply per class engine not per hardware engine - Matt
>   - Do not record value of job_timeout_ms if changed based on dma_fence - Matt
>V4 :
>   - Resolve merge conflicts - CI
>V3 :
>   - Rearrange code in its own file
>   - Rebase
>   - Update commit message to reflect tile addition
>V2 :
>   - Use sysfs_create_files in this patch - Niranjana
>   - Handle prototype error for xe_add_engine_defaults - CI hooks
>   - Remove unused member sysfs_hwe - Niranjana
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_engine.c                |   6 +-
> drivers/gpu/drm/xe/xe_gt_types.h              |   3 +
> drivers/gpu/drm/xe/xe_guc_submit.c            |   3 +-
> drivers/gpu/drm/xe/xe_hw_engine.c             |   9 ++
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 118 +++++++++++++++---
> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  22 ++++
> drivers/gpu/drm/xe/xe_hw_engine_types.h       |  37 ++++++
> 7 files changed, 175 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>index c30810a687b1..f4eb67915bfc 100644
>--- a/drivers/gpu/drm/xe/xe_engine.c
>+++ b/drivers/gpu/drm/xe/xe_engine.c
>@@ -53,9 +53,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
> 	INIT_LIST_HEAD(&e->compute.link);
> 	INIT_LIST_HEAD(&e->multi_gt_link);
>
>-	/* FIXME: Wire up to configurable default value */
>-	e->sched_props.timeslice_us = 1 * 1000;
>-	e->sched_props.preempt_timeout_us = 640 * 1000;
>+	e->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>+	e->sched_props.preempt_timeout_us =
>+				hwe->eclass->sched_props.preempt_timeout_us;
>
> 	if (xe_engine_is_parallel(e)) {
> 		e->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 78a9fe9f0bd3..d70460feeb96 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -286,6 +286,9 @@ struct xe_gt {
> 	/** @hw_engines: hardware engines on the GT */
> 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>
>+	/** @eclass: per hardware engine class interface on the GT */
>+	struct xe_hw_engine_class_intf  eclass[XE_ENGINE_CLASS_MAX];
>+
> 	/** @pcode: GT's PCODE */
> 	struct {
> 		/** @lock: protecting GT's PCODE mailbox data */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 8d2b50e03ed2..ce0466a06e51 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1129,7 +1129,8 @@ static int guc_engine_init(struct xe_engine *e)
> 	ge->engine = e;
> 	init_waitqueue_head(&ge->suspend_wait);
>
>-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
>+	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT :
>+		  e->hwe->eclass->sched_props.job_timeout_ms;
> 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index ead5aa285619..b7be7b0acb35 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -362,6 +362,15 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
> 	hwe->fence_irq = &gt->fence_irq[info->class];
> 	hwe->engine_id = id;
>
>+	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>+		gt->eclass[hwe->class].sched_props.job_timeout_ms = 5 * 1000;
>+		gt->eclass[hwe->class].sched_props.timeslice_us = 1 * 1000;
>+		gt->eclass[hwe->class].sched_props.preempt_timeout_us = 640 * 1000;
>+		/* Record default props */
>+		gt->eclass[hwe->class].defaults = gt->eclass[hwe->class].sched_props;
>+	}
>+	hwe->eclass = &gt->eclass[hwe->class];
>+
> 	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> 	xe_wa_process_engine(hwe);
> 	hw_engine_setup_default_state(hwe);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>index 7dc97fb13095..96e6c3c3c7ff 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>@@ -11,6 +11,8 @@
> #include "xe_hw_engine_class_sysfs.h"
>
> #define MAX_ENGINE_CLASS_NAME_LEN    16
>+static int xe_add_hw_engine_class_defaults(struct kobject *parent);
>+
> static void kobj_xe_hw_engine_release(struct kobject *kobj)
> {
> 	kfree(kobj);
>@@ -21,22 +23,88 @@ static const struct kobj_type kobj_xe_hw_engine_type = {
> 	.sysfs_ops = &kobj_sysfs_ops
> };
>
>-static struct kobject *
>-kobj_xe_hw_engine(struct kobject *parent, char *name)
>+static struct kobj_eclass *
>+kobj_xe_hw_engine_class(struct kobject *parent, char *name)
>+{
>+	struct kobj_eclass *keclass;
>+
>+	keclass = kzalloc(sizeof(*keclass), GFP_KERNEL);
>+	if (!keclass)
>+		return NULL;
>+
>+	kobject_init(&keclass->base, &kobj_xe_hw_engine_type);
>+	if (kobject_add(&keclass->base, parent, "%s", name)) {
>+		kobject_put(&keclass->base);
>+		return NULL;
>+	}
>+
>+	return keclass;
>+}
>+
>+static ssize_t job_timeout_default(struct kobject *kobj,
>+				   struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
>+}
>+
>+static struct kobj_attribute job_timeout_def =
>+__ATTR(job_timeout_ms, 0444, job_timeout_default, NULL);
>+
>+static ssize_t timeslice_default(struct kobject *kobj,
>+				 struct kobj_attribute *attr, char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
>+}
>+
>+static struct kobj_attribute timeslice_duration_def =
>+__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
>+
>+static ssize_t preempt_timeout_default(struct kobject *kobj,
>+				       struct kobj_attribute *attr,
>+				       char *buf)
>+{
>+	struct xe_hw_engine_class_intf *eclass = kobj_to_eclass(kobj->parent);
>+
>+	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
>+}
>+
>+static struct kobj_attribute preempt_timeout_def =
>+__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
>+
>+static const struct attribute *defaults[] = {
>+	&job_timeout_def.attr,
>+	&timeslice_duration_def.attr,
>+	&preempt_timeout_def.attr,
>+	NULL
>+};
>+
>+static int xe_add_hw_engine_class_defaults(struct kobject *parent)
> {
> 	struct kobject *kobj;
>+	int err = 0;
>
> 	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
> 	if (!kobj)
>-		return NULL;
>+		return -ENOMEM;
>
> 	kobject_init(kobj, &kobj_xe_hw_engine_type);
>-	if (kobject_add(kobj, parent, "%s", name)) {
>-		kobject_put(kobj);
>-		return NULL;
>-	}
>
>-	return kobj;
>+	err = kobject_add(kobj, parent, "%s", ".defaults");
>+	if (err)
>+		goto err_object;
>+
>+	err = sysfs_create_files(kobj, defaults);
>+	if (err)
>+		goto err_object;
>+
>+	return err;
>+err_object:
>+	kobject_put(kobj);
>+	return err;
> }
>
> static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
>@@ -73,14 +141,12 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> 	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
>
> 	err = kobject_add(kobj, gt->sysfs, "engines");
>-	if (err) {
>-		kobject_put(kobj);
>-		return err;
>-	}
>+	if (err)
>+		goto err_object;
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		char name[MAX_ENGINE_CLASS_NAME_LEN];
>-		struct kobject *khwe;
>+		struct kobj_eclass *keclass;
>
> 		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
> 		    hwe->class == XE_ENGINE_CLASS_MAX)
>@@ -108,15 +174,29 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
> 			strcpy(name, "ccs");
> 			break;
> 		default:
>-			kobject_put(kobj);
>-			return -EINVAL;
>+			err = -EINVAL;
>+			goto err_object;
> 		}
>
>-		khwe = kobj_xe_hw_engine(kobj, name);
>-		if (!khwe) {
>-			kobject_put(kobj);
>-			return -EINVAL;
>+		keclass = kobj_xe_hw_engine_class(kobj, name);
>+		if (!keclass) {
>+			err = -EINVAL;
>+			goto err_object;
> 		}
>+
>+		keclass->eclass = hwe->eclass;
>+		err = xe_add_hw_engine_class_defaults(&keclass->base);
>+		if (err) {
>+			drm_warn(&gt_to_xe(gt)->drm,
>+				 "Warning: adding .defaults to engines failed!, err: %d\n",
>+				 err);
>+			goto err_object;
>+		}
>+
> 	}
>+
>+	return err;
>+err_object:
>+	kobject_put(kobj);
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>index b3916c3cf5b3..c093f381abbe 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>@@ -6,8 +6,30 @@
> #ifndef _XE_ENGINE_CLASS_SYSFS_H_
> #define _XE_ENGINE_CLASS_SYSFS_H__
>
>+#include <linux/kobject.h>
>+
> struct xe_gt;
>+struct xe_hw_engine_class_intf;
>
> int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>
>+/**
>+ * struct kobj_eclass - A eclass's kobject struct that connects the kobject and the
>+ * eclass.
>+ *
>+ * When dealing with multiple eclass, this struct helps to understand which eclass
>+ * needs to be addressed on a given sysfs call.
>+ */
>+struct kobj_eclass {
>+	/** @base: The actual kobject */
>+	struct kobject base;
>+	/** @eclass: A pointer to the hw engine class interface */
>+	struct xe_hw_engine_class_intf *eclass;
>+};
>+
>+static inline struct xe_hw_engine_class_intf *kobj_to_eclass(struct kobject *kobj)
>+{
>+	return container_of(kobj, struct kobj_eclass, base)->eclass;
>+}
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 803d557cf5aa..97d9ba31b5fc 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -63,6 +63,41 @@ struct xe_bo;
> struct xe_execlist_port;
> struct xe_gt;
>
>+/**
>+ * struct xe_hw_engine_class_intf - per hw engine class struct interface
>+ *
>+ * Contains all the hw engine properties per engine class.
>+ *
>+ * @sched_props: scheduling properties
>+ * @defaults: default scheduling properties
>+ */
>+struct xe_hw_engine_class_intf {
>+	/**
>+	 * @sched_props: scheduling properties
>+	 * @defaults: default scheduling properties
>+	 */
>+	struct {
>+		/** @set_job_timeout: Set job timeout in ms for engine */
>+		u32 job_timeout_ms;
>+		/** @job_timeout_min: Min job timeout in ms for engine */
>+		u32 job_timeout_min;
>+		/** @job_timeout_max: Max job timeout in ms for engine */
>+		u32 job_timeout_max;
>+		/** @timeslice_us: timeslice period in micro-seconds */
>+		u32 timeslice_us;
>+		/** @timeslice_min: min timeslice period in micro-seconds */
>+		u32 timeslice_min;
>+		/** @timeslice_max: max timeslice period in micro-seconds */
>+		u32 timeslice_max;
>+		/** @preempt_timeout_us: preemption timeout in micro-seconds */
>+		u32 preempt_timeout_us;
>+		/** @preempt_timeout_min: min preemption timeout in micro-seconds */
>+		u32 preempt_timeout_min;
>+		/** @preempt_timeout_max: max preemption timeout in micro-seconds */
>+		u32 preempt_timeout_max;
>+	} sched_props, defaults;
>+};
>+
> /**
>  * struct xe_hw_engine - Hardware engine
>  *
>@@ -107,6 +142,8 @@ struct xe_hw_engine {
> 	void (*irq_handler)(struct xe_hw_engine *hwe, u16 intr_vec);
> 	/** @engine_id: id  for this hw engine */
> 	enum xe_hw_engine_id engine_id;
>+	/** @eclass: pointer to per hw engine class interface */
>+	struct xe_hw_engine_class_intf *eclass;
> };
>
> /**
>-- 
>2.25.1
>
