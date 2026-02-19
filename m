Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B7AE9A053
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB9C10E733;
	Thu, 19 Feb 2026 18:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHAEU+S/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A7610E72F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524424; x=1803060424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5FcJ17P9iYye3aEMUUBS/vcgWA1jvdXZPl9Ol4vIJI=;
 b=LHAEU+S/aHUje6OQmhC/u9dEKhP71pQ5nUp2FsAa0kZiMJjaVcMrEvcp
 hbAYLH5HHMUkNBgFzQr13UeJSaaQIK9CnO+x57Lthc9lXGGVInu09B2Hm
 /VSs3VMdcIFKWLD/DjiejKY2Igqxr8gRs+VPTAS0fV8Un+p8uSlCZnK9e
 ftPS+JTDtgy92sC7YaTmc5kne4Txb9Y3gOy7vUZaXU3LlNkZfXlQYy0hp
 GOR1kXFMeyhx8QmCKk4eVMyevCxFUdpdlZH3WZ/zA06H4x96SRCXJ5SY8
 PG38fKtQKg/xNE1VRQa5HKF6d7iMnG9PYAoaajZNTIVlcICC54c3shyAW w==;
X-CSE-ConnectionGUID: US7jIi8TQ02kBTuXV0E6ng==
X-CSE-MsgGUID: 7yQF8J9mRm+glw21KhXayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482819"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:04 -0800
X-CSE-ConnectionGUID: tnKjiCaKTvaiCBKJOU8Q9g==
X-CSE-MsgGUID: SRiQLzqhSSWyyaTCK6ZNxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189032"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:04 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 5/7] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Date: Thu, 19 Feb 2026 13:06:59 -0500
Message-Id: <20260219180701.2418453-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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

The GuC CT state transition requires moving to the STOP state before
entering the DISABLED state. Update the driver teardown sequence to make
the proper state machine transitions.

Fixes: ee4b32220a6b ("drm/xe/guc: Add devm release action to safely tear down CT")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 8a45573f8812..7e66e9420f5d 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -346,6 +346,7 @@ static void guc_action_disable_ct(void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	xe_guc_ct_stop(ct);
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
 }
 
-- 
2.34.1

