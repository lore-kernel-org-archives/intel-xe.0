Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A69EC56208
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 09:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D2810E303;
	Thu,  6 Aug 2026 09:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYoX7Xx7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D4E10E303
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786009861; x=1817545861;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TEQAmM3BMPvewQ5vQRmS8bmhEULEv1Ed8jMF6Q+y/gc=;
 b=BYoX7Xx7lt5IMOxS7BzpYVzFMMXs+v6fk95WYFHXm6WUqxWEF3JU8tjM
 V9PJB/hhhonfAPFNJY1LHkLXiBFZeuINua6FGq9JOPk7eGjs3paJjVmya
 H9pH6NgdWRCKAP+IAKTG4dQlIFdu9tuWk7tPN7LtHvKhY6KDwxEkEmT1R
 v6xIgC4ROh0GCoKds0WyYfjympOZpSB+rC4i2UAHZpxhMhFxisVDKAr4i
 vo5Q9fHS0hborN2lzlp137oWqXr75v92P4ZbU4YeRv7H2io2M9MU5f8jJ
 YomwgpJWEEDChBw3Rgobe0OGWDD5DhDnufa/Js76ILakMFlUdo9zTKmLL A==;
X-CSE-ConnectionGUID: 7HTUu3nnTJ6pQGfCg0qXIg==
X-CSE-MsgGUID: fDZ3J0BGSDuKupDHUXoAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90272134"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="90272134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:51:01 -0700
X-CSE-ConnectionGUID: lyAcCa3IR8moMz0YaOGfpg==
X-CSE-MsgGUID: BLUrk7m6RxeuyXrfNSvrAQ==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.68])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 02:50:59 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Restore default PF scheduling on failed VF enable
Date: Thu,  6 Aug 2026 11:50:46 +0200
Message-ID: <20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com>
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

When VF enabling fails, xe_sriov_pf_unprovision_vfs() releases VF
resources but does not restore PF scheduling parameters set by
xe_gt_sriov_pf_config_set_fair_sched(). This leaves the PF with
scheduling parameters (exec_quantum, preempt_timeout) set
even though no VFs are enabled.

Add xe_sriov_pf_reprovision_default() to the failure path, mirroring
what pf_disable_vfs() already does on the normal disable path.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8126
Fixes: afc480ff55c5 ("drm/xe/pf: Perform fair scheduling auto-provisioning")
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 35e6b53e18ce..faac369501a6 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -164,6 +164,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
+	xe_sriov_pf_reprovision_default(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 	pf_finish_vfs_enabling(xe);
-- 
2.43.0

