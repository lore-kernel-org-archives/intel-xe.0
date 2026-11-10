Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7CA606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B8M3feG/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE4910EFA9;
	Tue, 10 Nov 2026 10:35:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3EA10EFA5;
 Tue, 10 Nov 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794306932; x=1825842932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+xXGU097wA1eSNbxYOGHOjVew61434oqUAKxMfCrfo=;
 b=B8M3feG/bRMYb4GikwzLt6+MSt6YLHohVhY+gFgFZsuyQPo3nSacFqSk
 xukvdIf2Gij+tM+tGtgX41DJAW9VOkeK2Nw7CqSF0vn97x9cLzyM2iEnm
 YPtIhDkCtHC1EGObzqWdn1Wj/yhbBwDXy7R/9FcCkp2v5SB7V0aWZ1M1A
 Zq67SiafKIWNOah/6FphJiUlrftooy/2hHWTo1X6lgO6lBlCeDiZIdfUJ
 1m2bhsb4dLrfdn9KJYTQRn01cJl40qmbZpqrX7adagPApTGEhVYS4KJ+L
 fnoiMhabMHV5F9mbjLbAoIeGxDzFfDRW383jiXxmjaEwU+aqr7okzJsQe Q==;
X-CSE-ConnectionGUID: mrFP2ZndQ/qRcA0U4OObHg==
X-CSE-MsgGUID: b55npGa9TeW0JGRiKky3sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3131572"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3131572"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:35:31 -0800
X-CSE-ConnectionGUID: c2dOLU6UR/6Vzhi4DwnFcQ==
X-CSE-MsgGUID: BNX1GzGYStaQj2r3IkivSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8116680"
Received: from alekseim-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:35:29 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, ville.syrjala@intel.com,
 juha-pekka.heikkila@intel.com
Subject: [PATCH v4 2/2] drm/i915/fbc: Apply Wa_14028723391
Date: Tue, 10 Nov 2026 12:35:13 +0200
Message-ID: <20261110103513.176529-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110103513.176529-1-vinod.govindapillai@intel.com>
References: <20261110103513.176529-1-vinod.govindapillai@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Screen corruption with FBC enabled on a plane with the FP16.
The recommended workaround is to disable FBC in case of FP16
format with alpha. So remove the DRM_FORMAT_ARGB16161616F and
DRM_FORMAT_ABGR16161616F from the supported formats list from
the affected platforms.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 2e437b969451..26dc8b088521 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1205,9 +1205,7 @@ static bool xe3p_lpd_fbc_pixel_format_is_valid(const struct intel_plane_state *p
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_ABGR8888:
 	case DRM_FORMAT_RGB565:
-	case DRM_FORMAT_ARGB16161616F:
 	case DRM_FORMAT_XRGB16161616F:
-	case DRM_FORMAT_ABGR16161616F:
 	case DRM_FORMAT_XBGR16161616F:
 		return true;
 	default:
-- 
2.43.0

