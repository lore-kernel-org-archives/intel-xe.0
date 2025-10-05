Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30B0CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 17:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF8310E2A2;
	Sun,  5 Oct 2025 17:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQ8WXtqE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1386410E2AB
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759685998; x=1791221998;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZI0H7vllZXVEKj1Wyaj85oZV10N8wT8v1ntrIo83eIs=;
 b=UQ8WXtqEdtcbUERnhtDMxyySKv0QJBUbhjXrKMIVhaadP6HXTrDv3Xdn
 HMjRcAmumfzwG+u7w0w4+5SDyrtRxUrQIjaeVpjns/1AYHcouUkadlHEK
 s+9x0j8NeAse0f3QTUH3i/LCFFaM/nJWHtM8+/ST69F0nr35WwrKvc7Kf
 joG7UjxDrqHJmxdgn4JOrRK81BYCjZO3LqXRw3ZaOqrv9J4ujOLbN8E9f
 c3eLFKOZF2GC5syAW3radtps5bo5qjZdmLmRxBpVTAYLkEhopY7XaliYb
 iNm/GRyI/9BCwM2DvxQG4Kp4wX4ibcz2M/OBKm7w6CxYTIXdruBShWI+r w==;
X-CSE-ConnectionGUID: xRJ0WKpAQ1G/lviZVFARUQ==
X-CSE-MsgGUID: qeBkMUDbTO2XxzlFEu4DiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84504802"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="84504802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 10:39:57 -0700
X-CSE-ConnectionGUID: Utxo4UY/T7i1E2PhLH1aUA==
X-CSE-MsgGUID: n/Ib8wRIT2egQA/kpLmTRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="210673045"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 10:39:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/guc: Ratelimit diagnostic messages from the relay
Date: Sun,  5 Oct 2025 19:39:46 +0200
Message-ID: <20251005173946.2784-1-michal.wajdeczko@intel.com>
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

There might be some malicious VFs that by sending an invalid VF2PF
relay messages will flood PF's dmesg with our diagnostics messages.

Rate limit all relay messages, unless running in DEBUG_SRIOV mode.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c       | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_relay_types.h |  4 ++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index e5dc94f3e618..0c0ff24ba62a 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -56,9 +56,19 @@ static struct xe_device *relay_to_xe(struct xe_guc_relay *relay)
 	return gt_to_xe(relay_to_gt(relay));
 }
 
+#define XE_RELAY_DIAG_RATELIMIT_INTERVAL	(10 * HZ)
+#define XE_RELAY_DIAG_RATELIMIT_BURST		10
+
+#define relay_ratelimit_printk(relay, _level, fmt...) ({			\
+	typeof(relay) _r = (relay);						\
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ||				\
+	    ___ratelimit(&_r->diag_ratelimit, "xe_guc_relay"))			\
+		xe_gt_sriov_##_level(relay_to_gt(_r), "relay: " fmt);		\
+})
+
 #define relay_assert(relay, condition)	xe_gt_assert(relay_to_gt(relay), condition)
-#define relay_notice(relay, msg...)	xe_gt_sriov_notice(relay_to_gt(relay), "relay: " msg)
-#define relay_debug(relay, msg...)	xe_gt_sriov_dbg_verbose(relay_to_gt(relay), "relay: " msg)
+#define relay_notice(relay, msg...)	relay_ratelimit_printk((relay), notice, msg)
+#define relay_debug(relay, msg...)	relay_ratelimit_printk((relay), dbg_verbose, msg)
 
 static int relay_get_totalvfs(struct xe_guc_relay *relay)
 {
@@ -345,6 +355,9 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
 	INIT_WORK(&relay->worker, relays_worker_fn);
 	INIT_LIST_HEAD(&relay->pending_relays);
 	INIT_LIST_HEAD(&relay->incoming_actions);
+	ratelimit_state_init(&relay->diag_ratelimit,
+			     XE_RELAY_DIAG_RATELIMIT_INTERVAL,
+			     XE_RELAY_DIAG_RATELIMIT_BURST);
 
 	err = mempool_init_kmalloc_pool(&relay->pool, XE_RELAY_MEMPOOL_MIN_NUM +
 					relay_get_totalvfs(relay),
diff --git a/drivers/gpu/drm/xe/xe_guc_relay_types.h b/drivers/gpu/drm/xe/xe_guc_relay_types.h
index 5999fcb77e96..20eee10856b2 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_relay_types.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_RELAY_TYPES_H_
 
 #include <linux/mempool.h>
+#include <linux/ratelimit_types.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
@@ -31,6 +32,9 @@ struct xe_guc_relay {
 
 	/** @last_rid: last Relay-ID used while sending a message. */
 	u32 last_rid;
+
+	/** @diag_ratelimit: ratelimit state used to throttle diagnostics messages. */
+	struct ratelimit_state diag_ratelimit;
 };
 
 #endif
-- 
2.47.1

