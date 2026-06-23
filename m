Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827A2CDB471
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 20:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AA910EC90;
	Tue, 23 Jun 2026 20:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk9loByX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADBC10EC8E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jun 2026 20:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782246059; x=1813782059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c8DgIrHA336uC6jpk0IsQjbvOqtZuta3qi4sPzBTPe4=;
 b=Fk9loByXE0ipD3HDMIAKUSNxjL/vkhUDzBi59rG4TKOT6/PtjGLLEbZO
 PcdT9Rer4soUiW2Ld/bepGC0SFoeMIpiAsFJR/y3KRzimJHJ7qJWc5Y33
 bVx5gEz/JkNB2KxtVt/IUDqUFYa/ymTpW98upVNsdVtyEoX7mBeoM05fM
 j9nORc9Zn0Qd1JpfebpHD98QzZVRIoliB86684kcHkc8hmb7wlgWvqxsP
 GpHyZYfeFWZfBqmvYrK5+MbYBrQvpwOzL7C0I93aIbjJmX4xJ+POaRieV
 qLNWSUaNxUgSOCsacHs9ECwsG5Fghi2DEn7yvpXM4pRKnK9kF8zsQ6da6 Q==;
X-CSE-ConnectionGUID: ezU1RB/JSqKH4rojRxr32g==
X-CSE-MsgGUID: hhKZEhFJR2+l5PFtFG3zrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83001305"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="83001305"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:20:58 -0700
X-CSE-ConnectionGUID: oeZAfpUtTFalWB+mqY35Mw==
X-CSE-MsgGUID: QUR28mgiTmeXjZB1w4KOtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="273308612"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 13:20:56 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, raag.jadav@intel.com,
 andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v5 0/4] drm/xe: Refactor generic_handle_irq_safe() error
 messages
Date: Wed, 24 Jun 2026 04:20:49 +0800
Message-ID: <20260623202053.1023598-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Currently, all but one uses of generic_handle_irq_safe() report error
messages using .*_err_ratelimited() error reporting helper functions.
These helper functions declare their error messages in the following
form:

"error handling [COMPONENT NAME] irq: %d\n"

.*_err_ratelimited() already logs "error" as a part of the error
message, so declaring the error is redundant.  Reword it.

The last usage of generic_handle_irq_safe() is in xe_i2c_irq_present(),
and it currently lacks the same error reporting as in the other cases.
This is not intentional, so put some logging there.

While we're here, we should also update the XE cases to use
xe_err_ratelimited() instead of directly calling drm_err_ratelimited().
However, mixing drm error reporting functions with xe error reporting
functions in the same file looks unprofessional, so update all drm error
reporting functions in xe_heci_gsc.c and xe_i2c.c to use their xe
counterparts.

This includes updating drm_warn_once() to use xe_warn_once() instead.
Unfortunately, xe_warn_once() does not exist, so create it.

We should also update some of the error messages on XE to better report
the error codes while we're touching them.

v2:
- Split XE and I915 refactors, squashing the XE refactors earlier
  (Wajdeczko)
- Use different error message for generic_handle_irq_safe() (Wajdeczko)
- Refactor other error reporting functions on XE (Wajdeczko)

v3:
- Fix compile error (jcavitt)

v4:
- Update heci_gsc_add_device() error messages (Wajdeczko)

v5:
-Separate out I915 changes (Jani)

Jonathan Cavitt (4):
  drm/xe/printk: Add xe_warn_once()
  drm/xe/heci: Use xe print functions in xe_heci_gsc.c
  drm/xe/i2c: Use xe print functions in xe_i2c.c
  drm/xe/i2c: Report i2c irq handler issue

 drivers/gpu/drm/xe/xe_heci_gsc.c | 21 ++++++++++-----------
 drivers/gpu/drm/xe/xe_i2c.c      | 11 +++++++----
 drivers/gpu/drm/xe/xe_printk.h   |  3 +++
 3 files changed, 20 insertions(+), 15 deletions(-)

-- 
2.53.0

