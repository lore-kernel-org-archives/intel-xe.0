Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BCACCFA06
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 15:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08EB10E423;
	Mon,  3 Nov 2025 15:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9xcz6XV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2E210E423
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762183211; x=1793719211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bx3HwK+T4PIH+rE+f2/eZFmSe6x4Ww83Tqjz0V/gcBk=;
 b=k9xcz6XVjC91hNuoPlYJDcke9O0cujZ7KvbEybyXV+EVD5EbZanNhCd3
 990NJ/JyXyi1oL3n+9jYdUK9KQlFfXjmsJGh8TmEdiEQfCINqa5nXlmJX
 /epPRwocXZwU2hvLU/3c42OAfPoxWYh9uG97rLb9k+c84O9oU0lMxD1u7
 bzvT4ZU10BRrj2G4ZwiWxMzjketQVwOisDUQner5gGIz3UBT2iWvONjBs
 0bQPu5QGq5/GRL/jreCiTnUTGT8lEmfMCI6SingoqhqMZ7qVerMGkW3Fo
 HWRyfj0hxRg2E18ExwArWBua9hgEG098Jaz1okddE0cdGd7sSC0PTVlcA A==;
X-CSE-ConnectionGUID: bN60vn18Tuya5c50fZpC1A==
X-CSE-MsgGUID: +toJS0qSRjSb6Sj0Jy4Cfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64177097"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64177097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 07:20:11 -0800
X-CSE-ConnectionGUID: /TEy5zSgRIiLJvuKKSOtEQ==
X-CSE-MsgGUID: 5zC1ac11St+ad+eBdAv6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187205787"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 07:20:09 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Improve CCS save/restore series (cont...)
Date: Mon,  3 Nov 2025 15:20:04 +0000
Message-ID: <20251103152006.1954098-1-satyanarayana.k.v.p@intel.com>
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

CCS copy command consist of 5-dword sequence. If vCPU halts during
save/restore operations while these sequences are being programmed,
incomplete writes can cause page faults during IGPU CCS metadata saving.

Use shadow buffer management to prevent partial write issues during
CCS operations.

Satyanarayana K V P (2):
  drm/xs/sa: Shadow buffer support in the sub-allocator pool
  drm/xe/vf: Shadow buffer management for CCS read/write operations

 drivers/gpu/drm/xe/xe_guc_buf.c      |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h      |  3 ++
 drivers/gpu/drm/xe/xe_sa.c           | 51 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sa.h           | 19 ++++++++-
 drivers/gpu/drm/xe/xe_sa_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 20 ++++++++--
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
 8 files changed, 150 insertions(+), 8 deletions(-)

-- 
2.43.0

