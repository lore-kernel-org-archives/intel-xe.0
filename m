Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82225C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417CE10E67B;
	Tue,  4 Aug 2026 09:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GETHnEQf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6058310E67B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785836237; x=1817372237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hBuTqdTW7rpM6F7OjHSDCKv/LJjKfa0+4wLxd/i45gQ=;
 b=GETHnEQfQu4CtBSbOXsoJcOx9cUQ8Yy9t20o1vu6oTqfnO7r3driqtvK
 La4okvj5qKqK2b8/ex98m83o5fgVeE8JVtcYpK1OAg96kBZ7XR35UzV5M
 PU5UR+tNhYqKKNWAK9uKn9nWLqx83Tzom/nJwoemGa4uDtCRoeY47DHG8
 egPyRqcKkABaGOsBBqpIIwsQEqWKNHwAfayCBaDQ5AaTvUwdtYV1aaVNR
 0cJfMpNvM68FxAxxH0GQnIi+FEANfCub2A8UHFNjAYalPGocK42XnEEL1
 PpfuTGIfB09AoVObCnlt4lJ4r5T3ZqcSsooTOD5yfnzGpMKXHvBgm8+S/ g==;
X-CSE-ConnectionGUID: ooyNNoPbQ5m9QAj7BiZBJQ==
X-CSE-MsgGUID: 5gBLXp5ZStW8JfdLAQud1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="111937725"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="111937725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:37:14 -0700
X-CSE-ConnectionGUID: kNzbwUYVSyK3w/4R9o62dw==
X-CSE-MsgGUID: qhXL0N0zS4mezlpZ3an8Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="261528908"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:37:12 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, badal.nilawar@intel.com,
 michal.wajdeczko@intel.com, himal.prasad.ghimiray@intel.com,
 dnyaneshwar.bhadane@intel.com, mallesh.koujalagi@intel.com,
 matthew.brost@intel.com
Subject: [PATCH v2 0/1] drm/xe: Report GT TDR and VM rebind faults using SIGID
Date: Tue,  4 Aug 2026 15:06:47 +0530
Message-ID: <20260804093648.609728-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

This patch is a small follow-up on top of the structured SIGID error
logging infrastructure series:

https://patchwork.freedesktop.org/series/171022/

That series adds SIGID-based error reporting and the xe_log_*() helpers.
This patch converts a few existing driver-detected GT TDR and VM rebind
fault logs to the structured SIGID logging path.

v2:
 - Rebased on the latest structured SIGID logging series.
 - Switched from the old xe_ras_log_() helpers to the new xe_log_()
   helpers.
 - Dropped paths already covered by the base SIGID series.

Arvind Yadav (1):
  drm/xe: Report GT TDR and VM rebind faults using SIGID

 drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
 drivers/gpu/drm/xe/xe_vm.c         |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

-- 
2.43.0

