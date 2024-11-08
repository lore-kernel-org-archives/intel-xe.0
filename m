Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A47D5E130
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 05:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6BD10E1CA;
	Fri,  8 Nov 2024 05:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/RkHWZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E67110E1CA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731044628; x=1762580628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YKXIIpQcQEHlQvwyyTTTnf1O3UHXEhIi08aZswFpo3E=;
 b=P/RkHWZjlNDw/GAk10qP5/t0t1t6BMX66qZHG/FeASqnRRgImUXjrRGJ
 My7POnwneO46HOT7lv2FgvZx+h7KqFQCNnqR+U8h4V5iIXfJ4edHDNOvB
 LOOJ4rlvD8UoA4UqSXe/ExLw8tpCjXnyVSFaIGU9cZ3ywTValIoEaj1xn
 fwsYirAbSc6h8yIhliBTa9s+vS7LDZFYZkzoEx+GmgWwB7SCId83Fht9a
 A7/TW1a19Qp4mVC+smzDBTUDD6JVJz4Q9Mp6BT96MwOtSER1ModZHDHNe
 PS7QX5E+jxG5RIcGiTJ+S4tOfytm6TQDqzeo6LGypW9wBOzriJCl6Q6xZ Q==;
X-CSE-ConnectionGUID: KoVFgVRRSyuBMbCl4YWJtA==
X-CSE-MsgGUID: 28aXQ0E3RiqA1TnyzDkPsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30690876"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30690876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:43:48 -0800
X-CSE-ConnectionGUID: oZ7D7U3rQPex/8JZYsbwEg==
X-CSE-MsgGUID: 0BS0l8WSSCaLTkg09hCzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="85312745"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 21:43:48 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Increase sampling period
Date: Thu,  7 Nov 2024 21:42:36 -0800
Message-ID: <20241108054236.3484396-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

This reverts commit 4f79f059766c ("tests/intel/xe_drm_fdinfo: Half the
execution time") and goes in the opposite direction, doubling it.
Although in some machines we pass consistently, others like LNL
show sporadic failures.

Even after changes in the kernel to improve it, it still shows those
failures. Also, the failures can be much more frequent by stressing all
the CPUs. Raise the period to reduce the error introduced due to
additional scheduling delays. This shows a good improvement on LNL that
doesn't fail anymore without CPU load and fails once every ~200
iterations with 100% CPU load (vs once every ~3 iterations).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 5fd7c0416..ef9273e2a 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -82,7 +82,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC);
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.47.0

