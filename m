Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017FC2A075
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 09:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778B10E3B0;
	Mon,  5 Jan 2026 09:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etzsjQ8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9B810E3B0;
 Mon,  5 Jan 2026 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767604819; x=1799140819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WuOTmcGYizVOB1PjQz0kq231sW0Lqe4V88Jf4zj7dCw=;
 b=etzsjQ8UYgy77eKrvWWr14BwQZuBL/CBHs34D3Ge0aNNPFxZ1V1f+NKY
 kKi6YDII+FuFroIYxrUkwGKMyOmvKaSnyxHiwdtQUPV2tCDXzT/n6jFYQ
 /Ly2eEGy3NdCxf2ThU7R9xOutEMPUrakFDtHWOrqWgKLzeNbiU7gzZWqH
 BUd4lTzwolzKO8b8OpMjHxVfXlMIJ8nJlkK/Zh/vMDoRcDTp2CU/+mDMa
 oaMiNyPyCP9CCEGGGaTyWzaY0w1jyDR80NgvYBDH2YTBkdPWkxNrZuBVR
 sCXuus5rPc8KQKlG27e7F4wBKMuOLj5uMyk6FcTaTaeOezmCmDoCATf0I Q==;
X-CSE-ConnectionGUID: GLfW+u8wQ36YK+gwSPyIAQ==
X-CSE-MsgGUID: hSXm98HtQne0PMXJeNPMYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79690374"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="79690374"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:20:19 -0800
X-CSE-ConnectionGUID: ZArV5VNCSfSotSGWycHOxQ==
X-CSE-MsgGUID: ai2u0fe/SCefTT2+2alfAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="201581261"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa010.jf.intel.com with ESMTP; 05 Jan 2026 01:20:17 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH] drm/i915/display: Disable casf with joiner
Date: Mon,  5 Jan 2026 14:42:02 +0530
Message-Id: <20260105091202.203926-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

Currently pipe scaling is not supported with the
joiner. As casf requires pipe scaling, fail the
atomic commit whenever joiner comes into picture.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 95339b496f24..259bc50d5ed8 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -116,6 +116,11 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 		return 0;
 	}
 
+	if (crtc_state->joiner_pipes) {
+		drm_WARN(display->drm, 0, "CASF not supported with joiner\n");
+		return -EINVAL;
+	}
+
 	crtc_state->hw.casf_params.casf_enable = true;
 
 	/*
-- 
2.25.1

