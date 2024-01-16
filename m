Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15274C47258
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 20:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7410E449;
	Tue, 16 Jan 2024 20:01:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EE710E549
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705435312; x=1736971312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOdzF+Hr8r2FZrHJbcsXIu9tdNgd5F1WxAb0VtXN3Ns=;
 b=WC3bPxr+ih3AW26oIviGNzlqgbklw1R2RnDWBT183jkyXJYUx4mEw26M
 Klk1dpgFrVIqgzCJu77FSc8fom1Z90NjvmhokAUhF0VOLB4hT2JhbHTa6
 um99HdjmXZlKZOYu06YAyKqpLltC1+upixMt1UBrAzHmGFHYWFxydSMh6
 0HBrdVjkImJGpopgQ7GSPNghxNOY351PPBcs+fYFANr79setdj/41lKJz
 R2oOdFm4Z4DRu5CXoGt64tYICwwEOl27VURWS/jaszAXFCpsQimwcz7AI
 g4SWsltKaxmJ7v9qBnTvhq+l9sVYezXoYv7GBtrNBNR4wBEmW4P3zYbpU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398840653"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="398840653"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="26245265"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 12:01:52 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/xe: correct the calculation of remaining size
Date: Tue, 16 Jan 2024 12:04:24 -0800
Message-Id: <20240116200424.651661-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240116200424.651661-1-fei.yang@intel.com>
References: <20240116200424.651661-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In function write_pgtable, the calculation of chunk in the do-while
loop is wrong, we should always compare against remaining size instead
of the total size update->qwords.
Also, when performing dword writes, dword length can be any value
from 2 to 3fe, always adding 1 is wrong.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index c74ceb550dce..415609b070fb 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -36,7 +36,7 @@
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
-#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, (x) + 3 - 2)
+#define   MI_SDI_NUM_DW(x)		REG_FIELD_PREP(MI_SDI_LEN_DW, ((x) > 1) ? (x) : 2)
 #define   MI_SDI_NUM_QW(x)		(REG_FIELD_PREP(MI_SDI_LEN_DW, 2 * (x) + 3 - 2) | \
 					 REG_BIT(21))
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 44725f978f3e..d5392cbbdb49 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1116,7 +1116,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
 
-		chunk = min(update->qwords, MAX_PTE_PER_SDI);
+		chunk = min(size, MAX_PTE_PER_SDI);
 
 		/* Ensure populatefn can do memset64 by aligning bb->cs */
 		if (!(bb->len & 1))
-- 
2.25.1

