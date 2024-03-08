Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E4FC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 04:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B3910F2B0;
	Fri,  8 Mar 2024 04:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeIjuG5N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B6510F2B0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 04:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709871832; x=1741407832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LUKPaDT6MnGbk0pQRK0KJqE5DaF2q9c+nCV83buv/5w=;
 b=FeIjuG5NFxWdymjZAcuJbkvtcWR4nuXeDEHkGZQkTt6HMDfwy1Kh5MSI
 Yjij+VNKu+mqPhMllrEPXJPfcxLNcG62UfDBDSLTX5l4YbRcfuMlhoDGu
 ZDScVC01lfLn1aJIBcH7xZF1x+iGk8KCOLjCb9lCCJjyr+hTWUDr+C9SG
 rtOd0Jk7D/QKZKjFEcDoAUjDS9cxID19oSjSeU/ZKIA3V/xlmsx9553Nd
 K5d7mCtuMoYJi1QC8rfYMF47eQtc9wXUsJVMa7hGFmm2EZcrl2b/CwTZx
 shHDf1qT3Aian8OPw+2Iwbe44gwWWg/zzSwdF3vX5YijCAPydo72+ZbNw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4431965"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4431965"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 20:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10456313"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 20:23:51 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH 3/3] drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
Date: Fri,  8 Mar 2024 10:06:51 +0530
Message-Id: <20240308043651.2010165-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
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

At label err_unlock_list the condition write_label will never be true.
Remove the deadcode line for write_label true.

Reported by static analyzer.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260d..acc066e405d0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -380,10 +380,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 err_exec:
 	drm_exec_fini(exec);
 err_unlock_list:
-	if (write_locked)
-		up_write(&vm->lock);
-	else
-		up_read(&vm->lock);
+	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
 err_syncs:
-- 
2.25.1

