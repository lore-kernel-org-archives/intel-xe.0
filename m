Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313FEC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FF210E115;
	Thu,  1 Aug 2024 22:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4PB36Bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6F310E120
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 22:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722552169; x=1754088169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6dNUAMqeun06k8tTgFxNboAbPWJh0aeZTPZwr5Lv1l4=;
 b=H4PB36BgoOZifBeSIWGGXhLllwyWuqrt3x/d7hY8800o8b3YdfgBaUTZ
 TlNDp38mBHjS+keVqpAJ3iXqrEmSxkHpWAL7uSZcreoiPU1qwrsU4BZUc
 xnm8oaaCCTTr3Q3qbM07iDkoxekl0O3cL4j4aMN/lVXF5Uw2RxcDgK+QM
 o6oSVIivjcdkHzv4vJpVo+GdV7b8Mad+s2ji172gPO6/RglvqbLLLcGF7
 ElEpZz1GpdMD3uQbTV3lKD++a4HpQjSJSrZx7i9zbHQKg+ICDQCpxJod6
 4mH/kg56rY5CwueG1lK7REUvzQkdSyW3/62g6C3ABUAW1xf7bhT2pqzAp w==;
X-CSE-ConnectionGUID: qZKEvS5GSeO8hBooksPynA==
X-CSE-MsgGUID: uSFwstWqSjWqUZxSUj0IjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38008321"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="38008321"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
X-CSE-ConnectionGUID: GioRQaJaQa2/2+7fEoS8JA==
X-CSE-MsgGUID: CzwKXJrxTbeXfgtETHvtIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55116249"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:42:48 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3 3/4] drm/xe/guc: Release GuC v70.29.2 for BMG
Date: Thu,  1 Aug 2024 15:42:39 -0700
Message-ID: <20240801224241.3050352-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801224241.3050352-1-julia.filipchuk@intel.com>
References: <20240801224241.3050352-1-julia.filipchuk@intel.com>
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

