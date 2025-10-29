Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A3ECCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 23:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88CC10E05F;
	Wed, 29 Oct 2025 23:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2m624QL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD6810E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 23:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761781545; x=1793317545;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKP/9eJ4c5PNLNaLAphXv7NgAJTmFDQj1ddt+OBgSR4=;
 b=G2m624QLtfY8ufrDRgiFyWWG1wKyamK0PWQwlxsudQRABMcOGfzGKOAr
 0iu0FCA+u0NXdeM46GkRKzN5hZRH3SnwxDt5oMKVzmrcAhsB8AJbdndyQ
 sRFHzA3KHD9Tb8Toh655WddMP78jkXEWJJdd0WQ1c39hQt9ZBwW2nI3or
 gsFyLt3+vnfS4AyjfbQUbX+jE6AJPINGWXr7QKMvL4KFkk7zlytjg4bDS
 3CVO5GYTwZOGIZ70E1f4/qcL77hKDAwemXZwUyE3EEXjfXyQcqVlrCUDT
 QSo3BclM6lUnKLqI+9zmjGZEaVVRHqtobNmgJhN1zyh7TX43767mWAl3b g==;
X-CSE-ConnectionGUID: sGAHGEkGTSO+bmjWHAeb+w==
X-CSE-MsgGUID: HIfiu38KTrehK4sWPMwsJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75363576"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75363576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
X-CSE-ConnectionGUID: Gmx5aj9RQO+I590IbZisUw==
X-CSE-MsgGUID: MOXdyPghTWyndB9ZmlCuNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="185456053"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 16:45:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 0/8] drm/xe: CRI support in gt_throttle + refactors
Date: Wed, 29 Oct 2025 16:45:02 -0700
Message-ID: <20251029-gt-throttle-cri-v3-0-d1f5abbb8114@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251023-gt-throttle-cri-06f3c9d33c44
X-Mailer: b4 0.15-dev-50d74
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

First patch was extracted from the rest of the CRI support series:
https://patch.msgid.link/20251021-cri-v1-0-bf11e61d9f49@intel.com

I did some minor tweaks for a v2 of that patch: something that could be
considered for merging since it follows the style of that file.

Patches on top are refactors to simplify the code and reduce its
verbosity/boilerplate.

Finally last patch tries to resolve the TOCTOU issue previously
discussed in a reasonable way.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- Use space as separator for the reasons (Rodrigo)
- Link to v2: https://patch.msgid.link/20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com

Changes in v2:
- Handle comments on v1, noted on individual patches
- Improve documentation, adding it to the html output
- Add patch to introduce status_reasons attribute to overcome the TOCTOU
  of the current API
- Link to v1: https://patch.msgid.link/20251023-gt-throttle-cri-v1-0-9f36f3c8861c@intel.com
---
Lucas De Marchi (7):
      drm/xe/gt_throttle: Tidy up perf reasons reading
      drm/xe/gt_throttle: Always read and mask
      drm/xe/gt_throttle: Add throttle_to_gt()
      drm/xe/gt_throttle: Tidy up attribute definition
      drm/xe: Improve freq and throttle documentation
      drm/xe/gt_throttle: Drop individual show functions
      drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons

Sk Anirban (1):
      drm/xe/cri: Add new performance limit reasons bits

 Documentation/gpu/xe/xe_gt_freq.rst  |   3 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  13 ++
 drivers/gpu/drm/xe/xe_gt_freq.c      |  30 +--
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 349 ++++++++++++++++++-----------------
 4 files changed, 213 insertions(+), 182 deletions(-)

base-commit: cda2b0f6aac39752912adadfb0735f157598917c
change-id: 20251023-gt-throttle-cri-06f3c9d33c44

Lucas De Marchi

