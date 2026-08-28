Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6140EC61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 19:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAD110E055;
	Fri, 28 Aug 2026 19:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZULp0PUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17310E055;
 Fri, 28 Aug 2026 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787944212; x=1819480212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VrDd4MHq2FSd0lz4FiwlbLKV9GQLsf5MexwAnLno6wg=;
 b=ZULp0PUGipUmlN2YTFQSyZc36XCCDGVOFuoXW7tZUe3zGgObNhZEuwxt
 WzOw+3uY09QgM37YdnQ6QlVOmuN7HUWeV/iJrbZsjbqiVVj63x/FX4ETr
 i0k7C1S4lNZJdxg1vKL+80EROAebXU7FK4aSg0k6D11QYffLEmSOcvhbY
 S0nV5v/JdEWGYexoMnXLHRTwLzAEFV/C7kQcCap+fQDfdZ+X5nuJjnUmG
 CitLn2DdtuUVXjRgvWCcS5/K2yOstXXchlUPI05srvcfuHNIbECJep2cn
 0VOd0hMytZ4Im98lvY1elzJjwXwu5qYFJ1UOKV39EtSBelxDrlZSOqAlm w==;
X-CSE-ConnectionGUID: bCUSVJWORoS+r/fSK0k2Cw==
X-CSE-MsgGUID: XtjeuLXKTXSHelovDs91Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92324710"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="92324710"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 12:10:11 -0700
X-CSE-ConnectionGUID: eGgKxu8lQUGJhwznefL2Uw==
X-CSE-MsgGUID: qUk3/X18TFOFXJEd/sjnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="271758103"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP; 28 Aug 2026 12:10:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v5 0/2] match *_PCODE_DATA naming with spec
Date: Fri, 28 Aug 2026 21:09:54 +0200
Message-ID: <20260828190956.2622350-1-michal.grzelak@intel.com>
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

Resend of [1]. Last time I messed up versioning in the changelog:
mentioned change done from v4 to v5, while series was at v4.

BR,
Michał

[1] https://lore.kernel.org/intel-gfx/20260602223640.1375933-1-michal.grzelak@intel.com

---
Changelog:
v4->v5
- clean changelog's versioning

v3->v4
- apply the rename to the read()'s signature as well (Sashiko)
- split i915 changes from xe (Jani)

v2->v3
- resolve conflict from rebase

v1->v2
- rebase onto drm-tip (Jani)

Michał Grzelak (2):
  drm/i915/pcode: rename GEN6_PCODE_DATA to match spec
  drm/xe/pcode: match argument naming with PCODE_DATAx

 drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
 drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
 drivers/gpu/drm/i915/i915_reg.h               |  2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
 drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
 drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
 drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
 include/drm/intel/display_parent_interface.h  |  2 +-
 11 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.45.2

