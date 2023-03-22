Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37955C6FD20
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 02:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A0710E222;
	Wed, 22 Mar 2023 02:29:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2564C10E222
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 02:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679452181; x=1710988181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EjN6hD4k5qnTKcLkNiK6Tw50/0i9q8LiGZcMpzBzBRY=;
 b=HbAQYTcX2lNEtfznBrvgeqvnt5vMMw2uUDleb4yMFsIyRpoOjx6KY/7E
 T8QZtIEbLZxvzTOS0yTfVu1V03kRhs1oVhSVhXPEGfkLgV72CVC5oCcWH
 iPfANzDrgtsuNrWWT2baIN92wsbYRr0kHClzb5W5qCXPe9IpV5BD7JlsO
 rnqd6MMX6B7aiaavF+jExK+VXt7mtJatcFdQuIMfst8/Z3gTqaoF+9ebs
 01W4wGtn29l8YAFdBIC8vesXKsioiPpwgnV8l5twEyr+do2ZTvaUP2/sf
 9q7Tr/xXECr34eAexs6SpsY5JLrI8UT8ufJTw1pdAhbS/gQSHbqHRATqY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327489614"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="327489614"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825210986"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="825210986"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:29:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 19:29:35 -0700
Message-Id: <20230322022935.797427-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322022935.797427-1-matthew.brost@intel.com>
References: <20230322022935.797427-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 661d7929210c..b0f2823a3ddb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -119,6 +119,7 @@ struct xe_user_extension {
 #define DRM_XE_WAIT_USER_FENCE		0x0b
 #define DRM_XE_VM_MADVISE		0x0c
 #define DRM_XE_ENGINE_GET_PROPERTY	0x0d
+#define DRM_XE_ENGINE_QUERY		0x0f
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -135,6 +136,7 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	DRM_IOW( DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			DRM_IOW( DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
+#define DRM_IOCTL_XE_ENGINE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_QUERY, struct drm_xe_engine_query)
 
 struct drm_xe_engine_class_instance {
 	__u16 engine_class;
@@ -253,6 +255,45 @@ struct drm_xe_device_query {
 	__u64 reserved[2];
 };
 
+struct drm_xe_engine_query_property {
+	/** @property: pointer to the first property struct, if any */
+	__u64 property;
+
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
+struct drm_xe_engine_query_result {
+	/** @property: pointer to the first property struct, if any */
+	__u64 property;
+
+	/** @capabilities: bit mask of capabilities, specific to each class */
+	__u64 capabilities;
+
+	/** @reserved: reserved */
+	__u64 reserved[2];
+};
+
+struct drm_xe_engine_query {
+	/** @extensions: pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @eci: engine class instance to query */
+	struct drm_xe_engine_class_instance eci;
+
+	/** @result: return data from query */
+	struct drm_xe_engine_query_result result;
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

