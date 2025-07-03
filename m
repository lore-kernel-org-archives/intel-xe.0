Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4445C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A37410E912;
	Thu,  3 Jul 2025 22:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYeSbBWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BEF10E914
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 22:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751582488; x=1783118488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KI87dYwnPWhkZB7b6yWHN49rI3wCrCqfU5ELkAEMqD4=;
 b=TYeSbBWJW3I0rdBYUG3N4gaKEh6MnuXHuoj1+8ZY2odiSRzc067j+5Jm
 EDYxXEb3eFQHH/pK3FkZuQp/e1LlTAAS8OPhl5eSDLJPhMg57CepumBHy
 /xMqgdXj/FHKH2EIKiohsAfLBVMBaZReLvpEwzb+xHobxA1W0cCOXD/g+
 zADlm99PR+1J86N8hMhCgzhvJnhOzYOPiESPVv/UfUTGLXlIu2NQo97ic
 XJRBG3rzyc3K0i9qHIeNJLjkSB5xYVypq6ijjZYY35pzQC9enU8e3EkBo
 ajYGGuPXtD3GpVHaAf7/3/XyYnvtqXda6TsFRhC6SsEPFbMNGEiiBkk2e A==;
X-CSE-ConnectionGUID: hnUxhbJbQXqKutasdiYFIw==
X-CSE-MsgGUID: BMbi+SskQtWTo7KsjuYOHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76468775"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="76468775"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
X-CSE-ConnectionGUID: 9nlANdBhSJyUfn+FO+J/JQ==
X-CSE-MsgGUID: JEZnzs32RiSmo1OhYv/RpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="159048791"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 15:41:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/7] drm/xe: LRC refactors
Date: Thu,  3 Jul 2025 15:41:09 -0700
Message-ID: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250625-lrc-refactors-82b10b576547
X-Mailer: b4 0.15-dev-858c0
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

A few refactors while investigating the LRC corruption that
were happening before commit 3d85ab36bcb ("Revert "drm/xe/xe2: Enable
Indirect Ring State support for Xe2"").

They probably conflict with some other refactors by Tvrtko from
https://lore.kernel.org/all/20250703082059.61597-1-tvrtko.ursulin@igalia.com/

I'm reviewing that one and will figure out the conflicts. I already got
one of those cleanups from another series and added here on top.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (6):
      drm/xe/lrc: Reduce scope of empty lrc data
      drm/xe: Count dwords before allocating
      drm/xe/gt: Extract emit_job_sync()
      drm/xe/lrc: Add table with LRC layout
      drm/xe/lrc: Remove leftover TODO
      drm/xe/gt: Drop third submission for default context

Tvrtko Ursulin (1):
      drm/xe: Waste fewer instructions in emit_wa_job()

 drivers/gpu/drm/xe/xe_gt.c  | 172 ++++++++++++++++++++++----------------------
 drivers/gpu/drm/xe/xe_lrc.c |  57 ++++++++++-----
 drivers/gpu/drm/xe/xe_lrc.h |   2 +-
 3 files changed, 124 insertions(+), 107 deletions(-)

base-commit: 05fd9cf9ba87dcf4428adbca5237845f2c04d8ac
change-id: 20250625-lrc-refactors-82b10b576547

Lucas De Marchi

