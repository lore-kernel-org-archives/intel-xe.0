Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F27F53D69
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 15:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D643210E3A0;
	Mon, 16 Mar 2026 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YCVV3OU9";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61A010E39E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OkArCljfCOiaElh+YsUOQj1hMkvYasXtemMoOP8KeyQ=; b=YCVV3OU9BQJRrKw38zIAzi5DOx
 lAvclT9Uft8aHcquSbd9qEl79IzpxmAw93ENAbHEZDZImrr84Ovg1O3j7cLuZED+LqI7ONJ03VQlv
 daFkxCFvAu5Tl+lLcfm97OxAznqiCijTML7Fh6YpsOBBIoyNFAAfKghkI90e5jlGTJXPS9hrQIFTe
 cRpoXBEtcuzXp26qhLa7vTuJLsaBBRQf+bsZpNFSzD7OkudrFIG2fc7jcu3+HSmt2vncOKgJqsxjf
 I69fezPH8mjQeJz0IWWZgn0AyK2W06jSqfI2A4UUhYj5rz1GpSUfzkCZHue6hUYN+w5sg6oODvKAp
 Nu3QtaNg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w29sr-00GZ2H-0d; Mon, 16 Mar 2026 16:29:33 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v22 03/12] drm/xe/xelpg: Limit AuxCCS ring buffer programming
 to Alderlake
Date: Mon, 16 Mar 2026 15:29:23 +0000
Message-ID: <20260316152929.1247-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
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

At the moment the driver does not support AuxCCS at all due respective
modifiers being hidden from userspace.

As we are about to start enabling them, starting with Alderlake, let us
begin by limiting the ring buffer support to just that initial platform.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 53d420d72164..07235a895f4b 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -305,9 +305,9 @@ static bool has_aux_ccs(struct xe_device *xe)
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

