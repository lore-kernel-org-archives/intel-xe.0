Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8521DC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4817E10FE61;
	Fri, 26 Jan 2024 20:31:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0311510FE61
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301099; x=1737837099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wm9MyYVROEeKtdWJ/bojKRZPozPTI2z9izoa7OYcIdk=;
 b=bEw+Y8oSDCNwRn316xgODYc6zR1qizKo6XS5Ic1h9AZiiWewgrXZsIeu
 7woXlQuoHLeAa815b+FmTHzkx7T9Yp0azyiMu9Q7Qn6qD4oq9o0U/qiF0
 Vrj9JPHHeS3f4+my+CN/t4mbDrVN3RUxrV6PON7EQG50bCjq4Q9xgpBxL
 CQuC4HcjRUadOnkP4a2Dbkxhbu9sOdJRGJ8ZoMZVXv2goZIDC1wAmawsZ
 byDxfvtWBzpmnZrHlEdg/OkDRps/4C9j956uHbj0FgN5GkOpm24SAf5tD
 OfzMx8aXbiPM/1ncyoVGQdL7VIfi6hMc0cHP5e9sJaetQXfFD0gYItAax A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9948610"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9948610"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877482002"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="877482002"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kn3Rga/DvF01kDklZJk4d1T5WntaHFsL4koT2PrXnycu3hR6tlgcPYWBpVbtelRu58DYy7p9x60SFlBSSqa9OqDTje0GbEJSJtB48eN6fSWym641kQYXcyK7Q/Hby6D7FyPFKCVxAkNWup+RjLqDX/aJsp/AK5xoqmRjefnm7zx0oHVx4hjtDhwnYQJ6I+t0GnnQohAMdc/dIFDDD69NCV7BUa6FCvQhM80osYnAulRKkoP4d3IW5TwlVHlD9eFAHtIFzCEwpix0QpWIFdlNWeZH+tCr/wT0p/4KuCHA8jnpRd1GoZBBNTmfy4QjMs9fS7AT91oCM/GfMOvRlg4nYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8enCCT4/j2+kVeMevRNZgLmz1j/1Z/yNb4kDf3jLZQQ=;
 b=M7VHCS77jYeJskkerS+NN0NJGVPs6T9Z3w6mi5/t8+IM3wmkvq2t/k1DPTIRNElL+QTzPto2Ze+R0CyH9zxCqdcioaatHkEAZWmezdgydbUXn6cq3KzxI4TWean+nSOICv9sbNRGHs5HbyJlLYn7CziD97Q8j29Ur345zUdozaLhtEwbTacADuTyy1aGpZQpWWLn0m8/eYakaYZ720WLgFMfgzwBqCUnEq3EPYe5lk+uNe5bt2VVuMMsQ2abEPL5UWHupLzOz8x46KlOWuAtyGy7R5UBiSJNdHip/wyWHoeVT63iBmGe7KyiDy7X4O7wyKqf38tkLQKVc3SmNKPw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 14/34] drm/xe: Runtime PM wake on every debugfs call
Date: Fri, 26 Jan 2024 15:30:23 -0500
Message-ID: <20240126203044.1104705-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 518e4298-89ab-4268-b39d-08dc1eadc785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5pF4ZrIDCT7KNqk7DMerBMtF+qtjLPv9UKk9sPZxidC9UYdsaGZhhGX3uxLjyFwrjpAM9mFVbkeLgtFMSrvY9mcOoQHgkUP6/FTkQG6bDi3CMBVKt43cucCkM7tzC5F9WtQFMLHwhZU9hePykyCYZ9fytRU+ctiQShN6VNkhH5R7o0t9H74jwmgySxN3rOIEWFwMZeMWsfWpZaFkjTTdNmqkshPQG26pgnWvoAlSB0sEsrMWo8AihYT6ROHWZdrU9BPDUgqID2jjjrroNdz1P+iEO79wbqz2TPYK8vKFbd6gkyJfJmBOCmY5o0hus7eSeyfU7eIDuDoqXKpM0v1HHGxNRX8fD+WHBrwGNta7ACMQ44fuDEEf0i5rHuWsRGU3MjPafkOlxPAaAL6Q85aHKg0zygmELAgdHdB3Y+AA3UbsBNwyKR97QMeuOhzUL/6nr32JFu+V2zTH14luLaPWSkh6HKBFU5L/6CoKQgG+OHfUJXIqQ9aGnN5EF6iOcXonYdkDtwxjPEIBT0puDbaIO56r1kf4zTVvKudKjHQeuyfdQ93HuxtbUyjejc9hf5a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYUwUyZv3C5CFquIs8CemiocncE7wqkpJCA+L+ovHCEaLsYMkrxn9ZJKdFcD?=
 =?us-ascii?Q?6gW57aqRc0ukkQQBikMh5CVMYQh73ec4cFhRswDQ1pwa43yDC5FV2Uf//EgR?=
 =?us-ascii?Q?y0uWYNtOdnO8Jmlx5ZBlyCU+wf1khN76gsQRyA9rGaf+duVPZlMA0oLfVp64?=
 =?us-ascii?Q?MEwpmW6SthdequkbhCwF0Qk+8S5B8lzFDyboicIFvILkCiyTG+OZP6KepGxL?=
 =?us-ascii?Q?oC6y22KpbNmYeFU//HEcNH+sQ+w6hodDSmbc62N9HYSfgF6xOrwhkT79L2+3?=
 =?us-ascii?Q?7041X4cdqukDTOyWioo6ku29q0oNjEcgJvtBWdCkG5b7B8KdqHfIGqrA9lGb?=
 =?us-ascii?Q?jTUXnE6HyB7rGzC/8VGGVjF60WkBnmGMqPEYW9Odpd5moNSgVpVzva/BhPf+?=
 =?us-ascii?Q?kn6FaCKO0ZG4PAMB+oAzFxD8gugEonvy4VD3thLXT2fM4bKCY5Ic0tMRqjjz?=
 =?us-ascii?Q?XZUTe6SHtHVoj8EjbkBdrNTi5ypsBkESoiM3YK43/SlDizpq1QjWSGIdpoa0?=
 =?us-ascii?Q?gLz418OaHVWY4abEq5lgld1e4kWt8CznHKe2J4we6EcODTlY0BxN6ap1gd7V?=
 =?us-ascii?Q?cldW9nfvPeSbWNnhsqnkbmG76Qd7dS5SNROv4OaCdyl6pyWxNPVRF07mHwxJ?=
 =?us-ascii?Q?91W10xnOVPqx4ynR8zZfP2IwnlxzMaBApseSHumxYb/Epg+eLsF76oLqv71J?=
 =?us-ascii?Q?j5I+wVLOjGqW+Mv3hCP1Cc+qGvLAfVRapsB8kGlhTsMtU/a5pAC14ntEXDVl?=
 =?us-ascii?Q?z5n2GYw6m/Imhc7slKVK11+dMeVjg5x1PMJow5WZQaAmwKNwxkowgzDB7NCV?=
 =?us-ascii?Q?+PMbHTtYith/ciETJriM0FJmgqq7UMo39WXEHhNZnGjddi+LslikNNfaPMEF?=
 =?us-ascii?Q?nMBBe7BJ0lCiXWRQ64TtACBxGw5/+boveqpdheHPfKJiyYAe8pKk9NxXwjCk?=
 =?us-ascii?Q?l1ElV7G/He4ufBfwP0vtfu2iWpQAgUWdgKr0WrjCfd0QqvtPJXeLcbE+xi/b?=
 =?us-ascii?Q?eXX8qnky9BXeWPyhpzHznKouyf8FnxljnbuvParhJlZOoNt1J8tMZCYd2W3O?=
 =?us-ascii?Q?RaOhqOP1dqR/gmkM4awqwgjJDXxTOxC6uZqrjA73JQ0+IC9TQpsU3kg+KYhc?=
 =?us-ascii?Q?/ETPj652iDDq1G6KMbfnQV2s8DggZP0frct0Oa4Oek+JBfPl7VJ3w8RUaqtg?=
 =?us-ascii?Q?jcyiQAGDE8oTnle/sb82yIB00cZGP5+6oa6tK2lLrdeMidEIAmU2YcgWMBp/?=
 =?us-ascii?Q?XEEZQB0NfBnQqQfb7llfhwW3z4XYkzA0yvWiF95ws3UWkRiv9zjLgX+YQiiY?=
 =?us-ascii?Q?5WjV60khb7OQwyK0PHz6tSWl2MS4sdROwHwDRxEvWOv2NGEw2xv6m5FfuT9J?=
 =?us-ascii?Q?xOa/rfH+8BZ+9ZkR/9MfJXlqVaDoFhMVcjf9rUgzs8mbQ4ChqW9/9BHrI1O3?=
 =?us-ascii?Q?TmmsR1rNjPYq8I/nOV07gKt/7EqA1P/TvbCjcO8NJRaJ0yz0OK/+zu7Sd+v2?=
 =?us-ascii?Q?W9Ajyk+9UisQWG3LK9tmFQ2voA7gMhTnT2Z/C09zk3upUBhLBRHYwut7pmxP?=
 =?us-ascii?Q?HsRpXF0loz3p+f2tRlrSO4HgMQCHHayrd5gbSfkf36vIYlRRPiEPHmVktMui?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 518e4298-89ab-4268-b39d-08dc1eadc785
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:30.8027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26oALHg9B2l9PG2XpgFvTzeHtbsxR2b/B5X9+I914lNlYSopTkpf6fEw6ua6T7zvsaw4P5oIMlIZ7Z3g0t59Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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

Let's ensure our PCI device is awaken on every debugfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Also remove the mem_access get_put helpers, now that they are not
needed anymore.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c     | 10 +++---
 drivers/gpu/drm/xe/xe_gt_debugfs.c  | 53 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_debugfs.c |  9 ++---
 drivers/gpu/drm/xe/xe_huc_debugfs.c |  5 +--
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  5 ++-
 5 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 01db5b27bec5..8abdf3c17e1d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt_debugfs.h"
+#include "xe_pm.h"
 #include "xe_step.h"
 
 #ifdef CONFIG_DRM_XE_DEBUG
@@ -37,6 +38,8 @@ static int info(struct seq_file *m, void *data)
 	struct xe_gt *gt;
 	u8 id;
 
+	xe_pm_runtime_get(xe);
+
 	drm_printf(&p, "graphics_verx100 %d\n", xe->info.graphics_verx100);
 	drm_printf(&p, "media_verx100 %d\n", xe->info.media_verx100);
 	drm_printf(&p, "stepping G:%s M:%s D:%s B:%s\n",
@@ -63,6 +66,7 @@ static int info(struct seq_file *m, void *data)
 			   gt->info.engine_mask);
 	}
 
+	xe_pm_runtime_put(xe);
 	return 0;
 }
 
@@ -76,8 +80,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	struct xe_gt *gt;
 	u8 id;
 
-	xe_device_mem_access_get(xe);
-
+	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
@@ -92,8 +95,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 
 	for_each_gt(gt, xe, id)
 		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index c4b67cf09f8f..6b4dc2927727 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -18,6 +18,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_reg_sr.h"
 #include "xe_reg_whitelist.h"
 #include "xe_uc_debugfs.h"
@@ -37,10 +38,10 @@ static int hw_engines(struct seq_file *m, void *data)
 	enum xe_hw_engine_id id;
 	int err;
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err) {
-		xe_device_mem_access_put(xe);
+		xe_pm_runtime_put(xe);
 		return err;
 	}
 
@@ -48,7 +49,7 @@ static int hw_engines(struct seq_file *m, void *data)
 		xe_hw_engine_print(hwe, &p);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 	if (err)
 		return err;
 
@@ -59,18 +60,23 @@ static int force_reset(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_reset_async(gt);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
 static int sa_info(struct seq_file *m, void *data)
 {
-	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
+	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
 				     tile->mem.kernel_bb_pool->gpu_addr);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -80,7 +86,9 @@ static int topology(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_topology_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -90,7 +98,9 @@ static int steering(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_mcr_steering_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -99,8 +109,13 @@ static int ggtt(struct seq_file *m, void *data)
 {
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
+	int ret;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
-	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	return ret;
 }
 
 static int register_save_restore(struct seq_file *m, void *data)
@@ -110,6 +125,8 @@ static int register_save_restore(struct seq_file *m, void *data)
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
+	xe_pm_runtime_get(gt_to_xe(gt));
+
 	xe_reg_sr_dump(&gt->reg_sr, &p);
 	drm_printf(&p, "\n");
 
@@ -127,6 +144,8 @@ static int register_save_restore(struct seq_file *m, void *data)
 	for_each_hw_engine(hwe, gt, id)
 		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
 
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
@@ -135,7 +154,9 @@ static int workarounds(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_wa_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
@@ -145,48 +166,70 @@ static int pat(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_pat_dump(gt, &p);
+	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
 static int rcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int ccs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int bcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int vcs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
 static int vecs_default_lrc(struct seq_file *m, void *data)
 {
+	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
+	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
index ffd7d53bcc42..d3822cbea273 100644
--- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
@@ -14,6 +14,7 @@
 #include "xe_guc_ct.h"
 #include "xe_guc_log.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 
 static struct xe_guc *node_to_guc(struct drm_info_node *node)
 {
@@ -26,9 +27,9 @@ static int guc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_guc_print_info(guc, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
@@ -39,9 +40,9 @@ static int guc_log(struct seq_file *m, void *data)
 	struct xe_device *xe = guc_to_xe(guc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_guc_log_print(&guc->log, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
index 18585a7eeb9d..3a888a40188b 100644
--- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_huc.h"
 #include "xe_macros.h"
+#include "xe_pm.h"
 
 static struct xe_gt *
 huc_to_gt(struct xe_huc *huc)
@@ -36,9 +37,9 @@ static int huc_info(struct seq_file *m, void *data)
 	struct xe_device *xe = huc_to_xe(huc);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	xe_device_mem_access_get(xe);
+	xe_pm_runtime_get(xe);
 	xe_huc_print_info(huc, &p);
-	xe_device_mem_access_put(xe);
+	xe_pm_runtime_put(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 3e1fa0c832ca..9844a8edbfe1 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -73,7 +73,10 @@ static void xe_ttm_sys_mgr_del(struct ttm_resource_manager *man,
 static void xe_ttm_sys_mgr_debug(struct ttm_resource_manager *man,
 				 struct drm_printer *printer)
 {
-
+	/*
+	 * This function is called by debugfs entry and would require
+	 * pm_runtime_{get,put} wrappers around any operation.
+	 */
 }
 
 static const struct ttm_resource_manager_func xe_ttm_sys_mgr_func = {
-- 
2.43.0

