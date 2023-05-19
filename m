Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1DCC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0F110E04F;
	Fri, 19 May 2023 13:19:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEDC10E04F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502348; x=1716038348;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=IWznJDz3ubzji2J3CJYpyQMOzYYr9fEeFMtBsTTFeM8=;
 b=OFjEIwLqSfHIgqTCduirz9k9WLqqceRxsCyznNSrQ35+lrRuycSlsIoi
 fzWsmi29oUFcZvOs4a2TLB+QDCnaxoW+3M+78/8Fn+0ENOJWlvlCdSIU4
 aUzQ7NBnVkusTrlsoNCiQ3zFrtQi9qZw51UyjeFOvVkCDeuwnAD218N1w
 AVLdnzGxkzw9XX9k6+0jp03wfmaPo4bWg8hQSwBWEk1GO5gaoMQdyj+Jx
 1wHj0IkdxDfKEcfVFMm4wlE4W5cnT3ccxqvQXTdTFiyCtSDkSNsTY30JL
 3JOiPCBHXlK3TadbaRvLU5rVIhd8+nvKF495nCMZ05QW3iBDtoibrmE0n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="380582213"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="380582213"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="680045712"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="680045712"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 19 May 2023 06:19:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:19:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:19:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:19:07 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkrtXo5v4RUuLeAwK4eq9yWyjqd/S7PQOEoQG29VMXV78OKb1SexUksCO5UuvyfaZeIL3klUIZEkUW/UvMyCESgWKYpkAudIrRLqMfUr9uAIbpnqOLAPBAS/pxp9oUFyscONC5S0oJebhWG8ObmUTp1dnn9XJYJzIFS9ojkeRxSwBn0b/pu+SLKAeNHkloXkLuQYKyY3uOpdDUJr1bq1geGyXR92552CoHAqOcGQbdaRJaeDvmWfskKLnXvO5IQe6/TR537ALeHABEu9LWpGjMv0ZtFsDwSeq3C7fppn9GeFQZq0Xh2iLJ5ZNwqClCUW1JhFdyzgDkvDzqURKQm5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VY8TIvAAe9q6ucn6dJKhlrvd+T5ksAhJLX1k7qQ8sGM=;
 b=B+9I6b4MM9ecBClxfWo0g8ZloHU/5A+FOKPSBKvupDiY0yHgYtT+G5fq7r36pAVL9YH7yFVuriGDMA96/+9A32eOL+kYaooISpgxZ1Gw2Bg6BAC7EJTSvz9X0OkhdpTM6Y/w+XmOuenVG5EdbUiH/eEHOcTGWIG9+RYmrsM+E7CMJ4UjaupqGPiS2pLqnM+Db8BtWVbt/gX5gKEkubf4ohtSm1xhwjvCc36SMy5+qlm09Gm5rqKVLJvatR3ssLs2Lt95e+DzDMDMM4Y7ZlY04V/r3/Vd6Lx9+KM5a/32y2AXdlFIGA55PEF8gL3+VFZ1oF2rDUBmpK4KojaSLzoIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:19:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:19:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:19 -0400
Message-ID: <20230519131820.2020660-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ae9601-d0d1-4c3f-4bf1-08db586b9b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fXw9F7MdG9UQPKPxrqGCckCHpKm/sGrngQxMObeKHLU+C/4xo7bz07R8Qhz7hsutzg3kb1jT93bLG8jFQ4GaBzu2vmXe4QeWWGC4wPmGpOS+zNs1ebne+pmOiqoKJ3pclWVqSXJojOE7USfT+26WDQCF5J7l/qA/H7Yu4QWGOPA/9b0ouwsvg6biBywqRyAEU7WoYrVWve5n9FSJT6qeh0y1jFvSJ+FXHhI+nWkK42oF1vidKlAfjN4oQdagXyAOsOwIh/+Km4IeEMm8Uml47dwBbUPXTUehXqrmspU3LqxHzwuO787ZPpYE7aR0NblA4Ny5bKeCFHYdw6Ocowu/o8TdHQQIW2+Ys+dJQaxStltiFI0F+/7HQOoRN8Dt2sWtNSM+3DtV+UWTJL16VunOot8wgw3BVIhWlI5KCZPb7jbI6gTy/PmotE3steOHwoCAaLxf7tZm4PgvZjon+6toOXXqhXgZ1oikxR/aOTb5sUptPnCz5fbzbaVKLUkSBGTOgndU/jkNwbNtM1rEC7HpB4ds0pE33tXS04a2VoGOc2c6dKayExKqStQtn/DZvoEP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U079JRBvH0Bjx7fjzWUu66xynldJ1UlNxcZp0w1ZQ22LcMzo1ydvUwG8h+FU?=
 =?us-ascii?Q?RQ/aR7+6S4OpEh6CAoKbq0kYmdc9W31VW1nlzPMn9s0+6Y2KY8J17S2f9som?=
 =?us-ascii?Q?6q0pUgWYI0esfAEf/iem1sO+ddFsLp9P3sRLeCW/B0ASfzCMH8tveFg71sR1?=
 =?us-ascii?Q?I8nKe4J1bXgo/QPrkRaDQ4sufdmVmfylw8SuicUuAcXSJSmiqRim52NTtjw5?=
 =?us-ascii?Q?prwC78n/8QsPxR4vOxpKVFM+BwzNYTSVeShO1Z/nSTgUL/ykkVxfe5753d9i?=
 =?us-ascii?Q?790uNhC5QxUsb4hCtmaxloFT5yDuwhnGBOapwub2gjirf9UmiaU9/nt0AyUY?=
 =?us-ascii?Q?VPL8hGDXmQblwCHsKt/Ks+dXCGYDL7HzYC+bYH5np4SjsjR6fkpnOcCVwKug?=
 =?us-ascii?Q?7MyhWjlbVbVqTCyNiMSP+PLeKiPzFXDzWN4UvOG7uVbqmOs1m+XpATAAO3ao?=
 =?us-ascii?Q?f9D+NCxiqfRxPfIM521YxS7LNBBQ9Fv2cz8q2qKOq/mpmqyJVl//dvaF3bh6?=
 =?us-ascii?Q?QH+yjqd3/bqqEV3lC8+HakJ+vdbu9TmDtIYruM7OZombYpcRehWHoQJy+gVs?=
 =?us-ascii?Q?K3P+O6eRKYcE0X5KSh9xorSewEDcgev7TuZpUOK6T3Ia55U+YDdPm1Ip89Bx?=
 =?us-ascii?Q?ongJfIJNuiZ+hXXdLBOiQPGEVhkHB+VJ8sK9kqBYG1HaU2kGFwD6HcpVzzQp?=
 =?us-ascii?Q?6BiCGHg5DDlBzEs+/p86KHZZTy4GvgvN63B2Ktw4itj1mw3XBeK9HFq5Os9n?=
 =?us-ascii?Q?BpBhIMj3VmFs/sagUkq+hJc/7lweifleV7loFHVMqO5T5V+jI933Xpc+SaWo?=
 =?us-ascii?Q?Cq5s/OwWl/QxPz97IKFRNDdkMzlGdTKVBOE6cILrtgYXcOqN94d3JKMp7GOZ?=
 =?us-ascii?Q?ssOY1sCD376pQ5fEY79AfOtJYAU2WRNvaAhbbkUaPcQaf745saLs92UH+3o7?=
 =?us-ascii?Q?F8zniS6/zSYzOX9y5nn1NSmjRmk+PeibwJ6UhcChqBDeGNDXyoVbdQUJo5ls?=
 =?us-ascii?Q?dD/yCPw+cWwpWF1Ya89RyOGpe6LJKZSuNZEjqr4ZGHwOI7IBD0eYwaxeSqvi?=
 =?us-ascii?Q?KLwEtz0FkoCvnOudCoPtde5fi6D85Ru8qVr/wl2/c4Qrw26g18p2OjtCbyAx?=
 =?us-ascii?Q?dFZsC8qQHIgax+bS5w3FJHf1CuXIcNyZgYbbC0TrXSuHTNh+VvnuTwTpQP3J?=
 =?us-ascii?Q?VMKNduX3Il3AQ247gb6m5aNz4HEXu/00tdHXVPB44s/MMzi2ufYufbD09ugs?=
 =?us-ascii?Q?Q3+r6xfUibUmwSAFdg867X7sU/g0cU2rvcXwKtRyZWfq91T7Bpm3gdym0PYr?=
 =?us-ascii?Q?+MkxABkvuY696IeuZc++1FR95HRbtZgvCx6H0gjl0AeeuQDFAypYoC7lbLHI?=
 =?us-ascii?Q?8RxKqNKx26rCaEJql3v4AvOT/EWXC8IdGrGnzgcF0/xUsp05GoldG9bL+1Sg?=
 =?us-ascii?Q?JbfyiwkTCaMc9Hl9TdfksCJvHZuNBO+slriKoBZPd9auURjh5vLicqA+NzNF?=
 =?us-ascii?Q?3PNFOauAwJ+2sagxJ6GwQkPVzNCd85D7LR/9+cJG9hMfeU94ao11ayoMMEx8?=
 =?us-ascii?Q?xOWe6Q7EuzAc4ji2tcoE42b1Rw2d+K9cUxp1J7ydYuOZabDYyAsd+skPdfb4?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ae9601-d0d1-4c3f-4bf1-08db586b9b9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:19:00.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjkHWZ/9AAnMCGzL76C2k3hRfU3laihVOlpll4xbvvcv6dmIdYdP1NMhH6Br5DPLZL2+8d+rCEwLKhHeZL2Brw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 10/11] drm/xe: Add HW Engine snapshot to
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's continue to add our existent simple logs to devcoredump one
by one. Any format change should come on follow-up work.

v2: remove unnecessary, and now duplicated, dma_fence annotation. (Matthew)
v3: avoid for_each with faulty_engine since that can be already freed at
    the time of the read/free. Instead, iterate in the full array of
    hw_engines. (Kasan)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 41 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 7296c0137b47..f53f4b51233a 100644
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
@@ -63,6 +66,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_printer p;
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
+	int i;
 
 	/* Our device is gone already... */
 	if (!data || !coredump_to_xe(coredump))
@@ -89,12 +93,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
 	xe_guc_engine_snapshot_print(coredump->snapshot.ge, &p);
 
+	drm_printf(&p, "\n**** HW Engines ****\n");
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (coredump->snapshot.hwe[i])
+			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
+						    &p);
+
 	return count - iter.remain;
 }
 
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
+	int i;
 
 	/* Our device is gone. Nothing to do... */
 	if (!data || !coredump_to_xe(coredump))
@@ -102,6 +113,9 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (coredump->snapshot.hwe[i])
+			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -113,14 +127,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 {
 	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
 	struct xe_guc *guc = engine_to_guc(e);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	u32 adj_logical_mask = e->logical_mask;
+	u32 width_mask = (0x1 << e->width) - 1;
+	int i;
 	bool cookie;
 
 	ss->snapshot_time = ktime_get_real();
 	ss->boot_time = ktime_get_boottime();
 
 	cookie = dma_fence_begin_signalling();
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
 	coredump->snapshot.ge = xe_guc_engine_snapshot_capture(e);
+
+	for_each_hw_engine(hwe, e->gt, id) {
+		if (hwe->class != e->hwe->class ||
+		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
+			coredump->snapshot.hwe[id] = NULL;
+			continue;
+		}
+		coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe);
+	}
+
+	xe_force_wake_put(gt_to_fw(e->gt), XE_FORCEWAKE_ALL);
 	dma_fence_end_signalling(cookie);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
index 7c6453224139..350b905d1797 100644
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

