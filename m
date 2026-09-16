Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA0C982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65910E3CF;
	Wed, 16 Sep 2026 15:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkY52Btf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B010E078;
 Wed, 16 Sep 2026 15:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789572571; x=1821108571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6jjlBo5vH8VfDOZxByAJ9kJyb7Cid3lL7Re0ANg8Gqo=;
 b=DkY52BtfQvtZcJ1Lamy9DXarUuWY7s+6lopS4mzWbvtivbE8y/sacdl+
 xOnbOWb5ROOto7zDFVBN3yegXVsgcsiWUEGdv7OVAQDWfFzfyzMX5gz6n
 DmMpQUo1kHh2AAL3nXbP0TtUTgTlUmnVYQETbIwyjb9wColv7qimHl7kW
 q9DHU40hYYHNNXs0Q2WpXy8TMIcqcWB9vUiYsT9L14leSmPi5FrE0+O04
 L1krXDM+VE7UFlZ49PIqavKs9IuKO9JfMOi5bXm3Tl0+DF+uE+EauIW9p
 S4aoGU5RsAog+pQWf0kxkH6sBvSFi4mnl0hl33tH4sW6+S7ihHv7Hbzzf Q==;
X-CSE-ConnectionGUID: MUm0hEvlTA2jpZOYjUq8Tw==
X-CSE-MsgGUID: 58Au64W9Q02lZoGmMfieqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93824187"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93824187"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:29:31 -0700
X-CSE-ConnectionGUID: vzabtHFASuS+4n8qE3KJXA==
X-CSE-MsgGUID: S1mJMB5uSD6ZS74x0yBzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273346065"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 16 Sep 2026 08:29:30 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] drm/i915/cx0_phy: Fix ARL-S host bridge detection
Date: Wed, 16 Sep 2026 20:59:28 +0530
Message-ID: <20260916152928.185110-1-dnyaneshwar.bhadane@intel.com>
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

is_arrowlake_s_by_host_bridge() re-assigned pdev in the while()
exited (that's the loop's exit condition). This made
condition itself, so pdev was always NULL by the time the loop
"return pdev && ..." always false, so an Arrow Lake S host bridge
was never detected and intel_c20_hdmi_tmds_tx_cgf_1() always used
the wrong tx_misc value for that platform.

Check the ID as each host bridge is enumerated instead of after the
loop, and drop the reference pci_get_class() took on the matching
device before returning.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Fixes: 3630a47b700e ("drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value")
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
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

