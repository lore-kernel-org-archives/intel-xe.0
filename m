Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56415CD4F4A
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A8310E9FE;
	Mon, 18 May 2026 23:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzwZkRpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B0310E26C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148050; x=1810684050;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fU3WSPETgJ5Zkm6oUtB/oklK5gPXF6s189h83t102A0=;
 b=HzwZkRpjemGHJmDEJp3ofaEZc5S+RsTkHhMAFr2PNfAfdJcMZm36iJLP
 dX3mUDlsz9AjsjC1XKeGKjXFTbne98yO6fxgvDJ7ZQ7qYpnpUZp4j9xh+
 8QPFnLKDaSs8lrne1jA11e2q2b1sOjyVq1Nif1KDyoekjy03wzpdv9oMK
 0saDu66WDKUMznh1oIWMdSSzIafeZW+6Zkr/+B5RIuVW0H61LT+FbaoRB
 +9QVG2BfRxfhJ+Pr27dWNfhPAbHva47hNk5XbdtZMoP7MpeJLlQJmYy+I
 GbhGE0H128KzGu7FVtGUU3HOO6kFp7OTgZyo2McDwVoEYmQG6kn0yZJxc A==;
X-CSE-ConnectionGUID: Jfp93+fCQkWEmNaNgN4dpA==
X-CSE-MsgGUID: HtEN+4EqSCu4LHXA6VqKbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866823"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
X-CSE-ConnectionGUID: hsFIVHs8TOaioFEou+hWSQ==
X-CSE-MsgGUID: Lno2lzKBQROp+JZ3GUSZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959319"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] Don't whitelist OA registers unconditionally
Date: Mon, 18 May 2026 16:47:07 -0700
Message-ID: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Whitelisting OA registers unconditionally is a security violation. In this
series we resolve this issue as follows:

* Set the 'deny' bit (bit 30) for all OA registers, ensuring OA registers
  are not whitelisted by default after probe/reset/restart
* Reset the 'deny' bit when an OA stream is opened and certain conditions
  are met, whitelisting OA registers only for the duration when OA streams
  are open for a gt
* Set the 'deny' bit again, when OA streams are closed
* To manage this scheme, separate out OA whitelists from non-OA whitelists
  (into separate save-restore lists)

Ashutosh Dixit (9):
  drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
  drm/xe/rtp: Maintain OA whitelists separately
  drm/xe/rtp: Keep track of non-OA nonpriv slots
  drm/xe/rtp: Generalize whitelist_apply_to_hwe
  drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
  drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
  drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
  drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
  drm/xe/rtp: Ensure locking/ref counting for OA whitelists

 drivers/gpu/drm/xe/xe_gt_debugfs.c      |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  8 +++
 drivers/gpu/drm/xe/xe_oa.c              |  7 ++
 drivers/gpu/drm/xe/xe_oa_types.h        |  3 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c   | 92 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_reg_whitelist.h   |  4 ++
 7 files changed, 111 insertions(+), 9 deletions(-)

-- 
2.54.0

