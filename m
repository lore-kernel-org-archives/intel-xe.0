Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F917C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 22:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6074610E1F0;
	Thu, 20 Apr 2023 22:48:24 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2533610E1F0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682030903; x=1713566903;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pbPLioaohdE8oVqm1SqRph3XrFNhW8qkp4lSGXKLtPk=;
 b=Q9Yd70Po44mmliChMwzZwZA5ceLYQscApI2nPfoJdK+4ztnsvrAJCPGP
 +8/9vDLNCfJnACNGzXdYG7WTS1biipx9ub0yxSQoWGKHSkvALb1hwkqjQ
 9zfFbqIlBIq8cyJjqK1j/njuSFeOKkwxMhthPNXOhVE5Zr00AHnjhDkMy
 dJZ5zitj8T1NRYru/SYasAKoEZ+PzbTDod6ISyZwh/O8pYnXzc3pZKwcr
 W0w6H/W4fkgFOKtIzyi7V9Z/94fhbypOmAmSMYgjGrtu84L3yPIW91XWw
 qKokXpd9XZQx+dR7EPyPzhBY0v3kNfgsDTsdmR5Dl0awQtSWLLsQMsida g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411127356"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="411127356"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 15:48:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="722556800"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="722556800"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 15:48:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 20 Apr 2023 15:48:14 -0700
Message-Id: <20230420224814.4136897-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Fix xe_mmio_rmw32 operation
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
register update that wasn't the expected RMW operation.  Fortunately the
impact of this mistake was limited, since this function isn't heavily
used in Xe right now; this will mostly fix some GuC PM interrupt
unmasking.  The display code also had a wrapper that was using
xe_mmio_rmw32, but that wrapper was working around the misimplementation
by inverting the 'clear' mask passed; that wrapper can now go pack to
passing the 'clear' parameter properly.

v2:
 - Rename parameters as 'clr' and 'set' to clarify semantics.  (Lucas)
 - Undo xe_de.h's workaround for this misimplementation.  (Maarten)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Link: https://lore.kernel.org/r/20230412225248.3229571-5-matthew.d.roper@intel.com
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_de.h | 2 +-
 drivers/gpu/drm/xe/xe_mmio.h       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
index 9f92fdb4159a..000379f8702e 100644
--- a/drivers/gpu/drm/xe/display/xe_de.h
+++ b/drivers/gpu/drm/xe/display/xe_de.h
@@ -45,7 +45,7 @@ intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 static inline u32
 intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
 {
-	return xe_mmio_rmw32(to_gt(i915), reg.reg, ~clear, set);
+	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 388a633b438b..a36c52bc098b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -34,13 +34,13 @@ static inline u32 xe_mmio_read32(struct xe_gt *gt, u32 reg)
 	return readl(gt->mmio.regs + reg);
 }
 
-static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
-				 u32 val)
+static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 clr,
+				 u32 set)
 {
 	u32 old, reg_val;
 
 	old = xe_mmio_read32(gt, reg);
-	reg_val = (old & mask) | val;
+	reg_val = (old & ~clr) | set;
 	xe_mmio_write32(gt, reg, reg_val);
 
 	return old;
-- 
2.40.0

