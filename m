Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E02CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 21:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CF0112C1D;
	Fri,  5 Jun 2026 21:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmBL8dS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0B112C1D;
 Fri,  5 Jun 2026 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780693540; x=1812229540;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=86CcQQ2ImdJlzBxYdhiby7/VvR7wwXBhITaaIuea/9M=;
 b=kmBL8dS5zJyespEEJAm5iZjWO3P4G9WWYRPjb9Bvdb42nD1VXc9CCmQl
 l3Gk1qRJIiDcrSNii6IzN6zMq6uWiUrSWRYdc6siTzpNN+Z36kf64aweE
 Dk4C9uHpAj/JXG77+qkNiVsr+KsNzq14uf1FrKeDOcVN8dKUsdteV3Zo9
 j2BBqpm1rGFz3XHkXcfMexTbNpR8b1tdT2VoteQflCItBlCLyPq+F3kjP
 DgtxoADkvm+p79O/3C9cSz+QBhYOqyA9Km/gkgYAocVDMP/RgSlepExRu
 phnhqIMvNa0WT+BEiaFDts3I8VmOUufozYI7g8mefg/ijYmKbK1CjdICR Q==;
X-CSE-ConnectionGUID: YRZN1BJVQRae7JByJQkO/g==
X-CSE-MsgGUID: ICEgDrqURQ2v6e/FhoxmwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="69064541"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="69064541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 14:05:40 -0700
X-CSE-ConnectionGUID: rZ+yuXKbQH2EpgWmgWlrRA==
X-CSE-MsgGUID: QtXR7vjgQjSBxHCVTqc9nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="244994690"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 14:05:38 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v3 0/5] drm/{i915,
 xe}: Refactor generic_handle_irq_safe() error messages
Date: Sat,  6 Jun 2026 05:05:29 +0800
Message-ID: <20260605210534.3843211-1-jonathan.cavitt@intel.com>
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

We should also update some of the error messages on XE and I915 to
better report the error codes while we're touching them.

v2:
- Split XE and I915 refactors, squashing the XE refactors earlier
  (Wajdeczko)
- Use different error message for generic_handle_irq_safe() (Wajdeczko)
- Refactor other error reporting functions on XE (Wajdeczko)

v3:
- Fix compile error (jcavitt)

Jonathan Cavitt (5):
  drm/xe/printk: Add xe_warn_once()
  drm/xe/heci: Use xe print functions in xe_heci_gsc.c
  drm/xe/i2c: Use xe print functions in xe_i2c.c
  drm/i915: Refactor generic_handle_irq_safe() error messages
  drm/xe/i2c: Report i2c irq handler issue

 .../gpu/drm/i915/display/intel_lpe_audio.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  2 +-
 drivers/gpu/drm/xe/xe_heci_gsc.c              | 21 +++++++++----------
 drivers/gpu/drm/xe/xe_i2c.c                   | 11 ++++++----
 drivers/gpu/drm/xe/xe_printk.h                |  3 +++
 5 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.53.0

