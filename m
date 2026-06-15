Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38E0CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 19:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BB610E5F5;
	Mon, 15 Jun 2026 19:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGm9+sV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF5710E5F0;
 Mon, 15 Jun 2026 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781550569; x=1813086569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l6EonC/yI1easvsB79sunyIMGIKXqAUlV9mi2sIEUp4=;
 b=EGm9+sV0/soJ8kgXR71jX1uA45okckge8oVfL6HhDndNx+y3hwHjEmbs
 OHaDMLRxlLhWQrZ08C7iFbTRBGFDWsdEU+HkyW/uWq2w+fWuqjHL86Eyj
 LtiKW9bRRBKEIBzVvJQorKu8dqJDBeGz+giLivFmpxtqCmjBn4iVgwhga
 C9wgJN3sm4Fg47yjpIUyj1JyBB4B4oMA8qIv4bml/PdjJQ1I1wjz9/eoy
 WERGpPXboMF4V96KOrzBAneDTW0UnFv1ElDHkxV/YfRkKXbzpLFKgxJcC
 2SY1VR/ZLaePEvJrgv32XMtSY0h1aVEUXMttfYTyl2msiV1UOzXdKlqP+ A==;
X-CSE-ConnectionGUID: mopPME6oQj6ShAKyJVKM6w==
X-CSE-MsgGUID: V6WvjFsrTWOFmiedlDhMxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82314210"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82314210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 12:09:28 -0700
X-CSE-ConnectionGUID: fmORcZVQR867H2KNj4uTaQ==
X-CSE-MsgGUID: oEG4Gh7fRsi+D1Uzeq3wRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271265087"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2026 12:09:26 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 3/3] drm/i915/scaler: return -EINVAL instead of -1
Date: Mon, 15 Jun 2026 21:08:39 +0200
Message-ID: <20260615190839.1219417-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260615190839.1219417-1-michal.grzelak@intel.com>
References: <20260615190839.1219417-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Scaler allocation fails returning -1 which equates to -EPERM. Return
-EINVAL instead. Also apply for skl_pipe_scaler_get_hw_state().

Fixes: e2255e9a5a77 ("drm/i915/scaler: abstract scaler searching loop")
Fixes: ecf2afc59c1e ("drm/i915/scaler: Extract intel_allocate_scaler()")
Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 0cfa5b7564ba8..c339fdd6936fa 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -351,7 +351,7 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		return scaler_id;
 	}
 
-	return -1;
+	return -EINVAL;
 }
 
 static void
@@ -848,7 +848,7 @@ static int skl_pipe_scaler_get_hw_state(struct intel_crtc_state *crtc_state)
 			return scaler_id;
 	}
 
-	return -1;
+	return -EINVAL;
 }
 
 void
-- 
2.45.2

