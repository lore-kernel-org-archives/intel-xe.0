Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F95BD3CCAB
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94A110E840;
	Fri, 16 Jan 2026 09:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hMjlIOih";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9970310E840
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OZJDXMXOLAM4VqZIrkEKxzvUE4UsA75pYg53aJGeFwA=; b=hMjlIOih5HtmSjeX82SwqBcpdT
 9fJ6TPaRCrABIVIZZbUmcNoelUobjs6KUvEHZN8pg05klVrF12hsVfRqML6qsh5SAtqRvhrbTEONX
 wWGj4YJH8lxR0qylN4Pf8VLF0CA3U19ZvIai7V2kyj2/AOwNvjS1A8Zek01DrktgQ4ey4Iow6mxfG
 oQH4XG4+lIX778RQ6/2TxCn6RgZ/6ef5f0n+MBYSSQrDUP+j26X8ly3sjVN/sKyCQbZGr1+01mO+C
 irxPFL/OqJkG+67/ZgFbO3qtBQx0GUTgHg12qKtHtHZLJ61xALl50b6mHXE0Aiz6Yaqk5gtOj7PCH
 cXDzn1Sg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vggTf-0066AN-It; Fri, 16 Jan 2026 10:50:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe/xelp: Fix Wa_18022495364
Date: Fri, 16 Jan 2026 09:50:40 +0000
Message-ID: <20260116095040.49335-1-tvrtko.ursulin@igalia.com>
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

It looks I mistyped CS_DEBUG_MODE2 as CS_DEBUG_MODE1 when adding the
workaround. Fix it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: ca33cd271ef9 ("drm/xe/xelp: Add Wa_18022495364")
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.18+
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 70eae7d03a27..44f112df4eb2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1200,7 +1200,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
 		return -ENOSPC;
 
 	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
-	*cmd++ = CS_DEBUG_MODE1(0).addr;
+	*cmd++ = CS_DEBUG_MODE2(0).addr;
 	*cmd++ = _MASKED_BIT_ENABLE(INSTRUCTION_STATE_CACHE_INVALIDATE);
 
 	return cmd - batch;
-- 
2.52.0

