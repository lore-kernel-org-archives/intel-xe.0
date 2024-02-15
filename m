Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98565C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 00:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FE810E051;
	Thu, 15 Feb 2024 00:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvZAsup6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F0610E051
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 00:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707958467; x=1739494467;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89v5WLgyzC7S4qbAfQg1QKqn5jg4qfvJdYkRCZuAwd8=;
 b=CvZAsup61MlAqw5jLUsoKYnH3mTZl2F6C8VO9THtEydPsf+KykeS3GGq
 WdxO/VABwss4mO0EcimBxgfPSP6LSUbT0f8DU5J9aEjO3Odx0AX466J88
 v1Koy1XbTUqrFENydUbRsHFfnp248l2JpyS2xfDmD8nZ/3edWhek0TjWt
 9WHv02By2wG2w7Mh1PB3m4RuV0kyt/PVTY2mP4u25vew9oUfspOhX+2GE
 MHPWeMkn4i5Ee1pacIU5MpFp8bwbC+ApSAqaxEUsVWeIs77A+38bYK1GK
 /f16KRNUQGjhs3fQw4jRg6R5Adz4oPrzouR14RakDjog6vx7OeNp0/boB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5848758"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5848758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 16:54:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3711261"
Received: from przanoni-mobl.jf.intel.com ([10.24.12.104])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 16:54:27 -0800
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: get rid of MAX_BINDS
Date: Wed, 14 Feb 2024 16:53:53 -0800
Message-Id: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Mesa has been issuing a single bind operation per ioctl since xe.ko
changed to GPUVA due xe.ko bug #746. If I change Mesa to try again to
issue every single bind operation it can in the same ioctl, it hits
the MAX_BINDS assertion when running Vulkan conformance tests.

Test dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
issues 960 bind operations in a single ioctl, it's the most I could
find in the conformance suite.

I don't see a reason to keep the MAX_BINDS restriction: it doesn't
seem to be preventing any specific issue. If the number is too big for
the memory allocations, then those will fail. Nothing related to
num_binds seems to be using the stack. Let's just get rid of it.

Testcase: dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/746
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..63340cf4d587 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2720,8 +2720,6 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
-#define MAX_BINDS	512	/* FIXME: Picking random upper limit */
-
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops)
@@ -2733,8 +2731,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
+	if (XE_IOCTL_DBG(xe, args->extensions))
 		return -EINVAL;
 
 	if (args->num_binds > 1) {
-- 
2.39.2

