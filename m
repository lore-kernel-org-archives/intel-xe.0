Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51627D743EE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1250110E2DA;
	Wed, 20 Nov 2024 23:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MDup5nfr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9896010E2DA
 for <Intel-Xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732144978; x=1763680978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xAhXkHkKmdpW216rpVRhEl//LTcUMQsM7jKH4rZyboI=;
 b=MDup5nfrIUC/zqYHcB2Si34oT+//L0jOh0lu0IVxOROnqJ4CEese5yZV
 +NIGvNa0eaUF8plCkWn8uMagCeqOP8SFpAJEoiKkxfl8R0YGfpI3/HRSG
 rmxu1ABjoQo0tAKF4HjinHd/pUqK6qmUjK0eqgb3IPsGbhtuumPo6vZa2
 /1pSL7IL21YK7apm2vkexYe+feWhJF33degWpmZdDPp6jymw2hmWH2+BC
 ansb2/iIgwMAlLLWewXziKtTAZYBOoy6Xbl1A/oXoRBVuHdRhZRw68l5e
 V6GyRvww95ISQ51qy3soxf18RI1NBwTL1J2O0QYkfKK2WdFfdL8+02An1 w==;
X-CSE-ConnectionGUID: kS2VDWQ7S/KEHFeYl2NvyA==
X-CSE-MsgGUID: AqDVTahUT+2MnOshJSwHVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="32481209"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="32481209"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:22:58 -0800
X-CSE-ConnectionGUID: rDKaCQHERFW17zAy3kgvhw==
X-CSE-MsgGUID: 8udoKkmiQi+uMGAckVpahg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90863994"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 20 Nov 2024 15:22:58 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe: Add devcoredump locking and reason string
Date: Wed, 20 Nov 2024 15:22:55 -0800
Message-ID: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are now many ways to trigger a devcoredump capture. So include a
reason message to say why it happened.

Also, add locking to avoid a race causing two core dump captures to
run in parallel.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Add lock around devcoredump capture status

 drivers/gpu/drm/xe/xe_devcoredump.c       | 36 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 ++--
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  6 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++---
 4 files changed, 49 insertions(+), 12 deletions(-)

-- 
2.47.0

