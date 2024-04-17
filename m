Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D49DC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622C10E765;
	Wed, 17 Apr 2024 20:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWDn+Me+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3245410E765
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386404; x=1744922404;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=3P+bvIuoKsy91z6ABOv6eWJ6IEpjCQso2Spi+5FJeeY=;
 b=NWDn+Me+CWcMyg3KfwIfvpkbZoJOTNBwlHetgsiFPNkH8p8ldQXx5dm6
 IFp+XTCMJGzvIdrl8r4YObKiUINKqlKlu03NArxdNsNGEFkrQSnVT0Rrr
 mZ1YhuFmSFBh4eMBr84Iwi+SaRcX32mbS/91BXoF5H892gwmwftZQcfnd
 koGnH7tevSbv9iR/91qpGT1wqnfBKUTGXDZ/hW1ZBoFQtrYClwjp75zyQ
 UyL0f863PbyYz5tt3/v1QuUOmAB/JhP7ZweaQwj2uAZFMHf6QJuBJoGbj
 Ej9HXGbFRqVCUgzmEVbZB3EJ0iIHThEWceLazfCOrtca7U3ZRe85EEPUN g==;
X-CSE-ConnectionGUID: UuHSZR6LRjiLrv2u33TP5A==
X-CSE-MsgGUID: 2K5oCrIMQTCZGRrPgQFqBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8764210"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8764210"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:03 -0700
X-CSE-ConnectionGUID: vvDq2GdbSZaUlABo+UYrgw==
X-CSE-MsgGUID: 0JIjM+NdQKykX1O3YMc3RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27375701"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOhPE4DQhWOIkYd3P0TF6GjJBu3pxI4T1jmT65gHN4PODh54VA18GBT4jJZPW3dYULSDtW+9cDF1OM3FSrI/sYpTGh6wbtCcrmIVFHzD6jDvfJEfaUHUlESKb2bQKmeR42vrdElB1sEIbNnjSaZSaxBq+z7AYZgVb1JICzwFSQdz6rITRKQ5+Pq/vXqC3c2lWwTKI1SC7fRzvbJwyFKsGynXPskHT4QV8FscOEbALWk33nuQ3D1/2qplNFxsv4fedUtc6rf20OvDf9nn1WOcK08IRpS0nrUG2+m8KeOfqOX8yFqgGxyHRI2tVqkUJ8uOTZQpHISwjbzIqtJYlkvzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6XNsz3zsAZNJG9tTOzjK+mQ3nFMZHmU8IKCtqA2pG4=;
 b=f5xCnZ720pZfNhuNYm+VtiZyzLwI5LpAhrshq73xMQUWVGK4ssYYToeci6TgQQzxjBYK8xaxMxCuS7JEj2uIZy5zCxR0k3T99Iog5kyTRdS/q8lsN5PGv+L49SAer8DE21EkxfTa109YVYTzJr1O3P+CihBHMnGBJC6yqAgNBEo0hufylE0WdM+/4n2Wxx9tjEmyidIpFv+YH7IOiRNLH7nnZtGu984xa+0cqpf6JOOzE+PmWBQ0KTHeRqPSVgocl8R0MDL27xzekieozKXhm917FPtqkUusyIkGtJFfUmwzfh1w7oE9kuoF1NCXZpTnC73KiSi0pY3ATGqmu0/ipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 20:40:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 01/10] drm/xe: Introduce xe_pm_runtime_get_noresume for inner
 callers
Date: Wed, 17 Apr 2024 16:39:43 -0400
Message-ID: <20240417203952.25503-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2468c2-7d4c-472e-d91a-08dc5f1e8d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0XNfHZCmPS1GjCYoTdXbMKU/YXfjjIdfzfrVqkZUBKvRgeXoA1u9hA2W1L5K0/SrR3DngbHydt4qF1bxpLO3sWUVhWohHK4i4gpsMeU0TzmaoLG6bxHdktvFcPijGYKFbJtgqvVoSZ0aP8TT18gLx23/ngXPIRHvjgIpSrjhi1hZWgPzp2SaFAjWAwM/3tp6DJmQsUGIXghoit1X/GKQBABuL8LuQ+ZzWz/8k5DQqzfW2GeyVvIlIaPPflIu259dL3xErPAsPeOUuDGXR2CRIem1zQYRj1L78/2Di5TEU2ENbIPlMwn0xBmkMCB7tuB1pJa8JzMcXEfbSf3f1meyq+Wvt1dzHJKqTT/Hlo1ZHSUwIVldY/OLmLcuSn/iuv7X/5XPxaaXTg+oA7U/rTBLGiWM9lts7Icq4r7iTb4i1/Od0ipbf5r8AB99eBlE7/+2FjhXaiLsRz0ZvYlhJ4NAaWUDCvzVgWFEkfm9O86JbBrRiA5LBTqJsH8Iszb4d469kN2Zil9U7OcCJVls+8Fp5+zIYyOEp59Bvx3C3gbElz6FBECRvYzcaMyF2LZ73KDyiHtMeIEnWra3X1gZjTJGsTbEhVXSLSeF5xbhTf8cyeOza4pVdXfUuD0ySSi6xFcOlCDmCQni/YxgODdIMdnx3QolkcwAnWCS0GQWQSYdqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fp5S9CQ2vvC39tsAQ/NUinOQxxl+sZ6Mp5ZKTuhlsti0e2qJa05lXqTRE8cW?=
 =?us-ascii?Q?jF6r88W9zRj9oGMRFDkBqNNidzOy1q63k+85u9D6/79oLo9EA93G/5RnZIYG?=
 =?us-ascii?Q?kNyTyAZX7VIjVsvFc1uBha7BUHwV8tvXUr+sYQZ6F0DDZdzFpmBcWOkDfenO?=
 =?us-ascii?Q?26DqnFKb7yOCJT13Nt3j6T2A/L2u1JN1ySPYEa2lJ3jPHnKX/OtFfz0b78vf?=
 =?us-ascii?Q?SCNYHHxnPtcx8N3yVvahuJ4QrkFHyIKj9xvImOqZ7RgbFXyHUv+Pgp17Q5iy?=
 =?us-ascii?Q?gufil/eJ2dJHYG5wIEo+cipSYEt8PU7etLyWmICbMhKUA29k15JVbNrLBklI?=
 =?us-ascii?Q?4Go738x3yqg5jpbMaSDCETcZvm7KXU3qROOCoijmsmK9hPDJLQ1PJInzf7rQ?=
 =?us-ascii?Q?ZIGimwGo1fvb+Bho7jlFz/Dsg5DRTOA+7AL9uzy8pdqIGcmZNO1bquKiGfue?=
 =?us-ascii?Q?+Pd1Nar5fy+usYnVhb4b3DWUaE87zR3MEHCgO0vNfv/m808IsIMcRXqq3Qsf?=
 =?us-ascii?Q?4jNqysURJVwAZ7P3URz+/XddyAUzAiwjeioOT4CXjm9DYYiKoOHfFhB0+Q5H?=
 =?us-ascii?Q?rrpgElSBmuzsEKthfQU9Mtcqd2gOpp0BcTAasjil/NbOMP69sHEcQXoFp40k?=
 =?us-ascii?Q?dCA7j6OSXUoEkjbBfqsyiP1be4iVm2dU4U9I81uVNpiKGuHaIVDraZKWLV31?=
 =?us-ascii?Q?eE91znTQKelgCGAnyAqEmHEiBkOkNVntuB1ZMPpxDGMRma3oeWPa2OzhnE6S?=
 =?us-ascii?Q?9i+aEINYX+b784WfyQG39lL0ov+4ypliPv8NG81IlyHJJryFoGNyPNx2aXCo?=
 =?us-ascii?Q?3T2l2L6tKmFKonWzeyq0k7rPQN3gHSbeJDT7xMawROTGd7M/vGO7XI4rmklt?=
 =?us-ascii?Q?mkHVK0uf6f2RnL9EIox396cxVbmkV0L73rObXvA2wquSWwuFw0wFsbB50lum?=
 =?us-ascii?Q?mXuu3DL9rANNJdHVJLAc13o8bwx+7L1b6G4puDhVBagoFkPkZ1FpvEoe/Gbh?=
 =?us-ascii?Q?uQCn74TmPNpP4LEjKUkRBnJD2rNnOgZBIGX+2B2yL2UbEv3ahZwsgyVUx/ix?=
 =?us-ascii?Q?PrBUJokhOomdtGX7ax47U+qliO/JjXA/wBMLtGkD0nT6HxR4dMRBt6L8My0L?=
 =?us-ascii?Q?FoGH3E5tnMBpOyPIwlsfjl6rBnxc+DwCivf8tzrLqCMgWi9stLRozLbi8ll6?=
 =?us-ascii?Q?eKmGx/E7LGokRnjv1p6JvLvBdN0g7bBYyy7DmcDDGvKpuqFveGIzGd8TyMZ0?=
 =?us-ascii?Q?21NSN6v9zFmCxM+TExohzwGECqL2mIHdS0JvpXJ8rpxmZHPbO7A1aRp9f6uY?=
 =?us-ascii?Q?v0f6npnOJ7X1zrcYqGnynw2oHVJZYLRYONs6hL/lHLsD17noO96aYpJxc/bU?=
 =?us-ascii?Q?ypUQaGUyx3USN0zVNSdKrwUDMoFjBcoutIOmBe+dsIRd2zZ+db01uqBHke3L?=
 =?us-ascii?Q?zeh1Cr5coou4f26GcM7fXqRJ3EUz0skiPtcTDAF1N2ncqWovqifB4RvXd9nF?=
 =?us-ascii?Q?zyhLZxPkJ4JiqrB63SkfUR4SEmzIMnBZFLJCMrsfULGbc4YOYeKh3YsLEs7s?=
 =?us-ascii?Q?Z8umjyrnd5b3gzCMI5TtkNxZdl+nfvfuYKhuOTXFrM80U0ucBf9NOuuXkeXU?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2468c2-7d4c-472e-d91a-08dc5f1e8d49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:00.5419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7AMg5rDuhoGZmaqaA74bPxZ2P9yCTVxKDjCtvlB7Iqd7zdp47NuJKVbflZYNw+DkGkF8wkbaSdt3KHTBNW4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

Let's ensure that we have an option for inner callers that will
raise WARN if device is not active and not protected by outer callers.

Make this also a void function forcing every caller to unconditionally
put the reference back afterwards.

This will be very important for cases where we want to hold the
reference before scheduling a work in a queue. Then the work job
will be responsible for putting it back.

While at this, already convert a case from mem_access_get_ongoing where
it is not checking for the reference and put it back, what would
cause the underflow.

v2: Fix identation.
v3: Convert equivalent missing put from mem_access towards pm_runtime.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  4 ++--
 drivers/gpu/drm/xe/xe_pm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h         |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 71bd52dfebcf..50ec661116a2 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -128,7 +128,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+		xe_pm_runtime_get_noresume(xe);
 
 	return 0;
 
@@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
-		xe_device_mem_access_put(gt_to_xe(q->gt));
+		xe_pm_runtime_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f3fd003b6944..37339bb57229 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -485,6 +485,26 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
 	return pm_runtime_get_if_in_use(xe->drm.dev) > 0;
 }
 
+/**
+ * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
+ * @xe: xe device instance
+ *
+ * This function should be used in inner places where it is surely already
+ * protected by outer-bound callers of `xe_pm_runtime_get`.
+ * It will warn if not protected.
+ * The reference should be put back after this function regardless, since it
+ * will always bump the usage counter, regardless.
+ */
+void xe_pm_runtime_get_noresume(struct xe_device *xe)
+{
+	bool ref;
+
+	ref = xe_pm_runtime_get_if_in_use(xe);
+
+	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+		pm_runtime_get_noresume(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if awake.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 0cb38ca244fe..119b630ad1d1 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -31,6 +31,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
+void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
 int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
-- 
2.44.0

