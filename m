Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FFEF54AC6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDFD89CFA;
	Tue, 24 Mar 2026 14:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlREhI2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E79189CFA;
 Tue, 24 Mar 2026 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774362877; x=1805898877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nN6hm2558mVgVQxClt1FvCWVtgkPcKbDyCMLAVpcJyI=;
 b=PlREhI2AQ/qUDMsrwr/XOgtGa3b6ksxrvFrSQiWXlBlIqZER6Xjsnl6d
 sgqxEuFCZNOAFw7ZZjQJ04J4GCWOaBGd/vF/yIbGki5eOdGJro84hRa3T
 XZXd+Nc+C4XTYfiJXGxN8KgVITERinX+nxB74nm8ayE1zazQS3YpEBQqE
 HTU2uhvXwOGVFsrGzbVlzq52VCpb7WFKyLhY3936OOMA4llRhHYwbc/LT
 opAM6qI0QqTMB1M1gdtkUJcJnbtQDTOB9L1NgJrkZDisdk2Th9UbPbRt1
 BAnbqBV4HKFZXrwNhMjey1Aekb/omYzEHjMi3KkQXXDPn4PeXJKCcjTno g==;
X-CSE-ConnectionGUID: G0Fs8/PxQluBvl7rLrbZrg==
X-CSE-MsgGUID: y77eRjQYQbyXcIlICZ+8Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75405124"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75405124"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:35 -0700
X-CSE-ConnectionGUID: UQTiXrM1RhypLYLCTnZeYg==
X-CSE-MsgGUID: EEGno4kUTE68MgWypDuhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228843186"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:32 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 0/8] drm/i915: move more display dependencies from i915
Date: Tue, 24 Mar 2026 16:29:49 +0200
Message-ID: <20260324143420.310800-1-luciano.coelho@intel.com>
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

Hi,

This series continues my work of refactoring the clock gating
initialization, so that i915 doesn't do display-specific stuff.

With this, all register dependencies should be gone.

Please review.

Cheers,
Luca.


Luca Coelho (8):
  drm/i915: move SKL clock gating init to display
  drm/i915: move KBL clock gating init to display
  drm/i915/display: move CFL clock gating init to display
  drm/i915/display: move BXT clock gating init to display
  drm/i915/display: move GLK clock gating init to display
  drm/i915/display: move HSW and BDW clock gating init to display
  drm/i915/display: move pre-HSW clock gating init to display
  drm/i915: remove HAS_PCH_NOP() dependency from clock gating

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../i915/display/intel_display_clock_gating.c | 258 ++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h |  43 +++
 drivers/gpu/drm/i915/intel_clock_gating.c     | 229 ++--------------
 4 files changed, 319 insertions(+), 212 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_clock_gating.h

-- 
2.53.0

