Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9402CEFD12
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 21:28:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E1310E3FC;
	Tue,  6 Jan 2026 21:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0DJ9gc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D364F10E3FC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 21:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767734938; x=1799270938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XF8j8pNQn38yTFs1x5RyWtojweuDBA27Lho+irglfhs=;
 b=l0DJ9gc+2b+uP36inuEYnjXMVn/swnj+GxyiyVgRw/biFuC44rFcCxX6
 80qEwNXfmecdJ9apPjtXdbEvbCkOE/2lI6e5hme+7jw90m96AC1K71pbF
 8FSWdUXMV7pec4ToQfZ0NGNXMorcX7ygV1hPrBStfaC2wVSeoqT2UxFWk
 W8yYsUQl/SWpBMvv43jhlFL0opX39QX72T0bVzx6RlMtrh2iS1NmGmKAL
 bvbdyesSlc0r4kAkFjNJomRK5YQkR4J9NzL2fUSSoChfHKaB3+7UEY4Ou
 97FWlzOctgO6k2QcnbONswQxyU1NVg3Y7hsLi2YTDNqj01SY26J1/Uwno A==;
X-CSE-ConnectionGUID: gJ1NYcu/T+6rOJpXTVXzng==
X-CSE-MsgGUID: j+44CtDhSj6dRFc6wi9JGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72737019"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72737019"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:57 -0800
X-CSE-ConnectionGUID: ryygs0GZQOK0lK1X8d4B3w==
X-CSE-MsgGUID: yJBqhwWySKavQmJoffQcLQ==
X-ExtLoop1: 1
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 13:28:57 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH topic/xe-for-CI 4/4] topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI
Date: Tue,  6 Jan 2026 13:27:07 -0800
Message-ID: <20260106212758.1172984-10-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260106212758.1172984-6-julia.filipchuk@intel.com>
References: <20260106212758.1172984-6-julia.filipchuk@intel.com>
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Define GuC firmware, still using the mpp version that is intended to be
merged only to help with the platform enabling in topic/for-xe-CI.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patch.msgid.link/20251021-cri-v1-2-bf11e61d9f49@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 2980d0b99e95..e93f314e9eb2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 55, 4))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
-- 
2.51.0

