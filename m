Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A849CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:47:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9EE10EF7E;
	Mon,  8 Jun 2026 08:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScnO40YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4425E10EF7E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780908440; x=1812444440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7V4fdokORRX5B2KxCvQChXKu1xWOLiwxnOoZbs6oupY=;
 b=ScnO40YQCLPRslEhf3jXdy5UCwUPC4yAmHuI+ci22gJGFJ5vs2O8KO3x
 cOCnXEW69glkmnTYHQsKRZ1ZVUP34h1jg7/PaPER6K81mVB+O+3WUUeeV
 oJe+98yB2APNq5oR7GcUdmdTbNl1bTNtAFxiECBKSBlp8bojbtuivU9SD
 FB2gkTs6NOcb0X/vJdbiE+dDRfYHmw3oymc8285XdKVHr8gZPDtAoKyi/
 Z90PjTwVF0YuiEcBVnejbS6JSeFlaUYkDotrWVGoQawkvFSMefU8/uksu
 4rRQoRj2WISVsCiJ3grseTDJuygEoxUdxpN1u0nlViVa+5s/MX37VIQ+h w==;
X-CSE-ConnectionGUID: Cw9xAlucRnSGvtqgSmkTfA==
X-CSE-MsgGUID: xxeM6frvS1C68A6JTQh92Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="93029056"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="93029056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:20 -0700
X-CSE-ConnectionGUID: 28CGFx1zTnO7cc6P5v/Aag==
X-CSE-MsgGUID: uS4MLBI+SOKm+nvIFLU9qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="269466019"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 01:47:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v8 02/15] drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
Date: Mon,  8 Jun 2026 14:17:03 +0530
Message-ID: <20260608084700.640376-19-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260608084700.640376-17-riana.tauro@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
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

The sysctrl command flood limit was defined in an event specific header,
restricting its usage to event handling. Move it to the shared header
with a generic name so it can be re-used across all files using system
controller commands.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
v2: remove duplicate (Raag, Mallesh)

v3: fix wrapping in commit message (Raag)
    add limit postfix (Mallesh)
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 3 ---
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index b4d17329af6c..da395148ee9d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 {
 	struct xe_sysctrl_event_response *response = command->data_out;
 	struct xe_device *xe = sc_to_xe(sc);
-	u32 count = XE_SYSCTRL_EVENT_FLOOD;
+	u32 count = XE_SYSCTRL_FLOOD_LIMIT;
 	size_t len;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
index c16c66b9fa7f..348768ca454a 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -10,9 +10,6 @@
 
 #define XE_SYSCTRL_EVENT_DATA_LEN		59
 
-/* Modify as needed */
-#define XE_SYSCTRL_EVENT_FLOOD			16
-
 /**
  * enum xe_sysctrl_event - Events reported by System Controller
  *
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 84d7c647e743..faa973986c0d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
 	size_t data_out_len;
 };
 
+/* Modify as needed */
+#define XE_SYSCTRL_FLOOD_LIMIT		16
+
 #define XE_SYSCTRL_MB_FRAME_SIZE	16
 #define XE_SYSCTRL_MB_MAX_FRAMES	64
 #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
-- 
2.47.1

