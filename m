Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ED0C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5910E00A;
	Thu, 16 Nov 2023 19:40:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8C110E00A
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700163637; x=1731699637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=laHFFcye4kNCIDCxvGwwp7orsdnFP2aJI5fw+/Z4sDw=;
 b=eNm1Ncp4hKf+ZZ6YiA4Mbmdd5tjHKLyI+G14qAtTxoEHtJhuY1emNgMK
 u1cSHHrOFHl2dH2L4H3Uy5OxtJPt7K+m9B3WWX947YmFdCrKU7uHTOd/7
 49okS8TtaOtCfDhnnuTXG9TJcuJCe3nvS4KtynjLHw3XKFjHYAgPfqR2G
 8RmJjcQWUPqtjuDrf4E+QV2/ULR2sNJxQPVNJgwTC6Fa9fs8nUBn/VO5L
 WeBYcc0/3vVXabkIhakm3Jpsqq2U1WvmFKpnVstvpwZDorSEVgRMwZZRn
 xfXC0aI3yMbDQDuQsTUn/rGksWpIWO+GNlkJU5tv7+AgK8DNhdNgg1Bzp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394016987"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="394016987"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769004686"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="769004686"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 11:40:42 -0800
Message-Id: <20231116194047.214330-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] Allow num_binds/num_batch_buffer to be zero
 IOCTLs
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

Easy way to flush exec queues. A semantic that VK will likely use.

Matthew Brost (5):
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Use a flags field instead of bools for VMA create
  drm/xe: Use a flags field instead of bools for sync parse
  rm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe: Take in-syncs into account when num_execs or num_binds == 0

 drivers/gpu/drm/xe/xe_exec.c             |  32 ++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +-
 drivers/gpu/drm/xe/xe_sync.c             |  86 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_sync.h             |  11 ++-
 drivers/gpu/drm/xe/xe_vm.c               | 117 ++++++++++++++---------
 6 files changed, 199 insertions(+), 57 deletions(-)

-- 
2.34.1

