Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD77606A33D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TFpjldXP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC92112AAE;
	Fri, 20 Nov 2026 14:23:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C7D112AA3;
 Fri, 20 Nov 2026 14:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184605; x=1826720605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wmNOpAC90aRyXwpyA+Y4qxkb+V6+WZnmal6jsk/oGqo=;
 b=TFpjldXP94jdG4sJd35Q2Eje6hAp9Wkq4CUvk71j3OarEava6ejU7amG
 kLaZPe5NJ/JWTLz7kqh3p/20yHB3bvrl2fgcWZtqZPVy1yAW7NBZ3Zuhz
 V9AamvX1AScXihSDPRsA2vfS+TcSTyobRDVMYwlKgbUg7CKcGMFMO3l99
 yfcEreUPoYNn/bPom5iXCuNDqY1FNTcOgK9RB8o1CpDuWObn2nUrWpZy/
 w2coosg4n07VwxeT+bfEcKOU1Ez/byMBShtCxlKOh2sRow/W8vZarXO4M
 eazdCyYtqtnPYuDEMGjNTxhlijAklMj0TWLP+wJ4K/yQUKn5JnK1+YFJ2 w==;
X-CSE-ConnectionGUID: mvLIDBw0TYqsYVs/E2BJFA==
X-CSE-MsgGUID: zh8lhP81RGKBuZio83okrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090943"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090943"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:24 -0800
X-CSE-ConnectionGUID: O+sRNzgWQOygIfYlbDDHJw==
X-CSE-MsgGUID: 5XIrZtxCT+aC5mIrnZp32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422010"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:23 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 09/29] drm/i915/hdmi: Clamp the target_bpp only when it equals
 the link bpp
Date: Fri, 20 Nov 2026 19:37:09 +0530
Message-ID: <20261120140729.466177-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

The max bpp from intel_hdmi_dsc_get_min_max_bpp() is at most the
uncompressed link bpp, so when picking the compressed bpp we reduce the
target to keep it below the uncompressed link bpp. Doing this
unconditionally makes the search skip both the max and min boundaries,
returning 0 when max_dsc_bpp equals min_dsc_bpp.

That case isn't hit as of now, but an upcoming FRL link-bandwidth clamp
can make max_dsc_bpp == min_dsc_bpp.

Reduce the target only when it equals the uncompressed link bpp, start
at max_dsc_bpp otherwise, and iterate down to and including min_dsc_bpp.

v2: Use link bpp, reuse intel_dp_output_format_link_bpp_x16(). (Suraj)

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index ac2172a5a320..09c8d5b92b1c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3391,13 +3391,15 @@ intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
 }
 
 static int
-get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes,
+get_dsc_compressed_bpp(enum intel_output_format output_format, int bpc,
+		       int num_slices, int slice_width, int hdmi_max_chunk_bytes,
 		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
 {
 	bool bpp_found = false;
 	int bpp_decrement_x16;
 	int bpp_target;
 	int bpp_target_x16;
+	int link_bpp_x16 = intel_dp_output_format_link_bpp_x16(output_format, 3 * bpc);
 
 	/*
 	 * The Sink has a limit of compressed data in bytes for a scanline,
@@ -3422,9 +3424,13 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
 	if (!src_fractional_bpp)
 		src_fractional_bpp = 1;
 	bpp_decrement_x16 = DIV_ROUND_UP(16, src_fractional_bpp);
-	bpp_target_x16 = (bpp_target * 16) - bpp_decrement_x16;
+	bpp_target_x16 = bpp_target * 16;
 
-	while (bpp_target_x16 > (min_dsc_bpp * 16)) {
+	/* The compressed bpp can't be the same as the uncompressed link bpp */
+	if (bpp_target_x16 == link_bpp_x16)
+		bpp_target_x16 -= bpp_decrement_x16;
+
+	while (bpp_target_x16 >= (min_dsc_bpp * 16)) {
 		int bpp;
 
 		bpp = DIV_ROUND_UP(bpp_target_x16, 16);
@@ -3466,7 +3472,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
 				       &min_dsc_bpp, &max_dsc_bpp);
 
-	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
+	dsc_bpp_x16 = get_dsc_compressed_bpp(output_format, bpc,
+					     num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
 					     src_fractional_bpp,
 					     min_dsc_bpp, max_dsc_bpp);
-- 
2.50.1

