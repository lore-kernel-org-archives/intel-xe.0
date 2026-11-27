Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D8606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VLO6qXha
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F15112118;
	Fri, 27 Nov 2026 06:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901AF11211B;
 Fri, 27 Nov 2026 06:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759785; x=1827295785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+mTPenK/f/wUTLHgdwQSkq6zujJnc3goSCHctaeUWHg=;
 b=VLO6qXha1s2ewdpAfgrHxkcjhfTMNGFtNBsnslUNFh5BE+z6J8E2v3Tg
 xJu1Cne74NPbAUEyw3YqpJQiHUcSWWBfMY+HFN14RC3PDlTRdYLGRReJd
 cR4aRhWnbvLPvh5Jui0S7JLZ1NPqsKCYXuXTSLzJLl+Zf6APeHn39v2id
 Z93MoRUz7PBhRlbRuxZkohVsdSV98nnloYcvMdyhJtX972UxJAtJHNPMj
 SZ7FsxQSiUpxs6NImv3FdjXE513REtxQD6TmImJR4wI/Df0qE6fxEO8k7
 k4/gP6LbiXkIZqncUPbuAZ71hBBM+/7OOKXQTEfQ32wJ7OUxrTe1xRc7C A==;
X-CSE-ConnectionGUID: Bz0MwghYTjeIx9TJjhHyqA==
X-CSE-MsgGUID: RzzUUpdlQf+KpydURmRrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578247"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578247"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:45 -0800
X-CSE-ConnectionGUID: DO03E+aLS1ibShGB2VQIxA==
X-CSE-MsgGUID: hJcgqRUJTqWPILbmh1S/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361919"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:42 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 04/18] drm/i915/ddi: Program pipelock in TRANS_DDI_FUNC_CTL2
Date: Fri, 27 Nov 2026 11:39:10 +0530
Message-Id: <20261127060924.1648295-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On platforms with pipelock, set up a sync secondary as a local genlock
secondary of its primary instead of enabling port sync. The primary
itself needs no programming. This has to be done before
TRANS_DDI_FUNC_CTL is enabled, which is where the port sync config is
written today, so reuse that.

Nothing computes a sync group on these platforms yet.

Bspec: 73521
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      | 19 +++++++++++++++++--
 .../drm/i915/display/intel_display_types.h    |  6 ++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ffd76766e460..b664d7201d6f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -488,6 +488,17 @@ static u32 bdw_trans_port_sync_master_select(enum transcoder master_transcoder)
 		return master_transcoder + 1;
 }
 
+static u32 pipelock_ctl2_val_get(const struct intel_crtc_state *crtc_state)
+{
+	u32 val = GENLOCK_ENABLE | GENLOCK_MODE_LOCAL_SECONDARY |
+		TG_START_DELAY(crtc_state->pipelock.tg_start_delay);
+
+	if (crtc_state->pipelock.per_frame_sync)
+		val |= PIPELOCK_PER_FRAME_SYNC;
+
+	return val;
+}
+
 static void
 intel_ddi_config_transcoder_dp2(const struct intel_crtc_state *crtc_state,
 				bool enable)
@@ -639,8 +650,12 @@ void intel_ddi_enable_transcoder_func(struct intel_encoder *encoder,
 			u8 master_select =
 				bdw_trans_port_sync_master_select(primary_transcoder);
 
-			ctl2 |= PORT_SYNC_MODE_ENABLE |
-				PORT_SYNC_MODE_MASTER_SELECT(master_select);
+			if (HAS_PIPELOCK(display))
+				ctl2 |= pipelock_ctl2_val_get(crtc_state);
+			else
+				ctl2 |= PORT_SYNC_MODE_ENABLE;
+
+			ctl2 |= PORT_SYNC_MODE_MASTER_SELECT(master_select);
 		}
 
 		intel_de_write(display,
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4e42c710ead4..576b00ada471 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1395,6 +1395,12 @@ struct intel_crtc_state {
 	/* Bitmask of secondary transcoders synced to this one */
 	u16 sync_secondaries_mask;
 
+	/* Only valid on a pipelock secondary */
+	struct {
+		u16 tg_start_delay;
+		bool per_frame_sync;
+	} pipelock;
+
 	/* Only valid on TGL+ */
 	enum transcoder mst_master_transcoder;
 
-- 
2.34.1

