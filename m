Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8A0C3DA6F
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 03:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAF210E4DB;
	Thu, 24 Aug 2023 03:50:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1926D10E4DB
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 03:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692849003; x=1724385003;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UtMHKEVH0W6Ydt4n0I+lgBXh72tkcqCjqE8F1sbJuI8=;
 b=jvgmxms7+epbQEuB13GhbeQ57iBp6FTo46mlXB48nqCLhw8yGl1IMroV
 3bNRWbbMwpImmsxiRbohlI1n05UUTiGrZzPypK0Vp+OKj2SZswD+pSuW+
 DSkX53p4xHr2ipu3oSzmA7/WC35JJcDRea+uTx9VZflYpwNzG8Hq2H2r4
 eUNeMWlvwgMe3hoHmXTTmr5Chiz0kzpAiYZHUqPmllDMth6D0ss04y0by
 Jo6wAlufd4Lf2TDxhByyXga8kme7XW1fd/BdjHxX44Iy0K22sfz4SxD+L
 1zZuH1UFwSFva4uGpA0rCMWfB0+h7EvvK+/A5uj9ceArq2HDTNfGsAGWC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373221378"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="373221378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 20:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802376796"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802376796"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 23 Aug 2023 20:49:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 20:49:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 20:49:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 20:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiqQb+XClv+ukqJ+ygFkqhvfQxtvXVZd9diT+RtXKLKlTfCsjuZmWdEaFkZ4QLGO4mEEskM13HbtKvxeLOKfqv2K82StCiGp+vMl9cKrVTnTC+/RPLsNTwYw4FVoP7JgRdeDXM1E3FG3CflhCJOwCD08+isWkgT6ciScncuGs+RZM3WZ+unoVX9zok80Eyay3ZX9e0vFy4MPFYwoNUu1SxmV2YATK2RPh7CD9gkSueLoqNXjtWeQ/dQOQErpi5vnPRv79AfsUozRn4we1XJStDSIuhP8B4TInMQ/9Nu+FFxpmd6St1TvFjRRSi6MiDV0yxvLdQpRVtciuhZ/o0shJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ5t0l+sG8Ea5+wVDdkXWk60KG2yV+riChGBFZj6doU=;
 b=RVbtii9C1sxTWR/IwtrFupc2y8kQYAdrcrrJEHrqsdI/+7rV2MzkDKLPgBUTtEQo3xJbkQV4G0rRyZku7SweNG/vYk3L+vHVa9Zj9RfGX7bcita6Za/eZnsD0tUUvLjYx29FAbKpoKYK4ozYw4ZmLMZdQkPe2ZIJxiP/NS6+EOANBVWagQdGp4qP8bXqsndf0c5j2RnZs5cqJuZwgvxMr/1PSkhNh9WtMhIYcF7mGdDEJsLeHPmge9qYLrcJHkLzA/qu0Ss+FuI0JnLsAj9wMRdZrZ8B1JuA774xPGTrZ/JiH9rYttdbW2ZC5urHC8Dx3qFR4TlmtjFhj1JNC4RuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH0PR11MB5523.namprd11.prod.outlook.com (2603:10b6:610:d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 03:49:33 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f7ed:4327:5d1a:b8fc%4]) with mapi id 15.20.6699.022; Thu, 24 Aug 2023
 03:49:33 +0000
Date: Wed, 23 Aug 2023 20:49:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZObTSqBRVhldI93Q@nvishwa1-DESK>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230823114040.31769-4-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH0PR11MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb3e0c6-be32-4e6a-4268-08dba45520a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HFNLga9T/1qBum57dPExQBmX1+J75oWqM+3hJnbLwc7c/UAvM7M8g/CjnEFLjSM1JQzWml2G1Hek2Sw3TOWdinPa5KnCMMljrBgV724P3kTbaXv6E3+p5KzZqmLGnjUSKpkGL2boyB6ZnjO/FUTYPpD1LUv9zUh2yXv2daLeVss4WrA6MnUiKxQ2qiVLIeD4huMM4iruuOk0ibZW5BK7Ed4an/Es1li3EnW01gTdHKoWnmL2IKEWFbXYjdx0uPAB39r4N0qsDhGEwceAdVJ/2i2uKdPflMScUEDfhe1IDJQimtmaf4U6wOwnpuZ2lYocguFL5AktHxNwtS+S56t6wIc5Tcql8uzgInoP/JzW4l/Qi9zgNTj2+gQihPwT23rfEpaZEgaWxBU8pSgC2Ua0oIcwhibaJ2konK35ucJuPzUm5BJLx++ImRobojirkleGzTM7I4kqUJr/0Ts/oM77NW2MXlyuhJ6gGwwtTf1P62s7uzF+YbactJYdkgmyy7Cwj7NXnp9/Xp6n0PvQSIj7tOXLl+r0+SoN+Z314Of3bNBAGCMiv9vMwHjE2nSYHdwe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(346002)(376002)(39860400002)(396003)(1800799009)(186009)(451199024)(5660300002)(83380400001)(2906002)(38100700002)(82960400001)(86362001)(33716001)(9686003)(41300700001)(6512007)(66556008)(66476007)(66946007)(6486002)(6506007)(6916009)(316002)(4326008)(8676002)(8936002)(478600001)(26005)(107886003)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o080k2oiRLvHg/NjRgZCNxZ6PAT7CMYW6D5136aQcQG+qk0vQQF+fPxKBeaF?=
 =?us-ascii?Q?bwAixV7GkseV+b1W2emGkl7CW18R4wMbZYu6Vhq9XDQ5vcQvrsS+GxxyMICB?=
 =?us-ascii?Q?tFxUR8LlcVcsO9dc5+TZuSQ40mDj1uZrd/k/Cy6ligeEOm0UKryl5WCGlYo/?=
 =?us-ascii?Q?zDrAVJUtKzE4m3Jq8AVfYRx7I8qdPAB+eoAgs9ma2f1BVwekixY6LbX0TL8b?=
 =?us-ascii?Q?Ch2qgcNfnYx5bOpcklT+VYsysAHp0vQ5V2Di9KpWyB4bvzx9BO8gwkst/DF8?=
 =?us-ascii?Q?2pG1fFbL8Sxq/1FurGfhXhSscCGkSYhsK339PKHQu+uWcBKQLTAP9Zjxu6KZ?=
 =?us-ascii?Q?K5uvN5hstAcJobcU3jSVNVUaw/y5qDvCcBs4j34j/h2aTDWi3vllE7TE4Yfu?=
 =?us-ascii?Q?m1Uwifow/yKAyUTs/MAIqxlS9c1V5qbAsyUgT9iW5IAh+6zaV708424sq9hM?=
 =?us-ascii?Q?3e/yI2wl3ifUOxYinBtN7tb+nNwH7At7lrpkdtow6d+qu3NsPo5lSdueulFN?=
 =?us-ascii?Q?ylV3NOhC/7pNRthIVX8F6qkFqoNp7b8iWQKvOHbVTg5vXubNzJ1O0bKitTOa?=
 =?us-ascii?Q?EymHrQttijYvHoRSqtQiYvXO7m/s7/oafIDgBSB84HC8pr4R7iEIKWXroct6?=
 =?us-ascii?Q?sNn3r44GAu6POSISn7p9xTxm9oBB2jsRZgaoL98PWv2fK+rMxloRQik34F8e?=
 =?us-ascii?Q?8OAKWtuMxsOAt1XJT4xj6RfIOZbRYX0gIXcPMLY7jwxpBStIzD3YlgsY6Ync?=
 =?us-ascii?Q?xnUbtm5zqIuGDcmiVFxDtpxSHHuX+bTMfkSF2kPqn+Vh65yjw1RgdnuQNp/8?=
 =?us-ascii?Q?luT+T3anRG7y4uJnWy/GP9ADqucR6voE6Ah6c9aqIRQGB1tUqMilg9Jj4pqT?=
 =?us-ascii?Q?JQBll2NBfSDJFHHjwY76v8tAnzWjcrFr0kjqmXWqe3T/lRny20p2i/Nnl1TO?=
 =?us-ascii?Q?tGYVg5JyXD0Cv3XbEzOLg6gDpTAPD2mE44bRTPoV0Rp4D+7vPl4XHYcXjiBa?=
 =?us-ascii?Q?vBxQh3cPVwUgx1eyrYdaZ3R4vHIqkK03Jx/ZtqnXQKy8fq64v9V7nwW2UQOe?=
 =?us-ascii?Q?+KJyZnO4VWhT4Cd4s+Hg8fFbB2Thz8C+DsARUe6uVxMp6cIVB9Q3/OKcL1Zl?=
 =?us-ascii?Q?tF+7pciOe7nro2Y4IDeQpbJulpkxeUwJMu13ECiHfiiSd7o9U0RchvGVyT1n?=
 =?us-ascii?Q?RgAdXP+PaKHbnIaa9EMJwHGbxfK1QCokwo5hygERUHYgQvsLzyGQoQ6JVCPz?=
 =?us-ascii?Q?B6NF2Ziz49wVNQloPtzj2hzpiN1sRYRLW1FmF5HpZ1MXZJPfeedJ1BOA9lFM?=
 =?us-ascii?Q?l2mx+Hr7K+Ydd92T7yqMZsBIjPtEtrIjDilHQWjokrBmJYg7wi3nTIANyOit?=
 =?us-ascii?Q?fHWs9qMaG5UwruaCxaXHI8SRYakzYAodBKT7KPkB7gMKW7raAPMJJoHCKFR3?=
 =?us-ascii?Q?K6p/Qj+fWhiY4PyRSQ16uS/1hjG0cDY2Lo2woo6kwNrawcwIsbjfiqgMkk63?=
 =?us-ascii?Q?SvkVrOljs8DIdjTH7hOTVp+3zBAcdoJ837+oVOyD4o2heT/5K/gXVAJMpTGs?=
 =?us-ascii?Q?2oEGYCJ5aSH1nblCBfQv3CNVItcYZW+F5Q2XQ97BbC3MD3FxRV2ksY2I6Ux1?=
 =?us-ascii?Q?tGxKYAlXOljuwh9tixc0ytc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb3e0c6-be32-4e6a-4268-08dba45520a7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 03:49:33.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwlLgKu2p4CkI6PBE+TBYsug89KrvKEDwRemu+E7kYVaAN2W8ALxEJZS9XTDN/YgSQUJCsczKnuip3K9NRtirwlF24uO6ddMtKvdXua1MPc+dqDcxLqrKoIEvvw2v+F8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5523
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/pvc: Use fast copy engines as
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
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 04:40:40AM -0700, Niranjana Vishwanathapura wrote:
>Some copy hardware engine instances are faster than others on PVC.
>Use a virtual engine of these plus the reserved instance for the migrate
>engine on PVC. The idea being if a fast instance is available it will be
>used and the throughput of kernel copies, clears, and pagefault
>servicing will be higher.
>
>v2: Use OOB WA, use all copy engines if no WA is required
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>---
> drivers/gpu/drm/xe/xe_migrate.c    | 39 +++++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> 2 files changed, 37 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 956a96b38346..60f4e0a60b71 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -12,6 +12,7 @@
> #include <drm/ttm/ttm_tt.h>
> #include <drm/xe_drm.h>
>
>+#include "generated/xe_wa_oob.h"
> #include "regs/xe_gpu_commands.h"
> #include "tests/xe_test.h"
> #include "xe_bb.h"
>@@ -29,6 +30,7 @@
> #include "xe_sync.h"
> #include "xe_trace.h"
> #include "xe_vm.h"
>+#include "xe_wa.h"
>
> /**
>  * struct xe_migrate - migrate context.
>@@ -298,6 +300,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	return 0;
> }
>
>+/**
>+ * xe_migrate_usm_logical_mask - Return logical mask for usm migrate engine.
>+ * @gt: gt instance
>+ *
>+ * Due to workaround 16017236439, odd instance hardware copy engines are
>+ * faster than even instance ones.
>+ * This function returns the mask involving all faster copy engines and the
>+ * reserved copy engine to be used as logical mask for migrate engine.
>+ * Including the reserved copy engine is required to avoid deadlocks due to
>+ * migrate jobs servicing the faults gets stuck behind the job that faulted.
>+ */
>+u32 xe_migrate_usm_logical_mask(struct xe_gt *gt)
>+{
>+	u32 logical_mask = 0;
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		if (hwe->class != XE_ENGINE_CLASS_COPY)
>+			continue;
>+
>+		if (!XE_WA(gt, 16017236439) ||
>+		    xe_gt_is_usm_hwe(gt, hwe) || hwe->instance & 1)
>+			logical_mask |= BIT(hwe->logical_instance);
>+	}
>+
>+	pr_info("NNV %s logical_mask 0x%x\n", __func__, logical_mask);
>+	return logical_mask;
>+}

Need to make this function static and remove the pr_info print statement.
Will do it in next revision along with addressing any other comments.

Niranjana

>+
> /**
>  * xe_migrate_init() - Initialize a migrate context
>  * @tile: Back-pointer to the tile we're initializing for.
>@@ -338,11 +370,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
> 							   XE_ENGINE_CLASS_COPY,
> 							   primary_gt->usm.reserved_bcs_instance,
> 							   false);
>-		if (!hwe)
>+		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
>+
>+		if (!hwe || !logical_mask)
> 			return ERR_PTR(-EINVAL);
>
>-		m->q = xe_exec_queue_create(xe, vm,
>-					    BIT(hwe->logical_instance), 1,
>+		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1,
> 					    hwe, EXEC_QUEUE_FLAG_KERNEL);
> 	} else {
> 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index ea90dcc933b5..599e67169dae 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -17,3 +17,4 @@
> 1409600907	GRAPHICS_VERSION_RANGE(1200, 1250)
> 14016763929	SUBPLATFORM(DG2, G10)
> 		SUBPLATFORM(DG2, G12)
>+16017236439	PLATFORM(PVC)
>-- 
>2.21.0.rc0.32.g243a4c7e27
>
