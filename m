Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22BC3DA7E
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 09:02:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56DB10E4F0;
	Tue, 23 Jul 2024 09:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6xfkais";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E40410E4E5
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721725368; x=1753261368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=To2/Evhf/oMByDH9OyurVArJ5FnEiSjLR6XHf5zlZr4=;
 b=K6xfkaisW+ImPxsUWBRT9nYgo1i2ZFtB/Ga8grI214TRJqfPIAHu/a1c
 9fKv65wfAT+BMSCIoethkXt6GLm+P6S35PfUYqrkOMSe0f08nbLkvbdS8
 Lan03LME5vTBp7Wa4cLSA4cGlUnUyn1nfoyo1tgYcU9qzxnmi41vVytDN
 ud5ivMv3pvpgl6f9+XFgHklVIR3kcOyqsay0j7Ae+y/woAzPAZgijw6A8
 sgWeqCii9dab21lDG7X/p3rxMqe6PSBe68d9g8l1X/L7HjQTk0dpJZxRu
 Pytb897kMsV9LdJFbadm5PXFdBwiUZrjwDpl7wpZjFzwWT5vWes61o3m0 g==;
X-CSE-ConnectionGUID: EABJxCZ0SvqQKEg7KRMcJw==
X-CSE-MsgGUID: /Chl+JXoSUWrZmXwOvOiRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29998691"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="29998691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:02:48 -0700
X-CSE-ConnectionGUID: It1LDWsFSA2jyyPnPnJpog==
X-CSE-MsgGUID: FWndBn43Tquw7L6c7pZyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="51870734"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.47])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 02:02:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v4 2/2] drm/xe: Use 64K pages for scanout buffers for
 Battlemage
Date: Tue, 23 Jul 2024 11:02:26 +0200
Message-Id: <20240723090226.128718-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723090226.128718-1-zbigniew.kempczynski@intel.com>
References: <20240723090226.128718-1-zbigniew.kempczynski@intel.com>
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

Set BMG platform to use 64K pages for display.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f818aa69f3ca..9bd6f84669b8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -180,6 +180,13 @@ static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
 };
 
+static const struct xe_graphics_desc graphics_bmg = {
+	.name = "Xe2_BMG",
+
+	XE2_GFX_FEATURES,
+	.vram_flags = XE_VRAM_FLAGS_DISPLAY_NEED64K,
+};
+
 static const struct xe_media_desc media_xem = {
 	.name = "Xe_M",
 	.ver = 12,
@@ -361,7 +368,7 @@ static const struct gmdid_map graphics_ip_map[] = {
 	{ 1270, &graphics_xelpg },
 	{ 1271, &graphics_xelpg },
 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
-	{ 2001, &graphics_xe2 },
+	{ 2001, &graphics_bmg },
 	{ 2004, &graphics_xe2 },
 };
 
-- 
2.34.1

