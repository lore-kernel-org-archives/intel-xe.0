Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76531D3B9BE
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BCB10E781;
	Wed, 10 Dec 2025 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lTfjCb0Y";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF5A10E76A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hk1+KWeTiutX1SS3eOdb5yHvjirRf55wMrKnUvBlyGE=; b=lTfjCb0YXpCjd9Fryew5VIBrN+
 XJxrbIVZAkDUi2YPkZiAPVUMDjGMd8Cd83Kh83cGjBRT33frF0h83LinXcaK2uywfMYjZilSoht+a
 2Y/OlqR/jy04qQAwR3QgXHSek7aQWAWMJHKts9eG6/fzHqhAQOukybk2x2Q6BkCPpuipLb40Avb0f
 BfqoNj42SrQp5OiA08n7OuyXsBV2wL1g6Z/vNWDUPp56hcynrhabCZV8lRkDYFkxGlYAM0LufGhAA
 MF9y5NFIj/LrSamemeIRE2SWC0skKFWS9zn5iWI1Rb93ZgbNfZJLQajqqryQCFQ9KLiWlEiHyF4o/
 XHszEnhg==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTNat-00B3sB-01
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 18:03:15 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 03/10] drm/xe/xelpg: Limit AuxCCS ring buffer programming to
 Alderlake
Date: Wed, 10 Dec 2025 18:03:03 +0100
Message-ID: <20251210170310.15114-4-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210170310.15114-1-tursulin@igalia.com>
References: <20251210170310.15114-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

At the moment the driver does not support AuxCCS at all due respective
modifiers being hidden from userspace.

As we are about to start enabling them, starting with Alderlake, let us
begin by limiting the ring buffer support to just that initial platform.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index ac0c6dcffe15..5336ea626031 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -289,9 +289,9 @@ static bool has_aux_ccs(struct xe_device *xe)
 	 * PVC is a special case that has no compression of either type
 	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
 	 * onward, so any future platforms with no FlatCCS will not have
-	 * AuxCCS either.
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	 */
-	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
+	if (GRAPHICS_VERx100(xe) >= 1270 || xe->info.platform == XE_PVC)
 		return false;
 
 	return !xe->info.has_flat_ccs;
-- 
2.52.0

