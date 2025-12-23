Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A599E6FE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CCF10E2BA;
	Tue, 23 Dec 2025 18:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKT/r6UE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01D710E2B7
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766515189; x=1798051189;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tQyWIKVe12UU5UHxiOekO4hNJDGyTgGBWxL3NZdEOHY=;
 b=fKT/r6UEGERp5K7bLhMDjsMO2r1pF5Itsu+b03inX/W6/zneVVBRdhNw
 re9t4OqxR+IdgPTsT9GsV6idZg14qH9Ih9TxZu7+f5HKhC7JNZEGJWQ9C
 0RSdmupmjI8j2T93A0D/o2rX51WJqrzIEIu4YC1lAzyFNWzW7gCn3GXIC
 gUluwFdY/LK0dQY1ftM6OjjDeESh8I1vicAjZT+9dtCWniudvuGv5LZ88
 CViO3n+b0PF+WQxjIs33WRFr8jMFCi8rTwDrdWW2M7BG2PunSSYll5UH3
 4evmtpGFZCOX8fIIzNEFDdIk0l8XPczNvhX2BmVjbsYcMWPGUfQX9MGkR A==;
X-CSE-ConnectionGUID: Dp2I4bFiQ3OEU7x8Tx4lZQ==
X-CSE-MsgGUID: TX/lLXTFRqKEZDyjAMatEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93839534"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="93839534"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
X-CSE-ConnectionGUID: vCnH+WBrSM2tezQu2H3nPw==
X-CSE-MsgGUID: IwEufi1mTjqSULb7haf4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="199079221"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 10:39:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 0/3] Add SoC remapper support for system controller
Date: Tue, 23 Dec 2025 10:39:44 -0800
Message-ID: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
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

Add system controller configuration using SoC remapper for Xe3p

v2:
- s/remapper/soc_remapper/
- return status from init during probe
- reorder patches 1 and 2 from earlier series
- fix copyright year
- retain comment
- s/BITS/MASK/

v3 and v4 with review comments incorporated.
v5: Rebase since patch did not apply for CI run
v6: Review comments from Badal
v7: Review comments from Shuicheng
v8: Fix CI hook error 

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper helper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 --
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 14 +++++
 drivers/gpu/drm/xe/xe_device.c                |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h          | 16 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   |  5 ++
 drivers/gpu/drm/xe/xe_pci_types.h             |  2 +
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 52 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h          | 13 +++++
 drivers/gpu/drm/xe/xe_vsec.c                  |  6 ++-
 10 files changed, 112 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

-- 
2.43.0

