Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA695C761AF
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 03:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF5B10F37B;
	Sat,  1 Apr 2023 03:03:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE5810E2BC
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 03:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680318187; x=1711854187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dGBXSSCAbWgPp+q6WtYFtgssbkIfKC+a3kTm+6miMDI=;
 b=C4I3lV429xoQD0ATNJs0TIh6vn6WLrkqNJeF3142UY5D7r3DFOtQFjHF
 2zf19NI3qBKdPQuVNhKPKSTcu3Pl7GHnyKhEiiPK5DHFo/0KiSjabE5Uv
 wB/yinaQhbllqIDx6MQoV2wGTDbabzhBApy35GLkAg1KtoQRsT/eWP+TI
 2dlioJSWEy27NY+PjVkOPBWOho4qUNI9VG/joMHKhzmoAuuMWmRjyi0LU
 Lbav+kPvXLqu8q3ggwyqrObZhtX5gk2gpH9CpkEmjunB1NO7qv6FaIQIa
 OLdEqhD6vSLrdpz54VG5AOM2Sj0qlVbM5MiyTj6tBMed+eK92NSFK3FrT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343284485"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="343284485"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828935677"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="828935677"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 20:02:58 -0700
Message-Id: <20230401030300.22568-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
References: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/tests: Use proper batch base address
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In xe_migrate_sanity_kunit test, use proper batch base address
by considering usm case.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 17829f878757..90f4e1c4f029 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -35,8 +35,9 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 			  struct xe_bb *bb, u32 second_idx, const char *str,
 			  struct kunit *test)
 {
+	u64 batch_base = xe_migrate_batch_base(m, xe->info.supports_usm);
 	struct xe_sched_job *job = xe_bb_create_migration_job(m->eng, bb,
-							      m->batch_base_ofs,
+							      batch_base,
 							      second_idx);
 	struct dma_fence *fence;
 
-- 
2.21.0.rc0.32.g243a4c7e27

