Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4064DCD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 13:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0255410EA4A;
	Wed, 17 Jun 2026 13:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN28oQT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D3B10EA4A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781703102; x=1813239102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/RcCJtwAHfelMFxnI0XeLnSDKAo0ULV4TGh68JPK9hA=;
 b=CN28oQT/v53HeSkDVr/eAm3Uir7lR/bbAAIj/3jO6LqwI9QrwWEtHl/v
 FIQ+qT3fYVWqTJY5eHBZFhft1q/1abJCxP5ytMv7LkrS3w3Jpj52Ibolj
 N9lYhkryKOhgPJJKbQQZvPaBQqhjKOuWzzidiWRRO9aygW0V1/t1JZsm7
 orcEksl29k4s9nsJWOeEJTp5n8U7Lt0PbnnijG+UAVnb/klNWKv6fUOT+
 svOHk02yK+7VrB1hbqtZL7HY7xSDIGjqfOpxpc0Kirf+NkLWvnecU4IHN
 5ycVLQEmtSFp31RUI2J/uZI0qWj9uw/WN1qYqHdDIA3L2/eMhdNkyHFs3 A==;
X-CSE-ConnectionGUID: T5Yxk7UdTQOfQOdN1oI2Jw==
X-CSE-MsgGUID: /5WGYpg8SgC2De2uB9iOOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93609830"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="93609830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:31:42 -0700
X-CSE-ConnectionGUID: lAcszbjtRa+4sIkd4VUe1Q==
X-CSE-MsgGUID: /zVrQf4HS029AKWj9dKvqg==
X-ExtLoop1: 1
Received: from kkamagou-mobl1.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.253.8])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 06:31:39 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v5 0/1] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Wed, 17 Jun 2026 13:31:33 +0000
Message-ID: <20260617133132.174907-3-gajendra.uttamchand@intel.com>
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

Gajendra Uttamchand (1):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

--
2.43.0

