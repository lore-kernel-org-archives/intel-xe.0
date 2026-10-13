Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98355CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:39:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B1310F457;
	Tue, 13 Oct 2026 02:39:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B2510E707
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791859177; x=1823395177;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ayBKYdUP061xC1zD58K4S0i8n8NMzK+waWCdCD5RuW8=;
 b=LZi/Y/NjQ7XEgLyUnJPjRLVMoUzw8TBi0CLm3a84O5dcF1u67BlzOdoC
 dZYfOakeWlDiuygogLj4/D+VmQT8YA7tUyJ+9bE9SqWOu4Rcj5DvbCLEb
 3f7t+FfQD23rD+iMQBxTHYXZSehZI+Yfq+PJWJciSoffrK21AoWmBn69+
 v/DUdKTvhp9dfsbvhuX2RzIoQwOtuTg/zUU4Q3XfJ7Ss3Ud2ZTahoGi1m
 jB49yEro33xsvJCNbHmUMN/hDgh8VSd6OMgLAYkrARyX4MEl0f/N9t0xo
 TEz1gzcRjn0fUvvWzw4zC/CLOsM31LN5UC6hl84F3gQRY3MHAgJzZEJPV A==;
X-CSE-ConnectionGUID: yFPcFGdyTuy/zIeaQ6RHjg==
X-CSE-MsgGUID: Tp6SkJ+8Tx+YLrfSxhqw6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="569709"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="569709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:39:36 -0700
X-CSE-ConnectionGUID: CiOg6dE/RpCve1RMpYuK8A==
X-CSE-MsgGUID: 1UmF+OhsTc2rEoEBf4MU9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1132032"
Received: from danielcm-desk1.jf.intel.com ([10.24.81.120])
 by fmviesa003.fm.intel.com with ESMTP; 12 Oct 2026 19:39:35 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: x.wang@intnel.com, jia.yao@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH 0/3] FD close cleanup for XE
Date: Mon, 12 Oct 2026 19:34:39 -0700
Message-ID: <20261013023442.206915-1-daniel.charles@intel.com>
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

This series adds the suggested logic to synchronously wait for the queue
kill to complete on FD close. This is needed to avoid a race condition
where the scheduler may still be processing messages for a queue that
has been closed, which can lead to errors.

This series includes a rebase of patch

fe73d8e1cdfac drm/xe: Disable scheduling early on FD close to avoid CAT error cascade


Daniel Charles (1):
  drm/xe: Synchronously wait for queue kill on FD close

Matthew Brost (2):
  drm/xe: Read scheduler message opcode under lock
  drm/xe: Disable scheduling early on FD close to avoid CAT error
    cascade

 drivers/gpu/drm/xe/xe_device.c               |  8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           | 13 +++
 drivers/gpu/drm/xe/xe_exec_queue.h           |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  2 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 13 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  2 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 85 ++++++++++++++++++--
 8 files changed, 112 insertions(+), 14 deletions(-)

-- 
2.43.0

