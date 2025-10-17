Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E4CCCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 13:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2393810EC3D;
	Fri, 17 Oct 2025 13:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mX0c4JlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAE410EC3C
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760709313; x=1792245313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VbPg5zqgmHw7n21Z6hPr76XGFW2nbBA+XkBPMeyMrBw=;
 b=mX0c4JlMJYX1MkUobBDQ0mUX/nwGsluiCXJgbyOR5CUjLRdmx/JVlDbC
 YRiVXKMrhoWHGG6j6P4vjvhVfP2vGaMrKcjyhrTRGHoIeAYcFG7b8aY+1
 ocCJ1NrUPh0tLuM0mm89HldwzsxsnmjZDfrXGPU0H+SrH/HDB5fj3/vra
 9azp/UXgUkyat4P24raSMUrEsFYqflCY41ZNCOZCxChbp63w35L81AY+o
 XBV3rMzxxkfCJQwj7CS0EFidyJcNWi7Gvgxj4ZYkeL/37C9eZ0V6tZFSc
 7qZwJFsjAWs8T+oYu5m4EzzPpzHVZvTVt+mLf252L1EZF+7WbMWbqBqzn w==;
X-CSE-ConnectionGUID: Km9NFyyAQvCHo87RKsrR5g==
X-CSE-MsgGUID: SsZGyUyYSY6SxDfKNjVlLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80549759"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="80549759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 06:55:12 -0700
X-CSE-ConnectionGUID: ixwJbU8jTJSQjFzCtyHXew==
X-CSE-MsgGUID: cylXiB/eRgabL3R2Z5H6aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="213338060"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa002.jf.intel.com with ESMTP; 17 Oct 2025 06:55:12 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v7 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Date: Fri, 17 Oct 2025 19:42:29 +0530
Message-ID: <20251017141226.924-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
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
index e0be7396a0ab..88634a26ebf5 100644
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

