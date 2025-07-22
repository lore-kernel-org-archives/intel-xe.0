Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F126EC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 14:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68A210E6A1;
	Tue, 22 Jul 2025 14:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOtbHLWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E3810E1B5
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753193492; x=1784729492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nm/VDS+FkdXBNXUAMuzX0DasFtvYpEuwmqlrZY0fI1Q=;
 b=LOtbHLWP5TRP359FzkfqheYynOgTqHhSIJPaNZr642BimNYXwDLO45gb
 4MP14A+7/KYYQ42Xf7+PB25v15waIRC1hzCGM4VxGm7MVFeJbiuPGcqSg
 ekgADCHfqJAQ7+I1b/5ZjZ8GZY4BYhLTg6GqURnofDSVC0uDFNpR5p4CM
 fZdK7pgWl3iQ/lb1s6e97S+HM73JKcpSH4E5ZGcEpQCHAC1wc6k5m3SN/
 9YxJE8NbkEpUMFWjxL46d1Z0aUErJFrbd2BUDkLG4Y/AK1H4U13Dh+aYi
 ZJrbqe8ZbR4b3QSFVAeFMEOIOPEBoYFncFBA9o2YcW8xLhDyTSm1T4rGc A==;
X-CSE-ConnectionGUID: hRiaC9hKSom3MJhXGePZLA==
X-CSE-MsgGUID: lOt1hO1wSdGA/I5uR6UMPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54663024"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54663024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:32 -0700
X-CSE-ConnectionGUID: 1QkuLHzCT0Gv2BXcQdOGjA==
X-CSE-MsgGUID: lZtghCvuSJOMl97qirVufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163396251"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 07:11:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/6] Updates for drm/xe/configfs
Date: Tue, 22 Jul 2025 16:10:53 +0200
Message-ID: <20250722141059.30707-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/151773/#rev1
v2: https://patchwork.freedesktop.org/series/151773/#rev2
    keep using %x for function scanf (Lucas)
v3: check if device matches driver device ID list
    more checks when trying to configure future VF
    print debug message if configfs was found

Michal Wajdeczko (6):
  drm/xe/configfs: Fix pci_dev reference leak
  drm/xe/configfs: Enforce canonical device names
  drm/xe/configfs: Use pci_name() for lookup
  drm/xe/configfs: Check if device was preconfigured
  drm/xe/configfs: Only allow configurations for supported devices
  drm/xe/configfs: Allow adding configurations for future VFs

 drivers/gpu/drm/xe/xe_configfs.c | 83 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_configfs.h |  2 +
 drivers/gpu/drm/xe/xe_pci.c      |  3 ++
 3 files changed, 77 insertions(+), 11 deletions(-)

-- 
2.47.1

