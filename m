Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4CEB64DD
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A3710E2C8;
	Tue,  4 Jul 2023 09:54:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B6410E2C8
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464443; x=1720000443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDzYdtK86qZRUvTxXb19eYko5S3Jnv9345S3dDHDL1U=;
 b=B17zw+E/QhdPXDsIH45YI+WZtbMBjiLhXdJD+8QgwnCB9RdWBYvmllf0
 5lUwLjqpA34LY5UrzeGpFQTnQTzfk+a/fiGZd8pTx7MhUmjua9rS05i2+
 JfjCigIV4ahhA0Pi5xD1wr3rqMIC5nA+Zc6rRllIYOOXeEwUTJBz02eLZ
 Q9s8v7fGzX802X/TeeOW1LK6f5dKXklYfrzK2nRc2g9e5cuVmRuVVZXmv
 xo7U2oMYsKMNxGTyQyYC+BxANqooD7j3espaPJrKvb9FA9auBnpHZSQuW
 dRYVE0Jvg298Mh6X4JA0/Ky93ytZsJJQ1JMJHx4p8R0LOHklAmi2JuBNF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123451"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696099214"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696099214"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:53 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:28 +0300
Message-Id: <20230704095129.269872-27-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 26/27] HAX: dept: Enable Dept by default
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

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 lib/Kconfig.debug | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f78b3d721a2b..856dcb30153c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1222,7 +1222,7 @@ config DEPT
 	select KALLSYMS
 	select KALLSYMS_ALL
 	select PROVE_LOCKING
-	default n
+	default y
 	help
 	  Check dependencies between wait and event and report it if
 	  deadlock possibility has been detected. Multiple reports are
@@ -1237,7 +1237,7 @@ config DEPT
 config DEPT_AGGRESSIVE_TIMEOUT_WAIT
 	bool "Aggressively track even timeout waits"
 	depends on DEPT
-	default n
+	default y
 	help
 	  Timeout wait doesn't contribute to a deadlock. However,
 	  informing a circular dependency might be helpful for cases
-- 
2.40.0

