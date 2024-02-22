Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE9C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FDA10E9BA;
	Thu, 22 Feb 2024 16:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZogpWYR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93F610E9B7
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620007; x=1740156007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iIs2rXYZ9LHk0TPmnOHaLoycCPcZ0S7mwbM7tTpEy0c=;
 b=ZogpWYR0c/t+kWcFmmY3vRmbJ+ZkwMiKQUJqTluTxiddjRAvF5tubVet
 Xbl98OLYNSKcT3t1aTh1GwW824ZxfNCuRMFPV8/ytws0HGqiUfV1LGkMq
 bXc8oMk67ml9dr+/5yBJHxpdeLyyfrRJAKB8OjoGDmaPlzGnjkn+C/OBE
 HrtJLiq6bP1uWYoUPF4gPvEiRQdyLefvLErZGrbgk1Yh/XbskcryB6/zb
 ll04WUewan36iUY3BGMoEuA25cdNLnACcNy1vtxCz35r54D+whRRTN74s
 Xum+xqnpdYGyNNekU7hWdxx13HGEWMAXZ4Q6m8nxYb5/HMGYAfSUK6EIO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2717597"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2717597"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="10288991"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJaw6Jq9Zw6p2TnGUa3UqbRT6VQ1cPT2NYp8L9Zb0DbpJCskXhQp7M0ZQgn7vSqsX9mZIOlRcJuwYzM5aQrwHhIoQtA7oGeoOgqq2DJxVbL8Vc0gEm2J2f0YB0SB31RLAaYwNQ4fbhVrEOtWGPPvY6cQih9zF16Kh6fzS8wm4G2JN58gkZbyoPSwrPdZYNRmEey+DJ+ONVP1OmzihmJa/xLzTUARLZRGjzZulnQ6/ga+QI+k648nhj7YTgasQz730VP8YtCGyz5N/YMRaKf+nxC7Jxs+P5Vw22zy6wMkw2oZ0t2olTRWZNHt73gj462AxKvz/Hpb1zHeaNqD0TMyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utuNwYOqkCSHrx4oFTIdEmamQVGCJz3j8VY0m80ePjI=;
 b=BkpTHx2tU6go2tdWZRlWf061L3mS/5GL6AdzIWCAm+/jrNFdUyA1NtE/cZjW7xUC0+HmXFqVZtqSiUABqbTDuM7FfS7GlSRsq4bXVhg3iWIhZEYDyw5h+WVfYdSvl3Qo7QIwFe3On+bRKvGmyai+akpBa+uJl70Mspb1EpcD1z6qnqC7K8yvo3JHTtQYbLTnyJb1FgTPX+tf8wwQaCJEvqjFn1L6ZRzAybq1nFCql1nkTvK5gHETjuAYFtuLiJima4tPwFxKQqO14uottilCxjj8SmyyDU2KmWTuqi1j8mqBzYDP7ONnjuQwoG/4Mtq7F9rK/8uBWscmrVl0T9g3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 16:40:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 07/14] drm/xe: Runtime PM wake on every debugfs call
Date: Thu, 22 Feb 2024 11:39:30 -0500
Message-ID: <20240222163937.138342-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0045.prod.exchangelabs.com (2603:10b6:a03:94::22)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a41e90b-003e-47dc-59a0-08dc33c4eaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r6+r93DIwiQnU0qJgyHRFQdECGzPxw6MPnH2HVasVRyZV0z613htiK3nEmGWO851H572w1D8qkFS9yXcKVS1I4Na3WPorrJGUZSkNEAZG68PHCdXcyZvlzM8TF2MHpr+WySLKv+iVQ5nyR0bSeo2AGy6wOQpGGaNqLJKVOF1nfaNvPSYf3At69dulwHk0b8qoFpe+7mz60Q53vQ2tr9CYsVzF1svDFegezgq6/UflG2j3JUeuycJBQyTdQAAUOz5wPCEC1yBMIzMbInCkQWFyom5BCIIWjQWCQ8Mz5TRQ07GdB3v+4dAmUu8XnvvZX6lvI2ZnIZoQ56ghgLgJ+kTLj37+Fy+TacKxfuNewtBXWi0V6ZrRi5lxlLLM6DKCDsTuCL5EI7DaIygbXugFmPBQzXucoVxidS9OkGTjKhl20vHAZBGVKbekxex1IIlE3J76vU1dqEqwzhf0BFrBXbLSHHm322Kc0bnGx+127cbVNJOy8Sf1iUwpYEqWYswp5WIQG20E3FDuJRzB7eaIN7rrYHrUFaRcGrqfk07uXsDX78=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XDxCRsROBlOEJd7mtIZ9wHrzjiBrTc+TpruQV3WFYQrF2p/v9XOeE8vSbnZk?=
 =?us-ascii?Q?EG9n4PxktIBDYCXuucWG0IeYeIPPjbWzy7VlE9iMsjkhtgHHDVB5viJVYOFQ?=
 =?us-ascii?Q?We1VcLJ6g0u4zIGEYc5qkZ+8hl1Wzkqrtb6ED67Wxp2I8YEVMUu7KNQcTqbn?=
 =?us-ascii?Q?t+CARmMDGPI2sQqcv3EtdPMC0NiVRQilS3AkmUmHE8C4ujpSjp2+MjcBQ/Md?=
 =?us-ascii?Q?PPy1jpvk1zI7OwgLFcgaZsIiHjgUAn19mWoIFxc1a5VxmrLo7b0oqthqjLnb?=
 =?us-ascii?Q?rVEW116slTBfc1ilp0cpXW7f4ycR66sAahC1VyqZHJFA/nG/o1SEVTnLalrs?=
 =?us-ascii?Q?dtV1jH+4yhoNfu8Js7bThuVa2WD3TGyL/qKVJNkPhU1ky56gGh/CKx32q/Kz?=
 =?us-ascii?Q?gSFnQ82r0ynEuEPiv3LN+x5OdyLA7/OdDZhB8g0PC/QNEnBIQpfcgi/j51aM?=
 =?us-ascii?Q?nGC3mYSrlF1b3twrcZwzxc8wnc/X0CUmuEzhzig/dHlv/bSjpy76aAtP+EXx?=
 =?us-ascii?Q?Do4fGHIrHn2h21yxsck7ZGZbsTzJfgmAYWnJ4v/LZLaEpJVCs3NFiWospzJu?=
 =?us-ascii?Q?VZiSJguyS19XvxbsBNPGJnOnkVgJSgxElj/je94GhAYh92iFU5FusfRGuzJ9?=
 =?us-ascii?Q?XirK3220KB6nqnCHaLQbMeXvX4HQdpzIigPs4gJQ94jtJVT/sCrruR4LwIc2?=
 =?us-ascii?Q?eK7ZOAiCUE6GCHwhSdFD0PKssJOluHzufHs4R6NVKzETKRpUUqM/dF6vWdlv?=
 =?us-ascii?Q?YLn0BtBV0l4yGndH9Azoo1yOVxFzT1WUB9nAZ7r0ukWHJX8EnxDbkC6+nh9d?=
 =?us-ascii?Q?QWEDke9x4aT0BvPn7kbUYPMRScX3/umDnBiSN9kxbXyT0mO2VRKzm54onbiz?=
 =?us-ascii?Q?mbyiRdGkCrracc+PDtOqsGh5Ocl01HGKZL8gWPoEU0l0iIAVAXXTNtFmLPqj?=
 =?us-ascii?Q?/1bjXCMEdy71adA1wFwCsBcsym99+U4id+l8HTY3Cly0fpKlVze+w5mZ/Rot?=
 =?us-ascii?Q?qID7KJ7Wzp/XTJh5zpJYwgNtI8sGQ9GuuyD1Mgt0+fwzfipTu20E4zc86VHE?=
 =?us-ascii?Q?zC5zl7relWKLYmhI0WvvqvD6+P0+yYis3QysoR8V1QF0yJJP5JSKblIbDpzr?=
 =?us-ascii?Q?E0XlV9I20oSQCvTZR//rBy+ZSsxBNafJYPBePmvXbns3IyCGwS0AeO0zRZhW?=
 =?us-ascii?Q?gbq36ckeTqdJmHSwr6Qkv3GSK8fXYaso4Zs8jsO/bIkVaxwR7Cd9tZtCA0ws?=
 =?us-ascii?Q?4dsmLbw0FWwDGMlwnMTsMvqOs9IwYa0Z6dpw1Qd/ZwQoYAKcfK+Dslh7IS7R?=
 =?us-ascii?Q?FVPWFKQdxtOzsmM0Sg6lcQkxUwC+u4JW/84LFz5oblpOXxEiRVMH7T6hZN+W?=
 =?us-ascii?Q?wBzpTpnC3IzteQyL1vk4XbMPChe3yI3AGgC567z3W0IOHySOTVS0a5uAIXUY?=
 =?us-ascii?Q?Ia2ige0tjNx/bGAFuVari8AvkTeamucoXcO3lxAgqdClmtSlFoOtWXWqsUDZ?=
 =?us-ascii?Q?uTaYmYn7aZ6bIc9ywqYyOqgJvTsM8DVkLxquu1YAja7BDPhVYOV7wyjxIWQF?=
 =?us-ascii?Q?3xj+V3EBLcZSFkJ5ubNH2QZ42Amf15WETf8XhVKz6ovH5iXIDIxtCHJFu8BY?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a41e90b-003e-47dc-59a0-08dc33c4eaba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:02.6851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itrCkNP6b+bNoHMy77bs1f/earg3tWJT2caLfHgLJZVerElwmFnDguYGAgjNxDHQOAD6nf15HC3tA6v0K0pxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

Let's ensure our PCI device is awaken on every debugfs call.
Let's increase the runtime_pm protection and start moving
that to the outer bounds.

Also let's remove the mem_access_{get,put} from where they are
not needed anymore.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
2.43.2

