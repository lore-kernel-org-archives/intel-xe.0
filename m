Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F78EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 17:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF7410E4DB;
	Fri, 30 Jun 2023 17:58:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66F10E4DC
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688147878; x=1719683878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=if5IpnrcRjrzwhUS8Fjh5WFoJtO43vhStE6lKcnBmU8=;
 b=Iq+T95ZSlWE3s/ELx3pgpUdiPdUHMseTMjpHp0m0qgm27r+NlByoYfPY
 WksYR11Ze+8kxbCDUO7/XL9VrLZXZM+vo285FKAKYsjPYuF/iMu1tB9qO
 ARBY7z3JvJclrDmVhpxjBgL3aS/7qjZu8d0TUxn4jOLeKm3y1XRQ31ngm
 X38z6ukIPpU6KzeGxiuD01Fjavhcbav2700mOzJBeaWwn04qC7BtXVNor
 YBP7s9/F2f3KSFT/xNziIoX6rEY6MHxejjP5mNRn2+QPvAx5GlnWycOpG
 FIo0DklFmYmssnbItzDt77sBLJ/NCNDNkeO0v6wPn9LfJcA3Kx52/Nf4S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365942724"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="365942724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841925446"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="841925446"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:57:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 30 Jun 2023 10:57:59 -0700
Message-Id: <20230630175804.1096370-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630175804.1096370-1-matthew.brost@intel.com>
References: <20230630175804.1096370-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 4/9] maple_tree: split up MA_STATE() macro
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

