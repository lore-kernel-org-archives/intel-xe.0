Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C43CC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:59:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961010E15F;
	Tue, 28 Nov 2023 16:59:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6B710E15F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701190768; x=1732726768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A2Vu6bK5P4kZhvz2xQF8tMwNDs2mlveg2EAPDbcOvTk=;
 b=QBCXV4O6rVbWX7u93mSCuqjmKx1NBIRuQYDCVfPAgm2Wxs/jFbY0tKvk
 p791CO0tjFFo5WcB9gUBKtQCzDo52s//9RY0zCpI79YAhkFz8+vCEqaCS
 B0ZjtqEXu2TOzmyBiuHUi7+QGCgu1xldOUCDmt7/cyxvu4Tj8gFmiLtAu
 ON8XOu5TO8xf2nXer9kK/IV7kL/OsQeSpiPvi0ZX9bv3GBNUlnBWo1qpL
 +Bt4YTtARkqca2IaFP3xWtB94Px9Kh2mdP9SePA57EoR9uP2Wt8h04Iaz
 1Kv+7LCrSeabnNebkPMK7oAJsrssGZGwDinm3SvAQhQ0RIO+MY1l9evGF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383351967"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="383351967"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="886464865"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="886464865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 08:59:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 08:59:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 08:59:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 08:59:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJuzLu3Uv9xLGLaLq7+/LMBc4Q0BnLIWxQDetoI9e2XHS0C9HDVpNf+vKHf00Fa5QQi5ts7Gq5vM7P6B6XBsUDnj7DsFWxR9EcGfTX8fUGJ0BiTSI4TjsrQaITsVyr5aabjZP7BwJTfj8QmPwdl218yuwh6+c6dPRhpObxgqvnWgaVnAGbPFt+6fnd8tWsFnqGm/j/0bA1yrQERyodSm4VEJIVaQQOel5Otlmxcxj3Kee7Lv/CYdybzOs3xFug5IVBd/FD7usH+PUnMucRqub9NM1ZyGE0MvN6qQ8IkAozH2v8SsyGN1vGAUQKH7MdvjM2jTBzYM/Idz15ez/33mTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZFfEEd+7k3uzJvKiS16b6JK2EpPmXbbG9FzJzrN5B8=;
 b=TxdxLUaIW7hc8Al5G3vhUpZY7Ef7+O2T2CpJJCOQh8yR0uxQDp3rUUD81pPmgAzBSOif+8nnbKken4uCVPFwXnzhioK0tdo7Q412i6qN3XlkFJS4wHPKmWnolJfmkwoq1Yd1KfxubEFTAu9Ikn1uEyRbB7uZWm7o0BqMJnJGq1MYC+BZfKn/9htv+hg6tr0xI6PRWyzhee2fIv2hAhZMVTZmk8W/zT02AruAcvhLm43okic1ECIqtZP+4ndXWPo4V9hIyVufPKJ6AzQVyJC0STop4ivkgwBlV1Nx/o/sb0a3PE3SFZHvwZk+tBxmrBuCyLYtJbeYbWQt4o3VLPlMnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 16:59:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Tue, 28 Nov 2023
 16:59:21 +0000
Date: Tue, 28 Nov 2023 09:57:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ZWW5nHSrMgRfF7dc@DUT025-TGLU.fm.intel.com>
References: <20231031103525.2433645-1-tejas.upadhyay@intel.com>
 <20231031103525.2433645-2-tejas.upadhyay@intel.com>
 <ZVtVQTQkrSgJQeca@DUT025-TGLU.fm.intel.com>
 <d4ee5c27-b18e-4767-bd4c-9f24a797c160@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d4ee5c27-b18e-4767-bd4c-9f24a797c160@intel.com>
X-ClientProxiedBy: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 5074d412-61c0-4107-e034-08dbf0335ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZyp3lRdym2FyCo1kyZFjCks+1cLZuwK2DekXGu0uoY+/5JSo6+11BfQp7tzt562509KFP/lYTND/IELzWzuZdnpA0o+ml7cGpVN+H43RoMMobD+LzzAxJQAJxAgKVsNwRRZWumJM7biRqrQ/epR6hkMrvs92IVFgd3BN0dSQClw/5MV8LfTGJVlOYYBz029KED7EEiH0wtuqMvZJ8z23acKeGwLRXExV898HaqSOKIwiRMhPakPssNuKOoZRHxqRboiZZ3DHp+qcIcuiaijkg+VbTjDLx8/eYFDVt701NsakHmR9ZqTslKGvuAANKblr9NnaYXXzGIZs5ZmUvgnolHpwwXMSs0xDHDlln8vUet2ZIY/Yfk3oZwEU4y2M8NkuW1CMdtx2LzS7dTZOWBcKZGfQ9VUVwCYigFDSQPAXteS2FvA6XzjnVhyYLLfTVrkynh1YM0s/YoPSfXxllrZGnx0E0ZJL2c4Y+4XMWGOSCLuKZOREEGvYW8Z5KLMnfJ7BN+Bj7JiGnExHVRIymQbuJLOXYKY79SHPEhUPhlh58S87MUwSdyyx5LksF1KzprI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(8936002)(6666004)(8676002)(4326008)(6862004)(6512007)(6506007)(53546011)(66556008)(6636002)(66946007)(316002)(478600001)(6486002)(2906002)(15650500001)(30864003)(38100700002)(41300700001)(86362001)(26005)(44832011)(66476007)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2fA7j72fY2geRf6SUBWa96Jpk8CnJaGs2mLam2qcTkmW08DBkXcLr+fNd5p+?=
 =?us-ascii?Q?nC2f8qdlap5zNrsWsItRShre5hxPcnKcJGgPWUkBhna2C8FOsldqmrKGSU/d?=
 =?us-ascii?Q?iTHgQmkMRR8nkjP0pUPZz74++VB6eLKefTkML+dnm+Ai9ruHSplUOFymuqlL?=
 =?us-ascii?Q?YtFQM/4TrwUwCSyQ8GQ2HC5xq6PMZuIGYmYRdCGmU9mAzH7iONjDh10b6e0D?=
 =?us-ascii?Q?SpR87DHwCsYffvNsKjWw/erOE0ay0LM4/GaqPJvjni5OExXV6U+phEe2dHM/?=
 =?us-ascii?Q?6zBfPzV7bXKdq5xZm9F4F67D807CkAlaUG5nqgYZ8NM/nDFnRrAVEQSMdDoS?=
 =?us-ascii?Q?RCbJiaOYSEop+6QMBQNchpRsarnWQlK2nzNtZFHsZSaf9X59xI1MezgVwnzD?=
 =?us-ascii?Q?GLHiH3uwWtW876xgYW6YJR7wzGFj0LSwbIh8nUnXlI49c7QdXHN0NBogVkZm?=
 =?us-ascii?Q?cKFV5SPoCGKeFi79aj1Qo8+YThYSLyVyWB2YyVP/i40zVTtPYJlW3MaWocje?=
 =?us-ascii?Q?xxPM3AvEsH3uOi13ja8I22faO7szc/YoByef0LE0HDH1SiE/jgJeBvI1PB2j?=
 =?us-ascii?Q?NejRlxpDxx6TxH8Jhrj8u6r1InT4/bXW9wsI6D/EVXrNih/OE5veLV9rtWy8?=
 =?us-ascii?Q?y13Fi/GeeVPK4ki56qzdoDaqu7mc7iCJt976LMLmuP7TL6ckISIFeyh004Qv?=
 =?us-ascii?Q?pPG3FatSXBUZ9eXtjF4bG4ef4sKSCgFiMrYfLDcqZCg4lHgBRZJEGCb6rjkh?=
 =?us-ascii?Q?wwdkTpBY8PY2HGGiFHVq1SkIWUXP7XzKc92v98WTl1qcBQPqW2c80LO+HLYJ?=
 =?us-ascii?Q?orCRmXK8HtTOo0p3iZBn7Lp8EYf0TqqSkt/UwqELBe1Oii+RDVRcmIwGfPPT?=
 =?us-ascii?Q?IxfTPtTtCJj96W8LJ+LeGY+EM8wdo3x1xSl+6kA87q4UzNfAHdO35QHeBYeo?=
 =?us-ascii?Q?LYUyExUkMdAeaiDd9TvpkqudGLBRrdMQCcD0pPQ2HKs6pMUQ3fw370WwLPDf?=
 =?us-ascii?Q?3v8pEwudtacinv4p6aAy1OcwHsH8P96eSAJfuX2ldPQVmzumUYMNG4LJMMmF?=
 =?us-ascii?Q?zyUhH9md/UrAl5Lr6nWWCqUDK0Pz+hJrd3j424oKrOIJHhSWZ0AVx5qKYGVw?=
 =?us-ascii?Q?9VFki4zJkhGdNvxf5zurfbLu1xODzkk6CFuH3bcs53v6zp05SsZYKdJCT6Bb?=
 =?us-ascii?Q?Eh0fsnOWkTt7v85E8FeMuGZJ2dBEf/Wfmdc1GtZ4wqezvQcxo6uwOzab8FWz?=
 =?us-ascii?Q?ifNfSj59wNlE0YRq4ZuVfLOMX5aAn0GdPohDhmEEZU/LaJPU3tjK8yRQxr1o?=
 =?us-ascii?Q?Dk9hTdL51u2qXojATXDiGPTzNNxF0UlC8l7vYux72p+OQ56EqlyWxco98sMV?=
 =?us-ascii?Q?9c4WrUL+BuFZROZTL7rnvbpxWbT+4tOp0ybqxGrp6k5d+lIC6zym43amFLAV?=
 =?us-ascii?Q?e5M79GmsreQMRcT9jse/TsRzsZJCaLDg1XT7Zw8fNOzT93Z0D2UUhaTZVfSY?=
 =?us-ascii?Q?ZG3SNct4I3D7Yjq52fx/52Opzz2mX8wA5T3kWy+S9vmmV2djcRt0wANudeWb?=
 =?us-ascii?Q?MOXHQKJOCt30crGuuLEHBeB43rTTOrRWZr+XhhwB3ExYmMaAmEM8UymUDZeZ?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5074d412-61c0-4107-e034-08dbf0335ddf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 16:59:21.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O84Q9rx4T3D3R9PKebQ22GA71N80RYsAgY5fcw8UcXbmCfgSKbXkE+miVxpTR1/z8HxWuHlHI47C+sqcguJg4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V11 1/1] drm/xe: Introduce and update counter
 for low level driver errors
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

On Wed, Nov 22, 2023 at 07:28:36PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 20.11.2023 13:46, Matthew Brost wrote:
> > On Tue, Oct 31, 2023 at 04:05:25PM +0530, Tejas Upadhyay wrote:
> >> Introduce low level driver error counter and incrementing on
> >> each occurrence. Focus is on errors that are not functionally
> >> affecting the system and might otherwise go unnoticed and cause
> >> power/performance regressions, so checking for the error
> >> counters should help.
> >>
> >> Importantly the intention is not to go adding new error checks,
> >> but to make sure the existing important error conditions are
> >> propagated in terms of counter under respective categories like
> >> below :
> >> - GT
> >>   - GUC COMMUNICATION
> >>   - ENGINE OTHER
> >>   - GT OTHER
> >>
> >> - Tile
> >>   - GTT
> >>   - INTERRUPT
> >>
> >> Currently this is just a counting of errors, later these
> >> counters will be reported through netlink interface when it is
> >> implemented and ready.
> >>
> >> V11:
> >>   - Unify tlb invalidation timeout errs - Michal
> >>   - Improve kernel doc comments - Michal
> >>   - Improve logging output message - Michal
> >> V10:
> >>   - Report and count errors from common place i.e caller - Michal
> >>   - Fixed some minor nits - Michal
> >> V9:
> >>   - Make one patch for API and counter update - Michal
> >>   - Remove counter from places where driver load will fail - Michal
> >>   - Remove extra \n from logging
> >>   - Improve commit message - Aravind/Michal
> >> V8:
> >>   - Correct missed ret value handling
> >> V7:
> >>   - removed double couting of err - Michal
> >> V6:
> >>   - move drm_err to gt and tile specific err API - Aravind
> >>   - Use GTT naming instead of GGTT - Aravind/Niranjana
> >> V5:
> >>   - Dump err_type in string format
> >> V4:
> >>   - dump err_type in drm_err log - Himal
> >> V2:
> >>   - Use modified APIs
> >>
> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device_types.h        | 16 ++++++++
> >>  drivers/gpu/drm/xe/xe_gt.c                  | 41 ++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_gt.h                  |  4 ++
> >>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 13 ++++---
> >>  drivers/gpu/drm/xe/xe_gt_types.h            | 18 +++++++++
> >>  drivers/gpu/drm/xe/xe_guc.c                 | 16 +++++++-
> >>  drivers/gpu/drm/xe/xe_guc_ct.c              | 43 ++++++++++++++++++---
> >>  drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
> >>  drivers/gpu/drm/xe/xe_reg_sr.c              | 22 +++++------
> >>  drivers/gpu/drm/xe/xe_tile.c                | 41 ++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_tile.h                |  3 ++
> >>  11 files changed, 198 insertions(+), 25 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index cb537cac1ef9..0626640f06d9 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -61,6 +61,19 @@ struct xe_pat_ops;
> >>  		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> >>  		 struct xe_tile * : (tile__)->xe)
> >>  
> >> +/**
> >> + * enum xe_tile_drv_err_type - Types of tile level errors
> >> + * @XE_TILE_DRV_ERR_GTT: Error type for all PPGTT and GTT errors
> >> + * @XE_TILE_DRV_ERR_INTR: Interrupt errors
> >> + * @__XE_TILE_DRV_ERR_MAX: Number of defined error types, keep this last
> >> + */
> >> +enum xe_tile_drv_err_type {
> >> +	XE_TILE_DRV_ERR_GTT,
> >> +	XE_TILE_DRV_ERR_INTR,
> >> +	/* private: number of defined error types, keep this last */
> >> +	__XE_TILE_DRV_ERR_MAX
> >> +};
> >> +
> >>  /**
> >>   * struct xe_mem_region - memory region structure
> >>   * This is used to describe a memory region in xe
> >> @@ -190,6 +203,9 @@ struct xe_tile {
> >>  
> >>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> >>  	struct kobject *sysfs;
> >> +
> >> +	/** @drv_err_cnt: driver error counter for this tile */
> >> +	u32 drv_err_cnt[__XE_TILE_DRV_ERR_MAX];
> >>  };
> >>  
> >>  /**
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >> index d380f67b3365..30a4b837f01a 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt.c
> >> @@ -49,6 +49,47 @@
> >>  #include "xe_wa.h"
> >>  #include "xe_wopcm.h"
> >>  
> >> +static const char *const xe_gt_drv_err_to_str[] = {
> >> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
> >> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
> >> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
> >> +};
> >> +
> >> +/**
> >> + * xe_gt_report_driver_error - Count driver error for GT
> >> + * @gt: GT to count error for
> >> + * @err: enum error type
> >> + * @fmt: debug message format to print error
> >> + * @...: variable args to print error
> >> + *
> >> + * Increment the driver error counter in respective error
> >> + * category for this GT.
> >> + *
> >> + * Return: void.
> >> + */
> >> +void xe_gt_report_driver_error(struct xe_gt *gt,
> >> +			       const enum xe_gt_drv_err_type err,
> >> +			       const char *fmt, ...)
> >> +{
> >> +	struct va_format vaf;
> >> +	va_list args;
> >> +
> >> +	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_drv_err_to_str) !=
> >> +		     __XE_GT_DRV_ERR_MAX);
> >> +
> >> +	xe_gt_assert(gt, err >= 0);
> >> +	xe_gt_assert(gt, err < __XE_GT_DRV_ERR_MAX);
> >> +	WRITE_ONCE(gt->drv_err_cnt[err],
> >> +		   READ_ONCE(gt->drv_err_cnt[err]) + 1);
> >> +
> >> +	va_start(args, fmt);
> >> +	vaf.fmt = fmt;
> >> +	vaf.va = &args;
> >> +
> >> +	xe_gt_err(gt, "[%s] %pV\n", xe_gt_drv_err_to_str[err], &vaf);
> >> +	va_end(args);
> >> +}
> >> +
> >>  struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> >>  {
> >>  	struct xe_gt *gt;
> >> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> >> index caded203a8a0..efd83707b367 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt.h
> >> @@ -67,4 +67,8 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
> >>  		hwe->instance == gt->usm.reserved_bcs_instance;
> >>  }
> >>  
> >> +void xe_gt_report_driver_error(struct xe_gt *gt,
> >> +			       const enum xe_gt_drv_err_type err,
> >> +			       const char *fmt, ...);
> >> +
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> index bd6005b9d498..8db4018a2c3a 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> @@ -9,6 +9,7 @@
> >>  #include "xe_gt.h"
> >>  #include "xe_guc.h"
> >>  #include "xe_guc_ct.h"
> >> +#include "xe_tile.h"
> >>  #include "xe_trace.h"
> >>  
> >>  #define TLB_TIMEOUT	(HZ / 4)
> >> @@ -35,8 +36,10 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> >>  			break;
> >>  
> >>  		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
> >> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence timeout, seqno=%d recv=%d",
> >> -			gt->info.id, fence->seqno, gt->tlb_invalidation.seqno_recv);
> >> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> >> +					    "GT%u: TLB invalidation time'd out, seqno=%d recv=%d",
> >> +					    gt->info.id, fence->seqno,
> >> +					    gt->tlb_invalidation.seqno_recv);
> >>  
> >>  		list_del(&fence->link);
> >>  		fence->base.error = -ETIME;
> >> @@ -317,7 +320,6 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >>   */
> >>  int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> >>  {
> >> -	struct xe_device *xe = gt_to_xe(gt);
> >>  	struct xe_guc *guc = &gt->uc.guc;
> >>  	int ret;
> >>  
> >> @@ -329,8 +331,9 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
> >>  				 tlb_invalidation_seqno_past(gt, seqno),
> >>  				 TLB_TIMEOUT);
> >>  	if (!ret) {
> >> -		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out, seqno=%d, recv=%d\n",
> >> -			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> >> +		xe_tile_report_driver_error(gt_to_tile(gt), XE_TILE_DRV_ERR_GTT,
> >> +					    "GT%u: TLB invalidation time'd out, seqno=%d, recv=%d",
> >> +					    gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
> >>  		return -ETIME;
> >>  	}
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> >> index d3f2793684e2..5bb7a2c6ecc2 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> >> @@ -24,6 +24,21 @@ enum xe_gt_type {
> >>  	XE_GT_TYPE_MEDIA,
> >>  };
> >>  
> >> +/**
> >> + * enum xe_gt_drv_err_type - Types of GT level errors
> >> + * @XE_GT_DRV_ERR_GUC_COMM: Driver guc communication errors
> >> + * @XE_GT_DRV_ERR_ENGINE: Engine execution errors
> >> + * @XE_GT_DRV_ERR_OTHERS: Other errors like error during save/restore registers
> >> + * @__XE_GT_DRV_ERR_MAX: Number of defined error types, keep this last
> >> + */
> >> +enum xe_gt_drv_err_type {
> >> +	XE_GT_DRV_ERR_GUC_COMM,
> >> +	XE_GT_DRV_ERR_ENGINE,
> >> +	XE_GT_DRV_ERR_OTHERS,
> >> +	/* private: number of defined error types, keep this last */
> >> +	__XE_GT_DRV_ERR_MAX
> >> +};
> >> +
> >>  #define XE_MAX_DSS_FUSE_REGS	3
> >>  #define XE_MAX_EU_FUSE_REGS	1
> >>  
> >> @@ -347,6 +362,9 @@ struct xe_gt {
> >>  		/** @oob: bitmap with active OOB workaroudns */
> >>  		unsigned long *oob;
> >>  	} wa_active;
> >> +
> >> +	/** @drv_err_cnt: driver error counter for this GT */
> >> +	u32 drv_err_cnt[__XE_GT_DRV_ERR_MAX];
> >>  };
> >>  
> >>  #endif
> >> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> >> index 84f0b5488783..d25fb605e9dc 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >> @@ -619,8 +619,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
> >>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> >>  }
> >>  
> >> -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >> -			  u32 len, u32 *response_buf)
> >> +static int __xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >> +				   u32 len, u32 *response_buf)
> >>  {
> >>  	struct xe_device *xe = guc_to_xe(guc);
> >>  	struct xe_gt *gt = guc_to_gt(guc);
> >> @@ -724,6 +724,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >>  	return FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
> >>  }
> >>  
> >> +int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> >> +			  u32 len, u32 *response_buf)
> >> +{
> >> +	int ret = __xe_guc_mmio_send_recv(guc, request, len, response_buf);
> >> +
> >> +	if (ret < 0)
> >> +		xe_gt_report_driver_error(guc_to_gt(guc), XE_GT_DRV_ERR_GUC_COMM,
> >> +					  "MMIO send failed (%pe)",
> >> +					  ERR_PTR(ret));
> >> +	return ret;
> >> +}
> >> +
> >>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len)
> >>  {
> >>  	return xe_guc_mmio_send_recv(guc, request, len, NULL);
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> index a84e111bb36a..ce8ba923a4cd 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> @@ -547,9 +547,9 @@ static void kick_reset(struct xe_guc_ct *ct)
> >>  
> >>  static int dequeue_one_g2h(struct xe_guc_ct *ct);
> >>  
> >> -static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> -			      u32 g2h_len, u32 num_g2h,
> >> -			      struct g2h_fence *g2h_fence)
> >> +static int _guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> +			       u32 g2h_len, u32 num_g2h,
> >> +			       struct g2h_fence *g2h_fence)
> >>  {
> >>  	struct drm_device *drm = &ct_to_xe(ct)->drm;
> >>  	struct drm_printer p = drm_info_printer(drm->dev);
> >> @@ -621,6 +621,20 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  	return -EDEADLK;
> >>  }
> >>  
> >> +static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> +			      u32 g2h_len, u32 num_g2h,
> >> +			      struct g2h_fence *g2h_fence)
> >> +{
> >> +	int ret = _guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
> >> +
> >> +	if (ret < 0)
> > 
> > I think this can fail in a way where (the CT is disabled, returns
> > -ENODEV) this is harmless during a GT reset. This might make CI unhappy
> > if this case pops. If the device is suspended and the CT is disables,
> > this is likely an error.
> 
> but shouldn't we still report this -ENODEV error regardless of CI
> happiness ?
> 
> using CTB during a reset (even if we recover) is a bad thing, no ?

In GuC submission (most CTB interaction) the protocol is designed to be
fire and forget with recovery possible if any of the CTs fail.

The GT reset flow is roughly:

1. Start reset
2. Disable CTs
3. Idle submissions
4. do reset
5. Restart submission

There is a window between 2/3 where this error message could pop and be
harmless. If we leave this message here it might span the CI bug log.

> 
> > 
> >> +		xe_gt_report_driver_error(ct_to_gt(ct),
> >> +					  XE_GT_DRV_ERR_GUC_COMM,
> >> +					  "CTB send failed (%pe)",
> >> +					  ERR_PTR(ret));
> >> +	return ret;
> >> +}
> >> +
> >>  static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  		       u32 g2h_len, u32 num_g2h, struct g2h_fence *g2h_fence)
> >>  {
> >> @@ -690,8 +704,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
> >>  	return true;
> >>  }
> >>  
> >> -static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> -			    u32 *response_buffer, bool no_fail)
> >> +static int __guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> +			      u32 *response_buffer, bool no_fail)
> >>  {
> >>  	struct xe_device *xe = ct_to_xe(ct);
> >>  	struct g2h_fence g2h_fence;
> >> @@ -755,6 +769,19 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  	return ret > 0 ? 0 : ret;
> >>  }
> >>  
> >> +static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >> +			    u32 *response_buffer, bool no_fail)
> >> +{
> >> +	int ret = __guc_ct_send_recv(ct, action, len, response_buffer, no_fail);
> >> +
> >> +	if (ret < 0)
> > 
> > This is actually probably an error for the case mentioned above, I'd
> > have to double check on the use case but my feeling the caller should
> > ensure a GT reset isn't occuring if it needs recv some information. Or
> > at the very least retry after the reset is complete.
> 
> we might not have any ready to use mechanism to tell whether reset is
> ongoing, but likely it will be useless as a reset could happen anytime
> after caller checks for it.
> 
> even if a caller will retry, IMO we should report the error.
> 
> and likely we should introduce different error codes to distinguish
> between: disabled/permanent vs. disabled/in_recovery/reset
> 

Agree.

> > 
> >> +		xe_gt_report_driver_error(ct_to_gt(ct),
> >> +					  XE_GT_DRV_ERR_GUC_COMM,
> >> +					  "CTB send failed (%pe)",
> >> +					  ERR_PTR(ret));
> >> +	return ret;
> >> +}
> >> +
> >>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  			u32 *response_buffer)
> >>  {
> >> @@ -1133,6 +1160,12 @@ static void g2h_worker_func(struct work_struct *w)
> >>  		ret = dequeue_one_g2h(ct);
> >>  		mutex_unlock(&ct->lock);
> >>  
> >> +		if (ret < 0)
> > 
> > Same as first comment, this is not really an error for the -ENODEV if a
> > GT reset is occuring, likely an error for the suspend case.
> 
> so should CTB be aware of the ongoing reset and return different code
> (-ECANCELED instead -ENODEV) to allow filtering or just rely on its own
> "enabled" flag and always report an error ?
> 

Yes we really need a few states:

Not enabled (before driver load, during tear down)
Suspened
During reset.

In this case 'Not enabled || Suspened' is an error while 'During reset' is
not.

Matt

> Michal
> 
> > 
> > Matt 
> > 
> >> +			xe_gt_report_driver_error(ct_to_gt(ct),
> >> +						  XE_GT_DRV_ERR_GUC_COMM,
> >> +						  "CTB receive failed (%pe)",
> >> +						  ERR_PTR(ret));
> >> +
> >>  		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
> >>  			struct drm_device *drm = &ct_to_xe(ct)->drm;
> >>  			struct drm_printer p = drm_info_printer(drm->dev);
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >> index 21d5273d7e61..29a22cb64825 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.c
> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> @@ -18,6 +18,7 @@
> >>  #include "xe_guc.h"
> >>  #include "xe_hw_engine.h"
> >>  #include "xe_mmio.h"
> >> +#include "xe_tile.h"
> >>  
> >>  /*
> >>   * Interrupt registers for a unit are always consecutive and ordered
> >> @@ -227,8 +228,9 @@ gt_engine_identity(struct xe_device *xe,
> >>  		 !time_after32(local_clock() >> 10, timeout_ts));
> >>  
> >>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
> >> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not valid!\n",
> >> -			bank, bit, ident);
> >> +		xe_tile_report_driver_error(gt_to_tile(mmio), XE_TILE_DRV_ERR_INTR,
> >> +					    "INTR_IDENTITY_REG%u:%u 0x%08x not valid!",
> >> +					    bank, bit, ident);
> >>  		return 0;
> >>  	}
> >>  
> >> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> >> index 87adefb56024..f2e20e10d927 100644
> >> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> >> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> >> @@ -125,12 +125,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
> >>  	return 0;
> >>  
> >>  fail:
> >> -	xe_gt_err(gt,
> >> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> >> -		  idx, e->clr_bits, e->set_bits,
> >> -		  str_yes_no(e->reg.masked),
> >> -		  str_yes_no(e->reg.mcr),
> >> -		  ret);
> >> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS,
> >> +				  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d",
> >> +				  idx, e->clr_bits, e->set_bits,
> >> +				  str_yes_no(e->reg.masked),
> >> +				  str_yes_no(e->reg.mcr),
> >> +				  ret);
> >>  	reg_sr_inc_error(sr);
> >>  
> >>  	return ret;
> >> @@ -207,7 +207,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
> >>  	return;
> >>  
> >>  err_force_wake:
> >> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> >> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
> >>  }
> >>  
> >>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> >> @@ -234,9 +234,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> >>  	p = drm_debug_printer(KBUILD_MODNAME);
> >>  	xa_for_each(&sr->xa, reg, entry) {
> >>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
> >> -			xe_gt_err(gt,
> >> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> >> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> >> +			xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_ENGINE,
> >> +						  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more",
> >> +						  hwe->name, RING_MAX_NONPRIV_SLOTS);
> >>  			break;
> >>  		}
> >>  
> >> @@ -259,7 +259,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> >>  	return;
> >>  
> >>  err_force_wake:
> >> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> >> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS, "Failed to apply, err=%d", err);
> >>  }
> >>  
> >>  /**
> >> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> >> index 131752a57f65..4de9b5e558a2 100644
> >> --- a/drivers/gpu/drm/xe/xe_tile.c
> >> +++ b/drivers/gpu/drm/xe/xe_tile.c
> >> @@ -71,6 +71,47 @@
> >>   *  - MOCS and PAT programming
> >>   */
> >>  
> >> +static const char *const xe_tile_drv_err_to_str[] = {
> >> +	[XE_TILE_DRV_ERR_GTT] = "GTT",
> >> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
> >> +};
> >> +
> >> +/**
> >> + * xe_tile_report_driver_error - Count driver error for tile
> >> + * @tile: tile to count error for
> >> + * @err: Enum error type
> >> + * @fmt: debug message format to print error
> >> + * @...: variable args to print error
> >> + *
> >> + * Increment the driver error counter in respective error
> >> + * category for this tile.
> >> + *
> >> + * Return: void.
> >> + */
> >> +void xe_tile_report_driver_error(struct xe_tile *tile,
> >> +				 const enum xe_tile_drv_err_type err,
> >> +				 const char *fmt, ...)
> >> +{
> >> +	struct va_format vaf;
> >> +	va_list args;
> >> +
> >> +	BUILD_BUG_ON(ARRAY_SIZE(xe_tile_drv_err_to_str) !=
> >> +		     __XE_TILE_DRV_ERR_MAX);
> >> +
> >> +	xe_tile_assert(tile, err >= 0);
> >> +	xe_tile_assert(tile, err < __XE_TILE_DRV_ERR_MAX);
> >> +	WRITE_ONCE(tile->drv_err_cnt[err],
> >> +		   READ_ONCE(tile->drv_err_cnt[err]) + 1);
> >> +
> >> +	va_start(args, fmt);
> >> +	vaf.fmt = fmt;
> >> +	vaf.va = &args;
> >> +
> >> +	drm_err(&tile->xe->drm, "TILE%u [%s] %pV\n",
> >> +		tile->id, xe_tile_drv_err_to_str[err], &vaf);
> >> +	va_end(args);
> >> +}
> >> +
> >>  /**
> >>   * xe_tile_alloc - Perform per-tile memory allocation
> >>   * @tile: Tile to perform allocations for
> >> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> >> index 782c47f8bd45..c79108fb9579 100644
> >> --- a/drivers/gpu/drm/xe/xe_tile.h
> >> +++ b/drivers/gpu/drm/xe/xe_tile.h
> >> @@ -14,5 +14,8 @@ int xe_tile_alloc(struct xe_tile *tile);
> >>  int xe_tile_init_noalloc(struct xe_tile *tile);
> >>  
> >>  void xe_tile_migrate_wait(struct xe_tile *tile);
> >> +void xe_tile_report_driver_error(struct xe_tile *tile,
> >> +				 const enum xe_tile_drv_err_type err,
> >> +				 const char *fmt, ...);
> >>  
> >>  #endif
> >> -- 
> >> 2.25.1
> >>
