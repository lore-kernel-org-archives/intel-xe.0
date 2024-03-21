Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08398CD11BF
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 22:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD5310FCFE;
	Thu, 21 Mar 2024 22:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfnUzHq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050308825B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711059438; x=1742595438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Foy8Fu0K+jMvBP32W5UcHZUJjq6BWDJ2pPUpGX0NfpY=;
 b=mfnUzHq+b/1NeCEN8H0l+w7fD0xJm8pw6Abned40HaCXimLpPz5v+KEA
 ZKVSuCdghmAc1hlTKEU3NVilevYO2J01LfbUIv5qwDPiQIaVoVc4GqNY1
 bkdIg6bjks4hbydKuEnS8MSJR9YOX/QflTH9I2mvRpD7SReF2WczZdlr2
 Ezq/OIPhyMFdzVHwLhEMP4k9k+z6PpBSglpmYyMbgrVFT84THLbWoiIGA
 6vvN5JITqWWKluz2qs8okbWvNhhGLTK9EcD2/EQLBfIBspSpXVtXGrVy3
 nXg5NdOwwLJPhjGpBuz26mxVkxONMNxEn5dAdIscvHvJjoOvjzXko7t+c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31525662"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="31525662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="52114389"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 15:17:17 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] drm/xe: Fix END redefinition
Date: Thu, 21 Mar 2024 15:17:25 -0700
Message-ID: <20240321221726.102193-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240321221726.102193-1-lucas.demarchi@intel.com>
References: <20240321221726.102193-1-lucas.demarchi@intel.com>
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

mips declares an END macro in its headers so it can't be used without
namespace in a driver like xe.

Instead of coming up with a longer name, just remove the macro and
replace its use with 0 since it's still clear what that means:
set_offsets() was already using that implicitly when checking the data
variable.

Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/15143996/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 95e0f7b1ec3f..db0793273de0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -115,7 +115,6 @@ static void set_offsets(u32 *regs,
 #define REG16(x) \
 	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
 	(((x) >> 2) & 0x7f)
-#define END 0
 {
 	const u32 base = hwe->mmio_base;
 
@@ -186,7 +185,7 @@ static const u8 gen12_xcs_offsets[] = {
 	REG16(0x274),
 	REG16(0x270),
 
-	END
+	0
 };
 
 static const u8 dg2_xcs_offsets[] = {
@@ -220,7 +219,7 @@ static const u8 dg2_xcs_offsets[] = {
 	REG16(0x274),
 	REG16(0x270),
 
-	END
+	0
 };
 
 static const u8 gen12_rcs_offsets[] = {
@@ -316,7 +315,7 @@ static const u8 gen12_rcs_offsets[] = {
 	REG(0x084),
 	NOP(1),
 
-	END
+	0
 };
 
 static const u8 xehp_rcs_offsets[] = {
@@ -357,7 +356,7 @@ static const u8 xehp_rcs_offsets[] = {
 	LRI(1, 0),
 	REG(0x0c8),
 
-	END
+	0
 };
 
 static const u8 dg2_rcs_offsets[] = {
@@ -400,7 +399,7 @@ static const u8 dg2_rcs_offsets[] = {
 	LRI(1, 0),
 	REG(0x0c8),
 
-	END
+	0
 };
 
 static const u8 mtl_rcs_offsets[] = {
@@ -443,7 +442,7 @@ static const u8 mtl_rcs_offsets[] = {
 	LRI(1, 0),
 	REG(0x0c8),
 
-	END
+	0
 };
 
 #define XE2_CTX_COMMON \
@@ -489,7 +488,7 @@ static const u8 xe2_rcs_offsets[] = {
 	LRI(1, 0),              /* [0x47] */
 	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
 
-	END
+	0
 };
 
 static const u8 xe2_bcs_offsets[] = {
@@ -500,16 +499,15 @@ static const u8 xe2_bcs_offsets[] = {
 	REG16(0x200),           /* [0x42] BCS_SWCTRL */
 	REG16(0x204),           /* [0x44] BLIT_CCTL */
 
-	END
+	0
 };
 
 static const u8 xe2_xcs_offsets[] = {
 	XE2_CTX_COMMON,
 
-	END
+	0
 };
 
-#undef END
 #undef REG16
 #undef REG
 #undef LRI
-- 
2.43.0

