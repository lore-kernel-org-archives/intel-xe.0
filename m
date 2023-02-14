Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAE5C05027
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE30B10E88E;
	Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F5110E0D7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373836; x=1707909836;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lpjjn1SVu2nGCyb3sHmL4C931fZ+XKkDRjtqKoZlHlI=;
 b=H0soWtcwliuSRDwIRCZCjlzKasDIu2/GudEGzWj4zA9OQDBjHOs79ebK
 GZTbJMl6e3YJ2d7SfOJ+ef30m3/RxIUTQQq0jylhu5Mf+j3SdBuw6y8ft
 V2oLWGVVOzyrUhOyUqRx/XdJUvzNHLCS3j1RaEbM4rEfcbM7gSY/94tvK
 gn9SV+/1TnGXtc8YtZWm1qELt9cluOMx4c+42TcNSRkWrC0ohPlPt8OM7
 x1l5Px9cAw86OgoZZ/YPKP/Blqh2A2Gt5gz1eBhGWaUhENjDyCMyvZZJq
 oNg5mqEIIq4v2g1VOLfjX8MYjGQ+cy2ZbTYAEKfBGTpNF2EvBX7MD8WbG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450047"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863187"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863187"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:22 +0000
Message-Id: <20230214112136.162380-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/15] drm/xe/mmio: don't leak the forcewake ref
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

Make sure we properly release the forcewake ref on all error paths.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8a953df2b468..497f643271ae 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -426,12 +426,16 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_MMIO_WRITE) {
 		switch (bits_flag) {
 		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
+			ret = -EINVAL; /* TODO */
+			goto exit;
 		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
+			ret = -EINVAL; /* TODO */
+			goto exit;
 		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
-				return -EINVAL;
+			if (XE_IOCTL_ERR(xe, args->value > U32_MAX)) {
+				ret = -EINVAL;
+				goto exit;
+			}
 			xe_mmio_write32(to_gt(xe), args->addr, args->value);
 			break;
 		case DRM_XE_MMIO_64BIT:
@@ -447,9 +451,11 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_MMIO_READ) {
 		switch (bits_flag) {
 		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
+			ret = -EINVAL; /* TODO */
+			break;
 		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
+			ret = -EINVAL; /* TODO */
+			break;
 		case DRM_XE_MMIO_32BIT:
 			args->value = xe_mmio_read32(to_gt(xe), args->addr);
 			break;
-- 
2.39.1

