Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC69C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 09:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8954610E359;
	Mon, 21 Sep 2026 09:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RA3YJ/ua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBD910E057;
 Mon, 21 Sep 2026 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789981354; x=1821517354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HjhdWz3TL+zKMQgCb85LDtJBaoQ8IO3yBXPgS+ZrfP8=;
 b=RA3YJ/uagckoVe5bI0Ndg98pQJNA3WhSyvowOTayit9kkFLsZQ+BPntY
 ci98oIh8/VprLv2yjv21+bkWu7ked44G1hzL7e08KBCLUiEEQScEyw7e8
 o6F6KkVuL1i/FCsjKMMW213TVv+C9KtrzD2K/YYnWn5KSIOndRTVIL0CX
 sGfFU5C9g2dzjMaFrzEwBosDQCEIcJHykoQC6K7zkxrFepTCw99hPpAUU
 YO1uTERzz88WaYU1xiBUlg8wL+Dr3dfRZJ6/zXO5IBZNaKgD9diBkiNOo
 72JaacbkjoGZWZMhna0zj61eJCaMGIvrseAa4I2+110HRBhO0Cym+wUbJ A==;
X-CSE-ConnectionGUID: 903gAvjvSZyazYjPuwzovw==
X-CSE-MsgGUID: azg4MVQWQtOY6J8vDIsPhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="988897"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="988897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 02:02:33 -0700
X-CSE-ConnectionGUID: XAjLis+pTS+zvPF4cFLCLA==
X-CSE-MsgGUID: 6Bg0dk8wSLCundcoR7RiPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271102552"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa006.fm.intel.com with ESMTP; 21 Sep 2026 02:02:31 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH v2] drm/i915/cx0_phy: Fix ARL-S host bridge detection
Date: Mon, 21 Sep 2026 14:32:26 +0530
Message-ID: <20260921090226.946472-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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

Fix is_arrowlake_s_by_host_bridge() which always returned false.
The while loop always exits with pdev as NULL, so the return
condition was always false, causing the wrong tx_misc value to be used.

Check the host bridge ID inside the loop body.  Once found early exit
from the loop release the pci reference "pdev" and return true.

v2:
 - Update commit message (Chaitanya)

Bspec:74165,74491
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Cc: <stable@vger.kernel.org>
Fixes: 3630a47b700e ("drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value")
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index dbebd7210848..de450ebf541f 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2342,12 +2342,14 @@ static void intel_c10pll_dump_hw_state(struct drm_printer *p,
 static bool is_arrowlake_s_by_host_bridge(void)
 {
 	struct pci_dev *pdev = NULL;
-	u16 host_bridge_pci_dev_id;
-
-	while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev)))
-		host_bridge_pci_dev_id = pdev->device;
+	while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev))) {
+		if (IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(pdev->device)) {
+			pci_dev_put(pdev);
+			return true;
+		}
+	}
 
-	return pdev && IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(host_bridge_pci_dev_id);
+	return false;
 }
 
 static u16 intel_c20_hdmi_tmds_tx_cgf_1(struct intel_display *display)
-- 
2.54.0

