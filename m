Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F9606A32C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 08:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qd/eOMNm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236A610EC02;
	Mon,  2 Nov 2026 08:07:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1110EC00;
 Mon,  2 Nov 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793606829; x=1825142829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcumCLlxbk5QNT/NQdWJxTLArIX0pngGcbi6s1BcsvE=;
 b=Qd/eOMNmJgJNgz/DYVvNbZ5h3Dnj5HTOOt57y5bri4YynMshwaKeNlmN
 WZMTkvjz5xRYM97daHCme1jLuECnukBy+gaD/7LXo0seQX0YJbYtkq+Jr
 z31kG5SwUGFWlBIP5py7hxzlvWtAKbs+CqkJKvdOh1EAkawWcA2KWHE+h
 8CBbivgb1zIfNWZO/nw9HxIxDxqcmNY4ah0XElPg8tbt6BJr8Q68/HMnH
 YSvUx7szC3J3QxA7Yb7x2SqhxRIERuV/JmZ7tcyr3dq5BaO5geP6iUoF/
 pyNsb9ydCtrAzdxykcHhu3b59XksEAm5CA52fC3guIJcp3/V9BjxqWjPn w==;
X-CSE-ConnectionGUID: AR6TJinxScm7zMBiODo+LA==
X-CSE-MsgGUID: 9tfIcv1YQ3CB0O7NwNbtaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2282682"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2282682"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 00:07:09 -0800
X-CSE-ConnectionGUID: 279Zub1xSNS8x/U/UMEsmQ==
X-CSE-MsgGUID: ugyTq81SRbCodO3KrDvYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5883695"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 02 Nov 2026 00:07:07 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/display: Run the selective fetch update after the
 crtc checks
Date: Mon,  2 Nov 2026 08:07:05 +0000
Message-ID: <20261102080705.2027571-1-mika.kahola@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

intel_psr2_sel_fetch_update() computes the selective fetch area of all
the joined pipes from the joiner primary, but still runs from
intel_crtc_atomic_check(). The scaler ids it checks are only assigned
while the owning pipe is being checked, so the primary, checked first,
sees the secondary ids of the previous commit. A plane that starts
being scaled on the secondary then looks unscaled and the full update
fallback is skipped.

Run it in its own loop at the end of intel_atomic_check_crtcs(), once
every crtc has been checked. Nothing consumes the selective fetch
results before the planes are programmed.

Fixes: dd038a8d440a ("drm/i915/psr: Merge the selective fetch area across joined pipes")
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5e40487e9ab0..2eafcb1450aa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4550,10 +4550,6 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
 
 	}
 
-	ret = intel_psr2_sel_fetch_update(state, crtc);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -6096,6 +6092,19 @@ static int intel_atomic_check_crtcs(struct intel_atomic_state *state)
 		}
 	}
 
+	/* Selective fetch needs the scaler state of all the joined pipes. */
+	for_each_new_intel_crtc_in_state(state, crtc, crtc_state) {
+		int ret;
+
+		ret = intel_psr2_sel_fetch_update(state, crtc);
+		if (ret) {
+			drm_dbg_atomic(display->drm,
+				       "[CRTC:%d:%s] selective fetch check failed\n",
+				       crtc->base.base.id, crtc->base.name);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.43.0

