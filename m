Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76A8C7EE22
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 21:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7610E038;
	Mon,  8 May 2023 21:09:12 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5810E15F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683580149; x=1715116149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oRpcZB4geDLb+QlqVrnrj3MvD9am4lR4uYNNM7FL4BI=;
 b=hqFI6cAoaNGmZTtYhiFqcYEIwuafPcziY40nhgIYplHSy3B7/T3/b2qY
 mlkyo0HJiaMyCHFdMzmgp0jswDr75b212douS+31d6nJiLxTgteJuOEl0
 LPmTHh+A5M9hr5AjDzSmXpwN+usm8/DWR2T16O/x0va9Xb3R8msGilCSz
 MLP9BFX1wT+3jKQJjtclltNON98aVGGA6ce/+Sk8saavI3dnSIJQCn0XJ
 Q1l85gWMf7wHaUBR0eNt5IymANL+5oZuK4tqDZO5gW+hTBf7Z3nFiYj27
 RsVJspJnwb/pLkx6XEFBGFzVSoMHjgjvoPsx7g7YT5uogsbhwwM88RcHk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377851221"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377851221"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 14:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729223129"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="729223129"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 08 May 2023 14:09:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 14:09:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 14:09:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 14:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0uD60E16jOysMAxLj5e8pDzNMxTXhMKC11lERNPUvyqfAyLrFZZR2yre/O+zzCVu7dCQN0CuGHEbWH0yfiFmAvz7Vic21unBdvjElHLsg66W3Fn7THqEU96rKQADCB8p5XOTYJGprl/vZRGtG7z7kHc8KhjEO4T1JB14qYJtgzGV6pTzQ4AlfgOYZqemu2bWOoTjtj++Ofjgl5By1vmY19lqvkp/bQ5zB22J5OLTrNuehh4PhgkPDAyrgeV2DyRV4cEB5jCfSFVKz5VyOGtPwzbniof6HsEq9wbtraPazd6ZxCTjR+XLchdpOz+shW/+iQP9PE+xlWTyH4d0HIrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obZmKJX39tNxzMRjylhqjK9b32JcdIqelpm/64ukpzg=;
 b=C2jyTVkOE2MtYTBD6JeZ/RKfWkCM6Z4X8bBeL69BNkf8TkocuHnac4XXDoUYTyEWXITbXuUG1VPhnH0m8ja6hbZQwiQaS0FFnLGXEfYJEQrDEaSB5A34ZOtu5Y1FtXaLxyKzaGGS25y0N1Ev2WqIAkGabGAeY9a3iW0m1XH+EoDc04NK5+HK1GX1ABkwUFdQmw+1vTYNT/mWQmPeZ9H74oJe0amNG1GU10DPBONhFL+Mo5bv1pGwcfarvfos3+fzkVUDLDlpCTc4cBXc/hXiUhio+0j6R10wC56/rzDZ07mAxSBbkWKlpyBCtEU3rp+Vgkz7a9nrX3wnlgS8MgPGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:09:06 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:09:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 17:08:24 -0400
Message-ID: <20230508210825.1405432-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: de5d3073-a3cb-4011-ff05-08db50087585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEngu400JNmsixQhhxcJsoeNDKnCq9sk6mcd7vOzjHao4eCmNGYdVGZrTdi6X1YLOg81qNqr+0Nfknj7y/VqgGGOlNrnbYjKO0GG3NgaDxNPUD8kgnRX5hTKTOFK+TWbtcWQN3FYnzYhaZTywhK4xs2fKM4r4GAILPtUVrEzxMX+BGedU+S84kbYzr4GVpK+jv+eiVz354n087xOz4EFdrAuz5GdhWZWysYIPhwedaUl1BIxnDNrpy/ng8oeeeTJix/+kLPaseqavnCjm1rR8eNDl1Ld/w/Xnr4BzyGQKRBy1iR+tQKT0F0YR39qrGQoZlQ1Iaf5r261xbjK5LFYf0JWJvMvvXbXTD+xM4ltaWJu3sLuU5EruRTYjlYI/aG0+BYqHOqeNpul3DMkqM1vki/GrYNVk/uDaDa7T84ndN7C7i25fe1t4kGAgVkTAeF+KB3O692aDYqK8RK76OHqmuibtxIZnZMb79M4+uw/B/Ieu1uAdEY3iFYqYP/XDunEhkQSLU30aFoS67+8CTsruknGsm+4GKlV68B4PjyRcXAKsRzP0zYbriF6WKtRZTor
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(86362001)(66476007)(36756003)(54906003)(66946007)(316002)(4326008)(6916009)(66556008)(478600001)(6486002)(5660300002)(2906002)(8936002)(8676002)(41300700001)(44832011)(38100700002)(82960400001)(186003)(2616005)(6506007)(26005)(107886003)(1076003)(6512007)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YwlFAXf/Sfw918vgh+DgB+Gv/MJ4MmbjSab0uhgQk5uu/OlQiO3qZO3rDzhH?=
 =?us-ascii?Q?l9PUUT4jBCNG8mYX9ERYhZTFNKRJAEcAD7KAVqK6Hxn76UrrTZ/qYcynsGKb?=
 =?us-ascii?Q?CRAaS/YaRwW5JOLp3galQjSoJDSLjqWrw7wekkCttgHaGRN4d/a7aKH2O29h?=
 =?us-ascii?Q?Tu8/+lvuuAigOXsSqbnxamEUsR3xrjasDgTRL8bzKNIgnE/N2zGuKxJtFgBY?=
 =?us-ascii?Q?ZyGc1AkmIAPPLdn9yJxeg7Ag5umTXGqCeiT3lMScXgmO1WX/1HsIjyTaHvpJ?=
 =?us-ascii?Q?vq/VyK1Qs5mV53DoyHsQbQPceGXdbgvMVb9dXOJeUV9JYuftiIlAjv34bPgs?=
 =?us-ascii?Q?bmqluQOLhe6LRbChUY+sOUXDefPNqneOjh1I0ze6mHeNS1mPSEjq3U56qMrf?=
 =?us-ascii?Q?BxoC+9yP7OzgTzT0iZmae4SRaVXxWN8nSGRlsfOMC5cT5kGezgQMXtBUICWi?=
 =?us-ascii?Q?Ve8sliCAZuaORjJpzYyuNIPrXD26WtkrwPg/sHkWsVVhXFdDsVnKZXne1DdS?=
 =?us-ascii?Q?o41BvxXrWJmS8h3Q7w41rBdwGBVYPgikGp3DXQvhNSE1ICPzoSZU7Z/9egNu?=
 =?us-ascii?Q?DLmSs4XMG+4X0CR1tpvBLdnVzJiYtcE83kAeNLJFSWwSb0wYls8y5OxqJBy6?=
 =?us-ascii?Q?DvqPAk12gEh/3oFYOMJNVVa5xZnQjzHXm3Ab3cKxNx/TZQ7iMvb4YEFmhud3?=
 =?us-ascii?Q?ioe10LL5S01lDGNdwmpjq3YDUN6GJf/B6bNDmYaBZZjIcJ+EW2zGhIVG/YPR?=
 =?us-ascii?Q?ZWHTlaoCRYttslevSmmvE/oW1xHwx/a5n+ngUYTyWfWcBiGgCj/9wzTmmVv3?=
 =?us-ascii?Q?/n8PgcPmLy2KR6mvzTmdey3SoJzweXbDhbH50pOUrcRNXyisuNjuHDc47HsV?=
 =?us-ascii?Q?9vHwywoqCX+7O4SFMGqAxCkV+oMwV+tlhwPkDOZX29OFZpD/4g7FVCNzTfJm?=
 =?us-ascii?Q?NeSe4nxzkn6vU0tT3SVltOupRAilxA/8cEuU+m9orqppQjKduRp4fAZTwttA?=
 =?us-ascii?Q?Sl68wTRBsF/xfeN0Put7Uq0qP7/TnIKJu5owcQ05KIEvvbL6OwXwqAcJfwdZ?=
 =?us-ascii?Q?ze+Q8mtsjfSWI2O3YWK3UkKam8wkexwFXJdXFaI2HaFu/ILB8Zf3PQ/+VMMu?=
 =?us-ascii?Q?yz5ACxHdZgev8Af/NKvImFHFNmxJJcWTGRLLHWetUgitKxI6rRvh6JRgXtRr?=
 =?us-ascii?Q?u6m6p8cGuIKIVPd0DiRKzBz1F9WCKvGhrjdAKZbaSVaXts5lA233GaxlPu/7?=
 =?us-ascii?Q?dnsCOJOhvsZ1NbY2eiXJFiJkFDwLVMs1sGCJvvHSedPyfdbnbYF8RzuH4ivY?=
 =?us-ascii?Q?jEM19OdmzJepapjL3pIqhsIhdTBNtOBIFykY3V+F5yFD3kX9s/KXGqXbtIQr?=
 =?us-ascii?Q?MHRhjCH321yhj6wCEE/myxDV8Qeu3ZdH6Uxam2tyu2dhGtn35NdKxlOcKHzc?=
 =?us-ascii?Q?JrCy4ETniuCZaSdL9YmTFhMk+U3jcWk3fGcFNp5bekIs3l4hpQyzA/uWKK4j?=
 =?us-ascii?Q?PC/pV09V7eLWqRsw+yJOgybdTFvHQ5kwbkfQBJ82Thy5Bb30v7hciPCgu2/d?=
 =?us-ascii?Q?41vLuTqYoafcJfcm19Ia1RWVlZHKExWV/KyKXzlaY0+8SvijzFzoaNScKuG5?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5d3073-a3cb-4011-ff05-08db50087585
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:09:06.7130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxpyPY+9CLwS/JGR7xHWrwYlsHdqIUbaUhMdst9KAHt6d2lorlC14g2WUHmVS0oRIbqrJ3ES8Hh2iUhERrakqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v3 10/11] drm/xe: Add HW Engine snapshot to
 xe_devcoredump.
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

Let's continue to add our existent simple logs to devcoredump one
by one. Any format change should come on follow-up work.

v2: remove unnecessary, and now duplicated, dma_fence annotation. (Matthew)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 43 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index b9f343c74828..2175f1ef0501 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -9,10 +9,13 @@
 #include <linux/devcoredump.h>
 #include <generated/utsrelease.h>
 
+#include "xe_device.h"
 #include "xe_engine.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
+#include "xe_hw_engine.h"
 
 /**
  * DOC: Xe device coredump
@@ -62,6 +65,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
+	struct xe_engine *e;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone already... */
 	if (!data || !coredump_to_xe(coredump))
@@ -75,6 +81,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	mutex_lock(&coredump->lock);
 
 	ss = &coredump->snapshot;
+	e = coredump->faulty_engine;
 	p = drm_coredump_printer(&iter);
 
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
@@ -92,6 +99,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
 	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
+	drm_printf(&p, "\n**** HW Engines ****\n");
+	for_each_hw_engine(hwe, e->gt, id)
+		xe_hw_engine_snapshot_print(coredump->snapshot.hwe[id], &p);
+
 	mutex_unlock(&coredump->lock);
 
 	return count - iter.remain;
@@ -100,6 +111,8 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -109,6 +122,8 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
+	for_each_hw_engine(hwe, coredump->faulty_engine->gt, id)
+		xe_hw_engine_snapshot_free(coredump->snapshot.hwe[id]);
 
 	coredump->faulty_engine = NULL;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -122,13 +137,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump)
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_engine *e = coredump->faulty_engine;
 	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = e->logical_mask;
+	u32 width_mask = (0x1 << e->width) - 1;
+	int i;
 
 	lockdep_assert_held(&coredump->lock);
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
+	for (i = 0; e->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
+		if (adj_logical_mask & BIT(i)) {
+			adj_logical_mask |= width_mask << i;
+			i += e->width;
+		} else {
+			++i;
+		}
+	}
+
+	xe_force_wake_get(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
+
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e, true);
+
+	for_each_hw_engine(hwe, e->gt, id) {
+		if (hwe->class != e->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
+			coredump->snapshot.hwe[id] = NULL;
+			continue;
+		}
+		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe,
+									   true);
+	}
+
+	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index e055b266af70..8b17ecf1b6e6 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
@@ -9,6 +9,8 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 
+#include "xe_hw_engine_types.h"
+
 struct xe_device;
 
 /**
@@ -29,6 +31,8 @@ struct xe_devcoredump_snapshot {
 	struct xe_guc_ct_snapshot *ct;
 	/** @ge: Guc Engine snapshot */
 	struct xe_guc_submit_engine_snapshot *ge;
+	/** @hwe: HW Engine snapshot array */
+	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
 };
 
 /**
-- 
2.39.2

