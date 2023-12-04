Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB21C10F07
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B93A10E22D;
	Mon,  4 Dec 2023 05:37:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D18710E176
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701668233; x=1733204233;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sU1+K8EEG886gMnc+4TkGP4YMc2kC/Q8Gne0cAmUFDM=;
 b=ZIerDH6qAWFaHl6V44XBmG1pCFg4DeyiTZ2v5V18HUKSz+w6ytJZYTyV
 mM4ZFAW/xy53OfznjniK5Uz7xDcBeff4HNj0XRa6U631CgAmNVHlx5xy5
 niZjF0JQ89Mczs6tkkgj5GOgjtrdBeFMQd8Ial1vtQU6S+qWiZl7zrW/G
 yLc5TDdV6GBA7SGHLvQVZGqgbM8LOi/EXxWGRs0CRQZmMs6ngmlu3HqeM
 7VBQj6FDx+z/7yt/nLr/RUkBnfxriyhss51tnSs4DfqMCICOqbcEii77z
 EMdsglONc8SEXyT8HgI/525GFFFmH6htskd5KIMtkkackayMyKVxV0ufi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397574066"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="397574066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="914308801"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="914308801"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:37:12 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun,  3 Dec 2023 21:37:06 -0800
Message-Id: <20231204053709.30013-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] drm/xe: Enable fixed CCS mode
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

Allow static assignment of compute slices to a user selected
number of compute engines. Add a per-gt 'ccs_mode' sysfs
interface for user selection. By default assign all compute
resources to the first available compute engine. User must
ensure that there are no open drm clients while updating
CCS mode through this interface. Enable this for all platforms
with more than one compute engine.

IGT: https://patchwork.freedesktop.org/series/125873/

v2: Rebase, make it platform agnostic
v3: Minor code refactoring, separate num_cslices sysfs interface

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe: Enable Fixed CCS mode setting
  drm/xe: Allow userspace to configure CCS mode
  drm/xe: Avoid any races around ccs_mode update

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  14 ++
 drivers/gpu/drm/xe/xe_device.c       |   9 ++
 drivers/gpu/drm/xe/xe_device_types.h |   9 ++
 drivers/gpu/drm/xe/xe_gt.c           |  13 ++
 drivers/gpu/drm/xe/xe_gt.h           |   2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 191 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  |  24 ++++
 drivers/gpu/drm/xe/xe_gt_types.h     |   8 ++
 drivers/gpu/drm/xe/xe_guc_ads.c      |   3 +
 drivers/gpu/drm/xe/xe_hw_engine.c    |  20 +++
 11 files changed, 294 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

-- 
2.21.0.rc0.32.g243a4c7e27

