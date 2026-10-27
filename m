Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B39606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 15:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZHk/oy48
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F1910F64E;
	Tue, 27 Oct 2026 15:06:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3B810F649;
 Tue, 27 Oct 2026 15:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793113585; x=1824649585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6FeHSTSLeJtRVyTftUk8D5u+Q+0lQcjeKV1olIkHPmU=;
 b=ZHk/oy48PuDU++Fu+3Q6VMXL3MWYnrC87ofVs+pgefKWA+adgsM2dxjL
 Y/sLe5b4Bh10kvmAVbvDcVnz5a/GVeRUWHGj5M+XT8xaMkDYGqOK/ryx4
 mArv52ogZ8CQCrFec4DYbXEwraIZLnaZQUEu0BmWhovyrhkrRplMkCJWl
 HAEOo4uMkujXokbjXW23yhfZuRc7ZtySiUDMty9uA6aGWUjYVRqXdTFnJ
 CHboAxl8aOrKhAm7kgvqR5w7pe1XCofPObPg5FwXS9S0wEv1NIzL2G0sh
 6CFX8N2JC5n1LGEM5ShQyXoiH/BHl6caN5VFTz4H2JpMOHeWjcBy8QZn4 w==;
X-CSE-ConnectionGUID: mj7gTQWuTX6XV/VBgJ7SGA==
X-CSE-MsgGUID: S5euT6jlSw6oLjekC6bxKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1699694"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1699694"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:24 -0700
X-CSE-ConnectionGUID: f+AvGrDBTM2LtdGLZPpmfQ==
X-CSE-MsgGUID: boK2YzNORdiW7Mb8kw6RzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4464283"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.247.175.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 08:06:21 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 juha-pekka.heikkila@intel.com
Subject: [PATCH v3 3/3] drm/i915/fbc: update pixel normalizer condition for
 FBC FP16 formats
Date: Tue, 27 Oct 2026 17:05:44 +0200
Message-ID: <20261027150544.81548-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027150544.81548-1-vinod.govindapillai@intel.com>
References: <20261027150544.81548-1-vinod.govindapillai@intel.com>
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

v2: use format_is_float()

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index f70f3e34d655..3d976b7d64d8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1237,7 +1237,8 @@ bool intel_fbc_need_pixel_normalizer(const struct intel_plane_state *plane_state
 	struct intel_display *display = to_intel_display(plane_state);
 
 	return HAS_PIXEL_NORMALIZER(display) &&
-	       format_is_float(plane_state);
+	       format_is_float(plane_state) &&
+	       !intel_fbc_wa_14028723391_applies(plane_state);
 }
 
 static bool pixel_format_is_valid(const struct intel_plane_state *plane_state)
-- 
2.43.0

