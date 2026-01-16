Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7473EC982C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFBC10E00E;
	Fri, 16 Jan 2026 22:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvr0XjTE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14610E00E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601020; x=1800137020;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ew8liXiX9xemIIYhDmYRU4JfUFu264Nc7gtS8QgZDM4=;
 b=mvr0XjTE3WR/1T/Qy1ue+NE6izli9R/k6ha5m8W1sy5iAMB2BKL7q8Ub
 +M74vT7N2+tFwGX9PZgS+46idQNauF7dnjSqFLcuTTXOthpJ53BpihmNj
 04EhuLXGJakTvcy47fEDcsJ4KYaHEVNkd1Enkm4g8PdHq3zkP6rtcAdpv
 lZgWBJnnvSvmA13CHoxssi4GOYud0WX9ioOn4Er8w2ey8mAtPeiNM4sf7
 8ZQlBrfTfPp6BiK1/drIUkqSQ29wi5LHHTT7YUw+mqwCKytBiSjXNNzlD
 jqJMMQP1hGkunkWoUprbW+PDLVNYtVEELJlbBT7NPplPfFqkW4FTPU2VJ g==;
X-CSE-ConnectionGUID: 5vgE7ibpRUySyl/Pq2VJTg==
X-CSE-MsgGUID: nWoHQHPGTxKyWathdJi+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81035378"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="81035378"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:40 -0800
X-CSE-ConnectionGUID: sh6lnuCGRpWONwYnNwNyRA==
X-CSE-MsgGUID: DxDdHrtjSTeeBRpY+4e4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204959415"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] Enable multi_queue
Date: Fri, 16 Jan 2026 14:03:31 -0800
Message-Id: <20260116220333.861850-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fixup job timeout support multi_queue and enable this feature.

Matt

Matthew Brost (1):
  drm/xe: Ban entire multi-queue group on any job timeout

Niranjana Vishwanathapura (1):
  drm/xe/multi_queue: Enable multi_queue on xe3p_xpc

 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 120 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   2 +
 3 files changed, 99 insertions(+), 25 deletions(-)

-- 
2.34.1

