Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBECC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3083010F2A6;
	Fri, 26 Apr 2024 09:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFBJKuBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B202410F282
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714124175; x=1745660175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mTqYxMk9gPb2J2y+pWQwE+3lMfSBhpzkRG1tmrPixRM=;
 b=iFBJKuBe5fZWO2fh4UhObHSVzpMN/w7nx7KyD9WN2/dr3u5p3xS+wsvO
 Rl2yHlGmICFiroY4Jzb6O2wfXL0iLY1R/K0oBrcMAXigeih/+/2F7ummC
 F+gIJumaDrFn2GnsVEQWMf0Da3wprcDJ6NmU/bKo/nF98oMjinKSgfHOx
 v/nnZW7RfVrxt6l4h3Dm3ELjGa+4END+hc2vtmj0u130ubXrDk6Gi5reM
 TbqpAw2UPwHulQzrNSGk/Dwb6WY5oa/YZJCd+L4VrTZIRUXqBgawz5kny
 59kEgp2a3i5jf48Rn1lEdc87g/LOI8+6+rMgPDmPJ07ZGjDoTu2vHR6iO Q==;
X-CSE-ConnectionGUID: 1thxi0BNTRCL1ScUUBJBWg==
X-CSE-MsgGUID: DCf8Tp8URS6o3I7k5As5pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13686908"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="13686908"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:36:15 -0700
X-CSE-ConnectionGUID: 8pUOm0u5Q3qkPwGXjJLRLw==
X-CSE-MsgGUID: R7iGQJm6Qw+JPU39qGAYHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="29830348"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2024 02:36:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 1/2] drm/xe/xe2lpg: Add permanent wa_14020756599
Date: Fri, 26 Apr 2024 15:19:46 +0530
Message-Id: <20240426094947.2039436-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
References: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
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

For xe2_lpg render Wa_14020756599 is applied to
all steppings.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9d9b7fa7a8f0..c75946e70d84 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -678,6 +678,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+	{ XE_RTP_NAME("14020756599"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),
-- 
2.25.1

