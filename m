Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E2C18E7C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 13:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B8C10E225;
	Wed, 26 Feb 2025 13:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BW+PK5AL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCE810E225;
 Wed, 26 Feb 2025 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740578194; x=1772114194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jTAjUk+9joQGZFsQkt+L+5w+ujSUZbOYL2BHWr7t3WI=;
 b=BW+PK5ALSFkDqz48rJ6K0GKtfLRGLp6lAE0HTnjWqltrSa1Q1vgRYQne
 dQM0XoBUblM8IAtro7q7jUw5HuYkmGu15g5ZNqHzu7lO0dVeE1VNaY2Ho
 qmYW4Urn7qDOV20EMvDcSrCryfRleHA6xzGG8y3xv7UzEPxq8aQuHnxwy
 N3WU61Pxc719oKSQSjebtl1GGBHbiRSuQoO8e7CR0TTxj5vNb2+KCdgd+
 6QDTEDVT98PSbnb/CMyGLsoyHb6DxZcRKKTmP9doS+muvbMxfMYgI8v74
 e8OEv2FwA7PePUmqUHXc7M4JgjSAqLRaJe7o29EzsfiphCHHLMVYbNpAs g==;
X-CSE-ConnectionGUID: 9KZZAlvuSZyA3YBZ6KaiTA==
X-CSE-MsgGUID: 24Ukq+G/Tqi6oqYpUdnXNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40657623"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="40657623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:56:33 -0800
X-CSE-ConnectionGUID: 2rkWMhOESB2zubNhmYZHyg==
X-CSE-MsgGUID: 1zNCwnNERpyxNwXOGRwzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="121804012"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.123])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 05:56:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, stable@vger.kernel.org,
 Imre Deak <imre.deak@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/i915/mst: update max stream count to match number of pipes
Date: Wed, 26 Feb 2025 15:56:26 +0200
Message-Id: <20250226135626.1956012-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We create the stream encoders and attach connectors for each pipe we
have. As the number of pipes has increased, we've failed to update the
topology manager maximum number of payloads to match that. Bump up the
max stream count to match number of pipes, enabling the fourth stream on
platforms that support four pipes.

Cc: stable@vger.kernel.org
Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 167e4a70ab12..822218d8cfd4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1896,7 +1896,8 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	/* create encoders */
 	mst_stream_encoders_create(dig_port);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, display->drm,
-					   &intel_dp->aux, 16, 3, conn_base_id);
+					   &intel_dp->aux, 16,
+					   INTEL_NUM_PIPES(display), conn_base_id);
 	if (ret) {
 		intel_dp->mst_mgr.cbs = NULL;
 		return ret;
-- 
2.39.5

