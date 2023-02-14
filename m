Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB1C64ED8
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9520310E0D7;
	Tue, 14 Feb 2023 11:24:07 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A296B10E88E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373843; x=1707909843;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QWWzElrpLxz2w/pqy8pDupU3WLEkvzZH6NBi/xSlcvc=;
 b=Qlbf7fKxFppp/wuNWyHvoOMaLSsjETYV3OsO4tPHpHcyrC8YY047A/Us
 2opJ6LaWnzLf7Kj2Va9zRpzW8/mCerM9WSz508K2b6i/aOF0PfEbMjt9l
 2jIogs29W9QycluoUHHy9A6UhtzwnBjQbGn6Dt8GVAoStKOhePy/scOv4
 3V/R40TZCkYGSwun/HlEmYDlMDsimGymuRDIQ8gclIfRCKh0OBtdiwpZf
 eSucoKSU2IhzcG2yUi8KqV9t6L+38uNHFb0ulcDadJlhxN9vIv5+zGFQs
 lsbRiacaxSERApByUG33iEuel6ePOM5nxInyTKMEqWi/e/JiOo5nc2Qn4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450083"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450083"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863237"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863237"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:57 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:33 +0000
Message-Id: <20230214112136.162380-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/15] drm/xe/migrate: retain CCS aux state for
 vram -> vram
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

On small-bar we likely need to be able to deal with vram -> vram
transfers. During eviction, as an optimisation,  we don't always
want/need to kick stuff into smem. Plus for some types of CCS surfaces,
where the clear color needs to be accessed from the CPU, we might need
to migrate it.

v2: (Lucas):
  - s/lmem/vram/ in the commit message
  - Tidy up the code a bit; use one emit_copy_ccs()

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cbcc355cd391..418d4f900cdb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -544,11 +544,19 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 
 	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
 		/*
-		 * If the bo doesn't have any CCS metadata attached, we still
-		 * need to clear it for security reasons.
+		 * If the src is already in vram, then it should already
+		 * have been cleared by us, or has been populated by the
+		 * user. Make sure we copy the CCS aux state as-is.
+		 *
+		 * Otherwise if the bo doesn't have any CCS metadata attached,
+		 * we still need to clear it for security reasons.
 		 */
-		emit_copy_ccs(gt, bb, dst_ofs, true, m->cleared_vram_ofs, false,
-			      dst_size);
+		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_vram_ofs;
+
+		emit_copy_ccs(gt, bb,
+			      dst_ofs, true,
+			      ccs_src_ofs, src_is_vram, dst_size);
+
 		flush_flags = MI_FLUSH_DW_CCS;
 	} else if (copy_ccs) {
 		if (!src_is_vram)
-- 
2.39.1

