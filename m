Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ECDC4450E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 18:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687A388867;
	Tue, 14 Jul 2026 18:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThH93gwc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3210E2A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 18:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784053758; x=1815589758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jeZ410ebSS70MqHY/+CjtJzApdjzbfxxej5tE5I8U/4=;
 b=ThH93gwcJGI7dzDo2WkTEZWK+J8x3XVoUjppOVrLsBaFRo8ddLi5/jHK
 kuVANuAspDZEPXbPqC3VnxkjIoM6gtfJJytNZ/b9MYnBhoP3JzR/1UcwT
 fh63G+s5fmfP7jxZGB+iXQr1YPQ1Dv7wfatixbjENQ2EPdnXrsBbSMeGi
 xKv1tfFBqf2g/UirBvn8GlcfCCPnLdfAM3eYY80UQkTrgMSYopLzISbM5
 /+LlrHFK9NrdxOTH3VGmKWI+eVMSDLoh2lTN3nudKzrQHANit0AKcnjXu
 bQCFZHBe7YuumfXqciNQy/wdjcXm6dLCqVGpIjTsxBgUcBfctLIvQAPc4 Q==;
X-CSE-ConnectionGUID: e0vl+0dNRPmy8kE5SDL5AA==
X-CSE-MsgGUID: cTfuIlviT1Kp0frE6cWN8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84880810"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84880810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:17 -0700
X-CSE-ConnectionGUID: mjD4egyZSJ2YW/a2LDwuug==
X-CSE-MsgGUID: UWStIVW4QOeTLn8Vzx7afg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260838244"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 11:29:17 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 2/5] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Tue, 14 Jul 2026 11:28:40 -0700
Message-ID: <20260714182904.620871-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260714182904.620871-7-julia.filipchuk@intel.com>
References: <20260714182904.620871-7-julia.filipchuk@intel.com>
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

This reverts commit 1f4aa742267490213e83d894fc9021365201b96e.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f7d3af6b57bb..65f0136859d7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 70, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	major_ver(xe,	guc,	nvl,	70, 71, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

