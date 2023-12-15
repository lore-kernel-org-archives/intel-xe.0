Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE43C46CCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123010EA63;
	Fri, 15 Dec 2023 15:46:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052A710EA6C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655186; x=1734191186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P1oRLGNM1FWSPgALdjOIRPJK3oK/teXgxyHA+bREL5w=;
 b=HZlPYdK8/oTDa51yvjjr0Rl8L9jBqgIdpWKcb4AghtiS8OTk0B5vPFWD
 Kl6kACYQgBRcYvRwLGI5GFY3lxvVJ8lQ8d0SnrRk3kEemPgrpXBEB8Wvi
 L95zZ4vF/xsqPdAcZGHap+Nh4G8wgocyusS1peS7Z7eu/0mLM/avxvx2B
 IkKPwTQ7VUqwR5Q7GjW4w1H8z01ucqlRezb8IbGgW7YObgoD1N7cK5Ep+
 jou1CA9AnYOa5JK0GUkSEEQ6Q8/llElEH8/q8pcfx5dOsfnSVQZC3Ex0E
 H/qjyaTRZaxw4tv7nRCLFFkz/SSp5WNpDuJMdEhz3qJvgBrqRFFjtMa2s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141869"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324537"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:25 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 15/21] drm/xe/uapi: More uAPI documentation additions and
 cosmetic updates
Date: Fri, 15 Dec 2023 15:45:47 +0000
Message-Id: <20231215154553.7-16-francois.dugast@intel.com>
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

No functional change in this patch.

Let's ensure all of our structs are documented and with a certain
standard. Also, let's have an overview and list of IOCTLs as the
very beginning of the generated HTML doc.

v2: Nits (Lucas De Marchi)

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/uapi/drm/xe_drm.h | 47 +++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b62dd51fa895..5a01d033b780 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -23,6 +23,27 @@ extern "C" {
  *   5. uEvents
  */
 
+/**
+ * DOC: Xe uAPI Overview
+ *
+ * This section aims to describe the Xe's IOCTL entries, its structs, and other
+ * Xe related uAPI such as uevents and PMU (Platform Monitoring Unit) related
+ * entries and usage.
+ *
+ * List of supported IOCTLs:
+ *  - &DRM_IOCTL_XE_DEVICE_QUERY
+ *  - &DRM_IOCTL_XE_GEM_CREATE
+ *  - &DRM_IOCTL_XE_GEM_MMAP_OFFSET
+ *  - &DRM_IOCTL_XE_VM_CREATE
+ *  - &DRM_IOCTL_XE_VM_DESTROY
+ *  - &DRM_IOCTL_XE_VM_BIND
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
+ *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
+ *  - &DRM_IOCTL_XE_EXEC
+ *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ */
+
 /*
  * xe specific ioctls.
  *
@@ -56,7 +77,10 @@ extern "C" {
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 
 /**
- * struct drm_xe_user_extension - Base class for defining a chain of extensions
+ * DOC: Xe IOCTL Extensions
+ *
+ * Before detailing the IOCTLs and its structs, it is important to highlight
+ * that every IOCTL in Xe is extensible.
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -90,7 +114,10 @@ extern "C" {
  * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
- *
+*/
+
+/**
+ * struct drm_xe_user_extension - Base class for defining a chain of extensions
  */
 struct drm_xe_user_extension {
 	/**
@@ -120,7 +147,10 @@ struct drm_xe_user_extension {
 };
 
 /**
- * struct drm_xe_ext_set_property - XE set property extension
+ * struct drm_xe_ext_set_property - Generic set property extension
+ *
+ * A generic struct that allows any of the Xe's IOCTL to be extended
+ * with a set_property operation.
  */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
@@ -287,7 +317,7 @@ struct drm_xe_mem_region {
 	 * here will always be zero).
 	 */
 	__u64 cpu_visible_used;
-	/** @reserved: MBZ */
+	/** @reserved: Reserved */
 	__u64 reserved[6];
 };
 
@@ -1041,8 +1071,8 @@ struct drm_xe_sync {
 		__u32 handle;
 
 		/**
-		 * @addr: Address of user fence. When sync passed in via exec
-		 * IOCTL this a GPU address in the VM. When sync passed in via
+		 * @addr: Address of user fence. When sync is passed in via exec
+		 * IOCTL this is a GPU address in the VM. When sync passed in via
 		 * VM bind IOCTL this is a user pointer. In either case, it is
 		 * the users responsibility that this address is present and
 		 * mapped when the user fence is signalled. Must be qword
@@ -1051,7 +1081,10 @@ struct drm_xe_sync {
 		__u64 addr;
 	};
 
-	/** @timeline_value: Timeline point of the sync object */
+	/**
+	 * @timeline_value: Input for the timeline sync object. Needs to be
+	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 */
 	__u64 timeline_value;
 
 	/** @reserved: Reserved */
-- 
2.34.1

