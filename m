Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4275FCD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 05:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0137410E1BB;
	Mon, 15 Jun 2026 05:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ik5/kXNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486F10E1BB
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 05:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781501977; x=1813037977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n6Yeb0U5If38S2iw9/PIs68tZhoHVrlTB8PJ3soZhfE=;
 b=Ik5/kXNeKiIgvQiTqKM6fAeTs28eFKcW5Zkumrhcp2s/DOlmzd9waaZ0
 MoRArSAQ+YQKnzqnGk6XMVFxPqPOO0Ri84lVlGyUJwoFCknEEnF7QNW6d
 O6nfGRFogNFFjnEPECMHVp4t8X0UbYGMBztSOgt3oC5IWlwb8ZJnqWvyh
 DWsv1FB/X69umsLP7ssObFfpYZxzX3/d4f0pnjtATg8KbM4DZvR23YWTw
 9BlFdH/0qBngPiignRlUlAg+s5gz+YUfl6GgxVjsLPADmShux+O67gcpu
 RjyZNlanpsYnkOPAOudEckk9ePVr8FPN6OudlztZ5xOrf42hgsR/mB7O+ Q==;
X-CSE-ConnectionGUID: mbZxVrwtR7KlnJJ0+YQByQ==
X-CSE-MsgGUID: Ezi0vr6NSWm/e4McFRDu9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81250301"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="81250301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 22:39:36 -0700
X-CSE-ConnectionGUID: yz1i4J+9T/+PYY7HObBOeg==
X-CSE-MsgGUID: /HahTyaXS5Cvr8c9eWzjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; d="scan'208";a="241021065"
Received: from soc-5cg5233szh.clients.intel.com ([10.66.72.118])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2026 22:39:34 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v4 0/1] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Mon, 15 Jun 2026 05:39:26 +0000
Message-ID: <20260615053925.384728-3-gajendra.uttamchand@intel.com>
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

Uttamchand, Gajendra (1):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe

 drivers/gpu/drm/xe/xe_lrc.c | 29 +++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.h |  7 +++++++
 2 files changed, 28 insertions(+), 8 deletions(-)

--
2.43.0

