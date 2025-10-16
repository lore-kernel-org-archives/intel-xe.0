Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAF2CCD194
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 12:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C710E9C6;
	Thu, 16 Oct 2025 12:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSDei2S0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C09A10E9C4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760616237; x=1792152237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E0kC2nRpLA3qPyyYO7TWhDrhwTSilyoiyPJd15YQlqI=;
 b=bSDei2S0whQIDkebshqowodFcYox9jJiH1xSB4Iw3OclmsUcVGYnqNDM
 l7UkuT8shM/k7Cif3jRMCXYPejFyQdr17YT+Drk+HDX0cRWSqRXNBH0iq
 rZQqeEPAJHF1hl2RsA1zm+Jw82YijHbJH7qp5/hR8M1JTzIzWo/ePm6BJ
 FeT65MxiOrLgA73ZoMHME+qowQxfGNzN+u1rqoeQ20hRs+u3hITNJZwQK
 cryvjUeWHSG+7tne1lmdXziDrXRVGXkScCPjGXI3TZgUHg/55pr7DLAoz
 Bitn5agL8vjes3fXce4LBo4fAm3HnNcwlrgtvfxXRWe1UWKu4UGht/sIJ w==;
X-CSE-ConnectionGUID: Eqh24Ad1RzOPkAgxKyNlsQ==
X-CSE-MsgGUID: Tm3thtwETGGyMrSBzSxvnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62899709"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62899709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 05:03:56 -0700
X-CSE-ConnectionGUID: aOaRIVy1SwmgCEQ90aYsXA==
X-CSE-MsgGUID: XWiB06LmSO+t3qF2AH+9/A==
X-ExtLoop1: 1
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa003.fm.intel.com with ESMTP; 16 Oct 2025 05:03:54 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/5] drm/xe/vf: Minor fixes to post-migration recovery
Date: Thu, 16 Oct 2025 14:05:06 +0200
Message-Id: <20251016120511.856792-1-tomasz.lis@intel.com>
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

The series contains few minor fixes, mostly related to VF driver probe.

The fixes are not strictly related, but all go under VF migration category.

v2: Add fixing the currently broken GuC ABI check

v3: Add separation of xe_sriov_vf_ccs_migration_bb_needed()


Tomasz Lis (5):
  drm/xe/vf: Helper for telling whether CCS migration BBs are needed
  drm/xe/vf: Fix GuC FW check for VF migration support
  drm/xe/vf: Skip fixups on VF migration before getting GGTT info
  drm/xe: Assert that VF will never use fixed placement of BOs
  drm/xe/vf: Do not disable VF migration on ATS-M

 drivers/gpu/drm/xe/xe_bo.c           |  6 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 53 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  1 +
 drivers/gpu/drm/xe/xe_guc.c          |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 15 +++-----
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 15 +++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
 7 files changed, 82 insertions(+), 12 deletions(-)

-- 
2.25.1

