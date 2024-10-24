Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC4D0BB46
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 00:26:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B8910E883;
	Thu, 24 Oct 2024 00:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oh3OcDfJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB9910E24B
 for <Intel-Xe@lists.freedesktop.org>; Thu, 24 Oct 2024 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729729556; x=1761265556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yJnlA6BtdpDa3ebO+9C/3TZ11myrw7wVpXNWcHnXxCU=;
 b=Oh3OcDfJSSxyqjOVYYfIBawDv2eIHVmCzV19SMOw52e1ncie/32mj5Kn
 AyuYqJSoPPMANHvAUYxbQKZ/52/Igo6ekMdWDkTRLTmaJG36STMbdQ5NT
 6hBHXvY/Jflctrs51Go/J0OPKfcpM3SQFM54NVj+ceVR+AIQY4puMfKG5
 ZVL2qqeFxOJREt9+XDFegGMZSjrl6RDYlAZCAbpK75YOaxXbaF03vhRMN
 WwhHlUkAgZuRRajWK4Xt805bALrbGmZCwWoDX3bT6RqpHPKgFbxycmUlZ
 oSsbK/0UhXJfwXi4QYfDhQ4LZj9ZOLMw5C58Ghc1UnM8G9UKclipDdJlF g==;
X-CSE-ConnectionGUID: BYjTbsKQTDu9UOU+jcuVGQ==
X-CSE-MsgGUID: y5T9YaewRYiEQYeHL+M9Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33254615"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="33254615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 17:25:55 -0700
X-CSE-ConnectionGUID: mCVTNa8FRcuFU/ZFuyN0Hg==
X-CSE-MsgGUID: PXmDQF0vSimp3/MHU587Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; d="scan'208";a="80844924"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 17:25:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 0/2] drm/xe/guc: Improvements to GuC debugfs info
Date: Wed, 23 Oct 2024 17:25:52 -0700
Message-ID: <20241024002554.1983101-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The full CTB content dump is quite large, not human readable and
rarely interesting. So split it out of the guc_info file and into its
own guc_ctb file. Also add some extra blank lines to improve the human
readability of the info file.

Also, the GuC timestamp is actually more than 32 bits wide, so save
and print the full 64 bit register. It's still not the full 64 bits
yet (only 36 bits on current platforms) but the extra few bits might
be useful.

v2: Hide internal only function params (review feedback from Matthew
Brost) and fix a documentation bug.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Capture all available bits of GuC timestamp
  drm/xe/guc: Separate full CTB content from guc_info debugfs

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  3 +-
 drivers/gpu/drm/xe/xe_devcoredump.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc.c           |  5 ++-
 drivers/gpu/drm/xe/xe_guc_ct.c        | 54 ++++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_ct.h        |  5 +--
 drivers/gpu/drm/xe/xe_guc_debugfs.c   | 14 +++++++
 drivers/gpu/drm/xe/xe_guc_log.c       |  6 +--
 drivers/gpu/drm/xe/xe_guc_log_types.h |  2 +-
 8 files changed, 55 insertions(+), 36 deletions(-)

-- 
2.47.0

