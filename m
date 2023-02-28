Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0209C7EE2E
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 10:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DE510E688;
	Tue, 28 Feb 2023 10:42:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD7210E68B
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 10:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677580930; x=1709116930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tv7C+0p3m1x+VpF4hwvuK2F7dDhdsyyVIxSIImMabEs=;
 b=FV6I52Nxh0pdA93awCzb8bDXUb6EdC2+2DYDkPZrJSxH6pBHp4KQdxSz
 X2UB30D7ZofNMn8RX5NnAPAmSwRgUfdkSkjG5bPPDq9QCMY20URRcfnTk
 AgQw+vaN/M+2nsaxo13SwHBz8r2NNklTI4I74ILddi3faGmIxqO/k4r3E
 JeFnKARxsWueA1YPNkSJGERq61pU1eJi6PunNMjcYe8uTl5rYxuurdfuC
 6Bo8HGS7JG4BjYATQO/tQ4PTh72MDOP8O1BcFZ18QN8CYCjlHD8cFLMxF
 Itrn21Vf/B5PDMBdkAITLI1QLvpaFTKY5fs4N9QOIIGgu98HnzIuQyQ99 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398884726"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="398884726"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738108979"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; d="scan'208";a="738108979"
Received: from mistoan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.9.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 02:42:09 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Feb 2023 10:41:34 +0000
Message-Id: <20230228104137.80965-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104137.80965-1-matthew.auld@intel.com>
References: <20230228104137.80965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/14] drm/xe/migrate: retain CCS aux state
 for vram -> vram
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index bc69ec17d5ad..94c85421e1a5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -546,11 +546,19 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 
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
2.39.2

