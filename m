Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A492D606A333
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGvv6KOW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395810FAB2;
	Wed, 18 Nov 2026 11:02:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8C10FAF5;
 Wed, 18 Nov 2026 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794999754; x=1826535754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WT/e90wemZ6wkOGEgi67Yz9+ZXxRD8C7Nq7SJ9kE7RQ=;
 b=EGvv6KOWkF7f45KztoEhUDAKBbAw1sMuw09rjNI7aEkTCte7YEYCNnHY
 OeB6RSMWa1eueKSq5YD3zaWfukN83d8KBIjcxnDfjW+tDqR41UqEpHUZf
 TTpG5fSUZAtKTkwBtn6cC20AVTCp1+q7f17P64MFHojh2CuomsmW20PoZ
 ds4+xl9Jnh9DjS2+2aJ06Af0MdO/q3noaS/wzlU6n/rVDohZxroGmUzEx
 xP2JKEBTezt3pblsTXBWJO74C83P7KWS7fADJO8Odn0N78HHOretzsFIk
 BDuAjeDR2MJmiWXPvcnQ48jlyb78BsoFmMN8XNnWlRP+hPQcEubj+nJka g==;
X-CSE-ConnectionGUID: 5zi+1fgNRzmTFY2Y7ZhgEw==
X-CSE-MsgGUID: zCYNwurmTZ6nWDAJCNvFLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3845560"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3845560"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 03:02:34 -0800
X-CSE-ConnectionGUID: +UmDrNOUSjaTBOiLzesDRw==
X-CSE-MsgGUID: MlrElevCQkO1uKXo08gXTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10514400"
Received: from abityuts-desk1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 03:02:31 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Mika Kahola <mika.kahola@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/psr: Adjust Xiaomi Book Pro 14 2026 psr2 disable
 quirk
Date: Wed, 18 Nov 2026 13:02:20 +0200
Message-ID: <20261118110220.77370-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We want to apply psr2 disable quirk on  Xiaomi Book Pro 14 2026 with
differing device ID.

Fixes: 5e79af5db00b ("drm/i915/psr: Disable PSR2 on Xiaomi Book Pro 14 2026 as a quirk")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9575
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: <stable@vger.kernel.org> # v7.2+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40df9b9..e3303d5146e89 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -270,6 +270,7 @@ static struct intel_quirk intel_quirks[] = {
 
 	/* Xiaomi Book Pro 14 2026 */
 	{ 0xb081, 0x1d72, 0x2424, quirk_disable_psr2 },
+	{ 0xb080, 0x1d72, 0x2424, quirk_disable_psr2 },
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
-- 
2.53.0

