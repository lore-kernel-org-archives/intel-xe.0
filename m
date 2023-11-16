Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB9AC5ACB3
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53E010E121;
	Thu, 16 Nov 2023 03:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5203B10E0B5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105682; x=1731641682;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQ/BugxdF7YeEu38kzt2b0BUQ+itJExxvL2aU4pAKk0=;
 b=B3fl+uqYTvIpVT1r8NB1Te0RkmbIVm4NJyYaBr3536pViiTxqpl9mOzV
 51pPocs5OMAJpkoecw4k1xw1y8W1kdwDP2DYubhO1giEWh2AQecttDwnZ
 crqUTwhJ9pdytBp1ySGvaU3wQ9qJ3E9Z/P8dqQMKZusbgFBqy3p/0CxqG
 /FbYNGYwcerXdn7/utAXIXSrKuwxsWMNdI1NTXMtGDBC7I5I0hfeiRuP2
 56REZ5jryaajasog6JKff7LZXQURfNj75ePWpAaKGqcsz1MOzYNOGg/Iz
 33g1EPibfmyXKT9oXZjS2euxw+Hk3la8ArlDtOfbRB2Io+6VTg26D1HpD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9648707"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="9648707"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="831129654"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="831129654"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:34:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 19:34:33 -0800
Message-Id: <20231116033436.1713-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe/pvc: Enable fixed CCS mode
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
CCS mode through this interface.

Support this mode for PVC which can be extended to other
platforms in future.

IGT: https://patchwork.freedesktop.org/series/125873/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe/pvc: Enable Fixed CCS mode setting
  drm/xe/pvc: Allow userspace to configure CCS mode
  drm/xe/pvc: Avoid any races around ccs_mode update

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_device.c       |  9 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.c     | 63 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
 12 files changed, 240 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

-- 
2.21.0.rc0.32.g243a4c7e27

