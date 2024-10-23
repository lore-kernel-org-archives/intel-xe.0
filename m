Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C9BD2CDF9
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 00:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6C10E33C;
	Wed, 23 Oct 2024 00:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyqaQ6X0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3911E10E33C
 for <Intel-Xe@lists.freedesktop.org>; Wed, 23 Oct 2024 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729642657; x=1761178657;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6B8DoprB8ddwapzVlbPH9p19cDlCvfkuPpfIgXXojeo=;
 b=TyqaQ6X0Z22rRwVBgmusX1wmsyxGG5VHgMxxXqUPLDn5FmfBIsOejb3p
 AWScuv/o6Y4n3zh6X7fy+ibRYQI9JP5V6A9olHy/lpe/J+fPbDoTeS1F+
 fvd+/jXzfAUm3iCwRHTfX4eD8Y7ikYviyCwdzCXOKnPwC8kENZp2NKrZX
 1R9e1gsd3CVtq5G+eHK600ov+PteWLSqS3cWCwCQq0vDLg/qUd++4LNtv
 TUVdrAsYMexAbeSP6/VjrGsUoNBX0qtFQVH9KuS5pYsoZyr+zBeA57EZ9
 NA0cEE30eBpZlbk/QCoe1cIm4DrypIGPIaQ3aye3sItnZS0O/oXL85iyS w==;
X-CSE-ConnectionGUID: Yfo83UYkQBqOO/tZTXOUPw==
X-CSE-MsgGUID: MRthwFaPSoiDK80PeGL2Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16833081"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="16833081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 17:17:37 -0700
X-CSE-ConnectionGUID: XzkaLlkrQy6io+6seIxNkw==
X-CSE-MsgGUID: rTOGPcfnTwuVq6+MDWvCaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80447331"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa007.jf.intel.com with ESMTP; 22 Oct 2024 17:17:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] drm/xe/guc: Improvements to GuC debugfs info
Date: Tue, 22 Oct 2024 17:17:33 -0700
Message-ID: <20241023001736.1766523-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The full CTB content dump is quite large, not human readable and
rarely interesting. So split it out of the guc_info file and into its
own guc_ctb file. Also add some extra blank lines to improve the human
readability of the info file.

Also, the GuC timestamp is actually more than 32 bits wide, so save
and print the full 64 bit register. It's still not the full 64 bits
yet (only 36 bits on current platforms) but the extra few bits might
be useful.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/guc: Capture all available bits of GuC timestamp
  drm/xe/guc: Separate full CTB content from guc_info debugfs

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  3 ++-
 drivers/gpu/drm/xe/xe_devcoredump.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc.c           |  5 ++++-
 drivers/gpu/drm/xe/xe_guc_ct.c        | 25 ++++++++++++-------------
 drivers/gpu/drm/xe/xe_guc_ct.h        |  8 +++++---
 drivers/gpu/drm/xe/xe_guc_debugfs.c   | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_guc_log.c       |  6 +++---
 drivers/gpu/drm/xe/xe_guc_log_types.h |  2 +-
 8 files changed, 42 insertions(+), 23 deletions(-)

-- 
2.47.0

