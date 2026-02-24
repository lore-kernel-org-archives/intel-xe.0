Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D859F4BB65
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 17:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3510E5F8;
	Tue, 24 Feb 2026 17:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpAdb0Wk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D434110E5F8
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771955374; x=1803491374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UjQk/CQqGasBt2fe8M5BaBEgjQP4sW5EzhJtcqtK9MM=;
 b=QpAdb0Wk0R28rJXp2pqKzEsk156EyxuTKRMJFnnqfbsdJgRAmw0Gw8Qq
 z13/lESSeGGyY4tQc8pXMDLE2fH0WTMycB4oXBEw6ULxA/isQpF7vZHoe
 uI9VhlJ18fGcumLiMHqRgESbu9mLQ8HuO2jaRoKv5oho/6udbwwgeqCKQ
 4lNZUQtXwTHUNIb3mOnaL4VFdmq4xf+EHnVlpNl/kYwzMdNlxrmkQf1Tb
 IgNVyOR249W30OsKysMuZrnUBl+6GPNCkUrZaBiL59p5vCcoAmFIZPlTZ
 ROOIG2pT7TwbSnrfwVZg6JHNSw01CXSKhDfSVIvttw2KgYRBy8BJgknmP w==;
X-CSE-ConnectionGUID: Wrk59URcTOOq/vmm2U7oJg==
X-CSE-MsgGUID: z43tmOiGSUqo8FBikiaxGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72855809"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72855809"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:49:34 -0800
X-CSE-ConnectionGUID: EHYj3gQRRJqSFryc8Smbwg==
X-CSE-MsgGUID: RC5FQkJLRZ6MYri1G2GWOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="253725349"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:49:34 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 0/1] drm/xe: Enable Wa_14025515070,
 Enable indirect ring state for XE2+
Date: Tue, 24 Feb 2026 09:47:49 -0800
Message-ID: <20260224174918.616779-3-julia.filipchuk@intel.com>
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

Enable workaround 14025515070 to fix idle command streamer state on
context register. This allows user of indirect ring state on XE2+
platforms. Currently only enabled by default on XE3+, can be enabled for
XE2+ if ever needed.

v2: Enable for GT 20.04. Use range for media versions.
v3: Shorten KVL name, notice. Correct versions for WA. (Daniele)
    Reorder revert and applies for correct bisect. Added explanations.
    Add additional macros for XE_RTP_PASTE longer expansion.
v4: Move indirect_ring_state disable earlier in init cycle. (Daniele)
v5: Remove extra lines.
v6: Check against submit guc version. Formatting. (Daniele)
v7: Remove enable of indirect_ring_state for XE2+
    Check for Wa before clearing indirect_ring_state. (Daniele)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>


Julia INTEL (1):
  drm/xe: Enable Wa_14025515070

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc.c           | 8 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 3 +++
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 7 +++++++
 5 files changed, 21 insertions(+)

-- 
2.51.0

