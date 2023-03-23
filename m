Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43E8C76196
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936DC10E439;
	Thu, 23 Mar 2023 02:58:01 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133E010E42E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 02:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679540279; x=1711076279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvDz9zhmHba/HjYaVQBucPl3jLdb6i2hyjJw37kJf5c=;
 b=PldbdFmdk6fQK5df5hWSFmZO5JD36q38ljiczdPSdZgpQ/0/1KomKe2/
 tZnL4NLf8FzLSScd0CcH6i1DM9ARYwDmr9QCtbYpB2GffkOVG+aa53Yoi
 GOyQXYiO25ofJVegLVyP6BST6lO4Ui9D/IUocl/NNBvVy/ObKmO7AQaLD
 hR/Sgy7izh2zPaUsg72KqZcC41gDTOBhnRdlff5peBQ7NuQNAm6Q7eN7Y
 tdcAUYI3j+0v8wNVjh8zUfjY042cD2qdOSzzbyso6hHJEv30NZZG2vR09
 m5G6VTbmJM4tBqDtqh8unmu7vayLASwM8PZs3L3svTZhxeeNAg2JjgKyR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="338103036"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="338103036"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675538699"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675538699"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 19:57:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 22 Mar 2023 19:58:01 -0700
Message-Id: <20230323025801.822678-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323025801.822678-1-matthew.brost@intel.com>
References: <20230323025801.822678-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v3 2/2] drm/xe/uapi: Add query engines uAPI
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

Not all hardware engines are created equally, certain instance have
unique capabilities or properties. Introduce a uAPI to query for both
capabilities and properties. The capabilities are represented by a bit
mask which is unique to each class. The properties are represented by a
name and value return in an array to the user.

v3: s/xe_engine/xe_hw_engine

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 89596d353d3e..2f936fe2e452 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -119,6 +119,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
+#define DRM_XE_HW_ENGINE_QUERY		0x0f
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -135,6 +136,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_ENGINE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_HW_ENGINE_QUERY, struct drm_xe_hw_engine_query)
 
 struct drm_xe_hw_engine_class_instance {
 	__u16 engine_class;
@@ -253,6 +255,45 @@ struct drm_xe_device_query {
 	__u64 reserved[2];
 };
 
+struct drm_xe_hw_engine_query_property {
+	/** @name: name of the property */
+	__u64 name;
+
+	/** @value: value property */
+	__u64 value;
+
+	/** @reserved: reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_hw_engine_query {
+	/** @extensions: pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @eci: engine class instance to query */
+	struct drm_xe_hw_engine_class_instance eci;
+
+	/** @capabilities: bit mask of capabilities, specific to each class */
+	__u64 capabilities;
+
+	/**
+	 * @size: Size of the queried properties, if user passes in zero the KMD
+	 * returns the size of the properties array, if user passes in the size
+	 * of the properties array the KMD copies the properties to the user
+	 * pointer.
+	 */
+	__u32 size;
+
+	/**
+	 * @properties: user pointer to which an array of  struct
+	 * drm_xe_hw_engine_query_property are copied to if size is non-zero
+	 */
+	__u64 properties;
+
+	/** @reserved: reserved */
+	__u64 reserved[2];
+};
+
 struct drm_xe_gem_create {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

