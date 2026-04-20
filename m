Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDFAF588C2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 13:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152E10E5E9;
	Mon, 20 Apr 2026 13:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="K+7jNfIH";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0E010E5E7
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6CGzsxyrFnUbeybt0qxvu4NOmZgMCMErE0iT0X9LcZ0=; b=K+7jNfIHjsiynUoisK+d32U/S8
 9FwzmbaMunwtvwIp164SGUIturbazvWIS8ThLvTmywujR0RsPFMi/EBtk6H76PhRoP2K7bpIeEcBU
 Ix80yvy2zqJHWfQdLrDg5oFeC/Ch2DtZAnb2hXmDQJmWrJLKILZE1X+jv5AlVn9Uy4tZZONRsQZvg
 P50EGXMS8X+GJDv+hPeWWmWJFwbuzkjyqga4LBybx5E2u9uySf8vJZ1n9Liy3Tz7QVzB+0HpVMd6L
 UZM75Q4xIei4QAYVeLMT1EDN0Fc+VcS10MYR+YqnMkUPKFWTl5AH2mCXmwGA7l3PqCBfmMbrKVYPi
 8tNywDtw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wEoTv-0014RB-1A; Mon, 20 Apr 2026 15:16:07 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/xelp: Fix Wa_18022495364
Date: Mon, 20 Apr 2026 14:16:03 +0100
Message-ID: <20260420131603.70357-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
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

Command parser relative MMIO addressing needs to be enabled when writing
to the register.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: ca33cd271ef9 ("drm/xe/xelp: Add Wa_18022495364")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.18+
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9d12a0d2f0b5..c725cde4508d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1214,7 +1214,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 	if (xe_gt_WARN_ON(lrc->gt, max_len < 3))
 		return -ENOSPC;
 
-	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_LRM_CS_MMIO | MI_LRI_NUM_REGS(1);
 	*cmd++ = CS_DEBUG_MODE2(0).addr;
 	*cmd++ = REG_MASKED_FIELD_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
 
-- 
2.52.0

