Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4388C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 23:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4761E10F417;
	Thu, 16 Jul 2026 23:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L9hLjMqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943A710F415;
 Thu, 16 Jul 2026 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784242811; x=1815778811;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KGnjuMtmx7aECZQjuPSAcXnMQ2ZN617RGNN2vGyuFbk=;
 b=L9hLjMqfZ9tL9KXBzcLq771BGPj79Ym6A1pPMCei5BnFfqHhGKCePYO6
 lCKSfwrp8Gd5l43PT518f5VXAOwTVSHIEG1Yh3SYQF1NV4nPySCfX+Os7
 ADovcLeO1thvKYxspDrmnioFXhSb0/ADeFcysgK6xm4yEcunKna0E8TIx
 RzwPptMEsiRunEoTBAhqqIdazRNC6YRseI2Xjs6OmCrn7FYHoowyx9YV/
 p+JJrJAHH4RxaiEF/z8loBResUBVBLqb006K9jzh8E8WajoJ8CHld2VVT
 qvr1Mdw46/D56BGWhcE8MA1EOCj2qVwzpF/ibixk42APqYnTgDIXFZ1fx Q==;
X-CSE-ConnectionGUID: j7swGrQ8TpW4HT00EurVfA==
X-CSE-MsgGUID: KZ+aayT5T/OzIMJlaUvtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="107711293"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,223";a="107711293"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:10 -0700
X-CSE-ConnectionGUID: C9UjIAebS4a8E6P/9IUzhg==
X-CSE-MsgGUID: eA/zJOckQMyxXz5euzLqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,223";a="252227080"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.15])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 16:00:08 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: 'From 351218ae36a91f36924c9b3c1ecc4d42100fd573 Mon Sep 17 00:00:00
 2001
Date: Fri, 17 Jul 2026 01:59:52 +0300
Message-ID: <20260716225956.555995-1-vinod.govindapillai@intel.com>
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

From xe2_lpd onwards, FBC do not restrict on the plane width.
FBC can be enabled with platform's maximum supported width 

Vinod Govindapillai (4):
  drm/xe/display: Expose plane max width/height helpers to global scope
  drm/i915/fbc: refactor maximum plane size handling for fbc
  drm/i915/fbc: xe2_lpd+ don't require any hardcoded plane width limit
  drm/i915/fbc: xe2_lpd+ no more surface size restrictions for FBC

 drivers/gpu/drm/i915/display/intel_fbc.c      | 19 +++++++++++++++----
 .../drm/i915/display/skl_universal_plane.c    | 16 ++++++++--------
 .../drm/i915/display/skl_universal_plane.h    |  9 +++++++++
 3 files changed, 32 insertions(+), 12 deletions(-)

-- 
2.43.0

