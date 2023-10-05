Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E68E92FC9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 22:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D010E499;
	Thu,  5 Oct 2023 22:00:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71C210E499
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 22:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696543252; x=1728079252;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yZ7bDra4nGyFTN65HdO01St2RCbuR9oizLpcydxRzLw=;
 b=XzMvqd5KNXyArAMw5Xa5Cd0J8K/7xhEep+bsbmWevKvIi07AGAo6NvdQ
 U9kFL2w02PbIUFrBZna3IIMKpqqLGFQmv/GdQaYt3eR7JFsxonyJFUEEK
 e6BXjz4OkXSJsOYi2eBUUx5e236lkeWvTziVdhejUsQosh/WYWQbTH4K7
 /ZF3eUeHWiHXNRtmykx7j07fLGQuu3my2vd+aGG3zcKOEU9tCbUr2iUAG
 wV8ALLCMlaheEm2KXXz0TvrZdUkLVO9BfdND/JLjgUvmch7YPXDrpkER+
 pY0yw5v9WdNLAfMXKf1LM15+6iQqeKKAEapiAcYWKiIa+uMWtbcGHRYdj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386461072"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386461072"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999105335"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="999105335"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:50 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Thu,  5 Oct 2023 18:00:38 -0400
Message-Id: <20231005220040.552765-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/2] Use DPA offset for page table entries.
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

Update xe_migrate identity map base PTE entries to start at dpa_base
instead of 0.

Signed-off-by: David Kershner <david.kershner@intel.com>

Changes since v3:
	- split out kunit changes to own patch.
	- address review comments

David Kershner (2):
  drm/xe/xe_migrate.c: Use DPA offset for page table entries.
  drm/xe/tests/xe_migrate.c: Add vram to vram KUNIT test

 drivers/gpu/drm/xe/tests/xe_migrate.c | 103 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.c       |  27 ++++---
 2 files changed, 83 insertions(+), 47 deletions(-)

-- 
2.35.1

