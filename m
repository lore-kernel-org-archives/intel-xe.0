Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE5BC531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 18:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAC010E08D;
	Fri, 24 Jul 2026 18:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiO2qQSA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF3F10E088;
 Fri, 24 Jul 2026 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784918185; x=1816454185;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=A2rmQHUDVV9rwqS4rniEnmYE6NWhJxmT3bS4Hs7p584=;
 b=DiO2qQSAp83HflopqSM3CWoUvX3nP/8+GhMMJ4C8Yq4TuphwZ4010MGV
 FDCIdVadmxzWz+hGvbzJWb2w8sTb4YkAbtC2PMFrtcNqYHjSrJnxEVWFy
 9XnBhtmHsq35tEPEUZBfUlB1OivRnvTGAo/0zy+/SZBPYnNrsHheVQVhM
 BpT0/x8wU1V+5dL0gXtlCcnTtfYq2f7ZSdG8q4tvHW27gg7CqczaGORW6
 +8C1TQ+fD5zi3kbhKHYb8KBDIB1TlPMTg19E/nipbaHmdzwrW10YFCzqJ
 CC04wKh7rplZWpQyAG0QeI3PzBPIuMnoWRYrrSU4OAa+v8ZJ2SF4kMgBS Q==;
X-CSE-ConnectionGUID: t+eMljMKQheyO55BqILyXw==
X-CSE-MsgGUID: CdNTnd+7Tjuj4PWCnXFojA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85462020"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="85462020"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:36:24 -0700
X-CSE-ConnectionGUID: 02B0L4aOSk+htPCb6N/96w==
X-CSE-MsgGUID: LKstYGblQfCW7IXetjeRDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; d="scan'208";a="282095892"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.243])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 11:36:22 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 24 Jul 2026 15:35:23 -0300
Subject: [PATCH] drm/i915/xe3p_lpd: Update CURSOR_BUF/WM masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-xe3p_lpd-cursor-dbuf-increase-v1-1-42f2faae2fb5@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBAF0KvIrDuQRqltr1KkxOTbDpQYZrAI4
 t0NLt/mbWRQgdGz2UjxF5M5V1wvDcVvyB+wpGryzt9c7zte0Zb3rySOi9qsnMZlYslREQw83ru
 +DXD+AUf1KIpJ1vN/Dft+ABcl5jlvAAAA
X-Change-ID: 20260724-xe3p_lpd-cursor-dbuf-increase-b8473ae029e0
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

Xe3p onwards CURSOR_BUF/WM masks have been increased. Update them to
reflect the following.

Bspec: 69847, 69880
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor_regs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor_regs.h b/drivers/gpu/drm/i915/display/intel_cursor_regs.h
index aaa66331063e..da2f9630ae2d 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cursor_regs.h
@@ -81,7 +81,7 @@
 #define   CUR_WM_EN				REG_BIT(31)
 #define   CUR_WM_IGNORE_LINES			REG_BIT(30)
 #define   CUR_WM_LINES_MASK			REG_GENMASK(26, 14)
-#define   CUR_WM_BLOCKS_MASK			REG_GENMASK(11, 0)
+#define   CUR_WM_BLOCKS_MASK			REG_GENMASK(12, 0)
 
 #define _CUR_WM_SAGV_A		0x70158
 #define _CUR_WM_SAGV_B		0x71158
@@ -98,10 +98,10 @@
 #define _CUR_BUF_CFG_A		0x7017c
 #define _CUR_BUF_CFG_B		0x7117c
 #define CUR_BUF_CFG(pipe)	_MMIO_PIPE((pipe), _CUR_BUF_CFG_A, _CUR_BUF_CFG_B)
-/* skl+: 10 bits, icl+ 11 bits, adlp+ 12 bits */
-#define   CUR_BUF_END_MASK		REG_GENMASK(27, 16)
+/* skl+: 10 bits, icl+ 11 bits, adlp+ 12 bits, xe3plpd+ 13 bits */
+#define   CUR_BUF_END_MASK		REG_GENMASK(28, 16)
 #define   CUR_BUF_END(end)		REG_FIELD_PREP(CUR_BUF_END_MASK, (end))
-#define   CUR_BUF_START_MASK		REG_GENMASK(11, 0)
+#define   CUR_BUF_START_MASK		REG_GENMASK(12, 0)
 #define   CUR_BUF_START(start)		REG_FIELD_PREP(CUR_BUF_START_MASK, (start))
 
 /* tgl+ */

---
base-commit: 8d8b015ca4cebab74621f83c223eacce22cc6f0e
change-id: 20260724-xe3p_lpd-cursor-dbuf-increase-b8473ae029e0

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

