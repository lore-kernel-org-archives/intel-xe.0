Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB523C43458
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 07:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8651510E593;
	Mon, 13 Jul 2026 07:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8F/y0SS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA3210E593
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783928902; x=1815464902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7XE9WmsBcO8bnGF7/VEXvFdraj8txMc+z5RgRR44cM=;
 b=U8F/y0SSvfWxF7qyZ9DA+40zmLeqWYeL8vMWUFtWxfRopsm9NK52zdLm
 +PEZrSrowXSl4yvu+7CIUUPuL1sggHuOcZ4pOkd/KJ4QOlQyL/Q4JyB0+
 9mLZaUEncfTEgfbN4RrEUle73JqokNw/AT10Ppu3/SWGABE90K82Duoqs
 WuLcqdDYJ9HfkHtiE/u+jspnA42u8mrBJItvuSP3LV+9pvrX8y7gBKwGE
 wBnpsgpTTwXc0Xifj+ZyJ4Yd9TteE3p6VlcX5l88carMHOcF0RjvmUPA5
 2JTppXA0EOAjQuRHOKjdzaDPweT0NpVpVI79SSkQKTZRGBsQsTOkw2qb0 Q==;
X-CSE-ConnectionGUID: SeRjprnVS2+FDgvUtq+jxw==
X-CSE-MsgGUID: qJg5XhgxRgWv99/gBNN6LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84548855"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84548855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:22 -0700
X-CSE-ConnectionGUID: HaCw3WX8Qged9Zq2CpGLfA==
X-CSE-MsgGUID: mcJy9vWcQ3+V0s43++duqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278737274"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 00:48:18 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH v9 1/4] drm/xe/xe_sysctrl: Make sysctrl flood limit reusable
Date: Mon, 13 Jul 2026 13:17:57 +0530
Message-ID: <20260713074755.1278607-7-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260713074755.1278607-6-riana.tauro@intel.com>
References: <20260713074755.1278607-6-riana.tauro@intel.com>
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
    add limit postfix (Mallesh
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
index 6e3753554510..b0c123096969 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -52,6 +52,9 @@ struct xe_sysctrl_mailbox_command {
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

