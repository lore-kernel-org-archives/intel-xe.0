Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C02CD6E60
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 17:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519F10E333;
	Tue,  2 Jun 2026 17:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLhaG98P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCB710E309;
 Tue,  2 Jun 2026 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780419643; x=1811955643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l+r5ppwujxxZAt94uNqcHnJSC/B7lyfltryQkWHIrt4=;
 b=QLhaG98P9Rhe/4CTtcQllWO6xzyZONRTdmgmCfWHYRvr4iua7mxJ6hUQ
 EF8tirACT6hzGxShQCgiLSFePb0oJdWwGKyNCqQObjHOwJ5dvDRT5z1tw
 EyMY9SUwdNerj/qM7CAII6g/PiWQWYUVZ/aLf/WG3Q0CEH9Os36MASkjy
 Lqkx0GeR1pOJJz1bt2HLdpWbnLvinJ2HbBTCysbaSbElKdd7wUZunD3dh
 1qHQ//dILcB9EaUZGOUOgrrHM7hnE2zTxzwXbCpNWvzX/wXeLfLbNZWhk
 a13lLdZOdFkomchaEPMsueoI+ZX0aSOgAz26cidgjeCBxhsuyPwhcOi5J Q==;
X-CSE-ConnectionGUID: OsQaJzHlSFaqJyk+m+Jbww==
X-CSE-MsgGUID: x0e3TxauRh6/Y3CHLUiX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68755461"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="68755461"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 10:00:42 -0700
X-CSE-ConnectionGUID: X6Jp3gmaRG6VXJx+A9View==
X-CSE-MsgGUID: ThSaowT7RrunDUv4KIj6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="239795587"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 02 Jun 2026 10:00:40 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v5 0/8] Vswing / Preemphasis Override
Date: Tue,  2 Jun 2026 19:00:23 +0200
Message-ID: <20260602170031.1163205-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1].

This version combines computing table's index and parsing VS/PE-O
tables. Thus, patches changing intel_encoder has been dropped.
Furthermore, all the enums have been removed. Hence the patch series
should be more aligned with current implementation.

Booted and successfully overriden default VS/PE with custom VBT on PTL.

BR,
Michał

[1] https://lore.kernel.org/all/20260529192859.4172376-1-michal.grzelak@intel.com

---
Changelog:
v4->v5
- set devdata->vspeo->num_entries in intel_bios.c
- add if-ladder instead of function pointer
- blend index computation with table parsing
- remove WARN and debug messages
- remove enums entirely
- add spaces around operators (Suraj)
- remove spaces after type casting (Suraj)
- remove INTEL_DISPLAY_STATE_WARN (Suraj)
- change funcs prefix from snps_ to mtl_ (Suraj)

v3->v4
- add Bspec (Suraj)
- remove unnecessary init of VS/PE-O metadata (Suraj)
- add helper for computing number of rows (Suraj)
- fix num_rows's type (Jani, Suraj)
- declare num_rows (Suraj)
- change debug message when requesting VS/PE-O (Suraj)
- stick to solely changing VBT data into current structures (Jani)
- move iterator declaration to declaration block (Suraj)

v2->v3
- remove unnecessary braces from if block (Suraj)
- return -EINVAL instead of -1 (Suraj)

Michał Grzelak (8):
  drm/i915/bios: search for VBT #57 by default
  drm/i915/bios: store VBT #57's metadata in intel_vbt_data
  drm/i915/bios: print VS/PE-O port info
  drm/i915/bios: de/allocate VS/PE-O buffer for each port
  drm/i915: override LT's VS/PE when requested
  drm/i915: override Snps's VS/PE when requested
  drm/i915: override Combo's VS/PE when requested
  drm/i915/bios: remove VS/PE-O warning

 drivers/gpu/drm/i915/display/intel_bios.c     | 179 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_bios.h     |  11 ++
 .../drm/i915/display/intel_ddi_buf_trans.c    | 126 +++++++++++-
 .../gpu/drm/i915/display/intel_display_core.h |   7 +
 4 files changed, 313 insertions(+), 10 deletions(-)

-- 
2.45.2

