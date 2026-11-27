Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32950606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IiOkE9K6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52AB11228E;
	Fri, 27 Nov 2026 06:10:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C075E11212D;
 Fri, 27 Nov 2026 06:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759796; x=1827295796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AH5c7A+GjGxIi8w6Jwqq8z5rwXkrJ5/P3YZxsunjpPc=;
 b=IiOkE9K69JgOFUA2wzzWc2GzC3cysvzXzwPYJ4iBgf4LjH4OPjdVS3bf
 3ehumWzfMzsGuNWdzMyAjNlLzLBbSY7Zk2vR0RoXRiCHTiS9ltSA/dTUC
 +SO72ve+djJiktsjg5RUn3hjY23MfCAuW3k53sN8P52+NrXbXHj0YQ1uO
 9Y3CKBC3zTawrtzOlnhe4213rBmWJWHZsG4QWeNF5GctOSUD6JWu6bTJK
 wxQYT7r3fUPfH9V4iJD2Ww8QfpqzjbamyWQakb0Jy0+MdaC4yIH3DOv13
 ZNaKQk4eTvdIQC2vhs+KnS0NVd+bEd74If/PqT1domo5zz9kepydCnaaO Q==;
X-CSE-ConnectionGUID: iuoKE1lPT5GfZdNBpdLRBA==
X-CSE-MsgGUID: QitPElAYTB6n1xoP7A1XNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578260"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578260"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:56 -0800
X-CSE-ConnectionGUID: R4gmYY8AQriaxPEIyT0BWA==
X-CSE-MsgGUID: c/W6yEsBRX+I2Vc9vdB0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361937"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:53 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 09/18] drm/i915/pipelock: Document pipelock
Date: Fri, 27 Nov 2026 11:39:15 +0530
Message-Id: <20261127060924.1648295-10-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a DOC comment to intel_pipelock.c describing what pipelock is, the
terms used for it, and how the driver sets up a pipelock group, and add
it to the display documentation.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 Documentation/gpu/intel-display/index.rst     |  1 +
 Documentation/gpu/intel-display/pipelock.rst  |  8 ++++
 drivers/gpu/drm/i915/display/intel_pipelock.c | 46 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 Documentation/gpu/intel-display/pipelock.rst

diff --git a/Documentation/gpu/intel-display/index.rst b/Documentation/gpu/intel-display/index.rst
index e81f49bf20df..7fcff798548a 100644
--- a/Documentation/gpu/intel-display/index.rst
+++ b/Documentation/gpu/intel-display/index.rst
@@ -40,6 +40,7 @@ driver. The display driver isn't an independent driver in that sense.
    hotplug
    dp-link-training
    dp-link-capabilities
+   pipelock
    plane
    psr
    snps-phy
diff --git a/Documentation/gpu/intel-display/pipelock.rst b/Documentation/gpu/intel-display/pipelock.rst
new file mode 100644
index 000000000000..309cffbe6984
--- /dev/null
+++ b/Documentation/gpu/intel-display/pipelock.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: MIT
+.. Copyright © 2026 Intel Corporation
+
+Transcoder Pipelock
+===================
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_pipelock.c
+   :doc: Transcoder Pipelock
diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/drm/i915/display/intel_pipelock.c
index 67c643b6626c..765061638bc6 100644
--- a/drivers/gpu/drm/i915/display/intel_pipelock.c
+++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
@@ -7,6 +7,52 @@
 #include "intel_display_types.h"
 #include "intel_pipelock.h"
 
+/**
+ * DOC: Transcoder Pipelock
+ *
+ * Pipelock is a local variant of Genlock. It locks the timing generators (TG)
+ * of several transcoders in the same display engine together, so that they
+ * run at the same frequency and phase. The driver uses it to keep the tiles
+ * of a tiled display in sync, in place of transcoder port sync, which is
+ * defeatured from Xe3 onwards. Pipelock is used on platforms where
+ * HAS_PIPELOCK() is true, older platforms keep using port sync.
+ *
+ * One transcoder in a group is the primary, the others are secondaries. The
+ * TG of every running transcoder sends out a frame sync event every frame,
+ * at the start of its set context latency (SCL) window, or at the start of
+ * the VRR guardband if there is no SCL window. A secondary is set up in
+ * TRANS_DDI_FUNC_CTL2 as a local genlock secondary of its primary. Once it
+ * sees a frame sync from the primary, it starts its own TG after a
+ * programmable start delay. It either syncs just once, at modeset, or on
+ * every frame, which also allows a variable refresh rate. The primary needs
+ * no programming.
+ *
+ * The driver reuses the port sync primary/secondary state of the CRTCs for
+ * the pipelock group. A group is only formed from DP SST tiles that can be
+ * locked together:
+ *
+ * - The transcoders must have the same timings, link configuration, PLL
+ *   state, bpp, SCL, VRR timings and SDPs. The VRR guardband must match too,
+ *   so the guardband of each tile is raised to the largest one in its group.
+ *
+ * - Spread spectrum clocking (SSC), PSR, panel replay, content match refresh
+ *   rate (CMRR) and DC balance can't be used on pipelocked transcoders. They
+ *   are computed before the group is known, so they are kept off for every
+ *   DP SST tile on platforms with pipelock.
+ *
+ * - DP to HDMI protocol converters retime the signal, so they can't be
+ *   locked.
+ *
+ * - Syncing every frame needs the start delay to fit in a line. If it
+ *   doesn't, the tiles only sync once, which requires a fixed refresh rate.
+ *
+ * A secondary raises no vblank interrupts until it has synced, so the
+ * primary is enabled first and the secondaries after it. On disable the
+ * secondaries still go first. A link training fallback on one tile is
+ * applied to all the tiles of the group, so that they keep the same link
+ * configuration.
+ */
+
 bool intel_pipelock_connector_possible(const struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
-- 
2.34.1

