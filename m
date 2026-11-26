Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD9606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOV9txu3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213F10FEEF;
	Thu, 26 Nov 2026 06:35:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD8810FE15;
 Thu, 26 Nov 2026 06:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674937; x=1827210937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+j2AyS9/Ce05q/iZwKfYWwe3yXdc+YnOaUXS+8X7DMA=;
 b=MOV9txu3gMEca/UzgWfG46gu/D7kmb9h4K5IXZEUDhAXH2YPIBjVa30v
 jKkD4FxqMc0lwYidM8onWmzpZTIK8FzVMterHi9Pe6lNzsXDEyf//Ltly
 bjvlVyK8iwt5t8jaw/MMiQePQUFo4+waW8GgyPFtL9QjpFyax/SRIfU5D
 /Pa0kP6/9xp2W9xwGfXG1lwBlrLNM2jdIvVyblLQSCH0ktFRNtWR10P7f
 EK8yEvjgW8sQjDf3piz6oDFmfuWUgrgbhTrmFHBrn87rZVlmnQ6eq6zWN
 uj2n25hqgycTSgaVXgOgibqqsPecnjqbxsZmTds5tciq7DsyjVsTOvDRN g==;
X-CSE-ConnectionGUID: LaBVTRTRSmaCGNC0XGuceQ==
X-CSE-MsgGUID: ksp1fZV+Q1Oexzya44wjjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462684"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462684"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:37 -0800
X-CSE-ConnectionGUID: dLwRDpSZSYyAiHff6Dumaw==
X-CSE-MsgGUID: MezPGlHbRBqjNIpPksmdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346809"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:35 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 15/15] drm/i915/ddi: Disable port sync on PTL
Date: Thu, 26 Nov 2026 12:04:59 +0530
Message-Id: <20261126063459.863698-16-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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

Port sync is defeatured from xe3lpd onwards (Wa_16024710867). It was
allowed again on PTL to keep the tiles of dual-SST tiled displays in
sync, but PTL now uses pipelock for that. Limit port sync to the
platforms before xe3lpd again.

Bspec: 69965
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 31b03bbd43c4..6a2aeac96e8e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4671,7 +4671,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	 * From, xe3lpd onwards we have defeatured this with reference to
 	 * Wa_16024710867
 	 */
-	if (!IS_DISPLAY_VER(display, 9, 30) && !HAS_PIPELOCK(display))
+	if (!IS_DISPLAY_VER(display, 9, 20) && !HAS_PIPELOCK(display))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
-- 
2.34.1

