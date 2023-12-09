Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCAAC10F05
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 15:19:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB2F10E19C;
	Sat,  9 Dec 2023 15:19:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBF010E19C
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702135145; x=1733671145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIebzUEnri3YKB0WebiE/AaIl7EkbBaCEdgCbUemsuk=;
 b=WOCbt9+6hejxxlukBGDPvIH/MYQ1p1plp01tHFbIXCjTdNbUEpFsqlYD
 SMXU1YYMH2SYb2sj08p+oipXQMgArjPsn8QH9rQ7dbArzs6TGv6AKr20y
 07B+t/O2hL4FJKEltV8cmxZdDh1Qldnf1J5ZuSeGFJ8zvQAiDwqXMjKp5
 IHJFo2a3ZANW5qBaMQ1ofrwpZn/WhYbqim27uDE/dI0KU3N8+/oS5o0xB
 SEohBK1AuOpt2B1n/WSUFS5UzTwB2qGWCs9M2Kmry3gHnYD/TuYF7Roo9
 9Gfjf93l6bEztEnOxTEozzBTwAWSnHaTX5wW+Y3nxYJh942ZfTBryK1Ih w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398376893"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="398376893"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="17500276"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:19:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/xe: Restrict huge PTEs to 1GiB
Date: Sat,  9 Dec 2023 16:18:41 +0100
Message-ID: <20231209151843.7903-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
References: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
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
Reviewed-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 3 +++
 drivers/gpu/drm/xe/xe_pt.h | 3 +++
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 3b485313804a..46ef9df34a2e 100644
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
index 11667529e40b..d589beb99fe6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1258,7 +1258,7 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
 
 static u64 pte_encode_ps(u32 pt_level)
 {
-	XE_WARN_ON(pt_level > 2);
+	XE_WARN_ON(pt_level > MAX_HUGEPTE_LEVEL);
 
 	if (pt_level == 1)
 		return XE_PDE_PS_2M;
-- 
2.42.0

