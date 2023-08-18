Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A25EE499D
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6431510E585;
	Fri, 18 Aug 2023 22:08:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD5B10E0E8
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRrsovWrSz/GG0Q6LxOhrjEzbhR5K1PwrUauf6LDjaQ=;
 b=N47SRIHbWUcQgWcw7kDv5W15M9pqH5CaSnjNiaExU9xd/8iIofuRwX1c
 8mS4wfpIruUlJncVSGnI8+Ehf75USJdWxQqzwlokU8whGhDhg6jDldrfh
 6vBLVzihCnd/ouOhscvkiLq3LDJjeK5CQKRoph4nuHh8VRmFUf+uAvXZK
 kr6gxZwIwr8voIN5ZXFfiE+5zUPA5oA1wVsf2knv1HQh2u/+9v5hCMuNH
 OTTC/6ZpKhYM27Pr04hp96XguDYKJy4iAOGyYMhCzlWSuC6+3e1ZoFeu8
 15v9BkWalVt6AWcwIHTTTc5QdPikhKT3iG8iwwMjtcEIvqfftPaE9TOug Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592997"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592997"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758219"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758219"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:24 -0700
Message-Id: <20230818220824.700519-16-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 15/15] drm/xe/lnl: Hook up MOCS table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

LNL uses the Xe2 MOCS table introduced in an earlier patch.

Bspec: 71582
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index c120090ef9b4..75d025c54eb8 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -395,6 +395,14 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_LUNARLAKE:
+		info->size = ARRAY_SIZE(xe2_mocs_table);
+		info->table = xe2_mocs_table;
+		info->n_entries = XE2_NUM_MOCS_ENTRIES;
+		info->uc_index = 3;
+		info->wb_index = 1;
+		info->unused_entries_index = 1;
+		break;
 	case XE_PVC:
 		info->size = ARRAY_SIZE(pvc_mocs_desc);
 		info->table = pvc_mocs_desc;
-- 
2.40.1

