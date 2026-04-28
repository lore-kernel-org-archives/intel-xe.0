Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92857FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 14:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5534210EBC4;
	Tue, 28 Apr 2026 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwJIKvaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8381E10EBC4
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386462; x=1808922462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gmFBlXuaSRNw6GsDgQaGjJfoVCCSwXgj4IpAMlmaOd8=;
 b=iwJIKvaUQOz5T2nc4Kem5LVfcebQja/sdi+COtC0ai2fPUEZfyveuEOw
 hQLIcQhjAWr5apTmN5J7fz97mN6DJ4T4N1yNjj8kXtyG/xbOPAs37BJ/b
 Xerxb0V/F1v+u5eE9VH8dV29JbLYqMECv7UsPCewCPvOVZYV6T/usnM6h
 l+PJ4aAWR90OmA+tM3dkhaMbjhq9qAHAt+Ryyu+xFB3ncI5R9m141hyYq
 POO+/+n1eL5OHx9mUrilZE/8SCnnhb1XIVIMBRIb7J29D772aaqDH0KG1
 iOoZor64yzIGfzrFkeXtPtUURyVfwhmp/OIjFvRfpM3ytHv3Tplb9Hyd3 g==;
X-CSE-ConnectionGUID: AbN6O2R7R+KOAcLdAR+7cg==
X-CSE-MsgGUID: uuIsv3vPQO2eBCntodIa4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862322"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862322"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:41 -0700
X-CSE-ConnectionGUID: Zqns7DV6SUG4v+w9dcOhvg==
X-CSE-MsgGUID: c/75Et9bTym/x6ueaPeaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942356"
Received: from orenpaz-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.20.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:27:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 04/13] drm/xe/mmio: Allow to replace xe_mmio_read32|write32()
 with stub
Date: Tue, 28 Apr 2026 16:27:11 +0200
Message-ID: <20260428142722.582-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
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

We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 78adb303b663..83cd1157cf61 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,6 +10,8 @@
 #include <linux/minmax.h>
 #include <linux/pci.h>
 
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -180,6 +182,8 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
 {
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_write32, mmio, reg, val);
+
 	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
@@ -194,6 +198,8 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
 	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
 	u32 val;
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_read32, mmio, reg);
+
 	mmio_flush_pending_writes(mmio);
 
 	if (!reg.vf && IS_SRIOV_VF(mmio->tile->xe))
-- 
2.47.1

