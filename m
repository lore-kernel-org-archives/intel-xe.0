Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B681CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98F710E64D;
	Tue, 19 Aug 2025 18:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gw1NGQM8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CFB10E64D
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755629061; x=1787165061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wx8pvMoWC1DvHvnMjWwKpHGP7HgOIGuIS+0+yYcxFJA=;
 b=Gw1NGQM8KdbxGCbzpGjyLBUDHIoMKaYwCzOeYirHLND1jIWc6dyk1QwK
 nLmLu70xwYgmET6edcb1b1RNMbNr83UoqVXsqqZRGjEmYY91z/3h6Y7Lg
 BwNmi87qAul8WgkJVZ7xbq6BmZj0To0Ahyz/b8G04Fj9nwilV+Fi89dU8
 hnhC3HqjbiMiM3W/J3RLjHozAQ0wjxcWkODMiupGOjvq4aB8dXSJefzon
 nVI/kqkBnw+DBBmTnO0OyHtT4ssmfIPVTARTZGfUR1FUcn3OAtp59QDMr
 +/LsAetmY+74NfeTiLm8BSdNPzYS2czQ3TNvAA1YpEat8W9YzpGDQdDm3 w==;
X-CSE-ConnectionGUID: ZysIIcTTS7OYeushiwToSA==
X-CSE-MsgGUID: ARdUZSkgTpWeIQnWyKVOcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68983372"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="68983372"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:44:21 -0700
X-CSE-ConnectionGUID: ENczjZdRRSaEteRCTGoBdA==
X-CSE-MsgGUID: m9jY3ajXTxmcGQcvAduBig==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:44:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 1/1] drm/xe/xe_sync: avoid race during ufence signaling
Date: Tue, 19 Aug 2025 20:44:04 +0200
Message-ID: <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
References: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

During vm-bind ioctl ops execute fence may be signaled during the call.
If vm-bind syncs to user-fence it creates a race because signaling
happens in the worker. This means control may return from vm-bind
ioctl and consecutive vm-bind operation to same vma (unmap) may happen
on still not signaled user-fence. This finally ends with -EBUSY error
because even if vma operations completed fence still exists but
userspace was unblocked with copy_to_user() call.

Instead of releasing user-fences in workqueue for already signaled
ops put them synchronously in the same vm-bind ioctl call.

Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index f87276df18f2..8becc3755649 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -103,6 +103,15 @@ static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
 	dma_fence_put(fence);
 }
 
+static void kick_ufence_sync(struct xe_user_fence *ufence, struct dma_fence *fence)
+{
+	if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
+		XE_WARN_ON("Copy to user failed");
+	WRITE_ONCE(ufence->signalled, 1);
+	user_fence_put(ufence);
+	dma_fence_put(fence);
+}
+
 static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
@@ -244,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 		err = dma_fence_add_callback(fence, &sync->ufence->cb,
 					     user_fence_cb);
 		if (err == -ENOENT) {
-			kick_ufence(sync->ufence, fence);
+			kick_ufence_sync(sync->ufence, fence);
 		} else if (err) {
 			XE_WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
-- 
2.43.0

