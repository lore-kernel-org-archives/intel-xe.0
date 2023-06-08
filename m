Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF83C7EE43
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 20:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1AE10E613;
	Thu,  8 Jun 2023 20:09:03 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16DA10E610
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 20:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686254940; x=1717790940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F7taUPHOKhVkJGnlPJUH8Z9pcsxq0kF1hSus57NoS+c=;
 b=dmPtmt5/iqgk+wJfm5GWlpD11jRxcCsbyfUvvmwrlOUDEmSY3+M1mrLi
 yObob47TMFO9LKKc9SaZSTSJ3iOi1dHqHSf4edwCCTiXCzAeooJjmIOOt
 dDlcPj4wqxaEZszZ51Z0U9BntI+g82LoRxqiY82xG/hsga4vfmdL/3H5n
 SN43du3YQqVgA7kVpru8xARvpu3EalyGj0JZaAsmKa75C8cpK+wv4uc3h
 aYvpreqwJZgD+KeBIdx1n2sc8bo0qvc3F8rPUjy1vgg29DCcPJ2/VB0B6
 W6MKEUfLBlPHMs6h2ON7jeg3t7xVO+Zwil/y771y6FOk6fm5LbvHrTKcE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357427587"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="357427587"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739888044"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739888044"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 13:08:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu,  8 Jun 2023 13:08:53 -0700
Message-Id: <20230608200857.124884-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] GuC doorbells for submission
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

Send GuC doorbells part of series [1] individually for review. Patch #1
in series will merge on its own [2] but included for CI.

Matt

[1] https://patchwork.freedesktop.org/series/117156/
[2] https://patchwork.freedesktop.org/series/119095/

Matthew Brost (4):
  drm/xe/guc: Read HXG fields from DW1 of G2H response
  drm/xe/guc: Return the lower part of blocking H2G message
  drm/xe/guc: Use doorbells for submission if possible
  drm/xe/guc: Print doorbell ID in GuC engine debugfs / error capture

 drivers/gpu/drm/xe/regs/xe_guc_regs.h    |   7 +
 drivers/gpu/drm/xe/xe_guc.c              |   6 +
 drivers/gpu/drm/xe/xe_guc_ct.c           |  12 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 295 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
 drivers/gpu/drm/xe/xe_guc_submit_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_types.h        |   4 +
 drivers/gpu/drm/xe/xe_trace.h            |   5 +
 9 files changed, 331 insertions(+), 8 deletions(-)

-- 
2.34.1

