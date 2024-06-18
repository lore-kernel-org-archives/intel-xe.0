Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBF9C2BB9A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047510E562;
	Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2cWOpKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1703510E163
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686855; x=1750222855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m8W4oUkPsOh+J7xN3giDO2uTEc8QSEgUEhGhD/KLkIA=;
 b=Z2cWOpKPsjPUmsT0YY3XyTSDdA23BmWShMt+cGw8ycnOAvU1zCUdldRE
 tIsfk/z0+1dTPEcMhzzrNj4knp0KixC6LR9zjKABRSh2a/r7fplqTo7Vu
 fS5u+5WDwKlCKDAdTm2gTm2IPVYnwHQn/b0p0BTVBq3Fe1B1KVepu4Y18
 nZvSXzaLU/ZsqcEzNlLug41MXPucsIyZ5zxb+U7IlCJT/73dcjGBWoGlQ
 NVbqIDCC5p7SFGgyqqSzGjr3GbofnyIPxt802ka8XTAhhLcMM2bl8HHMA
 Nc0XOn2lMv8/0hSS478VLec55OO9pfTgrn/D/Tc0RNikdPuHBhC8fRDNO Q==;
X-CSE-ConnectionGUID: WxY7EhttQZipCqO/8TErsA==
X-CSE-MsgGUID: EF92MI7jTTeLIH3hnGiD4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256598"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256598"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
X-CSE-ConnectionGUID: tD3wrqc1RsuXnvbfxMZZmA==
X-CSE-MsgGUID: ypbItNIcTmCmFqoK12O34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537732"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/5] drm/xe/rtp: Allow to OR rules
Date: Mon, 17 Jun 2024 22:00:39 -0700
Message-ID: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

Add a new match that serves to OR the rules and a few more improvements
around that so we can future-proof Wa_14020756599 as implemented in the
last patch.

First 3 patches are covered by the unit tests. This is also tested on
LNL to double check in the workarounds debugfs if Wa_14020756599 still
matches correctly.

Lucas De Marchi (5):
  drm/xe/rtp: Allow to match 0 sr entries
  drm/xe/rtp: Expand max rules/actions per entry
  drm/xe/rtp: Allow to OR rules
  drm/xe/rtp: Add match on any GT
  drm/xe/xe2: Add proper check for media in Wa_14020756599

 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 64 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.c            | 36 +++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.h            | 55 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h    |  2 +
 drivers/gpu/drm/xe/xe_rtp_types.h      |  3 ++
 drivers/gpu/drm/xe/xe_wa.c             | 10 +---
 6 files changed, 153 insertions(+), 17 deletions(-)

-- 
2.43.0

