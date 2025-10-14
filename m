Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544D5CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1870D10E1A5;
	Tue, 14 Oct 2025 03:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ew8bFAgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D110E1B0
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7A32jcDw3qMn7eaDeZtPBbiiN0FFx0H0L/Ly7B6Dg34=;
 b=ew8bFAgs5kIgFemZpPvDcPl3Za/FNt26vkH+KKMmi/mWz6kBZSK42fvY
 mjTCZ0Mg9nMI6nbUuXSL0CQ0fE/Txa5LoNBNgdrwTCsBdluOzUgsq3fYS
 BY3LhBi6/9pCWTudm864D0LyUn4BhgdOEK4FYZmg4SayunHZsNO/Tpo+t
 F/1V+Y+6/NsUEsnGNbKJLhwOTt98tm9WiCcxK5IlEqChsjMXYB2hX3cYy
 tOeVvsRrTRrvnueF0Ab3eP8xbNlltJs7JEB2oAI9Y2E1c+bFs+lI9voZz
 viiz2LOQojqZLHCZxEZEmDHw+TeebzuAynualwETwCTK1D3O4lc2EYEz4 w==;
X-CSE-ConnectionGUID: oGTsIcW0Sze42wFKq7ltWg==
X-CSE-MsgGUID: cfPk1NZZQeCSTvmIr3WaZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414871"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: DVtmV087Tu+OPOb7+5lR7g==
X-CSE-MsgGUID: imi1RfahQGqyame86dP2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567280"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 06/23] drm/xe/xe3p_lpm: Skip disabling NOA on unsupported IPs
Date: Mon, 13 Oct 2025 20:24:38 -0700
Message-ID: <20251013-xe3p-v1-6-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

IP version 35 has removed "NOA Enable Signal" bit from RPM_CONFIG1
register. Skip clearing that bit on unsupported IPs.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index a4894eb0d7f3f..f901ba52b4032 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -837,7 +837,8 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_oa_configure_oa_context(stream, false);
 
 	/* Make sure we disable noa to save power. */
-	xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
+	if (GT_VER(stream->gt) < 35)
+		xe_mmio_rmw32(mmio, RPM_CONFIG1, GT_NOA_ENABLE, 0);
 
 	sqcnt1 = SQCNT1_PMON_ENABLE |
 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);

-- 
2.51.0

