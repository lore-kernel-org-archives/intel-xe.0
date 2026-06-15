Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C04CD8CA8
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 03:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145510E15F;
	Mon, 15 Jun 2026 03:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cA1F/OvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6202210E15F
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 03:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781492550; x=1813028550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NYZmBXOiizj8Szjqtiq8r2fDD/u/hcU45zzGA7AeTXs=;
 b=cA1F/OvZAn0WeeETx8TEn94WwYORYsKuO8xjTDTdgyzHHhgB90NytRxX
 oHzZdSDwhvtvxbnzOWN7k183HjR6vA4ZS2S20y8XGTo2sGoyI5eICjJrm
 7aPT/Hl9aKI51JlovUWogUphpAG9eYRRw48a3ixG8JUkPWSEWonC8RK0s
 miZJ+dFidvGSNQWFvgPXiSMtk5IhM1YQ50HSsoWtV2piEWtbpSHDG4Erz
 AxHj0SZOo6o4Qnt/valW6pKMBmbIwoIL2eRdOxEEF4GmtEoO27O3t/Md5
 8vz87CVm0E0pFu3ly0H8BF6vYu5V+yMfLJHegxTMDklqftSSqjBXKHUeg g==;
X-CSE-ConnectionGUID: A9o7m1NcRn6QEcqcbZ6Hxw==
X-CSE-MsgGUID: bIBOaOL7Tu6M2YRd6pRIWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81967711"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="81967711"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 20:02:30 -0700
X-CSE-ConnectionGUID: bU6Nenc6RM6uw1EwrZywxA==
X-CSE-MsgGUID: +qSR3qA5Q0qlEq4kcQcyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="251622354"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.72.118])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 20:02:28 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v3 0/1] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Mon, 15 Jun 2026 03:02:21 +0000
Message-ID: <20260615030220.348289-3-gajendra.uttamchand@intel.com>
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

Uttamchand, Gajendra (1):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

--
2.43.0

