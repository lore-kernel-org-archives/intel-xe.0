Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196BDEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 05:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FFB10E1B9;
	Wed,  5 Jul 2023 05:34:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3C10E1B9
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 05:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688535267; x=1720071267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kd7KQYEjhS2KBvKveEhmuQfvPyCvMqbIzgeK/Vp0kq0=;
 b=YHovVGMmJg/SBg3xO/788zlDxUvDVH4JMsMSwdqN5gQOYQZHtUIoF5oP
 ERAlf/e1+R6R+9wmT2nkYbJuj7QowNil5paUxaKYqG62mekOGEVgLPKRD
 LLrKEk4ZVPGhTVHX8J9Glxpq47+8uhRNQXnQssISphRkTCjOVjenNdfFq
 FdvpmMUl9U2Qn//HNt8oTn77mL8PMS36/5PGOm0W/DlrB3CIKT0ZAaWn1
 pRLlML1KCQFY+MXATVOoTVJGNLC8/nwdIGeSxv0fLXP9Og2nsjyTAA0em
 BejL3QfhObSnQpe88ZcQGzo0PhOqxj1wVFfdE7xycMDxokqTaDnk1xkLa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="360732102"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="360732102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 22:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="863602202"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="863602202"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 22:34:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Jul 2023 22:34:38 -0700
Message-Id: <20230705053439.1442470-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Make page-table updates using the
 default engine
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

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

If the default engine m->eng was used, there is no check for idle and
a cpu page-table update may thus happen in parallel with a gpu one.
Don't allow CPU page-table updates with the default engine until
the engine is idle.

Reviewed-by: Matthew <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 55e113dd7e82..b2fa2cb5f537 100644
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
@@ -1259,7 +1260,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (!eng)
 		mutex_lock(&m->job_mutex);
 
-	job = xe_bb_create_migration_job(eng ?: m->eng, bb,
+	job = xe_bb_create_migration_job(eng_override, bb,
 					 xe_migrate_batch_base(m, usm),
 					 update_idx);
 	if (IS_ERR(job)) {
-- 
2.34.1

