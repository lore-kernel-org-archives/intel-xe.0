Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134F8C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 17:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA22510E15D;
	Fri, 31 Mar 2023 17:10:07 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A310E15D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680282604; x=1711818604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VeDqgF+OWH1p7qYzu/gLmcOhu06M7SW0oNUOMdk1hug=;
 b=MxGTf0/io33RpRHoo+Zw2KozLEXOXluoMLCsphdM9p1DkQwpzFRZA4b+
 SsV+Q165ZAlY47zGkXKAADPZpzscHrUkvuj5igZs85kb9KHX/g3GuMVhz
 nj1RR9RI8PBmM+h4h66woIi1ab1iW0Ezkh/Xd1uuxUkC9tywHJxcYreyV
 8HmwS+NlH+IC2SrSZnS21Y79Ne4OZ6HbszzQviYp1pd6Pd6nnax2Vi+qo
 us3U0KibP1xN2YLnvvRFqcQALowfRogEYYcq/ZxZ5l9EcYbAaCjyBjZXp
 ExJWXfijLAGPCHSE7qBltdLF7OQKpFZ9A2RepFY2+bSfIVFwgYqxITbas g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="325490228"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325490228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809106390"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="809106390"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 10:09:33 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 10:09:23 -0700
Message-Id: <20230331170925.10883-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
References: <20230331170925.10883-1-niranjana.vishwanathapura@intel.com>
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 17829f878757..085ad96d7278 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -35,8 +35,10 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 			  struct xe_bb *bb, u32 second_idx, const char *str,
 			  struct kunit *test)
 {
+	u64 batch_base = xe_migrate_batch_base(m, xe->info.supports_usm);
+
 	struct xe_sched_job *job = xe_bb_create_migration_job(m->eng, bb,
-							      m->batch_base_ofs,
+							      batch_base,
 							      second_idx);
 	struct dma_fence *fence;
 
-- 
2.21.0.rc0.32.g243a4c7e27

