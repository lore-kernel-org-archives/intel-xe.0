Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E21EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CC610E2CA;
	Tue,  4 Jul 2023 09:53:05 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EC810E2C8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464383; x=1720000383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/0zxbu9Njf52VFacnKcOWlbR3PL0v7OeSOAJyPjrjgY=;
 b=O2e0Cqr6HQ/GYsxmO7oyqWnal07YeX+9j20LorPN++Ah04l3icAhn4u9
 7fUoWZ+wU4XHTOW1D/d1a7DB9cUM0WF3RgXfBXdAZFJ6kQA8sPl914hdh
 Qf+HbLh2J5kjFkSqJXeQW80EGHB4qFstbUHkWvjA/CRyWDaTr8r+HHh1A
 KtofNcXSYn2oKeckUEIF24QKqqas4kxr1VIEJN+HNFFl0LKjR30t6xQgj
 gfvaBtUaCxgwCM5s964dPA/UWSBBOokcgYmiCnPNYmMNooKflgWQ24z9Q
 I8C4a/KNuBsLkh/tPFl8KAil/T9B8MRhQdJUQIz+bkrv64W5AIjtaRWMD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123237"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123237"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696098999"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696098999"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:00 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:05 +0300
Message-Id: <20230704095129.269872-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 03/27] dept: Add single event dependency tracker APIs
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

Wrapped the base APIs for easier annotation on wait and event. Start
with supporting waiters on each single event. More general support for
multiple events is a future work. Do more when the need arises.

How to annotate (the simplest way):

1. Initaialize a map for the interesting wait.

   /*
    * Recommand to place along with the wait instance.
    */
   struct dept_map my_wait;

   /*
    * Recommand to place in the initialization code.
    */
   sdt_map_init(&my_wait);

2. Place the following at the wait code.

   sdt_wait(&my_wait);

3. Place the following at the event code.

   sdt_event(&my_wait);

That's it!

Signed-off-by: Byungchul Park <byungchul@sk.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/dept_sdt.h | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 include/linux/dept_sdt.h

diff --git a/include/linux/dept_sdt.h b/include/linux/dept_sdt.h
new file mode 100644
index 000000000000..12a793b90c7e
--- /dev/null
+++ b/include/linux/dept_sdt.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Single-event Dependency Tracker
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2020 LG Electronics, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_SDT_H
+#define __LINUX_DEPT_SDT_H
+
+#include <linux/kernel.h>
+#include <linux/dept.h>
+
+#ifdef CONFIG_DEPT
+#define sdt_map_init(m)							\
+	do {								\
+		static struct dept_key __key;				\
+		dept_map_init(m, &__key, 0, #m);			\
+	} while (0)
+
+#define sdt_map_init_key(m, k)		dept_map_init(m, k, 0, #m)
+
+#define sdt_wait(m)							\
+	do {								\
+		dept_request_event(m);					\
+		dept_wait(m, 1UL, _THIS_IP_, __func__, 0);		\
+	} while (0)
+
+/*
+ * sdt_might_sleep() and its family will be committed in __schedule()
+ * when it actually gets to __schedule(). Both dept_request_event() and
+ * dept_wait() will be performed on the commit.
+ */
+
+/*
+ * Use the code location as the class key if an explicit map is not used.
+ */
+#define sdt_might_sleep_start(m)					\
+	do {								\
+		struct dept_map *__m = m;				\
+		static struct dept_key __key;				\
+		dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__);\
+	} while (0)
+
+#define sdt_might_sleep_end()		dept_clean_stage()
+
+#define sdt_ecxt_enter(m)		dept_ecxt_enter(m, 1UL, _THIS_IP_, "start", "event", 0)
+#define sdt_event(m)			dept_event(m, 1UL, _THIS_IP_, __func__)
+#define sdt_ecxt_exit(m)		dept_ecxt_exit(m, 1UL, _THIS_IP_)
+#else /* !CONFIG_DEPT */
+#define sdt_map_init(m)			do { } while (0)
+#define sdt_map_init_key(m, k)		do { (void)(k); } while (0)
+#define sdt_wait(m)			do { } while (0)
+#define sdt_might_sleep_start(m)	do { } while (0)
+#define sdt_might_sleep_end()		do { } while (0)
+#define sdt_ecxt_enter(m)		do { } while (0)
+#define sdt_event(m)			do { } while (0)
+#define sdt_ecxt_exit(m)		do { } while (0)
+#endif
+#endif /* __LINUX_DEPT_SDT_H */
-- 
2.40.0

