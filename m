Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7462C61DD9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EA610F3F9;
	Fri, 28 Aug 2026 15:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxPuOnes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525610E640
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930068; x=1819466068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K+5qHfo7vZwEm508mQoLYVJjHwwi4dXi0V+Q6QucUps=;
 b=VxPuOnesVd8XuUIFj5altE9t7jiQEBL1tOngRTxHXspBq7gytSniqgDx
 2TICbl0LMzwA+ymBlPkN/l4HRbpHTAKj1K+k+9Et2QtZzEgLGyF0OX6o6
 nEPkW5DhzCgr764dC4qGnc+zWoKa6jBaMu0GTXMbWdAjU6FnxN4d83G1l
 HjRJSSeZ0UAk0lmhG2fM4o1Dct9zmKelGUZXjK403r9FMpSiSwEqaeK4I
 o0LYTRo3iUzEqCBgJULb2gurHm0fLpoD7A2lXGOPPhwZrr6CgMWJTctON
 7CRgOUl7D025AHQZZ3lJHDNohb3Zhqavu56DJOQ97aU0j2cAV447EVtIz g==;
X-CSE-ConnectionGUID: 163PNg79T9ms3qaVzuABTg==
X-CSE-MsgGUID: g6vwtLi/SDmEgc/nRyPqPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92252195"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92252195"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:28 -0700
X-CSE-ConnectionGUID: sMkeiQWpTQW8pjsTRea24g==
X-CSE-MsgGUID: SoTR7CTPSoK88hbG12eJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268746422"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@kernel.org
Subject: [PATCH 3/5] drm/xe/vram: report FLAT_CCS base misalignment
Date: Fri, 28 Aug 2026 16:14:09 +0100
Message-ID: <20260828151405.662533-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828151405.662533-7-matthew.auld@intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
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

So we can easily check if a machine had the CCS bug, when looking back
over bug reports where we have the same machine with newer kernel.

Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: stable@kernel.org
---
 drivers/gpu/drm/xe/xe_vram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7b4478fb1697..0a2f1ab8416e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
 		offset *= num_enabled; /* convert to SW view */
 
+		if (!IS_ALIGNED(offset, SZ_128K))
+			drm_info(&xe->drm, "FLAT_CCS base misaligned: %llx\n", offset);
+
 		/*
 		 * Everything below this offset is handed to the VRAM
 		 * allocator, so it has to be the *first* address the
-- 
2.55.0

