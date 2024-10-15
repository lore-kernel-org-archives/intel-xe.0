Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87720D1D887
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C0810E5B6;
	Tue, 15 Oct 2024 16:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccR4rVVd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4B10E5B6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729009196; x=1760545196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9qidBfhV/Gwgvn6tK8TM+nv72G3NfshpASDg0KbshKM=;
 b=ccR4rVVdLkLsUBVM8rdjJEgV3J62YOzcLidEXSJBtVSEIcqVGFKh8URk
 tioLEHQ9T0TLVTupPCLxU5cmY5VtMWRAZopYogOltZAUhOiC8klcumcBz
 rnkF12AYfiIZr8/vSpLrVc5EdDmrD/jR0jkuH/m7qORyikBhA7fRpibSu
 NICqcNgi3sBmkkRHdIxT/HyuYpTu574+fZcbIfPeGYu5V3yi7M3xHep5F
 Vcn2Tv/VrYMHs4ZWO/WgSoXSMCYEEtkQPJ/JtV03hJJL8xH8WQnpCcOaa
 YdmV1UJ3zwLxkm1YaM36DLh1QqUoyqEz1AOb6DVKEmvZo75oxpkqLMEpZ g==;
X-CSE-ConnectionGUID: Bc0bhmKLRRyKdHaBGCaIjQ==
X-CSE-MsgGUID: HTo1tZ/SRbGHkB2yRGnyxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="53824310"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="53824310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:19:44 -0700
X-CSE-ConnectionGUID: SFXJFQAjT2+RTtlP2yt/eQ==
X-CSE-MsgGUID: wpC+vK3hSNqBmGcOLMeHeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78776469"
Received: from shekharc-desk.iind.intel.com ([10.190.239.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:19:43 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com
Subject: [PATCH] drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
Date: Tue, 15 Oct 2024 21:49:38 +0530
Message-Id: <20241015161938.845996-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Extend Wa_18034896535 to Xe3_LPG (IP 30.00), steppings A0 to B0.

BSpec: 56852
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 0c90438e8e72..02cf647f86d8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -602,6 +602,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 
 	{}
 };
-- 
2.34.1

