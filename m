Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9439CC54FB9
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 22:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631B110E778;
	Fri, 17 Nov 2023 22:52:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2726010E778
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 22:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700261531; x=1731797531;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eVRVZTtbXN6+IhllgbGN2XemYrKMVewcBfzjxeuX9aw=;
 b=ixnT5vPazEWQSJ1sGuF8J8ANTReeqQImyduyxveGKF/O0gy6vvPqHyva
 VflLi67xDVzZnmUcaJ7PuCkrshr1Gbo2zb5FJrqHrLMGZCX9xHFdjvHpr
 rZiMIrvaQeEz7ZzbEKdttRZ9kyoY4POwQ+2iBqiNYrukXYWcvS6S3xs67
 18sKR3w0Vi7zf1o2ILZVuRfg1QrsYhi0StqslPnzS8WBTLQfoAKjaPrwn
 fgU9h519ydX+77fyMQfxkQDI1Qa1RQGRjvSPNEc+XArbTX8sC9desoFYl
 Y28ZO4nNk0l4Jl7+Tr3eGSd2Wq+UMGFA1Msuk5+GTaRs1aaiIMO3aZeDf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4465516"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4465516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765736087"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="765736087"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 14:52:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 14:51:43 -0800
Message-ID: <20231117225155.2614535-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 01/10] fixup! drm/xe/guc: Report submission version
 of GuC firmware
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

Major GuC versions greater than 70 will have the submission version in
the herader irrespective of their minor version number.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3032c4f148d4..91d4a2272ee7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
 	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
 
-	if (uc_fw->minor_ver_found >= 6) {
+	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
 		guc->submission_state.version.major =
 			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
-- 
2.41.0

