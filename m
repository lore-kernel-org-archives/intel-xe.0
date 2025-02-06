Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5541CC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA1010E1A0;
	Thu,  6 Feb 2025 21:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEhK7jZg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1610E1A0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738878369; x=1770414369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fGc0x6IX9NmXBXxx9Qi7iXHV/hOUhDpX4WSqe8w3rGo=;
 b=DEhK7jZgEFNPH0BTZBTBh8NJMhaCWOmhnfemKiEJEZw04W6RHRNEO0A1
 hD8VCS43u4m2NJVdKxuh1FZ9nEK/HALIeuhKTkU64uwsF/Gu/CDQmjj6V
 LBLiHQdTDdT5G4DWK5V30gMSvDTH7hcDKwVe8k8Vm0Robn8iDZbbYUlj1
 Pn6V77z31yi43xy8FsmD2cWu/MCDIxZBM258Dhe5VnUFCS6t3Z1975rxy
 nnfuoZAaqXOzfO0LOHODJcSJl0mXzG6w0Tzj7IBkvvxUwUv4pkpUtb19l
 CMt8cAbYZGKVGf93+OXHEf6FfaELzOhopj/kSMmVxBAPccxEQoah307qj Q==;
X-CSE-ConnectionGUID: rfFaiM52SIGvAQszFaWpmQ==
X-CSE-MsgGUID: ZntjatxzQ0WdxknvoqIpcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50941050"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50941050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 13:46:08 -0800
X-CSE-ConnectionGUID: r5o5F0oOREaeQh8QO/1bxQ==
X-CSE-MsgGUID: Q/XWmffASRm9ijs5QoU1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116276314"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.215])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 13:46:05 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH] drm/xe: Enable SR-IOV for PTL
Date: Thu,  6 Feb 2025 22:45:45 +0100
Message-Id: <20250206214545.940-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We should now have sufficient changes in the driver to run it on
PTL platforms in the SR-IOV Physical Function (PF) mode, that would
allow us to enable SR-IOV Virtual Functions (VFs), and successfully
probe our driver in the VF mode on enabled VF devices.

To unblock SR-IOV PF mode you need to load xe with modparam:

 xe.max_vfs=7

Then to enable VFs it is sufficient to use:

 $ echo 7 > /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs

Note that in default auto-provisioning all VFs are allocated with
some amount of shared resources (like unlimited GPU execution and
preemption times, fair GGTT space, fair GuC context IDs range, ...)

However with CONFIG_DEBUG_FS enabled it is possible to tweak most
of the SR-IOV configuration parameters using attributes like:

 /sys/kernel/debug/dri/0000:00:02.0/gt0/
 ├── pf
 │   ├── contexts_spare
 │   ├── doorbells_spare
 │   ├── exec_quantum_ms
 │   ├── ggtt_spare
 │   ├── preempt_timeout_us
 │   ├── sched_priority
 │   └── ...
 ├── vf1
 │   ├── contexts_quota
 │   ├── doorbells_quota
 │   ├── exec_quantum_ms
 │   ├── ggtt_quota
 │   ├── preempt_timeout_us
 │   ├── sched_priority
 │   └── ...
 ├── vf2
 │   └── ...
 :

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e8ef7d6b4db8..6a8e82aff385 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -367,6 +367,7 @@ static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_sriov = true,
 	.require_force_probe = true,
 };
 
-- 
2.47.1

