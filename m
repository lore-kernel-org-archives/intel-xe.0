Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08C6C25B10
	for <intel-xe@archiver.kernel.org>; Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4856410E457;
	Sun, 28 Apr 2024 21:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="kq1e1Q16";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2301139D0
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 10:07:19 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1713953235; bh=uFedjR1tM4ZjuzhFk/mMGMstJXmh0vcy1cdo5pRrQHQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kq1e1Q16OvDQj3ZzOn4vGU6XVqGoaHU96YRTHZQtYOz8wBIQBLhHVaiOnyhqx4tsw
 hsN6A3/yQFY95VDKmC9iQynH/gHSZX7nspMipmU5kvW8t/nhqmKp/0vrohVHm9JbBE
 OzJG8RcQfZFztk61nDFDs+TU7uVFwiftjNP/5SMKfXQcCsSevnCw9EiDfSbes8zEwl
 KsVCRKtu3EkxxF36Zr7xw8qIjA8eNR4tml9pWrgDMJlM9J+mJXK1bbFtX7/l+6Qv27
 TRPbLEtSbTyyv7xYPoS4PMSP8kLNIpk5fRxN72Cj1b9fsKLI3piJvwAocYXaRDf0dR
 kmV5OWU0tscng==
Received: from fkassabri-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 43OA79TJ269544
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 13:07:09 +0300
Received: (from fkassabri@localhost)
 by fkassabri-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 43OA79Me269543; 
 Wed, 24 Apr 2024 13:07:09 +0300
From: Farah Kassabri <fkassabri@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: osharabi@habana.ai, Farah Kassabri <fkassabri@habana.ai>
Subject: [PATCH 2/2] drm/xe: set last driver commit sha
Date: Wed, 24 Apr 2024 13:07:06 +0300
Message-Id: <20240424100706.269523-2-fkassabri@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424100706.269523-1-fkassabri@habana.ai>
References: <20240424100706.269523-1-fkassabri@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 21:33:52 +0000
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

This patch will set the last driver commit sha into the drm driver
info data structure, which will be used in the log message which
prints the device info at the end of the driver initialization.

Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
---
 drivers/gpu/drm/xe/Makefile    | 4 ++++
 drivers/gpu/drm/xe/xe_device.c | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8321ec4f9b46..acccb517b7bb 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -309,6 +309,10 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 		i915-display/intel_pipe_crc.o
 endif
 
+GIT_SHA ?= $(shell cd $(srctree) && git rev-parse --short HEAD)
+DRV_CFLAGS_MODULE="-DXE_DRIVER_GIT_SHA=-$(GIT_SHA)"
+CFLAGS_MODULE += ${DRV_CFLAGS_MODULE}
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 55bbc8b8df15..2e74aa18e953 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -215,6 +215,7 @@ static struct drm_driver driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	.git_sha = __stringify(XE_DRIVER_GIT_SHA),
 };
 
 static void xe_device_destroy(struct drm_device *dev, void *dummy)
-- 
2.34.1

