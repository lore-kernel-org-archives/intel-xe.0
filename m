Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FE606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZyJ6GF70
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FCB10E5CF;
	Mon,  2 Nov 2026 10:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CC510E5CF;
 Mon,  2 Nov 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613671; x=1825149671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8KEMow/03L7GkDafExN158yVFNddeKWxDnX1iOifDk=;
 b=ZyJ6GF70QGOCVbSGKzKlUR3wx6dkHSA1StrzkJyC+orQFDEQ3h5x4u24
 z/HxQnr6quUsNoUL1z7Q/WHUUt1/EIXGJIRroCV8wxiqNl+hDlI332chW
 kObMYbHBe7FZXDbZjH38UXHuzK5/vHvfu3tvQ6vB2VMclS7IjbLcTBrsa
 /lJhldiEIz0wrlSVWceEPf1RkCYjIJRNqbh3btjvkKBCvCO3Jo40bD+b8
 yR/bR+2OlReMbsjRX2YfitYvg3hy9eJp8nPZLXIKZgGeUQ6qhhspvT9bN
 kzyL1nRy0UcIHwlRgEB0dEabSQ7DJx9Iz6LuYvmta4VJ6Y+uFZl9x/Sho A==;
X-CSE-ConnectionGUID: 5rMHwLrrSZ6aFXa+JO45mA==
X-CSE-MsgGUID: h6agosYjRQugC9zgp4iB8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2204586"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2204586"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:11 -0800
X-CSE-ConnectionGUID: 35os61FpRauPAVEPH+eswg==
X-CSE-MsgGUID: 910Ablj3R4y5FZgxcVS7Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6068303"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:08 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/4] drm/i915/psr: Flush on cursor update also when not
 using Selective Fetch
Date: Mon,  2 Nov 2026 12:00:48 +0200
Message-ID: <20261102100051.272137-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102100051.272137-1-jouni.hogander@intel.com>
References: <20261102100051.272137-1-jouni.hogander@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently we are not doing flush on cursor update if Selective Fetch is not
in use. This does not cause problems in PSR cases as enabling VBI is
triggering PSR exit which triggers sending update to panel. In case of
Panel Replay this does not happen. This causes legacy cursor update not
working if using Panel Replay without Selective Updates.

Dc3co is currently not enabled. Anyways there is no reason to differentiate
calling psr2_dc3co_flush_locked on cursor update depending on selective
fetch being enabled. So remove this dependency.

v2:
  - Keep DC3CO handling for cursor updates.

Fixes: 129a4da11707 ("drm/i915/psr: Use TRANS_PUSH to trigger frame change event")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 288836d4a993c..b37723ad56c42 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3866,12 +3866,11 @@ void intel_psr_flush(struct intel_display *display,
 		if (intel_dp->psr.pause_counter)
 			goto unlock;
 
-		if (origin == ORIGIN_FLIP ||
-		    (origin == ORIGIN_CURSOR_UPDATE &&
-		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
+		if (origin == ORIGIN_FLIP || origin == ORIGIN_CURSOR_UPDATE)
 			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits);
+
+		if (origin == ORIGIN_FLIP)
 			goto unlock;
-		}
 
 		if (pipe_frontbuffer_bits == 0)
 			goto unlock;
-- 
2.53.0

