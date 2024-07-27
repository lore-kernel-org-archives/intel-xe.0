Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD158C3DA49
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269E10E8D2;
	Sat, 27 Jul 2024 01:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYwmLDWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB4810E82E
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045563; x=1753581563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KQFcZLkuPgviQ5j1TgsuZ4BRWuUV7aHjoJOoHmzuvZk=;
 b=TYwmLDWxcyPltwtRoT2v9tb+26cqrKBmdMaya5hJikvSSw2n3fDXfBgS
 mxH4wvv3WBYwM6tdgn7d0wpA36trjWzdyslXqmzhGn8EOvHWVO3WkfRCY
 RdqvOI5fOsxbwtcY5Lg2vga8E3UmtKxF2cBA/fGLwWqSgIcFD4leKhxg5
 YResi4h59Fx1l5rn75W2/vC+E5DMO0wKfDG3GgY/IFODmWtFwT55kehK8
 wvbpuhm30Mu5RJxV9gdZ4gdbPXlEnY37t8f/823pvkRxfXhjzxRMmtKEo
 C/CsR+ulnUGW0b1nvYqKV4ik4FjEbvcO+mLwxDNb6hRNWeZKm1ABtbFof Q==;
X-CSE-ConnectionGUID: o2eez7vpReeAJtlR9uIhZA==
X-CSE-MsgGUID: cQkCF1ZtRUCSkMWoUOGVbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460253"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:23 -0700
X-CSE-ConnectionGUID: GGnwc99JRdiJIlqy6F8kvQ==
X-CSE-MsgGUID: FieFRVKIQMGkQUjUjmVvHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108372"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 0/8] Fix rtp when processing OOB workarounds
Date: Fri, 26 Jul 2024 18:58:59 -0700
Message-ID: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

The one line fix has already been merged in v2. This v3 has the
remaining improvements to tests and refactors.

v2:
  - Fix build due to missing change
  - Add tests for xe_rtp_process()
v3:
  - Use same media version as the BMG in CI for testing workarounds
    (Gustavo)
  - Change the loop style when counting rtp entries so there's only one
    variable needed. I went with a while() loop, slightly different than
    the suggested by Gustavo
  - Add 2 patches at the end to unify the ORed entries between the
    normal rtp entries and the ones used by OOB WAs (Gustavo)

Lucas De Marchi (8):
  drm/xe/kunit: Test WAs for BMG
  drm/xe/kunit: Rename count to count_sr_entries
  drm/xe/kunit: Test active rtp entries
  drm/xe/kunit: Rename rtp test cases
  drm/xe/kunit: Test rtp with no actions
  drm/xe/rtp: Simplify marking active workarounds
  drm/xe/rtp: Expand max rules/actions per entry again
  drm/xe: Migrate OOB WAs to OR rules

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 219 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/tests/xe_wa_test.c  |   1 +
 drivers/gpu/drm/xe/xe_gen_wa_oob.c     |  16 +-
 drivers/gpu/drm/xe/xe_rtp.c            |  42 ++---
 drivers/gpu/drm/xe/xe_rtp.h            |   4 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h    |   6 +
 6 files changed, 230 insertions(+), 58 deletions(-)

-- 
2.43.0

