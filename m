Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A45CEB64DA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 09:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D6710E2C3;
	Tue,  4 Jul 2023 09:52:58 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A0610E2C3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688464376; x=1720000376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c5mcN6HVn9rGysrzV4eTlGQicnSl4gU7sOhBBKmzVdE=;
 b=IOmWE9jjRNdYbZbOQ/wS+6/JK52UjPYuwVaz7vlyYf0VALnGs9gz3xw+
 P8B5NCCbau20FYSH/gUaSd+l1klv8Sq2G6l+vZcOzR2iaom9TTp9VsBeO
 cHBD2YO6cXfjwq33CltM1ZCUiizlLr3zBStIwE/YvxYRn7G36Vg+cXM4P
 BEwFK2tDyJtwFZ5HBsN2Xe98ZOTx4dpDy11H+ng+lB4dzqxD9eJNKUn04
 VrRkT90i0T1XGu2sx25Jpdy1fjqofSuH+qiVegL9OeTBtoSFLzP6OHE6g
 SsXI1KPdwMuFwPah/tYwsXMVObhRr+0i+pyqicO79oG5ObWAhTYGAFVEb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429123219"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="429123219"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="696098950"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="696098950"
Received: from tmacyszy-mobl1.ger.corp.intel.com (HELO rapter.intel.com)
 ([10.249.150.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:52:53 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 12:51:03 +0300
Message-Id: <20230704095129.269872-2-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
References: <20230704095129.269872-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 01/27] llist: Move llist_{head,
 node} definition to types.h
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

llist_head and llist_node can be used by very primitives. For example,
Dept for tracking dependency uses llist things in its header. To avoid
header dependency, move those to types.h.

Signed-off-by: Byungchul Park <byungchul@sk.com>
Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 include/linux/llist.h | 8 --------
 include/linux/types.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 85bda2d02d65..99cc3c30f79c 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -53,14 +53,6 @@
 #include <linux/stddef.h>
 #include <linux/types.h>
 
-struct llist_head {
-	struct llist_node *first;
-};
-
-struct llist_node {
-	struct llist_node *next;
-};
-
 #define LLIST_HEAD_INIT(name)	{ NULL }
 #define LLIST_HEAD(name)	struct llist_head name = LLIST_HEAD_INIT(name)
 
diff --git a/include/linux/types.h b/include/linux/types.h
index 688fb943556a..0ddb0d722b3d 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -193,6 +193,14 @@ struct hlist_node {
 	struct hlist_node *next, **pprev;
 };
 
+struct llist_head {
+	struct llist_node *first;
+};
+
+struct llist_node {
+	struct llist_node *next;
+};
+
 struct ustat {
 	__kernel_daddr_t	f_tfree;
 #ifdef CONFIG_ARCH_32BIT_USTAT_F_TINODE
-- 
2.40.0

