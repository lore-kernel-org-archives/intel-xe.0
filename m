Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EA8EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0C110E2C3;
	Tue,  4 Jul 2023 09:53:38 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F7510E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464417; x=1720000417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JFyfeHRPjrACdyh+86G2T2PDg/BCHxPkGYPtUEdy8KM=;
 b=cN2HaJBwSB2GljItlE3U5qqH1e9o0wi4Z6V1ac/BA3byuZWYUY8ll2+C
 6Lz9Eom28MiV0P3FjqqgWZfF2wqG7CyqIeFw0aTy2tyGT+cWYzJQYy4mE
 VVkBGRfFjE7kI40abGApSjlq95t7deuyfIGhEqnLr1SwTe9VIfepOwIJ4
 udoM7nehQOHeTMZtkbjqzTjzb5CEX9QQdF/sFs2xWDnFDIAbhEoK70tHc
 6BaC9nRYar3XvVubrhXyGLL+HnAD5U2DSvugJphbnec3IEC3OqMXxWEDh
 0/lnrlfK/iamSFRwjPMuavPbEl6hLt9RfuKxoimrhR+EOAVAofgo028R0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123358"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123358"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696099146"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696099146"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:34 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:20 +0300
Message-Id: <20230704095129.269872-19-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 18/27] dept: Apply timeout consideration to
 wait_for_completion()/complete()
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
Cc: max.byungchul.park@gmail.com, byungchul@sk.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Byungchul Park <byungchul@sk.com>

Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
consideration to wait_for_completion()/complete().

Signed-off-by: Byungchul Park <byungchul@sk.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/completion.h | 4 ++--
 kernel/sched/completion.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 32d535abebf3..15eede01a451 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -41,9 +41,9 @@ do {							\
  */
 #define init_completion_map(x, m) init_completion(x)
 
-static inline void complete_acquire(struct completion *x)
+static inline void complete_acquire(struct completion *x, long timeout)
 {
-	sdt_might_sleep_start(&x->dmap);
+	sdt_might_sleep_start_timeout(&x->dmap, timeout);
 }
 
 static inline void complete_release(struct completion *x)
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index d57a5c1c1cd9..261807fa7118 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -100,7 +100,7 @@ __wait_for_common(struct completion *x,
 {
 	might_sleep();
 
-	complete_acquire(x);
+	complete_acquire(x, timeout);
 
 	raw_spin_lock_irq(&x->wait.lock);
 	timeout = do_wait_for_common(x, action, timeout, state);
-- 
2.40.0

