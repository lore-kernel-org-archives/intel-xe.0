Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5BDCC6B15
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 20:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB85310F9D1;
	Tue, 13 Oct 2026 20:48:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F79F10F9B8;
 Tue, 13 Oct 2026 20:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791924474; x=1823460474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RvmYp1+xZyBRLkGvFeluF1eDTKX1Z9sfSgIU7Dvyaco=;
 b=En6KEPts9EpIJPeSwL6pU9xY7trSBWd2dZfGGRQ3HvaA93BmSZP5EdnK
 kFb8dAHWQfNV0tNbhTAUWPys1sTY+lsFX593c9dlAeF8V7P941c94s5ma
 ZwEUsaeL9SnGP24dNNj0Sdz6cCBgf9Jbp4DnWdfwPkIhyAwmCZgMtxTit
 V8WVVIBDuYh0pwi8nLlNKZunqxcqRha0iFsF1+ZR/ASD/QEc1SY7X9UmG
 WVJ1zcOiRtsJRKyEzwNpA3IuHnR/okXCY7Ozqc0e3+QebpOkFJE1dMbpC
 JpJADLo4u3NsgUzL0qdK7ff0ejCHQ3T6MhoSGLFptGaoLJJaEf2z/2Rq8 g==;
X-CSE-ConnectionGUID: k5ffo8ttSSSMkAAAFPzBlA==
X-CSE-MsgGUID: 3o7K0pA7Ta+nG2a7MdnT2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="539321"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="539321"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:52 -0700
X-CSE-ConnectionGUID: sNV8oPCARLOVf7cVV76nZA==
X-CSE-MsgGUID: EPhLndF8SyuldGvrieIfPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1189058"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 13:47:52 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v4 5/5] drm/i915/display: log eDP TC support and DBuf overlap
 detection state
Date: Tue, 13 Oct 2026 22:47:04 +0200
Message-ID: <20261013204705.1574475-6-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
References: <20261013204705.1574475-1-michal.grzelak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

edp_tc_support and dbuf_overlap_detection are only fields of display's
runtime info which state is not logged. Show it along other fields.

While at it, move dbuf_overlap_detection to have display runtime info's
fields in alphabetical order.

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 3 +++
 drivers/gpu/drm/i915/display/intel_display_device.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index d4e52e627b34..c806e2135620 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -2005,6 +2005,9 @@ void intel_display_device_info_print(const struct intel_display_device_info *inf
 	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
 #undef PRINT_FLAG
 
+	drm_printf(p, "edp_typec_support: %s\n", str_yes_no(runtime->edp_typec_support));
+	drm_printf(p, "has_dbuf_overlap_detection: %s\n", str_yes_no(runtime->has_dbuf_overlap_detection));
+
 	drm_printf(p, "has_3dlut: %s\n", str_yes_no(runtime->has_3dlut));
 	drm_printf(p, "has_hdcp: %s\n", str_yes_no(runtime->has_hdcp));
 	drm_printf(p, "has_dmc: %s\n", str_yes_no(runtime->has_dmc));
diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 5300c6ab99e7..230eec31f654 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -307,10 +307,10 @@ struct intel_display_runtime_info {
 
 	bool has_3dlut;
 	bool has_hdcp;
+	bool has_dbuf_overlap_detection;
 	bool has_dmc;
 	bool has_dsc;
 	bool edp_typec_support;
-	bool has_dbuf_overlap_detection;
 };
 
 struct intel_display_device_info {
-- 
2.45.2

