Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B1C47074
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865C710E252;
	Thu, 28 Dec 2023 02:13:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059210E243
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729587; x=1735265587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DRdl/Ui7ZSKXb7SWcmEu2DXmpVgmQ2/GO/I37EzRG+w=;
 b=Vxf/g7t7XVMSYELn4PU+JSAM5UaGwg2wxeWUW5bGE7k5xXoBeKLiiWAz
 fey3IShFl39mMO5l1RXpJDcml1Bi44I4lT5JsS/5zDPxP/mI2xO7S60s3
 phhYh/+9QKDEwiy289hIx5Qo7oPJbkfJuDXaVIT85Lw5lKBgDOA4YwGBy
 TP0oqqtW1xJVR2t+qL9wbjMolnuK/b998fsqjyzxuEsV7zOcq3rqiUXzT
 8uBSwU2j2ih5gjv8fPBCSUiyJ2lEe/XxEgjdJKohPalz3ZXyJZVG4UWXs
 +yj6qVpXCPpXawB1SX87Vj+TxQ3Y52CanixOByCkYzjSgFJ2TzYf+om9F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="460830258"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="460830258"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="20451646"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtJJKYBtUFQtyoBDZ8t5euymwH8cs/5WXP51EV1w+YuMW3c43ENjoCTqSFjBJyT35w6bc8SEb41MLxutPSQnI9XQxZudDkmoCBuTeppKqe31H8JtZISJpXuKecQg5A137GVBuSfn/mCnpPJ4maOyaRpQn8wBv/pVlhA4PvdXHdW4qBLhfdkvaqjarOTjrHcvfZzW2Gwun3Zdn8SxlVp1KZjKUDyfxoLzk7TqU2+wV1ObBuqbtrt4QGlxpdZn9lR+Ml/mxum070siDZyd9rfB68L6x5vvYqOq0ZMWIzKAe30b1NEN8xaBNsMK+7ZGroGFFcY1F+rqG6MlX3DfP5Vy0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sjs14+K4JLiOV6UnOXZlLm34/OaYzF8cUI/q0eSqiMk=;
 b=RARTxwIDNf5EEac9G7i+0/6KzhQiMb7RxwK06T1tuERjaoS5UNUulVPrsGwtQepOCRj2DWhVbYF+7QGv2yojp6WSgJjr7/Dbo3/ckxn88ve4ftuM67I2kJO9+U+/isUWn0IAQ18bvKB2Dhfm9DPxsHakn3dMy3Agg5BzpW2TWCZeZqKjj1ecXVkZ4vBG37849PSFRgEfQ7hQ2VlekZr9ElhHipDZWLupbtmo+Yt5odrLGmxXkp1ZcfSRPiIFS5p43s12boixfLeOX6YXUNyooP2aRAQAoCCHfMKxHpcE5/S/hZIcS+OwaXqVV7nrv4GWzq0Y8XsX0KlEZC8l+3GzLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 08/20] drm/xe: Runtime PM wake on every exec
Date: Wed, 27 Dec 2023 21:12:20 -0500
Message-ID: <20231228021232.2366249-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 72520399-4983-4a52-9ffe-08dc074a8694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vQhMMe2pxQe9OAtvERTAnEObULXwl8ji9jdsqVDXQSqws/QsLXo3wgaPYheZpRIb4sJjL1AtZv8wNZ1latR+Ha65L023kZGFgl/Nm2kGFZR7+fcaI5pEc08oC510oxJpEfxblpCz8fRzKIhnpkM0ivCSjc4TThMP7pIopiztwZo5N3AvtAdyY2GaZHtbaI7pWKR/sOOZu00/fhYE2DgwmJG94vg7hB2nfATnR+QVrVTzDKm5ZZPhSAPKC72sEMRlNdl4WgK/lAd+ut835MmDoWn972locZ5wA4KNlxa8HdgVXBCekquKBHMmx2r2Q5iMARD4SPGO8g+sc+KBd58vqR4GHh3Hb/tL7tGEJV/PMtLWhdCMy3vN0pKzO6WPmc/667FPUEJDR+/5zsml+EjKme32HaHN8zzWmbV+XLeSJIDDq1Q+yBb0p5KrtopXKpMfNLubYvEGub38OWTU+4cU6AdTtUqhneB6ZDD9MIFIyZ8MW1XOvj7Wu/M+kHGdet0v06TV8TP27nchdLG23N4cbxFLtXplWQtS/xOdq/iL5BlSXJ6xHKYSmMVqSGJYSX2V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DkpUWO0dELE7siWACYCsHLqwcZQfSj+ws5ar4dSi/R+5Thv0sUdWQVHnOwvL?=
 =?us-ascii?Q?/+I4Owho6+Hra9ZlScFcKc4a8dEsriWnoz8DYUODBM6fhAeoWcEVw0AOhIIA?=
 =?us-ascii?Q?+tNN9ZIXZXCTAHKHEvqMxJ2fcDL1Xht3Z+D5V0N+F0W5hinnkfa9PwhvVD98?=
 =?us-ascii?Q?lqpZh8xXbfHwBvlOkd3SSCLgK15lSy/bwBnIIqhiu1ZwMlZyjKvLHC8JeO6t?=
 =?us-ascii?Q?+RyCn7S5j5KdEu7KOegVb3VeabQmp9GqmER7xvSKRj5iCJh06w54z57nwo65?=
 =?us-ascii?Q?CZg9hTnOtWxVm/eC1oQCxsJI0PyPw6Xvey2ebDbF+wvdsNOdV6bdbfjgXZXC?=
 =?us-ascii?Q?EYG+xY0eL4+GkAjdH9BaZ2ycEnskYbCYTbJiQyGAZl+PGfbSl//c18RulZ0X?=
 =?us-ascii?Q?nPSzq9k+hO4vEayAj5Z/kPDyZvlA1t5hRpzbEWOlc1IbRCy8DL9TVxLMcX7d?=
 =?us-ascii?Q?PO76CnMu/fKaPq63ZLipyFOcL9LD+/aRewwhL7Z5D9xvk1RtL2M2Oc/LWt6m?=
 =?us-ascii?Q?hPcOpRDUHjtTbwo54E5MtvEudX93GJ/EAwpeS3LkQdeQzQH368Sm7oA1JP7O?=
 =?us-ascii?Q?7CPp4XVex8cntEa8h0szVq3of0vFPqsJCoZQyTt3Ew+/bvhfbICMF8x2SgPR?=
 =?us-ascii?Q?sqgcFYFw7jmvndPmeivw0RjU7lXGweZpgl4/Q2nlPHXi/swueQ8UyuobNpeY?=
 =?us-ascii?Q?W60Kmmh6H16RRGhc6uFIwhVNuH6Y5C1lxlRbmG6l1KDuoyrgpPhDieWsEn6m?=
 =?us-ascii?Q?ChdUx+6NpXJGxd0PegOYsIv1sx77g7Fn5mgoMrv1EO07+l8aHJ/CipcnOnFU?=
 =?us-ascii?Q?VGLurvvaF1UnBO+OPLTp6eXD8zVawUWULBWI2eMpEZ22pOAeke/p+/u0RdrN?=
 =?us-ascii?Q?Wg4mGtoW8rIdBRePIZKqzDIje2XU5ZEH9GiYZdC9L/gD2TQqxiRTcXoyMpin?=
 =?us-ascii?Q?X40xPVh7bryDUfDbvQPqCG4TktrL83uMmOvFoX+XeEwt7QA1vINLY72FqW/W?=
 =?us-ascii?Q?mcGHyvXj5Lqtgp0rtCR6myNsIkxJ/b/x2veJa6oGn06VRsUHBADmI54sVaAn?=
 =?us-ascii?Q?X1lqMTv347A/XWbun+k0Zo/KSm6XtM+G12CSvMYaYat8NzD9kznuDFuiybZH?=
 =?us-ascii?Q?vFAyV/NzAA7Q7IMPu0FEA1pyi8JpPsKA5lJlszEODhGTr2nYPtTeBObfK/aY?=
 =?us-ascii?Q?dZ+zrNFcXI4g5bhl7k/feW2zi+hG7DKom6oy7n2iEBckSZWb8es6tS6AE1s4?=
 =?us-ascii?Q?uAgbLo+GE1H7F+zKe7FIA92/qIWQBgRFpKeGhi/oCdIF9wXjejd05o7QE4DW?=
 =?us-ascii?Q?zSqsZuUGee8gNzEN0OROB0qtSyu5yImo2WQlZJ0lWb2SGaxaF1e4YwxU8t1Z?=
 =?us-ascii?Q?wMz0tj3n2P+SdjY5yhUiHT1bO+si3H589AlNH0f2bU+IBcFxv1jONrtU+cuS?=
 =?us-ascii?Q?J4QFsJfQC0gDCCemmFmDb1Q2cX7bevawccKvdM2dGvJlRWBLzKmClQH9lJt/?=
 =?us-ascii?Q?fENs0OYMB9C1lFDsfSa5KnaEhuirDGHYXodwmqeqHBLE55Yiz0Val3AoxMm4?=
 =?us-ascii?Q?takvBWZq/FasDH6ax92Jlo6VwCl9ECPbcYl2uewy60w5Ty78K2qJB01XafK/?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72520399-4983-4a52-9ffe-08dc074a8694
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:04.8786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFu+5+EbwRA95opC1ZtP3rRS9Fw75SGd5De9xQWXKle9EWYy/jMYJgvqfSL46ZVY8piAXjqMyQgaocYX3+2pbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's ensure our PCI device is awaken on every GT execution to
the end of the execution.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Let's also remove the unnecessary mem_access get/put.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 01106a1156ad8..0b30ec77fc5ad 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -15,6 +15,7 @@
 #include "xe_hw_fence.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
 	struct xe_exec_queue *q = job->q;
 	bool is_migration = xe_sched_job_is_migration(q);
 
+	xe_pm_runtime_put(gt_to_xe(q->gt));
+
 	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
 			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
 }
@@ -86,6 +89,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i, j;
 	u32 width;
 
+	xe_pm_runtime_get(gt_to_xe(q->gt));
+
 	/* only a kernel context can submit a vm-less job */
 	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
 
@@ -155,9 +160,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	for (i = 0; i < width; ++i)
 		job->batch_addr[i] = batch_addr[i];
 
-	/* All other jobs require a VM to be open which has a ref */
-	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_get(job_to_xe(job));
 	xe_device_assert_mem_access(job_to_xe(job));
 
 	trace_xe_sched_job_create(job);
@@ -189,8 +191,6 @@ void xe_sched_job_destroy(struct kref *ref)
 	struct xe_sched_job *job =
 		container_of(ref, struct xe_sched_job, refcount);
 
-	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
-		xe_device_mem_access_put(job_to_xe(job));
 	xe_exec_queue_put(job->q);
 	dma_fence_put(job->fence);
 	drm_sched_job_cleanup(&job->drm);
-- 
2.43.0

