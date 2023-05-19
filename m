Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8B4C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 13:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E99610E021;
	Fri, 19 May 2023 13:19:01 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08E710E0C8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 13:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684502338; x=1716038338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=l+Z74YeIzQ3aFJxsomL+KoNFqVMrZjMTCLfAaO3zPlA=;
 b=fWZasnbbQ/P9gPLk7m8AZbHJXj5/qJ1YIwQjVmobrdlIZZhN3llvveZB
 iaflnMbQu2mUj+o5r6A5rYI3CF2sGzZu86cwKIBqLNKrodktTi8f2tYoX
 Bw/XphyXvxM/XAVAIxh4WBvao27ZF/chlCdpuo15BVdQ0WgCjJbZyU2gf
 VQoFTaCSbMNPnAre/LoBEJxwhznr1J4BgdZrfu+ym/SBI78T3GSA2fORS
 WC3YcfdHKyXvN9j7x+x7CG0dl7yEfNXXpxUm/d6+3ZvWDNN02q80/G4Zn
 HRv/lHA4pawcRGXcalA6z8/nsKoXjYQYgv99Q2QCDRmOeDqTifVGlasA1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="349881872"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="349881872"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 06:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="767612821"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="767612821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2023 06:18:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 06:18:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 06:18:58 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 06:18:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGjcKd8ZSXE93bKmeaQpwlOMLm7Bab7nRJiy2AKqQbLZPddLjnC0d4pZqHTVjS/2atTBPp3FeFRMEVj+vi6MbtuTBNzpQn08T429Qp4HwMhOARuX4t5l5G0d0jXHGUuhGWVexcy5prBnsAg6rvr6bIuL9+4GX6Fmbvy0nPqWbHI/8NtpSQ6ibteqrlQ0cekaxXekq7O5LOY7Uwjjl9Qtk4HMI0Qawki6dVQHfUPKKxeT16YAB1PnJcr2FQy/agdfrqRAFEuJ+zdwexQNDP/fgNU8wPfGKkPQFw+THzZUZeW+QYqsAWU7CjviPoEQ9AeQ6Du4lyZT7THpgigPPlECQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4rROtbxq+Z/zpgg3+k+XBe4zI8Ldp5zJPDvOAZnlqA=;
 b=QHPApYERpYHJ32hOnrPrwBHu9iyynxrH5MfMyENyrpeFZT9zwCLR4lonU5WBDx0R94E7MCle0S0r1fswriokYOio0IFjRw4wj5opA/ckko6jTeO/0RiQ/1VqUZ+wuBQr/5eBAJscEmTE/uRhCfB7PwYjiqCBW1QqVvt0lxTsNQkZ9cFKnNX75fKGXiBENdVqCetNgEFu3jLZk03QRA/gBVDJdgoymrlDG4ZHGwvHcludLlbmDq5EJkwPEnMiB1IC0Gwk/ZWpsEXqofEwbHlShrB1rVDBRxQ2ohwD6Lk2yOAaXSm6vFwS9YA79Y4DsbEumi/b4UEUXrycLgynQeALtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 13:18:55 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 13:18:55 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 19 May 2023 09:18:18 -0400
Message-ID: <20230519131820.2020660-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
References: <20230519131820.2020660-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: f18e695e-f4e6-4080-c8a2-08db586b98d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FB8Ce3QuGO9ML6wCx5uQN7wYaYPRg4ryb/Y62zvHlc4w/6Z8a6A+8cyk7TvQV+iLBE5rJawWHdxrMUffl9i1QYy89uGgYhimtZ7pNc63KFsg+8xH72+vjbCV06le6D4hCOjgyds5dwqzuDLlYRw0RmKbtFYRasFR/vugf04Zs7hUv5yRvW893o6Ktn5ETPX8kdSz+d/EkWsKuC9TefwNuIQsWKbv2SmcbbHLEuvJQqpCi4++OWi3SOVP3U3YtQC//5uG0nWiaFSzFSaiYe96pUC/iiLoOWz7nWTFf0MJ7R0/no3/uX8/o11XEWsXXhlby1XtpY4oAT4D9kl0t5nQb8Wy2j+sDsSySIzwOmXt5JJ+2VOtwvi6POByHL8SL0P+e3Fy4crXx7iAqbgIi7kD5GjdYRbtzYG7+gI1XkEyoP0M/3YJJT46GtoUiq0/dFEOarG0PrCaxU6sL5mO/z36Nc+tWo6rMG6glITx7vY7Sgur5FIA8ouTScvVRjT01xASAp0dQQEIhmcI0nl5eZ4Pk9MNCMMnIL9/dRH53R/xq0mgd2paGDr4jzTyse2snL8+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(5660300002)(478600001)(66476007)(66946007)(66556008)(2906002)(8676002)(8936002)(30864003)(316002)(6486002)(6916009)(41300700001)(6666004)(44832011)(6512007)(6506007)(26005)(1076003)(186003)(82960400001)(2616005)(36756003)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?liBdzh1fXQaQops7QSjLeBLm33t/IWJpPflW/d+Yf1H+l5HYJINLbuOnK8f0?=
 =?us-ascii?Q?gjLRyjwjvlvXgNZjD9B93OO10T3KrcN8Rxmj9osiwmOzVjhmQT62P9IPheV+?=
 =?us-ascii?Q?A2SMbRKm32Rhm97s2gQYcCSJMOLioU4UtZt5fozdcAYHszCKLxqO8mZjZj00?=
 =?us-ascii?Q?2MZ/WmxtvcY8Q1WtzK1rpS0SeyvNNQH6MXea1uTbtkkAhcqsJQo9UMknff5k?=
 =?us-ascii?Q?mO9AujECpRDoudeZVRWaR/mGOzVFKRjxTFPfBjLHe5TUMt9DZtIEfH/eSmz8?=
 =?us-ascii?Q?kfgA3ysMasLWB1dPKEVz8mppWkbVtITM/NycllMY7rXl7uYXjhe17DaUa6TU?=
 =?us-ascii?Q?OFmopiTUDqcZQNq0Hog3CNzqtoHQnGVqzm7gzZmVHdzUhA0Upe+DrcFw3CPU?=
 =?us-ascii?Q?0gIEKsfq2RceCMHLLu+J0PuGsdJwGbLHkrBNXDp+0IDwvsjpMOLciHXxe15P?=
 =?us-ascii?Q?43mbO1980YE/qL0GevFZIzpZtJxqYnCmeuE67Za29VshxuysppWLmrZ4ku3L?=
 =?us-ascii?Q?zKcwm8eRzcYldn1JJswQ/8499pXtatMxD6BH5Q9GpAaYw2U80ncaK4gD2qeZ?=
 =?us-ascii?Q?XEthXbBWeuDx5auFE+USnS0BfrNKrGZPFSAlOZDVtBiWFBs3T4IcngjxHKK5?=
 =?us-ascii?Q?QnU2AXiJW6sQAry3C1u2NjTkOfY2dgZzxtf1vvcstTNnXetPVWUMOX8sEgrU?=
 =?us-ascii?Q?bDoNstUtaHI1dyCg4VfKE+7f7nUjs7iEjFRduHmhxq83qhXhvsoUTetywBJt?=
 =?us-ascii?Q?T1OAgFznB65omFG4dFgp+Hyn6j+1FCaoeMtVMg/xEr+QBXVm0zGlskhdPZld?=
 =?us-ascii?Q?yFNFkyAg/xU5QieIkQNR13GsPXxOKUpYuxb8aQrwnc0AD98/kESLwuceQVVk?=
 =?us-ascii?Q?vXd2avZhs6uUVq1pDIQDl/fo2Jxo4JP3psSdgsKWh1X0xdKobQ/ZRTtx4gJl?=
 =?us-ascii?Q?W0kDrH+eEJUDxJ+VrBrtdPD78Hq2hQxXAWj1rbrUuszGmEv2WwqGVG4TTQr4?=
 =?us-ascii?Q?goMV7S2FVwOhFaSZgTEk0bzHtBPuRMokrcF2o2gODdEE7KYoEI+evu+4D61T?=
 =?us-ascii?Q?d7dAUZgzYhlnbDCJtnbQHQ2g7/pvX4rT2pn/eh00FZundhQEiS/co44GLj5a?=
 =?us-ascii?Q?C+Tz5Ql7+uXP/I1+U2Cc7jNG1Qz3xOMcKSPOWA/GA7gUatticlB2k0foOhmd?=
 =?us-ascii?Q?MM6aU7qO6oYmmwXaOFmY7rAXcdaM5ZECLofECyL+jy8RFwdi4CiQB5olHvh3?=
 =?us-ascii?Q?0EASLFMDbmsCKSwqDAmIlIj05ogKpjROApCq4q8eQMoYkFrh4jjSdHpHle1H?=
 =?us-ascii?Q?3sFjv2qMAt4480HIn3kQozUGt4s4L65cyiru9WoqDS++QlGOmRKjXxk4JyO+?=
 =?us-ascii?Q?1S1TkTxsIS5Ls4nhPGAipbDYcUJsq0br5pXsnER92/Tc/XiE0hSy72Orr5Jw?=
 =?us-ascii?Q?CpL/3yzUPNekBEyvnbRPqOOw83iptnuvasoAVTAwvfBOKLhD5Sk22PzuRQdT?=
 =?us-ascii?Q?WWleJhEZS6UlI4OxcvUXzY+4vqr69z67UfiUrmxu8FDYGN/uTN8JMd1YQ2/G?=
 =?us-ascii?Q?8SvvqyaqcFnzwuyp0HD2BhWRn9ijAfzO5+k4DXghodlkINbl91WkXaYI2qvg?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f18e695e-f4e6-4080-c8a2-08db586b98d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 13:18:55.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNam9gdrx1dthWFjJ1lEPquaaowI53G8RakNBFbYVDUKt18+uzqG5yxvR8fpUv3wPsONOBKnf0KVqKkAeIm91g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [CI 09/11] drm/xe: Convert Xe HW Engine print to
 snapshot capture and print.
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

The goal is to allow for a snapshot capture to be taken at the time
of the crash, while the print out can happen at a later time through
the exposed devcoredump virtual device.

v2: Addressing these Matthew comments:
    - Handle memory allocation failures.
    - Do not use GFP_ATOMIC on cases like debugfs prints.
    - placement of @reg doc.
    - identation issues.
v3: checkpatch
v4: Rebase and get back to GFP_ATOMIC only.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       | 209 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_hw_engine.h       |   8 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 +++++++++
 5 files changed, 240 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c45486c2015a..8bf441e850a0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print_state(hwe, &p);
+		xe_hw_engine_print(hwe, &p);
 
 	xe_device_mem_access_put(xe);
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cc8191dfdf89..b209e4c2a3a9 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -751,7 +751,7 @@ static void simple_error_capture(struct xe_engine *e)
 			if (hwe->class != e->hwe->class ||
 			    !(BIT(hwe->logical_instance) & adj_logical_mask))
 				continue;
-			xe_hw_engine_print_state(hwe, &p);
+			xe_hw_engine_print(hwe, &p);
 		}
 		xe_analyze_vm(&p, e->vm, e->gt->info.id);
 		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 751f6c3bba17..71ac4defb947 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -574,77 +574,174 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 		xe_hw_fence_irq_run(hwe->fence_irq);
 }
 
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
+/**
+ * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * caller, using `xe_hw_engine_snapshot_free`.
+ */
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 {
+	struct xe_hw_engine_snapshot *snapshot;
+	int len;
+
 	if (!xe_hw_engine_is_valid(hwe))
+		return NULL;
+
+	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
+
+	if (!snapshot)
+		return NULL;
+
+	len = strlen(hwe->name) + 1;
+	snapshot->name = kzalloc(len, GFP_ATOMIC);
+	if (snapshot->name)
+		strscpy(snapshot->name, hwe->name, len);
+
+	snapshot->class = hwe->class;
+	snapshot->logical_instance = hwe->logical_instance;
+	snapshot->forcewake.domain = hwe->domain;
+	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
+						    hwe->domain);
+	snapshot->mmio_base = hwe->mmio_base;
+
+	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
+	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+							   RING_HWS_PGA(0));
+	snapshot->reg.ring_execlist_status_lo =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
+	snapshot->reg.ring_execlist_status_hi =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
+	snapshot->reg.ring_execlist_sq_contents_lo =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_LO(0));
+	snapshot->reg.ring_execlist_sq_contents_hi =
+		hw_engine_mmio_read32(hwe,
+				      RING_EXECLIST_SQ_CONTENTS_HI(0));
+	snapshot->reg.ring_execlist_control =
+		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0));
+	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+	snapshot->reg.ring_head =
+		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
+	snapshot->reg.ring_tail =
+		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
+	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
+	snapshot->reg.ring_mi_mode =
+		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
+	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
+	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
+	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
+	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
+	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
+	snapshot->reg.ring_acthd_udw =
+		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
+	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
+	snapshot->reg.ring_bbaddr_udw =
+		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
+	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
+	snapshot->reg.ring_dma_fadd_udw =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
+	snapshot->reg.ring_dma_fadd =
+		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
+	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
+	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0));
+
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+
+	return snapshot;
+}
+
+/**
+ * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ * @p: drm_printer where it will be printed out.
+ *
+ * This function prints out a given Xe HW Engine snapshot object.
+ */
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p)
+{
+	if (!snapshot)
 		return;
 
-	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
-		   hwe->logical_instance);
+	drm_printf(p, "%s (physical), logical instance=%d\n",
+		   snapshot->name ? snapshot->name : "",
+		   snapshot->logical_instance);
 	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
-		   hwe->domain,
-		   xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
-	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
-
-	drm_printf(p, "\tHWSTAM: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
-	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
-
+		   snapshot->forcewake.domain, snapshot->forcewake.ref);
+	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
+	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
+		   snapshot->reg.ring_execlist_status_lo);
 	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
+		   snapshot->reg.ring_execlist_status_hi);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_LO(0)));
+		   snapshot->reg.ring_execlist_sq_contents_lo);
 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe,
-					 RING_EXECLIST_SQ_CONTENTS_HI(0)));
+		   snapshot->reg.ring_execlist_sq_contents_hi);
 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
-
-	drm_printf(p, "\tRING_START: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_START(0)));
-	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
-	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
-	drm_printf(p, "\tRING_CTL: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_CTL(0)));
+		   snapshot->reg.ring_execlist_control);
+	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
+	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
+	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
+	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
+	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
 	drm_printf(p, "\tRING_MODE: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
-	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_MODE(0)));
-
-	drm_printf(p, "\tRING_IMR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_IMR(0)));
-	drm_printf(p, "\tRING_ESR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_ESR(0)));
-	drm_printf(p, "\tRING_EMR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EMR(0)));
-	drm_printf(p, "\tRING_EIR:   0x%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_EIR(0)));
-
-	drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
-	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
+		   snapshot->reg.ring_mode);
+	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
+	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
+	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
+	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
+	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
+		   snapshot->reg.ring_acthd);
+	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
+		   snapshot->reg.ring_bbaddr);
 	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
-		   hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
-		   hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
+		   snapshot->reg.ring_dma_fadd_udw,
+		   snapshot->reg.ring_dma_fadd);
+	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
+	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
+	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
+			   snapshot->reg.rcu_mode);
+}
 
-	drm_printf(p, "\tIPEIR: 0x%08x\n",
-		   hw_engine_mmio_read32(hwe, IPEIR(0)));
-	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
-		   hw_engine_mmio_read32(hwe, IPEHR(0)));
+/**
+ * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
+ * @snapshot: Xe HW Engine snapshot object.
+ *
+ * This function free all the memory that needed to be allocated at capture
+ * time.
+ */
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
+{
+	if (!snapshot)
+		return;
 
-	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
-		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
-			   xe_mmio_read32(hwe->gt, RCU_MODE));
+	kfree(snapshot->name);
+	kfree(snapshot);
+}
+
+/**
+ * xe_hw_engine_print - Xe HW Engine Print.
+ * @hwe: Hardware Engine.
+ * @p: drm_printer.
+ *
+ * This function quickly capture a snapshot and immediately print it out.
+ */
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
+{
+	struct xe_hw_engine_snapshot *snapshot;
 
+	snapshot = xe_hw_engine_snapshot_capture(hwe);
+	xe_hw_engine_snapshot_print(snapshot, p);
+	xe_hw_engine_snapshot_free(snapshot);
 }
 
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 013efcd6d8c5..7eca9d53c7b1 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -14,9 +14,15 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
 int xe_hw_engines_init(struct xe_gt *gt);
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
-void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
 u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
 				enum xe_engine_class engine_class);
+
+struct xe_hw_engine_snapshot *
+xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
+void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
+				 struct drm_printer *p);
+void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 2c40384957da..d788e67312b9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -109,4 +109,82 @@ struct xe_hw_engine {
 	enum xe_hw_engine_id engine_id;
 };
 
+/**
+ * struct xe_hw_engine_snapshot - Hardware engine snapshot
+ *
+ * Contains the snapshot of useful hardware engine info and registers.
+ */
+struct xe_hw_engine_snapshot {
+	/** @name: name of the hw engine */
+	char *name;
+	/** @class: class of this hw engine */
+	enum xe_engine_class class;
+	/** @logical_instance: logical instance of this hw engine */
+	u16 logical_instance;
+	/** @forcewake: Force Wake information snapshot */
+	struct {
+		/** @domain: force wake domain of this hw engine */
+		enum xe_force_wake_domains domain;
+		/** @ref: Forcewake ref for the above domain */
+		int ref;
+	} forcewake;
+	/** @mmio_base: MMIO base address of this hw engine*/
+	u32 mmio_base;
+	/** @reg: Useful MMIO register snapshot */
+	struct {
+		/** @ring_hwstam: RING_HWSTAM */
+		u32 ring_hwstam;
+		/** @ring_hws_pga: RING_HWS_PGA */
+		u32 ring_hws_pga;
+		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+		u32 ring_execlist_status_lo;
+		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+		u32 ring_execlist_status_hi;
+		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+		u32 ring_execlist_sq_contents_lo;
+		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+		u32 ring_execlist_sq_contents_hi;
+		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
+		u32 ring_execlist_control;
+		/** @ring_start: RING_START */
+		u32 ring_start;
+		/** @ring_head: RING_HEAD */
+		u32 ring_head;
+		/** @ring_tail: RING_TAIL */
+		u32 ring_tail;
+		/** @ring_ctl: RING_CTL */
+		u32 ring_ctl;
+		/** @ring_mi_mode: RING_MI_MODE */
+		u32 ring_mi_mode;
+		/** @ring_mode: RING_MODE */
+		u32 ring_mode;
+		/** @ring_imr: RING_IMR */
+		u32 ring_imr;
+		/** @ring_esr: RING_ESR */
+		u32 ring_esr;
+		/** @ring_emr: RING_EMR */
+		u32 ring_emr;
+		/** @ring_eir: RING_EIR */
+		u32 ring_eir;
+		/** @ring_acthd_udw: RING_ACTHD_UDW */
+		u32 ring_acthd_udw;
+		/** @ring_acthd: RING_ACTHD */
+		u32 ring_acthd;
+		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+		u32 ring_bbaddr_udw;
+		/** @ring_bbaddr: RING_BBADDR */
+		u32 ring_bbaddr;
+		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+		u32 ring_dma_fadd_udw;
+		/** @ring_dma_fadd: RING_DMA_FADD */
+		u32 ring_dma_fadd;
+		/** @ipeir: IPEIR */
+		u32 ipeir;
+		/** @ipehr: IPEHR */
+		u32 ipehr;
+		/** @rcu_mode: RCU_MODE */
+		u32 rcu_mode;
+	} reg;
+};
+
 #endif
-- 
2.39.2

