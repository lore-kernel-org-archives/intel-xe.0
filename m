Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A63CA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 13:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A212710E160;
	Tue, 12 Aug 2025 13:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzUkIAjT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A10010E160
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755004661; x=1786540661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hZvC2OsxhDtOngL69eBdhgXxIEQYQq/gRV/61xS/La8=;
 b=MzUkIAjTlIJrEYVZmdq2y8w1fz56Esi2sJa9HfIZq/C1GymmGrNlmLuN
 /hTHJB6oP87P/yLyAKBRwmTA07401KUqRFosg0zTflrkhH2ItYhQ9uF+9
 O9L/xHVb9SeefppzCfLIrM7nzmzZuP1TydD5MoCi4peToVu8hGQ+jAaKS
 d38bVEexkLkgxoZOs8h0/LysO5LfZU3NpXiU/iXciuuM1o3t663Xj2YGc
 AHi0TWseEV0518Hm6qFmv2pMoCmsOiC0PE9li2WR8SO5EtOaB2CIHQPX+
 w3WBcucjSwy7gVcSYHJF1IFRdvuXOULllZpHHDUuw4TiB7XVksYnUeG9s g==;
X-CSE-ConnectionGUID: sGCKxvpNR/C3sextIIl22g==
X-CSE-MsgGUID: zoMUEe8TRx2qbSfL64PvMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68733356"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="68733356"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:17:41 -0700
X-CSE-ConnectionGUID: 22hTc4toTm+Vm4WMXkW29A==
X-CSE-MsgGUID: u237BLyITRy6X5eko9gh+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165379461"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 06:17:38 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 0/1] drm/xe: Untangle vm_bind_ioctl cleanup order and fix
 double free bug
Date: Tue, 12 Aug 2025 15:17:27 +0200
Message-ID: <20250812131728.42314-1-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Hi,

recently I stumbled into a double-free bug for array-binds when the
argument check fails. I've submitted a subtest to expose this issue
here: https://patchwork.freedesktop.org/series/152831/

I took the liberty to change the cleanup order in the main vm_bind
function but if that turns out to be unnecessary/faulty, just setting
the bind_ops to NULL on failure should be enough to fix the bug.

Regards,
Christoph

Christoph Manszewski (1):
  drm/xe: Untangle vm_bind_ioctl cleanup order and fix double free bug

 drivers/gpu/drm/xe/xe_vm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.47.1

