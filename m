Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B19D3B994
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 20:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7733310E036;
	Tue,  9 Dec 2025 20:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIaw01Tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C9D10E0A1
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 20:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765312517; x=1796848517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eeK361EAhU943IPldiNaclGueHlsC3XVi/pstelnLk0=;
 b=RIaw01Tl+jJemnznMgXBmMcgejjbn62X7ep5te1mFilri4vcqv0Xqppt
 rSM9jfDGwHHVmUx/ZpGxnj2TguBJ7FF35l9g6d/gCUJXo0TccrlqOvGK7
 ovZ+RIdnljftEhGSX90CsgNupgEZb2zeLNDYfqq6I+Jk+Gev6QjMT1wb6
 Ci2rhO/3WqM3OCgRbH98XC6B8kUoycZFLUn5NtSLintJXnG9TVimW113R
 TqwmS0rnd8Ur2EWxFwsce1jYlXrIgRxPf1x0yeUjGQdAlfMohpoNDdPly
 XVnDnXg4MS4V4VWZioRIqN7LVhg6f7VRaQlnuERN1jHY2sS09cjlOd6// w==;
X-CSE-ConnectionGUID: spa/La+tQaC7Avfj50ZbZg==
X-CSE-MsgGUID: 25RrvgDkSz2ryCMndsJhTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77896070"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="77896070"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:35:17 -0800
X-CSE-ConnectionGUID: apDmzxojRZiI5fCmfQigkw==
X-CSE-MsgGUID: 6qGxtO1XTUWQl1Zv5uLvng==
X-ExtLoop1: 1
Received: from dut4419lnl.fm.intel.com ([10.105.10.210])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 12:35:17 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 stuart.summers@intel.com
Subject: [PATCH] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset
Date: Tue,  9 Dec 2025 20:35:17 +0000
Message-ID: <20251209203516.155703-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

It's possible if unlikely that the GuC could be reset in the time
between performing a guc_ct_send and the G2H fence completing in
guc_ct_send_recv.  Exit early if this is occurs.

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 648f0f523abb..438a460106db 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1231,6 +1231,10 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return ret;
 }
 
+#define ct_alive(ct)    \
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)
+
 /*
  * Check if a GT reset is in progress or will occur and if GT reset brought the
  * CT back up. Randomly picking 5 seconds for an upper limit to do a GT a reset.
@@ -1240,12 +1244,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
 	if (!(ret == -EDEADLK || ret == -EPIPE || ret == -ENODEV))
 		return false;
 
-#define ct_alive(ct)	\
-	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
-	 !ct->ctbs.g2h.info.broken)
 	if (!wait_event_interruptible_timeout(ct->wq, ct_alive(ct), HZ * 5))
 		return false;
-#undef ct_alive
 
 	return true;
 }
@@ -1294,7 +1294,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		return ret;
 	}
 
-	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
+	ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) || g2h_fence.done, HZ);
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
 		if (g2h_fence.done) {
-- 
2.43.0

