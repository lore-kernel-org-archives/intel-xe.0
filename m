Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC6C47DB1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7157710E5A6;
	Tue, 16 Jan 2024 14:56:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A5F10E552
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416989; x=1736952989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIvDmfcTHLTHtTAJnkfyNGJ7NeRv57t9GjN8GWgT1QY=;
 b=mwytZlpyGQT1muau95bt44y/CxuQ3TUw0K4z4FDAqRALM+rTLM7qMxy2
 o7QRbIry7FVm+GFtZQ97nnRf55acAHELSRr1zPVvm1F82ngk5Rf9f3tOP
 xAKQnqTCbhow2XyH5+jb+WvpKehShqqp8pzijifWxBY1japZLinlv09j3
 LPXxWiUnrohFhEE4FL4nDX38+d8M1PrFTQSJp0W88NFGT04MJ/vlg/vpS
 XVSBFtGwAWTBlkw4YY0KaZT3v2J/vfSdESaOLiyDv0jly+4LINNsY965e
 5Gt9qCwYWTiZ3rskKYlepJL0k+QeQ+kiT2eI7rqy0oqCyw8S6TY5kaz3H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262444"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262444"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374877"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374877"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:28 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/xe: Define XE_REG_OPTION_VF
Date: Tue, 16 Jan 2024 15:56:13 +0100
Message-Id: <20240116145617.1177-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

We will tag registers that SR-IOV Virtual Functions can access.
This will help us catch any invalid usage and/or provide custom
replacement if available.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 114b07db962f..c89ef2b79a3f 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -37,6 +37,10 @@ struct xe_reg {
 			 * value can inspect it.
 			 */
 			u32 mcr:1;
+			/**
+			 * @vf: register is accessible from the Virtual Function.
+			 */
+			u32 vf:1;
 			/**
 			 * @ext: access MMIO extension space for current register.
 			 */
@@ -78,6 +82,13 @@ struct xe_reg_mcr {
  */
 #define XE_REG_OPTION_MASKED		.masked = 1
 
+/**
+ * XE_REG_OPTION_VF - Register is "VF" accessible.
+ *
+ * To be used with XE_REG() and XE_REG_INITIALIZER().
+ */
+#define XE_REG_OPTION_VF		.vf = 1
+
 /**
  * XE_REG_INITIALIZER - Initializer for xe_reg_t.
  * @r_: Register offset
-- 
2.25.1

