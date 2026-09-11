Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B68C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F2110F55A;
	Fri, 11 Sep 2026 08:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyPnJpMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADA510F548;
 Fri, 11 Sep 2026 08:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113924; x=1820649924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IHWJOpPJ73H9EoPlxv9GHLJhZh5z18q38DIzYj7RtQQ=;
 b=LyPnJpMZNqY0hzWCzuWQcy8UkUQ6hjiMK0NHT7d1yUVsHgAMerTYYQpG
 +peuyPmPGlMFabgW6KBtij0NCYAmpzuPmbc9D43dd+PG/QAm53q3+mb+F
 cWfd7HCdgZoQ+/t1WBih5IkrPzfExWtkgkwIoEY75ulMDng/m+hjdgxzb
 t9EfJMrGsf0zOeV4ivwInMapoSxyO4B/fMkF/szpU2PVAdT7+/epBcptI
 vkI9pcNwXenF8EhTzfJ4+cMCDw6vYBxf9hn8OUokyTBYcbIoAtO8de349
 ush2ctex9X9jLj/q52Vk7YP75pNT+T22ACzhy8allIhXD8ulUJ7gnxm+I A==;
X-CSE-ConnectionGUID: CsF1D7kISHiafJKBS/2bKA==
X-CSE-MsgGUID: D2JgC7heQlC+3Kys0n4hFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094738"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094738"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:24 -0700
X-CSE-ConnectionGUID: fl4xG8mrRGOuovU6/c+5HA==
X-CSE-MsgGUID: OpHkfW5rQEq+jFPu4dlD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333804"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:20 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 04/10] drm/i915: add pme_enabled() to the parent interface
Date: Fri, 11 Sep 2026 11:04:42 +0300
Message-ID: <20260911080448.778316-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911080448.778316-1-vinod.govindapillai@intel.com>
References: <20260911080448.778316-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

PME capabiliy need to be assessed very early during runtime suspend
routine to avoid resetting HPDs during IRQ resets. As display
runtime pm routines are being executed in the independent intel
display driver entry points, we need to have independent access
to the pme status as well. Add a provision to query the optional
pme_enabled to the parent interface so that it could be called
independently based on xe/i915's pme_enabled() implementation.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_rpm.c | 7 +++++++
 drivers/gpu/drm/i915/display/intel_display_rpm.h | 1 +
 include/drm/intel/display_parent_interface.h     | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.c b/drivers/gpu/drm/i915/display/intel_display_rpm.c
index 0a331f89b4db..9927119a0fd1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rpm.c
+++ b/drivers/gpu/drm/i915/display/intel_display_rpm.c
@@ -46,6 +46,13 @@ bool intel_display_rpm_suspended(struct intel_display *display)
 	return display->parent->rpm->suspended(display->drm);
 }
 
+bool intel_display_rpm_pme_enabled(struct intel_display *display)
+{
+	const struct intel_display_rpm_interface *rpm = display->parent->rpm;
+
+	return rpm->pme_enabled && rpm->pme_enabled(display->drm);
+}
+
 void assert_display_rpm_held(struct intel_display *display)
 {
 	display->parent->rpm->assert_held(display->drm);
diff --git a/drivers/gpu/drm/i915/display/intel_display_rpm.h b/drivers/gpu/drm/i915/display/intel_display_rpm.h
index 6ef48515f84b..5d9a1cdddfa7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_rpm.h
+++ b/drivers/gpu/drm/i915/display/intel_display_rpm.h
@@ -21,6 +21,7 @@ void intel_display_rpm_put(struct intel_display *display, struct ref_tracker *wa
 
 /* Only for special cases. */
 bool intel_display_rpm_suspended(struct intel_display *display);
+bool intel_display_rpm_pme_enabled(struct intel_display *display);
 
 void assert_display_rpm_held(struct intel_display *display);
 void intel_display_rpm_assert_block(struct intel_display *display);
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 5e44c022d1ae..f36134e89cb6 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -196,6 +196,7 @@ struct intel_display_rpm_interface {
 	void (*put_unchecked)(const struct drm_device *drm);
 
 	bool (*suspended)(const struct drm_device *drm);
+	bool (*pme_enabled)(const struct drm_device *drm); /* Optional */
 	void (*assert_held)(const struct drm_device *drm);
 	void (*assert_block)(const struct drm_device *drm);
 	void (*assert_unblock)(const struct drm_device *drm);
-- 
2.43.0

