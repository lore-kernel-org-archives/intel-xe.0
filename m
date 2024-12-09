Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73DEE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 14:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B94E10E4B7;
	Mon,  9 Dec 2024 14:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaQ3rwQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176B110E4B7
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733753556; x=1765289556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E1zL74HVzLBFBfyRGma7Zj2DXmukgPQp6huwLN5bK5s=;
 b=QaQ3rwQBIVispK3EeKEgg7ZKBbD8uTLd39yv4hk0TOhQPBcqyQMWR+G1
 /RUxhiQmq+oVbiH+GmUodlPKHmd0hClP3OMnnc1xiGlUJTC5BhKwoF9F8
 NeNH3p7zfF0Kt9o0KL755Ke+0Lc86/i6DSxi3FxeQKT7smG6pFu1j0U3k
 CqkwNy1JmkFBY36Y4hejhG8LVIZoSi83Yhcvea5JH48zncF8WZu40Qdtd
 DRWVYBvcnVjeGfg2/SuQ19iDTVqSLnzJx6TnbEmKmTPif9MuuQ+DNBtAh
 Vye6/QWfB0PHRg8TyEwQ4vRmjveqPR5XkckdOg9+0sEyx45clCug5y3J8 g==;
X-CSE-ConnectionGUID: iqf8XZtfRpywK2HLUTwYsw==
X-CSE-MsgGUID: 2LDnpMOrTSC12XAWYhplfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33967717"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="33967717"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:35 -0800
X-CSE-ConnectionGUID: CO1yxzxZR4OvxsMJYe39nA==
X-CSE-MsgGUID: NrVhHWs9QDKkv9f3fqrY8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="94768270"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mpatelcz-mobl..)
 ([10.245.245.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 06:12:34 -0800
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH 0/2] drm/xe: adding wait helper for gt async reset
Date: Mon,  9 Dec 2024 15:12:08 +0100
Message-ID: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
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

GT reset is asynchronous. However, in few places there is an explicit
wait for reset to finish via flush_work. Providing a helper which
clearly express the intention of waiting for reset to finish.

The usage of asynchronous reset in sysfs gt0/tile0/ccs_mode creates
a situation in which a user after changing ccs_mode with immediate
query can receive only partial configuration due to ongoing reset.
For instance a single compute engine where 4 were requested.
This sometimes happens in the EU Debugger tests leading to skips or
even failures (sysfs not accessible).
This forces usage of sleep() in tests to wait for reset to complete.

The first patch provides a helper xe_gt_reset_wait and makes usage
of it.
The second patch makes ccs_mode sysfs write wait for reset to
finish.

Maciej Patelczyk (2):
  drm/xe: introduce xe_gt_reset_wait to wait for async gt reset
  drm/xe: make change ccs_mode a synchronous action

 drivers/gpu/drm/xe/tests/xe_bo.c    |  2 +-
 drivers/gpu/drm/xe/tests/xe_mocs.c  |  2 +-
 drivers/gpu/drm/xe/xe_gt.h          | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  6 +++++-
 drivers/gpu/drm/xe/xe_gt_debugfs.c  |  2 +-
 5 files changed, 20 insertions(+), 4 deletions(-)

--
2.43.0
