Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12F9D5B172
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 14:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B3910E51D;
	Mon, 15 Dec 2025 14:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pvpfj3ti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D75610E4E1
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765809498; x=1797345498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZL4O7KTT8lRotarInugGUDy+fiSAXtxKSaTEFSuvmU=;
 b=Pvpfj3tiNnYh18nJ/kWfMfDTvshcfBViHbxSiqmxF9KLOre8CpDCEJHl
 KumGCc7BenMQdaxUSP91A05NDq7iZg/EkMh2e0RaNh6bLKE/9ZqqG9llz
 /2+Tl/WI0rlItfBmrRJCS+w9i11vdO3ZNRBlvA3oacopkZVqfgLcB4U6X
 YfHOKgQ8kH+DCJ+yRiUpF5RdXSPbjZq1FhyUP5uB4v+IUEiPfWOpLIXQr
 k7875nqXtpdek9CrlqEqeKb2tQnqeunSl42nZPwhCgwa11HvZpX/iDFSS
 9VfiZyBMb0UXzapE+UV15NSlaYNXQ+lJk34XG7unpmrSY+PkeA8kMDlA8 A==;
X-CSE-ConnectionGUID: HrU05lk8S+qvB/VR0mo1Rg==
X-CSE-MsgGUID: /QHZ3M/BSzuwvXcyePzTJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85304131"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85304131"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:11 -0800
X-CSE-ConnectionGUID: URJGk90aS16eSN8QVyVeBg==
X-CSE-MsgGUID: AbYISSMZQeST+4Cqk3+icQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="196828299"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:38:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 4/4] drm/xe/pf: Add handling for MLRC adverse event
 threshold
Date: Mon, 15 Dec 2025 15:37:39 +0100
Message-ID: <20251215143739.196336-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215143739.196336-1-michal.wajdeczko@intel.com>
References: <20251215143739.196336-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Since it is illegal to register a MLRC context when scheduler groups are
enabled, the GuC consider the VF doing so as an adverse event. Like for
other adverse event, there is a threshold for how many times the event
can happen before the GuC throws an error, which we need to add support
for.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: split from previous patch, add GuC version checking
v3: don't move version code to its own file, call MAKE_GUC_VER from the
caller instead.
v4: cherry-picked from [1] and rebased (Michal)

[1] https://patchwork.freedesktop.org/series/158142/#rev3
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h                | 9 +++++++++
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..89a4f8c504e6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -352,6 +352,12 @@ enum  {
  *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
  *      :2: HIGH = schedule VF in the next time-slice after current active
  *          time-slice completes if it has active work
+ *
+ * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
+ *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
+ *      groups and cause the latter to be turned off when registered with the
+ *      GuC, this config allows the PF to set a threshold for multi-LRC context
+ *      registrations by VFs to monitor their behavior.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -410,6 +416,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 5f84da3d10d3..45ab5a3b5218 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -37,6 +37,7 @@
 	define(H2G_STORM, guc_time_us)			\
 	define(IRQ_STORM, irq_time_us)			\
 	define(DOORBELL_STORM, doorbell_time_us)	\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
 	/* end */
 
 /**
-- 
2.47.1

