Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD68CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB3710E11F;
	Mon,  4 May 2026 22:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjGidqkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AFC10E0D3;
 Mon,  4 May 2026 22:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777933581; x=1809469581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XV0PitfFltDWY+xShSuyD0HO6T0Z34hQ9KXt1BxVt9M=;
 b=GjGidqkTLXtlJ/53vjWVn5o00op4jGhW+qtUaGjA/lAiq5LSutBvqK7Y
 7P5HlvBXPB+BpeO+W7sEs5YUzi7nf9tqStd8E8XWvjEowLmU/l9zSF2VZ
 eLiPE9XN6a2wTZpnadih4UjvTAqZdM5pvtVxEokAGvQ9XVdkAGJQBhK1a
 EDL27Xuuu+araTY0NYSblHuXlfFURdP39LtK4KabCselhbhQBlx/a66bw
 SA4cebgfq8mp6RJ72XagssItOSdRonJ7g7yZ907Gb0dc/2whf+VAsuFSu
 H5a6+PlyVir+Yn+nZqi0rpaIhXfUzQFhRH9A0rW+Eie0NYtrEke0VlABs Q==;
X-CSE-ConnectionGUID: /62093BuStekoVgrnAJtDQ==
X-CSE-MsgGUID: gIx2bLbxSCOmXcmMs/fjOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77820264"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="77820264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:20 -0700
X-CSE-ConnectionGUID: AxxE0bCeTdCYRb6hUKl0rA==
X-CSE-MsgGUID: hBv1BAhaTemF2p+tBfnQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="235509322"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.157])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:26:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v2 0/6] drm/i915: add display irq hooks
Date: Tue,  5 May 2026 01:26:07 +0300
Message-ID: <cover.1777933454.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

v2 of [1], with the initial refactors merged, and review comments
addressed.


[1] https://lore.kernel.org/r/cover.1777458161.git.jani.nikula@intel.com


Jani Nikula (6):
  drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
    gen11_de_irq_postinstall()
  drm/i915/irq: constify pipe stats parameters
  drm/i915/irq: add display irq funcs, start with
    intel_display_irq_reset()
  drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
  drm/i915/irq: add intel_display_irq_ack() to irq funcs
  drm/i915/irq: add intel_display_irq_handler() to irq funcs

 .../gpu/drm/i915/display/intel_display_core.h |   3 +
 .../gpu/drm/i915/display/intel_display_irq.c  | 225 +++++++++++++++---
 .../gpu/drm/i915/display/intel_display_irq.h  |  37 +--
 drivers/gpu/drm/i915/i915_irq.c               | 182 +++++---------
 drivers/gpu/drm/xe/display/xe_display.c       |   6 +-
 5 files changed, 271 insertions(+), 182 deletions(-)

-- 
2.47.3

