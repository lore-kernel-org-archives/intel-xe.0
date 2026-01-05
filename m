Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56BEC2A083
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B9510E3AE;
	Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLRGhHAn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72BE10E289
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585766; x=1799121766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LsMZfnonLn3X98ZoU/RsInvbI5cBVC5T/CI7zhAqkOw=;
 b=KLRGhHAn8cON7Qip9aTcod4wfl3DVpNn53EVsPjJEC7GNzbhx5krx0FR
 9dVCCSH3E2vwFptIkM0NWYuxCMHLWuJ/HY/hBG114skJ7nr8kJX3i4euf
 DsFJzf0afvQtk4o59jSCOLoqihngnWwH6NQeVuqwrPoqAlaOeniBl36MO
 yu0ZBKlP2HEh9bGd9xpp7dQxPUCV41Y6w8yhZvKd3KvWxgKHbPxGdlGQU
 Zq0S8pzrKeiiF5Re2ea5rEbClIUfzwFUQssFutmcRXvc1JA/1CeRSjbBJ
 m2IHp/HgjNouqqyOv43oq5hdy+u4kkS8Pr+3oXn0l/PHUzcRksGAc3S8J A==;
X-CSE-ConnectionGUID: K0fbUYxnSsOJWGO73gnwyw==
X-CSE-MsgGUID: FOwgIX+BSGSdzCZ3QJY8tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856276"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:46 -0800
X-CSE-ConnectionGUID: CdMRlphxRmiQCWPP9H9GKA==
X-CSE-MsgGUID: qxWf/wv7SFu7kDlFeBeGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060692"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 20/22] drm/xe: Document the deadline manager
Date: Sun,  4 Jan 2026 20:02:35 -0800
Message-Id: <20260105040237.1307873-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add kernel-doc describing the Xe deadline manager and its behavior.

The documentation explains the deadline model, state machine, and timer
behavior used to boost frequency and priority as deadlines approach. It
also documents deadline lifecycle rules, queue limitations, locking, and
the Kconfig options that control the boost window and priority boost
sub-window.

This is intended to make the deadline logic easier to reason about and
to clarify the constraints under which it operates, particularly for
latency-sensitive use cases such as compositors.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_deadline_mgr.c | 80 ++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_deadline_mgr.c b/drivers/gpu/drm/xe/xe_deadline_mgr.c
index e2ee23f6e787..0a240e09da9b 100644
--- a/drivers/gpu/drm/xe/xe_deadline_mgr.c
+++ b/drivers/gpu/drm/xe/xe_deadline_mgr.c
@@ -12,6 +12,86 @@
 #include "xe_hw_fence.h"
 #include "xe_trace.h"
 
+/**
+ * DOC: Xe deadline manager
+ *
+ * The Xe deadline manager provides per-exec-queue deadline boosting to help
+ * latency-sensitive workloads (e.g. compositors) avoid missing presentation
+ * deadlines.
+ *
+ * Overview
+ * ========
+ * Userspace may associate an absolute deadline (ktime_t) with the hardware
+ * fence of a submitted job. The manager tracks deadlines for in-flight jobs on
+ * a queue and programs a single hrtimer based on the earliest outstanding
+ * deadline.
+ *
+ * When the earliest deadline approaches, the manager transitions the queue into
+ * a boosted state via @q->ops->set_deadline_state(). Boosting is intended to be
+ * minimal and time-bounded:
+ *
+ *   - Frequency boost begins when the current time is within
+ *     %XE_DEADLINE_WINDOW_US of the deadline.
+ *
+ *   - Optionally, the final portion of the window additionally boosts
+ *     priority. The length of this priority-boost sub-window is controlled by
+ *     %XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT.
+ *
+ * State machine
+ * =============
+ * The manager maintains a current deadline state:
+ *
+ *   - %XE_DEADLINE_MGR_STATE_NO_BOOST   - normal execution.
+ *   - %XE_DEADLINE_MGR_STATE_FREQ_BOOST - frequency boost active.
+ *   - %XE_DEADLINE_MGR_STATE_PRIO_BOOST - priority + frequency boost active.
+ *
+ * For a non-empty deadline list, the manager schedules an hrtimer to fire at:
+ *
+ *     earliest_deadline - %XE_DEADLINE_WINDOW_US
+ *
+ * When the timer fires and the earliest deadline is still pending, the manager
+ * transitions to %XE_DEADLINE_MGR_STATE_FREQ_BOOST or directly to
+ * %XE_DEADLINE_MGR_STATE_PRIO_BOOST depending on
+ * %XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT. If a priority-boost sub-window is
+ * configured, the timer is re-armed to transition from frequency-only to
+ * priority boost at:
+ *
+ *     earliest_deadline - prio_boost_window
+ *
+ * If the earliest deadline changes (add/remove), the timer is canceled and
+ * reprogrammed. If the deadline is already within the configured window when
+ * updated, the appropriate boost state is entered immediately.
+ *
+ * Deadline lifecycle
+ * ==================
+ * Deadlines are tracked per struct xe_hw_fence and stored on
+ * @mgr->deadlines sorted by deadline time (earliest first). Adding a deadline
+ * may be called multiple times for the same fence; upper layers are expected
+ * to only reduce deadlines. Removing a deadline must be done exactly once after
+ * the fence is signaled. After removal, future add attempts for that fence are
+ * treated as NOPs.
+ *
+ * Concurrency and limitations
+ * ===========================
+ * The manager is protected by @mgr->lock (spinlock) and uses an hrtimer in
+ * %CLOCK_MONOTONIC absolute mode.
+ *
+ * Parallel queues are not supported because their job fence is a dma-fence
+ * chain and individual hardware fences may be freed while still referenced by
+ * the manager. Multi-queue is not supported because deadline boosting requires
+ * per-queue control of priority and frequency. The deadline logic is also
+ * disabled when the feature is disabled via Kconfig or when the queue is
+ * created in a boosted state.
+ *
+ * Tuning
+ * ======
+ * %XE_DEADLINE_WINDOW_US controls how early boosting begins relative to the
+ * deadline (default 3000 us). %XE_DEADLINE_PRIO_BOOST_WINDOW_PERCENT controls
+ * what fraction of that window uses priority boosting in addition to frequency
+ * boosting (default 60%). %XE_DEADLINE_EXIT_DELAY_MS controls delay after
+ * deadline is done until boosting mode exits (default 100 ms).
+ */
+
 #ifdef CONFIG_DRM_XE_DEADLINE_WINDOW_US
 #define XE_DEADLINE_WINDOW_US	CONFIG_DRM_XE_DEADLINE_WINDOW_US
 #else
-- 
2.34.1

