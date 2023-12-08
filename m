Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB2FC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 11:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496F310EA91;
	Fri,  8 Dec 2023 11:29:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968CF10EA9C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 11:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702034984; x=1733570984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dT7lpwGUSMnTaYZ1l7kzRH3mCWtSYbEcVojWE7sOLkU=;
 b=ZsRq+hmi4Em5p/XuDVG5OD6aXGvE0TAR1d08l0GBsgS5i/kIMm6L+u3w
 jdKozKbgd2Br1uhI3EFsZuEwOvpke+eIAnp4C4fMqROCMu+c51LXIHVrQ
 cL8yf54BZ/J8Km5QSihYauwNA9pOwmMDk/mKYFNqDRYXhZuNsMclh59ip
 UXZFbPf7vPAwebcqe9N/yE55R9JWGEVlsmMMtB24XSxo5AAsVeOMR9iU0
 Knqcx7JdciJRGnJnKp56O+rLxPiREVEr5cSJg54Z3B4Vqg4DfxI2e4TeP
 HZ9gUMZQZWJlBldjjYfDi6KjLQHVuz9onsTDUPIjs8QEX/g/EywuPAjSe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1474132"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1474132"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:29:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721843383"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721843383"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.236])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 03:29:32 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe: Restrict huge PTEs to 1GiB
Date: Fri,  8 Dec 2023 12:29:17 +0100
Message-ID: <20231208112918.15411-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
References: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a define for the highest level for which we can encode a huge PTE,
and use it for page-table building. Also update an assert that checks that
we don't try to encode for larger sizes.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 drivers/gpu/drm/xe/xe_pt.h | 3 +++
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 35bd7940a571..699a255d75f5 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -430,6 +430,9 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 {
 	u64 size, dma;
 
+	if (level > MAX_HUGEPTE_LEVEL)
+		return false;
+
 	/* Does the virtual range requested cover a huge pte? */
 	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
 		return false;
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index d5460e58dbbf..ba2f3325c84d 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -18,6 +18,9 @@ struct xe_tile;
 struct xe_vm;
 struct xe_vma;
 
+/* Largest huge pte is currently 1GiB. May become device dependent. */
+#define MAX_HUGEPTE_LEVEL 2
+
 #define xe_pt_write(xe, map, idx, data) \
 	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e09050f16f07..f585cc7df071 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1239,7 +1239,7 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
 
 static u64 pte_encode_ps(u32 pt_level)
 {
-	XE_WARN_ON(pt_level > 2);
+	XE_WARN_ON(pt_level > MAX_HUGEPTE_LEVEL);
 
 	if (pt_level == 1)
 		return XE_PDE_PS_2M;
-- 
2.42.0

