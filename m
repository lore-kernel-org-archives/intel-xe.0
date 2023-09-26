Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF068E7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3210E3D8;
	Tue, 26 Sep 2023 13:03:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8810E3D8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733412; x=1727269412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qkXDxdQ6RtQARD0SZ8P2M35iuFmRQgRKxDpwEXcu3Nc=;
 b=oD9krscyP5zZp4mLw3ln31KOBEbZ8CdrHEw/Ov5LvOVLNgSEG0e3I6KU
 C/gj1G3WE6DNAT4ubR27XDhX/uDlIqoSw1XMAM22suglIlsdyLBKJ0nAt
 u/VnE5LP7+YeNgJICJyf8Tnn4gxgwSTC1thDuG/ooEgm6PgVLqJplzMoR
 /OYFOvt+oQ/pbUm8YnA8nebDwyOCtW6lh/f3xFpD9aN6lWh/CimCnHOY9
 nqqLMNJL8pTEduuwU9bPow6d0EDISXBajB1CEPZx7iL5tUHFp/vhlVzvv
 nKkj29HJWXL8ou0UsivOSC0q1nj8JbgTdUlxX5RX4buN3ImhW9fj6kgNe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617153"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617153"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139570"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:10 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:21 +0000
Message-Id: <20230926125540.7-12-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 11/30] drm/xe/uapi: Use common
 drm_xe_ext_set_property extension
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

There really is no difference between 'struct drm_xe_ext_vm_set_property'
and 'struct drm_xe_ext_exec_queue_set_property', they are extensions which
specify a <property, value> pair. Replace the two extensions with a single
common 'struct drm_xe_ext_set_property' extension. The rationale is that
rather than have each XE module (including future modules) invent their own
property/value extensions, all XE modules use a common set_property
extension when possible.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         |  2 +-
 include/uapi/drm/xe_drm.h          | 21 +++------------------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index f70332986c73..411ba38cb2b8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -418,7 +418,7 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    bool create)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_exec_queue_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 	u32 idx;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8f00f979d5b5..f5f457252df6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1936,7 +1936,7 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 				    u64 extension)
 {
 	u64 __user *address = u64_to_user_ptr(extension);
-	struct drm_xe_ext_vm_set_property ext;
+	struct drm_xe_ext_set_property ext;
 	int err;
 
 	err = __copy_from_user(&ext, address, sizeof(ext));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4f122bd3a280..ce73913c23a9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -572,12 +572,11 @@ struct drm_xe_vm_bind_op_error_capture {
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
 
@@ -593,6 +592,7 @@ struct drm_xe_ext_vm_set_property {
 
 struct drm_xe_vm_create {
 #define XE_VM_EXTENSION_SET_PROPERTY	0
+#define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -757,21 +757,6 @@ struct drm_xe_vm_bind {
 	__u64 reserved[2];
 };
 
-/** struct drm_xe_ext_exec_queue_set_property - exec queue set property extension */
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
2.34.1

