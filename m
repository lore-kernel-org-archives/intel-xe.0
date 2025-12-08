Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8304CD3B7EA
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 19:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4143D10E48B;
	Mon,  8 Dec 2025 19:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XyhFpcA0";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C9C10E47F
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VhkGzrhpM41v8SBUv9DSDe4He5nG8Y8GaA4mdojTz4=; b=XyhFpcA0Ih/GBWxeQFqSn/diw6
 VltNdploSgS0AEfYgqByChg9zPJrfnRyFOBYS0+IQxqeL1CmSmYzvWNPuCBkbuAi73YTzKPkIXk4l
 1pW8cm/6f8h57phiKq1GVwrJc3ckRNnv1+duNMTvoPLHVtAtm/mWbdkroTtUfMIBRwQ/wqKWma7Bn
 IBEe7ow2U5B3uWeyw1bGkODhjrNk5n4MTFF1ZSn6Dh9eBFiVs0NRactOZ6/D6sI2AGED62+nnlYNz
 JESd619ybyDXZRucXGDoef76wB+JOq2D9crCtnEGhNpenxbuCuohQkvTkR4FzupJAQSPbptx7ywKU
 FdUL4tMA==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vSgjp-00AC8F-4z; Mon, 08 Dec 2025 20:17:37 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v15 10/10] drm/xe/xelp: Expose AuxCCS frame buffer modifiers
 on Alderlake-P
Date: Mon,  8 Dec 2025 20:17:21 +0100
Message-ID: <20251208191722.7194-11-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208191722.7194-1-tursulin@igalia.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
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

