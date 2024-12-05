Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC13BE7716E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 18:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BE110EF68;
	Thu,  5 Dec 2024 18:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/uQeagd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845B010EF68
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733423232; x=1764959232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rujLdnqaZcDPnqw2X3FE4od9982czdtZgIX7qFFo8Jw=;
 b=h/uQeagdRZLmyhtbElma58RPYAAHBU/Gam4Y7duohaCp3q3HWGKe/Dui
 HNjX3nkD4aD1EqksPZjiUdy28l2/0Qipz7FlP9cXrOEpCkoAzRBaLvyNv
 L3RbIwLo55vR2Zk/st9Fo0juczwKq041TA+G04xKE/7/V1RT3+HoF8MPN
 +781XnNP1wrqsfOaQzhj+lHIlPr2TffXnntLUvcDTFLRk8Ie99WFR9rpQ
 lsVn56w0k6LkaBPLlGY+J6OCtRFcGi4qxa6j6VABCVNLfpM28ylWUgQEQ
 uOh/6x3e9miZJeEOgn7wbBUD0088P7vvcQfDk8icLnd/K7iVIDJOtgg7M w==;
X-CSE-ConnectionGUID: uUtVrBNsSAGMzUKEejti9A==
X-CSE-MsgGUID: oT3m9de4Q765Q8VW/52fzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45134261"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208,223";a="45134261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:11 -0800
X-CSE-ConnectionGUID: 0aJZHY3TQqm+pcEXuDafhA==
X-CSE-MsgGUID: 73Ypcy9qQmCZiVkZWDBTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; d="scan'208,223";a="94618147"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 10:27:08 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/2] VF: Avoid reading inaccessible registers
Date: Thu,  5 Dec 2024 18:18:12 +0000
Message-Id: <20241205181814.1484975-1-jakub1.kolakowski@intel.com>
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

From VF-level some registers are not accessible. Don't check for flat
ccs from VF-level, also don't use Wa_22019338487 for VF.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Jakub Kolakowski (2):
  drm/xe/vf: Don't check has flat ccs in bios on VF
  drm/xe/vf: Don't apply Wa_22019338487 for VF

 drivers/gpu/drm/xe/xe_device.c | 2 +-
 drivers/gpu/drm/xe/xe_ggtt.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

