Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26534C624D6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC35110F214;
	Wed,  2 Sep 2026 14:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDn4/D/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088410F214
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788358132; x=1819894132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CW9fBmbfvllCsS/rU1JrNDeaCzgXdha3BAjO7i6WyyY=;
 b=LDn4/D/Nb5CXAbpON68AOCC1OasktdBkxxcrSHB5SudDzdSEaUbpZZHq
 jXkobxrT1P4ElIddkXQWB2v3Zlr9fe4RJw626XaiKTzETORvwpp8uo2kq
 CSy+7Pw0iCcGQUMmmChJKsNOEfPaS4ElFCEUf5Gbty4zfcyfxG3y+C5m2
 DEZhqHQnLbmGVd3G/e2NGgoMX7IdNwXe43SxoBqqmiaM5B6dctTBATHVz
 R9E8J+mrtIwKMrahmWRzJ+/YTtNOOilH3G5OX5DGveL0dN4fdec52xd3F
 EDDWvs2S93riMdXG5akqNt+lLic5+FTJ9BQ7P8/z/Zj5bzTFvYDBeWwwU A==;
X-CSE-ConnectionGUID: pCzdiw7YQ5u4vf8zA9+sUw==
X-CSE-MsgGUID: GKYISEqjSG6DUfEJipHeqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88667521"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88667521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:08:52 -0700
X-CSE-ConnectionGUID: IYgmhsYXSwWIjLVZ8nCRRQ==
X-CSE-MsgGUID: EX57bclYQoePSKDFMtXx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="292926227"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2026 07:08:50 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedsktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3] drm/i915/display: Reset use_flipq when duplicating crtc
 state
Date: Wed,  2 Sep 2026 14:08:48 +0000
Message-ID: <20260902140848.915941-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

intel_crtc_duplicate_state() resets use_dsb to false but not
use_flipq, letting a stale true value survive into the new state.

Reset use_flipq alongside use_dsb.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 9d0d47c79dd1..b66c2d4ba2b3 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -276,6 +276,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->dsb_color = NULL;
 	crtc_state->dsb_commit = NULL;
 	crtc_state->use_dsb = false;
+	crtc_state->use_flipq = false;
 
 	return &crtc_state->uapi;
 }
-- 
2.43.0

