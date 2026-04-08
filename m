Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E73105D9BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 14:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AE810E67F;
	Wed,  8 Apr 2026 14:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtNH9wdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6A710E67E;
 Wed,  8 Apr 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775656915; x=1807192915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9n72ZPtAlLroVh60JdYFKTNf4IlJvp4hM0oPMm0BfbY=;
 b=PtNH9wdFFWRSulqjQRnE/G86D1ebz2OspJwyU38LxEv02YTTWB4u6udW
 uUaJZMdJ5zY8VIbGtwNNHEcfzbH6AMKQxOVqgc7Y+p1qPuGT0pzMEMMDt
 EsH02nXdyYwAfS5GMLWUpF7CAT8y3lcGj4e4efdw4xK+lOrIWIeLz42r9
 RABw90kgaWKMmFH1OsF7ZHnAbF5Ihl4b8z2U6mVEQUGZ8oc8ZzTpbA/cr
 h84NXjgUyakXgDDzolWi++RePHo7G1MNA1jwbBZA2AAZbCWaVajnReEiy
 Nk75rKWEJNfJy1zKGyU06OWAuLjyjkieFuTDcEJH+RVbOpvIRgBH0S3o3 A==;
X-CSE-ConnectionGUID: dgXVCOsZQL2B+6AHGe3gWQ==
X-CSE-MsgGUID: V2Qr8cOCQnaUn4YDLqqGow==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75811598"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="75811598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:30 -0700
X-CSE-ConnectionGUID: VsINA873SfeFbbE3M4Ak1g==
X-CSE-MsgGUID: VudpyyuCTHq7Zd38M/LUWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228726703"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.251])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 7/7] drm/i915/alpm: Dump out ALPM capability DPCD register
Date: Wed,  8 Apr 2026 17:00:59 +0300
Message-ID: <20260408140059.252067-8-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408140059.252067-1-jouni.hogander@intel.com>
References: <20260408140059.252067-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add dumping out ALPM capability DPCD registers. This helps parsing dmesg
logs and tracing possible ALPM issues.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4955bd8b11d7..6906226d8a9d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4768,6 +4768,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	if (ret < 0)
 		return false;
 
+	drm_dbg_kms(display->drm, "ALPM DPCD: %02x\n", intel_dp->alpm_dpcd);
+
 	/*
 	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks
 	 * for SET_POWER_CAPABLE bit in intel_dp->edp_dpcd[1]
-- 
2.43.0

