Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4218BC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 01:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132AB10E490;
	Thu, 25 May 2023 01:56:18 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A9210E480
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 01:56:16 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33aa60f4094so1300485ab.1
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684979775; x=1687571775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBut43uk6fFKvWC2RFKQ+IUTqnfhCHPM1jcgYWOsO0g=;
 b=Jw+BFM2wjbzee4IerKnwqZ3JjvKh5/UDGWHn3CjGNo5n7yAj5HsczB5SZJe6Nx0jZe
 0q3ZHZQXibwMZkUj98hOUQqwffqXGiZawNREF5TuBoVoP0dFvf2t/tJjByprGxi/HvUF
 oPuS6BM/PEjK2bqukdwlV6ks9Q2NpVQrqtcfM3mBjGP4TYjvGexEX64M4K4CRHLEt8OL
 urVlCM4liVrr4TOpM27ZAtGOYQ3QxYBSKs1xETfTQGRkCGbJAIRXwaxYRI1/8t8HB0rG
 0AMfwnqB2t9xIMReSWEGljL1zkEZ+bE0dGHOIT5LPMGu1TtfljnB/6y+iUNmpbm0gh5L
 CUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979775; x=1687571775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBut43uk6fFKvWC2RFKQ+IUTqnfhCHPM1jcgYWOsO0g=;
 b=j/LpBpQGsqpJpeLAlxSaO3J/L24EQPEMQUM+Obe8asRnqbHX6h2nxIetEgQtME8fpg
 3N0PuzQUofnaO+xZ15QXwoKLRolAKjAcfyYS0h/v22KptS6kIg6WiG2LJ4HJi8Lsb0XN
 YRvgdc/VANfTcr3tLmlly21gefEBvZrF4DvwAQ+a2Q5ntfjwHLHyFueubECtZlgXUkmX
 ZklpCw72v8jy+yQQJ0kE9lFgLLQL1NxsnL+2h1xE7EvUd71tW4sp9wbpRNWf8XT8oa4z
 sczff4g1HFz0RGdAPwa8nPxv16V2MW1FVBrJXS+hYKYV1oamLMheG6UykMDlIbSPe+pD
 5niQ==
X-Gm-Message-State: AC+VfDxMTp+eJfCPexoGNBD8kd9OS826Kkrlq3MyqyLLT+Z2/PmXWejv
 ziOWboxwyZE3ivxQhJwwAUv3Dn8vh8r3JRg9
X-Google-Smtp-Source: ACHHUZ5MXAOlBvQQMSBWY3lggz20X4lPtUoXLnJGUnnk/Pl2lM7PlIJM+F57deKSrYN5j/YY7JWrRw==
X-Received: by 2002:a92:dc0d:0:b0:338:65fc:f4c1 with SMTP id
 t13-20020a92dc0d000000b0033865fcf4c1mr888722iln.9.1684979775443; 
 Wed, 24 May 2023 18:56:15 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a92cf12000000b0032b4808029fsm29407ilo.31.2023.05.24.18.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 18:56:15 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:06 -0700
Message-Id: <20230525015607.2192395-2-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525015607.2192395-1-kode54@gmail.com>
References: <20230525015607.2192395-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Add explicit padding to uAPI
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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

