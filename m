Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A6FF94CDC
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 07:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ABB10E839;
	Wed, 22 Apr 2026 07:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bef2nM+M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DDC10E81D;
 Wed, 22 Apr 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776843679; x=1808379679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o/XIemyupR2r1kTLWur4NS5aaCR7NH8orfM98108QgY=;
 b=Bef2nM+MPL5DUDkFOkmMq7KuPpnOCiN4S7gDYPGNj9MJisgytzpHTptj
 2KFJx0w0dMFTcM9WSDNpE94Xku8dUDSOTKY7QF4/xZlM+SS/TDIxOUm9Q
 QCG/bf1MwpDWdM4RemG5Vza0nLChrAjHDLRSlyNzPrFcujogUSgVR2lbD
 cLoDwrRSO357kq7pWOS8INscctrgPDktvvkB9qzUJV7OZAZ/QlkahMWhN
 Qf4xqUcYm4vDLrmHshghVccuhGw/0bZ4FW/6KKLNMcBECUxUziIuwg6dX
 Xv8F/UtzX+Eu4gOMiz5ye6wkNyOZ7i5AzifOxwqj7nHpOjYRVxFfIcrd7 Q==;
X-CSE-ConnectionGUID: Es41rH5+TWqmpIJpuPnX6g==
X-CSE-MsgGUID: WQH20ai7SVinRigAz0P5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="89177166"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89177166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 00:41:19 -0700
X-CSE-ConnectionGUID: EG1tO9n/QjCEwMRDarQnqw==
X-CSE-MsgGUID: ZRibwt3dS42HQQ/XNx7VFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="229114718"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 22 Apr 2026 00:41:17 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 5/6] drm/i915/cursor: Program secondary cursor planes
Date: Wed, 22 Apr 2026 13:07:21 +0530
Message-Id: <20260422073722.1861494-6-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422073722.1861494-1-nemesa.garg@intel.com>
References: <20260422073722.1861494-1-nemesa.garg@intel.com>
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

During the vblank-evade, program all joiner secondary cursor
planes using intel_plane_update_noarm()/intel_plane_update_arm()
or intel_plane_disable_arm() based on plane visibility.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index e61a019ba3b0..e03b27f05fc2 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -1046,6 +1046,24 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_disable_arm(NULL, plane, crtc_state);
 	}
 
+	for (int i = 0; i < num_sec; i++) {
+		struct intel_plane *sec_plane = to_intel_plane(new_sec_states[i]->uapi.plane);
+		struct intel_crtc *sec_crtc = to_intel_crtc(new_sec_states[i]->hw.crtc);
+		const struct intel_crtc_state *sec_crtc_state =
+						to_intel_crtc_state(sec_crtc->base.state);
+
+		if (new_sec_states[i]->uapi.visible) {
+			intel_plane_update_noarm(NULL, sec_plane,
+						 sec_crtc_state,
+						 new_sec_states[i]);
+			intel_plane_update_arm(NULL, sec_plane,
+					       sec_crtc_state,
+					       new_sec_states[i]);
+		} else {
+			intel_plane_disable_arm(NULL, sec_plane, sec_crtc_state);
+		}
+	}
+
 	local_irq_enable();
 
 	intel_psr_unlock(crtc_state);
-- 
2.25.1

