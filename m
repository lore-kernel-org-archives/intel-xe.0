Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E737C3DA6E
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 19:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6302F10E677;
	Fri,  5 Jan 2024 19:04:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A3F10E677
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704481481; x=1736017481;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06tmvqORqPCQVPq0f8qJIHSCOOb/AghnhZYR0SQS0zE=;
 b=HCzzCHdpEzfAuZb3JqT7M1AktzoPMvuiVVdsaXU3vfpfiz9yzvXe0Jr7
 inJRydT+g4YtvhVcRuxWlX1c+hF1K2wyhjSKm2RutG0xd2e99Dg3gHsdm
 5OQQe1V3XAYJxV21JsTKNYw7vnfuVtrOkXyifHtdvbm3hoXEpe8baInTZ
 HlW7S2RS2ct+GBTNLfezEm5HShGxtxdxRL2WQfGbu/kuhvrKub1L+jLLX
 eVxeuRIff3fs4A0tPo1Zdk4G5PvjRAS2imwgijpCZgxa/uTOg/40E/wBz
 OTQqoLZ4KrS6QDAE8z+eJE89RNv+q3sYx73zUF4V4WORvQL+iUfBNeR3Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="388013234"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="388013234"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="815025350"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="815025350"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 11:04:40 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Fixes for settting exec_queue priority
Date: Fri,  5 Jan 2024 11:04:38 -0800
Message-ID: <20240105190440.9908-1-brian.welty@intel.com>
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

Two fixes for setting exec_queue priority.
Found during code review of some related refactoring in this area.

Brian Welty (2):
  drm/xe: Fix guc_exec_queue_set_priority
  drm/xe: Fix modifying exec_queue priority in xe_migrate_init

 drivers/gpu/drm/xe/xe_exec_queue.c       | 5 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 6 ++++--
 drivers/gpu/drm/xe/xe_guc_submit.c       | 7 +++----
 drivers/gpu/drm/xe/xe_migrate.c          | 5 ++---
 4 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.43.0

