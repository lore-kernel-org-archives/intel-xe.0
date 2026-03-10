Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAADEB107C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 15:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA9110E717;
	Tue, 10 Mar 2026 15:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReO47uHN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7155310E2C3;
 Tue, 10 Mar 2026 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773158288; x=1804694288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=suJDybSf2bJqRVbjzEF27konpZySIM4+uxLXQPLFNOQ=;
 b=ReO47uHNH9k9BunfAypS04DP906Ubcxs14jgQqLsDmwFStuZqfcarUkR
 2md2vpxnCOhRUQY86sqKTPPV5rqjnsAqJyOmh5HeZpATIdFYS9NiXc9jL
 FzBaxyFLveFN6yOuWssIsDN+r2TYXOWxgDRefsFkdJ1X6eRGm8GFTHNwe
 iT6khaiYuQaeov8zUMICZ6TH32CJBpUiKPsVeTEZdrdg+PDO1ed9XUTeO
 UW4oPgIJVpeVFL4k464NKGHM4BvS6nbsg30Or0eQKy3R8V+xk+BZkGIbi
 aNKmKXMzCZhBwuEW25xNribYYXPB3lrgyKZE7L48RNkp5oHgtUBLNrffg A==;
X-CSE-ConnectionGUID: 4UJ8cgz4REqkVALKZ4FvmA==
X-CSE-MsgGUID: JeX8hQP3TOaKFHVPnCM/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84842725"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84842725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:58:08 -0700
X-CSE-ConnectionGUID: 9lrVPpsOQMOw2aUR9hxX3g==
X-CSE-MsgGUID: qevIcnH6Sci9p6WR8mT8Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224615389"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 08:58:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 John Falkowski <john.falkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lahtinen Joonas <joonas.lahtinen@intel.com>,
 David Howells <dhowells@redhat.com>,
 Christian Brauner <brauner@kernel.org>, Kees Cook <kees@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, LMKL <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH RESEND 1/2] watch_queue: Add a DRM_XE_NOTIFY watch type
 and export init_watch()
Date: Tue, 10 Mar 2026 16:57:40 +0100
Message-ID: <20260310155741.87191-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310155741.87191-1-thomas.hellstrom@linux.intel.com>
References: <20260310155741.87191-1-thomas.hellstrom@linux.intel.com>
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

Add a DRM_XE_NOTIFY watch type for asynchronous error notifications
from the DRM_XE kernel module.

Also export the init_watch() function for use from kernel drivers.
Use EXPORT_SYMBOL() to align with other exports from the same file.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/uapi/linux/watch_queue.h |  3 ++-
 kernel/watch_queue.c             | 13 ++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/watch_queue.h b/include/uapi/linux/watch_queue.h
index c3d8320b5d3a..c800c153989d 100644
--- a/include/uapi/linux/watch_queue.h
+++ b/include/uapi/linux/watch_queue.h
@@ -14,7 +14,8 @@
 enum watch_notification_type {
 	WATCH_TYPE_META		= 0,	/* Special record */
 	WATCH_TYPE_KEY_NOTIFY	= 1,	/* Key change event notification */
-	WATCH_TYPE__NR		= 2
+	WATCH_TYPE_DRM_XE_NOTIFY	= 2,	/* DRM device event notification */
+	WATCH_TYPE__NR		= 3
 };
 
 enum watch_meta_notification_subtype {
diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 538520861e8b..701b5c388808 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -445,11 +445,17 @@ static void put_watch(struct watch *watch)
 }
 
 /**
- * init_watch - Initialise a watch
+ * init_watch() - Initialise a watch subscription
  * @watch: The watch to initialise.
- * @wqueue: The queue to assign.
+ * @wqueue: The watch queue (notification pipe) to associate with the watch.
  *
- * Initialise a watch and set the watch queue.
+ * Initialise a newly allocated watch object and associate it with @wqueue.
+ * The caller must subsequently set @watch->id and @watch->info_id before
+ * calling add_watch_to_object() to subscribe the watch to a notification
+ * source.
+ *
+ * The watch queue reference is held internally; call put_watch_queue() if
+ * the watch is not successfully passed to add_watch_to_object().
  */
 void init_watch(struct watch *watch, struct watch_queue *wqueue)
 {
@@ -458,6 +464,7 @@ void init_watch(struct watch *watch, struct watch_queue *wqueue)
 	INIT_HLIST_NODE(&watch->queue_node);
 	rcu_assign_pointer(watch->queue, wqueue);
 }
+EXPORT_SYMBOL(init_watch);
 
 static int add_one_watch(struct watch *watch, struct watch_list *wlist, struct watch_queue *wqueue)
 {
-- 
2.53.0

