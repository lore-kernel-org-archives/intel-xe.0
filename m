Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F0CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9FF10EBD5;
	Tue, 12 May 2026 18:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zza0A3m5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725610EBD5
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610836; x=1810146836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixkmdyJcEN0BVmeW2gPNz/BMVtrcPm5l9sbUdTN+6/w=;
 b=Zza0A3m5qGV+B1NCSK1T2YKsDj81XkJ7GqT6zmuXqxfK9k3cDy2jIveb
 /4PIKpSOk/ZWJuVPctQhToGEETbEPdXm3TzOuYFwVd9NAa2Kq1C0VXMVP
 NerSEDP1ArQQe+JZCiiRkZz3Urr99xULPKvJQVbGYIZp1a4/Ps43F0n/v
 vh9zVw/Ld6xpA4jmi8j5nBphlcG+JtrR9haFzsQdA2UE/SGC6aQ7V64Ng
 v8H/QfJt6CPQqfHtGFhJO4nHfCiSrr3ZN2sJ1TrJMLG2K1XTkkW2EVF4U
 0zXyYI+7vHzEwWvxuBcGPVbZifD3/67v+2Xl/lY0gufV7DC/bL096yJcs A==;
X-CSE-ConnectionGUID: 1skTNqucSKGdI8BDjYiv+w==
X-CSE-MsgGUID: XK85dPMHRROOJQiQTDp+uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425713"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:55 -0700
X-CSE-ConnectionGUID: DjDznaCRQiW543QNgSRdQw==
X-CSE-MsgGUID: CFRSQGXvQk+1acZ5UUX3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791084"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/7] drm/xe/display: Drop xe_display_driver_remove() stub
Date: Tue, 12 May 2026 20:33:37 +0200
Message-ID: <20260512183342.3374-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

The function was removed by commit d41d048043c4 ("drm/xe/display:
Drop xe_display_driver_remove()") but we missed to remove its stub.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
index 76db95c25f7e..fb1db84db966 100644
--- a/drivers/gpu/drm/xe/display/xe_display.h
+++ b/drivers/gpu/drm/xe/display/xe_display.h
@@ -42,7 +42,6 @@ void xe_display_pm_runtime_resume(struct xe_device *xe);
 
 static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
 static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
-static inline void xe_display_driver_remove(struct xe_device *xe) {}
 
 static inline int xe_display_probe(struct xe_device *xe) { return 0; }
 
-- 
2.47.1

