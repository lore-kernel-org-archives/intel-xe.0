Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBE9C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936F210E305;
	Wed, 15 Mar 2023 18:36:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235410E301
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678905362; x=1710441362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pnew75HVLiZMxgOxfMrUqHpKaJM7gid9Ht0Du3zG/hM=;
 b=LzylbjyGyGTrte/LlN5cGJDBEbuIwlqTk13jqjB9jqmVis6Z/IUok7G4
 4XwJOKbX6mVpDq4qutWoALa9aqnLUnvoLbDR4tpq1pEckzVTxajIeYzxy
 xfU/hRl2/IBwOQLh1fW47gh7pBd+8xxaMJ6a7Ia9TYCeN0+AoklBa520Q
 HXDEx/QBJ3JzsS82eXfRmTMChebmSaJpVw7ln0vfbNBIxOSyEo8A2vQw1
 iijcQx6ZgaFaTBR+6m2TR9qFKiIIAWC+JVUTh8dZ+cU8RVV/csJ/8CQLO
 GnBuzklJaOYb093B59XMgQPG4w00fc3eP5fkaX+lCnHJldMfcIUFhtv4N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="336480515"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="336480515"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 11:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="681959815"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="681959815"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 11:36:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Mar 2023 11:35:59 -0700
Message-Id: <20230315183602.4028516-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315183602.4028516-1-matthew.brost@intel.com>
References: <20230315183602.4028516-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] maple_tree: split up MA_STATE() macro
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
Cc: paulo.r.zanoni@intel.com, lionel.g.landwerlin@intel.com, dakr@redhat.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Danilo Krummrich <dakr@redhat.com>

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iterator {
	struct ma_state mas;
	struct sample_mgr *mgr;
};

\#define SAMPLE_ITERATOR(name, __mgr, start)			\
	struct sample_iterator name = {				\
		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
		.mgr = __mgr,					\
	}

\#define sample_iter_for_each_range(it__, entry__, end__) \
	mas_for_each(&(it__).mas, entry__, end__)

--

struct sample *sample;
SAMPLE_ITERATOR(si, min);

sample_iter_for_each_range(&si, sample, max) {
	frob(mgr, sample);
}

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index e594db58a0f1..baeb989c6e14 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -424,8 +424,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define MA_STATE_INIT(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.alloc = NULL,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.34.1

