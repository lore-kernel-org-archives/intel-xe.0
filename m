Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6446AC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 12:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDB710E275;
	Thu,  2 Mar 2023 12:43:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E7510E4DE
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677761007; x=1709297007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LTQzxR7ZG34bF0mnUuGepaAeI6GsECWsnfZ+i9zZdCY=;
 b=HJr4dTUhHDjItu9MCNyuFvJDEu8Oj0k5Gbhv3B64UOHKPD8aStHQVD5S
 Xl1HxHEQbzhZSt4jqC1LnMwk7Iq96J3gYaNxOYpR5b7PafKHLPkUuYWor
 xB4XM/xWMQkep2n96dphLBETuxOdaj/RrI+vyE9D7e9oCEaGPh0ffgyrK
 d45T8ictKcAl+TKd3j/cMZPr8ZrvJvAh5Vtl3LSCbJa6Kc0su0kOUdRrT
 rW/vwz+dy9gaBKb73Ngo+JPbextEKg5st23l6SUvQ0wqIyCs/Dni/uPxC
 Uw0qxCZ7B/mUEWJiliGHpyyuWVoS5Guc6vkImK5QG8i2NA0DfPQ3OFDy2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322982431"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="322982431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="707403014"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="707403014"
Received: from fathuddx-mobl.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.102])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 04:43:26 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 13:42:58 +0100
Message-Id: <20230302124258.91081-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
References: <20230302124258.91081-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/tests: Grab a memory access reference
 around the migrate sanity test
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

It appears we don't hold a memory access reference for the accesses in
this test, which may results in printed warnings and possibly the GT
not woken up for the memory accesses.

Add a memory access reference around the test.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0de17e90aba9..b7e4a126e8b7 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -366,7 +366,9 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 		kunit_info(test, "Testing gt id %d.\n", id);
 		xe_vm_lock(m->eng->vm, &ww, 0, true);
+		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
+		xe_device_mem_access_put(xe);
 		xe_vm_unlock(m->eng->vm, &ww);
 	}
 
-- 
2.39.2

