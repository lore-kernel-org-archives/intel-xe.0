Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FC2CCD196
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCECA10E66C;
	Tue, 14 Oct 2025 16:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIMhSz77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BAE10E203
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwmiX+MuMonqZJG96+eTyEQXzhqInq7NdQimIfhWZB0=;
 b=WIMhSz7775YbpnidMRYqJU5NeYZznIo11K8JW2LnYcuYZjsQyHJZlqM1
 P88w2XK5d0t5PB0ShWdGF2jMAbn7H2DRCI6JJTmWi6FKOi6rA49vYbCCO
 cV6aNpy1FnuiJ6FyWPlCGs3pTDE1JL96xA///cl8zLc0yKRD6vA/UHYwr
 P7wfw5XIao9X2y3op4VgzTqXM3vPKZJaDsG6/pCRO2ssYABALHr/oMIUP
 cj35BHkPgHLYMfAPJT5UfGFeG/zpSJdByq6oheNxiqgPKwSelqIfGXUvj
 SGCh367xdf8xDnFilZTS6tO3griCcYr4dgBT0kCwkwpULdWFYjUsgAaPZ g==;
X-CSE-ConnectionGUID: OcypH0j0Q86TGfo0FSZz7Q==
X-CSE-MsgGUID: l4zS1NKNRNOpmEMhvZu91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063046"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:02 -0700
X-CSE-ConnectionGUID: HDMSoktzSYm1rM7Q+mLLcw==
X-CSE-MsgGUID: t/oaoRoPR/iP2bKbYwU49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184690"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 4/7] drm/xe: Guard against NULL GT in xe_sriov_vf.c
Date: Tue, 14 Oct 2025 16:48:03 +0000
Message-ID: <20251014164758.125598-13-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_lookup_gt is theoretically able to return NULL in some cases,
but several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

Use xe_device_get_gt in places where this is a relevant issue.

v2:
 - Use xe_assert in vf_post_migration_recovery (Michal)
v3:
 - Rebase
 - Use xe_device_get_gt

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 189b307901a3..911d5720917b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -166,7 +166,7 @@ static void vf_migration_init_early(struct xe_device *xe)
 	if (!IS_DGFX(xe)) {
 		struct xe_uc_fw_version guc_version;
 
-		xe_gt_sriov_vf_guc_versions(xe_device_lookup_gt(xe, 0), NULL, &guc_version);
+		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
 		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
 			return vf_disable_migration(xe,
 						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
-- 
2.43.0

