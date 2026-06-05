Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A6CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 20:40:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A08F10E1D7;
	Fri,  5 Jun 2026 20:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zus27F8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9910E1D7;
 Fri,  5 Jun 2026 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780692053; x=1812228053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6cRHnpiL2DBNugmKhSaWCor5NtHXJlnvRi1KitjMd60=;
 b=Zus27F8p746poLFMYfOMyFSewHHF3tp2prR85DiaaDMpog3hhyca/xyZ
 dVqMhdxmTtJuSdgwff6lxh/l+Z6EpyuLeQlMjHU+vCUfK0xA7RISHJgla
 GdQMoSl7yXqV/6ZOB46LjP+5ru38ycddkVIvndWm4Y6bJLgybwJ3hEaCl
 H2Bb74bMhC32zbCyfxgRZ+uCmRFmGQ4rdVtr2KqsR1u0iDSbrAgFlJPxK
 XYk0l59XUdj2syjVBUNe2ItiTLT0dmde0cPLtDdvzX46Hvty9lKm5Pdc/
 xJht+bD5EmS5LlyKOHj1k/8NCq7WZSiDw6j1/HjmXhVR0F4Te9Z0MnCSI w==;
X-CSE-ConnectionGUID: VQ+W9TffQhazfkprBdMR+g==
X-CSE-MsgGUID: yJ3Y/WyMQGCOfc50h47xGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="84108048"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="84108048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:40:53 -0700
X-CSE-ConnectionGUID: +9UkhW11SPiHO6FjwYnjEw==
X-CSE-MsgGUID: /rfK7xmPTl6gBPWvhNjLEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="243839387"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:40:51 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v2 0/5] drm/{i915,
 xe}: Refactor generic_handle_irq_safe() error messages
Date: Sat,  6 Jun 2026 04:40:42 +0800
Message-ID: <20260605204047.3840459-1-jonathan.cavitt@intel.com>
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

