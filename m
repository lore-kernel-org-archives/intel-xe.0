Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D06BC10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 11:10:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8910F4EF;
	Tue,  7 May 2024 11:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DC6+Aude";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB3810F4EF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 11:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715080209; x=1746616209;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hyYIyFZ8TktOtvSP6lvasZpAfYtgrLjbI+otqbmw6Bk=;
 b=DC6+AudeJqQVLNhDZbi+cbtqaoCTu0mtK+7/EB/oURBDy1JY/Z7wRbsS
 5gQy/7ZGIOMODiEUy03+RcVmUx0UnYlGKBs+/WEKjrMVObgqUV7DqBVxe
 5zK+HSWWbYq++/1bdmu+4FKZZ/5NpqwAj/dQBiyVzlGbY16q/CS2EDTk+
 1QWFwww4NODfoRSZ657udczu/9o2OuWeMLOGowFLGUUVOEN4Ua8lbA1UE
 GYHn6/z73PjTZmOxIX6pqJe0x6njVw9qqKMxf7GJs8YfR0f7LAWvlmdKp
 C9MgFrLL7mhGnqgxYpos2h0i62H06ZOUVSy/0Notmi1qwJ25Kmf2NDqnP w==;
X-CSE-ConnectionGUID: YO9fKbmgT2iqMTnlbYgxkA==
X-CSE-MsgGUID: tPkksSDKQ7K7FsbRHmTOUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21534526"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="21534526"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:08 -0700
X-CSE-ConnectionGUID: 68c6NkvcQROVuMU+k7/DAw==
X-CSE-MsgGUID: c/Is7jlIQcW4q9DW5DwCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; d="scan'208";a="33053711"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:10:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Fix xe_device.h
Date: Tue,  7 May 2024 13:09:56 +0200
Message-Id: <20240507110959.2747-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Some explicit includes are needed only from the xe_device.c.
And there is no need for redundant forward declarations.

Michal Wajdeczko (3):
  drm/xe: Don't rely on xe_assert.h to be included elsewhere
  drm/xe: Don't rely on xe_force_wake.h to be included elsewhere
  drm/xe: Fix xe_device.h

 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c    | 1 +
 drivers/gpu/drm/xe/xe_bb.c                  | 1 +
 drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
 drivers/gpu/drm/xe/xe_device.c              | 2 ++
 drivers/gpu/drm/xe/xe_device.h              | 6 ------
 drivers/gpu/drm/xe/xe_gsc.c                 | 1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c           | 1 +
 drivers/gpu/drm/xe/xe_gsc_submit.c          | 1 +
 drivers/gpu/drm/xe/xe_gt_clock.c            | 1 +
 drivers/gpu/drm/xe/xe_gt_idle.c             | 1 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 1 +
 drivers/gpu/drm/xe/xe_guc_pc.c              | 1 +
 drivers/gpu/drm/xe/xe_mmio.c                | 1 +
 drivers/gpu/drm/xe/xe_mocs.c                | 1 +
 drivers/gpu/drm/xe/xe_pat.c                 | 1 +
 drivers/gpu/drm/xe/xe_query.c               | 1 +
 drivers/gpu/drm/xe/xe_uc.c                  | 1 +
 drivers/gpu/drm/xe/xe_vm.h                  | 1 +
 18 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.43.0

