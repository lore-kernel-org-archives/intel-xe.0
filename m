Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE6C3DA7E
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3403810EC8C;
	Fri, 19 Jul 2024 17:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WtRtO4Qs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED16210EC8B
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721411917; x=1752947917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DZdQghZqxge/3gUqtKRKY8W7k/cTi1YziEGHV7iZEVA=;
 b=WtRtO4Qs1X/diz9ZAC8OADNzp/h+VpbbMVZVCUikjKJ+vJn8w/lWLLH7
 X70VzMokaZ7sQePy7PJR8oHp4BcyJT25n0MdA1TpTTngDu1IBZEAGcOIN
 ew5898cr+tGbHN64WU/TrykH2grV+0Tv16SzQjXYWutnZrAHeV1Xaopx2
 omaLXQR+F919ELjyndM6mnvTrpagdnPyBBMpi3YFKxI2X+S4NHSUAGJFs
 AFXUS8c0tmTizt34f3HgJlu8n7goSgVnmonWlJM77ABoh06qQl5TmZDgI
 3sQ/z8UjLwjz2QGKRu/vgFGd36z0rdywYHUv779zjFBgNiksDtHvnRrUR g==;
X-CSE-ConnectionGUID: 2b1rG96fTDOcSD3GKeqSig==
X-CSE-MsgGUID: MzjKApfITUGRZ9Pd9MmoaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29701558"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29701558"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:58:36 -0700
X-CSE-ConnectionGUID: 2k9FXQ3zRSuwJ08zNV3XbA==
X-CSE-MsgGUID: qcSLUtSoThCRJCnegElKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56316050"
Received: from dut152iclu.fm.intel.com ([10.105.23.86])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:58:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Bump the G2H queue size to account for page
 faults
Date: Fri, 19 Jul 2024 17:58:28 +0000
Message-Id: <6a9eaa520c06e49b6f4b259f0447d17635bf6bc1.1721411802.git.stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721411802.git.stuart.summers@intel.com>
References: <cover.1721411802.git.stuart.summers@intel.com>
MIME-Version: 1.0
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

With the increase in the size of the recoverable page fault
queue, we want to ensure the initial messages from GuC in
the G2H buffer have space while we transfer those out to the
actual pf_queue. Bump the G2H queue size to account for this
increase in the pf_queue size.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..3135f5812827 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -105,11 +105,19 @@ ct_to_xe(struct xe_guc_ct *ct)
  * enough space to avoid backpressure on the driver. We increase the size
  * of the receive buffer (relative to the send) to ensure a G2H response
  * CTB has a landing spot.
+ *
+ * In addition to submissions, the G2H buffer needs to be able to hold
+ * enough space for recoverable page fault notifications. The number of
+ * page faults is interrupt driven and can be as much as the number of
+ * compute resources available. However, most of the actual work for these
+ * is in a separate page fault worker thread. Therefore we only need to
+ * make sure the queue has enough space to handle all of the submissions
+ * and responses and an extra buffer for incoming page faults.
  */
 
 #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
 #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
-#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
+#define CTB_G2H_BUFFER_SIZE	(16 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
 
 /**
-- 
2.34.1

