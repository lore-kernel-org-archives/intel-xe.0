Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C0CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 06:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AF810F49C;
	Tue, 13 Oct 2026 06:00:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329010E726
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 06:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791871216; x=1823407216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+XQldxlM/9RDI/W0fau7EO+7YmdvPICyrsi5J07Yo8k=;
 b=T2OmbxPlP63q+LBGg6ZkvJm0SwOkKbL7NWwokxAezCuRF8fL8p/rph2R
 EWJu6b9WnLZxrfz94WiInpmBctSb38yWcCyooEq3oPtSkwjh1tFge34B7
 EqwW82S9+j5bsPKzsBq1DIwB5qCUoraEedxV7rNpb/K+FyLVDLKnL2RIs
 +heKDQrDlLuHHIz5X4v2FO5FxABCrdiKWe5yX4MHd0HAtZNxEPh5xAqBg
 x48CZwQo+mH+aQD/+2puxEBLPYE6I1TYXhtzqionR8ps34VLiZeEdeK8+
 hR+X+i99UGRqHKI2xCpHxcXOeyK3OddAdEPyMjkTfCWmbKgIE/cx7mGF0 Q==;
X-CSE-ConnectionGUID: V/Qtz5XmQsWa7rmBWpeuHg==
X-CSE-MsgGUID: Gbj/qp4gSmmkdVN+39rGTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="591710"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="591710"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:15 -0700
X-CSE-ConnectionGUID: yM9p4fqoTwCASVOvJ9VRoA==
X-CSE-MsgGUID: fIoCc+8+Sre2cebK7B1yMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="978642"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 23:00:12 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 tejas.upadhyay@intel.com, himal.prasad.ghimiray@intel.com
Subject: [PATCH v6 0/6] Add support to handle memory double-bit ecc errors
Date: Tue, 13 Oct 2026 11:29:59 +0530
Message-ID: <20261013055959.2569963-8-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This series introduces the firmware commands required to handle
uncorrectable memory double-bit ecc errors.

When a error is detected, the driver determines whether the affected
page can be offlined and sends an offline/remove request to firmware
via sysctrl interface. Pages belonging to critical Bos or stolen memory
require a Secondary Bus Reset(SBR) to recover.
Pages configured for log-only handling are removed from queue.

For the rest of the valid pages, the first error is a poison error and a
remove is sent to firmware to avoid marking the page as bad and to
remove from queue. On the second occurence at the same address, we
request the firmware to offline the page as this would indicate a
Double-bit ECC error. Any subsequent errors at the same address should be
because of memory scrubber and a remove is sent to firmware to remove the
page from queue. This is done by tracking the firmware offlined pages by Xe KMD.

At module load, the driver queries firmware for both the offline list
and the queue and processes them accordingly.

Rev2: Rebase
      fix sigid logs
      fix sashiko review comments

Rev3: add a common function for queue and list
      fix other review comments

Rev4: reorder list and queue function calls
      fix sashiko comments
      check userpolicy before soft offlining
      handle -ENOMEM
      fix other cosmetic review comments

Rev5: add xa_err handling
      rename to vram_disable_page_offline

Rev6: fix hooks failure

Riana Tauro (6):
  drm/xe: Separate drm-ras netlink data from device and firmware RAS
    state
  drm/xe/xe_ras: Handle page offline requests for device memory ecc
    errors
  drm/xe/xe_ras: Add support to query page offline queue and list
  drm/xe/xe_ras: Add function to get maximum pages firmware can store
  drm/xe/xe_ttm_vram: Report max_pages reported by firmware to userspace
  drm/xe/xe_ras: Track offlined pages by firmware to avoid duplicates

 drivers/gpu/drm/xe/xe_device.c                |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  11 +-
 drivers/gpu/drm/xe/xe_drm_ras.c               |  16 +-
 drivers/gpu/drm/xe/xe_drm_ras_types.h         |   3 -
 drivers/gpu/drm/xe/xe_hw_error.c              |   6 +-
 drivers/gpu/drm/xe/xe_ras.c                   | 312 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h                   |   5 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  85 +++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   6 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   9 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   2 -
 11 files changed, 418 insertions(+), 41 deletions(-)

-- 
2.47.1

