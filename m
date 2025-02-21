Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E6C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 19:00:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D8010E16C;
	Fri, 21 Feb 2025 19:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYAlksJD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F186B10E16C
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 19:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740164459; x=1771700459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e3PsaCSX2W+F/Tn8fiqJ1ee2/FpLEE4KtOna9yWL+uo=;
 b=mYAlksJDtWTinA866pfdiE6w96t2ysU9ea9lox5IICrGouvslpQJC02n
 GTTktZspvb9dR6x6lpryDbAmI9p7ubanp6i85fjMGydfTpXlia+qDV3Gt
 w1WpF/9BCf2jyuut9U/jZSNpbLekMg5MoZAl4f2mwDrPbYycLmYYXf2Ia
 Iv8fE9Q4dwZbWWpwGd6Az4Oc5+2Su3TieU5Hlc7GzYttgNIAjDM8yflpj
 cAo/GttLejhiEkrpttdgGCtkhlOFfPCQa/8S3veZxHsKjB0msoZ4spzV4
 TMSOUNwTU6/rQI3LAx+ULkeVr59uF56370iDeNNHRAuh7l1RYsOR+xQHR g==;
X-CSE-ConnectionGUID: pIUUlLzeT3y9qwNk7+Bv9A==
X-CSE-MsgGUID: KcmsAdgOTp+rLEEI3cy0sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41257642"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="41257642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:00:59 -0800
X-CSE-ConnectionGUID: 5GSezypMSpmYBKo4/lXxrA==
X-CSE-MsgGUID: x7ttagPGQaaHM/j8h3WlbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120549672"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.217])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 11:00:57 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 0/4] Prepare RTP to define SR-IOV specific rules
Date: Fri, 21 Feb 2025 20:00:34 +0100
Message-Id: <20250221190038.1734-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

This is a respin of [1][2] series from 2024 but this time with focus
on OOB workarounds. Additionally it helps to avoid misleading reports
in /sys/kernel/debug/dri/*/gt0/workarounds where VF could report all
OOB workarounds that were not explicitly disabled.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

[1] https://patchwork.freedesktop.org/series/134918/
[2] https://patchwork.freedesktop.org/series/135034/

Michal Wajdeczko (4):
  drm/xe/rtp: Prepare RTP to define SR-IOV specific rules
  drm/xe/kunit: Export xe_step_name for KUNIT
  drm/xe/kunit: Update RTP tests with SR-IOV rules
  drm/xe/rtp: Remove redundant rule to omit VF

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 112 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.c            |  25 ++++--
 drivers/gpu/drm/xe/xe_rtp.h            |  19 ++---
 drivers/gpu/drm/xe/xe_rtp_types.h      |   4 +
 drivers/gpu/drm/xe/xe_step.c           |   2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules     |   2 +-
 6 files changed, 145 insertions(+), 19 deletions(-)

-- 
2.47.1

