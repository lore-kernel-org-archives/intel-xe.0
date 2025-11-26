Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36BD11193
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 19:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB73B10E113;
	Wed, 26 Nov 2025 19:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHd0EHrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EF010E703
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183598; x=1795719598;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=twWykRom+d8JzIL39n8soQFBsPBoVAHGxNM+O0Qkbdk=;
 b=aHd0EHrqq89OcGzhdQh7zVOY2CPKNzB7xeLfE1i16ERw8imEFC7clDAA
 c38S/4AYIQrd937Q/IiRDPU1rOiJ4UVB0cGMM9GVAZvzq6nLm9BmmFEkL
 vC+BrXOu8d4oRoW0/YBZ6XPni6GfgQX+9Gbe3n02GnQVyOXh5VoryCxaK
 KE5PQBorisejXf5ZjxOvvvhc6ov/Kbx+n+BYTz0iJVPOA9oXNwtX9RQXv
 P44nV2SI6shM+/URG1cQYUyT4O/8SLJtFHW0fmby6D5UeEDclj8xW7FPz
 y8PexeUWb2yLOqQ3H8o3ajjM9Mi+yD/1F74BngBPcEGg/UQB+uGEGvOAv g==;
X-CSE-ConnectionGUID: A49Zg+1lSYetClQJMAilBA==
X-CSE-MsgGUID: xXIaQbbQSXW/jodBp3baig==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66269525"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="66269525"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:57 -0800
X-CSE-ConnectionGUID: BtmzERQBTJiv94dE+r/cSg==
X-CSE-MsgGUID: GGLTHrAGSCaJNU1lKwSxTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193121215"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:59:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Date: Wed, 26 Nov 2025 10:59:50 -0800
Message-Id: <20251126185952.546277-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126185952.546277-1-matthew.brost@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
to populate the exec queue state so that a GPU hang can be replayed via
a Mesa tool.

v2: Update the value for HANG_REPLAY_STATE flag

Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Carlos Santa <carlos.santa@intel-corp-partner.google.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 include/uapi/drm/xe_drm.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 47853659a705..37881b1eb6ba 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -210,8 +210,12 @@ struct drm_xe_ext_set_property {
 	/** @pad: MBZ */
 	__u32 pad;
 
-	/** @value: property value */
-	__u64 value;
+	union {
+		/** @value: property value */
+		__u64 value;
+		/** @ptr: pointer to user value */
+		__u64 ptr;
+	};
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -1292,6 +1296,7 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
+#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-- 
2.34.1

