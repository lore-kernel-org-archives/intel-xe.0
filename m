Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BD6D2ED12
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 11:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A19A10E025;
	Tue, 20 Jan 2026 11:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpmQkiW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FAD10E025
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768907996; x=1800443996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XCDzBMan1Eta12BlBVjM3JULBJ6d9X/xG23sXrBBipo=;
 b=jpmQkiW/rObQJJCNdMJD4Z5cmRPcmpwxTAPmoq4ScnwTX6JWYGgQmpKR
 VEwpPcjqo4dsd02RHpWC4BIhoY9pmsMuSmxf1qdbT5aIe7Lz4+KzC7bTl
 YaQ1Nk5sg2iPJdhHr5/df92hxOql6Kxm/kgBlH4JcIFocm1ZCW7EIrydA
 IVPPrdSJuFVfCkYc277nzNFQlq5MugXIGZNOTY4jFZEkLJd7EkLBp6UY8
 YeJQR7g/e0grQk7qKHh/7wPW/8XFunqdzPKZi/QNhU0E4EBKtUNQM22eC
 t8QF+GwLPhfDxfOTmAVsDfYQicO6Kh5GRNb3B750bCvdaE2bNc8bKB+iD Q==;
X-CSE-ConnectionGUID: 7lrO12dZSGqoblrAeYIygA==
X-CSE-MsgGUID: 9P90ZjmTRjO5oq+kK899nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70165408"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70165408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 03:19:56 -0800
X-CSE-ConnectionGUID: YKiKm0o4RNeC7IQvEjKv7w==
X-CSE-MsgGUID: KC8hIwe4STWFBvRbdIFOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="210946098"
Received: from ksatya-dev.iind.intel.com (HELO ksatya-dev.intel.com)
 ([10.190.229.161])
 by fmviesa004.fm.intel.com with ESMTP; 20 Jan 2026 03:19:54 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC 0/1] Do not create drm device for PF only admin mode
Date: Tue, 20 Jan 2026 11:20:09 +0000
Message-ID: <20260120112010.70397-1-satyanarayana.k.v.p@intel.com>
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not expose a device node that would allow
users to run workloads.

In this mode, no DRM device entry is created; however, sysfs and debugfs
interfaces for the PF remain available at:

sysfs: /sys/devices/pci0000:00/<B:D:F>
debugfs: /sys/kernel/debug/dri/<B:D:F>


Satyanarayana K V P (1):
  drm/xe/vf: Skip creating DRM device entries in PF admin‑only mode

 drivers/gpu/drm/xe/xe_debugfs.c          | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c           | 11 +++++++----
 drivers/gpu/drm/xe/xe_device.h           |  6 ++++++
 drivers/gpu/drm/xe/xe_oa.c               |  2 +-
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h |  2 +-
 5 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.43.0

