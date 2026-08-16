Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8535C5B572
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 22:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F14410E34B;
	Sun, 16 Aug 2026 22:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0MDhII5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668B010E372;
 Sun, 16 Aug 2026 22:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786920032; x=1818456032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lipTT023S38QMFNib2/zu1vJIKZndJscP5mAVRIv+Jk=;
 b=B0MDhII593wtNEVWs3vx5oOgNwQCV7WzW90WLhnfiKGQ24x5GUrXnycn
 OQ+8JBPome9O6HQ04XZrCKN32g3tHKNjzTWYh19XK7pdQ5LMSgvtSJFtO
 ZD2I9EI5vwBTIOdDaQbcsQKSwtcMwi7WG2AITNlHwEw1uPRFao68KpSBM
 NK3zGEhAMpzd6ZmlGqpnSnSIJF3B5O4xsHRfKkvt9MqD67uAQ889CdVsD
 3kxc4hyZ25oPN63OIKbOA1wfdFYUKETn5jzfgG2TFIojXK4JRw4YZ99GU
 Jh0nDA+X7cIlcHsN2eANxOKRLuts1k+oxqV3aDjsgQB+kGEjpN4shMwMZ Q==;
X-CSE-ConnectionGUID: J62u31skRma+eciEq7rfjQ==
X-CSE-MsgGUID: MhNt4cD+QFeMBtHObS7JHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98761684"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="98761684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:31 -0700
X-CSE-ConnectionGUID: NwByWW++SL2/6jsuqKsF7Q==
X-CSE-MsgGUID: ctgnDxvWSaWDgmv3+GAmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; d="scan'208";a="269948362"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.249.236])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 15:40:29 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	imre.deak@intel.com
Subject: [RFC PATCH 3/5] drm/i915/xe: plug the pme_capability query for xe
Date: Mon, 17 Aug 2026 01:40:02 +0300
Message-ID: <20260816224005.886035-4-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816224005.886035-1-vinod.govindapillai@intel.com>
References: <20260816224005.886035-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Plug the xe's pme_capability query into the parent interface

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_display_rpm.c b/drivers/gpu/drm/xe/display/xe_display_rpm.c
index 548b503aa024..3ef6559eaa17 100644
--- a/drivers/gpu/drm/xe/display/xe_display_rpm.c
+++ b/drivers/gpu/drm/xe/display/xe_display_rpm.c
@@ -60,6 +60,11 @@ static void xe_display_rpm_assert_unblock(const struct drm_device *drm)
 	/* FIXME */
 }
 
+static bool xe_display_rpm_pme_capable(const struct drm_device *drm)
+{
+	return xe_pm_pme_supported(to_xe_device(drm));
+}
+
 const struct intel_display_rpm_interface xe_display_rpm_interface = {
 	.get = xe_display_rpm_get,
 	.get_raw = xe_display_rpm_get,
@@ -69,6 +74,7 @@ const struct intel_display_rpm_interface xe_display_rpm_interface = {
 	.put_raw = xe_display_rpm_put,
 	.put_unchecked = xe_display_rpm_put_unchecked,
 	.suspended = xe_display_rpm_suspended,
+	.pme_capable = xe_display_rpm_pme_capable,
 	.assert_held = xe_display_rpm_assert_held,
 	.assert_block = xe_display_rpm_assert_block,
 	.assert_unblock = xe_display_rpm_assert_unblock
-- 
2.43.0

