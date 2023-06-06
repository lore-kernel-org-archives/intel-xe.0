Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8943C7EE43
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 20:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C0010E3A6;
	Tue,  6 Jun 2023 20:20:08 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3410E3A6
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686082807; x=1717618807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QDwvvbOuLP//5fWeoC488KMxE9zXosDVL/LHsZu9H3g=;
 b=GnE1ZRwHIHhFVETD63/Zj44/ogoGBw977+QrvyxyvCZNZKWuZFXQKoka
 GyGZDqnlVLv0BwN0A3U4qUHwvFDVettC2JL2/Xj0OPDpfRi7X3d9r7VXg
 OECZP1YCxfl4L+ImngCS+M0LX47zGWwbYQiF498jHCLWlkhLqFG+FmusT
 dVQwmA0S16oYQCjMdZsyLTHcQgjVhOg3FdRmxXJ7YruVaba73qWb9rbwZ
 MerphKpdj4Pk97H5PRiqpFdi2JOyqbmMQ9IhLZ7HMSqZUjW8AAPmtMYmj
 rHgRQrg1ppqcJ0yU7l5ohjkkBeHx0r8tbcGbyN7Piz6RjhzAu4U/NtNUG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="385105160"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="385105160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853569537"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="853569537"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 13:20:05 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 13:19:59 -0700
Message-ID: <20230606201959.94128-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/display: Append dma_buf fences to
 framebuffer fences
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

This is required to comply with KMS page flip requirements, and it is
the only way to synchronize framebuffer scanouts in Xe KMD.

UMDs are expected to attach a syncobj that will be signaled at the end
of the GPU job that is rendering in the framebuffer.
This way, the compositor can send jobs to the GPU to render the
framebuffer and without having to wait for it to complete, queue the
page flip in KMS.

This fixes display glitches.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8923
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index b756561f08bd1..a3f30a319e4c0 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -32,6 +32,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 
@@ -1120,10 +1121,20 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 
 	return ret;
 #else
+	int ret;
+
 	if (!intel_fb_obj(new_plane_state->hw.fb))
 		return 0;
 
-	return intel_plane_pin_fb(new_plane_state);
+	ret = intel_plane_pin_fb(new_plane_state);
+	if (ret)
+		return ret;
+
+	ret = drm_gem_plane_helper_prepare_fb(_plane, _new_plane_state);
+	if (ret)
+		intel_plane_unpin_fb(new_plane_state);
+
+	return ret;
 #endif
 }
 
-- 
2.41.0

