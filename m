Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE3C982E4
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 13:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5B710F3A7;
	Fri, 18 Sep 2026 13:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfzda6z3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2D810F384
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789737487; x=1821273487;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0YZzYzqaWx1ReYnsQlleGo0WVvPODgzV5HhupFiWyZc=;
 b=cfzda6z3PmQvtYnPsVcDjdZG3vZJXfxXM1QfvIMip9+cMDmLXxOyTEMg
 o6RxXlQmMfGcJbg3sS6JBYrqEordrRFf3lTAqFjuQcbQkpx+9QJszAuKK
 7ictOeUjiC3lcrRssU0VPdDA3hVbO/DNJ4pyItb3Syc27BK6u7u7UWdLQ
 7j62jHKk7CEfdPrpPdmBquHd16XCvaH2zaW6BWKahKrePn4kstipeczHl
 KT4JVsECCE4mXiSOzUT26gbfbkdKeQMYwmEi9j2vUCtP93VJA7adZOWga
 7uQGwUL5OPluA/xqIopGf9IHmUngKs4RyaFxIhMKOzROMxaAGPZsl9jcb A==;
X-CSE-ConnectionGUID: VTx3491WQPahYHc8HQWvTw==
X-CSE-MsgGUID: fCobQgj/QA2BbB4t8j22qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89378255"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="89378255"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:03 -0700
X-CSE-ConnectionGUID: DqgMT6bhSvWinHmZrb6fmw==
X-CSE-MsgGUID: DogEB49RS3SPMGCrr4emTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270095338"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 06:18:02 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v10 11/20] drm/xe/vsec: Refactor BattleMage PMT defines
Date: Fri, 18 Sep 2026 06:18:02 -0700
Message-ID: <20260918131751.2408883-33-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
References: <20260918131751.2408883-22-michael.j.ruhl@intel.com>
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

Rename generic defines to be BMG specific.
Define several magic numbers.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index ea60e2f3e917..1e1428313bd8 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -90,10 +90,15 @@ static struct intel_vsec_platform_info xe_vsec_info[] = {
 #define GUID_CAP_TYPE		GENMASK(29, 28)
 #define GUID_RECORD_ID		GENMASK(31, 30)
 
-#define PUNIT_TELEMETRY_OFFSET		0x0200
-#define PUNIT_WATCHER_OFFSET		0x14A0
-#define OOBMSM_0_WATCHER_OFFSET		0x18D8
-#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
+#define BMG_IDX_TELEM_PUNIT		0x00
+#define BMG_IDX_TELEM_OOBMSM		0x01
+#define BMG_IDX_CRASHLOG_PUNIT		0x02
+#define BMG_IDX_CRASHLOG_OOBMSM		0x04
+
+#define BMG_PUNIT_TELEMETRY_OFFSET	0x0200
+#define BMG_PUNIT_WATCHER_OFFSET	0x14A0
+#define BMG_OOBMSM_0_WATCHER_OFFSET	0x18D8
+#define BMG_OOBMSM_1_TELEMETRY_OFFSET	0x1000
 
 enum record_id {
 	PUNIT,
@@ -122,29 +127,29 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
 	*offset = 0;
 
 	if (cap_type == CRASHLOG) {
-		*index = record_id == PUNIT ? 2 : 4;
+		*index = record_id == PUNIT ? BMG_IDX_CRASHLOG_PUNIT : BMG_IDX_CRASHLOG_OOBMSM;
 		return 0;
 	}
 
 	switch (record_id) {
 	case PUNIT:
-		*index = 0;
+		*index = BMG_IDX_TELEM_PUNIT;
 		if (cap_type == TELEMETRY)
-			*offset = PUNIT_TELEMETRY_OFFSET;
+			*offset = BMG_PUNIT_TELEMETRY_OFFSET;
 		else
-			*offset = PUNIT_WATCHER_OFFSET;
+			*offset = BMG_PUNIT_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_0:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == WATCHER)
-			*offset = OOBMSM_0_WATCHER_OFFSET;
+			*offset = BMG_OOBMSM_0_WATCHER_OFFSET;
 		break;
 
 	case OOBMSM_1:
-		*index = 1;
+		*index = BMG_IDX_TELEM_OOBMSM;
 		if (cap_type == TELEMETRY)
-			*offset = OOBMSM_1_TELEMETRY_OFFSET;
+			*offset = BMG_OOBMSM_1_TELEMETRY_OFFSET;
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

