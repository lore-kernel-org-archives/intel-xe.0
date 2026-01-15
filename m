Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92089D4662F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 22:43:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B8210E0DD;
	Thu, 15 Jan 2026 22:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyfMdr3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FE010E0DD
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 22:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768517027; x=1800053027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vLFg76l0NhN3iRtT6QHB/fYSc1acIwAnb3ZgG67vJTU=;
 b=UyfMdr3KztAZc1BM+TqlbPceej/KpvfZQ9Al6i/fBCiL3arXi0brCpHO
 2a2GnuI/7C7hp+InGbjZk89yzm/xB5FRuGeh745VWXXwwEI+V8g+NUt9s
 uU/uYoUNpi4nmwww+gP18sXrXZa4+qI4t7WK1ZnU3PIkio0xhb9yI44dl
 Xc3owIkiUYdaB2a1RxEteuM0MOz6R8oPozylLTQPKLre+SmnM9ZqbRXmi
 LUMeygz9y+YWFMgt5rnUGiXvmFZZ90lScOqsvBs+WKCKoqs15LspUCPWV
 rvRiGn4f9Kr5w/PWZhLEZhhkpCytMGFGXxzBedqhwBoVom8znSpTOD6yn w==;
X-CSE-ConnectionGUID: g/kzurR0SkaB5p3v7z0dyg==
X-CSE-MsgGUID: vgP95COPTlKVy1Jzabml6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69037141"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69037141"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:43:46 -0800
X-CSE-ConnectionGUID: 1rJPvQuRRh6SX3xCQ/i8eA==
X-CSE-MsgGUID: +l7P2+ETSvyWR/brHFgytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="204274206"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 14:43:46 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
Date: Thu, 15 Jan 2026 14:40:40 -0800
Message-Id: <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
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

Dump forcewake status and ref counts for all domains as part
of this debugfs. This is the sample output from gt1-

$ cat /sys/kernel/debug/dri//0/gt1/powergate_info
Media Power Gating Enabled: yes
Media Slice0 Power Gate Status: down
GSC Power Gate Status: down
GT.ref_count=0, GT.forcewake=0x10000
VDBox0.ref_count=0, VDBox0.forcewake=0x10000
VEBox0.ref_count=0, VEBox0.forcewake=0x10000
GSC.ref_count=0, GSC.forcewake=0x10000

Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 46 ++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
 drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
 3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 76e054f314ee..197e2197bd0a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
 	return __domain_wait(gt, domain, false);
 }
 
-#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
-	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
-		for_each_if((domain__ = ((fw__)->domains + \
-					 (ffs(tmp__) - 1))) && \
-					 domain__->reg_ctl.addr)
-
 /**
  * xe_force_wake_get() : Increase the domain refcount
  * @fw: struct xe_force_wake
@@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
 		   str_plural(hweight_long(ack_fail)), ack_fail);
 }
+
+const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
+{
+	switch (id) {
+	case XE_FW_DOMAIN_ID_GT:
+		return "GT";
+	case XE_FW_DOMAIN_ID_RENDER:
+		return "Render";
+	case XE_FW_DOMAIN_ID_MEDIA:
+		return "Media";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
+		return "VDBox0";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
+		return "VDBox1";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
+		return "VDBox2";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
+		return "VDBox3";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
+		return "VDBox4";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
+		return "VDBox5";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
+		return "VDBox6";
+	case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
+		return "VDBox7";
+	case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
+		return "VEBox0";
+	case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
+		return "VEBox1";
+	case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
+		return "VEBox2";
+	case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
+		return "VEBox3";
+	case XE_FW_DOMAIN_ID_GSC:
+		return "GSC";
+	default:
+		return "Unknown";
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 1e2198f6a007..f7690cb34ef7 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -19,6 +19,17 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
 void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 
+const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
+
+#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
+	for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
+		for_each_if((domain__ = ((fw__)->domains + \
+					 (ffs(tmp__) - 1))) && \
+					 domain__->reg_ctl.addr)
+
+#define for_each_fw_domain(domain__, fw__, tmp__) \
+	for_each_fw_domain_masked(domain__, fw__->initialized_domains, fw__, tmp__)
+
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 52436dcb6381..8e36202f1a4f 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
 	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
 }
 
+static void force_wake_domains_show(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_force_wake_domain *domain;
+	struct xe_force_wake *fw = gt_to_fw(gt);
+	unsigned int tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fw->lock, flags);
+	for_each_fw_domain(domain, fw, tmp) {
+		drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
+			       xe_force_wake_domain_to_str(domain->id),
+			       READ_ONCE(domain->ref),
+			       xe_force_wake_domain_to_str(domain->id),
+			       xe_mmio_read32(&gt->mmio, domain->reg_ctl));
+	}
+	spin_unlock_irqrestore(&fw->lock, flags);
+}
+
 /**
  * xe_gt_idle_pg_print - Xe powergating info
  * @gt: GT object
@@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 			   str_up_down(pg_status & GSC_AWAKE_STATUS));
 	}
 
+	force_wake_domains_show(gt, p);
+
 	return 0;
 }
 
-- 
2.38.1

