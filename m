Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE6EC77B6E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4CB10E835;
	Wed, 12 Apr 2023 14:20:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F1910E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309255; x=1712845255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eg/OcfQtHl2vsFbg+Jw4ICA3gSJfhtItKOal4c3v0to=;
 b=ngPqvJCQUqUHwvLqqU7lRqyZ5kC7jdYwpgvepNHg79ANCuFCN8lTynTd
 dv1idpmQubBSX68WV2NcS4Tprn64PDutgeZvck/LJbd4pc5IEhY+eaEud
 oNWoYFp/sqQwj1FGtUUdWHJmTd72idlxJ50WzWTp6Amnbo6daBGO0nlaU
 +fjvxdG5LXQXGGUgQXSEQisN+sxq/EqehS85ZVKKwrikgYHY3yzLX7QaP
 iPF7n52v+dHJev9rAllHrAjFEqtwEx4eGvlYsViwA4+FOPhK0H3+Urs6z
 xXex4e7YaT/VzquSkzC6ETLIhs1PSFOL6YVIPjVZtgyWernV8ccNHLubw Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="343915232"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="343915232"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="688955602"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="688955602"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:20:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:31 +0300
Message-Id: <20230412142006.877109-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/41] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

No longer needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index ae25bb02896a..e4974f2e1d67 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -166,7 +166,6 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define HAS_FLAT_CCS(xe) (xe_device_has_flat_ccs(xe))
 #define HAS_4TILE(xe) ((xe)->info.has_4tile)
 #define to_intel_bo(x) gem_to_xe_bo((x))
-#define intel_vgpu_active(x) (x && 0)
 #define mkwrite_device_info(xe) (INTEL_INFO(xe))
 
 #define HAS_TRANSCODER(dev_priv, trans)  ((INTEL_INFO(dev_priv)->display.cpu_transcoder_mask & BIT(trans)) != 0)
-- 
2.39.2

