Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C62C88E7B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 19:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CFE10F1D5;
	Mon, 14 Sep 2026 19:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoVCHt5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E031810F1C2;
 Mon, 14 Sep 2026 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789415283; x=1820951283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IHWJOpPJ73H9EoPlxv9GHLJhZh5z18q38DIzYj7RtQQ=;
 b=CoVCHt5/tBHZObsSH1SfB+Ig+dngv6c+GNrV+ZDqt6770DmYLwwpD28i
 u4tB4eh4oXyJlYrhz+JFLIpNBQseDCvluCDJAq43u9nPCtph83GRt5TE5
 3i+dTCI10fo//A/5tlNGdD3Y42BlyNo1dhM4L6SteiyXCSsfRYtHvs0Pm
 tGy9aq618SDSqCPa9Q56gQRpWQZ4SkVVlxBXI2V4Gnnpc9/7TSOQxYOn0
 m8eONh5UkHpqn4BcHyX38ULX7/0GPWRN/QbEK124aCMUn5HhhJJ0MQGIG
 Ev7b3QUEeEAIKz0kQ1mmgpG77eCU4Gvt+1bn3TzFMexEVtMRyQ/Cd/9EP Q==;
X-CSE-ConnectionGUID: 9ah+aPKvTOWvWeI5Wy2PrQ==
X-CSE-MsgGUID: Hup/onSyQu+qVq7Ngvjb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92284849"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92284849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:48:03 -0700
X-CSE-ConnectionGUID: ZzIPn8ZnSsiuhwB0b6FkOg==
X-CSE-MsgGUID: Ly2EX7PkSK2HWOB6QwwjQQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 12:48:01 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v6 4/7] drm/i915: add pme_enabled() to the parent interface
Date: Mon, 14 Sep 2026 22:47:34 +0300
Message-ID: <20260914194737.272679-5-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914194737.272679-1-vinod.govindapillai@intel.com>
References: <20260914194737.272679-1-vinod.govindapillai@intel.com>
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

