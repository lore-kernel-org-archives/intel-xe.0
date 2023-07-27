Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D5FC001DE
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DA010E068;
	Thu, 27 Jul 2023 01:40:07 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149FE89023
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422005; x=1721958005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kfwUbtQ/2smAddrOGEz45+y/Ude9FDotdw6rnSgqARs=;
 b=Y2pgScUYAXnApEQe1H7mEvak011Apk7D3bxHlOtmNH/5O3GveYYuBa2Z
 3bLSfGR4nmY4EOBGgQbIRBI+Bk2eFz0TU40u3MsEuOp42zd7CEfr5QZg5
 0ntTW7ZWTi/XaYLMEKQupiVGU6AheGzeuilFdz+UhVz10unQ4xmpRqo7Q
 Hm8QbbtHmIUAEvGGeI5h8PTgcKmeK/n2I9uIZz5GA9fzf3hiDrTY/SqSG
 TCJ5P0yDfBf+W0mPezy6TrRViaJ2X6IqmG4LzeewjZ76xcLsOsgNWMG6A
 RBPl13ABclcYsWuFplaCZpPH5uIErowDoUSyQyXa5iDaIJYbSJd9TCWQ4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788083"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459538"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459538"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:53 -0700
Message-Id: <20230727013958.456502-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] VM bind uAPI changes
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

uAPI chnages mostly posted in [1]. The uAPI mainly revolve around VM
bind, in particular sync vs async binds and error handling. The uAPI
should conform the VM bind document [2] that is on the list. Tested with
[3], uAPI change do break backwards compatibility albiet in a very minor
way. The uAPI should be extendable enough if the error handling needs to
be chnaged, it should be as simple as setting a bit or property in the
VM creation.

Matt

[1] https://patchwork.freedesktop.org/series/117156/
[2] https://patchwork.freedesktop.org/series/119672/
[3] https://patchwork.freedesktop.org/series/121400/

Matthew Brost (5):
  drm/xe: remove async worker, sync binds, new error handling
  drm/xe: Fix VM bind out-sync signaling ordering
  drm/xe: Allow num_binds == 0 in VM bind IOCTL
  drm/xe: Allow num_batch_buffer == 0 in exec IOCTL
  drm/xe/uapi: Add some VM bind kernel doc

 drivers/gpu/drm/xe/xe_engine.c          |  85 ++-
 drivers/gpu/drm/xe/xe_engine.h          |   7 +
 drivers/gpu/drm/xe/xe_engine_types.h    |   7 +
 drivers/gpu/drm/xe/xe_exec.c            |  64 +-
 drivers/gpu/drm/xe/xe_sync.c            |  19 +-
 drivers/gpu/drm/xe/xe_sync.h            |   4 +-
 drivers/gpu/drm/xe/xe_vm.c              | 765 +++++++-----------------
 drivers/gpu/drm/xe/xe_vm.h              |   2 -
 drivers/gpu/drm/xe/xe_vm_types.h        |  37 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  43 +-
 include/uapi/drm/xe_drm.h               | 129 ++--
 11 files changed, 413 insertions(+), 749 deletions(-)

-- 
2.34.1

