Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414F0C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCE510E20D;
	Fri, 24 Nov 2023 15:23:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E9110E20D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700839423; x=1732375423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rEvTQmLeWMHI67DDHJTjD15sDgNIqQhVXgfL36TW3o8=;
 b=g84pvUUUGr8CiqbE/XBa5X6srKqXIN2ywV+xTJx6n/xM8lzJvgnlHSjh
 DKf13BdxnJjg1rfOqQuj6/S89yxS2hCa4nrw0U5DlHyns07KEkLUN4FTa
 7zrAp/H9Z5WlNNgzN57iyr0KG10CHdmb8tlSKAZZXAWGhzqTEycrQzsMz
 q+MTkyyugWeKjSb62SHmpkXNPrSqhiheUOTMx3bbWDd3O4K/olGX+jiLl
 UcRj9/PMqYQY8hgxgiXu1Nwg3su4dB9l9ingD9gmgNNonirI12aDH4w5U
 woHN39EbgqBfyaIWZVpmsir4H3PbJNuE82ACX/jjBrnwOLoSsSsZDN/4X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478647662"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478647662"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858407715"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="858407715"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:23:18 +0100
Message-ID: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe,
 drm_xe_uapi: VM mode renaming and uapi update
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename the VM modes and do a small update of the uAPi
(fault mode now requires also the lr mode flag to be set).

The first patch is internal changes only, no functional changes.
The second patch updates and the uAPI and documents accordingly.

Thomas Hellström (2):
  drm/xe: Internally change the compute_mode and no_dma_fence mode
    naming
  drm/xe/uapi: Use LR abbrev for long-running vms

 drivers/gpu/drm/xe/xe_exec.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c         |  6 +++---
 drivers/gpu/drm/xe/xe_sched_job.c  |  2 +-
 drivers/gpu/drm/xe/xe_sync.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm.c         | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.h         | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
 include/uapi/drm/xe_drm.h          | 20 +++++++++++++++++++-
 10 files changed, 60 insertions(+), 42 deletions(-)

-- 
2.41.0

