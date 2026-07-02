Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB09C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 09:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB04710E4A5;
	Thu,  2 Jul 2026 09:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0PzbyIH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C57C10E4A5
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782983785; x=1814519785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PsoADi0YywIQ/HcFTgkx6fI4zdYPDQjg3OMejFLzNkk=;
 b=E0PzbyIHJdNHVzUP3EfmvNkkIu5gixKX0ItjL6qVP5w7VOVikJtpoy6C
 1PAzRvixLxnrsAp5mVME/sT683ivc3XgGgHL63hyRcT1qV7+omDMfPc7b
 86Vrt12mRchMSNVAbs7cTa2wt8h8gGwGz2AKAjDnSGXsNoH1yHk/MDG+V
 zEr67xs7rjzCEeioe7ND10aeksBlx6gueg/fbel9EUZMrMCT4gtRiX3XN
 GBQrXaYZa+QKF7nga/vUbXW+LchRKZ0ZNlnwMp0fGLWUc0YgRdW1PDkM3
 J3zZjN2wlu1XtNM+m0jfro+YL9fWPY/Pr1k99isijBh1jxzB71OTaXwHK A==;
X-CSE-ConnectionGUID: 1E2abtcOQ265hcgAuuXmuw==
X-CSE-MsgGUID: Mx6Vf4rWR/C7nmvP6sjZkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82721008"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82721008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:24 -0700
X-CSE-ConnectionGUID: AnHAgUzDQJuKdQtU1gjKGQ==
X-CSE-MsgGUID: fT7elxVDT++LotdsY9cDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="251082014"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 02:16:20 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, michal.wajdeczko@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 0/2] Add a debugfs for pcode information
Date: Thu,  2 Jul 2026 14:55:38 +0530
Message-Id: <20260702092540.1005095-1-karthik.poosa@intel.com>
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

Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version which is got from PMT
telemetry.
This can aid debugging when the pcode version is needed.

v2: Enable the debugfs only for supported platforms which is BMG and CRI
as of now.

v3:
 - Move platform check from patch 2 to patch 1.
 - Add a comment about why only BMG and CRI have pcode_info debugfs
   enabled.
 - To runtime reference of device before reading from PMT.

v4:
 - Skip creation of the debugfs pcode_info for SRIOV-VFs. (Matt)
 - Move the platform check to xe_debugfs.c.

v5:
 - Address review comments from Michal Wajdeczko.

Karthik Poosa (2):
  drm/xe/pcode: Add support to get pcode version from PMT
  drm/xe/debugfs: Add debugfs for pcode information

 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_debugfs.c  | 33 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c    | 32 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 4 files changed, 74 insertions(+)

-- 
2.25.1

