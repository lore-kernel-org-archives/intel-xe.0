Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB2CD98F9
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 22:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF5110F405;
	Thu, 18 Jun 2026 22:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3opP4X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8166A10F402
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781821551; x=1813357551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHkmq85nWC1a6Os54xxuj2mzGOVS1ZYj2vqiaMqp20w=;
 b=K3opP4X5u+ro6QizTyy7BX/jREvELWkerlJudJuZv4hMWLc9UHTO36nt
 vY0VE9rn7I4xW5jEShK/xv4RWcaKwb0OxsPlMkb5isjsRiZHxIBCHT5Cn
 XtjVZ/9YOQwyS2hG5b3tTspI9wCZIPDgSu+fO1I8W7HFsv6Jp9NPOqFwW
 HW1O+GpxvzmnkDg4lBgloAFXI46+3Wcplcmxjli7cR8uYXrMLDzxcjCJn
 /EQMQhkHTG5Ha3mvBgYyy4+w05J2fr4+w76NFb5CVeFMVl7QDvpfWWk+b
 Ow52W5zYJoRMZgiYnS4VEOBxOBvjjy6fv+oiJBGyJbY0TYv7DdDqxD194 g==;
X-CSE-ConnectionGUID: nmnFAlYXRsSPQ4lQ+yhM4w==
X-CSE-MsgGUID: z4DrjzkITgqe2oykWsdjVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81785787"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="81785787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:51 -0700
X-CSE-ConnectionGUID: UxrkybSVT5G94UM+pHCjBw==
X-CSE-MsgGUID: Y9/odoFvTlyCgqX3mG0wvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278661334"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 15:25:51 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCHES topic/xe-for-CI 3/6] Revert "topic/xe-for-CI: Define GuC
 firmware for NVL-S"
Date: Thu, 18 Jun 2026 15:25:30 -0700
Message-ID: <20260618222536.3351750-11-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260618222536.3351750-8-julia.filipchuk@intel.com>
References: <20260618222536.3351750-8-julia.filipchuk@intel.com>
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

This reverts commit 4e53a9b93ad2f9bdac73a52fc852c5137468e4ee.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b7f8b8584e2a..498c89452779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

