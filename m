Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F395C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 11:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4978F10E663;
	Tue, 28 Jan 2025 11:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLJbMjmO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E8710E661
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738062647; x=1769598647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AtY3tyZuw4rveCCDwSFfymBXCgX5killyzFkgFMEbko=;
 b=QLJbMjmOSkLyNSDXnbk2d5wgtPxx5D5VXGWUpX4ub0chLw8lL8FVUwuf
 ahE1juWuUO/kqbJpGye3zRJ6QgwwFt2vzgNDDJHNA2z61PwEMfc8uh5OG
 HZO0sdyX8l7RbDayzzYcCsBb4WNPiKVCJb+qP9q2t0hDW5ZfrDvXgZy0b
 y/x0yJVNrHbQYsTc9kNN5BQCc/xF81fk1JVMIRWaCExRBb8BZl3j1lX1V
 Hrv2nRBWzDa+XMkea2OFw3n/80YXVYlnOGAtfw8XpaEjHJucpvBlpJy8y
 7Y/yiAMvSHzTU+os4GSFJOgJaB0BPkDY7UhYQsaByME3Khi5PIF3HQXKt A==;
X-CSE-ConnectionGUID: YSBvcBuyQVyWxY/CcFyRYw==
X-CSE-MsgGUID: u5vwLdOlQNeu/I+v1FmAjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38246436"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38246436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 03:10:46 -0800
X-CSE-ConnectionGUID: HVdipahtQqSPmRF+DKonRw==
X-CSE-MsgGUID: Fy/EL5mSTmCPfNTxkIQVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132001547"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 03:10:44 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] drm/xe/pf: Add runtime registers for graphics gen >= 30
Date: Tue, 28 Jan 2025 11:02:59 +0000
Message-Id: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add missing runtime registers for graphics versions of 3000 or higher.
This is required for Xe3 where additionally we have
MIRROR_L3BANK_ENABLE register.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Jakub Kolakowski (1):
  drm/xe/pf: Add runtime registers for graphics gen >= 30

 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 23 ++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1

