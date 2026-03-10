Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F64FD2D69
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9F10E278;
	Tue, 10 Mar 2026 12:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h+QW9iZN";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7B10E278
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EUav3qg9j313IrO6RYKbcueJg1mvKz2Rppw13ZFrjkk=; b=h+QW9iZNp9piSPt8QVK00TEVbU
 kmowRL4do3TCTc1F46PBKrYpxkQXZOPz9JrnCvMppRbHIpSVojbrLry2/xKvXLAmxS27yUZhmCUIW
 jAguRSNB4UKkZF2gAOjy7ZH55iETWjfD02C/LtoG/k35tD16uCgkGbWicBtOZY7ka3nfxN7kIRB+g
 lQT+j0I4xGJ3JtLxiJeHHvVDPRs2M/IRRrAfaZksSWRUaM1dQVHHOATO0vmzwMD8XTegfG9vLvflX
 RUthslyetboOTd+qJr/8yDuKW2ArjsyIudLdUc3414sTW35Ahb4jtez1h0dsSiPTyrhYPW0adyBKP
 QtTHecDw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vzwIs-00CYjN-IW; Tue, 10 Mar 2026 13:35:14 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v21 9/9] drm/xe/xelp: Expose AuxCCS frame buffer modifiers on
 Alderlake-P
Date: Tue, 10 Mar 2026 12:34:53 +0000
Message-ID: <20260310123453.54346-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
References: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
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

Now that we have implemented all the related missing bits we can enable
the AuxCCS compressed modifiers which were disabled in
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:

        [PLANE:32:plane 1A]: type=PRI
                uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=28
                hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000

Display is working fine - no artefacts, no DMAR/PIPE faults.

v2:
 * Adjust patch title. (Rodrigo)

v3:
 * Complete rewrite based on the display parent interface.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index c8dd3faa9b97..5180de285295 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -539,6 +539,13 @@ static const struct intel_display_irq_interface xe_display_irq_interface = {
 	.synchronize = irq_synchronize,
 };
 
+static bool has_auxccs(struct drm_device *drm)
+{
+	struct xe_device *xe = to_xe_device(drm);
+
+	return xe->info.platform == XE_ALDERLAKE_P;
+}
+
 static const struct intel_display_parent_interface parent = {
 	.dsb = &xe_display_dsb_interface,
 	.hdcp = &xe_display_hdcp_interface,
@@ -548,6 +555,7 @@ static const struct intel_display_parent_interface parent = {
 	.pcode = &xe_display_pcode_interface,
 	.rpm = &xe_display_rpm_interface,
 	.stolen = &xe_display_stolen_interface,
+	.has_auxccs = has_auxccs,
 };
 
 /**
-- 
2.52.0

