Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEB7D72372
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 10:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B82C10EAAF;
	Fri, 23 Jan 2026 10:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="df20JBfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF5610E20E;
 Fri, 23 Jan 2026 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769165735; x=1800701735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oPaXnnHm/o3j9HT7RcM6ckPBzrhrkswW95xk2H7lKiI=;
 b=df20JBfdcOvcau69NtjtP5AAQPdt7XtfBJan6bOm/R4Ag+HUZrFDTTzA
 RL0AD68S6vhLjLhBIHnbkDtO3/Xse0BFwo6ehTjq+HVlWkpjsjo7IXNl3
 flJnaAXlFlhPTgk9EN0g72kbqep+xIR80W/qV/uocZSQd3jbo660Pla8p
 kHGWe8GiVBv5q61qIzyJ8Q8rR5BAfRYeRvyroNoybnnQtT/lQhNfE2EBT
 9e0ZC9/sP/mrLJP4L4viyR9DTB0qBQYCL3LBDwAR+l+Dm+ggDWGuIKHxp
 tHVTWqNOP++pn48iEaYlaRfojfaqdjDaJpizpworeGtKr8GB3+rhx9WH2 w==;
X-CSE-ConnectionGUID: mVdO160ORV6mjmRicoy7qg==
X-CSE-MsgGUID: 2cNIUnJ1Rw+GLU2sQuHQ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81529990"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81529990"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 02:55:35 -0800
X-CSE-ConnectionGUID: LtlqJDbTREGXdeB20LqyAA==
X-CSE-MsgGUID: 2h6bV1R5TLKimzh/+WTgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211461466"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 02:55:33 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 0/1] rename GEN6_PCODE_DATA to match spec
Date: Fri, 23 Jan 2026 11:55:24 +0100
Message-ID: <20260123105525.572035-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

This patch should be applied on top of [1].

[1] https://lore.kernel.org/intel-gfx/20260115113337.4079184-1-jani.nikula@intel.com

BR,
Michał

Michał Grzelak (1):
  drm/{i915,xe}/pcode: rename GEN6_PCODE_DATA to match spec

 drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/i915_reg.h               |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
 10 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.45.2

