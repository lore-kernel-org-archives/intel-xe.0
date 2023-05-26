Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BF6C7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB50210E083;
	Fri, 26 May 2023 00:32:33 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF97410E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:32:29 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d3e5e5980so460702b3a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685061149; x=1687653149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rl/CJHRjOpeP3xkX5eoXGrM0EzYWGx0062IzuWZRRLU=;
 b=fqAZpF8IrVsF5Mm9UQ++QUG58G805f8pMNB4d7kHoz+8mSLmMnQk13MqbdQIKXUHM1
 OfvpiS6c+oPFKAgz2eUGQtC9FU7t7M5wkUwxLq+d2UI0F06fwOZcmtLEGEO0WS0XWWRk
 cOYWZztb1+thXW7+Z2PylM8yhezKmBmnLZ94PF5Qz+22adN58HCkhuUR93Fc+BgpysDE
 dRmkVamwhRd8J+a9cB47lqCM7MgBH2mjrbpFkwGyi70l+8YqbGujlI9LBBwJvy6Tnre/
 cCMUM3RETiLjsiH9Jx8rf/YFy4NdyGzcR5vw1r/E6wv83iuNRQyyvYS8HeQcLExSSM7O
 W/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685061149; x=1687653149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rl/CJHRjOpeP3xkX5eoXGrM0EzYWGx0062IzuWZRRLU=;
 b=TBEVDIwz4EiCuEw0cyODCg9ONuuQliFtO+3kk8hqMJ19ErI5KrFXxC/mJOZCzVBrJX
 P2LZtOACVYIdIhPRvJwlD+pwQaHiyX0YcunZXgP7J2kLF704tsMdf2d/RDGxZRXOHwTZ
 vpe67qqRXWgiRmFWRlRZ92gpa3rQAsHULEq4BnWD+qHo1O/7VM9M8Ur4K1Dt0Gv2ONNs
 /yDNSL5lZtDph8NkoM0aAmH7DqurTu54PqLlcxC4WEUynTC0hIjGTLwScgNc7zjAUzLO
 JqA8T+BGzW2XdAO1EB5cwQ83bPdjiwtKX8jcx5rmNjepsvqRZHTdZtCmwSN7rm0Govz4
 hViw==
X-Gm-Message-State: AC+VfDyi3owCypDiRN0buNjQ/7+3RSHkV6YMBsDQDjpULwtcMzauHVCg
 6VC/CmadFDjr7rCKkD1Y3ilp752vn7udPlWz
X-Google-Smtp-Source: ACHHUZ4KzFxr0TG1G4bwMC1WF+GnFLb7pzIjWiJnk1YdILnx9pJryfj9nHLQyU2gAUFYPP9h3BarGQ==
X-Received: by 2002:a05:6a00:22cd:b0:645:b13e:e674 with SMTP id
 f13-20020a056a0022cd00b00645b13ee674mr833764pfj.26.1685061148851; 
 Thu, 25 May 2023 17:32:28 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b00634b91326a9sm1710156pfh.143.2023.05.25.17.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:32:28 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 17:32:20 -0700
Message-Id: <20230526003221.3874899-2-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526003221.3874899-1-kode54@gmail.com>
References: <20230526003221.3874899-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/2] drm/xe: Reshuffle all of the uAPI structs
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
Cc: Ryan Houdek <sonicadvance1@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Verified through pahole:
I've created a hdrtest.c with these contents:

struct xe_user_extension               __PASTE(dummy, __LINE__);
struct drm_xe_engine_class_instance    __PASTE(dummy, __LINE__);
struct drm_xe_query_mem_usage          __PASTE(dummy, __LINE__);
struct drm_xe_query_config             __PASTE(dummy, __LINE__);
struct drm_xe_query_gts                __PASTE(dummy, __LINE__);
struct drm_xe_query_topology_mask      __PASTE(dummy, __LINE__);
struct drm_xe_device_query             __PASTE(dummy, __LINE__);
struct drm_xe_gem_create               __PASTE(dummy, __LINE__);
struct drm_xe_gem_mmap_offset          __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind_op_error_capture __PASTE(dummy, __LINE__);
struct drm_xe_ext_vm_set_property      __PASTE(dummy, __LINE__);
struct drm_xe_vm_create                __PASTE(dummy, __LINE__);
struct drm_xe_vm_destroy               __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind_op               __PASTE(dummy, __LINE__);
struct drm_xe_vm_bind                  __PASTE(dummy, __LINE__);
struct drm_xe_ext_engine_set_property  __PASTE(dummy, __LINE__);
struct drm_xe_engine_set_property      __PASTE(dummy, __LINE__);
struct drm_xe_engine_create            __PASTE(dummy, __LINE__);
struct drm_xe_engine_get_property      __PASTE(dummy, __LINE__);
struct drm_xe_engine_destroy           __PASTE(dummy, __LINE__);
struct drm_xe_sync                     __PASTE(dummy, __LINE__);
struct drm_xe_exec                     __PASTE(dummy, __LINE__);
struct drm_xe_mmio                     __PASTE(dummy, __LINE__);
struct drm_xe_wait_user_fence          __PASTE(dummy, __LINE__);
struct drm_xe_vm_madvise               __PASTE(dummy, __LINE__);

and then ran the resulting .o file through pahole.

All padding holes are gone on 64-bits, some through extending the width
of some members, others by reorganizing, and even more by explicitly
adding padding.

v2:
	Applied suggested changes from original reviews
	Split the validation into a second patch
	Changed one padding member to avoid changing num_batch_buffer size

Suggested-by: Ryan Houdek <sonicadvance1@gmail.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 include/uapi/drm/xe_drm.h | 64 +++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..a2c39f736f06 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -91,7 +91,7 @@ struct xe_user_extension {
 	 */
 	__u32 name;
 	/**
-	 * @flags: MBZ
+	 * @pad: MBZ
 	 *
 	 * All undefined bits must be zero.
 	 */
@@ -150,8 +150,8 @@ struct drm_xe_engine_class_instance {
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND		5
 
-	__u16 engine_instance;
 	__u16 gt_id;
+	__u32 engine_instance;
 };
 
 #define XE_MEM_REGION_CLASS_SYSMEM	0
@@ -291,6 +291,13 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/**
+	 * @pad: MBZ
+	 *
+	 * All undefined bits must be zero.
+	 */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -335,6 +342,9 @@ struct drm_xe_ext_vm_set_property {
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -379,6 +389,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -469,6 +482,12 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -479,12 +498,6 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -497,6 +510,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -604,6 +620,7 @@ struct drm_xe_sync {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @flags: One of DRM_XE_SYNC_* flags */
 	__u32 flags;
 
 #define DRM_XE_SYNC_SYNCOBJ		0x0
@@ -612,6 +629,9 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		__u32 handle;
 		/**
@@ -656,6 +676,9 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
+	/** @pad: MBZ */
+	__u16 pad[3];
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -664,8 +687,10 @@ struct drm_xe_mmio {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @addr: Address in mmio space to do an op on */
 	__u32 addr;
 
+	/** @flags: Combination of DRM_XE_MMIO_* flags */
 	__u32 flags;
 
 #define DRM_XE_MMIO_8BIT	0x0
@@ -712,12 +737,13 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_GTE	3
 #define DRM_XE_UFENCE_WAIT_LT	4
 #define DRM_XE_UFENCE_WAIT_LTE	5
-	__u16 op;
+	__u32 op;
 	/** @flags: wait flags */
 #define DRM_XE_UFENCE_WAIT_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
-	__u16 flags;
+	__u32 flags;
+
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
@@ -747,15 +773,21 @@ struct drm_xe_vm_madvise {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
-	/** @vm_id: The ID VM in which the VMA exists */
-	__u32 vm_id;
-
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
 	/** @addr: Address of the VMA to operation on */
 	__u64 addr;
 
+	/** @vm_id: The ID VM in which the VMA exists */
+	__u32 vm_id;
+
+	/** @property: property to set (DRM_XE_VM_MADVISE_*) */
+	__u32 property;
+
+	/** @value: property value */
+	__u64 value;
+
 	/*
 	 * Setting the preferred location will trigger a migrate of the VMA
 	 * backing store to new location if the backing store is already
@@ -791,12 +823,6 @@ struct drm_xe_vm_madvise {
 	/* Pin the VMA in memory, must be elevated user */
 #define DRM_XE_VM_MADVISE_PIN			6
 
-	/** @property: property to set */
-	__u32 property;
-
-	/** @value: property value */
-	__u64 value;
-
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
-- 
2.40.1

