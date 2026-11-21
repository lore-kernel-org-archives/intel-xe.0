Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214C7606A32A
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2b1ofIk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80210E9F4;
	Sat, 21 Nov 2026 18:24:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE35010EA1D
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285427; x=1826821427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J3mT8quYw3Vm25z+1kZQkx0AQu3CIqpgU5ATRuOw38A=;
 b=j2b1ofIkkJ9myNaZePTU+75SfrWVeLPxJFYODJtbyFEYp3fxyMTG5QfF
 Say+tBbtWXaoSF2xxXvvuvnvrWebCdPqyiB4RIf4unI/z8MstS7knrc+2
 dscoa9I+Vzd0f9cRGd1TW5POTbaE+FsO9QVQmbo2bP6gkX5wcWrvhx5IG
 1mrO4G38ntj7Ttu4kB+VJ+5jp081ql7ydAevSMlpQ/Kclyu0IRX+cUbz6
 eTgWvBejRA1T8Ka/hpdhgGrNj6mOUpSxrvbY0EPMfng+xZR2C+q/UMJB8
 J6IWf1EJMK0udU1Pea4/wOKtoBQj119AvwgU0BEJbn+0Yf6AN1yjamCOy Q==;
X-CSE-ConnectionGUID: LUiBF4+CRTGgmLiQ8Fu12Q==
X-CSE-MsgGUID: Ktrk3uoBRgiY1U8qj/U88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034071"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034071"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:21 -0800
X-CSE-ConnectionGUID: ft3OTsGnTAWlbDfwCxU71A==
X-CSE-MsgGUID: ffbWCs1qRrSQy2WYkfQnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934446"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 15/17] drm/xe: Allow probe without a primary GT
Date: Sat, 21 Nov 2026 18:23:31 +0000
Message-ID: <20261121182317.48981-34-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

Probe required a graphics IP and a primary GT, so the media only
combination the gt_types_allowed configfs attribute can ask for was
rejected outright.

Require instead that something is left to drive: at least one of the two
IPs has to be detected, and every tile has to end up with at least one
GT. The dgpu concern the old comment raised is covered by VRAM being a
graphics IP property, so a device without one has no VRAM to manage.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b8dcb224e306..31dbd5a32d65 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1060,11 +1060,11 @@ static int xe_probe_ips(struct xe_device *xe,
 	}
 
 	/*
-	 * If we couldn't detect the graphics IP, that's considered a fatal
-	 * error and we should abort driver load.  Failing to detect media
-	 * IP is non-fatal; we'll just proceed without enabling media support.
+	 * Either IP on its own is enough to go on with.  Only a device where
+	 * neither could be detected is a fatal error, since there would be
+	 * nothing left to drive.
 	 */
-	if (!probed_info->graphics_ip)
+	if (!probed_info->graphics_ip && !probed_info->media_ip)
 		return -ENODEV;
 
 	return 0;
@@ -1179,21 +1179,14 @@ static int xe_info_init(struct xe_device *xe,
 		if (IS_ERR(tile->primary_gt))
 			return PTR_ERR(tile->primary_gt);
 
-		/*
-		 * It's not currently possible to probe a device with the
-		 * primary GT disabled.  With some work, this may be future in
-		 * the possible for igpu platforms (although probably not for
-		 * dgpu's since access to the primary GT's BCS engines is
-		 * required for VRAM management).
-		 */
-		if (!tile->primary_gt) {
-			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
-			return -ENODEV;
-		}
-
 		tile->media_gt = alloc_media_gt(tile, media_desc);
 		if (IS_ERR(tile->media_gt))
 			return PTR_ERR(tile->media_gt);
+
+		if (!tile->primary_gt && !tile->media_gt) {
+			xe_tile_err(tile, "Cannot probe tile without any GT\n");
+			return -ENODEV;
+		}
 	}
 
 	/*
-- 
2.43.0

