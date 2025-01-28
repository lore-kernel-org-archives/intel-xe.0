Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB8C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE8310E690;
	Tue, 28 Jan 2025 15:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llU3Enl8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF3210E690
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738079142; x=1769615142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K1HN1QdNEZmbCOIQrxhUsTzFmvWO/3WI7/cJKI3YjKE=;
 b=llU3Enl8+C8ihA1K65EvJiYRTCWsFUbDGawuoFkEnwvfrb9QG/zom+Ev
 VvHe/Xaty6ClaRKTDxToMlBY3YrLR9ICooApUCcpHiWoLkshAMKAPaGrK
 h9YJZ9AGfFZ3oIMy/EY0bos6NY/nGRIFgMnrW6uDHhoUxbQ/PhAGNztKK
 wQXpFMqIJo2hWLV6FlOt+ptOKLzmzR+61nlgYd41ALPLARtDpFzyFCDfl
 ccz1jIIjSn14xB6MnUDQ8ksKfCMUuuw4Pw1i7iEVjEbITOj1Z+arCdxYc
 tDC3hV/sQUtvDyWhFmz8vCaKsEXKYl0Clx7sfh5J5fswePnfS+YxBWizP g==;
X-CSE-ConnectionGUID: 5QTrtV7pTMOBgUnOPS4sBQ==
X-CSE-MsgGUID: v1h0AwtrTIaGet60UMtmwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56110327"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="56110327"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:45:42 -0800
X-CSE-ConnectionGUID: PLXxZrJQQ+Ctj2DHtcEjqQ==
X-CSE-MsgGUID: ySNAsxLKSJCzIxh9wdCHUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108625650"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 07:45:42 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe/guc: Fix size_t print format
Date: Tue, 28 Jan 2025 07:42:42 -0800
Message-ID: <20250128154242.3371687-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Use %zx format to print size_t to remove the following warning when
building for i386:

   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/xe/xe_guc_ct.c:1727:43: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1727 |                         drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
         |                                                        ~~~     ^~~~~~~~~~~~~~~~~~
         |                                                        %zx

Cc: José Roberto de Souza <jose.souza@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501281627.H6nj184e-lkp@intel.com/
Fixes: cb1f868ca137 ("drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c  | 2 +-
 drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 497036675a38c..72ad576fc18eb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1724,7 +1724,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
 			   snapshot->g2h_outstanding);
 
 		if (snapshot->ctb) {
-			drm_printf(p, "[CTB].length: 0x%lx\n", snapshot->ctb_size);
+			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
 			xe_print_blob_ascii85(p, "[CTB].data", '\n',
 					      snapshot->ctb, 0, snapshot->ctb_size);
 		}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index ab97ac728d7a8..80514a446ba28 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -204,7 +204,7 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
 	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
 	drm_printf(p, "Log level: %u\n", snapshot->level);
 
-	drm_printf(p, "[LOG].length: 0x%lx\n", snapshot->size);
+	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
 	remain = snapshot->size;
 	for (i = 0; i < snapshot->num_chunks; i++) {
 		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
-- 
2.48.0

