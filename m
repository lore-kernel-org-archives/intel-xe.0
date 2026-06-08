Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609A3CD8CAE
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA1E10F76E;
	Mon,  8 Jun 2026 16:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQp1kRKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576D10F76B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780937690; x=1812473690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CFQSFE7LEhnyNsCxXR5rdR9o6GHSU1BbQu+J+8k8Rwk=;
 b=IQp1kRKi73a/ofyX7myt+zr7BcdCsmHbmdKY3zGKrUcnUY+VKrdIBIdI
 CWhjKRXAjC8Wl6/OqaUtB2gTtFEwOXnWUKbSipaxsYcbvOz0XSUChEFGl
 XPKhT+/rjIADOORL7dTllC5l6LXcX0PiTpDDDsw1thapmbbfa4BGRisvn
 jWga/ZsrDKXtQbWnNcvhB2yIVEKkss1LSiDPizd8FquaERx2AI3qthb0p
 tgmISPaOWpBtkaYcNt0gEoZlh7/qMYlstAHE5NPBQj61+dfOtvrRICx7u
 P0PdbF57a1X0oQmHtm3lRfNXlONe3krC9S1AP9Q4UAnnYNQubZo0N7RSA w==;
X-CSE-ConnectionGUID: g84WTGBwRgW1E9FYXHXiQg==
X-CSE-MsgGUID: FV6EJSXUTD2G74nDPzcpYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81744545"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81744545"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:48 -0700
X-CSE-ConnectionGUID: B4NhKCSnQdiyqW9vDAApuQ==
X-CSE-MsgGUID: +6c6D/w0TjSwf7n+pfE6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="247467555"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 09:54:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/16] drm/xe/mmio: Allow to replace xe_mmio_probe_early()
 with stub
Date: Mon,  8 Jun 2026 18:54:19 +0200
Message-ID: <20260608165429.587-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608165429.587-1-michal.wajdeczko@intel.com>
References: <20260608165429.587-1-michal.wajdeczko@intel.com>
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

We want to use replacement function in upcoming kunit helpers.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d53d727492c6..3f4f3c0f43fd 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,6 +10,8 @@
 #include <linux/minmax.h>
 #include <linux/pci.h>
 
+#include <kunit/static_stub.h>
+
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
@@ -103,6 +105,8 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	KUNIT_STATIC_STUB_REDIRECT(xe_mmio_probe_early, xe);
+
 	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
 	if (!xe->mmio.regs) {
 		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
-- 
2.47.1

