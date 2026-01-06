Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565BACEFD0C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 20:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FA110E03D;
	Tue,  6 Jan 2026 20:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dm6VDnO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F4510E03D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 20:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767732934; x=1799268934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qtIGMq5chKMwxeZokX1klf45AKh6hH0N550SMfyJLr4=;
 b=Dm6VDnO2E7xPoi9R85WYxb+Eve6SFmoOClDmVg/TbXqpV6eoClv6mg2z
 6uux6nEL2Kr4K8VFBLMNI/8wtG40UwDe31KVaZAH09aAnWSrWo343QCgc
 sIBpWvbnhSnHyoYzoqX++6UK/FxC7AerQXrjluolBix/fqHbuk3qgwj4G
 5jneRvVEvq8MY+YATaHkN6kJakRrST52KyWZfQazZM95Ch5rHc304aEt7
 ZqOi1TEFbr9IkG0jxbeRrQTEluurosRLh4BEuBVTsBYV/wDhHwp7ezZx4
 MDxgpDWrbatDjGUI70/EVGPk3jQR7eXsEfMp7Af7rEOEvdoDdStD/utgE Q==;
X-CSE-ConnectionGUID: gTPdeHdZRzWvV24wGm3UrA==
X-CSE-MsgGUID: 5/QBiX5eRuSkV2mCaE+c/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69013381"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69013381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 12:55:34 -0800
X-CSE-ConnectionGUID: sw3ZFnlZTWWgRVhf2b/+gA==
X-CSE-MsgGUID: 4Pcvqg7qTCWiWZBoNXV4/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="203200788"
Received: from dut4450lnl.fm.intel.com ([10.105.10.103])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 12:55:33 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 stuart.summers@intel.com, matthew.brost@intel.com
Subject: [PATCH v3] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset
Date: Tue,  6 Jan 2026 20:55:34 +0000
Message-ID: <20260106205533.60180-2-jonathan.cavitt@intel.com>
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

v2: Rebase

v3: goto retry_same_fence if ct is not alive (Stuart)

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..0bdcbe6503a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1238,6 +1238,10 @@ int xe_guc_ct_send_g2h_handler(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return ret;
 }
 
+#define ct_alive(ct)    \
+	(xe_guc_ct_enabled(ct) && !ct->ctbs.h2g.info.broken && \
+	 !ct->ctbs.g2h.info.broken)
+
 /*
  * Check if a GT reset is in progress or will occur and if GT reset brought the
  * CT back up. Randomly picking 5 seconds for an upper limit to do a GT a reset.
@@ -1247,12 +1251,8 @@ static bool retry_failure(struct xe_guc_ct *ct, int ret)
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
@@ -1304,7 +1304,11 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
 	 * and g2h_fence_cancel.
 	 */
-	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
+	ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) ||
+				 READ_ONCE(g2h_fence.done), HZ);
+	if (!ct_alive(ct))
+		goto retry_same_fence;
+
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
 		if (READ_ONCE(g2h_fence.done)) {
-- 
2.43.0

