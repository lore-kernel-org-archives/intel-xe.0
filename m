Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB382C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9042F10E49D;
	Wed, 26 Jul 2023 16:10:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F02D10E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387798; x=1721923798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9qBj7iEZuY+bcPdyg3qX3FpbR1jxBljCmq4R8D+y7w=;
 b=WOqG/T/e2HOR/Awxk8M9yQ2JDCRefEp0Edywmzq6ehKAF3fwFK6rvrGT
 1M0WLa7Yihr90OSjdcQzFgXD7ZcdXhCZ1d5HP9J1WUYWdRgHSk1IatxIZ
 BdZDnnCzXslg9yIAKCATiY0kFYPsBUxPkf5bbS/4Nc49cHBFSASrgsBYR
 Cv/Uc5vdLIjCG4qjWp/rIYDz42av0+sQ2ePR/FEk9U4RXTdbePETFrhiW
 fP7//9+TYYKmClmVwD0rw6YUlSmR18709cStXkaSzNlz9sKE2qpOiCuz+
 P/SPNdjmhC1rzhj8Adf8WtCiU6ndmOoqpnUZeswujCsJEvQGpVXJm0Fm3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994892"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994892"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279353"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279353"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:06:59 -0700
Message-Id: <20230726160708.3967790-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/10] fixup!
 57f0bc550693ad29726bf2a71d05af0dc2d0a542
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove leftover defines. This is a fixup to the fixup, since that commit
may eventually be promoted to a proper commit to avoid the need to
squash it below the commits it depends upon.

NOTE TO MAINTAINER DOING THE REBASE: this is about this commit:
57f0bc550693 o fixup! drm/xe/display: Implement display support

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 8be616a1bd51..dbf572d11af0 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -56,23 +56,6 @@
 #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
 #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
 
-#define TRANSCODER_A_OFFSET			0x60000
-#define TRANSCODER_B_OFFSET			0x61000
-#define TRANSCODER_C_OFFSET			0x62000
-#define TRANSCODER_D_OFFSET			0x63000
-#define TRANSCODER_DSI0_OFFSET			0x6b000
-#define TRANSCODER_DSI1_OFFSET			0x6b800
-#define PIPE_A_OFFSET				0x70000
-#define PIPE_B_OFFSET				0x71000
-#define PIPE_C_OFFSET				0x72000
-#define PIPE_D_OFFSET				0x73000
-#define PIPE_DSI0_OFFSET			0x7b000
-#define PIPE_DSI1_OFFSET			0x7b800
-#define CURSOR_A_OFFSET				0x70080
-#define CURSOR_B_OFFSET				0x71080
-#define CURSOR_C_OFFSET				0x72080
-#define CURSOR_D_OFFSET				0x73080
-
 #define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
 
 #define PCU_IRQ_OFFSET				0x444e0
-- 
2.40.1

