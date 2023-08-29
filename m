Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7037FC83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BD210E336;
	Tue, 29 Aug 2023 14:13:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3384710E29B;
 Tue, 29 Aug 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693318380; x=1724854380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5uuuJ1uw8eWIq6icCaijrodp5nqg3EBMXAP9ocJkj0=;
 b=BlSmJus9QE851K/aJJ09EImtX+BPD/w/3lbMFRz18XDP/1w4zJdPzIwQ
 75TERpuqtcOPW3y9D013Nkng2oh1GJZw8qGKDwoQHjs35+pRhLiay518c
 JwUuVW2EZ1Jwk4V82w/geiOfgX5a384GplWRbqPYKZIewhKQebOTblYph
 ICEUnjUXykmmmqjxxQFXRNWnHt4OOacXKSAP52iC/U9yGiC/JqLsMuRtf
 XjwOfY0G/SithQ0LY7dFBXPGlXuvGq7ejRK/UhrCUn+vfzg45/6Lyev9C
 wmx7KDNEWXhioBQGrZCfdUIpqZ/b89AGlyHZViN2Ss4B9B54YY6AOioMs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441733944"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441733944"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804123960"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804123960"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:07 -0700
Message-Id: <20230829141107.1505705-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt 4/4] tests/xe_debugfs: skip page table level
 check for Xe2
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
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Starting with Xe2, a 5-level page table is always used, regardless of
the actual virtual address range supported by the platform. Do not
depend on VA range to configure max page table level.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/xe/xe_debugfs.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index e51d03661..72c069bfc 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -74,6 +74,7 @@ static int validate_entries(int fd, const char *add_path, const char * const str
 static void
 test_base(int fd, struct drm_xe_query_config *config)
 {
+	uint16_t devid = intel_get_drm_devid(fd);
 	static const char * const expected_files[] = {
 		"gt0",
 		"gt1",
@@ -86,7 +87,6 @@ test_base(int fd, struct drm_xe_query_config *config)
 		"clients",
 		"name"
 	};
-
 	char reference[4096];
 	int val = 0;
 
@@ -104,16 +104,19 @@ test_base(int fd, struct drm_xe_query_config *config)
 
 	igt_assert(igt_debugfs_search(fd, "info", reference));
 
-	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
-	case 48:
-		val = 3;
-		break;
-	case 57:
-		val = 4;
-		break;
+	if (!AT_LEAST_GEN(devid, 20)) {
+		switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
+		case 48:
+			val = 3;
+			break;
+		case 57:
+			val = 4;
+			break;
+		}
+
+		sprintf(reference, "vm_max_level %d", val);
+		igt_assert(igt_debugfs_search(fd, "info", reference));
 	}
-	sprintf(reference, "vm_max_level %d", val);
-	igt_assert(igt_debugfs_search(fd, "info", reference));
 
 	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
 	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
-- 
2.40.1

