Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89262C36017
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 11:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330AE10E464;
	Tue, 17 Sep 2024 11:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="XVESKSta";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0EA10E464
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:01 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726572235; bh=glmQr+6BxE2wbEQkHooFpG9kdIUNEYxdjAXEfry2cxw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XVESKStatv4yRPpzbABbFZFN0G+1yvXBfVsc7R8DvBPNyQsUSQNfeO9gvH3vR21zr
 m2QQFL01l1Vzg7jE9eFhq0yTQ2OosMGl0GIGXMOcxqoIpcBg24yKDZFPW8i5XeAwXS
 8e+dFgy0JpXT0UkAEv9qMoH6gw3eFGKXkF9w5J3YSQHtZRMr660Oc92rLpd047S3vN
 AS3bbuJduDP9zArfGOIonsFTBz8ZUTs5CcaBF+MzIQXgV6kNsdKIqhGMrFRFzCiVr4
 Zz9DbNE7K9z+2xc5lFmCDD30INRSS+dc5fXUlG+8KXxOm6r4tTyU0uNV0FYGzCG2UX
 5hjp8I9+6JTmA==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48HBNmuL1242354; Tue, 17 Sep 2024 14:23:48 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v5 1/5] drm/xe: Introduce dedicated config for memirq debug
Date: Tue, 17 Sep 2024 14:23:03 +0300
Message-ID: <20240917112307.1242329-2-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240917112307.1242329-1-illevi@habana.ai>
References: <20240917112307.1242329-1-illevi@habana.ai>
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

From: Ilia Levi <ilia.levi@intel.com>

Separate config for memory based interrupts (memirq) infrastructure.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..2de0de41b8dd 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -40,9 +40,21 @@ config DRM_XE_DEBUG_VM
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_MEMIRQ
+	bool "Enable extra memirq debugging"
+	default n
+	help
+	  Choose this option to enable additional debugging info for
+	  memory based interrupts.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_SRIOV
 	bool "Enable extra SR-IOV debugging"
 	default n
+	select DRM_XE_DEBUG_MEMIRQ
 	help
 	  Enable extra SR-IOV debugging info.
 
-- 
2.43.2

