Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C2C10F05
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 20:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C85C10E60C;
	Tue,  5 Dec 2023 20:37:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707810E608
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701808660; x=1733344660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKdsFrftn4dnYY/k3HEqH5X/lvO0bsYc3uIrB4iN+7o=;
 b=ahX5dcrVC1V7QrEjxCWn6P+zr3SjOV6ec8AYptPVRVaar2iI6ScBIg7y
 yrfYVH61Yyf8E54aZ2cD/1gxZB9jaBjIzxSvhwr6lXTKZCZzblN0LCphV
 ga84WmvY9Ui21oNxcXkM7LsHyf+13LeQasFukPcqEgj3oqb+45zLRuyh8
 eSN9P/h97V9hh+qeUy+0QoBHLC9rp+iLJc7I75QvS80uBSJ+zroLDqkyG
 JcfEXearz72Tdz7/Q/0t51+vZcT9EQhVnm1EohjhhP6egGBU+7Z1+aNBl
 iUIW0lSx1BJqvIlLMcqSxKOBXNgHQAhm/0cjdwG5PkQeXRQiuTvjcJto4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397848603"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="397848603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 12:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747366694"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="747366694"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 12:37:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 12:37:53 -0800
Message-Id: <20231205203758.322438-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] Allow num_binds/num_batch_buffer to be
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

v2: Rebase
v3: Bug fixes

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

