Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19F1E6FE51
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 23:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A183910E123;
	Tue, 23 Dec 2025 23:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS1+jsb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FA210E123
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766530969; x=1798066969;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y1PdE72UQQlsRjkh0uvPfZGQWR3SK24THC+HXKOl6N8=;
 b=XS1+jsb9fQ6Ph8UN4OzV6pm+8HQBvNL0opgRFGpwZvCHa8MAz33iPM8y
 4JWac8Ijb+COV/bJ7ITavzwhha24FOSEB2oIsBBn+/NnNJSylLUH/E5g2
 O5xAqccdwwTUPXoQQkwPpBDMKV3gOxURtC6S3rtUJb2DKnEL+IfFf57jd
 SED5qrEojKfPBmpjT1Zgn/MziZzySwxjWQrkAslMzSWzIHrkSqHqOAAQY
 1GgAcyBEXe3BOwJs1wzW+FHUtKENuXigYsMr1ipAKdtCLir9kHcQmgviN
 VCw/WG64DywsiUVfqqDWOuOmF77hB/xBzxDxAMHfk75hQU04zYCA0Gq5+ w==;
X-CSE-ConnectionGUID: WIZf6ddnRH2eDOTh9KcQVQ==
X-CSE-MsgGUID: WsciFO8lQCymB8kzml1V9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55947363"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="55947363"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 15:02:49 -0800
X-CSE-ConnectionGUID: 0+NZmeTFSl+APpN5NaiwpA==
X-CSE-MsgGUID: NomroUCHRKeUguhdgGepwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; d="scan'208";a="204027066"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 15:02:49 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 stuart.summers@intel.com
Subject: [PATCH v2] drm/xe/xe_guc_ct: Exit CT submission fence wait on GT reset
Date: Tue, 23 Dec 2025 23:02:49 +0000
Message-ID: <20251223230248.59814-2-jonathan.cavitt@intel.com>
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

Suggested-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..64ac985867ae 100644
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
@@ -1304,7 +1304,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	/* READ_ONCEs pairs with WRITE_ONCEs in parse_g2h_response
 	 * and g2h_fence_cancel.
 	 */
-	ret = wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fence.done), HZ);
+	ret = wait_event_timeout(ct->g2h_fence_wq, !ct_alive(ct) ||
+				 READ_ONCE(g2h_fence.done), HZ);
 	if (!ret) {
 		LNL_FLUSH_WORK(&ct->g2h_worker);
 		if (READ_ONCE(g2h_fence.done)) {
-- 
2.43.0

