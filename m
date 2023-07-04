Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE061EB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0010E2C7;
	Tue,  4 Jul 2023 09:53:41 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2C810E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464420; x=1720000420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TusTE9OPPLb2vNOxFfs78PU8qQnB3cwnOdatYvj1Bj0=;
 b=B6y0k0+FmmPMWxzL80bbVjVvociNht9VCwkHEiDgCtR7gRH9lhmTK9KA
 RcWRhZI5adLG4cBO224CuYNOJ6WQGcO0OMyNC7UmhJ7+5LypHuLz59W71
 2Bla3QtNwniC3cu/cfyWsIkeRSd5PR7NxR0QOfnXLBSE9kaNRqbHX0tOe
 MelyDbYlQrUUZ+zWiJvuB+ItC4M7FOhTpCWIum7I37dbQBJRYNO2DavVL
 chWD1qR0FDZXxGArD2MnOx0Qci4na9g2LdEGNrT1nCNaZUDmNKY1zTgZ+
 EBlb0lc4977ga5vTYaSVgrSmz0UlQh/7c8VlAQ3v9VU2R1RaRqIwG9Jbs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123374"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123374"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696099158"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696099158"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:37 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:21 +0300
Message-Id: <20230704095129.269872-20-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 19/27] dept: Apply timeout consideration to swait
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
consideration to swait, assuming an input 'ret' in ___swait_event()
macro is used as a timeout value.

Signed-off-by: Byungchul Park <byungchul@sk.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/swait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/swait.h b/include/linux/swait.h
index 02848211cef5..def1e47bb678 100644
--- a/include/linux/swait.h
+++ b/include/linux/swait.h
@@ -162,7 +162,7 @@ extern void finish_swait(struct swait_queue_head *q, struct swait_queue *wait);
 	struct swait_queue __wait;					\
 	long __ret = ret;						\
 									\
-	sdt_might_sleep_start(NULL);					\
+	sdt_might_sleep_start_timeout(NULL, __ret);			\
 	INIT_LIST_HEAD(&__wait.task_list);				\
 	for (;;) {							\
 		long __int = prepare_to_swait_event(&wq, &__wait, state);\
-- 
2.40.0

