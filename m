Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E84C7EE29
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206CF10E787;
	Thu, 25 May 2023 23:24:37 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4A710E787
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685057074; x=1716593074;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U2S1qLDc8mGW3/KYrx6GK+iq/Ug8WHHRdZ75Dx45GFs=;
 b=N4bxciJ3eQ6CkCDvin/xwwAcGr95AReW3HfGnZW8d5yTZEGunW7p1hZs
 HocuglcpGl3lGu5LagaOGLckqU3GYyy2LuLHylVMaZKt/jW+qW+AbetcD
 yYqnpGMDSOoJR9pkRZpSn6x/IJr2pSZbTcr0Q8i6NZh7Q2eGPYoCCzaxM
 9qUv5/n5dliCXzvCBtRzVk92rLwJaXiKFai4nAW7Q/r9hnzgWWzX+/Blb
 qHJRMWbaZQAmt8IupI4oskK/9CJJ/w+9FvXh25ei9QBcasYZ+FhNJKwAc
 yGFBBe7z+lXq+lDIEwf92x+Gb1wbqIVu44YJ60B7EmXeoK2w1hz0Ik8+P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343549344"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="343549344"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:24:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="951653670"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="951653670"
Received: from xiaofang-mobl2.ccr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.36.192])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:24:33 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 20:24:06 -0300
Message-Id: <20230525232406.688875-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/reg_sr: Apply limit to register
 whitelisting
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

If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
slots, then it makes sense to refuse going above it.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 0312823101ad..b82f704179a0 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -231,6 +231,13 @@ void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
 
 	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&sr->xa, reg, entry) {
+		if (slot == RING_MAX_NONPRIV_SLOTS) {
+			drm_err(&xe->drm,
+				"Maximum register whitelist slots (%d) reached, refusing to add more\n",
+				RING_MAX_NONPRIV_SLOTS);
+			break;
+		}
+
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot),
 				reg | entry->set_bits);
-- 
2.40.1

