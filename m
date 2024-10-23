Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC500D0BB47
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 23:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9591710E873;
	Wed, 23 Oct 2024 23:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxcRCvbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592B710E876
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 23:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729725131; x=1761261131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7sebPT/R1yCiXQYc3QPnM7vWhLeyxHGPGvSIXi6Ibus=;
 b=LxcRCvbIxzoJfOeQ/e6MuID+PZ2tYpN7//5wtmH58Vb6SoUdzxf3QWDQ
 1Np9Wy1OAf019VXWI03WXq9LI9th5tpUx/9PW+gS0oVQnTvc8n52pb90H
 4opTR1yi2m5SUkTmyrlIV2+XIzIvWJ/buVEfqV2f+ZxI5LXOR9Ii8xFEJ
 TJhsX7BsXBAzysnQ9Li0E8Sj8NNxoLuw3AajlltcdGYNVN26QVcdK6z7e
 CWi3MyMK//HT5EjNmn0UYqRnKKnc1jAkZzLlKsz8v91WIojDhmOGYDA61
 DrYqoDpzcuBLGNI1Vs8fktm9qgzhZhKImNM1XN3cm/qqlN4aSpSog/pQ1 A==;
X-CSE-ConnectionGUID: c5cE8oAeQ2SUyWuCVwYvrQ==
X-CSE-MsgGUID: CypiT3OJRR6KRsL0ylj1iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28775158"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="28775158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:11 -0700
X-CSE-ConnectionGUID: FOHcWo65QlCpXXWBmDrz5Q==
X-CSE-MsgGUID: knKxyfevSEuTfHZtstIZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="111217992"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.97.255])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 16:12:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/5] drm/xe/pf: Allow to control scheduling priority using
 debugfs
Date: Thu, 24 Oct 2024 01:11:51 +0200
Message-Id: <20241023231152.1815-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241023231152.1815-1-michal.wajdeczko@intel.com>
References: <20241023231152.1815-1-michal.wajdeczko@intel.com>
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

Add 'priority' attribute that represents the scheduling prority
of the VF or PF. Values {0,1,2} represents {LOW,NORMAL,HIGH}.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 05df4ab3514b..0b7c78fb18cd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -164,6 +164,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      │   │   ├── contexts_spare
  *      │   │   ├── exec_quantum_ms
  *      │   │   ├── preempt_timeout_us
+ *      │   │   ├── priority
  *      │   ├── vf1
  *      │   │   ├── ggtt_quota
  *      │   │   ├── lmem_quota
@@ -171,6 +172,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      │   │   ├── contexts_quota
  *      │   │   ├── exec_quantum_ms
  *      │   │   ├── preempt_timeout_us
+ *      │   │   ├── priority
  */
 
 #define DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
@@ -209,6 +211,7 @@ DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
+DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(priority, u32, "%llu\n");
 
 /*
  *      /sys/kernel/debug/dri/0/
@@ -295,6 +298,8 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 				   &exec_quantum_fops);
 	debugfs_create_file_unsafe("preempt_timeout_us", 0644, parent, parent,
 				   &preempt_timeout_fops);
+	debugfs_create_file_unsafe("priority", 0644, parent, parent,
+				   &priority_fops);
 
 	/* register all threshold attributes */
 #define register_threshold_attribute(TAG, NAME, ...) \
-- 
2.43.0

