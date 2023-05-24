Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C628C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 03:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF4310E565;
	Wed, 24 May 2023 03:32:23 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A6D10E564
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 03:32:22 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ae87bdc452so3313745ad.2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 20:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684899142; x=1687491142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SAVZ1ZZkAojZyxsJLiUHEOu6Cx1kikyvzQqbOAPj89s=;
 b=iDorgsgc6FoMh6kubVUDTk5qUNDRcD/LpgVY0bzeq2/CXxqmibqFpVnW5g4OrXV7tt
 Vw2fm0077pgiWM7fGvqR0Z28z80P7+4oXZYlGxX8DS34d1mN3j6gPm2bu3W7e9cvQBh8
 ueCeacO9CHnn+3Wns8diYO5GwjrKxXFPtSoEImx3GQ1QYh5oqUsBcRvU9/io+AsPxOuO
 NXrU1iu+Es4IdO/5GepSVaLhev3iiRjdYDyYMe4T3FE3BmIH1/AfCYhehtC8FpvlEum3
 kcoVw4QqGYYFCgEEC7PQjRL50n1GIHpWU5DPI9U9tjBQfS85VOWbjYJl5m3Ltg253Ohb
 PtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684899142; x=1687491142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SAVZ1ZZkAojZyxsJLiUHEOu6Cx1kikyvzQqbOAPj89s=;
 b=a+asGMW/DWRvtIxRylloMzCZIO2siJzvxj27UpFDx7v35Vh0a/wwhit/29xLj7Wmj1
 IXqRaHPXNwZoSN5YyeA03zHJPaCUsYRDK5XkPyMfT44I1wuMSW4OAJhNjeprR11vg8wI
 M6wBW6lAJEs3Cw2WnZ0Wul/xTGYLBj64bVWkFFkGqhBsm4VzmBBKXKFT3PZdgvG4ze43
 oGwETNY3NfZdU2A6GcCmBmP2D0QlAVxXfpGH1iFyadREZ+ItJzAr44oYuAID0zYJeNpK
 E3V3Bkye3MgYTThY+Giqds3F2yK0h9oRaDIQFr2RlcPs5vcCpaY9phgPyp/ZG+OYHbBG
 32fw==
X-Gm-Message-State: AC+VfDyQZxDvUDpiJlRULCLcYLdwoVF33i4wUA0XnAH4cM438kg4yapL
 aYf7iIhXv2ke4kJeCB8JuFHak+4myCNBY43V
X-Google-Smtp-Source: ACHHUZ6xv4jnECSsOp2PTDKjRlzDygx8t7/VKqAjb7GRMv6akJ6ahz4u1eURHafWX0FhtmO/WWKaLw==
X-Received: by 2002:a17:902:f689:b0:1ab:29bc:bd87 with SMTP id
 l9-20020a170902f68900b001ab29bcbd87mr14869782plg.35.1684899141775; 
 Tue, 23 May 2023 20:32:21 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b001a96a6877fdsm7546660plg.3.2023.05.23.20.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 20:32:21 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 23 May 2023 20:31:30 -0700
Message-Id: <20230524033131.2000480-2-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524033131.2000480-1-kode54@gmail.com>
References: <20230524033131.2000480-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Add explicit padding to uAPI
 definition
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

Pad the uAPI definition so that it would align identically between
64-bit and 32-bit uarch, so consumers using this header will work
correctly from 32-bit compat userspace on a 64-bit kernel. Do it
in a minimally invasive way, so that 64-bit userspace will still
work with the previous header, and so that no fields suddenly
change sizes.

Originally inspired by mlankhorst.

Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 include/uapi/drm/xe_drm.h | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..d5fc54b5be74 100644
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
@@ -291,6 +291,9 @@ struct drm_xe_gem_create {
 	 */
 	__u32 handle;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -335,6 +338,9 @@ struct drm_xe_ext_vm_set_property {
 #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 
@@ -379,6 +385,9 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/**
 		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
@@ -469,6 +478,9 @@ struct drm_xe_vm_bind {
 	/** @num_binds: number of binds in this IOCTL */
 	__u32 num_binds;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		/** @bind: used if num_binds == 1 */
 		struct drm_xe_vm_bind_op bind;
@@ -482,6 +494,9 @@ struct drm_xe_vm_bind {
 	/** @num_syncs: amount of syncs to wait on */
 	__u32 num_syncs;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @syncs: pointer to struct drm_xe_sync array */
 	__u64 syncs;
 
@@ -497,6 +512,9 @@ struct drm_xe_ext_engine_set_property {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @value: property value */
 	__u64 value;
 };
@@ -612,6 +630,9 @@ struct drm_xe_sync {
 #define DRM_XE_SYNC_USER_FENCE		0x3
 #define DRM_XE_SYNC_SIGNAL		0x10
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	union {
 		__u32 handle;
 		/**
@@ -656,6 +677,9 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
+	/** @pad: MBZ */
+	__u16 pad[3];
+
 	/** @reserved: Reserved */
 	__u64 reserved[2];
 };
@@ -718,6 +742,8 @@ struct drm_xe_wait_user_fence {
 #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
 #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
 	__u16 flags;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @value: compare value */
 	__u64 value;
 	/** @mask: comparison mask */
@@ -750,6 +776,9 @@ struct drm_xe_vm_madvise {
 	/** @vm_id: The ID VM in which the VMA exists */
 	__u32 vm_id;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @range: Number of bytes in the VMA */
 	__u64 range;
 
@@ -794,6 +823,9 @@ struct drm_xe_vm_madvise {
 	/** @property: property to set */
 	__u32 property;
 
+	/** @pad2: MBZ */
+	__u32 pad2;
+
 	/** @value: property value */
 	__u64 value;
 
-- 
2.40.1

