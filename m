Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037C4C07E8F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 06:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5E11127EF;
	Mon, 22 Apr 2024 06:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ne0nEiL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2909112802;
 Mon, 22 Apr 2024 06:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713768047; x=1745304047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqhOJvVoznXMAtZ+uI9/2zb6M5pwqi02HkXEsg7rDNg=;
 b=ne0nEiL/ocj9TMIrOXIrhLFXq1fzJ55U1Ifu44H1bcYe8kgsf9rrHFzX
 AJTD84H9pzKKc622WXe8OqMsqJcloHSra4nxQ+giYlrAkKzi+Y/JGHNy6
 uq6LQBijDHJ2z6KH4lVoG8/9jqe0x7PL4yTcuGnCzZSsF1JYzWlMJYiJv
 okiUnQkqD0e2KSerPHQ5O4wNgVx7KkgI8EFCFpEGLbAjwq9iovVrquOjX
 hnUydeUNJ5t8kkjllo5DSBo15JwSuC2fR1Jtd2oB8kZpnDWLJmu8jgOr0
 tQwtyHaEMveGN327lE+RT7p7Dzx3AoTjQG67bPGIUlF4B6kijsB2eq3eX w==;
X-CSE-ConnectionGUID: 9bfIetz7QUinbzUgqZ3vUQ==
X-CSE-MsgGUID: UDJXQTKGT2mQeDN3PAYdDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9208674"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9208674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:40:47 -0700
X-CSE-ConnectionGUID: AZpir1H2TlamN4rDaIb4GA==
X-CSE-MsgGUID: I4Q1FzuUQb6cJOherVVv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="23896614"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:40:44 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH v4 19/19] drm/xe/bmg: Enable the display support
Date: Mon, 22 Apr 2024 12:10:38 +0530
Message-Id: <20240422064038.1451579-20-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422064038.1451579-1-balasubramani.vivekanandan@intel.com>
References: <20240422064038.1451579-1-balasubramani.vivekanandan@intel.com>
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

Enable the display support for Battlemage

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3b30353dbc09..5289cc651c8b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -340,6 +340,7 @@ static const struct xe_device_desc lnl_desc = {
 static const struct xe_device_desc bmg_desc __maybe_unused = {
 	DGFX_FEATURES,
 	PLATFORM(XE_BATTLEMAGE),
+	.has_display = true,
 	.require_force_probe = true,
 };
 
-- 
2.25.1

