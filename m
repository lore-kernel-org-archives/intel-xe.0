Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2ACC3065C
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 10:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196CB10E394;
	Mon,  1 Jul 2024 10:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2z4g+cs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78C110E38E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719829670; x=1751365670;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UrUOiKpz6ELICQzkiLDUhksgTkCx2dQlmM7gGY5sgls=;
 b=m2z4g+csloAxXUEqSkpex+8b+upnDxSrqMQwHHXxh4OAh99t48NYt6HT
 KDrLU/frw0zwspzTJYxvoZooINR1+PryfgzGJFbsoS2ES90hDPybwzE94
 aya4E5AZQVYhS/LcjxN8lSottGlJdahExHjSQj3mdGZ8wXiKvvLXPK4vx
 SGa+M03aRfjfIozAervCLvuMhAdliYF3IHKtZlTa7bk3S6IwJXtA5+is6
 yMQ/K/7oXc1+iH1q6oTu7p34rP/ls0vrxAMmFm6JOwLAJDvVyPSpGtGGn
 g5S2KkNZlljzPNZEy/a2zZKYwVxWS7CtNLfhqOQuk8dMPShJ9tESzA4De Q==;
X-CSE-ConnectionGUID: iTN1gmjqStKmqoAaLXqmgg==
X-CSE-MsgGUID: sUVFnCAvSri8LEPMl22EpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28341418"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28341418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:50 -0700
X-CSE-ConnectionGUID: V4M+uV7mT8aMG8W0Z9bBWg==
X-CSE-MsgGUID: kQX3DeSZR0WdtQWg4IVxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76665651"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] HAX: Try SR-IOV on ADLP/ATSM
Date: Mon,  1 Jul 2024 12:27:38 +0200
Message-Id: <20240701102738.934-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240701102738.934-1-michal.wajdeczko@intel.com>
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
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

This is for CI only. DO NOT REVIEW. DO NOT MERGE.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 3 +++
 drivers/gpu/drm/xe/xe_pci.c    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 893858a2eea0..66d1089f6021 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -18,6 +18,9 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+#ifdef CONFIG_PCI_IOV
+	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
+#endif
 	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4b91a9878f41..cdc2f630194b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -261,6 +261,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -307,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
 
 	DG2_FEATURES,
 	.has_display = false,
+	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
 };
 
 static const struct xe_device_desc dg2_desc = {
-- 
2.43.0

