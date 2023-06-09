Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B82C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 08:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1359910E289;
	Fri,  9 Jun 2023 08:58:54 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B79910E289
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 08:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686301132; x=1717837132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F5UFpPs6dI9PP776tanRUEjzqJpmkPQRBh6h1+bgn7k=;
 b=fghngVdeMYpjtO9CEZd2iRsQqaUVN4Nxy43T0EuvaY/15AR6TV7PulYZ
 SjD5Ui/LUtbJ6vOrxEVs9MzdZMGbIbuI423BSxprEttLh/HM/ZXgLqDi8
 liVbXp3P+ZN5c2RCyVZSoK/kVxMIBGTGKIlYkF31Ajr6S4zdbJsE5bAaX
 znvTunb1hJuQjfHdmqSR0WpZ8B8zeRXSvdltwNqJJlvn1NWwlsS8kZ6wh
 8mJyUpHfY5xZolQNDA6xEUWPXcJ2mcjCMXXxtxIGlgDI/I7PI0UxTTf/n
 nJZgs0kt0bqIfX9166ZrQTG1FPjQbW2F11hIBFNizysoCJmttf2SCEJOP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337913040"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="337913040"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740103244"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; d="scan'208";a="740103244"
Received: from uniemimu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 01:58:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 10:58:38 +0200
Message-Id: <20230609085840.114729-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Implement missing invalidations and
 flushes
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

Mesa is seeing unexpected content in some tests.
Fixing those require a TLB invalidation at batch start and a
render cache flush at batch end.

KMD also requires the latter to make sure any GPU side caches are
flushed before handing memory over for reuse. This is implemented
in patch 2.

The former is likely due to scratch PTEs remaining in the TLB after a
prefetch or similar. We could discuss whether user-space should be
responsible for a TLB invalidation after a VM_BIND operation, but
patch 1 implements a TLB flush at batch start for non-LR vms with scratch
pages. For LR vms with scratch pages the TLB flush is incoporated
in the bind fence.

The TLB invalidation can be optimized / coalesced later.


Thomas Hellström (2):
  drm/xe: Invalidate TLB also on bind if in scratch page mode
  drm/xe: Emit a render cache flush after each rcs/ccs batch

 drivers/gpu/drm/xe/Makefile               |  2 +-
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  4 ++
 drivers/gpu/drm/xe/xe_pt.c                | 17 ++++-
 drivers/gpu/drm/xe/xe_ring_ops.c          | 82 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c                |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h          |  3 +
 drivers/gpu/drm/xe/xe_wa_oob.rules        |  1 +
 7 files changed, 97 insertions(+), 14 deletions(-)

-- 
2.39.2

