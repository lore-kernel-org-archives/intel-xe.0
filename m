Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE09C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4C210E436;
	Mon,  7 Sep 2026 08:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ByEORxiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888AA10E436
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788770170; x=1820306170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0JGFcyfc+Q7iawQ7W5lZLOYd4oR+ycoHDwIe8BuAMtI=;
 b=ByEORxiYo211ZR4RBlll6PLwETXQPQNJUIsprAsOaerClXj2lzlKSPcy
 tpqrWLyDq6SXKKd97AzpZeE5+4tH2K1RqswEH8JO18d/A60J7lRbNXzNs
 TLlIfYPWU8lsnVO9J1MebQs1K2AETKHWhPzqRqFZvUdPvC3iOWRP/1qHV
 0+IPXVNK4TqhR7B5ncG40xq4v2QS6X0UrtUu1bM0DdNoAFNy9LaaugR0H
 uDGJWLWBFY7VHk1x+k4hElpmQuAhEn0aGB6HtJqg1+ZriYAiARWqHf/QE
 TToX4h3vbLytxRLNLJji+G3pJQz068Ivh9HDdOL5oEfdEwbpCNgWSN7GB w==;
X-CSE-ConnectionGUID: 0rYIG/n7RzSo5wmHUJXuFw==
X-CSE-MsgGUID: Xyc/uK4bQayiq8KM17jqFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99829307"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="99829307"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:10 -0700
X-CSE-ConnectionGUID: qcbdXSS/R2u+BOkUgGA0Eg==
X-CSE-MsgGUID: a/Y/EWmRQ5aLR6EBB3Sr5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="266299807"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 01:36:07 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 0/2] drm/xe/pcode: Increase default mailbox timeout
Date: Mon,  7 Sep 2026 14:05:18 +0530
Message-Id: <20260907083520.192418-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

This small series raises the default pcode mailbox timeout from 1ms to
10ms and consolidates the value behind a single shared macro.

We have observed sporadic mailbox write timeouts where 1ms was not enough
for the command to complete, resulting in spurious -ETIMEDOUT failures.
Bumping the default to 10ms avoids these while staying well within the
pcode mailbox specification guidance.

Patch 1 introduces PCODE_DEFAULT_TIMEOUT_MS and switches the default
pcode read/write paths to it.

Patch 2 drops the duplicate PL_WRITE_MBX_TIMEOUT_MS macro in hwmon and
reuses PCODE_DEFAULT_TIMEOUT_MS, keeping the power limit write in sync
with the pcode default.

This series continues the effort to address the review feedback received
on patch series https://patchwork.freedesktop.org/series/171303/.

Karthik Poosa (2):
  drm/xe/pcode: Increase default pcode mailbox timeout to 10ms
  drm/xe/hwmon: Use shared pcode default timeout for power limit write

 drivers/gpu/drm/xe/xe_hwmon.c | 7 +------
 drivers/gpu/drm/xe/xe_pcode.c | 2 +-
 drivers/gpu/drm/xe/xe_pcode.h | 4 +++-
 3 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.25.1

