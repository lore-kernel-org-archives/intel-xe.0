Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3967C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590D10E5E0;
	Tue, 16 Jan 2024 22:35:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADB310E5F6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705444507; x=1736980507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wxb/ljJiD1axjKYMJjAlYxL6PyqedcBq30NwewR15Qw=;
 b=WHequaYBMGJ+E5lDVBazBkbfQlNhc8cN7s4SxEe503D1i50z4R9t5g1j
 RKGaLYl8/a8V1fHCK2QMW7J10tpne1Qli3RP7NjmrKNtd7MuAtPwPWf10
 fzoNEBwsnKegC4nEaCHdDPSLDY1OV3ZyCsiDmuJiS+nMoYA4Wy/D1hguu
 6FH5wWNwlKcY3mhf40Rq/+cZDCp+MfmjQYGqaZ6eq20ZUsrwUT1FOEaFm
 gNztOtTOKJCtioHx79fX2KQ6N7ObRg2/emt+DHFxYIuaM+e7IjB0ttskc
 8dS8ozaDvQJyj4Ms0p9HFNXuIHzUowcthuvC7s9xzMp4IF/Eg3+lVgelm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398873116"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="398873116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818306422"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="818306422"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:34:36 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/xe: correct the calculation of remaining size
Date: Tue, 16 Jan 2024 14:37:09 -0800
Message-Id: <20240116223709.652585-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240116223709.652585-1-fei.yang@intel.com>
References: <20240116223709.652585-1-fei.yang@intel.com>
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

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

