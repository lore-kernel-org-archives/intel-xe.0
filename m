Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7705D44D7F
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A8810E716;
	Wed,  6 Nov 2024 15:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM4oCxUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8522510E716
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905994; x=1762441994;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A40+380nZMDEbm/6YSRxcQVAHkNGcbncwnhXcldjLqU=;
 b=ZM4oCxUGnvuFOXmP2QXqUuXKDz24g7goT5CcHQ1auCJ9YnP41Z6YTFTw
 c+i/tLKWyAe5Xrs3C0BgN2stXXQ+Ce+2T2JtYBKIg3pt0TCERbQsYMO5l
 qL/vHI530PuiJ1VeVjVjWjMWczzfx73LaOLqLK/LvSsl7u5AzgkFHGWzF
 LRwz9haX3TX68TjKXI8Z4qNz38DcK66elg3f6omCCcpFSLLmsi36axz+4
 qOV/aB1b06YjsNiKkqcue/rH6WT8l9E21fM/0Xhs74jWflW+2BJh5vm/x
 BSkvHuqFO5AhcjzV6b8D9w5ntKmEsuYI7mCXDgCADeg9THhCJRgXBMBor g==;
X-CSE-ConnectionGUID: x9SAszSYQeWjPB6YD/X3BQ==
X-CSE-MsgGUID: lDXMieaiR4uX4hT0xmngtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867691"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867691"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:14 -0800
X-CSE-ConnectionGUID: t+LEpOAAQLe20z5Wk1CTmg==
X-CSE-MsgGUID: ZhznYic3SUa+/ZtpZKD9PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136792"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:13 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 4/5] drm/xe/pf: Allow to control scheduling priority using
 debugfs
Date: Wed,  6 Nov 2024 16:13:00 +0100
Message-Id: <20241106151301.2079-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add 'sched_priority' attribute that will represents the scheduling
prority of the VF or PF. Values {0,1,2} correspond to priorities
{LOW,NORMAL,HIGH} respectively.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: s/priority/sched_priority (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 05df4ab3514b..b2521dd6ec42 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -164,6 +164,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      │   │   ├── contexts_spare
  *      │   │   ├── exec_quantum_ms
  *      │   │   ├── preempt_timeout_us
+ *      │   │   ├── sched_priority
  *      │   ├── vf1
  *      │   │   ├── ggtt_quota
  *      │   │   ├── lmem_quota
@@ -171,6 +172,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      │   │   ├── contexts_quota
  *      │   │   ├── exec_quantum_ms
  *      │   │   ├── preempt_timeout_us
+ *      │   │   ├── sched_priority
  */
 
 #define DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
@@ -209,6 +211,7 @@ DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(sched_priority, u32, "%llu\n");
 
 /*
  *      /sys/kernel/debug/dri/0/
@@ -295,6 +298,8 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &exec_quantum_fops);
 	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
 				   &preempt_timeout_fops);
+	debugfs_create_file_unsafe("sched_priority", 0644, parent, parent,
+				   &sched_priority_fops);
 
 	/* register all threshold attributes */
 #define register_threshold_attribute(TAG, NAME, ...) \
-- 
2.43.0

