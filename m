Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6171CC6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 04:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BA210E257;
	Fri, 24 Mar 2023 04:53:30 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5F10E257
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 04:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679633609; x=1711169609;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bS9K0ZInpc8meHvUXbOF2TVRmlaVSHZqUH4/cK18MMc=;
 b=GQdnARU0zBH3I8Ql93Xopxp4rwH9kEIkXrS2GaDRQijMlL36N3gOjxbC
 TbyAsn7G7Eq7rtziXgA8WUqkuG5dbLWohAcHlAdRKLStJfUilmrzGK827
 ZcVo/90wn67gtLL3QJK7S/ITg9b4aypiFBx4TYB8CSBS7v0a1ZZ+02NUD
 5EzmU3IaGiUHWEkXiqvEzOFyaxg+jTxBsQMadZswmyh6JoBUu0z9X8CDs
 ULfsBun/oddgP4zywyETkUHqCd2nXDF2xs3sSTzVQX54gR2c2qqtF/sxq
 s2t+J2vPTi3azlUM/L1ymbdpmhTvSF602KVQ85XqEej0gTYZySJ7YsSxg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="337202450"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="337202450"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 21:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712946840"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="712946840"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 21:53:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 21:53:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 21:53:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 21:53:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 21:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXAImKuqm59TlfRUFGjB7PW9KSlxXtNyTQZZFJeHByhj+y4WfKfzMlgjvr5yxRZAmNHntZ466KRriq4Ji+uVEKmcUmGuREUaOEirnZ8ESqZex7bMrn/X5qgnzUPVtb3xSuP/dDdgAKf+zbLpVYVtQXQ93BQASo/b5+fGx8m8yfQmvheOyX1SSmNVaEs1jYExalgMr6Yg9L+dYDhPBFskTe6SRO/2XKS2NTbUXRGtZ4LeisalA1SXQ4AmCVavaAWsjMdd1FhH4PG7441zctSXUMh7uDq5VAMYGxjkSpAX74wArAvBwbUSRggJbN67bEdm9AqoLkVeUR3RCDTO0g8qAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNScm36xUurHKdlG/1yfHHO4iDu55MvPhdBXFkYhKc0=;
 b=Vdv+U/lIaT1uRKEZuDHHPJ2ey1BIH3+4j0/g2uOWooDl5QFj2wbmgUyEnNDqODzGRJP22R4HIB/KQGxHQqLl3Mc6kXyL5VBUe9Z80GCHRhzNSZ6wmANeiHmnskI7/vLmkie1hr5TYDF5V2vhri6pB33hpWzJsZx8ztuN0MxuoYUyV6SeMoxi+56GkSEZzVVhhEOVh7AYWxDT0DuDaN+3gLsSk70WkT+PJ1eM1fTKR9LLcc1zWh+NG0qky5kWcM175Q5I8CfOzxP35P6eegb56/yCmzSjwTl+P2eQUYHj1qhznjYb1umQLVqpv6Bd2u2cNDOV0VVE+eESqpADZYIjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 04:53:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 04:53:13 +0000
Date: Thu, 23 Mar 2023 21:53:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230324045311.h32fyw7mh6o6eyic@ldmartin-desk2.lan>
References: <20230324012329.1195977-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230324012329.1195977-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 11343457-45b5-4156-8acc-08db2c23aca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vkCAm333bsTS0aVu4x7IJR6fiKcDyEfAKMmgu0d4iCxDhqFCkOK8S4p+ENHwTv0ZdUFEcYl07OxKA3cZ+0p2LkIjCXmKhIF6NcuZRqqLOurFShNSGRr/D4n42zvtnesyP2SPXEDcFqGsTIQ5/rpdyGydg8+Vvd/QadWLiFxeoMYW1+Z5lqU6kWs3xISyFI/mtZT8vmPRPySc3IuoYk5ue0oeGXH37W+qAPOUuqH3Ap5ZfMYtXb7TcHpTacH9cYhum2UU/OOnLYd0PHGAra24D3ZQhfGsSWZzSOPYR6UNR/93iPbxUEvmzVKgdBvEp/pMO/+ONm4BKTR/x9c8qDrrdYJyEV47U7IsAEgg2wTMCaQaiY8ycI716gRklwITjWMoRxH65tnvBayjSK5YSnXeVYNp7TkLIxRZT9c8FtHbk9xukaNxP5g0VpbOXDW8kjHMsGYLBCI9pmsyAgRka3rvHRxHq9ptWHevKM7q6/ZJzrno0OcYyGb73+VpXQMP3Ls4lN+9aWovFXjM4YtRnrHSLLJx1yoNi9zoLlCXCQZhh37toix12guhn7r1R24OPj3buYj+YgGoFBPr0LbG8MRwQb6rVol/JiAwHNX82bsR3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(38100700002)(36756003)(82960400001)(86362001)(66946007)(41300700001)(6862004)(2906002)(8676002)(66476007)(8936002)(5660300002)(4326008)(66556008)(107886003)(478600001)(83380400001)(6636002)(6486002)(186003)(1076003)(26005)(6512007)(6506007)(316002)(9686003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+n2GATHOtc9s0cQK4JGZl0oUsxwbF5TOHGC0fjVp+aO++xUAI0lLoqx1CHKv?=
 =?us-ascii?Q?A6csfwAoX1yfh+PnstfNAP9HbLvEBZgiFLD6PII0zs8MmpvoXQCoHOXt1ufl?=
 =?us-ascii?Q?xDW8bgtlp05qQ21Nb7P7Rb/Gq+4NPR+q/cb9pULL0q4U33qvE2cjojtOgdH3?=
 =?us-ascii?Q?xhGkUt62aBfsQwtc9/QoxFMGpLEvtVurLQIaxzSERvrrZNNcaRowIVoGsEVI?=
 =?us-ascii?Q?Tj+cGnnODSmcSyE4SGg/q56m/d3MVAHd8ZEb3ZDTu/mBW7n9uEp362EETA+D?=
 =?us-ascii?Q?6JmF6u8G3ivZ6gDNppMlCPULyBZw9yxks9Bp2tpfjdEUgJUOMjMS7MGaAmTm?=
 =?us-ascii?Q?N4kKpkw7kVLFRixuPng6JcEc4XGWLH8plLTzZqFVUvX9jd5tCUWaQrROnMmP?=
 =?us-ascii?Q?bgmSE1aRobDBvNZ2Gc/KaLb2OHQLdZD4g2kO+AGgs41J1Os+q2kcy5wWpdVf?=
 =?us-ascii?Q?DDLMEYIpUY0T7Mu+i0aN7PkG4tVR/s/0CEHYkTkYj+KHm2f+vGrlcKj1ASdD?=
 =?us-ascii?Q?mkKA493FJvXECpZpzAKIlU8a3yK120lRz+tBBQyCy87FGQyb83G/DgIcHoNx?=
 =?us-ascii?Q?8hlIJmfE8OutwEuC2kzaVfULMWUBvK0PDtBOyjCoj4oda/sBTd7MjGZ5OHx9?=
 =?us-ascii?Q?hkz/Y1bBZ20A9v1aOjN+1n6kHEVkIt1Tww397NryeTjxnxw0pvgN0eicPevp?=
 =?us-ascii?Q?IUe0I5SN2QLvwEg3RuAkDacIUg972+E4D1znVm/ZIRJMH3fAJfARL5vZWs+T?=
 =?us-ascii?Q?A9y1FU7MjzQ+rI0NiU9QyU6I9Z3yzh3p7KdekIiprsYKeEpHgX0Usg+7rm+D?=
 =?us-ascii?Q?GuruweSN7wgBxaEoYlGrQhL2agQG6Gx9feX/brORgiR3AY2A0xe/N82/KiVr?=
 =?us-ascii?Q?7V8T/H3f7wXsNWa0s1PcDntPlj4IEyAYiv11u+XOJiSku9ZQvoZPcobOFKvQ?=
 =?us-ascii?Q?BS2Kgc424WlFyE8NvskmOprI9JVavM3qad56vogBdz1/N/wfeevjHrLQe6zl?=
 =?us-ascii?Q?gpNsnU69frAeZigrcqYmbfkJZZvjORUc7jjbomrfLHF4kwHAKGMhwM+Aisja?=
 =?us-ascii?Q?Ex+eoSI8vvi0tz1sdLllzOD7r0Y94DLpXCVOQOkVKi4zqWvcer71GyjvOoXW?=
 =?us-ascii?Q?JzznFcfJ63b1g4AHuIV7bJaGLO5dkeI5FdYLDqMsC1Nv7z9Dx8gUgt2biCbf?=
 =?us-ascii?Q?wXONmSHt3TyqPohMjEsIYFwQDqPUarSnS0yH0vZXrgtH4VH6ntPtz1dfbLd8?=
 =?us-ascii?Q?bZ1GKcvZODBpUcow4OmC7paF77GojvxVGUtkBmPS/AaMODpOz9Ktpm3o88gS?=
 =?us-ascii?Q?2F3fO1OveBHjAFhoUiClDNd0JmAhfd5MSFkOeDobVata1O1dXXUVfucTRFSJ?=
 =?us-ascii?Q?UE2C9hTM8IFb6uhTFX+GER0p2IqFgfv6+4VfY/pCk5/CIJLvzv0sx8fsZsuE?=
 =?us-ascii?Q?cUzqhhgPUYq8l6h1O7UcYfY24iSNMORKMaFkjZj65e24OCbArJc8Z2iS7cEA?=
 =?us-ascii?Q?5x0lHuoUOlUzkuX29d08gJsCe8tVYrJskuvF6Yo5SsIMm+rvAI2QYGj9QwMW?=
 =?us-ascii?Q?zGsxkAjZjsldirssasOzB5LXIKg5z9QrLeTUYJSq5pvQ0/0l6Z+JtWwnAmRC?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11343457-45b5-4156-8acc-08db2c23aca6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 04:53:13.7787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvSHu06GpVu1Bz++OqHzIv9wR+Va56XJF4jdYft968LxNuMfp1LGrHnEk73ZZ937FoBdi/o1b8gb5tS7a4qTvZsxxrllCvw5IBpl/3yDXU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use fast virtual copy engine for
 migrate engine on PVC
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
Cc: intel-xe@lists.freedesktop.org, Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 06:23:29PM -0700, Matthew Brost wrote:
>Some copy hardware engine instances are faster than others on PVC, use a
>virtual engine of these plus the reserved instance for the migrate
>engine on PVC. The idea being if a fast instance is available it will be
>used and the throughput of kernel copies, clears, and pagefault
>servicing will be higher.

how faster and/or why?  If it was related to being link copy engine vs
main copy engine it was very understandable as the commands available
are different and optimized for certain usages. However below you
are setting to the odd link copy engines + the main copy engine
+ whatever was reserved for USM.

Without a proper reason here or numbers or spec, it's hard to judge
where this is coming from and understand in future.


>
>v2: Include local change of correct mask for fast instances
>
>Cc: Bruce Chang <yu.bruce.chang@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine.h    |  2 ++
> drivers/gpu/drm/xe/xe_hw_engine.c | 20 ++++++++++++++++++++
> drivers/gpu/drm/xe/xe_migrate.c   |  7 ++++---
> 3 files changed, 26 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
>index 1cf7f23c4afd..0a9c35ea3d34 100644
>--- a/drivers/gpu/drm/xe/xe_engine.h
>+++ b/drivers/gpu/drm/xe/xe_engine.h
>@@ -26,6 +26,8 @@ void xe_engine_destroy(struct kref *ref);
>
> struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id);
>
>+u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt);
>+
> static inline struct xe_engine *xe_engine_get(struct xe_engine *engine)
> {
> 	kref_get(&engine->refcount);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 63a4efd5edcc..d2b43b189b14 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -600,3 +600,23 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
> 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
> 		hwe->instance == gt->usm.reserved_bcs_instance;
> }
>+
>+u32 xe_hw_engine_fast_copy_logical_mask(struct xe_gt *gt)

this deserves its kernel-doc, probably with similar info asked for in
the commit message.

Lucas De Marchi

>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	struct xe_hw_engine *hwe;
>+	const u32 fast_physical_mask = 0xab;	/* 0, 1, 3, 5, 7 */
>+	u32 fast_logical_mask = 0;
>+	enum xe_hw_engine_id id;
>+
>+	/* XXX: We only support this function on PVC for now */
>+	XE_BUG_ON(!(xe->info.platform == XE_PVC));
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		if ((fast_physical_mask | gt->usm.reserved_bcs_instance) &
>+		    BIT(hwe->instance))
>+			fast_logical_mask |= hwe->logical_instance;
>+	}
>+
>+	return fast_logical_mask;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 11c8af9c6c92..4a7fec5d619d 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -345,11 +345,12 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
> 							   XE_ENGINE_CLASS_COPY,
> 							   gt->usm.reserved_bcs_instance,
> 							   false);
>-		if (!hwe)
>+		u32 logical_mask = xe_hw_engine_fast_copy_logical_mask(gt);
>+
>+		if (!hwe || !logical_mask)
> 			return ERR_PTR(-EINVAL);
>
>-		m->eng = xe_engine_create(xe, vm,
>-					  BIT(hwe->logical_instance), 1,
>+		m->eng = xe_engine_create(xe, vm, logical_mask, 1,
> 					  hwe, ENGINE_FLAG_KERNEL);
> 	} else {
> 		m->eng = xe_engine_create_class(xe, gt, vm,
>-- 
>2.34.1
>
