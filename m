Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0B9C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100A510FB00;
	Wed, 24 Apr 2024 03:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DogmSQay";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBBD10FB00
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930289; x=1745466289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u0lOhrjhpS4JYPeRnM+4B+Yc4ifgUXrAkKRibyEb4TY=;
 b=DogmSQay7+rJuWyX+AR9rmkZjyYMYhpWhM6XmS8aWxyWwXKHGmcjzmkx
 MNFImm83x2U6GCRYqw/ZYKy0ZsiKt4N/hQ9dUNJfHkP5n6WLLw/iFeULY
 KKmHnfGbl5BMNA09559eh2KkzqJD1pg8T8r7OCvF1WAxWyLXBr7Yd/TW3
 s898t35s4fqaNvjLcabiEH5SWpkHYNRrP4lPHyBZxTDVGVMFBr4neXzcL
 l7riLgOX9A55M0Em6WImKj0d7JLtIjwXOnYL9lPmacIhznK0JgSEbmVmX
 2zVLON7yH1lIJXsvUEqXfGgS5qkPTW7R5f5BTu/AvRUY9+guVanMS/Yc2 Q==;
X-CSE-ConnectionGUID: fv8Cqqn7S8usJMAa1vdAkA==
X-CSE-MsgGUID: qbBW+9YSSl6BJu5/UjPWew==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20090510"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="20090510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:44:49 -0700
X-CSE-ConnectionGUID: hPb8q4ilTN6zK8Xe8ppBMw==
X-CSE-MsgGUID: P0h5GVhMQ1+75bgxmOXrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="55536805"
Received: from shekharc-ms-7d25.iind.intel.com ([10.190.239.16])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:44:48 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
	Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: [PATCH] drm/xe/xe2hpg: Add Wa_14021490052
Date: Wed, 24 Apr 2024 09:12:47 +0530
Message-Id: <20240424034247.1352755-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add Wa_14021490052 for Xe2HPG 20.01.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index dcf7ed51757c..31639686b5aa 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -687,6 +687,15 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
 
 	{}
 };
-- 
2.34.1

