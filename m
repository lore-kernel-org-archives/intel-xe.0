Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F89C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 19:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F1110E51C;
	Tue,  5 Dec 2023 19:19:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C7A10E51C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701803995; x=1733339995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=37W4TjZOgZpuOmA3mDzBMljCfKn/GXoL3EQGj/RD5eg=;
 b=EtpM+H+/IjaGuNNOb95upa9/6fYXOhALOOO0cpNqR6rzGiumhX2U2h8c
 59N2hzC//Le8N8B8agBqNxZVAfSmZxvpfy/VzbDdrz0YqLdhiJjo/uIy1
 T7+kJuNu+2AhO9Zmh0FUu1KPe6HfTdqAj1VdPjhQlr6lJiY0Csj6YtOIh
 rBJfAYniMrsQufHXuLwK+u5MYT/1ZdN1sYMT3aYWtIuF7Cic0H3CZ3tvw
 u2HA+/hcezKyLrouQCK8EC1D7TMLwuAtMvuHRwZqV4BC7OUNiqjC32xgy
 L/9Gzz26FI3xDkRNX+KQ0FEh8FBVuGu0imSElEVFGGkQnM5Frd1cq8HhL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1032968"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1032968"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12441516"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 11:20:09 -0800
Message-Id: <20231205192014.301742-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] Allow num_binds/num_batch_buffer to be
 zero IOCTLs
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
  drm/xe: Use a flags field instead of bools for VMA create
  drm/xe: Use a flags field instead of bools for sync parse
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe: Take in-syncs into account when num_execs or num_binds == 0

 drivers/gpu/drm/xe/xe_exec.c             |  28 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   5 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 +-
 drivers/gpu/drm/xe/xe_sync.c             |  82 ++++++++++++++-
 drivers/gpu/drm/xe/xe_sync.h             |  11 +-
 drivers/gpu/drm/xe/xe_vm.c               | 125 ++++++++++++++---------
 6 files changed, 200 insertions(+), 56 deletions(-)

-- 
2.34.1

