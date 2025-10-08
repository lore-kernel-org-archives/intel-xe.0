Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E2DCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 09:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCFA10E7D0;
	Wed,  8 Oct 2025 09:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pgz7EJGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110B310E7B9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759917276; x=1791453276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xLChclMgZHh00qoDKufj/m/Zr+E4vNkzwTo9J/jeYjs=;
 b=Pgz7EJGBlpBIATxP5iYfBGPbfFSGsRTH0kzR7s93rqS/xJQu0U0FK8WW
 GoxNscZtRl9iNVCZf9F/eCqnP1DrGrZ75em7Za2q4z8q30SshaSGnioxO
 tlXQfaR1OhqMvKomX7Zn0k8N4bQAYX7YPn0deFK68SZ7s0KbJAoXGzFKe
 lsZwuShvUWcUtYuCQxDY+BSJFRDwnZjk6EbDVaPnuA1endrCPWN6z419w
 L1F2jrs7U5ZwJON8Rlw8fdjo7Jm9htt6JxoDY5zU9wtKIfAzKl1KVhZmV
 a5LlLLWYn/zJL1kUpCcrPKrmPAUUOSfJVnCvP+Vo7XviQnYCHNXesQQ6p A==;
X-CSE-ConnectionGUID: 4MkyZpEyRB+m9oQuxlCbvA==
X-CSE-MsgGUID: bia5FitsQDCMEacy1uFKXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65958492"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="65958492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 02:54:36 -0700
X-CSE-ConnectionGUID: ZlrJdE/gRy+sjQ1joS/w+Q==
X-CSE-MsgGUID: pdSGW0rGRRGk8f1aFD5GOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="180425487"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 08 Oct 2025 02:54:34 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 2/3] drm/xe/migrate: Make emit_pte() header write atomic
Date: Wed,  8 Oct 2025 15:41:48 +0530
Message-ID: <20251008101145.11506-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
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
V4 -> V5:
- Fixed review comments (Matt B).

V3 -> V4:
- New commit added.

V2 -> V3:
- None

V1 -> V2:
- None
---
 drivers/gpu/drm/xe/xe_migrate.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b629072956ee..7097da1555ca 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -607,9 +607,14 @@ static void emit_pte(struct xe_migrate *m,
 
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
+		u32 dw[SZ_2], i = 0;
+
+		dw[i++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
+		dw[i++] = ofs;
+
+		WRITE_ONCE(*(u64 *)&bb->cs[bb->len], *(u64 *)dw);
+		bb->len += i;
 
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
-		bb->cs[bb->len++] = ofs;
 		bb->cs[bb->len++] = 0;
 
 		cur_ofs = ofs;
-- 
2.51.0

