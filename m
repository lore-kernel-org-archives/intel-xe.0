Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D26C07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 15:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6808210E01F;
	Wed, 25 Oct 2023 15:17:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDF810E01F
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698247077; x=1729783077;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mwfYkEsepQxpceXALW3ua0tHJSNS4Lp1Rg5Si6FKi/k=;
 b=mRypK3AmXrBQbvjK8tT9zIMRw2q8umFSIX2nyBFYU60RhLLHen/74Tqg
 4bLKUPAc3cojsFcJQWf7L+373eKfdN2qWitwpdAckjvwILbb6weSnCN9c
 Y2xuBZLmwluqacMlPcIHL2MGqOA/CsZUYbokiJSWDUk7/YRULqNYXkTgN
 itsBKkpXiSqLh9eFlCRvEKl0Y+ov0kwZbSG0xnc5peboa6+35tJt7wlVM
 8m626q2MxoI/0w+FdFgdQo8nK9HGBqGnZ1C8UvYloe8ZkPWB+84jdbktp
 92eB+QXglK8frH7L0zcCEA+2KyySAaquRocGim/Ydj3fuPiR0E1L7n78+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418451772"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="418451772"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882471403"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="882471403"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 08:17:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 08:17:33 -0700
Message-ID: <20231025151732.3461842-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Emit SVG 3DSTATE during LRC init
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DG2, MTL, and Xe2 do not write the 3DSTATE instruction headers to the
SVG ("State Variable - Global") section of the LRC image during the
first context switch if no explicit state has been programmed yet.  When
we record the default context, that portion of the LRC is effectively
filled with noops.  If a userspace driver later forgets to initialize
some part of the SVG state, the result is that that state will not be
saved/restored on context switch and the settings from one GPU client
(which does initialize the state) can leak into another client (which
does not initialize the state) on context switch.  While failure to ever
initialize a proper setting for part of the state is a mistake on the
UMD side, any bugs arising from such mistakes are often erractic in
nature and hard to track down because the behavior will vary according
to what other clients are running on the system and the specific order
they get scheduled to the hardware engine.

If we explicitly emit a copy of each SVG state instruction while
recording the default LRC (i.e., at the same time we emit our
register-based LRC workarounds), it will ensure that the context image
always has a real SVG state in the LRC image, and save/restore on
context switch will work as expected.  Now if userspace fails to emit
the proper state they want, they'll get reproducible behavior
corresponding to known (zeroed out) state, making it much easier to
debug and track down the problem.

More detailed explanation provided on patch #2 of the series.

We've been told that some future platforms will also require us to emit
some other specific non-register state during driver init, so even
though this SVG initialization/sanitization in this series is just a
"nice to have" change for the time being, the infrastructure added will
become necessary for other purposes on future platforms.

v2:
 - Minor checkpatch whitespace fix
 - Add an extra assertion to ensure the num_dw is properly set in the
   state table.  (Bala)


Matt Roper (3):
  drm/xe: Prepare to emit non-register state while recording default LRC
  drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
  drm/xe/xe2: Update SVG state handling

 .../drm/xe/instructions/xe_gfxpipe_commands.h |  52 ++++++
 drivers/gpu/drm/xe/xe_gt.c                    |  11 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 165 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 4 files changed, 230 insertions(+), 1 deletion(-)

-- 
2.41.0

