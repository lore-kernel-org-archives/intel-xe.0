Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D8BEE3681
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 13:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96610E734;
	Thu, 12 Feb 2026 13:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCnDOkBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD7C10E734
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770901933; x=1802437933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YtsafBLkRn3mj/ObZC/9Isgtk6AigoaDAVefXm3MmgM=;
 b=dCnDOkBNv7J37N9/HIvmwk/BoxKRZDWiHwcw076UeCBmWRbC6wtb1bfv
 g83gHIrID4jl7kyFGyTK+TwUkRISEmNmM40jPZzsLL9qgr70yZX8bUpd1
 XjdnvFdp7z+PeZ1VQFoqOOcMk+7ko4/BJx4IWOD2FQ3awhZgUWIpas8lI
 SYD+wD2LPDjj+4rtGVY0DAfrJ+MmzbB9ykMSuwKnn5hA6IF9XQ930DH7p
 F0P3eXCK0F0U6cKrpoUuUFHIo1o2Id37skiSpedz8HzaXGJ6U9bWODyfb
 Jwx8qWOLGQsDxuUMozExY+fgEDPSdDQkn5Z/CwFndRBaESxRBDCZct9Vu A==;
X-CSE-ConnectionGUID: 8DA5I++4Qauxhbyx77yBzg==
X-CSE-MsgGUID: nlm00KEaT4OaMVoZBXPzvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="82799035"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="82799035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:12:12 -0800
X-CSE-ConnectionGUID: bxIB39AAR+WyNbiGazauYw==
X-CSE-MsgGUID: TcF5y3icTvS/VA1BUHrXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211853860"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.123])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 05:12:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH] drm/xe: remove unnecessary struct dram_info forward
 declaration
Date: Thu, 12 Feb 2026 15:12:06 +0200
Message-ID: <20260212131206.1804113-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There's no longer any need for the struct dram_info forward
declaration. Remove it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 059f026e80d5..8f3ef836541e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -33,7 +33,6 @@
 #define TEST_VM_OPS_ERROR
 #endif
 
-struct dram_info;
 struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
-- 
2.47.3

