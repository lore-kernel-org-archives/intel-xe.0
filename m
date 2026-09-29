Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D1C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 04:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0167510EADA;
	Tue, 29 Sep 2026 04:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECVykUMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FBB10EADA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 04:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790655331; x=1822191331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=53LiV7aH7pkVjvwXy4rHtkO29OWRNKQJHr4qb6QvHMk=;
 b=ECVykUMegnwusYltIb3wS0Lqf7VWlOvUMvk92hbXGJagRyCQBhXKo0oS
 KEeI7pPVFrv3KOJmlgJmTdJw7rbLVJngOM3c6kA+BFOQyN7a6061F9+CU
 Q55SDK5aOfIwnUCO4URcsaPb+C3cqvkzsMsg4lOuNl3MTtI5dRBKyrgI1
 egy2KaEAWsonSxXuuashplzs7NceGm/CDBBlZPFILL9zh3al39HTAirLe
 DihGwLYoiFf/3dxR9CMxeJHWQd6CMVnRhmmoM3+qELmXE8DNdN6/RejBi
 11McKqRfv/kPcEA5ZIzYUl5rgrUbLeiKvNgANsm1bXj03xZRiyJ7Cw10D Q==;
X-CSE-ConnectionGUID: lo/SJ7afSEuruRwgCTGuSg==
X-CSE-MsgGUID: fs/MLRp5QNKoLsa2K0N+/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90264861"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="90264861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:15:30 -0700
X-CSE-ConnectionGUID: NKOCY+RWS/O3QvZJ1EellQ==
X-CSE-MsgGUID: 61AA8GksQ7Ca4FbrTQPU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="271725084"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:15:29 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH] drm/xe/guc: Let xe_guc_ct_send_locked() callers reserve G2H
 credit
Date: Tue, 29 Sep 2026 10:33:42 +0530
Message-Id: <20260929050342.221789-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Commit d4a7e1611716 ("drm/xe: batch CT pagefault acks with periodic
flush") added a defer_flush argument to xe_guc_ct_send_locked(). At the
same time it dropped the g2h_len and num_g2h arguments, which had no
in-tree users, and hardcoded a zero G2H reservation.

That leaves no way to send an H2G that expects a G2H reply while
already holding ct->lock. The G2H receive path (parse_g2h_event() and
g2h_fast_path()) releases credit unconditionally for replies such as
DEREGISTER_CONTEXT_DONE, SCHED_CONTEXT_MODE_DONE and
TLB_INVALIDATION_DONE. If the credit was never reserved,
__g2h_release_space() reports an "Invalid G2H release" and marks the CT
dead with CT_DEAD_G2H_RELEASE.

Replacing two u32 arguments with a bool also means a caller written
against the old signature can silently change meaning when the two
reservation arguments get merged into one: the call still compiles,
still sends the H2G, and loses only the reservation.

Add g2h_len and num_g2h back, ahead of defer_flush, so that the
function matches xe_guc_ct_send() and forwards both values to
guc_ct_send_locked(). The kernel-doc now says when a reservation is
required and that a non-zero reservation must not be made from a G2H
handler, because waiting for credit can dequeue G2H inline.

The only existing caller, the pagefault ack path, does not expect a
reply. It passes 0, 0 and behaves exactly as before.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c        | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct.h        |  2 +-
 drivers/gpu/drm/xe/xe_guc_pagefault.c |  3 ++-
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5c393aa29de3..da5ce97484b8 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1290,11 +1290,23 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
  * @ct: GuC CT object
  * @action: payload dwords (HxG header dword is expected at @action[-1])
  * @len: number of payload dwords in @action
+ * @g2h_len: G2H response space to reserve in dwords, or 0
+ * @num_g2h: number of G2H messages expected, or 0
  * @defer_flush: defer publishing/doorbell for batching
  *
  * Sends a single H2G message to the GuC CT buffer while the caller already
  * holds @ct->lock.
  *
+ * Callers that expect the GuC to reply with a G2H message must reserve the
+ * matching credit via @g2h_len / @num_g2h. The G2H receive path releases that
+ * credit unconditionally when the reply arrives, so failing to reserve it here
+ * corrupts the G2H accounting and kills the CT channel.
+ *
+ * Reserving G2H credit may wait for, and process, outstanding G2H messages, so
+ * this must not be called with a non-zero @g2h_len from a G2H handler. Handlers
+ * should use xe_guc_ct_send_g2h_handler(), with any reply credit reserved up
+ * front by the H2G that triggered the handler.
+ *
  * If @defer_flush is false, the function completes the submission immediately:
  * it makes the payload visible to the device, updates the H2G descriptor and
  * rings the GuC doorbell.
@@ -1312,11 +1324,12 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
  *   Must be called with @ct->lock held.
  */
 int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			  bool defer_flush)
+			  u32 g2h_len, u32 num_g2h, bool defer_flush)
 {
 	int ret;
 
-	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, defer_flush);
+	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL,
+				 defer_flush);
 	if (ret == -EDEADLK)
 		kick_reset(ct);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 3ddc665ab84a..e2a33249d65d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -56,7 +56,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
 int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 		   u32 g2h_len, u32 num_g2h);
 int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
-			  bool defer_flush);
+			  u32 g2h_len, u32 num_g2h, bool defer_flush);
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer);
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index df237fd40551..6b48550e7579 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -55,7 +55,8 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
 	bool write_only = guc->pagefault_ack_counter++ &
 		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
 
-	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
+	/* Pagefault acks are fire-and-forget, no G2H reply expected. */
+	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action), 0, 0,
 			      write_only);
 }
 
-- 
2.34.1

