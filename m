Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661ECCCD19A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19610E443;
	Tue, 18 Nov 2025 09:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cfdh8aDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076BF10E443
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456522; x=1794992522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CYcxdd2/yx/ZNtdVYYIDh1b1tJhr27LrhKI2JJX8LnA=;
 b=Cfdh8aDPQNj7RRUP92ka0ukO0lNcP3tRif5c89wqz2eodtKwSXtD7wan
 eGcUFLACGzvoDX7MtCj9ue5r3agmpC9hvy0o5Wn/qGAuB/kxRbn+3th8J
 d5gTB11FteYeBeluq0OLTBM0QOuMayNyZFGHWddKUukkWNtNx7UYhC0CU
 +YvE24xPTqg9t5Ceir1ZRriDajEHKl/fJMQB5koIybGYSacZzhXFv4l7r
 FCBYwpm0+YUUIBRZxw5IW80gn/56jbt2TeoNdZORsMYTq6lXI+HO1pbhQ
 a/covf5KtiHK58ZGmKkyhTj+Gb0H69yCuoeQc96y6zqaZY4doSz067GKe g==;
X-CSE-ConnectionGUID: Cdwe04MlRJyVe1+Se7aUxQ==
X-CSE-MsgGUID: XdR3IFWeQ6OYm2jvmvXovw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53042281"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53042281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:02:02 -0800
X-CSE-ConnectionGUID: eId6ntdXSa6Xcne28Nh6fg==
X-CSE-MsgGUID: ma5weSx8RaqVoljfR0GAOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228042489"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 01:01:58 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 0/4] Introduce xe_pcode_read_probe()
Date: Tue, 18 Nov 2025 14:29:16 +0530
Message-ID: <20251118090012.608250-1-raag.jadav@intel.com>
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

This series introduces xe_pcode_read_probe() helper which allows the
caller to check for mailbox command support and uses in a few places
where applicable. Detailed description in commit message.

Raag Jadav (4):
  drm/xe/pcode: Introduce xe_pcode_read_probe()
  drm/xe/sysfs: Use xe_pcode_read_probe() to check for mailbox command
    support
  drm/xe/hwmon: Use xe_pcode_read_probe() to check for mailbox command
    support
  drm/xe/late_bind: Use xe_pcode_read_probe() to check for mailbox
    command support

 drivers/gpu/drm/xe/xe_device_sysfs.c |  4 +--
 drivers/gpu/drm/xe/xe_hwmon.c        | 13 ++++-----
 drivers/gpu/drm/xe/xe_late_bind_fw.c |  5 ++--
 drivers/gpu/drm/xe/xe_pcode.c        | 42 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pcode.h        |  1 +
 5 files changed, 40 insertions(+), 25 deletions(-)

-- 
2.43.0

