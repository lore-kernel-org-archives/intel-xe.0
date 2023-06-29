Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5E8C001DE
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EA210E3EC;
	Thu, 29 Jun 2023 20:51:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA9810E3EC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688071911; x=1719607911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXKrpTq6m27asey7hDxRU1GZvXiE4IWdvaotIYXHmG0=;
 b=DTJxImrApNRzWauzpNtOKZmAMBCotqLrh0yUWMwEwLrgSUQ+8AVAhLvZ
 SftLNZfE+Hugys464pvlpjjwXJjiNdKKFxU4+aWJzZRLklWQLGmtDWqsW
 YwIvzRttlaCk2hpHklHNGU4Q3RBpRzF2eVkOAfJ4YfeWUD1tR/J3CoZrL
 COIpqnpWKEpal4k5+eCvBqU/0MUuPMsy25P1LQlpPM+IXdfC9Y483gUx5
 drVuEP/z6DAr1c9K/kSK9FsXS0oTySq6KFNuFxGvakvCO0LoUUKyNtcNX
 I88x91PIBTOeuk41eYOvba4UAp2CH94QsUgSLa2P5vbYIq+NJDcmy0Svl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="448605254"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="448605254"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711577964"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711577964"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.200])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:51:50 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 29 Jun 2023 22:51:33 +0200
Message-Id: <20230629205134.111849-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
References: <20230629205134.111849-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Make page-table updates using the
 default engine happen in order
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

If the default engine m->eng was used, there is no check for idle and
a cpu page-table update may thus happen in parallel with a gpu one.
Don't allow CPU page-table updates with the default engine until
the engine is idle.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 55e113dd7e82..41c90f6710ee 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1160,9 +1160,10 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	int err = 0;
 	bool usm = !eng && xe->info.supports_usm;
 	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
+	struct xe_engine *eng_override = !eng ? m->eng : eng;
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && (!eng || xe_engine_is_idle(eng))) {
+	if (no_in_syncs(syncs, num_syncs) && xe_engine_is_idle(eng_override)) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
-- 
2.40.1

