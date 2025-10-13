Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0B5CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D6E10E4AC;
	Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cs7wAKCh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE1810E4A7
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372713; x=1791908713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cYT3m9pdKeEdqMqybQDK9IJYCp95QfmTgU0Dxt5BRc=;
 b=cs7wAKChkLxGD43o9wCE9BkfL8ie92MFeTWHNhe9vrItkb8WXhDY82+t
 CgATtjCbH4x1AhsGXazcN38ZRN475y30Lt40zxY+3rPEdW10o0UPGqtkm
 GB3oDzFl5NdsQN0GgKrYnS9Ub/dZikKFYmE9KWOUuIDSbmVUsNaYV9ocp
 6uIG6HZluKavTwGAdKEeYjR/H/ry5IzjC9xGCE1QgWgsVAtXTkEMzGTZp
 rF35piaZMqphOPvVlBrnEyJ6Kk1Yuc8JsNY0ng6+iwlEpXkQkYEucNoIX
 3eNRn3n6mdKdz2Q0s/+utija27WwY4yxoSuEQlr/vVerqAoBcT1IK4gaB A==;
X-CSE-ConnectionGUID: mUf67fU4Q9uWse8yMksslg==
X-CSE-MsgGUID: NsRjTl6+R9GMADE+8FFjnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73963501"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="73963501"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:13 -0700
X-CSE-ConnectionGUID: r0IrwrvOT6qhMRbyhHFr3w==
X-CSE-MsgGUID: atJjNO0tRYubAPLL9nFisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185651410"
Received: from dut4084arlh.fm.intel.com ([10.105.10.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:25:12 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/7] drm/xe: Correct migration VM teardown order
Date: Mon, 13 Oct 2025 16:25:02 +0000
Message-Id: <20251013162504.7768-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013162504.7768-1-stuart.summers@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
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

Adjust the sequence of the migration teardown to match what
is happening in the init() function.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7345a5b65169..b1747e442a7b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -100,8 +100,8 @@ static void xe_migrate_fini(void *arg)
 	xe_bo_put(m->pt_bo);
 	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
-	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	xe_vm_close_and_put(m->q->vm);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
-- 
2.34.1

