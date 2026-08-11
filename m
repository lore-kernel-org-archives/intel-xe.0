Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E215AC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE9A10E3A7;
	Tue, 11 Aug 2026 23:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEE8XAnF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6B510E3A7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786492385; x=1818028385;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IJ8pNuwRjgUgSXr1fxDDG+EPo7h5oKRsdJESznV9W0A=;
 b=kEE8XAnFj3vVmjqwSZ/0HDC467UkH7tBKp7ZKzHxkOqULTW9WlljG+ZK
 prnMfxeRhoGC9RM8E75Ct/HnsGt/k9VJ8lVMOhzEXv1ZQOIsMZppwhYwC
 qKflqO+okmgFrr9pkSibVPOPUtRtgpx1RMi4znKRxKKjiOHUCfMZJ0A/x
 PUauoX+23ypPD6IWM//4ww9GbxXBHPd6a1qDrEvi9lYaMA3WvNuCy5TFM
 aLNBV72hwQikQiGCYfmqYcg2i/tfqwe3W8D1HpPGqW/iA9FzW/sx0TqV0
 GWXq1yc3n2xb7ETbzNCR0YJzx3BmC0vCGdBEp35LjZWFvpif/aGo7cpce g==;
X-CSE-ConnectionGUID: EYsn4CJuSsSt8JCv3sUG4w==
X-CSE-MsgGUID: wKV7YnOsSMSBtTSFut4vFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98183264"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98183264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
X-CSE-ConnectionGUID: jIzgyRmASOWIOxv+CITMRg==
X-CSE-MsgGUID: 5bPBFjCdQnmaZGK8MAHbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="261729318"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 0/4] Use SIGID API for PCODE and CSC
Date: Tue, 11 Aug 2026 16:52:55 -0700
Message-ID: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

For PCODE and CSC, this series uses xe_log SIGID API introduced in:

https://patchwork.freedesktop.org/series/171022/

Note that PCODE changes are partially present in the below series and
may be picked up by their future revisions.

https://patchwork.freedesktop.org/series/171725/
https://patchwork.freedesktop.org/series/171022/

The purpose of this series is to ensure all relevant logs are reported
for CSC and PCODE.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Mallesh Koujalagi (1):
  drm/xe/log: DO NOT REVIEW

Umesh Nerlige Ramappa (3):
  drm/xe/pcode: Use int instead of u32 for mailbox status
  drm/xe/pcode: Report pcode errors using SIGID
  drm/xe/ras: Report CSC errors using SIGID

 Documentation/gpu/xe/index.rst        |   1 +
 Documentation/gpu/xe/xe_sigid.rst     |  14 ++
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/xe_log_abi.h   | 198 +++++++++++++++++++++++
 drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 195 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_any.h           | 142 +++++++++++++++++
 drivers/gpu/drm/xe/xe_log.c           | 221 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_log.h           | 158 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c         |  17 +-
 drivers/gpu/drm/xe/xe_ras.c           |  16 +-
 10 files changed, 952 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_sigid.rst
 create mode 100644 drivers/gpu/drm/xe/abi/xe_log_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
 create mode 100644 drivers/gpu/drm/xe/xe_any.h
 create mode 100644 drivers/gpu/drm/xe/xe_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_log.h

-- 
2.51.0

