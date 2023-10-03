Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D059E8FDBD
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 22:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61310E0A8;
	Tue,  3 Oct 2023 22:21:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8DA10E0A8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696371715; x=1727907715;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Up4S3A5H7LiSFLenWB7bnsVFpd3HQzFn7Vr/FKrWJps=;
 b=YaENUHZSSEs173p5Aa5v27U5kSetfPrmGQe3X+ypxTjIAFpgZH+9ffYt
 vPeD1L1kLqCm7EP2qSi4WN7qA1IjX07LxynpJRkQC1Qy/2KG8XwOvqpKh
 AWxgskeyzbKPMjDdMSF8Si307bL+7svl0XW+B/AywolUbsPmjkXjxBpXx
 10dkEcpgvx24SaFblGK6TwH/IHZB/qb5Am/AAn8YbmRXySjcpWC6rMNeM
 ZUVkD5dW97ClfFK5JKMf6yOukVbXd0z2VobxAO3dRvyyfpwpwBiFIhAym
 eOr2pZBvpik9guxrzusYtCRkMvEo05RAGCFOqj9ge4r3uvK7ZHyRj/E2K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="380270374"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="380270374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894667578"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="894667578"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 15:20:28 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Tue,  3 Oct 2023 18:21:43 -0400
Message-Id: <20231003222145.4090918-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] Use DPA offset for page table entries.
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

Update xe_migrate identity map base PTE entries to start at dpa_base
instead of 0.

Fix compile warning:

    ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous
    prototype for ‘xe_hwmon_process_reg_read64’
    [-Werror=missing-prototypes]

Signed-off-by: David Kershner <david.kershner@intel.com>

Changes since v2:
    - Added patch to address compile warning

David Kershner (2):
  drm/xe/xe_migrate.c: Use DPA offset for page table entries.
  drm/xe/xe_hwmon.c: Add static to xe_hwmon_process_reg_read64

 drivers/gpu/drm/xe/tests/xe_migrate.c | 37 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hwmon.c         |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
 3 files changed, 48 insertions(+), 13 deletions(-)

-- 
2.35.1

