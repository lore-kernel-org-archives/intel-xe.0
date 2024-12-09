Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617CE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 08:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C917310E59F;
	Mon,  9 Dec 2024 08:10:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnDb62XH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287A010E59F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731843; x=1765267843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7UQsS5TRhT/rENTB4QUNF5sepJe3D0k7zoEbcDxui4=;
 b=JnDb62XHMQoMJRujo7W3zYSfvbQg7J6NMZqyzPoKWGig193s46OTqZft
 cwkeirdY2q8TfZgQU3v0b87K9XoeLwmLvGyUf3UlWp+KD/cA/HKL22DbK
 ExCfiHYwu+g9rU9uJLH+rB/Alw7El83j9gXZ9x3OTAnhrln22Y8lYVWdG
 JPYCpuUdqeisiPOmdIXkI3cv//+Ly5Ct1/YWAUpa2xYn7lorDkDU6NYCi
 19fosFzphWPpvKho6PWz+Jz5OyT3PPybfRzaiWeuNwSp5sWO8Pu792kHM
 9O4NX3SfQSFOPARpDw3MnD3vbdKjt6dfcCQxRXRXfgrmvMH86Yvz8W05s A==;
X-CSE-ConnectionGUID: H3s+RBCwTQWlLOfu2L4c+g==
X-CSE-MsgGUID: L+f6bqKlQ5eDIkCNmwjdbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33359763"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208";a="33359763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:10:43 -0800
X-CSE-ConnectionGUID: Fi+SiFAFRx2L8Pn6psRJww==
X-CSE-MsgGUID: x72lImWDS7G8hjIeu8+GjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100031584"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 00:10:42 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, jeevan.b@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 2/2] drm/i915/lobf: Add debug print for LOBF
Date: Mon,  9 Dec 2024 13:20:38 +0530
Message-Id: <20241209075038.3976877-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20241209075038.3976877-1-animesh.manna@intel.com>
References: <20241209075038.3976877-1-animesh.manna@intel.com>
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

Lobf is enabled part of ALPM configuration and if has_lobf
is set to true respective bit for LOBF will be set. Add debug
print while setting the bitfield of LOBF.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 75063342a100..5fa6b36b0193 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -353,8 +353,10 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp->alpm_parameters.fast_wake_lines);
 	}
 
-	if (crtc_state->has_lobf)
+	if (crtc_state->has_lobf) {
 		alpm_ctl |= ALPM_CTL_LOBF_ENABLE;
+		drm_dbg_kms(display->drm, "Link off between frames (LOBF) enabled\n");
+	}
 
 	alpm_ctl |= ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp->alpm_parameters.check_entry_lines);
 
-- 
2.29.0

