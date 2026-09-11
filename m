Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475C0C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 08:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D858910F54C;
	Fri, 11 Sep 2026 08:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENMfVhdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3E910F548;
 Fri, 11 Sep 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789113927; x=1820649927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P37Ny+PlGJVHvNEn4VjFYaGuAKUp4HoevHMQXC/6voQ=;
 b=ENMfVhdImkmAy4jQxBP5seE5IuZrGYkGsYtYQJOGKhG6Omx/WXwtoQp4
 6SOCgsLW6KrK9O8grXnSLbIEgDmMOMnd5CeXlRW79s6U7S83v47L477f+
 e0hbo8SOGUFEdTKME8g3U9j06TVT6aFYhpPVM+MT214ZspgJoPbwhI2vI
 mux5gGjsQFSoGNPyCnJUWjVS9+9HdHJwEFokox37WcbjXQSmcveojGTs+
 Yl/yFYo0JrMpgHA45HJ2MnwKy3EBMPpgDMzED5DEKMtWAcWbVh1XFf4UW
 dVH9LQRiGjd6PBNa7rfKCgDtH0iLrqBvOtxzVwxj3Cp6sVfsCyFSH32Yq g==;
X-CSE-ConnectionGUID: xvftmE4YQbKRiQfJ8r2ovQ==
X-CSE-MsgGUID: lHZj3MR+R3iO+zCRh3lnWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101094743"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="101094743"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:27 -0700
X-CSE-ConnectionGUID: aG5Y9jGmQMywlyfiK70mMQ==
X-CSE-MsgGUID: lVQQlH3aRNq2xhesdHRNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="295333931"
Received: from ikozitz-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 01:05:24 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v5 05/10] drm/i915/xe: plug the pme_enabed implementation for
 xe
Date: Fri, 11 Sep 2026 11:04:43 +0300
Message-ID: <20260911080448.778316-6-vinod.govindapillai@intel.com>
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

Plug the pme_enabled query for xe. It will return the current
PME status for the device. For supported platforms, PME is
enabled during runtime suspend calls if the device is PME is capable.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_rpm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_rpm.c b/drivers/gpu/drm/xe/display/xe_display_rpm.c
index 548b503aa024..6d7333eb45c7 100644
--- a/drivers/gpu/drm/xe/display/xe_display_rpm.c
+++ b/drivers/gpu/drm/xe/display/xe_display_rpm.c
@@ -45,6 +45,13 @@ static bool xe_display_rpm_suspended(const struct drm_device *drm)
 	return pm_runtime_suspended(xe->drm.dev);
 }
 
+static bool xe_display_rpm_pme_enabled(const struct drm_device *drm)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	return xe->pme.enabled;
+}
+
 static void xe_display_rpm_assert_held(const struct drm_device *drm)
 {
 	/* FIXME */
@@ -69,6 +76,7 @@ const struct intel_display_rpm_interface xe_display_rpm_interface = {
 	.put_raw = xe_display_rpm_put,
 	.put_unchecked = xe_display_rpm_put_unchecked,
 	.suspended = xe_display_rpm_suspended,
+	.pme_enabled = xe_display_rpm_pme_enabled,
 	.assert_held = xe_display_rpm_assert_held,
 	.assert_block = xe_display_rpm_assert_block,
 	.assert_unblock = xe_display_rpm_assert_unblock
-- 
2.43.0

