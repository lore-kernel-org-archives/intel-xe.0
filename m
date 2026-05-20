Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9A7CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 23:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2451410F18C;
	Wed, 20 May 2026 23:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IaSAsgwV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC1310F1A9;
 Wed, 20 May 2026 23:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TzZdEjG1qBjv/ktjs8BFwiq0Lq3CcF6q36SdstWH/7A=; b=IaSAsgwVeo471VPBhJCeTpbVsz
 b0fV4TgUBn6iVL7HZGsk7T+DD86/lGtlnPNro95tybhk0n8fGeCZFip9LPj4E+mBHyc4yHM7OlEDi
 /jeRXaxwYIoAWcjcKRJLJam00/hoQ2NGXXlDxGewXfvgVdri6Z5S+DW4wzXUtkNHs9JFaono1pHXi
 h+dDiW4fjRG0YwNyn9b41ejNWn6WJwtGa3y9SefKww61ufpcoXqxdyw5FTJzSmOnL36A5JgbjR4jL
 STB8BKfxjX2LzWle6vIWBSivz6BF8KaDdCZcgQvRONoRdvptVNnRJ7OZl5RXeLi3CfJj7+SEZ5+1i
 YYhWQtDQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wPqpI-00456i-CN; Thu, 21 May 2026 01:59:48 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH 8/9] drm/i915/display: Ensure only supported writeback modes
 pass
Date: Wed, 20 May 2026 16:58:19 -0700
Message-ID: <20260520235820.2313192-9-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

From: Rodrigo Siqueira <siqueira@igalia.com>

When running the kms_writeback test, we can see the failure in the test
invalid-mode:

Starting subtest: invalid-mode
(kms_writeback:1101) CRITICAL: Test assertion failure function do_invalid_mode, file ../tests/kms_writeback.c:469:
(kms_writeback:1101) CRITICAL: Failed assertion: ret != 0
(kms_writeback:1101) CRITICAL: error: 0 == 0
Subtest invalid-mode failed.
**** DEBUG ****
(kms_writeback:1101) DEBUG: Test requirement passed: !(data.dump_check || data.list_modes)
(kms_writeback:1101) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=5120, height=2880, format=XB24(0x34324258), modifier=0x0, size=0)
(kms_writeback:1101) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=6, pitch=20480)
(kms_writeback:1101) ioctl_wrappers-DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_writeback:1101) igt_kms-DEBUG: display: commit {
(kms_writeback:1101) igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x1b8/440
(kms_writeback:1101) igt_kms-DEBUG: display:     Writeback-1: preparing atomic, pipe: A
(kms_writeback:1101) igt_kms-DEBUG: Writeback-1: Setting property "CRTC_ID" to 0x97/151
(kms_writeback:1101) igt_kms-DEBUG: Writeback-1: Setting property "WRITEBACK_FB_ID" to 0x1b9/441
(kms_writeback:1101) igt_kms-DEBUG: Writeback-1: Setting property "WRITEBACK_OUT_FENCE_PTR" to 0x7ffdb79337b4/140727683332020
(kms_writeback:1101) igt_kms-DEBUG: display: }
(kms_writeback:1101) CRITICAL: Test assertion failure function do_invalid_mode, file ../tests/kms_writeback.c:469:
(kms_writeback:1101) CRITICAL: Failed assertion: ret != 0
(kms_writeback:1101) CRITICAL: error: 0 == 0

Notice that the test is trying to set up 5120x2880, which is outside the
Intel writeback mode. To address this issue, add writeback mode
validation to the writeback atomic check path.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 9808ee2092ef..2c641ec09287 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -226,6 +226,9 @@ static int intel_writeback_atomic_check(struct drm_connector *connector,
 	    fb->height != crtc_state->mode.vdisplay)
 		return -EINVAL;
 
+	if (intel_writeback_mode_valid(connector, &crtc_state->mode) != MODE_OK)
+		return -EINVAL;
+
 	ret = intel_writeback_check_format(fb->format->format);
 	if (ret) {
 		drm_dbg_kms(connector->dev,
-- 
2.43.0

