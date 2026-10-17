Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6266ACCA463
	for <intel-xe@archiver.kernel.org>; Sat, 17 Oct 2026 03:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F010E345;
	Sat, 17 Oct 2026 03:19:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC08B10E345
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Oct 2026 03:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792207150; x=1823743150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oSS1/8MfTcoAblUcziWotPhaazU0ZcNOtq0XOOjRjwI=;
 b=kWbl/e1/jF+rxClteSgkvOgZdEWmkn+rVqv1Miz+GcqQqkTtw7GghK/u
 c0sRF+9NRSFP0o+GqhoNoEX1SeZa4EGLSOgr7AUb7NXjwKrqUfOi1R/Z/
 x3TpCCi+kPHIM88SrufRLYvmH5Thk+BGha8P6+ImmbFbD/203mqKyYaJ3
 jue9HS8LQ1cYti3qr4SexYV9pA7q8MU9SHUHN7WwVxYAG6hrRKVpVIBFw
 JviHaoFROq8FLmsIex1Ta58hIpirtYJpl3lrXIlDcw1NticGrR8KJY0bm
 amxk2HvJWKxHYUA4IiN9aMa64u/9TNwqK94M+D31wgCWh26GidQ0WaQNc Q==;
X-CSE-ConnectionGUID: cW2BrkOGQJ+iX4TfurCmbg==
X-CSE-MsgGUID: LOUPNoROR/WJDugs0EEsVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="982112"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="982112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 20:19:00 -0700
X-CSE-ConnectionGUID: IkVcEftEQgOGgxZqi1G7tg==
X-CSE-MsgGUID: rvMJaU7YRiOjwLW2bTwi+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2556677"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2026 20:18:59 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 3/3] drm/xe/query: use delayed forcewake release for
 engine-cycle queries
Date: Sat, 17 Oct 2026 03:18:56 +0000
Message-ID: <20261017031856.2723986-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017031856.2723986-1-zongyao.bai@intel.com>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
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

Engine-cycle queries are issued repeatedly by profilers such as VTune and
PTI to correlate CPU and GPU timestamps, for example through Level Zero
zeDeviceGetGlobalTimestamps(). Each query wakes the engine forcewake
domain and puts it to sleep again, and waiting for both acknowledgments
dominates the latency.

Release the domain with xe_force_wake_put_delay() so that a burst of
queries reuses the awake domain instead of waking it again. Other forcewake
users keep releasing immediately.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..86c4e1dfc101 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -157,7 +157,7 @@ query_engine_cycles(struct xe_device *xe,
 
 	fw_domain = xe_hw_engine_to_fw_domain(hwe);
 
-	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
+	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
 		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
 			return -EIO;
 
-- 
2.43.0

