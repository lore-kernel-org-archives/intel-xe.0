Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63260E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B9110E04A;
	Wed, 18 Feb 2026 23:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZspXqb8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E4210E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456646; x=1802992646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tASh1KZ/78Ulj9ba8zTB+T7EWabGkfJoNQ58ML4mWus=;
 b=ZspXqb8cPaAFaLGLpgYCL/aIyLfGPC1QSNJu7n7hqdC9VAJc0VWOIavc
 owx2YJdfRdUcClFffH0A1r8Zw0Rri9Nb277WnX1rM8aoopRhDmF7Nwvc+
 y6c4HHOOKJRn7cXb8EcylWsSi5qEBKLGbQCq9ZHM8ufxLxjm2MpTcWBH1
 KEnGlM9L0bR2v9t4D5I1cFhbIfx9cEgoIEutqJ96cnuzEV1vgExh2Lbso
 x7AOutM2xI4Eq9EwQmz1SzObzbGSShcvCb1wvorIPVLPK5B75foX9DMyH
 alEMpg/JqQMl5noONa3L17iKIw0MwT2lxyJjYNWawdCYqplt7dlP/h+ug w==;
X-CSE-ConnectionGUID: 8U1EgrWRT9OOcr0fkxErvw==
X-CSE-MsgGUID: IZZhiMD1TjmZoZe/MZU5Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83260854"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83260854"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:17:25 -0800
X-CSE-ConnectionGUID: jKR8Z0ryTk20r2NoISEXtg==
X-CSE-MsgGUID: EAYRidC3TiGkjWIANOrWQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214200218"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 15:17:26 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/5] drm/xe/vf: Fix exec queue creation during
 post-migration recovery
Date: Thu, 19 Feb 2026 00:21:53 +0100
Message-Id: <20260218232159.1726873-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix a few issues which sporadically happen due to a race between
post-migration fixups procedure, and exec queue creation routine.

Tests which create a lot of exec queues were sporadically failing
due to one of LRCs having its state within VRAM damaged. This series
fixes all such issues, by prolonging wait for fixups within EQ
creation, and also re-creating the one LRC whose creation happened
at the time of VF switch.

v2: Add a patch with atomic value increase which allowed to solve the
  few very rare test fails which were still happening.

Tomasz Lis (5):
  drm/xe/queue: Call fini on exec queue creation fail
  drm/xe/vf: Avoid LRC being freed while applying fixups
  drm/xe/vf: Wait for default LRCs fixups before using
  drm/xe/vf: Redo LRC creation while in VF fixups
  drm/xe/vf: Use marker to catch fixups during LRC creation

 drivers/gpu/drm/xe/xe_exec_queue.c        | 17 ++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  4 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  6 ++--
 4 files changed, 48 insertions(+), 18 deletions(-)

-- 
2.25.1

