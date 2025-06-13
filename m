Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A877C71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FF810EA45;
	Fri, 13 Jun 2025 19:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F723xgbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C873810EA45
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749842405; x=1781378405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6IAHT9lzaVsxUXLqwL8cc0dpmklM9tzmYX41M4FhWA=;
 b=F723xgbSYAi3inhI/ftGaDyKOiiK4C6HT8iHsOC3hh0C2EEwikAetkFk
 ryG/Kj0hBo8ImSZFO/N8a1L1lCD98JLLStuet96nGFficoWyt7c7kn2tX
 XGr+XRbacol/WZN9K8lsJd6pntG+M6mxPlYxx6eD3rh8v7HgpyeNKcHtO
 yvtBGlZj/VX1iARUxni+tPXuVuEZsJM0AK+RELkJt7nwfCggAuBsh51bc
 36G6AA0SQLrrLVmrTQWXFI2f14zuAaAzJ5nkXXR0MBDVv0mQJlcaV41kt
 mieS7zerPK+QJ+d83TitN8pNpf2KY7/A9QjOAaFc38H5kRk3fyndP5hMw g==;
X-CSE-ConnectionGUID: OjFcWKzeQ2iHNGtRkmp4gA==
X-CSE-MsgGUID: qtI0Kv6pQ260fgXllGYNew==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69509505"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69509505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:19:56 -0700
X-CSE-ConnectionGUID: E4AMcFB+QA6AltaaFRGjUg==
X-CSE-MsgGUID: 6ViFAJ0LQuqYGv2r/NBvhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151721338"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:19:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/2] drm/xe/tests: Drop unused xe_device_fn typedef
Date: Fri, 13 Jun 2025 21:19:37 +0200
Message-Id: <20250613191938.1980-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250613191938.1980-1-michal.wajdeczko@intel.com>
References: <20250613191938.1980-1-michal.wajdeczko@intel.com>
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

We missed to drop it in commit 50680d1698f4 ("drm/xe/tests: remove
unused leftover xe_call_for_each_device()") so drop it now.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index ede46800aff1..65ac0295d435 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -15,7 +15,6 @@ struct xe_device;
 struct xe_graphics_desc;
 struct xe_media_desc;
 
-typedef int (*xe_device_fn)(struct xe_device *);
 typedef void (*xe_graphics_fn)(const struct xe_graphics_desc *);
 typedef void (*xe_media_fn)(const struct xe_media_desc *);
 
-- 
2.47.1

