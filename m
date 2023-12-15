Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16275C46CA2
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED7F10EA4C;
	Fri, 15 Dec 2023 15:46:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9781810EA40
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655173; x=1734191173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IyxOI0NEHq5TV2UVwrHEQZRUqMXP3mWHLWR2/VIVWsQ=;
 b=QbZD5sWr3TkBMRl5f9CpxbLYkcl78PPVC05l3a7MMO09DNXt2I8VSmr7
 v04u6fSlsHQ6GK31QfbWswO4+qYPSSnEFK8KSEjTLptjZvA8anS9wOE69
 DKiepVZaj85/UoKUZFKsMaxJTZKXGkwU4FT9VP1+2QBBzklFq/ceD14Oh
 8NVmdrM028Kd8LCCjGe6XeM+QX0r/sQV+/LxJPq/1Epg2QHGPCPh5cJ1x
 /RbTr8UoVEaNuEv5zT5dmQeMTSovf9A8NbBVz164rAw52yvGI253T+c/7
 TES9iPZDcfOSukTIBVd2y9jQ2TeetaObgiZMNjBtP6fzJSnVcW+ac+sX6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141854"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141854"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324442"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:12 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 06/21] drm/xe/uapi: Ensure every uapi struct has drm_xe
 prefix
Date: Fri, 15 Dec 2023 15:45:38 +0000
Message-Id: <20231215154553.7-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

To ensure consistency and avoid possible later conflicts,
let's add drm_xe prefix to xe_user_extension struct.

Cc: Francois Dugast <francois.dugast@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 include/uapi/drm/xe_drm.h          | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index eeb9605dd45f..aa478c66edbb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -453,7 +453,7 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 				      u64 extensions, int ext_number, bool create)
 {
 	u64 __user *address = u64_to_user_ptr(extensions);
-	struct xe_user_extension ext;
+	struct drm_xe_user_extension ext;
 	int err;
 	u32 idx;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e1e8fb1846ea..87ff6eaa788e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -27,7 +27,7 @@ extern "C" {
 #define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
 
 /**
- * struct xe_user_extension - Base class for defining a chain of extensions
+ * struct drm_xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -45,29 +45,29 @@ extern "C" {
  *
  * .. code-block:: C
  *
- *	struct xe_user_extension ext3 {
+ *	struct drm_xe_user_extension ext3 {
  *		.next_extension = 0, // end
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext2 {
+ *	struct drm_xe_user_extension ext2 {
  *		.next_extension = (uintptr_t)&ext3,
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext1 {
+ *	struct drm_xe_user_extension ext1 {
  *		.next_extension = (uintptr_t)&ext2,
  *		.name = ...,
  *	};
  *
- * Typically the struct xe_user_extension would be embedded in some uAPI
+ * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
  *
  */
-struct xe_user_extension {
+struct drm_xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct xe_user_extension, or zero if the end.
+	 * Pointer to the next struct drm_xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
 
@@ -78,7 +78,7 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct xe_user_extension.
+	 * of uAPI which has embedded the struct drm_xe_user_extension.
 	 */
 	__u32 name;
 
@@ -625,7 +625,7 @@ struct drm_xe_gem_mmap_offset {
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
-	struct xe_user_extension base;
+	struct drm_xe_user_extension base;
 
 	/** @property: property to set */
 	__u32 property;
-- 
2.34.1

