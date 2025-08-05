Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130A6CA0EC3
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9510E6FA;
	Tue,  5 Aug 2025 23:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMjqox1f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7191010E656
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437325; x=1785973325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8BdHUDUuSqpXu1RBhWKlKY/V8gESFLQNF52JB00kaE=;
 b=mMjqox1fPz8kCvHSZLopiBwlgeBEb/kv+f/wLcxRufSMlKb0V8+TLG/k
 ln8dVJ0fMiENG83QcztQ8nL8mvkA7vxxC12iVRxsIGhPQgShlP/Qh9mCd
 ME/N1p3jNSZJ+38V3LVYx2k/KIxXPTUfvDLy1qLVSQh3mc9R5kjd/MKum
 vr4LIP/Pk/dwc2dqZJWhDK44fHsoObzuqjDoe9jFERfu7UcJoDT86JFdR
 TjaZjDaPY6rvE+BwI1sPF/lGbyDmmiq591h24/qUHouixz9o0lQSyHA59
 fTr/aQTrrNONJUcNQndG5wG44RKO5MuZgb/wY6a2JeDX8X4zfu9/KeUi+ A==;
X-CSE-ConnectionGUID: Fvr8djc6TgqGP049oVm2aQ==
X-CSE-MsgGUID: QeFtIxujRO2t2B8QM5B+4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119063"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119063"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: iTj6cZogQaSgTv8p+R7jgQ==
X-CSE-MsgGUID: hfNoicp1Tge5ci2NxA/clw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641626"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 07/15] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Tue,  5 Aug 2025 16:41:52 -0700
Message-Id: <20250805234200.1035609-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

ULLS for migration jobs need to directly set hw engine ring tail, add
function to support this.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 796ba8c34a16..4929ae709cde 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -304,6 +304,16 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
 	xe_mmio_write32(&hwe->gt->mmio, reg, val);
 }
 
+/**
+ * xe_hw_engine_write_ring_tail() - Write ring tail
+ * @hwe: engine
+ * @val: desired 32-bit value to write
+ */
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val)
+{
+	xe_hw_engine_mmio_write32(hwe, RING_TAIL(0), val);
+}
+
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..b93c3eabca06 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -78,5 +78,6 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
 void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
+void xe_hw_engine_write_ring_tail(struct xe_hw_engine *hwe, u32 val);
 
 #endif
-- 
2.34.1

