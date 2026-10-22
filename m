Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B8C606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QlpFlzpe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E501710E3B3;
	Thu, 22 Oct 2026 06:17:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A145F10E3BF;
 Thu, 22 Oct 2026 06:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792649860; x=1824185860;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b+BV+wl0sc54j5CAB5kidszjRnSKKaZwHPGmp9nwN0w=;
 b=QlpFlzpeW10Q9i85pFG1azfI2U2We2gprXdH9yZYQuxTTeh3usLPyIzi
 4Hbp6GEebyKewrrbslln3n2kotYWu3C7mFmGm4j53IorwEvP0k5l5zvlL
 E/O33Cp1m24T672cQClAKnENQEBDCgf4kxLOupvphoOORu9iIHwQEkuzR
 XVQr4+glbY8Ndfk8EuwtaUqTq2HoFtCc2HzqYm+FvxijTn3TPhs0W5fpO
 Hdgw5xcYy1zPMcE3m644Mm8sWOA6AlGthDuuPBHtHkW9eR0kBJlAL96cZ
 /ayUfG7oszEnT6RcExU8Juu9of/04sivpH4idmhTZINneE+XlHDV9EMua w==;
X-CSE-ConnectionGUID: 95f81zTXRmaWgmWVycJBSg==
X-CSE-MsgGUID: Oc4LcPSaRoWrK/vVXbbtMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1264492"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1264492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 23:17:39 -0700
X-CSE-ConnectionGUID: vAQy0Zj1TPOs/K0bUY/05Q==
X-CSE-MsgGUID: AC0By3/3S3+iUeY34fAuIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3686736"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 23:17:38 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/dp_mst: Drop dead ret check in
 mst_stream_compute_link_for_joined_pipes()
Date: Thu, 22 Oct 2026 11:47:36 +0530
Message-Id: <20261022061736.1721600-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

When the DSC path is taken, both helpers that set ret return early on
error, and the non-DSC path only falls through with ret == 0, so ret is
always 0 after the DSC block.
Drop the dead return.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 7023619aaaba..0424557eb151 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -726,9 +726,6 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 			return -EINVAL;
 	}
 
-	if (ret)
-		return ret;
-
 	ret = intel_dp_compute_min_hblank(pipe_config, conn_state);
 	if (ret)
 		return ret;
-- 
2.34.1

