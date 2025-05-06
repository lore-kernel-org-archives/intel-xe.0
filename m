Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C5BC3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 10:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EABC10E65C;
	Tue,  6 May 2025 10:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZtgYnunb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10F10E645;
 Tue,  6 May 2025 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746529056; x=1778065056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pIaOdq+OVhBWkEzXuLYCafGn4uid2wfbIH6geaCmINE=;
 b=ZtgYnunbp2a3ZmloCc5njXVwUJnD5yANNa6M3UM6nAg8zcw2JhoZ1aOx
 ik5cfONc/+KHTEp+wGr26milYe0ww8kfC9A2VEi24OHMRGBVZQJfvHMWS
 jZdI9lUxF5phQYYf0atFBuktfRE1VhDYwk0rMx15g8CfbJ5OhTELlaAYY
 C6XZBDdmRbXfTcRTmsZ0DzSEq8Lnapxd+qwaNN1xunLLwEWRW6bXAaqi8
 QuJX5HB+8NSvlPpg0d80Jpz2ymZC8BJPigTnWc3rYellZ+ZvRqPOxlSv7
 z7w4xgSdVODcj5abGbXgDGGHTTjs9+wnTRox4RyU7zCSiY6ayd/+i9AXc w==;
X-CSE-ConnectionGUID: r0F+M9tfRkiW/R+xiKhm/A==
X-CSE-MsgGUID: LLLzKR8vQdasQANIZA9E+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59580314"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="59580314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:57:36 -0700
X-CSE-ConnectionGUID: LJfEPMfhQlCmQF6s4Xgy9g==
X-CSE-MsgGUID: KMw5KUHvS+KApoW5AN11Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="139636366"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.221])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:57:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 3/4] drm/i915/bios: fix a comment referencing struct
 drm_i915_private
Date: Tue,  6 May 2025 13:57:18 +0300
Message-Id: <b7a9a7c64f41cf61749a42ed4102e04b500fde83.1746529001.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1746529001.git.jani.nikula@intel.com>
References: <cover.1746529001.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

struct intel_vbt_data is within struct intel_display nowadays, not
struct drm_i915_private.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
index f9841f0498c6..6cd7a011b8c4 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.h
+++ b/drivers/gpu/drm/i915/display/intel_bios.h
@@ -24,7 +24,7 @@
 /*
  * Please use intel_vbt_defs.h for VBT private data, to hide and abstract away
  * the VBT from the rest of the driver. Add the parsed, clean data to struct
- * intel_vbt_data within struct drm_i915_private.
+ * intel_vbt_data within struct intel_display.
  */
 
 #ifndef _INTEL_BIOS_H_
-- 
2.39.5

