Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5D4EE6457
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 13:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFF810E635;
	Fri, 15 Sep 2023 13:23:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608610E628;
 Fri, 15 Sep 2023 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694784218; x=1726320218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nk3VUhZ1BxYK3drToKj1TvHiW4Haevfh2k+af2MjBEY=;
 b=SP4rlY9HtpaR1NN3os496dWhrdrgaYT44nlB0zCrh2KKehlFVuab6Wi2
 JE6vA37ngvNMloH3Yk+OYVQsBonMQ3Wrs0zR3wVO/R42/hN0q6vi09BEd
 vV6sXz8EN/aigIBb8OJSgV3Ay+H52VK7BgsZTHAredRSxV66UDBukKTcK
 jjcFrVQq61CZ1W97T9zRyJ3NV+T96SygfXyLuExoTXY8YbR90/FJgs0OA
 jL9MSrMoL+IwsRzyRvjEhgfosyUi7zk7iGWysAlWChAB8dKISZpQw8ac5
 8JQhXNtkfTfjRBZmFhvbNEM90c9e6f9Azrh6cnxT2nFEV54dlyahSiKQT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364292133"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="364292133"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="810515418"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="810515418"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 06:23:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:34 -0700
Message-Id: <20230915132346.1845909-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t 02/14] lib/gpu_cmds: Remove prefix from
 gen7_fill_binding_table()
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

This function is used by pretty much all versions. It's odd to have a
gen7 function end up calling next-gen functions and it's error prone:
when adding something to e.g. a gen8 function to realize that behavior
breaks previous platforms.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/gpu_cmds.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index bb35204fb..648451f74 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 }
 
 static uint32_t
-gen7_fill_binding_table(struct intel_bb *ibb,
-			struct intel_buf *buf)
+fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 {
 	uint32_t binding_table_offset;
 	uint32_t *binding_table;
@@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
 	uint32_t offset;
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, buf);
+	binding_table_offset = fill_binding_table(ibb, buf);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	intel_bb_ptr_align(ibb, 64);
@@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
 	uint32_t offset;
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, buf);
+	binding_table_offset = fill_binding_table(ibb, buf);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	intel_bb_ptr_align(ibb, 64);
@@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
 {
 	uint32_t binding_table_offset, kernel_offset;
 
-	binding_table_offset = gen7_fill_binding_table(ibb, dst);
+	binding_table_offset = fill_binding_table(ibb, dst);
 	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
 
 	memset(idd, 0, sizeof(*idd));
-- 
2.40.1

