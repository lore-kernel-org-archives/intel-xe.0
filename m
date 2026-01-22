Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF4ED13C13
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697B310E430;
	Mon, 26 Jan 2026 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.b="TL38t8RT";
	dkim-atps=neutral
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA8D10EA75
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 19:38:24 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R12" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4dxrvf5c9pz3HcT;
 Thu, 22 Jan 2026 19:38:22 +0000 (UTC)
 (envelope-from emaste@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org [96.47.72.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org", Issuer "R13" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4dxrvf39srz467V;
 Thu, 22 Jan 2026 19:38:22 +0000 (UTC)
 (envelope-from emaste@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1769110702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8aQOJxIZJ7mv3eG5vzqzXIZlYpvZF2Wnn9sG1+GJjSA=;
 b=TL38t8RTt5k5YqBmE1KgSzNB000BmPLDFwSV8WSkWPNMA0pFTruRYm4SCYbAvpTAv/mv5p
 G8bSoYCJXcWu74Dv2xM36Wx4htCLYwoXs6lpB3ZxXV8sD+ajFWD8/88RBz3WfNHCV5Y7Mj
 OM7+Rws97q3t1Bp13OGkvUtdBbmhVR/pp+Bi6s2RCnGT+cwiDl8ecRLjmU16/FD6KP0VV7
 IQvvgIbkKiISUApRbbxoeWK3KjZKCHUod4mpE3wQW4PTta1REUHywHSWJ4TNXTuacJheqI
 DS8DUHMlO/E22gGVuJwRYWDLCOqUU+aLwIvW4E1T3xgq6NjEznCCXRvo30B6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1769110702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8aQOJxIZJ7mv3eG5vzqzXIZlYpvZF2Wnn9sG1+GJjSA=;
 b=lLefD4lzJpbNpaXLgzYlSVMn9sRvuK6J3RVs/RmD4+3iK8Agr8rWd/6RgjsHDPV48If+d8
 qAy+5Cqc6xYX+5n0E5UsGARnT2kH/HnwhxWC9vHNRahut2UVKZ+43ycENZ4dG1wSZfyIHn
 /XMgMzoX4S15m9jpJ46a+ruVHMJWEeJhx4j+nh1RJjUUWNvy0o0J2k3ON17oeWwSmHDYz2
 2nYbdcGE2ACtV/XDtL3y31nKSWFTCZXwmEajzchFs21kwqOz6OOKLYKxd2oeQ2USx9aMyw
 958JpjJMkxDYbzVLkBo6TBuGsHQikLMwW/Q477gak/YFguUW3tpAd3kR/Z7ioA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1769110702; a=rsa-sha256; cv=none;
 b=PmIlns44P+5zUG2YDlaglzPPYVLk8JR52GwlYPKLBgv1ajLUBJ9bABDkpSywYPzi7aXfWr
 OodP7JTjP4Y1DQuLDf71OKjGZAfHGRrzlwnFZkvPLwK9/JZa9j6hlL70mf/1FK27N4cTQl
 zNKDptXInahodlZlJcRQWwiRPwRdISFssQe2bf1KQ4X92Bp7G6188id9H4Rzo/i3dbDCO4
 9geZ7q7aiiZ8dQT7JVvDNmILrfI9XLhiWIE19PGqTxmkiOJuodQv7Ah5+4oJ916qVOXe+y
 KF2E1h4GjLWHNVyOOOceHQpw+JWQEs83bY5f4Mcc0JF4I0edLOxHz1sXth1xBg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received: by freefall.freebsd.org (Postfix, from userid 1079)
 id 59C9AD1C4; Thu, 22 Jan 2026 19:38:22 +0000 (-00)
From: Ed Maste <emaste@FreeBSD.org>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, Vivi@freebsd.org,
 Rodrigo <rodrigo.vivi@intel.com>, Hellstrom@freebsd.org,
 Thomas <thomas.hellstrom@intel.com>, airlied@redhat.com,
 dan.carpenter@linaro.org, dev@lankhorst.se, marievic@google.com,
 Ed Maste <emaste@FreeBSD.org>
Subject: [PATCH] drm/xe/tests: Update SPDX license to GPL-2.0 OR MIT
Date: Thu, 22 Jan 2026 19:38:15 +0000
Message-ID: <20260122193817.28043-1-emaste@FreeBSD.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Jan 2026 13:55:32 +0000
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

"GPL-2.0 AND MIT" indicates that both licenses must be complied with,
so was not significantly different from GPL-only, and so I presume was
unintentional.

Signed-off-by: Ed Maste <emaste@FreeBSD.org>
---
The original author at Intel (matthew.brost@intel.com) agrees this is
likely not desired.

I've CC'd non-Intel authors of changes to these files to ack the change.

 drivers/gpu/drm/xe/tests/xe_bo.c                       | 2 +-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c                  | 2 +-
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c            | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c          | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c             | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c          | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c           | 2 +-
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c            | 2 +-
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h            | 2 +-
 drivers/gpu/drm/xe/tests/xe_lmtt_test.c                | 2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c                     | 2 +-
 drivers/gpu/drm/xe/tests/xe_pci.c                      | 2 +-
 drivers/gpu/drm/xe/tests/xe_pci_test.h                 | 2 +-
 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c   | 2 +-
 drivers/gpu/drm/xe/tests/xe_test.h                     | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 2294cf89f3e1..386d51de0073 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 5df98de5ba3c..422ea4433bba 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index 42bfc4bcfbcf..5307c26e2c69 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2025 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e..ca7c2fb1ed4f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2024 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
index a87a7b4b040a..4d39cd345b50 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
index 3b213fcae916..7f71fb7b817d 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2025 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0..eae0bc65374c 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2024 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
index 13701451b923..c386d35796f6 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
index bc5156966ce9..8799b4dda3e6 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
index 83665f7b1254..d330d01e7964 100644
--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_lmtt_test.c b/drivers/gpu/drm/xe/tests/xe_lmtt_test.c
index 1f1557c45ae1..3f98a05ea262 100644
--- a/drivers/gpu/drm/xe/tests/xe_lmtt_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_lmtt_test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 6bb278167aaf..db44dba9f338 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2022 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index f3179b31f13e..b7dc67a58bc7 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
index 30505d1cbefc..b9bdda92bc42 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright © 2023 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
index ba95e29b597d..c5c952224a55 100644
--- a/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 AND MIT
+// SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
  * Copyright © 2024-2025 Intel Corporation
  */
diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 9c23ad9dba8d..c7a658fb9f20 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /*
  * Copyright © 2022 Intel Corporation
  */
-- 
2.51.1

