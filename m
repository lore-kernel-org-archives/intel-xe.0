Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E8D3C92D
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 16:18:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45FD10E77D;
	Wed, 10 Dec 2025 16:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qDLqREmc";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7274010E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 16:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VhkGzrhpM41v8SBUv9DSDe4He5nG8Y8GaA4mdojTz4=; b=qDLqREmcXIf9DOALTJs0OdskBQ
 kKG89jd2vK++fOmY3Yejuoylbry5W2fsRUPWvfnvJclf2gQgx22DcQpOc8ScFj9ph38eCcs/kyMrW
 s34v11pkD1OwQ0lEhoaIQam9EVpW8z0AROAh2uzl5aU+CtdR+bi05EVOtxj9MbW2fsFavR75W/HxY
 G1MdQiTL5wHrn29nSg3mzS7INClmvL36JVAcu4oe+Ba3UYN72unLRFx8NTdxhIL6A3wkRk4aFGQXP
 6/2W3abfjnlii04S7BxUZ19u6eJDXPL29KtSb0vHlCnX4mtKIm7nfQ27wiYLW4Y32tZ+mtx9ea0xF
 +FGYas8g==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTMtH-00B2mj-JN
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:18:11 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 09/10] drm/xe/xelp: Expose AuxCCS frame buffer modifiers on
 Alderlake-P
Date: Wed, 10 Dec 2025 17:18:00 +0100
Message-ID: <20251210161801.14471-10-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210161801.14471-1-tursulin@igalia.com>
References: <20251210161801.14471-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v2
---
 drivers/gpu/drm/xe/display/xe_display.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 9d2aa69ea428..807fc93fb6ae 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -534,10 +534,18 @@ static const struct intel_display_irq_interface xe_display_irq_interface = {
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
 	.hdcp = &xe_display_hdcp_interface,
 	.rpm = &xe_display_rpm_interface,
 	.irq = &xe_display_irq_interface,
+	.has_auxccs = has_auxccs,
 };
 
 /**
-- 
2.52.0

