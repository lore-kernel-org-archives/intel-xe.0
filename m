Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E943CC77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2BD10E26E;
	Tue, 16 May 2023 14:55:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DC610E26E
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684248927; x=1715784927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/O8T/asZFHT8gAPf8neoFoFNgeNi0iOnBYfitR11eWM=;
 b=mbAKvUOKNx5893aecaEeJjHxAsFRyrGvEJelHI+yh9kYOeJd2iOxnpjl
 IZ+8TdZYwePH/HIp/IC1+kcvkfobzI72IiNnnwfnihoaBMlMMxKodKSG0
 0MnGcZO404+ChARtgwGf04lFPTf7EFd+xlkr758tTJQTuN4Z9qOU9x3sJ
 GW5DaFlWJ6/EmvFthXlRVy/2Yr/KmZb/QQcKB7Ssk+yfc2FSb7doziyEo
 c3lJ1+p8r19Bt938Y2HTN89HygbPRNpNl07zGpW+yvz3EgkqU+rJuj0nc
 8ZE52fB6kCd/sXwoGcc3PcECJMqA6Gu3DiEdpabGQsxz9iLch3qUDLalY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437842013"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="437842013"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="791102142"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791102142"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 16 May 2023 07:55:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:55:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 07:55:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 07:55:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 07:55:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEfZVtm+3Q8rURoPFdH5MAZp51BwO0awvxT2tGZeL+3/QOs+Qa1R1QNdRg387ZOf/die06SdsU280K8TQnC793G3CG21jW4hDiP1BHZ7+cED0tD+rQfZok1p8+Df7SVMDKYU6aLiO3NtwirzVr8jzrPKSusKlPzHxtKAuFv8rFFAHZko35OM8XgMtnspV/pO+/NIL+k+5ReEpf3FZqJP3HxfWbd5ZDwuwD5UzynH7QNSIcG3vBMB5tfBjyOjTKBZfymIvbbnam0VSCeVTdTQw5++YpPHW9qfqBUTzQmaSKHdfhxL54IIAEJRdxdWqSmIBRiu4LAiji34ISbTNaowgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9xPnCLOSHiC1x9SvkwJFPdeEXuKBgGzantbWC1tyU4=;
 b=JcHflpwmpiwKVmVuuZjkZqG05ulsdnTh1vtoBqknMmya0JBSjC7NBfq9kqEpUIbZUqklkoNjJfvxxqM77tDHDEriKDOcKwb7mRwCxNrhuN2BMPg1DVRKHCBXywsKrV/tTNsIEt0IrIM4Q6QxFpVjrmYJQYi22GFFaYBLrRbZaqNYBRuh9KrcsTJU/OXV2E8AExP6d2A6Iu1avyiQEIIrMwvMBY/aExF1mZNHTftBqI5b574/rcTN7YjwhhGS1sC6fbLRCiE+uePrQFKINL/Rg1egSfzxAOHPnlyEMS+/TiS9RZ7lUHMdm8Q4PcZJxmDcebZScK/nt0IN88TN9cpdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 14:54:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 14:54:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 10:54:15 -0400
Message-ID: <20230516145416.1851984-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9415dc98-2e98-49f6-fa35-08db561d84b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+XGrD6ABJ3MDLt9Rw51uhG5Cdwi98osChpstHgncKcy7Yqw6d6ujOEF+xTIuF5PRq25ddOugLvRqJ946FteTpxD/92SpKqRjIS3GmxVGbieqCBJBKfe5tv1OdlSuS6iYdzeNmYU8XuyVmjBLCjDsnLXiU89v1mG3094t0ectmm5EP/gmnZuiBbC5/yIkRDBO85qT1AwF0t03+MqCRRf/J9P5weNop/QenN4tr3K/hd0yAnjWcaIXgH9WrBWyZINejfm3/RyWBtGejuOERV0FE9l4tkJoKBi98K25It8JcB7zVkFlzQqIOmNvbZsvt19HZ4jJwgjnEMtMWQEUi/VDlw0OvKEszvdJai837We9jBo38ZK4ua7FQEhJhRiCiP49wOTKV3lMYRMvcJmkHQPlzBQDqvNCIKsLc+mIuzYCz3ezkuiguseUwrBZ6gDqqNi3KDgb1PRLtM35QRYLftDFeIeC+2EGIp1ymZ8+W7BFF46B9lFvVA73/DFms8RVZmQOcdh5bVVRT9V6Wyfn0Cb7qi6wZS1VdCrbzLOP5DjfyBTfeWlv7DF+7k/Eo9N3erU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(396003)(366004)(376002)(451199021)(44832011)(478600001)(8676002)(86362001)(8936002)(5660300002)(36756003)(2906002)(6916009)(66556008)(4326008)(82960400001)(66476007)(66946007)(316002)(41300700001)(38100700002)(186003)(2616005)(107886003)(1076003)(26005)(6512007)(6506007)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?or+1SXeqH2qwdfXNDCE4S5RsDZCxQjs+iLcviin0BAoesDY9N+CTwj4jeVGN?=
 =?us-ascii?Q?59Sk8BjEStYGH7une3sntmdXIR8r9DGS1/OsVegxXSQhqtLqSfYfzHoBWjvL?=
 =?us-ascii?Q?QmmgjkwckhXvgy7ewQCbae7lthAogP1y9StRy7p6wpxRqR/NhDS6NmT/AqAe?=
 =?us-ascii?Q?7vAzCPNiFOl4l8iqt6MlmTBQL5kU4HdVsGxW+54crw3F4kdBXsQ1NMgSixnG?=
 =?us-ascii?Q?KP2awQVrNOqbNSvtCoTObyR8+2ME3Bg6KNmD7GlYBxiHyU85zwIs3KjFza9e?=
 =?us-ascii?Q?dCexR9adLBWjL4YEO/cyMr0wiTj8bZRDGIvreSk/GyDAR/L8Z2R9+B4GcpOP?=
 =?us-ascii?Q?kuU/Phzse8Wpz9XWdktI7N5RHbDMkuDOMBo89IhAwweWchPNtH6q6m5332IW?=
 =?us-ascii?Q?HUsQxUGLyO95FbHKLSB2f1M2VRzadr+4Imwv/pDZs99sN6PrFB4SqvdX9OaG?=
 =?us-ascii?Q?neD5VEqyy66HbkP/FXrVXeaYQvlg9tX6nx+KrUFsjfX8ZPGLh6CCSKYvUY4t?=
 =?us-ascii?Q?D+pdgtpCGerSZ1DG9Xai6ct9tVZdchYsYyGuBNrzKBg0S3ZGHksNC5nxCF/j?=
 =?us-ascii?Q?wvVauiC26py9MlTrxKa/ZTtcN38LFl9tQ+PZDgFqQa3RbHWfAVdyKYw1535+?=
 =?us-ascii?Q?ychNbJphBSSp8lN0ngGwLbTZGOInuP1I7vxTHXd+hE3iL84iy73kUBcyzXq1?=
 =?us-ascii?Q?YF5KPZRMuOV/LyQmrBk4iKb2zv5d/oA92jjVlr7Bk+fKiA4WuO1WH0cs6Yix?=
 =?us-ascii?Q?O5+uNQ4EYONdpbFiZjikbc28lLibOE+1R29rJqb3X3U1aaRLkzDE/PK6hxt2?=
 =?us-ascii?Q?V8eD1w7ukBJtynBACZ+PSha9rkSiTlxYjp3WHr/s0K6vTYHQVYibNiJxDtmw?=
 =?us-ascii?Q?pYgyOhMnuBZaaY3EogCI/t+5hzQjQCwyCj9lahGWIeAQTLJ17idB+S+TigoT?=
 =?us-ascii?Q?l6Ti6NLJXTU/hhzjitbW2FQY5Jo6J/Sr4p/IYHH0aitlB18lMqwY94AO/WJ9?=
 =?us-ascii?Q?0PWLYft2oNd6uOx0yW6VeWp4/5zVJyd3x1tIaEckgTNtpZyEMq0BHyhXFGIl?=
 =?us-ascii?Q?0ds/yu56rpDzm6QgAaPIaH+ysHXzWexFIuWVuyJkwytHitd0aYNKmcrve57h?=
 =?us-ascii?Q?3XZ6HZgG/KfWmr7YqVKH2mKLPMqCe5u6k4szq0YXudkS0PUPTl3eqBSrbRjz?=
 =?us-ascii?Q?Wm/q6UUyZLC4oOjAS+PNaODLfR3S2XJR9mpgBGMio2zftK8kOpS4jW2RbHUQ?=
 =?us-ascii?Q?iLP0THMrHfv9I5aJcMn4lT1JLogdXqWdFd9do3dg7Jb+JR9uwqEwypYv3F3a?=
 =?us-ascii?Q?ZN60qJ8xUfHb9sapgAl9ztQbb4jzQqOCFyIZPpfTppNH43OVTDirFJQ3f+wc?=
 =?us-ascii?Q?BNyKIy25vnK3sH3CwcN/kJIZ880lukvNZyaAvy+MEWA7u4xN+1N2yUKjs8Cd?=
 =?us-ascii?Q?drGmfHh0kYAlQbakwU1QCM3/sYWr4xqaDUYwSDRuusX1MXCBS3BcTe8Yzdri?=
 =?us-ascii?Q?mb5QC7tnqSbosgT8p+URppTdok7VrI8huVCdKGGbgtZd9zV66NYO+pzEgmEu?=
 =?us-ascii?Q?qu78RlVoUhdPiZ3V3Ye1erYnIanFjDjbhLOylayl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415dc98-2e98-49f6-fa35-08db561d84b4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:54:58.6897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtM3ve+rGxHapA0jXXPH29DKWJw7rbN2hP+Uwd3bkUJpltOi6Tp7UXwBP1VrXWCXkncnu3Xg1BBJyLlxz8fd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v4 10/11] drm/xe: Add HW Engine snapshot to
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
v3: avoid for_each with faulty_engine since that can be already freed at
    the time of the read/free. Instead, iterate in the full array of
    hw_engines. (Kasan)

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
---
 drivers/gpu/drm/xe/xe_devcoredump.c       | 41 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 2da27ce6e116..6057649f1d3a 100644
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
@@ -91,12 +95,19 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
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
@@ -104,6 +115,9 @@ static void xe_devcoredump_free(void *data)
 
 	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
 	xe_guc_engine_snapshot_free(coredump->snapshot.ge);
+	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
+		if (coredump->snapshot.hwe[i])
+			xe_hw_engine_snapshot_free(coredump->snapshot.hwe[i]);
 
 	coredump->captured = false;
 	drm_info(&coredump_to_xe(coredump)->drm,
@@ -115,14 +129,41 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
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

