Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48277CA0FEF
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 13:21:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172B810E6A7;
	Fri, 30 Aug 2024 13:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFsua+WA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BE310E6A4
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725024073; x=1756560073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o5X2C8Tca15FCjpr8peW648PC7HjeTj+1Jz9I7FIQd0=;
 b=PFsua+WAYMJkCIcGm6T/lLgKTrY8CQbeFWqzaPin4zjktjIU512axEpG
 uzqKqxVngPVUbEqvqzcvzsDeYbHsjyxio+VZGKqFdpC73hx/WpqhuegSF
 lE8GJACmAAZFmNUZUV6dqkKISq85f1ULHki8SnjPUTAiA2jYGW+xStP8O
 2NGoAB2KHkBmGUZ+6bSlibbw2U2tJNEt0wrzIwA6MftIV8enbHLv0k0AN
 D86JVuEYzRLT/yGnWyZFxV1vC9JlEpdbzK+VJPubAwG3DjSdnjDMvqZ87
 NhWE+xRyAJt/HYmgLegZ+3kbjCpjJ+WXb4sN66bBZjrlvMKExj1sdRGJV A==;
X-CSE-ConnectionGUID: t9s/trINR6WVRjn1KIXVoA==
X-CSE-MsgGUID: OGpgvmvRQ6OuLucDwytyWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41144576"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="41144576"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:13 -0700
X-CSE-ConnectionGUID: Af7VuPckST2ISV2rvQU4Xw==
X-CSE-MsgGUID: avxzZpYjReCeHRgHkAt5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63724351"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:11 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Add thresholds to the VF KLV config
Date: Fri, 30 Aug 2024 15:20:59 +0200
Message-Id: <20240830132100.1704-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240830132100.1704-1-michal.wajdeczko@intel.com>
References: <20240830132100.1704-1-michal.wajdeczko@intel.com>
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

We are pushing threshold KLV to the GuC immediately during the
threshold provisioning, but those configs will be lost during a
GT reset.  Include threshold KLVs while encoding full VF config
buffer to make sure the GuC receives all of the config KLVs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 497af3949b19..151eb69ab4ae 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -277,6 +277,14 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config)
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
 	cfg[n++] = config->preempt_timeout;
 
+#define encode_threshold_config(TAG, ...) ({					\
+	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
+	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
+});
+
+	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
+#undef encode_threshold_config
+
 	return n;
 }
 
-- 
2.43.0

