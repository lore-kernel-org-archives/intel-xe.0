Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730DCC7EE43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CC610E4B4;
	Wed, 23 Aug 2023 17:09:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7410E481;
 Wed, 23 Aug 2023 17:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692810561; x=1724346561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6pyfYh4ufanXyN0HZWcHnTJbxw9JSOicqD7JGV3X/EQ=;
 b=K8uWoXXAAirqrOhkIphpA5JaP9zaHLPgNkXAYlLPVF2oA6LwYEOWK/rs
 RS1YZycbxe4YBHfiZ05gQalVvTSVhEPvZS32UoBQb5HjBBpt4FZsSV0i4
 Jk3uZezA96R3T3eITQjfgwQv5zcjnrm1seE451a5XffX7bBYF4c0etZP3
 IG1Yu/AZ/MmlrMqMARiS1Dy3cv42AQ+pJxMGZPbWg1K/HAjwdlQLKz2F6
 0+ZWZTmPg3P1zj1lVzO+BRgLfQYjustERPkW9mwBKuhf8M0F6+NESoj/e
 MsGsa1buifSJAK4oqLPP+oxRorix/qDA4we448SM1AtA+7kIcy6PkEGtQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438147500"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="438147500"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802204851"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802204851"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:07:26 -0700
Message-Id: <20230823170740.1180212-29-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 28/42] drm/i915/xe2lpd: enable odd size and
 panning for planar yuv on xe2lpd
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

Enable odd size and panning for planar yuv formats.

Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index fb13f0bb8c52..da6ee7f0675a 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -986,6 +986,14 @@ int intel_plane_check_src_coordinates(struct intel_plane_state *plane_state)
 	if (fb->format->format == DRM_FORMAT_RGB565 && rotated) {
 		hsub = 2;
 		vsub = 2;
+	} else if (DISPLAY_VER(i915) >= 20 &&
+		intel_format_info_is_yuv_semiplanar(fb->format, fb->modifier)) {
+		/*
+		 * This allow NV12 and P0xx formats to have odd size and/or odd
+		 * source coordinates on DISPLAY_VER(i915) >= 20
+		 */
+		hsub = 1;
+		vsub = 1;
 	} else {
 		hsub = fb->format->hsub;
 		vsub = fb->format->vsub;
-- 
2.40.1

