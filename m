Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A0BCCF9F0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 05:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A2210E340;
	Mon, 27 Oct 2025 05:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BejV/n2Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02AD10E0CE
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544680; x=1793080680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LFGGbw9XJd7dTEWgCREDOXO8ud6hL+GWh5cdmKENGyM=;
 b=BejV/n2YBFMIr7OMl/fi2Gy+ExJ4Do+4XHky8zkco7WzNANBjmAty26z
 5NbJ18JEDZKWi6uVdySsbsLeToI9CMVg/Kml50hlkjP8GWlbKYU2rIPuV
 vCCfLVqevPG662MiAZa5OehShQP6B8hwaYmfrWC7y8OLSa22dKqakjehk
 yn3mpJK0rLwenQJ9k1+HjDOLdQ7aIf6O5DXhhL+Jc78prg1dPWCSO/I0P
 L2bcGfXFZCuPkPyEHa8bNqlKdI5dmcS3bthIXxUAOKx6z69e3QKko5xsq
 3sN+CyMxpgXEw/PSlx6Rlkl0EkTcNffc0teePTLR81eMhA6povny/jZPk A==;
X-CSE-ConnectionGUID: CQFrZbO1QCGnleQqAMgmMA==
X-CSE-MsgGUID: 24tfzl11TEWG6U7EL1uLuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73905946"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73905946"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:00 -0700
X-CSE-ConnectionGUID: rKCyONbpTEWH7d3FY9Widg==
X-CSE-MsgGUID: coRbblc3TlyPdI78FfGrbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185308435"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:58:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/8] drm/xe: CRI support in gt_throttle + refactors
Date: Sun, 26 Oct 2025 22:57:12 -0700
Message-ID: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_throttle.c  | 347 ++++++++++++++++++-----------------
 4 files changed, 209 insertions(+), 184 deletions(-)

base-commit: c03916cb446b6eefe91538599775bb54bf98238c
change-id: 20251023-gt-throttle-cri-06f3c9d33c44

Lucas De Marchi

