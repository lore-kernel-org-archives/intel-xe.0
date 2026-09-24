Return-Path: <intel-xe-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0101BC98315
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 06:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589710E8EB;
	Thu, 24 Sep 2026 06:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnulRD1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2EB10F2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790230172; x=1821766172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a7vZAPKGJDru0zlds1LTiRpUPISOi0tqaTn120oqzKc=;
 b=SnulRD1mBpUKAGNOcx+RFP2MJSk2HJBvh8r/UlyRdqoqjATO/YIomT50
 ld+Iayvz8VZRpzeQFfbvKvg+n1wO0cmkS0frlMxq1EVTMQMEtGe9NrIBw
 GLRUb5v1nTZY2PZF8Trt3GTRoO9UrmXyChaMCvz2z0saX0FJ1FlNktNU/
 Oo1fx7JQgvb91UVzogJBa04VdtkHOeq4e2YVzBzvVfQIfx5OJsN1RYI+3
 vU+4JXZ7ALi8pvqG4MY/I2xF3nhc4wqAZccHu1P1nYd+FQfKZIlrYW5Nr
 +vZIZo2SNTcJV4l5ZAYK8bUJB4kNgIvMiQL2DG6obJyrMGvd4M/bt/t/Z w==;
X-CSE-ConnectionGUID: Q4Ljxlb5Q5iUVlTVv7Dmjw==
X-CSE-MsgGUID: GbP3g0BMTJilFtLL+rdI0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90853958"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90853958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 23:09:31 -0700
X-CSE-ConnectionGUID: 0JPeh5lnQG6xbuMd8j89bA==
X-CSE-MsgGUID: uKdK4txWT/q7w4ddtYF+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277096636"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 23 Sep 2026 23:09:28 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 dnyaneshwar.bhadane@intel.com, anoop.c.vijay@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH v9 04/10] drm/xe/sysctrl: Make sysctrl_read_frame() void
Date: Thu, 24 Sep 2026 11:39:05 +0530
Message-ID: <20260924060900.146167-16-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
References: <20260924060900.146167-12-mallesh.koujalagi@intel.com>
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

Convert it to return void and remove the unnecessary error
handling in sysctrl_process_frame().

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
index 745ba41ecdd7..c78e8021a8ea 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
@@ -68,8 +68,8 @@ static void sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
 		xe_mmio_write32(sc->mmio, regs[i], val[i]);
 }
 
-static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
-			      size_t len)
+static void sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
+			       size_t len)
 {
 	static const struct xe_reg regs[] = {
 		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
@@ -85,8 +85,6 @@ static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
 		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
 
 	memcpy(frame, val, len);
-
-	return 0;
 }
 
 static void sysctrl_clear_response(struct xe_sysctrl *sc)
@@ -194,10 +192,7 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
 	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
 	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
 
-	ret = sysctrl_read_frame(sc, out, frame_size);
-	if (ret)
-		return ret;
-
+	sysctrl_read_frame(sc, out, frame_size);
 	sysctrl_clear_response(sc);
 
 	if (curr_frame == total_frames)
-- 
2.48.1

