Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3470FC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 16:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E7310E3C1;
	Mon, 24 Mar 2025 16:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hVykScS+";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0310E3C1
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 16:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 560A95C6279;
 Mon, 24 Mar 2025 16:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2696C4CEDD;
 Mon, 24 Mar 2025 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1742833000;
 bh=uzq1eVFuEmp6YosDgNzl+YfoATrzCvlbBoA9pDoGdaQ=;
 h=Subject:To:Cc:From:Date:From;
 b=hVykScS+ISNxROdgeTLt2sWdQQ70OVClj2pdvmuYq3OIDjcoZTdQqZ7tsSIQobAW5
 zTK98/c9J+NDGUOjeABgUdL9eB7Q/Ad1ll+bwtyPLFLAeTF3FcZeimTV0da5LLLK+x
 G1z6e8UGh3qHO09hsVFcKSwvHNoOsgeoDLNC27Go=
Subject: Patch "drm/xe: Fix exporting xe buffers multiple times" has been
 added to the 6.12-stable tree
To: gregkh@linuxfoundation.org, intel-xe@lists.freedesktop.org,
 jacek.lawrynowicz@linux.intel.com, jani.nikula@intel.com,
 lucas.demarchi@intel.com, matthew.auld@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, nirmoy.das@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, tomasz.rusinowicz@intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 24 Mar 2025 09:13:23 -0700
Message-ID: <2025032423-ecard-geriatric-8e37@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
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


This is a note to let you know that I've just added the patch titled

    drm/xe: Fix exporting xe buffers multiple times

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-xe-fix-exporting-xe-buffers-multiple-times.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 50af7cab7520e46680cf4633bba6801443b75856 Mon Sep 17 00:00:00 2001
From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Date: Tue, 18 Feb 2025 11:03:53 +0100
Subject: drm/xe: Fix exporting xe buffers multiple times
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

commit 50af7cab7520e46680cf4633bba6801443b75856 upstream.

The `struct ttm_resource->placement` contains TTM_PL_FLAG_* flags, but
it was incorrectly tested for XE_PL_* flags.
This caused xe_dma_buf_pin() to always fail when invoked for
the second time. Fix this by checking the `mem_type` field instead.

Fixes: 7764222d54b7 ("drm/xe: Disallow pinning dma-bufs in VRAM")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
(cherry picked from commit b96dabdba9b95f71ded50a1c094ee244408b2a8e)
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_bo.h      |    2 --
 drivers/gpu/drm/xe/xe_dma_buf.c |    2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -314,7 +314,6 @@ static inline unsigned int xe_sg_segment
 
 #define i915_gem_object_flush_if_display(obj)		((void)(obj))
 
-#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
  * TTM memory type
@@ -329,4 +328,3 @@ static inline bool xe_bo_is_mem_type(str
 	return bo->ttm.resource->mem_type == mem_type;
 }
 #endif
-#endif
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -58,7 +58,7 @@ static int xe_dma_buf_pin(struct dma_buf
 	 * 1) Avoid pinning in a placement not accessible to some importers.
 	 * 2) Pinning in VRAM requires PIN accounting which is a to-do.
 	 */
-	if (xe_bo_is_pinned(bo) && bo->ttm.resource->placement != XE_PL_TT) {
+	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo, XE_PL_TT)) {
 		drm_dbg(&xe->drm, "Can't migrate pinned bo for dma-buf pin.\n");
 		return -EINVAL;
 	}


Patches currently in stable-queue which might be from tomasz.rusinowicz@intel.com are

queue-6.12/drm-xe-fix-exporting-xe-buffers-multiple-times.patch
