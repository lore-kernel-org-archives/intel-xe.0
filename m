Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF11C77B61
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 03:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1610F37E;
	Sat,  1 Apr 2023 03:03:13 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E7010F37B
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 03:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680318188; x=1711854188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e+KQIHVjAmqwNeozcCMiQ88LGl0ZYauTkjW0HQdRPFc=;
 b=kt85gFGMaWd+3luDP+0okKUo+1q6NGQeXT0jdugQW5tAJgRdXattzRDR
 Fc5cf2iMfXxSn47bh6Y9Z8Euawj4cN8ePkpKW5ZwvQrDXSx3bp+VaCxAC
 qObW74JGCd7m4UcWXuQCms6D8hMIBPJ8cC/Iqc5buqEQzpoYfoqYr8Ah5
 2Pz3GfWgoIT8DtQAH8Srl0LnYmwcSMsuvaqPP6/+5WpEpS1H/0iK3RRfo
 Ortpv7cOdWiWpufujbPq9kvQYsZTRVNj9/bjlmU/B8JyN8uj2/s2kUcXa
 TOHg3omkTbqYJdPvLkbvsPcFX20utdzvBiyxvomTE0BHZ5hYKvX/6iwNJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="343284486"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="343284486"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="828935680"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="828935680"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 20:03:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 20:02:59 -0700
Message-Id: <20230401030300.22568-3-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
References: <20230401030300.22568-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/tests: Set correct expectation
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

In xe_migrate_sanity_kunit test, use correct expected value from
xe_migrate_copy() operation.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 90f4e1c4f029..862d11b2210f 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -147,6 +147,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xc0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
 
+	expected = 0xc0c0c0c0c0c0c0c0;
 	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
 				bo->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
-- 
2.21.0.rc0.32.g243a4c7e27

