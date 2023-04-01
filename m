Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78188C761A6
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD59D10F35C;
	Sat,  1 Apr 2023 00:21:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272010E337
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308470; x=1711844470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RvinkQIuIZwAYZF6i2s+deGRwLueMRRVRbLjtvs7Oz0=;
 b=BrAFjpLuo7i+R8oEKwVqevSzzRZdkogCF5f6rahoHLeTAkfqp4tAPgE3
 wsUFQAgWvnGrBkt3gZD6AfI+dK3DVwcrDXCbrjjgsc4vgemNJHYFqEzNn
 Ivt1et7j78PlL+8MoJ+wDQUSS7Jbw+OwcCTb2JL/AlGIq4k0aUXHimwbL
 ERDIKdWwgT/OhRazRcyEDt02Yu57WICkTMtXLoQe8z/6y18yp5kIX9sSp
 FgaQgUdmLRYeq05pcUXjTIC6z2zno5D6RfpZ1CaGy2+3Ppv+8XiUOLVi6
 euR6kKO5AWBv/Z+a94fusJqiTwOqnz69LjjppvbwK4GC47L13cAisjs5+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="406624204"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="406624204"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859520521"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="859520521"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:21:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 17:20:58 -0700
Message-Id: <20230401002106.588656-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/8] Interrupt cleanup and future-proofing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A lot of the interrupt code in the Xe driver was copied directly from
i915.  Since Xe only supports Xe_LP and later platforms, there's some
cleanup and simplification that can be done.

Also fix one mistake that would have become a bug in the future if we
ever wind up with a multi-tile platform that also supports display.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Matt Roper (8):
  drm/xe/irq: Drop gen3_ prefixes
  drm/xe/irq: Add helpers to find ISR/IIR/IMR/IER registers
  drm/xe/irq: Drop IRQ_INIT and IRQ_RESET macros
  drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
  drm/xe/irq: Rename and clarify top-level interrupt handling routines
  drm/xe/irq: Drop remaining "gen11_" prefix from IRQ functions
  drm/xe/irq: Drop commented-out code for non-existent media engines
  drm/xe/irq: Don't clobber display interrupts on multi-tile platforms

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  42 ++--
 drivers/gpu/drm/xe/regs/xe_regs.h    |  25 +--
 drivers/gpu/drm/xe/xe_display.c      |   4 +-
 drivers/gpu/drm/xe/xe_guc.c          |   6 +-
 drivers/gpu/drm/xe/xe_irq.c          | 288 ++++++++++++++-------------
 5 files changed, 180 insertions(+), 185 deletions(-)

-- 
2.39.2

