Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D34BC43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D05910E394;
	Tue,  7 Jul 2026 22:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCWU1Du1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C17710E520
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462107; x=1814998107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zqy7Ks09z56/2/ELiHpnaEDVDYpFuFNkJSGWav07iE0=;
 b=oCWU1Du12OeyWIgkj4GQ9zMbIQCQCC9SMf5BuWNGQFgG1IDcBoOAO6h7
 Qu3dZjoRTdPC3u/ssXqlvMUnHVKGpqoZLL7nrcRY4SJKDFvxk46yp3aB3
 p5DcpqSDWvCl90qG1bdb4cHMmnZxzxwA0PneLdbDuCv448QCzuOZHS/x3
 ztnPInpzAXAEQUWnehuYwXVC8kui9yT0ME7Qcilia2VKgxnmjaLC2pL4h
 j5zU1uxDIzXkpo6doJ7xSQDZ3AWfBa/IpcFQJGD/2Xy0n/GI8/Fx0mOqH
 2rUqE/TucoG8PQ+8StkQTuF8Ih6NE4WUVQRLi9RGQS863DRD1nSAc7QpY w==;
X-CSE-ConnectionGUID: cm4Khv+MR9+DRqNmw3ceBw==
X-CSE-MsgGUID: 8krXPvtdScCHYCsU/TD8Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176508"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:26 -0700
X-CSE-ConnectionGUID: ZUK3nqJVQ0mfY1l0I12/Jg==
X-CSE-MsgGUID: uEoIRy9hTtKl0yo+laLw/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487646"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 00/13] drm/xe: Add and use more KLV helpers
Date: Wed,  8 Jul 2026 00:08:02 +0200
Message-ID: <20260707220816.677-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v1: https://patchwork.freedesktop.org/series/169511/#rev1
v2:
    don't mix units, report too long string (Michal/Sashiko)
    don't allow to truncate object (Michal/Sashiko)
    avoid KUNIT_ASSERT under mutex (Michal/Sashiko)
    add more tests (me)

Michal Wajdeczko (13):
  drm/xe/guc: Allow to print single KLV
  drm/xe/guc: Prepare to print group KLVs
  drm/xe/guc: Add basic KLV encoding helpers
  drm/xe/guc: Add string KLV encoding helper
  drm/xe/guc: Add object KLV encoding helper
  drm/xe/guc: Add KLV parsing helper
  drm/xe/guc: Formalize Reserved KLVs
  drm/xe/tests: Add GuC KLV helpers basic tests
  drm/xe/tests: Add string encoding helper test
  drm/xe/tests: Add object encoding helper test
  drm/xe/tests: Add GuC KLV printer test
  drm/xe/tests: Add migration packet test
  drm/xe/pf: Handle migration descriptor using KLV helpers

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +
 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h   |  27 ++
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 444 ++++++++++++++++++
 .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  |  88 ++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       | 258 +++++++++-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  10 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 117 ++---
 7 files changed, 886 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c

-- 
2.47.1

