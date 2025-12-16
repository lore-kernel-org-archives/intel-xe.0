Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF312D5B87C
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 07:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9371A10E3BD;
	Tue, 16 Dec 2025 07:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKkxj5tT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385BA10E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765870925; x=1797406925;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2gCyTPhH79hF3EZNmOrp2e0mO6zDDX6U2MvGdjrRZqg=;
 b=UKkxj5tTEELGFs6hC3eLbVndb3OoLG7TMdnMNA/i3GJAO4F48LMLIy7U
 N10c4jncLWiRmsE5wW3r6mRxMlhoMsmjJgrvCa/SXEkSI/O3FOORKU7Pq
 hv+FQiT8RbemVuR4x82Iocvc9zhEaYMeQd/IlGA3yg1nXt5aPcPe2v4AA
 NMN9YrHe+9O6w4Gkf9l1pDg8VKcE7rNa8o5GqW0tr+4hmHCwg3iINCKm6
 SVRYppMbjN/btn8FKqWJHrzVuZGjSWEjzRh1vAj5NdoGxa3LtatTtUrT4
 ZRvpaH91vKQgt9GkpCL/+HoQdH6PbKMSU7WJJ3QnJrBpbifgRJfeiMlUv A==;
X-CSE-ConnectionGUID: tFy07wwxTY2WV35Zqhe6uA==
X-CSE-MsgGUID: gPWcxFi5QG6/r0oqu9/G6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78420938"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="78420938"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
X-CSE-ConnectionGUID: V/r28eXmQp6Q4LMF2sGH5Q==
X-CSE-MsgGUID: AkGuo17nSQe7LVw4LP6DgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203050811"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 23:42:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com,
	anoop.c.vijay@intel.com
Subject: [PATCH v5 0/3] Add SoC remapper support for system controller
Date: Mon, 15 Dec 2025 23:42:00 -0800
Message-ID: <20251216074159.2788534-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
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

