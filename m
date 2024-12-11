Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B056E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 11:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D810E857;
	Wed, 11 Dec 2024 11:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIYyIjJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D09510E857
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733915856; x=1765451856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=igHCPOqv7HMpbmB8PY+BNl4lzPcz1/6uLoaZBnSj8C0=;
 b=YIYyIjJq8G4u4gu1X0xcGq/vTH/xAzt8SciKox37hyVuLVZoxIGtN85r
 ZiDfWWbad/SFSNsvWG8Azy4EpUMHhYua/ujw7Cgt8w+CjyARl70Ipqi29
 mlKvowG6XIei5U4SCNWNmDk84uNeFclaOrFb57tNiaLHjW7N76u+ya2xy
 mtLNE06NoJ97eAw4HIB2mgQpmaqLeytpMsM7OyPhNGX+fAofXl/09LBOO
 SZuVttD3KuMKYlcn9qI0MToWv7tCbmTKWp3iWNvcFfSs4xNgH8gKV2oa5
 vs57IDLJNPN+2GwBQwlqngosDRSKCuvQzhUOXYZQy5aa4MEMJT+fu7KM2 A==;
X-CSE-ConnectionGUID: MUXeA6atSeaZebkJ7Nw6tw==
X-CSE-MsgGUID: ZtQKI9IsTJGarIMe83xWcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34430313"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34430313"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:17:36 -0800
X-CSE-ConnectionGUID: JNOE+VAzQaOLPSKIigsXtg==
X-CSE-MsgGUID: WNdI9Iz2S8OIgssvajLxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="96237092"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.244.205])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:17:34 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, raag.jadav@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH v3 0/2] drm/xe: adding wait helper for gt async reset
Date: Wed, 11 Dec 2024 12:17:25 +0100
Message-ID: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
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

GT reset is asynchronous. However, in few places there is an explicit
wait for reset to finish via flush_work.
Providing a synchronous gt reset version and additionally wait helper

The usage of asynchronous reset in sysfs gt0/tile0/ccs_mode creates
a situation in which a user after changing ccs_mode with immediate
query can receive only partial configuration due to ongoing reset.
For instance a single compute engine where 4 were requested.
This sometimes happens in the EU Debugger tests leading to skips or
even failures (sysfs not accessible).
This forces usage of sleep() in tests to wait for reset to complete.

The first patch provides xe_gt_reset and a helper xe_gt_reset_wait.
The second patch makes ccs_mode sysfs write wait for reset to
finish.

v3: - xe_gt_reset_wait to xe_gt_wait_for_reset
    - xe_gt_debugfs.c: force_reset_sync() calls xe_gt_reset().

Maciej Patelczyk (2):
  drm/xe: introduce xe_gt_reset and xe_gt_wait_for_reset
  drm/xe: make change ccs_mode a synchronous action

 drivers/gpu/drm/xe/tests/xe_bo.c    |  7 +++----
 drivers/gpu/drm/xe/tests/xe_mocs.c  |  3 +--
 drivers/gpu/drm/xe/xe_gt.h          | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  2 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  4 +---
 5 files changed, 31 insertions(+), 10 deletions(-)

--
2.43.0
