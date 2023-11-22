Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FE5C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 11:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347F510E5FC;
	Wed, 22 Nov 2023 11:04:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59A710E5F9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700651055; x=1732187055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ormUXbj+4dMYUsA3kPxHmoWTKZye0YXt4ggOJONLMCs=;
 b=O9MXmB9Y/aaG7V0GsY1oCey/XB2ioILxYvFj+YAi4SbBnQWqX4lvyZP/
 qXk98C/XEXyMckJeYtDxVOtN9vmja/S035++1A7onSMdAvgzcjPtI/ZYl
 pbC3SXVfx9q1XST1Vck4n0reUnICH0IJcZ+0Fklt9QQgEDXChRczCsFAM
 ISnohI+Eox4htg6p/YV9eDlrjV+G3/VJzC0Wyh0suo0AITSPkpN/JixHx
 W8Od4T4vrgGxXmgftPw2zjCt04xGQ8ESVECXG1gmYuzD7UYEDHQvIomAv
 KyCx0o8hosEgllMfLvNa8m7Mki0v/1eTEP9GJwyajVYioE9/Q6C07DuTN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5224018"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5224018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="14868074"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 03:04:13 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 12:03:55 +0100
Message-ID: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: Assorted memory-management fixes
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

The patch series addresses items 1, 2, 3, 6 and 7, in the from

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946

Cc: Ohad Sharabi <osharabi@habana.ai>

Thomas Hellström (4):
  drm/xe: Ensure that we don't access the placements array out-of-bounds
  drm/xe/bo: Rename xe_bo_get_sg() to xe_bo_sg()
  drm/xe/bo: Remove leftover trace_printk()
  drm/xe/vm: Fix ASID XA usage

 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c            | 19 ++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.h            |  2 +-
 drivers/gpu/drm/xe/xe_device.c        |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       |  8 ++++----
 drivers/gpu/drm/xe/xe_pt.c            |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  5 +++--
 7 files changed, 23 insertions(+), 17 deletions(-)

-- 
2.41.0

