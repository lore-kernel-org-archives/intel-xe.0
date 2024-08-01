Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADABCC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D3C10E0D6;
	Thu,  1 Aug 2024 22:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3pQjsf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705E810E0D6
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722550184; x=1754086184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dNUAMqeun06k8tTgFxNboAbPWJh0aeZTPZwr5Lv1l4=;
 b=M3pQjsf8SwvP4/V3BnKDZeVH9TKIsrp9SZU3efDeyN4WLo5a8drU7CAx
 OFb33Vh5qEeEVue01vbx4VjILXWJgTusHQkW+fg2JQdjID8TZ4AP9Y9VS
 UkcqPDQz6toa+qD3isrFMXjbZSgn1F1VyA8Jw1UB5lrutNvdRFJjlJmUf
 Yh/iDipwPQo4fSNQStwOlEDzaWiwqBkGCXZIcilD94XtuOGg9bK+uybsq
 XSXyNWmWEBPdli5DZ0fNYMc0LPpt/DPBq1YLupfu/qHwghV+CYETklcox
 thhaHf/QAuGjqJ78U/nBS+1a7vI5hM+bd9rAC0LiViOn8LZ5gvQhCdhOM A==;
X-CSE-ConnectionGUID: 025+NcdAStyLw8eQxJOM0g==
X-CSE-MsgGUID: TEKXLa7eSkuUTB642u8HUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31943326"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="31943326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:44 -0700
X-CSE-ConnectionGUID: ayUTs54KTZm8SnrFrf/jZg==
X-CSE-MsgGUID: G8mnyEi6TmO+sQ9kpLBvuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="54860503"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:09:45 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/4] drm/xe/guc: Release GuC v70.29.2 for BMG
Date: Thu,  1 Aug 2024 15:09:33 -0700
Message-ID: <20240801220934.3048796-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801220934.3048796-1-julia.filipchuk@intel.com>
References: <20240801220934.3048796-1-julia.filipchuk@intel.com>
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

UAPI version 1.13.4

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index fe1b97d3d2a0..05a3c5b80b5b 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -106,6 +106,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-- 
2.45.2

