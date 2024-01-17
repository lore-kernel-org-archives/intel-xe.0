Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124A0C47DA7
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF7A10E6E8;
	Wed, 17 Jan 2024 13:41:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869CA10E6D8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498876; x=1737034876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54WBSkvxOLtGdzlfcoGqWMi/L50V7njjh1dtCwHtcRQ=;
 b=PSPTCHNNjpAeb+G2f5ohSiuTx+gvxC89CW/OKV4YSkQQUTY2ase49VrQ
 3Fo3C1au+7iPbqajY0cF3hAJMUCqGiAIbH+knqv1a1Cda6ov6W3Qf4tAd
 sIydlTAD+4KJTMdM5cDS7X9YOoR4mVZGTAuAUmiWRCLsB6p36CjyfXkri
 XCCMEPpXuoHAjZPUaGIJk9CFuQUVZDDyzV8FCSev2GmW9oCt8BpDFwobw
 nrA7tHonNt8pxqhGvzksIRYTZbVMWYm9oHU8xllj5RQj4Xxwpej8sdEtR
 EQgT5IoO48fRABzr3ffl3A0YRq9Gb910H2Hmsvyc7YLykNLMGBumCELOl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549631"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549631"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831099"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831099"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe: Use a NULL pointer instead of 0.
Date: Wed, 17 Jan 2024 14:40:48 +0100
Message-ID: <20240117134048.165425-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The last argument of xe_pcode_read() is a pointer. Use NULL instead of 0.

Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6ef2aa1eae8b..174ed2185481 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -419,7 +419,7 @@ static int xe_hwmon_pcode_read_i1(struct xe_gt *gt, u32 *uval)
 
 	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
 			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
-			     uval, 0);
+			     uval, NULL);
 }
 
 static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
-- 
2.43.0

