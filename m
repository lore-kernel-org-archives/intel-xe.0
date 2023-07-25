Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983F8EB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2C110E3F9;
	Tue, 25 Jul 2023 20:28:32 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F210E39E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316906; x=1721852906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mRR/hPGKfJWRIyqby3a+W6mldfXQHzhsikT2NvH0P4g=;
 b=jr5wCLNik48bRFsVjXRUPwU7wJBXcp7gK35U2Rz3DZmbmpnDY1sGt0GB
 29sRQ+dKEL+5ss3Qw/z0piFZTB2AN01SYHG41dAWwaw5Tb/+wQYSJnmsb
 L8geIIj5L0k3U38tzTkK3eablEDeHcIGW0zivUH8nVCnaXrABY418yhBo
 m2gigh9uNWI6FyTCvKhBloppxxFU+X8eXRCXRh9vIDv2pOG6XKFXHIQat
 jHsoRbqoJHtpV8TOCf8ymEUBijBw/h29y0RfN05/Kfpm3mT5bEyhK3cib
 856Q7dnlpHCb2XA2RVx95NOlNSxkc1ZIGcv/2osjI9fCXS7iRFWgub97b g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366717421"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366717421"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726220314"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726220314"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 13:28:35 -0700
Message-Id: <20230725202836.3854908-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725202836.3854908-1-lucas.demarchi@intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] fixup! fixup! drm/xe/display: Implement
 display support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove leftover defines. This is a fixup to the fixup, since that commit
may eventually be promoted to a proper commit to avoid the need to
squash it below the commits it depends upon.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index dd7568badb4e..3f7052fec6cc 100644
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

