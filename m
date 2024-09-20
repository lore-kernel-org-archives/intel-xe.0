Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B942CF9C5D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 17:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A2310E85A;
	Fri, 20 Sep 2024 17:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aS3KXBzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A82910E85A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 17:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726852363; x=1758388363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mVre0nVijNp48GcwuMFYonrGlAyoabC9aHlpmrWlGo0=;
 b=aS3KXBzhFqY9FNMZeRG9YvQF/KG0rudzFBVmGI/o14NZ38YN4XwT//43
 18UvjoZ0IKnBb+LCLpSmpYvqrWbsnTKp8IBrSQKOw9vdofC2XVFKXrTIT
 qSPR4TXd6DWcrg/tQsbzOyEHcvvTO0NtOoLHE7rRbOsxbtkOBfSzcjl7p
 UHTwnSKpzo/A/iNyb7KW9FXRcKTxGkYPA4/ekn8zWUFSsPrAdVC32GFPC
 AkDOwCazw7S6QVqyYo3Te2undRvgsgleZk95C1owGGn5slMjNrrnvzdMR
 VOyRU39GQ6p0zWelhUONs0ygOb5fIZzqtsWb2nOKg2nKHMsx7RfWdiCyY w==;
X-CSE-ConnectionGUID: WTyx4+maQlCpuXIOeHGgFw==
X-CSE-MsgGUID: hsa85JA9ROqmmxv6ItXDlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29763880"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29763880"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:12:43 -0700
X-CSE-ConnectionGUID: Zk7Xpk+7QgOEl32Zwl673A==
X-CSE-MsgGUID: S8GT/iFRTqKNLbUNSPWcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="101220757"
Received: from iweiny-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.110.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:12:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 1/4] drm/xe/mcr: Use Xe2_LPM steering tables for Xe2_HPM
Date: Fri, 20 Sep 2024 14:12:08 -0300
Message-ID: <20240920171223.64969-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240920171223.64969-1-gustavo.sousa@intel.com>
References: <20240920171223.64969-1-gustavo.sousa@intel.com>
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

According to Bspec, Xe2 steering tables must be used for Xe2_HPM, just
as it is with Xe2_LPM. Update our driver to reflect that.

Bspec: 71186
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 2671ce6b1a76..4c0767403881 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -441,7 +441,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
-		if (MEDIA_VER(xe) >= 20) {
+		if (MEDIA_VERx100(xe) >= 1301) {
 			gt->steering[OADDRM].ranges = xe2lpm_gpmxmt_steering_table;
 			gt->steering[INSTANCE0].ranges = xe2lpm_instance0_steering_table;
 		} else {
-- 
2.46.1

