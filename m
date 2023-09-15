Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576FBCA5519
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124E10E641;
	Fri, 15 Sep 2023 13:23:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547AB10E62E;
 Fri, 15 Sep 2023 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784219; x=1726320219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6a8cVXLAbesT+0KXw9TKZHcWjL65Mk8Q0CaYz2bnKtw=;
 b=Db+Lhbk/vWEK8vSEtRTkhHUR2f1ljMWYZ6QVV7AYa1J9PCjPKg6TnOGr
 Dtna28MFQKc9QcQ4VRBNGkzmAk3NRKXlvJ2hyDe1N7wUvnFZtnfY1ELXy
 Wqp8rtVyyrcyMkSxjubUTf9949BGdJSYIRjgshm1vqebA9ilXaJiOgXIZ
 2KH5kML8GYKjks9GPYvpbNHsdQvxrLoJ/wvOuSPB9MQdt5rSPJdrjugfD
 GHFbgsTFn0fjmoOWDTFuglzBcQuol6azZMbIWJOjafE/ROvnv4Dx+YM3W
 f2wTg6eXoWqSaqE+nG6bS87umXrrsL28/NWw8BIb5qHGO7J3m9RsDjrWy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292143"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292143"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515446"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515446"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:42 -0700
Message-Id: <20230915132346.1845909-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 10/14] lib/intel_mocs: Remove unused
 lefotver defines
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Leftover from previous refactors. Remove since they are unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_mocs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index d9de16932..aafe27692 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -16,8 +16,6 @@
 #define GEN12_MOCS_WB_IDX			2
 #define XE2_MOCS_UC_IDX				3
 #define XE2_MOCS_WB_IDX				1
-#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
-#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
-- 
2.40.1

