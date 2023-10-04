Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359EBE8FDC8
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 03:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4910E08A;
	Wed,  4 Oct 2023 03:10:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F0910E0B8;
 Wed,  4 Oct 2023 03:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696389006; x=1727925006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nk3VUhZ1BxYK3drToKj1TvHiW4Haevfh2k+af2MjBEY=;
 b=ETuhi6ILD4NpDb9NMy0Le04zYny/gJbkuyI8jj+advyBdREZWlPTKAq9
 L29PX9gfoi+FoxDGWRNkep8dt+padwgXtIPjcatGvZzNPr85StMWzkfAY
 403l+1v9SJCY/rThAPyEUXRhpUgYnWYN5CAVlT8Aia1Wk1RQ144r8Kklz
 6A6pZYp2W/TIK09OcS92/xlvfkq64AFzGbIlFt7hnTQ5IRPgI5TzHJ9Yd
 5WpVOv4O+NWawyv/FSP8yWc4vqWCPSYq3UaApfPD/LpZdwPIiWTRr45pQ
 F11G0AEVVUqXQDaoGDLA/8o9aO2cF9z/Opakm2VnHlDpgOikEn38+meUl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="363308396"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="363308396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894760362"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="894760362"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:08:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  3 Oct 2023 20:10:12 -0700
Message-Id: <20231004031023.3444455-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004031023.3444455-1-lucas.demarchi@intel.com>
References: <20231004031023.3444455-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH i-g-t v2 02/13] lib/gpu_cmds: Remove prefix from
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

