Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD7ECA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 04:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE3A10E102;
	Mon, 12 Oct 2026 04:13:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC94810E102;
 Mon, 12 Oct 2026 04:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791778409; x=1823314409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u2I0AUsfGydr1mXfffQfNFBUoEQnKwDa6IZkjCHNXWk=;
 b=le4x4ToSQrszmQvuErzOxGdVN39+kKdbC6JZc6t4VuOa6NGP8d3+GzPU
 jhv0ZcNDe/g02WHW2ZZC7AlLrBWM7E1IqhloGLzS3Xy7OKyrViR1dOJv/
 PpzniPNKZuNNZNnyrlAygv5g3bn6O5S+mepKJTctct+rfb3MdDIYW4oTv
 2VdmFncOuILEc5rcznftEOEt4YJnvkpTMMQardeQvKh41Cx9SI05JrLaa
 UIRAbXNpDA3wuJsdrnY8WnPjjT0YEAPQIQqkTvY3Fo8G/k8rtqtgYRs4N
 Hys8wBRM2y0UuCkXdeUSIkl+hqYWF/eBq/PSwwrBfBT363lfbaGmmJ3h2 g==;
X-CSE-ConnectionGUID: Onw5HBN0ToyQ+G5eHsnNtQ==
X-CSE-MsgGUID: R+YZMYetRFekYxFD9AW8xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="470705"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="470705"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2026 21:13:28 -0700
X-CSE-ConnectionGUID: IMEdxLHcTa6M+WRxMHmihw==
X-CSE-MsgGUID: 2bP6F2T5QwmQvH9V4E2Adw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="1095115"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa008.fm.intel.com with ESMTP; 11 Oct 2026 21:13:27 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	stable@vger.kernel.org
Subject: [PATCH v1] drm/i915/display: Allow port sync on PTL
Date: Mon, 12 Oct 2026 09:34:02 +0530
Message-ID: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Some dual-SST tiled displays exhibit visual corruption on PTL, with
one tile's image vertically shifted or wrapped by a random amount
that changes on every hotplug.

PTL supports port sync, so allow it to be used to avoid these
display issues.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
Fixes: 05cffc074938 ("drm/i915/display: Implement Wa_16024710867")
Cc: stable@vger.kernel.org
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a46ab5d3d70f..a0aff087fafa 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4629,7 +4629,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	 * From, xe3lpd onwards we have defeatured this with reference to
 	 * Wa_16024710867
 	 */
-	if (!IS_DISPLAY_VER(display, 9, 20))
+	if (!IS_DISPLAY_VER(display, 9, 30))
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
-- 
2.48.1

