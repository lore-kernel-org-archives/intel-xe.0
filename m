Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF9BC88E50
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 09:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7798310E0B4;
	Mon, 14 Sep 2026 09:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdRqHKzq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FD110E4BA
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Sep 2026 09:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789379227; x=1820915227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HSi7LtRx/8Hswt2j+WITTSOZg2KeFFv6a2HFaF5/QUY=;
 b=gdRqHKzqVa0MMAfUJCBXH+hFpjuzAYV4TwCD4UkZ6pvCckh3ZeEsNfU6
 GOFNw0mB9OuwyVm49cCzONTtSWD1xYPY5eIlGKGqgcNdLtMdcOKlyu2lh
 LaLhwtEMIe1aqwnVJJQATJGBuITzQY4z8w/T39ubk25eoipvn4cgzA6fw
 MLqqaH9xHeXHMLAg5g5RJUprPfGY99rOfNgQmaz16vIAukGo98hnCy7W/
 zjrBpLkwn6niebizbi9SCkxuocpKG+ySSojOmi19MWBzu0Gm6tTG85bSl
 sOBr+X/v134pGJe3imsmyNO7Pp//RHBKCVk04L7cgUxzE0VB37c7NQh4b g==;
X-CSE-ConnectionGUID: eMNE270SR1yX4iNn9+CkZw==
X-CSE-MsgGUID: FrFucbONSq65btr7N9sE4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107241887"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="107241887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:47:07 -0700
X-CSE-ConnectionGUID: Vv8hLYiiSfKEiViwJt9Bzg==
X-CSE-MsgGUID: /1qfLayOS8eOKmNpcntHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; d="scan'208";a="277861838"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 02:47:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe: Make p2pdma distance check verbose via dynamic debug
Date: Mon, 14 Sep 2026 11:46:41 +0200
Message-ID: <20260914094641.8779-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

pci_p2pdma_distance() can optionally print details about how it
computed the ACS/PCIe topology distance between the two devices, but
xe_dma_buf_attach() always called it with verbose set to false,
silently hiding useful diagnostics whenever a dma-buf attach unset
attach->peer2peer.

Tie the verbose argument to a dedicated dynamic-debug callsite tagged
"xe dma-buf p2p debug" (in addition to keeping the existing
DRM_UT_DRIVER category as a default), so the extra p2pdma distance
logging can be switched on without a recompile in any of the following
ways:

 - Enable the whole DRIVER category for xe via drm.debug, which is
   already used elsewhere in the driver:

     # echo 0x10 > /sys/module/drm/parameters/debug

 - Enable dynamic debug for the whole file:

     # echo 'file xe_dma_buf.c +p' > \
             /sys/kernel/debug/dynamic_debug/control

 - Enable dynamic debug for just this callsite by function name:

     # echo 'func xe_dma_buf_attach +p' > \
             /sys/kernel/debug/dynamic_debug/control

 - Enable dynamic debug by matching the format string used to
   register the callsite:

     # echo 'format "xe dma-buf p2p debug" +p' > \
             /sys/kernel/debug/dynamic_debug/control

 - Enable it at boot via the dyndbg= kernel command line parameter:

     dyndbg="func xe_dma_buf_attach +p"

Any of the above flips verbose_p2p_dist to true for that attach call,
causing pci_p2pdma_distance() to log its distance calculation without
requiring the whole DRM_UT_DRIVER category to be enabled.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_dma_buf.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 5d9f1cd24b7f..b63fd70fb4de 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -22,13 +22,21 @@
 
 MODULE_IMPORT_NS("DMA_BUF");
 
+static void xe_ddebug_flip_bool(const struct _ddebug *desc, bool *flag)
+{
+	*flag = true;
+}
+
 static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
+	bool verbose_p2p_dist = drm_debug_enabled(DRM_UT_DRIVER);
+
+	_dynamic_func_call("xe dma-buf p2p debug", xe_ddebug_flip_bool, &verbose_p2p_dist);
 
 	if (attach->peer2peer &&
-	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, false) < 0)
+	    pci_p2pdma_distance(to_pci_dev(obj->dev->dev), attach->dev, verbose_p2p_dist) < 0)
 		attach->peer2peer = false;
 
 	if (!attach->peer2peer && !xe_bo_can_migrate(gem_to_xe_bo(obj), XE_PL_TT))
-- 
2.55.0

