Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A89C6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 08:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5010E972;
	Fri, 10 Mar 2023 08:13:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9C10E972
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678436033; x=1709972033;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=NWLW6nswqBTxoZ8aVv7t3tGaMkbqUgXm7Jj6IGwGLEw=;
 b=aqhRe3bO7n0Dcll2UVsyxDGFmcRPJ6Ymmd4anugxHGRQO0LrJER9+U8y
 u8CRtTy2Tdv4upXJv+B0u3nUeZtYGQQZ3joLhORnhQCwTX5OZRFdXc2f6
 EnJ50UDwjpcYipBHzFzkRGoV0L+mteRZv7YW4bs9FVR+r7qgMd9dTVIf/
 GanEX1kPIdIZjlvsrGtEatAwnynCJ2981kkrsr5+E+dnr/m8y5k9u0AV3
 pFYmhi4Dq5pieSvKKOXPlOIQMOIJU+UrlrrtWHBEwgAB6b+tN04ok9D9Q
 2WVNUJV8hiFJhhV+Uax4OaY9RP+mbocjtUGs1fBIHG/tdF2kEFqbDi3zj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364330930"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="364330930"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 00:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="671006280"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="671006280"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 10 Mar 2023 00:13:52 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.14.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9FCFC580BBE
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 00:13:52 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1paXss-00DkDY-21
 for intel-xe@lists.freedesktop.org; Fri, 10 Mar 2023 09:13:50 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:13:39 +0100
Message-Id: <20230310081338.3275583-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The GuC/HuC firmware files used by Xe drivers are the same as
used by i915. Use the already-known location to find those
firmware files, for a couple of reasons:

1. Avoid having the same firmware placed on two different
   places on MODULE_FIRMWARE(), if both 915 and xe drivers
   are compiled;

2. Having firmware files located on different locations may end
   creating bigger initramfs, as the same files will be copied
   twice my mkinitrd/dracut/...;

3. this is the place where those firmware files are located at
   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
   Upstream doesn't expect them to have on other places;

4. When built with display support, DMC firmware will be
   loaded from i915/ directory. It is very confusing to have
   some firmware files on a different place for the same driver.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas de Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 drivers/gpu/drm/xe/xe_uc_fw.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index ff94eec9cafe..00408f1b73e1 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -55,12 +55,12 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
 	fw_def(TIGERLAKE,    0, huc_def(tgl,  7, 9, 3))
 
 #define __MAKE_UC_FW_PATH_MAJOR(prefix_, name_, major_) \
-	"xe/" \
+	"i915/" \
 	__stringify(prefix_) "_" name_ "_" \
 	__stringify(major_) ".bin"
 
 #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
-        "xe/" \
+        "i915/" \
        __stringify(prefix_) name_ \
        __stringify(major_) "." \
        __stringify(minor_) "." \
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index ca64d379bb5e..bf31c3bb0e0f 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -175,6 +175,6 @@ static inline u32 xe_uc_fw_get_upload_size(struct xe_uc_fw *uc_fw)
 	return __xe_uc_fw_get_upload_size(uc_fw);
 }
 
-#define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/xe"
+#define XE_UC_FIRMWARE_URL "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915"
 
 #endif
-- 
2.39.2

