Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA85C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 00:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE58110E30E;
	Tue,  9 Jul 2024 00:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifNIX2wV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93210E211
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 00:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720484920; x=1752020920;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3rAjUlolQ7Zr2H2Zwp4YpIkHb3TNtawk0cj2tvubevw=;
 b=ifNIX2wVgofjChZBaa0opud4SLMswdgO+0Z/JreSGfFT+UYvneY92I3a
 bypf2Ei19CS+1l9Bd4oIWyTJjJTruty4PQ1GZ7hNlmryHN1Q2PSF69u1N
 WzPlutCmmpswvl/tazCJqP/mfWFRae30yeNwkROduETAZatMzE/TLHUmE
 jT6lwu36a/hLnpJkEdX52r7A7G/M0zm18iYixJqcN0TWYRcrXaMZdEVP3
 4+Wd4dcRcvD9Q9JU3UTNIfgmOr+x0qvBXgHtIJS6ENm0R+j7JMIUTlx/t
 JlYuCOm7l3RNI1mbgrqbIPMk5pN/t2Z0RJRzTce15lU8bSNujPYF2n+xA Q==;
X-CSE-ConnectionGUID: 9U9hbv69Qt28OQAK02No+g==
X-CSE-MsgGUID: aPJ4zfKMS0uXYfJrZjpLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29105701"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="29105701"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
X-CSE-ConnectionGUID: OOT9tGhgQkS+UM6/KIRRQw==
X-CSE-MsgGUID: Zl4VbtPwQ0allWXKo2WmAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; d="scan'208";a="47630942"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 17:28:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH v2 0/4] Have xe_vm and xe_exec_queue take references to xef
Date: Mon,  8 Jul 2024 17:28:31 -0700
Message-Id: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

xe_file_close triggers an asynchronous queue cleanup and then frees up
the xef object. Since queue cleanup flushes all pending jobs and the KMD
stores client usage stats into the xef object after jobs are flushed, we
see a use-after-free for the xef object. Resolve this by taking a
reference to xef from xe_exec_queue.

Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

The series adds xef refcounting and ensures all consumers of xef take a
ref to it.

v2:
- Include review comments from v1
- Squash patch 3 and 5 from v1 to add Fixes/Closes tags

Note: Patches 1 - 3 can be merged independently

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe: Move part of xe_file cleanup to a helper
  drm/xe: Add ref counting for xe_file
  drm/xe: Take a ref to xe file when user creates a VM
  drm/xe: Fix use after free when client stats are captured

 drivers/gpu/drm/xe/xe_device.c           | 56 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.h           |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_drm_client.c       |  5 +--
 drivers/gpu/drm/xe/xe_exec_queue.c       | 10 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
 drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
 7 files changed, 69 insertions(+), 21 deletions(-)

-- 
2.38.1

