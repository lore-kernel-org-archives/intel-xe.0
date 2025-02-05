Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E4C02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 19:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D8110E16E;
	Wed,  5 Feb 2025 19:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOK+01uV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B4210E16E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738783018; x=1770319018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuQ6I9XdcmGwsHCy2dZFlmrov0dfqmoRGzj8uB1oeWM=;
 b=hOK+01uVO1NC1vUQZLUUBCYGflY3U1nyMSA+FeAalabw5gPqdia5XXzh
 3g5HpUtnBdyK1QrxZzZ+ozLsqLWlFz6g8HxtlRK28+ecIhtFHBX4na76p
 XoQX7w4FWcqqW7HyyQrmJ855a41pCKFLk/+yfKGurBtbBRGyO+U68UK5J
 Y2S9BoBfuiehtvC0DWvJKS+6iQuqKTTdmfIm/yRv0FI8Icwnxh1VLLemh
 Qyvwuq1pSOGF8Qn+CPiDEaSMfIYuAG+qjpJlxmxJjf+Yph9A/Cokstml9
 TIrGIFoBHxZ6/5PwYfbh3pBZaFUtu7iPD6AQLlG1KzIP6OFwWIVno3nUB Q==;
X-CSE-ConnectionGUID: naIxs0uzQJ2xLsU8xLIesw==
X-CSE-MsgGUID: RJQoMb8BRs2jnE4MjpxumQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61837909"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="61837909"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:16:58 -0800
X-CSE-ConnectionGUID: jywcraQXT/O/cbt1EyKITg==
X-CSE-MsgGUID: 6oOSsvXvQ6ebEkFbxd3JNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; d="scan'208";a="111519943"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.3.119])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 11:16:56 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/2] drm/xe/vf: Return EOPNOTSUPP for
 DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
Date: Wed,  5 Feb 2025 20:16:43 +0100
Message-Id: <20250205191644.2550879-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RING_TIMESTAMP registers are not available for VF (Virtual Function)
drivers. Return -EOPNOTSUPP when the DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
ioctl is invoked on a VF device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 042f87a688e7..ebfae746f861 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -121,6 +121,9 @@ query_engine_cycles(struct xe_device *xe,
 	struct xe_gt *gt;
 	unsigned int fw_ref;
 
+	if (IS_SRIOV_VF(xe))
+		return -EOPNOTSUPP;
+
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-- 
2.31.1

