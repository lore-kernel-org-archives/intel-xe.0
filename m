Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB65C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EADA10E621;
	Thu, 16 Nov 2023 15:39:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC16310E621
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700149187; x=1731685187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=99lgD0Zj2eOBzvbcHJVzBTbar0/HaU/B8sv4l25GJMU=;
 b=Kd5PzA5WADDxA9mS6ifEKuZIZO16L0WvdzCOdNS+I+8p1jbFh5yBc2Hf
 Cp9qLg89hgydzEyt/v4fYGuyb1b101L/7HsSMmNJRV++6w3rEae1JcuvM
 Wu6y5b84M9Hkl0j19lx9qDTJ+OezVSwZwhY16PGSq1UDGK7TSAOOSwGmF
 N9yeKsEy7J6yQtqv7MV488fjTUe5gAUqqxblkn/5WuKxqN2tfDy8u8GZ8
 4IfQUTAuKQGmJz68CTtSmU5/NdwuRzt7ult0eu0RvK3AzKs+NpNRXIWla
 xsX1Gq0AGTujUGIC7NCBijinVk7mglj8lEJFqA6Lh0c8jtP33kUMGZhiC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="393963158"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="393963158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; 
   d="scan'208";a="6745422"
Received: from tjlunife-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.34.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:39:24 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 12:39:00 -0300
Message-ID: <20231116153901.31941-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe/mmio: Make xe_mmio_wait32() aware
 of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The current implementation of xe_mmio_wait32() is susceptible to
preemption/interrupts causing false timeouts. This series proposes a fix
for that.

This is v2 of [1].

Changes in v2:
 - Add a patch moving xe_mmio_wait32() to xe_mmio.c
 - Use a barrier()-free implementation.

[1] https://lore.kernel.org/r/20231114220922.88268-1-gustavo.sousa@intel.com

Gustavo Sousa (2):
  drm/xe/mmio: Move xe_mmio_wait32() to xe_mmio.c
  drm/xe/mmio: Make xe_mmio_wait32() aware of interrupts

 drivers/gpu/drm/xe/xe_mmio.c | 59 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h | 39 ++----------------------
 2 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.42.0

