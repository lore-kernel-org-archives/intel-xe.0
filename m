Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDD1CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80510E839;
	Mon, 11 May 2026 16:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3F+iesR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690D210E839
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518562; x=1810054562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eG3Mqk6waq7jqgFH1YTneqOnzHVRshFnDMYOqhtfs3Y=;
 b=n3F+iesR5BsTfsLBvBd2X9+i9JzcI5dbhDFzkOmzMkvdym3ZkV72118X
 idtA/qNRySVUbvAFU6nRkz9sW5Iirzqb+y4aSx/DxLlusRHP+XrVNmHBg
 O9bsQ5zqZo9IjFAV0na86iPKKModKH3xmn/HYcBWF5d5LUR+a6BoZvsk3
 MMS7rmttYVnBab76A/NiWvg7+IRkrg9BuMO/C42KqN/OMSNjNNhsgQz0t
 bmdUR9eKovALh/QaA1/b+/sm0kY/xIbYRmMTsKJ6gbxEnS/OjKustw+SC
 OEeOQJ8KCTFLY0BO1APKKmd68VF5AccURV2wEb93bIxEOyBWeQeDU5DIm w==;
X-CSE-ConnectionGUID: Dq+dcAD5T5iYE+BLFpA72w==
X-CSE-MsgGUID: VmXjdc+PT068B3DAudEUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513512"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513512"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:02 -0700
X-CSE-ConnectionGUID: 4AEuBtX7RO2jPTGkyCXmgQ==
X-CSE-MsgGUID: jU00NLwHQS6wPZmLM7+nDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988686"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:55:58 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 02/14] drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
Date: Mon, 11 May 2026 22:59:09 +0530
Message-ID: <20260511172908.1122252-18-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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
with a generic name so it can be re-used across all files
using system controller commands.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
 drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 2 +-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
index b4d17329af6c..faf6ba89ce98 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
@@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
 {
 	struct xe_sysctrl_event_response *response = command->data_out;
 	struct xe_device *xe = sc_to_xe(sc);
-	u32 count = XE_SYSCTRL_EVENT_FLOOD;
+	u32 count = XE_SYSCTRL_FLOOD;
 	size_t len;
 	int ret;
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
index c16c66b9fa7f..d236e22fe9dd 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
@@ -11,7 +11,7 @@
 #define XE_SYSCTRL_EVENT_DATA_LEN		59
 
 /* Modify as needed */
-#define XE_SYSCTRL_EVENT_FLOOD			16
+#define XE_SYSCTRL_FLOOD			16
 
 /**
  * enum xe_sysctrl_event - Events reported by System Controller
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 84d7c647e743..0fa786a9e8c8 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
 	size_t data_out_len;
 };
 
+/* Modify as needed */
+#define XE_SYSCTRL_FLOOD			16
+
 #define XE_SYSCTRL_MB_FRAME_SIZE	16
 #define XE_SYSCTRL_MB_MAX_FRAMES	64
 #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
-- 
2.47.1

