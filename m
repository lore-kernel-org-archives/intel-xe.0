Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5E606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dwK+RBUZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B8D10EF52;
	Mon, 26 Oct 2026 14:55:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60C610EF52;
 Mon, 26 Oct 2026 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793026542; x=1824562542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpTfkXwe0VMSxZ7NVEDMiuEWp8EQHCr3916ulNF4g04=;
 b=dwK+RBUZ9tWGhinnjKBu5vfq1CV/+RfgneIL2ZZwQJi021srZddQUn5x
 Z7sK8XhG6LyX7HZbROusYWA/m4kAt7UarlLdhrJVKm0ABsPVGQm113cC3
 mPWab1WzLBCWOPXbmxUAwGh5Qk41ZSUEOd0QAqDRi+Z4EUobOcBqpu43n
 1KUotUOOrdghN3OfQJiW8IpVpIkWOBTzlAJ5YN3Fh/d+N7LjvbxsyqMlq
 /wBRC9FXbbLYq1DXGZb/6ppaDXofZrTxyTYT5HPpmi5FxTtMvwznqHbhh
 YK2dPoU1rhgwwuaKMlfnquOXu91sFbNJcvu+zXh2+DbkvScuh3doNUW4P A==;
X-CSE-ConnectionGUID: MPMw1vj3T1uYHujy38EwRA==
X-CSE-MsgGUID: OdgzBlITSe6mIVlnhFy3RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1585461"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1585461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:42 -0700
X-CSE-ConnectionGUID: YNBfoUstQJKOtnongxRYsg==
X-CSE-MsgGUID: 1EA8BRfiQL6xbFrb3dfRSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4679912"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.113])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 07:55:39 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
Subject: [PATCH v2 3/3] drm/i915/fbc: update pixel normalizer condition for
 FBC FP16 formats
Date: Mon, 26 Oct 2026 16:55:08 +0200
Message-ID: <20261026145508.235851-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026145508.235851-1-vinod.govindapillai@intel.com>
References: <20261026145508.235851-1-vinod.govindapillai@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As the WA 14028723391 restrict enabling FBC for FP16 formats with
alpha, there is no point in enabling pixel normalizer for this
case. Use the same WA check before enabling the pixel normalizer
for FBC with FP16 formats as well

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 494bb7d852fc..36f676645f4e 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1223,7 +1223,8 @@ bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state
 	struct intel_display *display = to_intel_display(plane_state);
 
 	return HAS_PIXEL_NORMALIZER(display) &&
-	       intel_fbc_is_fp16_format(plane_state);
+	       intel_fbc_is_fp16_format(plane_state) &&
+	       !intel_fbc_wa_14028723391_applies(plane_state);
 }
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
-- 
2.43.0

