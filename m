Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA974CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 19:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A1010E2D1;
	Thu, 18 Jun 2026 19:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6aZoIng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E067E10E2D1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jun 2026 19:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781809553; x=1813345553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8U72EaAD8FOkCKAvXUXskD3Yyn/B2j4sAOrJ5elWSeo=;
 b=l6aZoIngcQNGLQUwk92StWBNLFMyNKVkymbNtdTYrwR0DK8z9hJc2onj
 O25g06anWajJHGy6567Jl6WntjOgBK17843EkB6LufTb79Oedg8YbAMri
 r9Scc0G8DUlS+3n2n39l3QzC8R7Scn+TZEHrM0cCg8UukdNudH/XgDTiH
 s5jlVE9IwEHFqDaq1JP2p6z/eFXmoRE0KdHJ+Z5uKmqbnUb/WLwNYWwGj
 SKz/wvpkTCyP8W7WeuN9y/3uhl1TPPm6Y+I6LNBJTDbX54rIAnacewpCz
 lgEmPvCnZ+dcy1BSDMZnaaVqs1JjPm/VmlC9NeRIvsWqML741E2D5STtK Q==;
X-CSE-ConnectionGUID: CeY7UNh8TU6hH0PChW1a8g==
X-CSE-MsgGUID: iKGQmLyjTB61NztBYqSv3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82433020"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82433020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:05:52 -0700
X-CSE-ConnectionGUID: MAvfRkbSRgerF3Zej+e0wQ==
X-CSE-MsgGUID: cjXF73v6Snm5IL9wSRnMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248319676"
Received: from padamowi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.18.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 12:05:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe/kunit: Assert fake pointers before use
Date: Thu, 18 Jun 2026 21:05:38 +0200
Message-ID: <20260618190542.593-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (3):
  drm/xe/kunit: Assert ggtt and gt pointers before use
  drm/xe/kunit: Assert gt before assigning relay pointer
  drm/xe/kunit: Assert gt before assigning idm

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   | 6 +++++-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 5 ++++-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 6 +++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.47.1

