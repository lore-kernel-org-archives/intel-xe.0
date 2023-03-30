Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EB5C77B6D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BA310EF7E;
	Thu, 30 Mar 2023 18:24:35 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F33B10EF73
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Mar 2023 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680200673; x=1711736673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rmKG7n5aU9NMoBWwHfsKJSTDkSh7eafKWlc5fPmmC/E=;
 b=fGOX/ZWRavJsjCvS+oThVcMLSjheudlf7OcZg1xi9xrB9f6Defku/oik
 IAWAZBJ3CEzuqC/BctYwYlY0iuluCyKu+xwzAbeNA50mHhLIkd4Cll+My
 +QYJnbMu/pyyTTdWYazEePIVOlUOWgAHIluf6eIU8RJ86uQAJW9V6VcwC
 pzsqUPDAJpJbvLSaKpNgHPFFZ1VNx4Y9Q4gnUvqSScHIea5ZVNFCBQ/Io
 RqpkF7DWgfnLBE58VQHxOjP1ZsJ52HVLDwLS3BsIRGerZgh+bALNEBX3t
 uXu5IcCK0nkWylUmh2ZjZCUoPmhob4wQ+kCZCAPj3s4EvKfMAM4A37vhs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321641475"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="321641475"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="635021772"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="635021772"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 11:24:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Mar 2023 11:23:57 -0700
Message-Id: <20230330182405.43993-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] Interrupt cleanup and future-proofing
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A lot of the interrupt code in the Xe driver was copied directly from
i915.  Since Xe only supports Xe_LP and later platforms, there's some
cleanup and simplification that can be done.

Also fix one mistake that would have become a bug in the future if we
ever wind up with a multi-tile platform that also supports display.

Matt Roper (8):
  drm/xe/irq: Drop gen3_ prefixes
  drm/xe/irq: Add helpers to find ISR/IIR/IMR/IER registers
  drm/xe/irq: Drop IRQ_INIT and IRQ_RESET macros
  drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
  drm/xe/irq: Rename and clarify top-level interrupt handling routines
  drm/xe/irq: Drop remaining "gen11_" prefix from IRQ functions
  drm/xe/irq: Drop commented-out code for non-existent media engines
  drm/xe/irq: Don't clobber display interrupts on multi-tile platforms

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  42 ++--
 drivers/gpu/drm/xe/regs/xe_reg_defs.h |   8 +
 drivers/gpu/drm/xe/regs/xe_regs.h     |  25 +--
 drivers/gpu/drm/xe/xe_guc.c           |   6 +-
 drivers/gpu/drm/xe/xe_irq.c           | 280 +++++++++++++-------------
 5 files changed, 178 insertions(+), 183 deletions(-)

-- 
2.39.2

