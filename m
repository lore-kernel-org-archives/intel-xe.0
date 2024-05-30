Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C62C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 14:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF6210E1D4;
	Thu, 30 May 2024 14:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bib9PyJa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6610E1D4
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717078181; x=1748614181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WRionAYGqYlGghnDLPBZPZ9ie7mZ9gcm/smZXU2UdbY=;
 b=Bib9PyJaFGbg7E4g0EvtnaJRbN192osNok/IdJiIUvV0JTiOIJy2Rpa6
 xEVpy0NVUaP3qj+TfUtQuU6ttyxxEi9/yar9uVP5V2JAdw69zk6UnComf
 pVDy62yI7/f09rGJ26G07Re48vnNvJKbYCTOubpvGOVOImXr8bv7AaUha
 jO0Do7c/Po3m9k//chryH1KCKq/yAWVnkqui0mDg+vQkAQSPhZkEiAy+Q
 RjBqcrcVthobhHsU9DmDUqbPeTQcVLiSSWYr1FHTv7twoBzOIDgnsWKig
 xsQUiPzOtL63HEU0bIyfxOYvsCGLt4oQEUjmXzzn2FRgGIoP0SwkoN0LU A==;
X-CSE-ConnectionGUID: R685QIoATzCt7ApJo/AkNw==
X-CSE-MsgGUID: 8IFuuhqaTD6fiC4siO4ecg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13327269"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="13327269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 07:09:39 -0700
X-CSE-ConnectionGUID: FAhRubBnTNqtW7HV0ACBBA==
X-CSE-MsgGUID: 1h80baZTT7+33jamMXuvnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="35767106"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2024 07:09:38 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Date: Thu, 30 May 2024 19:55:33 +0530
Message-Id: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Make sure that the assertion condition covers the wakefulness of all
domains for XE_FORCEWAKE_ALL.

Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of XE_WARN_ON macro")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..9008928b187f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,7 +32,7 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, fw->awake_domains & domain);
+	xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
 }
 
 #endif
-- 
2.25.1

