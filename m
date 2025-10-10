Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AACCCD18C
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00410EBC6;
	Fri, 10 Oct 2025 12:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdAwY2Qh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CD710EBC6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760098911; x=1791634911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9I9lCCh0rfnGyEWpYcvguPtJbL3ct75WTvZ1nVPFHr4=;
 b=UdAwY2QhXJg6BE4coEshRty5Qj2+HE4LP7u+hQ67VJw6+CPjDN0U1Y9h
 4VfYiLuhPL5b5Ew1c7ON5KdHoOlRGKJGUMOznEfHcsPAa2Or2EJ9lxRc0
 MzAuwFszSE2xgUxveu1eVt4taqVwEazW48AoVEh+3bwSLVbHCqDMJPKSQ
 KhuARFDgd1hogv08qh/y3SAKKDd5/Rwv/am3fGDP+/LDhEHX/lX52+lo5
 zwo3f4gwaP9tnhFXI89VBp6aRxENrFhsVAjhhXrzTWuP8ahVv+EGhmod4
 qRqCJq7aiPEFwAUkK+u5LX5vVtfjnFgeyEN1utOKQSzVBCb+aY1k5YlU9 A==;
X-CSE-ConnectionGUID: /nY8zEHBQ2aoyJTQvwCt8Q==
X-CSE-MsgGUID: n/JXTozZTkidCR3/X+cWQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="61525557"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="61525557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 05:21:51 -0700
X-CSE-ConnectionGUID: XHeeNulxQhS5mjHHYABEpg==
X-CSE-MsgGUID: fNzFY7szSF6K1DaM87WrHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180913237"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 05:21:50 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v6 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Date: Fri, 10 Oct 2025 18:09:03 +0530
Message-ID: <20251010123900.15278-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
References: <20251010123900.15278-5-satyanarayana.k.v.p@intel.com>
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
index 8f7fb3f561e7..3f97ad759ffd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -82,6 +82,8 @@ struct xe_migrate {
 #define MAX_NUM_PTE 512
 #define IDENTITY_OFFSET 256ULL
 
+static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size);
+
 /*
  * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
  * legal value accepted.  Since that instruction field is always stored in
@@ -583,6 +585,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	return cmds;
 }
 
+#define EMIT_STORE_DATA_IMM_DW 4
 static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram, bool is_comp_pte,
@@ -606,11 +609,16 @@ static void emit_pte(struct xe_migrate *m,
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

