Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C40C54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 09:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2D810F936;
	Tue, 19 Mar 2024 09:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5OjTgXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782B10F933
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710841827; x=1742377827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oVLaLKbjZsiZxdkqRaCWBgqvICyzJW7hElT9YrQg5vQ=;
 b=g5OjTgXD57kTm2GhUsXAo1rS7paU775iQo/zpHEM0mMK5ZLVuVY9T6nq
 okXiioM79Th76LCsFidCBSIFYLSqu8ixmh8fbyl9q4vjzuFr7U8YXU1GN
 q53xMT1ai/7S172I7zFZVT2lEFfqlTzlP4jUujEcfrXMoFfCVmKL8M4tU
 tgPJm0KPXZPCiKKJUzRIc0CPcpIJeZj/jpBm4hRgxHKiuNfBuFt3jeFj7
 m+NUdS/BXdfxkP1Pp11QeZdJhJkkctEe5fGLLK3cJBuYqN9yrC/bfoq0y
 H+1yQRkxI+mvqp606acWDOCmFAAELVJuAowUOo18ga6jNLCbODG9bLSot g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="9499844"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="9499844"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; d="scan'208";a="44831649"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 02:50:25 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2] drm/xe/pt: Warn on 0 level before going to next lower level
Date: Tue, 19 Mar 2024 10:36:39 +0100
Message-ID: <20240319093639.32382-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

This should not happen so add a warn_on to be more paranoid.

v2: s/should/should not/

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8d3922d2206e..d29c6ed0cbde 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -731,6 +731,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	pgoff_t end_offset;
 
 	XE_WARN_ON(!*child);
+	XE_WARN_ON(!level);
 	XE_WARN_ON(!level && xe_child->is_compact);
 
 	/*
@@ -1396,6 +1397,7 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_WARN_ON(!*child);
+	XE_WARN_ON(!level);
 	XE_WARN_ON(!level && xe_child->is_compact);
 
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
-- 
2.42.0

