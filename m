Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2B6EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4A210E2C3;
	Tue,  4 Jul 2023 09:54:04 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B6310E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464443; x=1720000443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pE106AChbQKoYpzmla+dUNvzJDT5+L20DfgloDJR++E=;
 b=eSkvY4dtAoMta94HS21oCaGEnvBW3lpCV4dy6WZMZNnu3NiXtbWSIW5D
 1O4M54Hz8Hoo3jMjHvvliJvWPqL2ME5uhfq3mv1q0tbupmViY3OaqJccH
 hp57bXeK9YzccNmnTw1BB+HFIdiDclhflArAScMfAtgYeNVi4W6fY/she
 wPyT9F6RHcc3R+Z4YnOFYH7VvEELsu1VCwpWqG3cv6U3p+nx8LGBFDt2n
 3uLNmY/GPCOtgNQbdvDWxMTcd7IW4IW2zCHJ5j/ePqjYtlFZm5kV0MbQH
 O5LxtDZ83AZyjOBFa5wzSdgRojylhGWvQN15W9VmmaqvRNLuR2Se++mln Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123460"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123460"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696099217"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696099217"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:53:55 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:29 +0300
Message-Id: <20230704095129.269872-28-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 27/27] HAX: dept: Increase DEPT_MAX_WAIT_HIST /
 DEPT_MAX_ECXT_HELD to track more
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
 include/linux/dept.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dept.h b/include/linux/dept.h
index ad32ea7b57bb..cd2ed8619424 100644
--- a/include/linux/dept.h
+++ b/include/linux/dept.h
@@ -17,8 +17,8 @@
 struct task_struct;
 
 #define DEPT_MAX_STACK_ENTRY		16
-#define DEPT_MAX_WAIT_HIST		64
-#define DEPT_MAX_ECXT_HELD		48
+#define DEPT_MAX_WAIT_HIST		256
+#define DEPT_MAX_ECXT_HELD		96
 
 #define DEPT_MAX_SUBCLASSES		16
 #define DEPT_MAX_SUBCLASSES_EVT		2
-- 
2.40.0

