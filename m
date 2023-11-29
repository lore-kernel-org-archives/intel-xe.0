Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE95C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 02:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEB010E1E9;
	Wed, 29 Nov 2023 02:57:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8143810E1E9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 02:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701226640; x=1732762640;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iQj3kJwhVdVxCK4Wuh1MUpu7+ZhVOhz87Lbo2uuDdqg=;
 b=mUIg5won8y8QJitqAU2RNZz+tWsJhBnquGLP4d5skldYwziej9KlbIb8
 4V5dN6rSFUT5stGHhxW1SWQ+gMNk098+DAUCDRM6ssVF2iut4sKR0/zqM
 on209CpTlTUJsBopvqlZrLn7UwC1TxcYVA8Mt1drLr75ovYbfl+0srhaa
 DTGt7MkXx7fz4UOZqvuPvKeJa7qNeFT3Tw5BMqNuUwYqBbQExk90JpHZK
 BxuZmbVqysF58ghnQsItsmMKo4rGkzd4KZknUhd0sIILB0vNB75x5wd7G
 0/f+GEVoyD7WAe3kuTfLkr1PqLNbU4Lo83YHydLlGdXyE9TOxOKYt7Mj0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373265512"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373265512"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762140430"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762140430"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 18:57:13 -0800
Message-Id: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] drm/xe: Enable fixed CCS mode
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

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe: Enable Fixed CCS mode setting
  drm/xe: Allow userspace to configure CCS mode
  drm/xe: Avoid any races around ccs_mode update

 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  14 +++
 drivers/gpu/drm/xe/xe_device.c       |   9 ++
 drivers/gpu/drm/xe/xe_device_types.h |   9 ++
 drivers/gpu/drm/xe/xe_gt.c           |  16 +++
 drivers/gpu/drm/xe/xe_gt.h           |   2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 157 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  |  24 ++++
 drivers/gpu/drm/xe/xe_gt_types.h     |  14 +++
 drivers/gpu/drm/xe/xe_guc_ads.c      |   3 +
 drivers/gpu/drm/xe/xe_hw_engine.c    |  20 ++++
 11 files changed, 269 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

-- 
2.21.0.rc0.32.g243a4c7e27

