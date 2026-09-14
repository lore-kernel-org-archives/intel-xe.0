Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43498C88E6F
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B510F23D;
	Mon, 14 Sep 2026 20:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cg4bE3v+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49C10F233;
 Mon, 14 Sep 2026 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418464; x=1820954464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tULkUlf6HSB2pYUtX+wtVIoEpD1EQhHnLXcZRU0k17E=;
 b=Cg4bE3v+YSWM3VmvfvCHVN/McdTPKLXK5LV3Gp0TkHukMYXa0KR/XwmB
 j0zF3m2+Ei4KHHmVWWf3KuU9vNkh2vkQz/gq0/jrRqEZmNhCVwXBULr6f
 rV9xJJNRqLAOEAV+swKGftBVqQjXNaKlU1fp5anUtVFJP6R1HA/Li4um2
 5N3W9uX0M9wDr4texNatn47eg6XDk/WSnIArHOfi+s3Y9xCVgKdRUl19N
 DqYHcrravhBLC60bgNXrqqAIdmv55fQuV0SbCYCLJTQSf4iezktHXUCyG
 uVgpJD28yxaKK+karIEAjK1Fx9XNA11p85nita8GnpjtNPpxbBGhAgyfc g==;
X-CSE-ConnectionGUID: TRKir2LyTSCk1cHXF9B/uw==
X-CSE-MsgGUID: FYzrAiHLSUixgmcOfuSh3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288140"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288140"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:41:03 -0700
X-CSE-ConnectionGUID: AYeWMBp9TWGQKnKMjM6cHg==
X-CSE-MsgGUID: AVlQhzXcQbGJyopebPOiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113300"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:41:02 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 5/7] drm/i915/xe: plug the pme_enabed implementation for xe
Date: Mon, 14 Sep 2026 23:40:32 +0300
Message-ID: <20260914204034.309566-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
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

v2: use the xe_pm_pme_enabled()

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_rpm.c b/drivers/gpu/drm/xe/display/xe_display_rpm.c
index 548b503aa024..57bcfb41bdda 100644
--- a/drivers/gpu/drm/xe/display/xe_display_rpm.c
+++ b/drivers/gpu/drm/xe/display/xe_display_rpm.c
@@ -45,6 +45,11 @@ static bool xe_display_rpm_suspended(const struct drm_device *drm)
 	return pm_runtime_suspended(xe->drm.dev);
 }
 
+static bool xe_display_rpm_pme_enabled(const struct drm_device *drm)
+{
+	return xe_pm_pme_enabled(to_xe_device(drm));
+}
+
 static void xe_display_rpm_assert_held(const struct drm_device *drm)
 {
 	/* FIXME */
@@ -69,6 +74,7 @@ const struct intel_display_rpm_interface xe_display_rpm_interface = {
 	.put_raw = xe_display_rpm_put,
 	.put_unchecked = xe_display_rpm_put_unchecked,
 	.suspended = xe_display_rpm_suspended,
+	.pme_enabled = xe_display_rpm_pme_enabled,
 	.assert_held = xe_display_rpm_assert_held,
 	.assert_block = xe_display_rpm_assert_block,
 	.assert_unblock = xe_display_rpm_assert_unblock
-- 
2.43.0

