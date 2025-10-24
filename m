Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E5DCCF9E9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 13:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673A10EA8A;
	Fri, 24 Oct 2025 13:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgQ6ztyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC1F10EA87
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761311972; x=1792847972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oE2Wqfhjg8xd1cG/1LGwkVUo/PtwLA/i1g1/oMb5wME=;
 b=UgQ6ztyBRdZ0sV9DHomIMGOIj0ojO46M9kxWNRKP99cs1bX90YchG7XS
 RHD66ccdWo2w0dkQyVPC1+iiLLQpkZy8sccF3svcbNP6ditcQdkSpKIjs
 Kezn2XCZ1DMmP7V03oY9/Rhe7EYIkX2/DQhW7TnaJaSYJmnDeGOAcyjNh
 wucFWC8oHW4ZS/F3mddJtbGuwdlKydJlbZVP/durgnCTsr0IexR3/RR3n
 Rdk/AXEIi9LJn+KHtA4++nx87v3nuMrqUXYH5O5/5NehhxME7Q9cz1ik3
 bqkGTAzUDbKkKM5ZvfEAsTxyX7MFtDTMLHhvKA0KtGFgROys00wSxFPZU g==;
X-CSE-ConnectionGUID: pvOcFjpKTTqAKjv1ryB5OA==
X-CSE-MsgGUID: WT33ORrXSVSsOshrC0w2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74613297"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="74613297"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 06:19:32 -0700
X-CSE-ConnectionGUID: Iey2EB4dTG+6NqG48GQJgg==
X-CSE-MsgGUID: mecYxFgBTmmj2XcfoXa6vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="185200732"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2025 06:19:29 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v8 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Date: Fri, 24 Oct 2025 19:05:25 +0530
Message-ID: <20251024133522.16970-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
References: <20251024133522.16970-5-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
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

The MI_STORE_DATA_IMM instruction header is quad dword in size. If the
vCPU halts during save/restore while this sequence is being programmed,
partial writes may trigger page faults when saving IGPU CCS metadata.
Update instruction header atomically.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

---
V7 -> V8:
- None.

V6 -> V7:
-None.

V5 -> V6:
- Use emit_atomic() function to write MI_STORE_DATA_IMM instruction
(Matt B).

V4 -> V5:
- Fixed review comments (Matt B).

V3 -> V4:
- New commit added.

V2 -> V3:
- None

V1 -> V2:
- None
---
 drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 005dc26a0393..b5d36073194d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -89,6 +89,8 @@ struct xe_migrate {
 #define MAX_NUM_PTE 512
 #define IDENTITY_OFFSET 256ULL
 
+static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size);
+
 /*
  * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
  * legal value accepted.  Since that instruction field is always stored in
@@ -596,6 +598,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	return cmds;
 }
 
+#define EMIT_STORE_DATA_IMM_DW 4
 static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram, bool is_comp_pte,
@@ -619,11 +622,16 @@ static void emit_pte(struct xe_migrate *m,
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
 	while (ptes) {
+		u32 dw[EMIT_STORE_DATA_IMM_DW] = {MI_NOOP}, i = 0;
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
-		bb->cs[bb->len++] = ofs;
-		bb->cs[bb->len++] = 0;
+		dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		dw[i++] = ofs;
+		dw[i++] = 0;
+
+		emit_atomic(m->q->gt, &bb->cs[bb->len], dw, sizeof(dw));
+
+		bb->len += i;
 
 		cur_ofs = ofs;
 		ofs += chunk * 8;
-- 
2.51.0

