Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F9C35FF2
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 21:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9077110E7CB;
	Wed, 12 Mar 2025 21:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3oXrb/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167F010E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 21:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813928; x=1773349928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QfCp4KFhBGDHVVOcAVNxtko0i2e1OQ8jsd9GWV7e5iA=;
 b=c3oXrb/WfbFxlrlLiZMT4fYiTzmb63d1zJLyy9g90zKGgJiXvYuUX7cb
 Gh11Js3cvBdjlC9vZVfqOmJW5vO3vSAejQrh6lvaF6IiePrSn0wwNb1i1
 YCkNlEnhDRcrAevUly0WcwxzZx7bfprBaRPganD67b+nFJjc35nTxG/xB
 iX3QjJ3MNx5trA59QkdI4Q3FcmjgzPcB4Tp6lCZeSHtsQBHqzHAe2J0rg
 ppTP9A0FLRl6O79q9LEEsi9Zkg1kCe+kA0HyUdYjtC5JjuQNPL/4vQd2m
 XDktZ8TPBvHmDqeueBzaSWkCYu3jGF6QwvhocncHdbLOpIkW1I0rV52Hj A==;
X-CSE-ConnectionGUID: raQp/8UOR+6iQYUZ9IQ9kQ==
X-CSE-MsgGUID: ppPrJk4qTROZ3l2PNhkb+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42167853"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42167853"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:07 -0700
X-CSE-ConnectionGUID: AWeHzXghQImIff4AXhYxvw==
X-CSE-MsgGUID: mIPOuw9jSHSTSCYfefazyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="125825940"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:12:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 0/3] drm/xe: Fix survivability
Date: Wed, 12 Mar 2025 14:11:48 -0700
Message-ID: <20250312-fix-survivability-v3-0-54620dbcbbd7@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250310-fix-survivability-703246c0c480
X-Mailer: b4 0.15-dev-c25d1
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

It turns out commit d40f275d96e8 ("drm/xe: Move survivability entirely
to xe_pci") did a bad job moving things to xe_pci. The fix provided by
Riana in 20250306055407.511405-1-riana.tauro@intel.com fixes it
partially, but injecting a failure in xe_pcode_probe_early still causes
the kernel to give warnings/errors.

Correct the course and better split what is done in xe_pci vs xe_device.
This time, also add a patch to test we can handle errors in
xe_pcode_probe_early().

Entering survivability mode was tested with an additional one line to
change the return of xe_survivability_mode_capable(). If we want to
inject error, we'd need to change it's return type, but there's also
another patch series to force it via configs, so this doesn't seem very
important right now.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Changes in v3:
- Add another fix for heci
- Rename function according to review feedback
- Link to v2: https://lore.kernel.org/r/20250311-fix-survivability-v2-0-729ce081155e@intel.com

Changes in v2:
- Cover more error injections in the second patch
- Link to v1: https://lore.kernel.org/r/20250310-fix-survivability-v1-0-7af31432bbd0@intel.com

---
Lucas De Marchi (3):
      drm/xe: Move survivability back to xe
      drm/xe: Set survivability mode before heci init
      drm/xe: Allow to inject error in early probe

 drivers/gpu/drm/xe/xe_device.c             | 16 +++++++++++++++-
 drivers/gpu/drm/xe/xe_mmio.c               |  1 +
 drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
 drivers/gpu/drm/xe/xe_pcode.c              |  2 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 -
 6 files changed, 46 insertions(+), 19 deletions(-)
---
base-commit: aba848f9b752cf51474c0c3b1abcf0f572f774dc
change-id: 20250310-fix-survivability-703246c0c480

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

