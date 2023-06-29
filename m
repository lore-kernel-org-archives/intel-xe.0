Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928BEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666FC10E0B4;
	Thu, 29 Jun 2023 20:10:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5278710E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688069436; x=1719605436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=if5IpnrcRjrzwhUS8Fjh5WFoJtO43vhStE6lKcnBmU8=;
 b=H7UCD4qMi/8YgYYmcJQzOCiboXUt0+z1E/Ik+mHSqEZTANMxY1ai2rNG
 NxTMIUEJ27Bv7vCk/jQMpprwF4IxiBPB4yIXtP1nNGp2rCymLQXpOpVEA
 VcTdKF5tPi2vHMGfbwOkiI5Ph2uqxSXzcTKhkF2Lfp9vUyEHsEYalWqMw
 mmBh1lUdpmnANjrjHaLLVhDHQBAkr14cOhz98cAZQw6r9MWW3OQhepjKd
 DRVuckrRgWGeYPDbuO5py+y0f7pEMXq794qCT3YHfCSm2J3JZNdQKEI4L
 wAr8PZVJvKLUCjJqSICmiXht/gpUJ2Y/2v92IUHC69eQNyi2JMD13FpY9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352039545"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="352039545"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711569612"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711569612"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 13:10:41 -0700
Message-Id: <20230629201046.989033-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629201046.989033-1-matthew.brost@intel.com>
References: <20230629201046.989033-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/9] maple_tree: split up MA_STATE() macro
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

