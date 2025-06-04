Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23763C61CE7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68BC10E727;
	Wed,  4 Jun 2025 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVPsW8Oj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB57D10E07C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749049427; x=1780585427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U4TujlL+u84F05e2pINBn5m+cFa8I30Xh0VoHbcZiic=;
 b=MVPsW8Oj1qxCC5NtyfxA+q6sOJ5k6S2V+0aBOxnG2QxZ5H2Un4pvz7ws
 ktGzKoNGy9Dz+3pKp6tF8o1iKmd6nME+IZD4/74tqy9lt9tdgvbhh5tLd
 uvKyP6N2kAyWQ9AGLm3TFpuxraCleYDukmx72ErSrZ60v2mpDpE3C2F1G
 Cv6M/SwRiYQO8waZTZRgTi9PyYMpWqX848/Y63nCXBxE515Rd7ULj3+WS
 ZBUyasjmdfa6nqj1ZdOU5XsRALDgdaiPeY5k3q64yjrMdQEtvTANV8B8u
 YIsYkOjr1FjnjwXxGXfJM/y3j+7B3wqf9BQ4VQrjh3gVwdNLu/n7Z8odc w==;
X-CSE-ConnectionGUID: zDRnWfjNRG2eQ5CrpXIwSQ==
X-CSE-MsgGUID: Uq9Rz/E9RMqgDYwDN3PnlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61800179"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="61800179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:47 -0700
X-CSE-ConnectionGUID: cTyKbMwuTlmCYEPLvj8+VA==
X-CSE-MsgGUID: rRR33y/4TfyvxiJVil+N9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150096732"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 08:03:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix and prepare WA BB for more users
Date: Wed,  4 Jun 2025 08:03:04 -0700
Message-ID: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250604-wa-bb-fix-f42056a18632
X-Mailer: b4 0.15-dev-b77e2
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

WA BB fix and preparation for more users, split from original patch
series "drm/xe: Add user commands to WA BB via configfs"
(https://lore.kernel.org/intel-xe/20250523-wa-bb-cmds-v1-0-40b337f71bcd@intel.com/).

Intention is to also use it in another, replacing the first patches of
"More missing XeLP workarounds"
(https://lore.kernel.org/intel-xe/20250602111956.14854-1-tvrtko.ursulin@igalia.com/)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe/lrc: Use a temporary buffer for WA BB
      drm/xe/lrc: Prepare WA BB setup for more users

 drivers/gpu/drm/xe/xe_lrc.c | 71 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 7 deletions(-)

base-commit: 6517275da428d10d60b2762385ca7daa3a382754
change-id: 20250604-wa-bb-fix-f42056a18632

Lucas De Marchi

