Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BBBC28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1010E234;
	Fri,  7 Mar 2025 18:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5yhbb9Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144A210E234
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741371321; x=1772907321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZPHZF2JqN109QXS/MHivYhdkTTyGoPsrH+fytx+P2Yk=;
 b=m5yhbb9ZY5rsCSVDwIiMmx2xKLkojiWYgvOD85Ana2eWNuzqrSfzaYdm
 UA58oBntgKn0WTdGOKIiDepahemMQnh5Wof1NL6dDuo5dYvPPvh8jUKFK
 DHr2gDmp2oyz2S208vHeZCqKTFFH8wvKfpVZpvvYVtNh+xeHyOCA78v3Z
 2jEOnV50Cu4acjaZviKBDxObCGOWtk0QusG058RO2SEsEEj3DckK+jMmS
 4X7+QBKS3trFSCmL/qM54T+y3iSJ7qYYARmZfIPVwxus5nyNlwNr5wgT5
 Lamwu+Q3KSzuX31H3P/rUDcKx5QJSNribQwPADXE3bIfsuw6IHhSgr0/J Q==;
X-CSE-ConnectionGUID: b/tBg0k7TviH8et5WKDM7g==
X-CSE-MsgGUID: vnzLLYRrTn+AGGXa+1n5BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53825233"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="53825233"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:20 -0800
X-CSE-ConnectionGUID: gP3DPk+vQRm5WDWvWaLmkQ==
X-CSE-MsgGUID: 3OFxEWlgTHiuPOikHiRsag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123580766"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:15:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 1/2] drm/xe/uc: Remove static from loop variable
Date: Fri,  7 Mar 2025 10:13:21 -0800
Message-ID: <20250307-xe-per-gt-fw-v1-1-459574d76400@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
References: <20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-c25d1
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

The `entries` variable is used to loop through the array - it's supposed
to be const, but not static.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 18e06ee9e23fc..c22da0ce9fb0d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -225,8 +225,8 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 		[XE_UC_FW_TYPE_HUC] = { entries_huc, ARRAY_SIZE(entries_huc) },
 		[XE_UC_FW_TYPE_GSC] = { entries_gsc, ARRAY_SIZE(entries_gsc) },
 	};
-	static const struct uc_fw_entry *entries;
 	enum xe_platform p = xe->info.platform;
+	const struct uc_fw_entry *entries;
 	u32 count;
 	int i;
 

-- 
2.48.1

