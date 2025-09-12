Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3763CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 22:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB3E10ECE5;
	Fri, 12 Sep 2025 22:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uz/KG4hz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179C610ECE5
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 22:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757714755; x=1789250755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BuKKkfdhC+uCdPSDcOUoW8jYGqju5BPeqhY3J8tGpT8=;
 b=Uz/KG4hz+ZpJIZ3CM6VWDJkbGk/PCFIRuQNXj1oUzBD1YsiWbEr6cJIx
 Y7Mlo56Nc0urnIIisBdpICMvqYNfbVsm+Zzd73S0/n0n19CbuGzfzI6NZ
 wFCNCunlKQr5dczhQxhfXSQfBqfOeQRJt8cyyg8b0SoZQGgaHw2q34n1N
 r4WEgMM6eBWGR2CWG2sfoOgw1zalNxJv1nzKGp9qVQ4CS3vNRZuqV8DbM
 uK5VnAeIAUmgO9/WjmF3c/K21TNVCsxzf/6Hq2hXU+4/b8dSgLf1oJj0E
 UQ2MwE8qj28MPK6RzbmUzbyguRXyx3xe1iCv6rLC2HpQNf1taWU4ss67l A==;
X-CSE-ConnectionGUID: w0Ict/0cTj6CrjkKwqmBAg==
X-CSE-MsgGUID: YUGarWeHQ1G8Zbl45O+XTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60002105"
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="60002105"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 15:05:54 -0700
X-CSE-ConnectionGUID: S7BHeVuhTbOAwaGbi0/DYw==
X-CSE-MsgGUID: y4XuTjwdSLmygsC1kHT9xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,260,1751266800"; d="scan'208";a="179264391"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 15:05:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: Use ARRAY_SIZE in guc_waklv_init()
Date: Fri, 12 Sep 2025 15:05:34 -0700
Message-ID: <20250912-guc-ads-array-size-v1-1-a6555392a1f8@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250912-guc-ads-array-size-2b38a2702364
X-Mailer: b4 0.15-dev-b03c7
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

Prefer using ARRAY_SIZE where needed and just passing 1 instead of
calculating the size of one element.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508130158.eogeBZQT-lkp@intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 5631722f34f53..58e0b0294a5bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -339,7 +339,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 	if (XE_GT_WA(gt, 13011645652)) {
 		u32 data = 0xC40;
 
-		guc_waklv_enable(ads, &data, sizeof(data) / sizeof(u32), &offset, &remain,
+		guc_waklv_enable(ads, &data, 1, &offset, &remain,
 				 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
 	}
 
@@ -355,7 +355,7 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 			0x0,
 			0xF,
 		};
-		guc_waklv_enable(ads, data, sizeof(data) / sizeof(u32), &offset, &remain,
+		guc_waklv_enable(ads, data, ARRAY_SIZE(data), &offset, &remain,
 				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
 	}
 



