Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBE1C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921E10E34A;
	Mon, 26 May 2025 12:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hUNe0z3g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53D210E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261145; x=1779797145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aQTRqEXr2cUatg2aRhA+tFtjd+VJAHFAjTbtQH8g3HQ=;
 b=hUNe0z3gZiKQ6HkUl4XAPrMDQO/0OoOTMiGhTnPZcqmN5+zDebBA3Hy5
 l/98WsmNyc9vNMCOgXl1sORRxcuCKeoG/2LLtYw8JofMnbEjGIOQL5O52
 //lnMoDpbF+tmK9bdGJMU7iArAoo2D4uiOjpthnYPznToycV257Z+Ln5G
 LR7Ft/pFlqNBwZ9KlSOVFKL5ZTGv6oHfBbjpIWbh9zjw6znnAq1aZR6xF
 qUQ938LvlqNcCav5VptfncGqWM86R6HPdRKBlXFgmTfI+zyBADqQ7R/62
 vhdBCj5dUYnLVu57QrzQJb9jrHNMsIjFFM1TYvANT0JAkq1Z2d46vFcMm g==;
X-CSE-ConnectionGUID: 6t3hDdWdQuO80YuA6HZ7FQ==
X-CSE-MsgGUID: 2+UabWreS+GCKK/42b74YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492307"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492307"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:45 -0700
X-CSE-ConnectionGUID: BXCs/SrWS9O4ei3/9sKUlg==
X-CSE-MsgGUID: vLcGcB87RlGIy4QvrcRuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576109"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:44 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 09/12] drm/i915/display: Add PHY_CMN1_CONTROL register
 definitions
Date: Mon, 26 May 2025 15:05:09 +0300
Message-ID: <20250526120512.1702815-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add PHY_CMN1_CONTROL register and its definitions to configure port LFPS
sending.

Bspec: 68962
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
index 59c22beaf1de..580a43be195e 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
@@ -285,6 +285,9 @@
 #define PHY_CX0_TX_CONTROL(tx, control)	(0x400 + ((tx) - 1) * 0x200 + (control))
 #define   CONTROL2_DISABLE_SINGLE_TX	REG_BIT(6)
 
+#define PHY_CMN1_CONTROL(tx, control)	(0x800 + ((tx) - 1) * 0x200 + (control))
+#define   CONTROL0_MAC_TRANSMIT_LFPS	REG_BIT(1)
+
 /* C20 Registers */
 #define PHY_C20_WR_ADDRESS_L		0xC02
 #define PHY_C20_WR_ADDRESS_H		0xC03
-- 
2.43.0

