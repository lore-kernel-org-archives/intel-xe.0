Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53014FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 10:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158CE10E60A;
	Mon,  4 May 2026 10:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0NK8yQ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8410E60A;
 Mon,  4 May 2026 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777889491; x=1809425491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JuyXTX9XqMfZDpvHpGJpv/uql43rwo6HVw8zVnVB6UE=;
 b=a0NK8yQ7Cmhszua85At70A79rQzzC8Z00P2iLoSGh7/OPFST8blmMckp
 4IsWdjhU9ov9t6rCzXjtIIpAp54kC1E1qOyU34FTgOTRZDSKaF5tigWw5
 7VsO5qoe6vwCZR8O8/IQ7Ezm7MHrVhMA/NuAkZGiKkLTeLH2DWkUVDYQk
 /p4JDZXT47vWbiRdq34W8l+4hnbCqzmG0fX6qByc0fYMA3lNnBZ/0t2BJ
 /SVfuXvgvbMxilqkHqlWPabKPPr9UdQZATukjyIaOI2UHfSHz8Z4Cl8z4
 L2f9ZoRRYhXZrEfyxkeJPYXTDQJgPvbP2b/GXJqSs7d1pZOhrjcMTRAJe w==;
X-CSE-ConnectionGUID: qtjNlZoSRruXHOJI6DmVYA==
X-CSE-MsgGUID: Wf0o0mggTlWkjltxO0Fw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82356841"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="82356841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 03:11:30 -0700
X-CSE-ConnectionGUID: lNs85im0TYqHRij5+al37Q==
X-CSE-MsgGUID: yrQU6gttQtSew6GcJOg+rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="232327150"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa007.fm.intel.com with ESMTP; 04 May 2026 03:11:29 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, fnu.vishwanatha@intel.com,
 santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 2/2] drm/i915/hdcp: Drop mgr->base.lock acquisition in
 intel_conn_to_vcpi()
Date: Mon,  4 May 2026 15:41:18 +0530
Message-Id: <20260504101117.3619984-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504101117.3619984-1-suraj.kandpal@intel.com>
References: <20260504101117.3619984-1-suraj.kandpal@intel.com>
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

Now that intel_conn_to_vcpi() reads the MST topology state via
drm_atomic_get_new_mst_topology_state(), the topology state belongs
to this atomic commit and is already serialized through the atomic
state's private object machinery. There is no need to additionally
take mgr->base.lock here.
Taking it from the HDCP enable path in commit_tail with
state->base.acquire_ctx is also unsafe: by this point the
acquire_ctx is no longer in a state where new modeset locks may be
acquired through it, which produces a modeset-lock splat on MST +
HDCP. Drop the drm_modeset_lock() call.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Tested-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 02ac981ca1ea..982f698e9814 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -80,9 +80,8 @@ static int intel_conn_to_vcpi(struct intel_atomic_state *state,
 	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
 	if (!connector->mst.port)
 		return 0;
-	mgr = connector->mst.port->mgr;
 
-	drm_modeset_lock(&mgr->base.lock, state->base.acquire_ctx);
+	mgr = connector->mst.port->mgr;
 	mst_state = drm_atomic_get_new_mst_topology_state(&state->base, mgr);
 	if (!mst_state) {
 		drm_dbg_kms(display->drm, "MST topology still not created\n");
-- 
2.34.1

