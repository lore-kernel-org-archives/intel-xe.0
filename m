Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB92CDB482
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 23:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88DB10E334;
	Tue, 17 Oct 2023 23:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23F10E334
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 23:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697584736; x=1729120736;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oKoqCQZ0k6GdZA2y2DCUDFsYsY8QEYX8Kv1V0xSwbdk=;
 b=V3VrTWI0YOD5SwytaiNCWN7RfdrPzQ+vmFPDMz4GbAhEykdWpLDnzGlj
 ijHt6EsWWfP2fafYdtz7D9Wurg2ra2Ea+43bq9DmuEuF1IZ+vLjyBlt/w
 vR26UAqe0PfLE2FJaEEAa3/owUeh5fykc0i/wUjQOJS29+K1bmjVinPtM
 +jbnj4bg5TC6YiLm5FU1AcjZLSjjTRuHtBnzP4q3y8X+2zpCfWxKc8mF4
 V9X2jZd77ZmhRpp8H/NyM518bp/yk3dRCSHReJe46/uPILUflA+6UqFkz
 EDlOV+ktpQnsQhyo2MZREuJx3Zukp25AgpjPxwwd289a0+dliqGZdE9Gf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7452932"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="7452932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822191727"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; d="scan'208";a="822191727"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:18:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 17 Oct 2023 16:18:44 -0700
Message-ID: <20231017231843.1790243-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Emit SVG 3DSTATE during LRC init
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


Matt Roper (3):
  drm/xe: Prepare to emit non-register state while recording default LRC
  drm/xe: Emit SVG state on RCS during driver load on DG2 and MTL
  drm/xe/xe2: Update SVG state handling

 .../drm/xe/instructions/xe_gfxpipe_commands.h |  52 ++++++
 drivers/gpu/drm/xe/xe_gt.c                    |  11 +-
 drivers/gpu/drm/xe/xe_lrc.c                   | 164 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 4 files changed, 229 insertions(+), 1 deletion(-)

-- 
2.41.0

