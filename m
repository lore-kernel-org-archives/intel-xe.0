Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE4FC35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 12:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5D810E264;
	Tue, 25 Mar 2025 12:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I0yFoSWE";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981EE10E264
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 12:38:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8A068A493C1;
 Tue, 25 Mar 2025 12:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F341EC4CEED;
 Tue, 25 Mar 2025 12:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1742906329;
 bh=tRN3yHJ/A1t+4Um0CfwWgvCIF5NNuTj3Emju3pZ4F4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I0yFoSWEIdV6/xwEZw4e09lNaNZii8m8fwpmF4oDufZuyBzUG81Nu6Dp5IAFkkCse
 ziyrfEa2v8+liMDcennpRiH/84nb3rENhNemjN+aVnabWYmNwijD+riQ3S4PomfLZw
 pliloy+YB5DP3tzzA3S3RE1OJSCdSgrX3uOuPpuQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 6.12 059/116] drm/xe: Fix exporting xe buffers multiple times
Date: Tue, 25 Mar 2025 08:22:26 -0400
Message-ID: <20250325122150.718996453@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325122149.207086105@linuxfoundation.org>
References: <20250325122149.207086105@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

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


