Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41D3CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 14:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9736810E4CA;
	Mon, 15 Sep 2025 14:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVdBGilq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9B210E4CA
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757945187; x=1789481187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gwax/c/9WwO4wAqkTE3rqv5D3DAIaEqPBXhumBxsU7M=;
 b=nVdBGilqLkVJtMekrza/FxnMIA3TItK7UfjHc/urHuosM3oHNlHjEk2u
 vBuJlRISPGHq1uluXsn9fA6YkeLSf7LvjrRPrshNSYlSBiazS/WbtswDB
 V5kRbPmZrWqAwDJF5fKpbb+KoTomgJinr3VIts5TdLHrCCmATJ0dHDHSP
 xe9ukaCvLskqAcnHI4MsiscIm015Oy9yNfumCqndPAu2ZinSZAyrgEISw
 Qseb6ArJjKeHJsDy06MXLWBTrUB0AMcvUDplxuTX2ykmdlyxO3MK09bcK
 3CyyL6bGXBRZuVUs75j5tAT3hgG3DNqMAkpNzJwPqwCJ7KtKRknXGT5BY g==;
X-CSE-ConnectionGUID: FE4uuqSdS5OHuRksf+75zQ==
X-CSE-MsgGUID: rDMqZdZMTHqng/D+y/SZmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="63832748"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="63832748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:06:26 -0700
X-CSE-ConnectionGUID: 3bAcT0xvS4SoYCGarpHEdg==
X-CSE-MsgGUID: YXsqGDu9Sc+6ZyrirD6oqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174188848"
Received: from egore-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.116.1])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:06:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe/sysfs: Fix attributes registration on VFs
Date: Mon, 15 Sep 2025 16:06:12 +0200
Message-ID: <20250915140614.2076-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/sysfs: Simplify and fix sysfs registration
  drm/xe/vf: Don't expose sysfs attributes not applicable for VFs

 drivers/gpu/drm/xe/xe_device_sysfs.c | 98 ++++++++++++----------------
 1 file changed, 40 insertions(+), 58 deletions(-)

-- 
2.47.1

