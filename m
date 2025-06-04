Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38383C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 18:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC4F10E782;
	Wed,  4 Jun 2025 18:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="An5IPPhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8BD10E7EA
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749060932; x=1780596932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=948vh3L8Tx7Qm7lhprg157od+0HlbEqVHoTeogZvXGA=;
 b=An5IPPhMP32G0EuXo6x1HLtVrralZRx7MjR3HpnwalDZIviGo3UyZ2nt
 LUfxGyC3EZbZr50b5nhNcNlooW52J6rsFFwgfZ0IrOxbVn/1E7atxBuDp
 XZhfGgLMJ6pLo44+iyYL7DQX+adcB6UgsmLQBPbhmABNm0MssSfgbFMKG
 0mT+XpYoS1HHBALZrhiFgDvgZP6AWkqWYg1wDJNXAlzh9t+C/eEZpOA41
 70w/SzjiBLSihg97zTsl23PqZRhmxYbQwmAGwL9cdhY+jBkt7II9gJH+o
 6cO380QDpJyEIagU/+XscvMeuj3VmXFoIShjLTUszw6QrQ79Y6/k7n7Jr Q==;
X-CSE-ConnectionGUID: DyjkLDXTRKu7xNijwTbibA==
X-CSE-MsgGUID: J5h4n0JNT4OlHEvQTgf+GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51078796"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51078796"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:15:32 -0700
X-CSE-ConnectionGUID: Ljzs93qnTGS/CVtExD4NXA==
X-CSE-MsgGUID: 1NIBJ8F1T4SMxFzULJnegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145863800"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.107])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 11:15:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/bmg: fix compressed VRAM handling
Date: Wed,  4 Jun 2025 19:15:12 +0100
Message-ID: <20250604181511.1629551-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

There looks to be an issue in our compression handling when the BO pages
are very fragmented, where we choose to skip the identity map and
instead fall back to emitting the PTEs by hand when migrating memory,
such that we can hopefully do more work per blit operation. However in
such a case we need to ensure the src PTEs are correctly tagged with a
compression enabled PAT index on dgpu xe2+, otherwise the copy will
simply treat the src memory as uncompressed, leading to corruption if
the memory was compressed by the user.

To fix this it looks like we can pass use_comp_pat into emit_pte() on
the src side.

There are reports of VRAM corruption in some heavy user workloads, which
might be related: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4495

Fixes: 523f191cc0c7 ("drm/xe/xe_migrate: Handle migration logic for xe2+ dgfx")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..16788ecf924a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -863,7 +863,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
 			xe_res_next(&src_it, src_L0);
 		else
-			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs,
+			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs || use_comp_pat,
 				 &src_it, src_L0, src);
 
 		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
-- 
2.49.0

