Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8094C001DD
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 21:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D869D10E3B6;
	Wed, 28 Jun 2023 21:41:45 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07210E39D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 21:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687988498; x=1719524498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=if5IpnrcRjrzwhUS8Fjh5WFoJtO43vhStE6lKcnBmU8=;
 b=cHxQUmwssFEGiQQK16eXoBH82ZEa442G8YY+PLMmUhK+WuIV9vySxg/R
 TEdhTMvZbXIfVPLa+0dTg4j+wCqE+Gdi4AEN3N0cLEaJoz27dqB9SpMLp
 jUkTy7re896leZXSPz+9CT7PK3A1OpR6FzCuPxa9KXxPNnvFaIpwyTKyl
 ubkYQSzCbAaMmzlAbbW1jMz947MDHu4Ra1BolgydrUnVNbpSrnmTPDaN2
 eqWVgcZ4eKGIyYcx7kgsvjGOF3kh2d5KSU4zosyt9+m7JU5cVdWyKUuy+
 Df7SB/5ZpUVLm7F6SPURFvRF1v+xmGoik+iUZGAlj9eMqZdtQwl63uSj8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351760089"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351760089"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711183689"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="711183689"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:41:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 14:41:22 -0700
Message-Id: <20230628214127.870717-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230628214127.870717-1-matthew.brost@intel.com>
References: <20230628214127.870717-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/9] maple_tree: split up MA_STATE() macro
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
Cc: Danilo Krummrich <dakr@redhat.com>
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

\#define SAMPLE_ITERATOR(name, __mgr, start)                    \
        struct sample_iterator name = {                         \
                .mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),   \
                .mgr = __mgr,                                   \
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
index 1fadb5f5978b..87d55334f1c2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -423,8 +423,8 @@ struct ma_wr_state {
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
 		.mas_flags = 0,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.34.1

