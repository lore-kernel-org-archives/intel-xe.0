Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3A7C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1910E697;
	Wed, 30 Jul 2025 14:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ej0g6kEz";
	dkim-atps=neutral
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8B210E061
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 11:05:48 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id
 41be03b00d2f7-b2c4331c50eso4728259a12.3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753787148; x=1754391948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+z1GJYGgZbGmNmxr40mc+R8tUL34OBBz9k67nPl2iXE=;
 b=ej0g6kEzBJIt/qWBu4KkXOrPb0973WIUOUp4NKsTg3StkDmQoymiwVPMEfsedkGe7V
 D7/mmdXseYU7Tx5+SxzX4o/FRkdNltkQl6EEl/GHfCy9cNdklPEV4kT99Rg+rERiwD7Y
 LrePZGm+SAxz2yaxkB/l8Kw14aDjhdFeGg/TWSW2rpNgEOQDg4SMnA1eRDdq3GE4xNSj
 PzmQuJ/qrm6DBkhWW5rvloJKcToin2CwMMMmZw+0wmxUGhIsjCeBn3jGpsSL001SkxR4
 8r/1971ODdgEXA5+y7AafE6M8biZsTSxyvUqIpzeaGJMMFhp5urkjfDXVTCUhHwojpiq
 J7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753787148; x=1754391948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+z1GJYGgZbGmNmxr40mc+R8tUL34OBBz9k67nPl2iXE=;
 b=dqoV/2HV46aAGPIfdqFdTgnSj6gTp4gWqXJZlwIoHAsdQ/X3sJKmn0uQZzVJwfrrS9
 XOvq6CnZOUBcNtlLtUe2GNyTGabpG7cqkD9mgSVDiGDMD6jlrZ8XpfvNHrl2oGRlORKq
 p9sPudRRM2X122S4PkxLfE9HnUgSPD7EVQQEy+On/LiGNzOpy6YcMdF+EHm4raw4DS+J
 SXem/lW/Uqnckjr5fJ2wjaRW2cODefubMgs2DwIj7Xa7aQ2p7tx4Vy0gXxUvH7kRX5+N
 o9CTjf9NRYj/rcvPk5+p+cD4ldkJ88mBSiVdo/h1mjKWRu5jSbQDPd+HggnB/DU9w0zL
 sN5A==
X-Gm-Message-State: AOJu0YzTPX1xlTst4mVgGrvhSYKOQYuV9kIEAExAMAOzqh4jTc/XSWv3
 mb5K2ahL8P5dzz53CmTrZxRmzZ+Q8GbMtl2oiEcTDoG/9Q8/KLZ07gw=
X-Gm-Gg: ASbGncukd6M+qHePyrq9i02IdhhFNUEexjScyxeOEehdXKrf6B0qjJdFnFx+I+Nydh4
 rdUBfkp+ICN+coHFcchvKjWybtW/0DFjaGEWZkdkaUQWc4tkCxNJmEFxnfvvuhxaFPeBQzV2WsQ
 NivFoAkPlVR++yp8ZnQeDT7tYuLeONrJDGKuIgGeMM+fPboFIo/2F9NLA45IQROUJ37qFQE/LDL
 NGsmGplzeYt544DLvXB+inE3yQiPS1GdrjiekCFwEpQfGwnolfwgFTN5ATuT9BMoT5kkKUUdnxS
 /hQ2OAtP/pzPPX90hHJaQvv9Faw0QRhPAWPMtO37kb9MjneKZbj6YmiA1p2gXPh6o43eQN/ew5g
 cO6ji2Wm/y6WmGaOB+D9SuLNX+AwpGDJN0qFh0pk=
X-Google-Smtp-Source: AGHT+IGF1UKSZVQ0ItcsqlqVAid8KL6y4wHnZzHTY3t6sZcczT8WTs89cnUpCbDJ6Z6TJ+zCeH+9Lg==
X-Received: by 2002:a17:903:2655:b0:23f:cf96:3071 with SMTP id
 d9443c01a7336-23fcf963dccmr141597945ad.49.1753787148106; 
 Tue, 29 Jul 2025 04:05:48 -0700 (PDT)
Received: from git-send-email.moeko.lan ([139.227.17.83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe30bc1fsm75929025ad.5.2025.07.29.04.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 04:05:47 -0700 (PDT)
From: Tomita Moeko <tomitamoeko@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org,
 Tomita Moeko <tomitamoeko@gmail.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH 6.12 2/4] Revert "drm/xe/tests/mocs: Update
 xe_force_wake_get() return handling"
Date: Tue, 29 Jul 2025 19:05:23 +0800
Message-ID: <20250729110525.49838-3-tomitamoeko@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250729110525.49838-1-tomitamoeko@gmail.com>
References: <20250729110525.49838-1-tomitamoeko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Jul 2025 14:02:27 +0000
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

This reverts commit 95a75ed2b005447f96fbd4ac61758ccda44069d1.

The reverted commit updated the handling of xe_force_wake_get to match
the new "return refcounted domain mask" semantics introduced in commit
a7ddcea1f5ac ("drm/xe: Error handling in xe_force_wake_get()"). However,
that API change only exists in 6.13 and later.

In 6.12 stable kernel, xe_force_wake_get still returns a status code.
The update incorrectly treats the return value as a mask, causing the
return value of 0 to be misinterpreted as an error.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Tomita Moeko <tomitamoeko@gmail.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 61a7d20ce42b..bf3f97d0c9c7 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -43,14 +43,12 @@ static void read_l3cc_table(struct xe_gt *gt,
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 l3cc, l3cc_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
+	u32 ret;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
-		KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
-	}
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (!(i & 1)) {
@@ -74,7 +72,7 @@ static void read_l3cc_table(struct xe_gt *gt,
 		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
 				    "l3cc idx=%u has incorrect val.\n", i);
 	}
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 }
 
 static void read_mocs_table(struct xe_gt *gt,
@@ -82,14 +80,15 @@ static void read_mocs_table(struct xe_gt *gt,
 {
 	struct kunit *test = kunit_get_current_test();
 	u32 mocs, mocs_expected;
-	unsigned int fw_ref, i;
+	unsigned int i;
 	u32 reg_val;
+	u32 ret;
 
 	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
 			      "Unused entries index should have been defined\n");
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 
 	for (i = 0; i < info->num_mocs_regs; i++) {
 		if (regs_are_mcr(gt))
@@ -107,7 +106,7 @@ static void read_mocs_table(struct xe_gt *gt,
 				    "mocs reg 0x%x has incorrect val.\n", i);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 static int mocs_kernel_test_run_device(struct xe_device *xe)
-- 
2.47.2

