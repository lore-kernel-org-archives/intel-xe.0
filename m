Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4B2C6FD19
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2C610E634;
	Mon, 13 Mar 2023 20:46:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09BC10E634
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740362; x=1710276362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RY11Yckoa7dGG4kIHw2enOul5OOzszVyC/5CPNBAWkw=;
 b=St4HLXKCoA097jTNOQq+7zP21cTFyPF3mi+w8rBLnGQsgetnUogEzdHw
 820q7SBahV31LKwIS17vgXZx8MVU0eWB7KyBwHx4GyjzqsSQ8/J+oYfIs
 vyd+X51Eqa1vAq9O/EQOUyryR4vj0s3Zmu9ULH4v3WIwdBbv89gFB4nrY
 uzREgwkVca9xNMdythEON1vHntxbM1UPLjdOUU9ouxb7/Pp/wHC7C2ywf
 2d2HW2os67PK2u4udK1HxQqmuRNj0eLsoj/tAiShkbI9UliL9kAlyUOpY
 pjBBz5McysGDuhMUy5Vdu8YqJNEHj3Tkq7M1ZS4Vksjn1JBphBRoVvvCf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733917"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733917"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650129"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650129"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:18 +0100
Message-Id: <20230313204519.158888-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Use a small negative initial seqno
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

Causes an early 32-bit wrap and may thus help CI catch wrapping errors
that may otherwise not show early enough.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 523c2611ef5d..cfe5fd603787 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -8,7 +8,8 @@
 
 #include "xe_hw_fence_types.h"
 
-#define XE_FENCE_INITIAL_SEQNO 1
+/* Cause an early wrap to catch wrapping errors */
+#define XE_FENCE_INITIAL_SEQNO (-127)
 
 int xe_hw_fence_module_init(void);
 void xe_hw_fence_module_exit(void);
-- 
2.39.2

