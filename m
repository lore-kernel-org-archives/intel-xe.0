Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB426CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 17:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EBD10E243;
	Thu, 16 Oct 2025 17:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2PDrIld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D310E243
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760637025; x=1792173025;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Aj9caSdTgHd9LX3y1bFrY9kaHyJodC6vfBYYOtSgu+I=;
 b=A2PDrIldKo+CCLM8JBF0KooNsV9hY3CkXo/Y31yRAqFXqOROH8a8+4q+
 2Ex9Jo2k8VShq6TIBLBPJk8OTeQ94D4wmyhp5URjhjEZh6mnoXdgTHysH
 8lqgNpp1Jk3LKXQKnmDJZcImEPFjpDxYtjjAdr7YG/so8BvtMmwmRJvci
 8KPTAjBOaFxxPCdN/vzd33U0V+ViDs0wmyr9hzn0f7dQ/YGwYtRcXETd5
 91RFMRNuGjdsnTLb61D9dsYGIRuHtQWO7ZlT+mbTs0ZMhezSM5QNncAl3
 MATexQjG9Fk0oqfelzYU1Q8BRg6JGteoFx/V456kMTK0cAn0nUQ+68SHf g==;
X-CSE-ConnectionGUID: tT8T7PSMQyWT/xOSDIThpA==
X-CSE-MsgGUID: N+hEQMEaSGaAm8r98Cbwnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73512585"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73512585"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:25 -0700
X-CSE-ConnectionGUID: H1FiSTbzTf2H3IIw/Y3JXg==
X-CSE-MsgGUID: bl+MBvXDQQ2S4u3JyWaECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182997786"
Received: from ldmartin-desk2.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.131])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 10:50:23 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/2] drm/xe: Add kunit checks for dma_mask_size, va_bits
 and vm_max_level
Date: Thu, 16 Oct 2025 14:49:55 -0300
Message-Id: <20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-v1-0-d0886d97121d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQw8WgC/x2NywrCMBAAf6Xs2YVurPXxKyIhNqsubVLJ1hAs/
 XeDx5nDzArKSVjh0qyQOIvKHCvQroHh5eKTUXxlMK05UEs9FsbxE2VBH5wNTker8mXMzt5lUcy
 hymInzjyhOQ49edp351MHtfhO/JDyv11v2/YD88bLbH0AAAA=
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
Gustavo Sousa (2):
      drm/xe/tests/pci: Convert GT count check to general device check
      drm/xe/tests/pci: Check dma_mask_size, va_bits and vm_max_level

 drivers/gpu/drm/xe/tests/xe_pci_test.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 57f3ac59d0e70a7138131c66aff11a098ff9214b
change-id: 20251016-xe-kunit-dma_mask_size-va_bits-vm_max_level-27c61d134984

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

