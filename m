Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D72D1048922
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9B210E1E1;
	Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrIZC9Ub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C3D10EC54
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242512; x=1803778512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBp1ytdLW4n6UvJc6xnhinKHk3LTGMcxjVDq2AKCe8U=;
 b=VrIZC9Ubwa1OXui2EMkiJBzN7Dc4eVAUcqLpXkhLvXytLTCJjSkkz/wo
 peOM+XQlmx7ERUcrqn4HK3gGuTJB/Y3GQkMRxxHdutPJEOf9HboIxfeef
 8zIagzVk93p4kGnlZ9Rmgd/vEcXXXIn8tQUvQvyBoeM0qvnuWx1fkKM8T
 mvWYWsspF3NILy9TAX7D3kuMECrh6eotWQkpplaeNg/kejbND2X5/+ZYH
 +VaG0yuQUtzbQE0OISK3CsCngz7YIMowu0VHvs0nc45aXhDtEmvWnbD34
 vebCYYIULfIHcqR6OjxFYnj2f9NqN15ERnGSxZT19sN4ao/Qd/7sNO4Ay Q==;
X-CSE-ConnectionGUID: T6zZs4/FTZmBbeCLQV3EUQ==
X-CSE-MsgGUID: zibwUjvQTvq5Z0HkLPmFDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966357"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
X-CSE-ConnectionGUID: trTrkQQFQveaEjdpi08N1g==
X-CSE-MsgGUID: AXP2bK7mSMy5ulNscIy8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854889"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 18/25] drm/xe: Add xe_hw_engine_write_ring_tail
Date: Fri, 27 Feb 2026 17:34:54 -0800
Message-Id: <20260228013501.106680-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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
index ea3ad600d7c7..253c65583b7f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -303,6 +303,16 @@ void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
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

