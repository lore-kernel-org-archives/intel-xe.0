Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5751C6FD19
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DC410EA1B;
	Fri, 10 Mar 2023 22:16:29 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C598510EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486587; x=1710022587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pztqKgZg61RHKLZvw9yTBO887OkZodlTWyLtM66hvcE=;
 b=Z9EBRRJBHLZmWUxXxL6nYNjsfd2/0UWSiUTmd8NPCyAj4cqUrjKXrRUV
 17Wo1c4aTVRahL9GVvdepU8/K/LHmX/9UYl9S9SITEqAPptPj7oHVg+U/
 2YyLqa2HLAnw3EZKMDE9C7RX+L3ObitGYOQgvtws6Ho5WSi2/wUb4BRSJ
 o+eDJyKUn/8Z+2Hvwgcarf2tlABmDrukGex+rlZonWNe+XPBHQAyKZvjr
 a3ENvAsdWpUMptaFUVsH7Cs4wFjnzVlYXbAnRLTeyMr0eULoM3esVDomC
 zLctoUWm7H6HKaj/kq4OS0qiWQcqAbEKCK3b/a0JfO7oLVkl1VwguvmoI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106168"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106168"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234951"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234951"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:37 -0800
Message-Id: <20230310221549.2337402-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/12] DG2 + PVC workarounds and infra
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Some of the infra patches that got reviewed in v1 were applied. This
contains the rest that needed some work.

Tested in DG2 and PVC. The latter needs one additional patch:
https://lore.kernel.org/intel-xe/20230310191430.2229799-1-lucas.demarchi@intel.com/T/#u

Lucas De Marchi (12):
  drm/xe/rtp: Add match helper for gslice fused off
  drm/xe/reg_sr: Tweak verbosity for register printing
  drm/xe: Print whitelist while applying
  drm/xe/debugfs: Dump register save-restore tables
  drm/xe: Remove policy on preemption from WAs
  drm/xe: Reorder WAs to consider the platform
  drm/xe: Add PVC gt workarounds
  drm/xe: Add PVC engine workarounds
  drm/xe: Add missing DG2 gt workarounds and tunings
  drm/xe: Add missing DG2 engine workarounds
  drm/xe: Add missing DG2 lrc tunings
  drm/xe: Add missing DG2 lrc workarounds

 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  88 +++++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c    |  30 ++
 drivers/gpu/drm/xe/xe_reg_sr.c        |  32 +++
 drivers/gpu/drm/xe/xe_reg_sr.h        |   2 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c |  59 ++++
 drivers/gpu/drm/xe/xe_reg_whitelist.h |  10 +
 drivers/gpu/drm/xe/xe_rtp.c           |  16 ++
 drivers/gpu/drm/xe/xe_rtp.h           |  11 +
 drivers/gpu/drm/xe/xe_tuning.c        |  25 ++
 drivers/gpu/drm/xe/xe_wa.c            | 393 +++++++++++++++++++++++---
 10 files changed, 628 insertions(+), 38 deletions(-)

-- 
2.39.0

