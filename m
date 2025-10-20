Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E81ACCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E390610E542;
	Mon, 20 Oct 2025 23:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dW/Bm9tX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCA610E542
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761003982; x=1792539982;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=RdMCg/uWNHT063FiMOjOSgUbB16kmBLomMLRsDjwyXU=;
 b=dW/Bm9tXhO1XZ2tb5lnbPyGAlfV+NDlBFSp7hc/GJo0/k8iDOXF21NJC
 EhVj/Wtvzx0w9Ra8OQ5H4Lv4G2ce1iGlkFRHx3E8mzNuXVO4bX6gZ2/O9
 1B92A0/tuwnLzlZyyzzWDEn+wBPhlqbsaK08t9SBxbABue0uiv7x8ElMR
 ziRrKyZOpOpIUPUgeqVf9opIDHWPvMF9WzfNm+B3vkiD60baRyzvCUyOs
 XVT6QEEsSJFHHWBZVJtd2bDSjchY9+3Kr2iLj55YhG0SZep6tqApdLtp0
 AvD+5s+OJ0+DR2J+fawygFUIu7YUJqumJfXsyr5/BBrfJeRRshI3EN8VE A==;
X-CSE-ConnectionGUID: Lg6mNKXTQNqx2dIX6mTeVw==
X-CSE-MsgGUID: zGKzxah5RfGcKbf4JtZ2KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73799294"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73799294"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:22 -0700
X-CSE-ConnectionGUID: BYAa+D3hQNW8JitKOqbqig==
X-CSE-MsgGUID: 7eMGjxHGRoOOC91QOs9bUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="214414281"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:46:20 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Add kunit checks for dma_mask_size, va_bits
 and vm_max_level
Date: Mon, 20 Oct 2025 20:45:55 -0300
Message-Id: <20251020-xe-kunit-dma_mask_size-va_bits-vm_max_level-v2-0-27b03971bc7e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTJ9mgC/52NQQ6CMBAAv0J6dk1bEdCT/zCkqXSVDbSYtjYo4
 e9WnuBx5jCzsICeMLBzsTCPiQJNLoPcFazrtXsgkMnMJJdHwUUFM8LwchTBWK2sDoMK9EFIWt0
 oBkg2y1mNmHAEWXeVMOJQnpqS5eLT453m7XZtM/cU4uTf2zyJn/3vkwRwMLxpKnOqhRTmQi7iu
 O8my9p1Xb85KDPY5gAAAA==
X-Change-ID: 20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-27c61d134984
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

As part of [1], we ended up moving members va_bits and vm_max_level
(among others) back to struct xe_device_desc. Those two, as well as
dma_mask_size, are all expected to be non-zero. Let's add checks in our
kunit code to verify that.

[1] https://lore.kernel.org/all/20251013200944.2499947-25-matthew.d.roper@intel.com/T/

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v2:
- Add tweaks suggested by Michal, please see individual patches for
  details.
- Link to v1: https://lore.kernel.org/r/20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com

---
Gustavo Sousa (2):
      drm/xe/tests/pci: Convert GT count check to general device check
      drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level

 drivers/gpu/drm/xe/tests/xe_pci_test.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
---
base-commit: bee2d9e4308e4b888e2524014a246793233f75e8
change-id: 20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-27c61d134984

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

