Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B227C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 07:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E166910E20B;
	Tue, 30 Apr 2024 07:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxfbZi26";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC48110E100
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714462953; x=1745998953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mX0hTtH7poh2OedgIIkZq5O8ut1s2aoANZgc9rnkDs=;
 b=ZxfbZi26JLG02SCNjvKbn8rQMyeEr4+w2gMwmVSH+RKUPOWssKGSH8xR
 g3I0HtDf+pOVqAF1ESQo1yR8lSSwWaYbEYQbzMZQFiFPVoTh8ttLFekqd
 cwBEKMGLuFnJm2RtIRisOz9234Gsky182xShNAGF1eHlZ0TrWL4ekWCF9
 E6Vk3t5EQBTfgnQCCKwVvU0MfN9U46UfePM6Cw/m8BANrSjpLJ/4hEt3z
 3Ctf50iJhe/bkTZtmdZrU0elt2bd7oCZtxHYDRlmSmarnd6FXFjc3Jxfq
 7nfN0GbRi5B1hU+4sxjgj72adAOfez4xy1R43LmmKoGMT7D9CF+QYCAnJ A==;
X-CSE-ConnectionGUID: l6thzz+RSj+XeS4GmE1+aA==
X-CSE-MsgGUID: YAL1bRvfQ4KWBEROoXd0ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10003657"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10003657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 00:42:33 -0700
X-CSE-ConnectionGUID: +Pi2LBmsTBqy5TZOOI+3tA==
X-CSE-MsgGUID: mrH+4/r6QhqOx4vG0O2k5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="63857202"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa001.jf.intel.com with ESMTP; 30 Apr 2024 00:42:32 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Date: Tue, 30 Apr 2024 13:26:09 +0530
Message-Id: <20240430075609.2216291-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
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

For xe2_lpm Wa_14020756599 is applied to
all steppings.

V2:
  - Remove engine filter video decode
  - Fix typo GRAPHICS/MEDIA/s - Himal

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 7657aadf217c..76f7a7e3ee61 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -701,6 +701,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 
+	/* Xe2_LPM */
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(MEDIA_VERSION(2000)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
+
 	{}
 };
 
-- 
2.25.1

