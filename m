Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DB4C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 18:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39D310E360;
	Wed,  9 Jul 2025 18:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAshQHdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED19110E359
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 18:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752086721; x=1783622721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kD5mgGIPmPJ8qpg3mtyR0yk79hq+3D/LEi3YQATcGlA=;
 b=nAshQHdFrs/Ygn+nW9ZVDz2SZrdoaxb3Uc7Gyz/Ijq3EPNb9ljw7Wscv
 H6B8XvAcwD8FD+Fyz9xjDPD8PQBa0HJI6I9Zss3JTvbY/FITEwHpXtPT4
 n3mgw5RGQCYn0aGOoekuQirJkTtrblCdcKb5WaEvwG7ecy42J7N6m5w1s
 x1vC9GH4aqd8FKgxs1/l/Am2p6Ce+azxV3PcRd0axzXe6AycJhWiWcQAK
 fR1Awo+d9DariXqyIXsizF6FMrp9hLGBWDs+QtLNfeGq1PNbcrjIxA9nM
 4jEIR+9Y294eWxVaDAeIunh06iljGJk1wSb65spdKGp4/myzUc4aQLZta w==;
X-CSE-ConnectionGUID: Vm9GhEOkQOy4DCDm3+NsNA==
X-CSE-MsgGUID: Julef6y1RkONgwQGAA7zNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451025"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54451025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:20 -0700
X-CSE-ConnectionGUID: ky+4Hy3rSyqubULRCMUOdA==
X-CSE-MsgGUID: usJqDKLrRZGd575dGIOzfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161404843"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.221.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:19 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v7 02/12] drm/xe: Correct BMG VSEC header sizing
Date: Wed,  9 Jul 2025 14:44:48 -0400
Message-ID: <20250709184458.298283-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
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

The intel_vsec_header information for the crashlog feature is
incorrect.

Update the VSEC header with correct sizing and count.

Since the crashlog entries are "merged" (num_entries = 2), the
separate capabilities entries must be merged as well.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3e573b0b7ebd..67238fc57a4d 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
 	.offset = BMG_DISCOVERY_OFFSET,
 };
 
-static struct intel_vsec_header bmg_punit_crashlog = {
-	.length = 0x10,
+static struct intel_vsec_header bmg_crashlog = {
+	.length = 0x18,
 	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
+	.num_entries = 2,
+	.entry_size = 6,
 	.tbir = 0,
 	.offset = BMG_DISCOVERY_OFFSET + 0x60,
 };
 
-static struct intel_vsec_header bmg_oobmsm_crashlog = {
-	.length = 0x10,
-	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
-	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x78,
-};
-
 static struct intel_vsec_header *bmg_capabilities[] = {
 	&bmg_telemetry,
-	&bmg_punit_crashlog,
-	&bmg_oobmsm_crashlog,
+	&bmg_crashlog,
 	NULL
 };
 
-- 
2.50.0

