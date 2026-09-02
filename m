Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A182FC624D0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9346910F10D;
	Wed,  2 Sep 2026 10:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ux8L96fQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB9110F10B;
 Wed,  2 Sep 2026 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788346494; x=1819882494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rksPp3rHa/EKYgpDdCpLD/DEcw7d1GBwldJTYa1T7os=;
 b=Ux8L96fQaS+1EBunxxte3D4ayn7uSmYP1h4uTVn6aNEfZYntx5IAEH1t
 7k8l8gKwzf0x8guj84+Dy38ToPmKoKnOv8QAmnSTsvnlLOTn4N/4MASa6
 JctE2yjf45loSuB1yBot+Fe+IqRb3YcRYuyQfUr+GQC2NbLc42bbXqAIH
 osIvKI1tNV06Ky3TOZRZqCP0whFlDuzphFHDcFjmAqp8gl2Z5FxRoRVrS
 eSxBt/MqqRsUciXxw5DJmkaIVLbInPnIkHQiDp6r3uQiEbkBQp3rDYyox
 brDblbZP4r9C3LOZG0xZ5d1UgG+oGaGlsQravrCB5c+Zcblwoo4QyDdtr w==;
X-CSE-ConnectionGUID: OTGxFNl5SDyl/plYqmyiNg==
X-CSE-MsgGUID: 0Kjk645YRgyfLYlwGFwHHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="91311487"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="91311487"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:54:54 -0700
X-CSE-ConnectionGUID: aw3t0HMbSjOOcEYap8SYJw==
X-CSE-MsgGUID: ioUXh3fNR72gwo43bEXGtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="273136882"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa004.jf.intel.com with ESMTP; 02 Sep 2026 03:54:53 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 2/2] drm/i915/display: Reset use_flipq when duplicating
 crtc state
Date: Wed,  2 Sep 2026 10:54:47 +0000
Message-ID: <20260902105448.809455-3-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902105448.809455-1-mika.kahola@intel.com>
References: <20260902105448.809455-1-mika.kahola@intel.com>
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

intel_crtc_duplicate_state() resets use_dsb to false but not
use_flipq, letting a stale true value survive into the new state.

Reset use_flipq alongside use_dsb.

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

