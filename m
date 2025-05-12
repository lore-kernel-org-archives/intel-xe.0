Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1646C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 23:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43910E048;
	Mon, 12 May 2025 23:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzNe28t4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A157010E048
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747091183; x=1778627183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=77MqYRuJLd/PvJytongBBdz7adk6ksjl2XjUrLVbkXg=;
 b=WzNe28t4xpXrZeGpVVe7gLFB0IywfU+UCege51R3elSErqdBzkJrPitB
 GEgw///XCSZ0Hhpn+jGJQRA/QIFbNPGFfLQ6O4vmc4DFjInz5B6Pt/lI2
 ncDUyFKy4Fk6jrMWSrYnv2iAXAIT4/3gmXlTAKcnNMqQsQIeLJfT4Ag5A
 3PpuEwha0M9ZFyRTO7XkRHFESYnL18PTrpJZa3/AT2F+IKmUoJHD30SnJ
 dhNTCX6n5vdd5okN7AsnAvNXCG2SX7wVDxBg/2iTTLIbCD4gSJryoyRXS
 1v/M3GuqhTblk9vBqoazZGHgWCK3GMBPj/aK8kQmC4/Ld+LIo/T+0NYD7 w==;
X-CSE-ConnectionGUID: Hc9ELfqkRGi8ZdytRhPYAw==
X-CSE-MsgGUID: uLNiuO6uQNi4gZYOm65YFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="52567335"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="52567335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 16:06:17 -0700
X-CSE-ConnectionGUID: n3jA3r2BSWSxVCE2v2fN0A==
X-CSE-MsgGUID: OfwswMrPQWiWY2m7qKqhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137536671"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 16:06:15 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v1] drm/xe/vf: Fail migration recovery if fixups needed but
 platform not supported
Date: Tue, 13 May 2025 01:06:14 +0200
Message-Id: <20250512230614.571026-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

The post-migration recovery needs to be fully implemented for a
specific platform in order to make continuation of workloads
possible.

New platforms introduce changes which affect the recovery procedure,
and without a clear verification of support this leads to errors
with no straight forward error message explaining the cause.

This patch fixes that issue - it introduces a message to be logged
when the current driver is known to not support the current platform.

Wedging the driver immediately also decreases the amount of
additional errors which would come afterwards if the driver continued
operation.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2674fa948fda..f21f98f5d25f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -224,6 +224,11 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
 	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
 }
 
+static bool fixups_supported(struct xe_device *xe)
+{
+	return false;
+}
+
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
 	bool need_fixups;
@@ -243,6 +248,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 		vf_post_migration_fixup_ctb(xe);
 
 	vf_post_migration_notify_resfix_done(xe);
+	if (need_fixups && !fixups_supported(xe)) {
+		drm_err(&xe->drm, "migration recovery not supported by this module version\n");
+		err = -ENOTRECOVERABLE;
+		goto fail;
+	}
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
 	return;
-- 
2.25.1

