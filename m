Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570EC606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wl0SOKSN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EFB10EF47;
	Mon, 16 Nov 2026 10:55:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DCB10EF41;
 Mon, 16 Nov 2026 10:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794826515; x=1826362515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uKY0aFFHp4kOP3CxI4CNB1qAeVEe0XHsqgtfKvgxmfI=;
 b=Wl0SOKSNVce+oo67CipF00gwZTtfXulD2nNyt13ylmlSxqMHR26oRv60
 JQWXPWWzgtn/TUq5I2n5ncfgTd+pnawvTw3O6rFLN3zJBvt/+asIuFMjz
 51BfGdsPtsvM0HTG3CF3Tnp6zU8LY/omu44D/Fjf6hJDFpCd9hwyYh1yP
 ycphUrUYKiJgO0/L+EcvOVW155umAHULI//lx5TniCBXiU6KwVKlBbyLj
 ERtJIcPr3MXuxeAlUWb+SwV+hkeaZRC+2KOboztOQy0AVvZ3i8Y6j3BKU
 AmL+gL1s2nDiNEKKLDcQzvOJGr/sWsb2+Y5zLgrEmodNKK8wbKtpWGgsL Q==;
X-CSE-ConnectionGUID: sy9hE+jlTDOXa1jiZ+e2Tg==
X-CSE-MsgGUID: 5KFLU1LSTKGeNZElhBKnZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3461464"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3461464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 02:55:15 -0800
X-CSE-ConnectionGUID: Wh/sTtGwS8aVNRn6cLvoYw==
X-CSE-MsgGUID: ajW5nQAFSueof8pYeGEBFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9654406"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa003.fm.intel.com with ESMTP; 16 Nov 2026 02:55:12 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, imre.deak@intel.com,
 ville.syrjala@linux.intel.com, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/dp_mst: Don't round up the PBN to whole TUs if not
 needed
Date: Mon, 16 Nov 2026 18:53:05 +0800
Message-ID: <20261116105305.1374985-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
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

intel_dp_mtp_tu_compute_config() rounds up the stream's PBN to a whole
number of TUs (remote_tu * pbn_div) before passing it to
drm_dp_atomic_find_time_slots(). The MST core uses this PBN both in the
ALLOCATE_PAYLOAD messages and for checking the bandwidth limit of the
path in drm_dp_mst_atomic_check_mstb_bw_limit(), against the
Full_Payload_Bandwidth_Number reported by the branch device.

Rounding up the PBN is needed only if the TU alignment required by the
HW (4 / lane_count) increased the TU count, to make the TU count the MST
core derives from the PBN match the TU count programmed to the HW.
Otherwise the MST core derives the same TU count from the exact PBN as
well.

Rounding up needlessly can make a stream that would fit on the path
exceed its limit. For instance 1920x1080@120 8 bpc needs 1022 PBN, which
fits a port reporting 1024 PBN, but on a 4 lane HBR3 link (60 PBN per
TU) it gets rounded up to 18 TUs = 1080 PBN. The stream then fails the
check and the driver reduces it to 6 bpc (13 TUs).

Round up the PBN to the aligned TU count only if the alignment changed
the TU count, otherwise use the exact PBN.

Tested with a PS8650 MST hub driving three 1920x1080@120 panels on Nova
Lake: the streams now use 24 bpp (18 TUs, 1022 PBN out of the 1024 PBN
limit) instead of 18 bpp.

Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1e6190689e..c8cb328a1d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -349,7 +349,7 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 
 		if (is_mst) {
 			int remote_bw_overhead;
-			int remote_tu;
+			int remote_tu, aligned_tu;
 			fixed20_12 pbn;
 
 			remote_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
@@ -381,16 +381,18 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 			 * TODO: remove the alignment restriction for 128b/132b links
 			 * on some platforms, where Bspec allows this.
 			 */
-			remote_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
+			aligned_tu = ALIGN(remote_tu, 4 / crtc_state->lane_count);
 
 			/*
-			 * Also align PBNs accordingly, since MST core will derive its
-			 * own copy of TU from the PBN in drm_dp_atomic_find_time_slots().
-			 * The above comment about the difference between the PBN
-			 * allocated for the whole path and the TUs allocated for the
-			 * first branch device's link also applies here.
+			 * MST core derives its own copy of TU from the PBN in
+			 * drm_dp_atomic_find_time_slots(), so round the PBN up to
+			 * the aligned TU only if the alignment changed it. Otherwise
+			 * keep the exact PBN, since rounding it up to whole TUs can
+			 * make it exceed the path's PBN limit.
 			 */
-			pbn.full = remote_tu * mst_state->pbn_div.full;
+			if (aligned_tu != remote_tu)
+				pbn.full = aligned_tu * mst_state->pbn_div.full;
+			remote_tu = aligned_tu;
 
 			drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
 			crtc_state->dp_m_n.tu = remote_tu;
-- 
2.43.0

