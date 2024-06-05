Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F8CC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 09:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B6010E023;
	Wed,  5 Jun 2024 09:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IruE7oVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3019610E72E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717580046; x=1749116046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnf5xgtUan3xH/8OBQxuuy34xAIp1wQI+zoJGZb7vZA=;
 b=IruE7oVzFHf17hHZUHXXE/Nl2QGCPUD2p4XP0vq3K1kum5cGBCoZNe4F
 dQvUppkWTiu7O48o8QkBp63+8ZArkfuKqDtN68CUJKeeC5qDD4HbBUm99
 noMyG8GbDk6IXjPnQtGr63NjZETLDPwAKRXb/wVIze5WbgpXQMCKWbm97
 lZDGqrwTDyX+KiVnGWUhedoHDVmHsPajuV2FgQwHU/LUIMgQhWO/VO0gE
 QVP2VJCBl12enH3EXtq3KH1ADnKZrGAy5j9LAcJyyBPZ4eNigXKFcQPN9
 LelOYQYpwxi0WHmr0XPVDlw0ygfa+7zzpf8O898QGfgGPdbyg6RfCbFzD g==;
X-CSE-ConnectionGUID: T8bFON4/SCSpgCp6rhJLjQ==
X-CSE-MsgGUID: +3RcH6Z1SoiwzoBzOMSyXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14289356"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="14289356"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 02:34:06 -0700
X-CSE-ConnectionGUID: JWPPiJUYTii/QHgTwtnzVA==
X-CSE-MsgGUID: t3bW/SsaQPOB3h90kGSf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37525711"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2024 02:34:04 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v3 3/3] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Date: Wed,  5 Jun 2024 15:20:05 +0530
Message-Id: <20240605095005.1261268-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
References: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_assert_held is designed to trigger an assertion if the
provided domain is not awake, which works correctly for individual
domains. However, the assertion condition becomes incorrect for
XE_FORCEWAKE_ALL.

For instance, if we assume all domains are in sleep mode, invoking
xe_force_wake_get(fw, XE_FORCEWAKE_GT) will only awaken the "gt" domain.
Subsequently, another function needs that all domains are awake and
utilizes xe_force_wake_assert_held(fw, XE_FORCEWAKE_ALL).
In this scenario, the condition will inaccurately return success because
fw->awake_domains (0x1) & XE_FORCEWAKE_ALL (0xFF) will still be 0x1 and
Ideally it should have asserted.

Make sure that the assertion condition covers the wakefulness of all
initialized domains for XE_FORCEWAKE_ALL.

v2:
- %s/supported/initialized/
- update commit message (Rodrigo)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 83cb157da7cc..a9b01d7ede44 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -32,7 +32,12 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	xe_gt_assert(fw->gt, fw->awake_domains & domain);
+	enum xe_force_wake_domains is_awake;
+
+	is_awake = (domain == XE_FORCEWAKE_ALL) ?
+		    fw->initialized_domains : domain;
+
+	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
 }
 
 #endif
-- 
2.25.1

