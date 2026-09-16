Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FECC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E6110E8FB;
	Wed, 16 Sep 2026 08:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M24aKDvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23AF10E8C0;
 Wed, 16 Sep 2026 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547423; x=1821083423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BDzEQFEYjs1Eot2uamGPhIUY4GC8La6e0FJ4XaISn+A=;
 b=M24aKDvfSk811w/MX+QfvQ6IMemjs9ckHFkgmdbuIC1PeDc9moJkEPnM
 znS7VdW5gPhTylFkrFlx+sr6YEiEFPHOI/NF6X2h/fM43pmm/nnIvgvkK
 69WMfGB7l0mUhx1gb6pMooyR3qO4ymO7oNWNg3SjvOlaZGREU1BJwoVG/
 viPpkV3TbAVRVtDMx80JCPyscMSOThIsuT1fJRV20zTNjdjMgta4ppCpy
 Kjio6vIqRNiGgx18v9tnECVj644dtgKsgiIP0wwUj11q/U68536pb0ooY
 3aaR2klSho/0emOSzYqklNYssKXtyeBV1xFm7M+q7y40ZAgToz/H4p81C A==;
X-CSE-ConnectionGUID: PQ9odPwmRQaTfGjxjYvsRA==
X-CSE-MsgGUID: bx7u1Ji5THe97d4FCThpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429644"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429644"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:23 -0700
X-CSE-ConnectionGUID: d36YOZI4T4Oq6OpRk8vK2Q==
X-CSE-MsgGUID: neSzn/E2TZK6dz5jmdszlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1497058"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 09/11] drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
Date: Wed, 16 Sep 2026 11:29:40 +0300
Message-ID: <26dfbd4d99f86c19efbff89613728ab967ec4f67.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 6a869d0f6ffc..87aea2a8ee69 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -2230,7 +2230,7 @@ bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp)
 	if (!intel_dp->is_mst)
 		return true;
 
-	ret = drm_dp_dpcd_readb(intel_dp->mst.mgr.aux, DP_MSTM_CTRL, &val);
+	ret = drm_dp_dpcd_read_byte(intel_dp->mst.mgr.aux, DP_MSTM_CTRL, &val);
 
 	/* Adjust the expected register value for SST + SideBand. */
 	if (ret < 0 || val != (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC)) {
-- 
2.47.3

