Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE262C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735AC10E893;
	Thu,  5 Jun 2025 18:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtBhv62t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4A210E88F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749149123; x=1780685123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NlPrUi4ud3vMA1lroQEN9zE5GQj2yj9GhG0lx4NLOlA=;
 b=TtBhv62tU2adN3/oe+Hzw5tgi4k9cFMuqKpFih2z4ylq8gsc22EGOkqG
 AysWP243xkmjSl65HnHp13LRJ6N30HE48YyskxAE2gjiP0VXHKsGEy1jM
 h9ro8B41KtXV93yz2N8VwD3//5sOKiC6xDwNOqWVKjpOcwLf+XFgdO4Ry
 UnIwHQwpOhU+p1sGwXOUEh0/hlhdEEObGqD+THqb9SMt0Fssh0nW+evU1
 cknu9hYgCk96J7mcZVZ0SN2oGB6GElZIpiXDQr/fVwesHvGerMJeU1uCP
 +r4WwZJWrDiWyeA/43J7i5t/H9S6vjA0flw4hRkwoJFqih2Rwo5REti60 w==;
X-CSE-ConnectionGUID: mDtrm8zwQcOTFDyJoXfqBQ==
X-CSE-MsgGUID: JkSWUundSUO+XH6tyS1BIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916621"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38916621"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:23 -0700
X-CSE-ConnectionGUID: UwCkKPgBTLKp3W82NT6j4g==
X-CSE-MsgGUID: rGBGoB0UTqSZPvvz2a2LLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182782464"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:22 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
Date: Thu,  5 Jun 2025 14:44:36 -0400
Message-ID: <20250605184444.515556-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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
2.49.0

