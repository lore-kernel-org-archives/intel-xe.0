Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7D3E7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE69810E2AB;
	Tue,  3 Oct 2023 14:35:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E2110E2AB
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343737; x=1727879737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpBiHN1RyQZ2apUXQwZXLMP7hgV80mcLmFP/vCSA/CU=;
 b=ldSvX2tUZWmc/tplqG0DfNf1YHY/VdFMB3QNPB2X8JxKKRQW58iAHL9Q
 zmSSdZuvwHpYY7GPUdPU4X2xsa8cKfjIuZocWWGJgGQpsbQfwoktFOCPd
 MKxiPG4lPeuTKf6Ky/Ry/blEz1D+OPECZTX3qCox2f9doNzRDhXJz2Kqt
 rudnO2V3eHm+Cq5qqqS5YlWqnpxfUb2JRsq6bNUpoGYKQYsVvNjnPjIb3
 tsG4ocR8chwkLafv+tQ+xi4ZRSL+dJF6x9C1t1Tlv0BtBrO9ifrUbxuaE
 EeYEQT3WsIiVtNSyBbvAgIlgVIHjcYVFzR7dx0bPkmK2YQ5X8d/VEKTNS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413799771"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="413799771"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1082041808"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="1082041808"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:53 +0300
Message-Id: <cd5a872a961405fd27aa07d1f4a1169080b4cc3e.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 06/10] fixup! drm/xe/display: Implement display
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

The diag push/pop stuff is unnecessary leftovers.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 82d2c42629ce..391f08c1caca 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -417,10 +417,6 @@ void xe_display_pm_resume(struct xe_device *xe)
 	intel_power_domains_enable(xe);
 }
 
-/* Display info initialization */
-__diag_push();
-__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
-
 void xe_display_probe(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
@@ -435,4 +431,3 @@ void xe_display_probe(struct xe_device *xe)
 	xe->info.enable_display = false;
 	unset_display_features(xe);
 }
-__diag_pop();
-- 
2.39.2

