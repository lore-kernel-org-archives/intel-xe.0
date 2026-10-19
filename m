Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F2607D356
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KY2zUgWf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D910E915;
	Mon, 19 Oct 2026 15:03:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC64F10E915;
 Mon, 19 Oct 2026 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792422176; x=1823958176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JJ4wfctzSidwQwa829SCuUY5Y5KHXPN++9TN2i1LIBE=;
 b=KY2zUgWfvvimm5csqjHcx6khUHhPIyks70WMEwuE26Jszye3BylI1s6M
 CPngTU7h7+oWr/pn5VABUTj/is+i/ZDqLIRquHE5bW809gcIIv3sh1BdK
 LgDyzBZJukjt0szytwFI0Pi/kjVEcXlbhHH3l5DyGSeW5ve8V38uja1UD
 O0qlCyQuiDUW5K+UYN4rTcEfVtoQla+Qz1GLIhlpG+pnshFDEzCPE3qBc
 6KrasYIXZ8rwPzkKh0T1l0CWf/GYed3aVRv+wow1uh1l0SPi3qAINWnK4
 MLUa6hSskl3NZ2YMfamrVvx0mn4+AZur4MDG3TkK/NAvCDI7mQUjp3wHi g==;
X-CSE-ConnectionGUID: rOvtSi0CR3CghsKo+a276Q==
X-CSE-MsgGUID: GxSLuhadSPCsb6WmZemtiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="991002"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="991002"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:55 -0700
X-CSE-ConnectionGUID: bWDh15+TSpuCk4I5FnLJjA==
X-CSE-MsgGUID: uSewnHV7TF6dYt/1X0Frmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2633862"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:02:53 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 1/3] drm/i915/display: don't write Send Busy back when
 toggling AUX power
Date: Mon, 19 Oct 2026 17:52:59 +0300
Message-ID: <20261019150226.734375-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019150226.734375-1-luciano.coelho@intel.com>
References: <20261019150226.734375-1-luciano.coelho@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUX power wells share the AUX engine's control register, so the
read-modify-writes we do to toggle the power request and the TBT IO
bit also write back whatever else is in the register.  If a
transaction is still running, Send Busy reads back as 1 and we write
it again, which triggers the same transaction again.

intel_dp_aux_xfer() can return with the engine still busy, either from
the pre-transaction check or from the "not done" path after all the
retries, and it drops the AUX power reference right after, with the
default 100ms delay.  So the delayed power well disable can run while
the engine is still going.

Mask Send Busy out of these read-modify-writes so we never write it
back as 1.  Writing 0 doesn't start a transaction, and the bit is 0
anyway when the engine is idle, so nothing changes in the normal case.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../drm/i915/display/intel_display_power_well.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 233465a8306e..66be8826381b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -600,8 +600,10 @@ icl_tc_phy_aux_power_well_enable(struct intel_display *display,
 
 	icl_tc_port_assert_ref_held(display, power_well, dig_port);
 
+	/* don't write Send Busy back as 1, see xelpdp_aux_power_well_enable() */
 	intel_de_rmw(display, DP_AUX_CH_CTL(aux_ch),
-		     DP_AUX_CH_CTL_TBT_IO, is_tbt ? DP_AUX_CH_CTL_TBT_IO : 0);
+		     DP_AUX_CH_CTL_TBT_IO | DP_AUX_CH_CTL_SEND_BUSY,
+		     is_tbt ? DP_AUX_CH_CTL_TBT_IO : 0);
 
 	intel_de_rmw(display, regs->driver,
 		     0,
@@ -1935,8 +1937,15 @@ static void xelpdp_aux_power_well_enable(struct intel_display *display,
 		icl_tc_port_assert_ref_held(display, power_well,
 					    aux_ch_to_digital_port(display, aux_ch));
 
+	/*
+	 * This is the same register the AUX engine is driven through, so
+	 * mask Send Busy out of the read-modify-write.  Otherwise, if a
+	 * transaction is still in flight, we'd write Send Busy back as 1
+	 * and trigger the transaction again.
+	 */
 	intel_de_rmw(display, XELPDP_DP_AUX_CH_CTL(display, aux_ch),
-		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
+		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST |
+		     DP_AUX_CH_CTL_SEND_BUSY,
 		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST);
 
 	if (HAS_LT_PHY(display)) {
@@ -1962,8 +1971,10 @@ static void xelpdp_aux_power_well_disable(struct intel_display *display,
 	enum aux_ch aux_ch = i915_power_well_instance(power_well)->xelpdp.aux_ch;
 	enum phy phy = icl_aux_pw_to_phy(display, power_well);
 
+	/* don't write Send Busy back as 1, see the enable path */
 	intel_de_rmw(display, XELPDP_DP_AUX_CH_CTL(display, aux_ch),
-		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST,
+		     XELPDP_DP_AUX_CH_CTL_POWER_REQUEST |
+		     DP_AUX_CH_CTL_SEND_BUSY,
 		     0);
 
 	if (HAS_LT_PHY(display)) {
-- 
2.53.0

