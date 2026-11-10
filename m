Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBD7606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 22:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5bcgRol
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860310E088;
	Tue, 10 Nov 2026 22:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43BE10E088
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 22:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794351157; x=1825887157;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=5VYVOmBO7wabYpUvnOhNXOQpN/Q9e03C5T9e3HePz/k=;
 b=M5bcgRolpLeTZHzFMs2HIbxRUsx4s3y1CSgBPgz+MEvtUz9nx7RykvEQ
 LM+P8xL2ZZlpwlq9NYLHtMAwWB4z6TwJq1SbfMnNFapL5Hx7xPVqBOM1F
 j+XmF42aTuP9NiSGDAKcW5S+sieJPgna64siV9ObkzxlC+/e3koTVlhT7
 0DCIWU8LUx//KpFZOays94jPNgVcJQy4cgTVJkARPLPeKGpxKN4PeLerc
 Z95coA6vAFp2vZ64SIzvTCxsw7Sc6UKkcdn9xtHx7PonYtiz7LOZBsNHI
 qNN+rGGM+dg57axBcblW7kfxQK3Bx6tJhUFYsoW0k6Akrz7VqLEyd73wB w==;
X-CSE-ConnectionGUID: KXwF7RF7RRuzFs8G5z5ztg==
X-CSE-MsgGUID: uj+awg8aQKWpKQgGnQMNrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2985339"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2985339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 14:52:36 -0800
X-CSE-ConnectionGUID: JlIqF2rcTpO5ojXOd+jdjQ==
X-CSE-MsgGUID: My6dL8y+SEai6XkttEar4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8300152"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 14:52:33 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 10 Nov 2026 19:52:23 -0300
Subject: [PATCH] drm/xe/nvlp: Drop force_probe requirement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-nvlp-drop-force_probe-requirement-v1-1-3dd6aeac38fc@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBG4avIrDtgtCh4FZGiyW87oEmctCKId
 29w+W3eOylBBYm64iTFLkmCzzCPguxn9G+wuGyqyqoxxpTs9yWy0xB5DmrxihomsGL7iWKF/3L
 rME4tnqitpdyJilmO+9EP1/UHWSY8vHMAAAA=
X-Change-ID: 20261110-nvlp-drop-force_probe-requirement-7deab7e4e3cc
To: intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

NVL-P is stable enough for us to drop force_probe requirement. Let's
do that.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index be1b063cb68d..fefa600b7ff7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -508,7 +508,6 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
-	.require_force_probe = true,
 	.va_bits = 48,
 	.vm_max_level = 4,
 };

---
base-commit: a6a3cf6cc0759788b1b0ce63f9cfd855d5785449
change-id: 20261110-nvlp-drop-force_probe-requirement-7deab7e4e3cc

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

