Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FA7FED3FF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 20:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF4310E1B4;
	Fri, 24 Apr 2026 20:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGevh4VO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D0010E119
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777063832; x=1808599832;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=h1qENaX9OFX88IseH/xiCRJPR39HnKmnu1kOwS6ri34=;
 b=fGevh4VOmUuRUlBsFzeKuygEeE10wreT1NcePafJgA0O8Gz4SjJJtIbB
 l00v1aw0djd1nFiqrC2IKor//lX05WQTlZeaRWKExmQvByS6tHuBNioXW
 F1P3lDI+oxtOHYLn4w0EHw+qyb/qLcCJgSGumQcCH6IhOT7ce3RA655jZ
 nC+O7LQnhSmh84hYZsiI5YJGdk+XD0HBBROVnpXN6t8mi/Vpq3051WlYp
 Uxs6zRjMDS3QuuVreIbTThFBy8bTcFZqoRPgGwpYhfh+FX1RB26DDXvQP
 iFyTal7EOXRLqHq6ad62+y//iS8SukKcjMjqZE4Ht8dmHhvIB3LmXRpJO A==;
X-CSE-ConnectionGUID: c+CRyrKgSyeSsb3TKSZvMA==
X-CSE-MsgGUID: 3oZ+EKaOQQykCpfULDr3nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="80634003"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="80634003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:30 -0700
X-CSE-ConnectionGUID: vsLUQ7JzRs2KeLvVsGH/zQ==
X-CSE-MsgGUID: O4eYfmtHTfO4BNv8lfEsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="256560149"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 13:50:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 24 Apr 2026 13:48:19 -0700
Subject: [PATCH v2 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-engine-setup-v2-9-59cc620a25f1@intel.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
In-Reply-To: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=h1qENaX9OFX88IseH/xiCRJPR39HnKmnu1kOwS6ri34=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp69eVnNSFezfG70H3CV5OwplF+FgHc/znm/itz
 vdsmsHvFbeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaevXlQAKCRBNeSQFyHKQ
 BPW1D/9B+TxgSZbZHmQdN/AdXxofQ1bt1kkYs79DfjRb4OP+YLajQ1I+XqHkIAiEH6+tA3WHO/P
 fhbLfdzPrLgaEPB84/b7POm2lP22ECcYaQ2/cPMtJVHsWtQ0WE0x2Nq9pQzgpGLPqohmn1BK1cl
 TiHS7/PW89t5LHtP2B589udBjy1XBbZ7fAoCUqYlHA0JYy79rbM/rTdk8jEGgHaW2Dsj2Bi+DMo
 JdYVnHSYwOiGNGiOjBSeW4qsC6W+xqKzP2mCxsLT3IKu4jGWpkvL5VtimgR0wUhhe8BMmch7VK7
 xb4EhX3yLujy/Dz0G+PTiXLQOGcZny86pEcBqpVU5nu4T7NoqePoo+yRdbrQqyZYV0MyD7cSRen
 BmQ9DFzo9ppNEJ8i6rVM21rH4URvo8Ubog28ccfLJvSM1shZS1OAG+BwccFjPzS6qUnAQeCYEkC
 TXaDjMD07OVeUvdIrghWMh1z0cY3k2tC41pccpDeN4M4PtzIW7g3DHCKrZxy3Tar4egDWqOKUJA
 qv1Qybs+zt3vO+vbZsaIjqIf8PuRVW1pUsS6FyHR2wOzz3p9gVzMrTh7Qa+Ac47HXgZhzx6t+Yz
 NZlALu7JUdHlL84oTcrS3QGASXQbUUXlqU1dduTxC3RTf5Yl+sTV2voZa6QFnXM/cjZ3R2SJgho
 u3phuKs4YFYaCKg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

xe_hw_engine_mmio_write32() is only used in a single place and is easily
replaced by a regular xe_mmio_write32() call.  Register read/write
interfaces are already complicated enough with MCR vs non-MCR handling,
so we should avoid adding extra wrappers that just make it more
confusing what to use.

xe_hw_engine_mmio_write32() did have a forcewake assertion that we're
dropping here, but that assertion wasn't entirely correct anyway.  It was
checking hwe->domain which is currently set to XE_FW_RENDER for the BCS
engine, even though BCS engines reside in the GT domain.

v2:
 - Drop prototype in header file as well.  (Shuicheng)

Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 25 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_engine.h |  1 -
 2 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 91e644067cc4..b3da832a5414 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -282,27 +282,6 @@ static void hw_engine_fini(void *arg)
 	hwe->gt = NULL;
 }
 
-/**
- * xe_hw_engine_mmio_write32() - Write engine register
- * @hwe: engine
- * @reg: register to write into
- * @val: desired 32-bit value to write
- *
- * This function will write val into an engine specific register.
- * Forcewake must be held by the caller.
- *
- */
-void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe,
-			       struct xe_reg reg, u32 val)
-{
-	xe_gt_assert(hwe->gt, !(reg.addr & hwe->mmio_base));
-	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
-
-	reg.addr += hwe->mmio_base;
-
-	xe_mmio_write32(&hwe->gt->mmio, reg, val);
-}
-
 /**
  * xe_hw_engine_mmio_read32() - Read engine register
  * @hwe: engine
@@ -325,8 +304,8 @@ u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
-	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
-				  xe_bo_ggtt_addr(hwe->hwsp));
+	xe_mmio_write32(&hwe->gt->mmio, RING_HWS_PGA(hwe->mmio_base),
+			xe_bo_ggtt_addr(hwe->hwsp));
 }
 
 static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 6b5f9fa2a594..ee9218773b51 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -76,7 +76,6 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
 enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
 
-void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
 u32 xe_hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg);
 
 #endif

-- 
2.53.0

