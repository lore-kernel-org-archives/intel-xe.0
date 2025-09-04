Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF126CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 08:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B576899A3;
	Thu,  4 Sep 2025 08:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYohJ/dU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E97899A3;
 Thu,  4 Sep 2025 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756975521; x=1788511521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PL83UpkowztPSxBSApQMIElN634LRewDGj5sDH0mlO8=;
 b=EYohJ/dUPgx9UCteotMlIeft85cVy+R97Ef+5RNVjp9O2h96Nyg7fNAB
 7fPGSZSOV5HP122FVf024iz+vbTBr7H7cfsy7ZJol1aiOZ6g9kLGjjZiI
 aBd/aWFsP6QwZ46He6QoJ0xg44g/vfXUjRQGrN1HjpCUKat+8BurLU0hN
 Zhq3yU1eofLKPpQMcmkXaOFARJcH+nPrjrmLEIcxmprlGREM5kLLi/WrI
 pwpIac/3ibKcwi9efEGUTINsr/4lSyPSSGwKy1ej15cH9I3IqS0Ka6cvH
 k/EJ1zSbK0AIh64AgfRT21Y8jzrligK+l/uNjifmKpxHEZSQv35R+LeQM w==;
X-CSE-ConnectionGUID: 16Ze/VvsSFGjXaL2dUse6A==
X-CSE-MsgGUID: GMpVXTiKSJirO1pjwKyNiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="58341457"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="58341457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 01:45:20 -0700
X-CSE-ConnectionGUID: l/ENzrSqRCq+HtuwE5mUig==
X-CSE-MsgGUID: F+6sfCvgRNybF2giiEh7Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="172660083"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2025 01:45:19 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com, ankit.k.nautiyal@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER
Date: Thu,  4 Sep 2025 14:15:10 +0530
Message-Id: <20250904084510.951150-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

Currently we check if the encoder is INVALID or -1 and throw a
WARN_ON but we still end up writing the temp value which will
overflow and corrupt the whole programmed value.

Fixes: 6671c367a9bea ("drm/i915/tgl: Select master transcoder for MST stream")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4e4ea3a0ff83..0a58c07a8240 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -596,9 +596,9 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 			enum transcoder master;
 
 			master = crtc_state->mst_master_transcoder;
-			drm_WARN_ON(display->drm,
-				    master == INVALID_TRANSCODER);
-			temp |= TRANS_DDI_MST_TRANSPORT_SELECT(master);
+			if (!drm_WARN_ON(display->drm,
+					 master == INVALID_TRANSCODER))
+				temp |= TRANS_DDI_MST_TRANSPORT_SELECT(master);
 		}
 	} else {
 		temp |= TRANS_DDI_MODE_SELECT_DP_SST;
-- 
2.34.1

