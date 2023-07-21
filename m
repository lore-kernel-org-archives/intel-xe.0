Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F37EB64DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 13:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072C310E088;
	Fri, 21 Jul 2023 13:20:50 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436C910E088
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689945648; x=1721481648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3QZRNLDQrHpF7c1D1SEAoSQzW4sG4rQ3rFiJsUbt3Jc=;
 b=PPezQLCguizCG2+WAJxaEJUrVHxfbd4iQRefLPNJNpcwv5aCzG8BtMYP
 fphrzAYYUv9f4ZI+4bBc0gRem4Q4f189upz+P4l/d8uxi7ytkZq6lFFrl
 SoUoDQhJRcOTlahqTNr60WBQndLx7udDUfN4RK/UHKpj7p0mAYdtKs2/m
 TRGjKga8GsFTceRc3S96833onkNauKJxcYmJIJMLNo3rgoXAzbWH+SbtR
 QrNihPGpPr43bsvdR/lYqIMJjTuefNHWRS6MKteNhoimk1RRsZ6vYDyh8
 c/7V8NYrCKQD+Dr3S/UCNL7VM9QwVgetnZvH2lWiLnLsEDfe8/Fo9hcmT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365914365"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="365914365"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:20:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="675043833"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="675043833"
Received: from agobando-mobl1.amr.corp.intel.com (HELO f5a11c4ff530.intel.com)
 ([10.249.37.51])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:20:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Jul 2023 13:20:29 +0000
Message-Id: <20230721132030.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Remove uses of BUG_ON
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a first pass on removing BUG_ON. It is replaced with a call to
drm_err() and a return. Feedback on this is welcome before removing
remaining uses of BUG_ON, which will require more manual and specific
work.

For this pass, most of the changes were automated with coccinelle using:

	@notpossible@
	@@

	- XE_BUG_ON("NOT POSSIBLE");
	+ drm_err(&vm->xe->drm, "NOT POSSIBLE");
	+ return -EINVAL;

	@e@
	identifier macro =~ "^XE_BUG_ON$";
	expression cond;
	@@
	macro(cond)

	@script : python q@
	cond << e.cond;
	cond_expr;
	@@
	coccinelle.cond_expr = cocci.make_expr("\""+cond.replace(" ", "")+"\"");

	@replace_in_func_return_struct@
	identifier e.macro;
	expression e.cond;
	expression q.cond_expr;
	identifier func;
	identifier a;
	@@

	struct a *func(...) {
	...
	- macro(cond);
	+ if (cond) {
	+ drm_err(&xe->drm, cond_expr);
	+ return NULL;
	+ }
	...
	}

	@replace_in_func_return_void@
	identifier e.macro;
	expression e.cond;
	expression q.cond_expr;
	identifier func;
	@@

	void func(...) {
	...
	- macro(cond);
	+ if (cond) {
	+ drm_err(&xe->drm, cond_expr);
	+ return;
	+ }
	...
	}

	@replace_in_func_return_other@
	identifier e.macro;
	expression e.cond;
	expression q.cond_expr;
	@@

	- macro(cond);
	+ if (cond) {
	+ drm_err(&xe->drm, cond_expr);
	+ return -EINVAL;
	+ }

Francois Dugast (1):
  drm/xe: Remove uses of BUG_ON

 drivers/gpu/drm/xe/xe_bo.c                  | 105 ++++++++++++----
 drivers/gpu/drm/xe/xe_bo_evict.c            |  10 +-
 drivers/gpu/drm/xe/xe_execlist.c            |  22 +++-
 drivers/gpu/drm/xe/xe_force_wake.c          |  10 +-
 drivers/gpu/drm/xe/xe_gt_clock.c            |   5 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c          |   5 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  31 ++++-
 drivers/gpu/drm/xe/xe_guc.c                 |  32 +++--
 drivers/gpu/drm/xe/xe_guc_ads.c             |  35 ++++--
 drivers/gpu/drm/xe/xe_guc_hwconfig.c        |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          |  95 +++++++++++----
 drivers/gpu/drm/xe/xe_huc.c                 |   5 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  61 ++++++++--
 drivers/gpu/drm/xe/xe_sched_job.c           |   9 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c      |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 125 +++++++++++++++-----
 drivers/gpu/drm/xe/xe_wopcm.c               |  45 +++++--
 17 files changed, 482 insertions(+), 128 deletions(-)

-- 
2.34.1

