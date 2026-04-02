Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7440CD6AAF1
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 16:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E96910E3D3;
	Thu,  2 Apr 2026 16:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="duprEhMq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74A10E123
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775147401; x=1806683401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7LIYTjf2bL0BTp7qQ9/3f8WTmjoHiNnEvziS2SC3Pj4=;
 b=duprEhMq8s9316iMxsFxtKGbQb23yYv7qRifXZtCiJX0/YZ7rnEkOtxr
 ANgZS+UaEgpQzQNviPXB5Q5m74QkjyWGdbLYlE1/WmQUHbb9VmBp3r2AB
 r5XfVIr2acaP1CkCXz6jPbsO1DiMXm2zkO2pZVQQcFaicG7fLIg9kHSj/
 8mLQeimtFSn25qn1aQ/Aa7emkCOlHoUj45J0xNGs6vkrxZ/MO39PXArLj
 3suqhG3rJc9qVouK/tvUqrw8uZ/0VHV5/6PT/jIfiEmHZsOzZe2pz8Tto
 xDD765ZxNs95Zsy21L8O612N2Z9+g1YDODQ0OUjqxPDbQS5vV67N27v73 g==;
X-CSE-ConnectionGUID: ix0Fa+GaQlal3PvkkVDNsQ==
X-CSE-MsgGUID: 8sb3JyfsRbe/y69hcwA0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93605228"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93605228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 09:30:01 -0700
X-CSE-ConnectionGUID: XqHrY6GQQh2zrwQ2VFKObg==
X-CSE-MsgGUID: BzrDRK9sSi6tD2LFxPdVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="226975419"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa008.jf.intel.com with ESMTP; 02 Apr 2026 09:30:00 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 0/2] drm/xe: expose multi_lrc_mask in debugfs info
Date: Thu,  2 Apr 2026 09:29:56 -0700
Message-ID: <20260402162958.16924-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324212348.4142888-1-x.wang@intel.com>
References: <20260324212348.4142888-1-x.wang@intel.com>
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

This series improves the debugfs info output for xe engines and exposes
the multi-LRC engine class capability.

Patch 1 replaces raw numeric engine masks with human-readable engine and
class names in the per-GT debugfs info output, making it easier for a
human to interpret directly and simpler for IGT tests to use when
validating engine capabilities.

Patch 2 adds multi_lrc_engine_classes to the device-level info output
as a useful extra piece of information for debugging.

v5: (Matt Roper)
 - Reword commit messages to avoid "userspace" framing
 - Use early-return pattern in print_engine_class_mask() and
   print_engine_mask() to minimize indentation

Xin Wang (2):
  drm/xe: improve readability of debugfs engine info output
  drm/xe: expose multi-lrc engine classes in debugfs info

 drivers/gpu/drm/xe/xe_debugfs.c | 43 ++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

-- 
2.43.0

