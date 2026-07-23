Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C957C531CB
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 09:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0306910E396;
	Thu, 23 Jul 2026 09:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOopWjyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3210E396
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784798890; x=1816334890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sEz5E6G5C+x/IaYkrxXAOtQxMIaDid948rqYtrnpiR4=;
 b=cOopWjyioDhtFWcX+9HdicUSqnYoK6svrl+7HXlLWU7oviV6GtJxb946
 /3cQ/Z6wWghSTFhi1brBTDNWQCx8oqfy/3CxZo7fyN7z4a61IvQ7HBQWa
 1SdpZHo09FaqdkPUzhc/FXQGqIoI7IxotphbWUwk8CXf45UMoWHXp375v
 sXe7ifQOKX1VrnCMwW2K5s8TRaRFEvW4QKz7SkAcXm+kN+dsa7VmeO63d
 +ffQ7wE+mal2F/YMXlCYdlXuV2edFjQ8L2eu+8NVMDcqqqbO9cXF/5TvY
 PB7/+cl8nKKOmaaT+7+EoxHhhpmoWS3dnJNuD3FwA+/9ktPagUZRm9OMe g==;
X-CSE-ConnectionGUID: P/qUz6JXRGqpWKBOvGbRzg==
X-CSE-MsgGUID: 77LSru9AQPa3BV18WcoDDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102858737"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="102858737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:09 -0700
X-CSE-ConnectionGUID: 5NUTVx/fRpKmbn4nG2hm0Q==
X-CSE-MsgGUID: wXLEd/QJRoWeN0KI570AWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282873614"
Received: from nbidikar-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.130.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 02:28:06 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v6 0/3] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Thu, 23 Jul 2026 09:27:52 +0000
Message-ID: <20260723092751.250613-5-gajendra.uttamchand@intel.com>
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

Fix timestamp handling for Xe LRC contexts to avoid races and false
timeout detection. This patch documents and centralises the
CONTEXT_ACTIVE sentinel and makes MMIO reads of CTX_TIMESTAMP TOCTOU-
safe by verifying the LRC-stored timestamp before and after the MMIO
read.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

v2:
Dropped the redundant second patch (Matt Brost)

v3:
Added the Fixes tag for the original commit (Umesh Nerlige)

v4:
Added Reviewed-by for the original commit (Umesh Nerlige)
Added Acked-by for the original commit (Matt Brost)

v5:
Fix incorrect 'From:' username in commit header (Kamil)"

v6:
Fix AI review comments from sashiko.dev
 - Fix torn read of CTX_TIMESTAMP from LRC
 - Fix ABA race on engine migration in context timestamp read

Gajendra Uttamchand (3):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
  drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
  drm/xe/lrc: Fix ABA race on engine migration in context timestamp read

 drivers/gpu/drm/xe/xe_lrc.c | 88 ++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++
 2 files changed, 80 insertions(+), 15 deletions(-)

--
2.43.0

