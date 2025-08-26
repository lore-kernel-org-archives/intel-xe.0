Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5B1CA0FF6
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA01810E6B5;
	Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfQvMY2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2889710E399
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756234460; x=1787770460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+oPWYNKCHMMoDtL2QFwlRi2oH/x3q/reldRk02R4qfI=;
 b=UfQvMY2qsAyL13jcGuvXNKUUevPCVErNQMxfR1cf/saG4IMzV8/wZCPq
 /wYBEkAALReJWxfDUPt3nxWTKKawKVha9nZzjwLY1vao9r4X3jk+Yewj8
 72A5c7gu2STgtoiMXi/EdmwWSJVDQWN8o5VbR4/k/ctnpWBq6QdscONq0
 ZoNlO/uJHzEP8un+lG3qwNFqZCYEFX4gLy5Eu8R4ZLuc50oToiFg98ARx
 nO1tF/kRNl3jzacCOIqutOypTMgh4GgqQoSdgdQO49CR9Qdb3DtXCAiTn
 Q8R+udbFGhvb4QDiUq6lfNX/kXdhsusexfeFEZpX5r5L/JiwBVxBkLAgk A==;
X-CSE-ConnectionGUID: IhrXNlYITEuC9P6sZgmc+w==
X-CSE-MsgGUID: h3p280IZRniv918HNkHk5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62317678"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62317678"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:54:18 -0700
X-CSE-ConnectionGUID: zb4QXWpnQgep1hwm1aVFAA==
X-CSE-MsgGUID: 6d/TRjJxRFqSMpzkiQparQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169822486"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 11:54:17 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 0/2] drm/xe/xe_vm: Add error injection support to lock and
 prep
Date: Tue, 26 Aug 2025 18:54:17 +0000
Message-ID: <20250826185416.94640-4-jonathan.cavitt@intel.com>
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

Error injection should use the error injection interface, and should be
decoupled from CONFIG_DRM_XE_DEBUG.  Remove TEST_VM_OPS_ERROR from the
code, and add error injection support to the function
vm_bind_ioctl_ops_lock_and_prep.  This necessitates marking the function
as noinline.

v2: Only noinline vm_bind_ioctl_ops_lock_and_prep when function error
injection is enabled (Brost)

Jonathan Cavitt (2):
  Revert "drm/xe: Add VM bind IOCTL error injection"
  drm/xe/xe_vm: Add error injection support to lock and prep

 drivers/gpu/drm/xe/xe_device_types.h | 12 -------
 drivers/gpu/drm/xe/xe_pt.c           | 12 -------
 drivers/gpu/drm/xe/xe_vm.c           | 53 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_types.h     | 14 --------
 4 files changed, 31 insertions(+), 60 deletions(-)

-- 
2.43.0

