Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7002BCD6E49
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4A7112466;
	Fri, 29 May 2026 19:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBWThC4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB9C112486
 for <intel-xe@lists.freedesktop.org>; Fri, 29 May 2026 19:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780083373; x=1811619373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=41iyFLVl9LZgfmAwkGS913NNBHbjKa91iSXN79I70+8=;
 b=cBWThC4UOEIKfwtbe8T0wCS7mqewNqIGlvogx4JamYMjQwKA8BFbBWWB
 T9xxIpVm6FTPh3IgunLyFk5lk6pZLHF8ZiNeNPqw5qBnjlcIJBzBHZdfb
 YUFlHkGF16zb79FjCEt/u1uW7wt/lJ2fTX8/Y2qJOJT5M/9RU1DX4d2nG
 2PWgHixp+WeYTrWgnFfPehoGPSNMhRVIb+brLpcG24A+GNu9UBguobqnT
 bT/u2R2ENaEEvNN6HL3D3S0wNBaVIjMqHa8byT5N/zf/15wiO01ny3F9d
 S3WWPgCxXShqUSX29C1mC3SuyTMtGBhCA7wsBWe6PxJI8CUV3/LU5UamE Q==;
X-CSE-ConnectionGUID: olA8vBO/QRuUTykcpJ8EdA==
X-CSE-MsgGUID: bQnedDUnTSS2qed7xgMgQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80969676"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="80969676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:13 -0700
X-CSE-ConnectionGUID: jDerN1fESbOgxPIsJ0yP8g==
X-CSE-MsgGUID: WMTZrtJ8Q/ufQoMdE2JpMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; d="scan'208";a="246943882"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 12:36:13 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/6] Drop NVL-S GuC FW def from drm-xe-next
Date: Fri, 29 May 2026 12:35:59 -0700
Message-ID: <20260529193558.185436-8-daniele.ceraolospurio@intel.com>
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

The early NVL-S FW definition was accidentally merged to drm-xe-next
instead of topic/xe-for-CI. Since this is a definition for an early FW
that won't be released to linux-firmware, we don't want it in mainline
linux and therefore need to move it to topic/xe-for-CI.

The series is a bit messy because the code is split between drm-xe-next
and topic/xe-for-CI. Here is a quick rundown:

- The first 2 patches remove the FW definitions that come from
  topic/xe-for-CI, to make the code look like what's in drm-xe-next.
- Patch 3 is the actual revert meant for drm-xe-next
- Patch 4 is is meant for topic/xe-for-CI and re-adds the reverted patch
- Patch 5 and 6 re-apply the patches reverted in the first step

I've updated the commit titles for all the patches meant for
topic/xe-for-CI to explicitly state that.

Note that the only new patches that actually need to be merged are 3
and 4, the other revert/reapply pairs are there to mimic the handling
of the 2 branches.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>

Balasubramani Vivekanandan (1):
  topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI

Daniele Ceraolo Spurio (3):
  Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"

John Harrison (1):
  topic/xe-for-CI: Define GuC firmware for NVL-P

Matt Roper (1):
  topic/xe-for-CI: Define GuC firmware for NVL-S


-- 
2.43.0

