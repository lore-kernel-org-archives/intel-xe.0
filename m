Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE979EEB580
	for <intel-xe@archiver.kernel.org>; Sat,  9 Sep 2023 05:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7222B10E253;
	Sat,  9 Sep 2023 05:22:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9510E253
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Sep 2023 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694236919; x=1725772919;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FaZSGHkg+gkMoAzDBwLgR3vCbtm5pHmYcKC2U0c6iGI=;
 b=DIrPDXI0+BQQECtUbilLuJbxWGUpDHAM+aCfaNjq+YD367ZKcwBxWUAG
 Iq2i3dkGSFu7KBEwAA4sH5GaYlGCBOvx1v8w8hm2nEmqQSaJZzk36V/+H
 rAXlZ2Zhm487oBofTHulESe8czSy+w8gLwLW8IFqPE1i467y2NBcC1lXH
 b4SnL4YooqZ8IrTFITLlPvBhDhNVLL9JSQQRqurkVu7XHzFSp9EpjK+fT
 VGneBG4NKhlG58dSht70Nvif/mHdTglnD6VQuvmelWhzi+GotIuvvEz1f
 XcOe63b4UR/L3Ij2d/IUsgC8NsDIIBzHR4zkL0kt1iZbhVFyl7NCw3ksD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441807081"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="441807081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 22:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857649202"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; d="scan'208";a="857649202"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 22:21:58 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 22:21:53 -0700
Message-ID: <20230909052153.1669790-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Use common drm_xe_ext_set_property
 extension
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
Cc: Francois.Dugast@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There really is no difference between 'struct drm_xe_ext_vm_set_property'
and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
specify a <property, value> pair. Replace the two extensions with a single
common 'struct drm_xe_ext_set_property' extension. The rationale is that
rather than have each XE module (including future modules) invent their own
property/value extensions, all XE modules use a common set_property
extension when possible.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 include/uapi/drm/xe_drm.h          | 20 +++-----------------
 3 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e44d71c679cc3..fc44249f13372 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -459,7 +459,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    bool create)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_exec_queue_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 	u32 idx;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1d9aa5c40659c..36c39589b0036 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1915,7 +1915,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 				    u64 extension)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_vm_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 00d5cb4ef85e7..1338a64d42854 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -497,12 +497,11 @@ struct drm_xe_vm_bind_op_error_capture {
 	__u64 size;
 };
 
-/** struct drm_xe_ext_vm_set_property - VM set property extension */
-struct drm_xe_ext_vm_set_property {
+/** struct drm_xe_ext_set_property - XE set property extension */
+struct drm_xe_ext_set_property {
 	/** @base: base user extension */
 	struct xe_user_extension base;
 
-#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @property: property to set */
 	__u32 property;
 
@@ -518,6 +517,7 @@ struct drm_xe_ext_vm_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -681,20 +681,6 @@ struct drm_xe_vm_bind {
 };
 
 /** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
-struct drm_xe_ext_exec_queue_set_property {
-	/** @base: base user extension */
-	struct xe_user_extension base;
-
-	/** @property: property to set */
-	__u32 property;
-
-	/** @pad: MBZ */
-	__u32 pad;
-
-	/** @value: property value */
-	__u64 value;
-};
-
 /**
  * struct drm_xe_exec_queue_set_property - exec queue set property
  *
-- 
2.41.0

