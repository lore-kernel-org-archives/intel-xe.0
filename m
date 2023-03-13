Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE0FC61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 21:16:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEC310E634;
	Mon, 13 Mar 2023 21:16:48 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C14F10E634
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 21:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678742206; x=1710278206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CehcLUI+5ipaUD+V1hwW+JnxOQijSROCPD2aVIcVoJI=;
 b=gpE1kxxs5CuXPSBUMwUDzM4gAa5ejz247HsZjIwV2BBddNCbLEf/4zj3
 uBR7228A2m37Q0DoUgcZjwc8cj562ZPcI6weWFLwchpRcqQWCkamdCGiB
 bD8uld6tQEo9INsARRbvHQ1OxDfa/gHMf45209t3i0h4dWAkp1sj9+OB6
 yMDGPQwS3vUvZ7w4OLXz69pWyEhY9BGkqcj8yb0CTzJ7FJAbniJrPBXbB
 sD/qLyaEkUy/FrcWV1TG7VxKr9myd6Ki9Zu4EFTWgEsy4R8MC/4wTHbXD
 vd/OB6VregwJfzCQcAMA+9z6LQrrfKP+eRWBaOWFLTBfGhTx88ht+GOLk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="339628518"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="339628518"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 14:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672063674"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="672063674"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 14:16:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 14:16:28 -0700
Message-Id: <20230313211628.2492587-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Replace i915 with xe in uapi
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

All structs and defines had already been renamed to "xe", but some
comments with "i915" were left over. Rename them.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 593b01ba5919..661d7929210c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -37,7 +37,7 @@ extern "C" {
  */
 
 /**
- * struct i915_user_extension - Base class for defining a chain of extensions
+ * struct xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -55,20 +55,20 @@ extern "C" {
  *
  * .. code-block:: C
  *
- *	struct i915_user_extension ext3 {
+ *	struct xe_user_extension ext3 {
  *		.next_extension = 0, // end
  *		.name = ...,
  *	};
- *	struct i915_user_extension ext2 {
+ *	struct xe_user_extension ext2 {
  *		.next_extension = (uintptr_t)&ext3,
  *		.name = ...,
  *	};
- *	struct i915_user_extension ext1 {
+ *	struct xe_user_extension ext1 {
  *		.next_extension = (uintptr_t)&ext2,
  *		.name = ...,
  *	};
  *
- * Typically the struct i915_user_extension would be embedded in some uAPI
+ * Typically the struct xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
  *
@@ -77,7 +77,7 @@ struct xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct i915_user_extension, or zero if the end.
+	 * Pointer to the next struct xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
 	/**
@@ -87,7 +87,7 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct i915_user_extension.
+	 * of uAPI which has embedded the struct xe_user_extension.
 	 */
 	__u32 name;
 	/**
@@ -99,7 +99,7 @@ struct xe_user_extension {
 };
 
 /*
- * i915 specific ioctls.
+ * xe specific ioctls.
  *
  * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
  * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
-- 
2.39.0

