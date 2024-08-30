Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D08CA0EDF
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 05:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134AD10E7C8;
	Fri, 30 Aug 2024 05:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6PbsnX5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97DB10E1CA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 05:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994344; x=1756530344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2MWKB+H9iQS4wlQaBnFo/N6Wuv9UWM7dYDasP3KB2s=;
 b=I6PbsnX5mqK81cJmPnVnGDPu5y3wWlnpdBfp4O1mazQ74vKF4pk5ADeZ
 Y7Cau+iHYVAiUDFB9938tsOWAg9oF7zyyzZUWk0Uf+U1sWbilPnBuSOC4
 OLyqodMBB8rEZq7aIDuIpfsl9oRiE8M7iUQJBAYe9TSeVDkkeGxiIwbBs
 tSLnC3frw7IQqAazgfbE47CXYKLEARfivbj7Tgbm72RZMXyT4HtoMId8C
 nH17+ikSoQpAhvzbWs3YyDcV1NvOwwoMqGzJRTpyCAeXH/MwTKuGD5kyY
 HdIVv6EL+9FjP2/iCoM/0LI1wx96U9arGpv+nV4WQPxVthKs7hU/Z+MTv g==;
X-CSE-ConnectionGUID: FMtvKZOxSimiMXMVWv0u+Q==
X-CSE-MsgGUID: 8cOVi6a6R1aNuxJVTBOCHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="49006477"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="49006477"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:05:44 -0700
X-CSE-ConnectionGUID: pjXIFcv3Q7KT+rz8AVlvbQ==
X-CSE-MsgGUID: L5jH1/8ETTKyFB678NsaNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="101301975"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 29 Aug 2024 22:05:41 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [RFC 2/9] drm/xe: Ensure __must_check for xe_force_wake_get() return
Date: Fri, 30 Aug 2024 10:53:19 +0530
Message-Id: <20240830052326.3707019-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
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

Add __must_check attribute for xe_force_wake_get().

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 8aa8d9b41052..9949f2d7ee63 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -162,8 +162,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  *
  * Return: 0 on success or 1 on ack timeout from domains.
  */
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+				   enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..8939fc0fd09f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+				   enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 
-- 
2.34.1

