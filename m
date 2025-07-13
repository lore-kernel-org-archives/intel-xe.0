Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C6C83F20
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 17:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE0210E186;
	Sun, 13 Jul 2025 17:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLRzmVoc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013710E186
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 17:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752427798; x=1783963798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gViMR+2hZr7V6J2nRL0g3HoCq3Aw83lyYK0dYyPFOSI=;
 b=eLRzmVocicgsFLgIa275dgmYhlSEPzg2YhMYy1H6UdDtHQrsEAXyS+mi
 DIAdL5eb+0zneZKDGFlrB/tOnOfzbF5yBvw/dAVGXriA9ae/Uhw7d71mP
 olMTekMjx6wwl1dYpZ8ORoCI8EX+9pLkQk5JD8v4DQ919EhEGBiP9Utqd
 zJK+5swXI/H0/UPpeonF/2IqvZnGtTB3MnHXTTecXECcGMRfE1+JV4WwG
 Vr2Sl/YhWJdxee4IrGwLXXXuLlGses8VpZYF0/IdY3CRPMKkUl/Fz2EaE
 NP/Z9MsuNUljKQlePzCBDQkK5Ac3Pai0eCY7HJ/woasa9WappziUn+c/r A==;
X-CSE-ConnectionGUID: tnxz1tWASnWycy8JUSVftg==
X-CSE-MsgGUID: PsFxiM0RTG24srVgaeeHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334118"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="65334118"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:29:58 -0700
X-CSE-ConnectionGUID: w5xDd6miQKm69b9kyBC2sA==
X-CSE-MsgGUID: D3uaVgVaRQi1nomAhnaP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="161069184"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.19])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:29:56 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 02/13] drm/xe: Correct the rev value for the DVSEC entries
Date: Sun, 13 Jul 2025 13:29:32 -0400
Message-ID: <20250713172943.7335-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
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

By definition, the Designated Vendor Specific Extended Capability
(DVSEC) revision should be 1.

Add the rev value to be correct.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3e573b0b7ebd..d279e0ace7d7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -24,6 +24,7 @@
 #define BMG_DEVICE_ID 0xE2F8
 
 static struct intel_vsec_header bmg_telemetry = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_TELEMETRY,
 	.num_entries = 2,
@@ -33,6 +34,7 @@ static struct intel_vsec_header bmg_telemetry = {
 };
 
 static struct intel_vsec_header bmg_punit_crashlog = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 1,
@@ -42,6 +44,7 @@ static struct intel_vsec_header bmg_punit_crashlog = {
 };
 
 static struct intel_vsec_header bmg_oobmsm_crashlog = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 1,
-- 
2.50.0

