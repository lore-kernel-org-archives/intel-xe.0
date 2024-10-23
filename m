Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3848DD2E035
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 09:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0640910E79F;
	Wed, 23 Oct 2024 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cChOjn13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D12710E79F;
 Wed, 23 Oct 2024 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729676388; x=1761212388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FRz9x+iCEH3TVu9czCsm174yjECGHsU4G3kXhatMWCA=;
 b=cChOjn13Ya71/dHxCJjDrPKl/oyWDW/NlXf53RiUc/efUXMO4USc7fbV
 5N/dxQ8vmxHmVLI6XCaJrfKRlPY2xAJnityRYP4bJGpUYmQP5iVwiEwYZ
 9PuQvNvrxmGd7oK0D9E4c6w12JsXQ7H24sWo5rMlp3TeKFPjg4inlADu5
 YAGV12qCFxQ1rsXbv5gHspi7osu1ubLmJWniDFZIUn3Bbh4i/s0fQm/z3
 5P55tlyCan+7ty2QwfBgEo9JYAopkp8CxgRKL9wX0zBiAZ+JErl/vKlLx
 iNwjYlhN+tERf7OwAsrqJsgufg/PWc6bVcF5vXFD8SOZD3J7ItC82roab Q==;
X-CSE-ConnectionGUID: OqRCrLTjT1eCmSU75b2tMQ==
X-CSE-MsgGUID: Do6TbIJYQ1SBV/S//kHKXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29414203"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29414203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:48 -0700
X-CSE-ConnectionGUID: jlz7qDJhSguTgqss+Cm8Kw==
X-CSE-MsgGUID: 6dy4ElwgTIOACBPFa8D7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110979537"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 02:39:46 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t V2 0/2] Add xe_pci_membarrier test
Date: Wed, 23 Oct 2024 15:13:25 +0530
Message-Id: <20241023094327.965050-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Series adds,
1. New flag in mmap_offset ioctl to provide query 
support for special offset.
2. Adds xe_pci_membarrier test

Note: Similar drm-uapi change made here is under review 
in KMD as well

Tejas Upadhyay (2):
  drm-uapi/xe: Add new flag in mmap offset ioctl
  tests/intel: Add xe_pci_membarrier test

 include/drm-uapi/xe_drm.h       | 13 +++++-
 tests/intel/xe_pci_membarrier.c | 80 +++++++++++++++++++++++++++++++++
 tests/meson.build               |  1 +
 3 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_pci_membarrier.c

-- 
2.34.1

