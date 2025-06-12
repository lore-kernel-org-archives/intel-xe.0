Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1EBC71153
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603910E2A8;
	Thu, 12 Jun 2025 22:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="la9S927q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE70110E1C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749766191; x=1781302191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cp3uGir1fNxAl404zmvD+tSZOZSgtAGjPJd6tNIzAzw=;
 b=la9S927qVp2pqxN1enPRsclsgYJ5i9whdGDe8BNJwCo5v0X4SPvsxMh3
 s3GC23LA9EvBlxv7qvvNCRrsMi18BVLOYjJpqKF6ew7fXbwpnaUS5TKy0
 3D0h2htMR6b8yDvDmZSOYUcTYiZYpk3cNbcbQF0RjsyFtZSu3aP3o1fYd
 +YTMVPoI/EGhb4RMOViH6bRdGYH9L8aH8C/YNwgVhwpZaYm4sAsnvZqw3
 +7Ri91EZT8+VxTLNUowFWKfK1JngnGYCOzTCq6VpBOF5QcCOF4poSPT/U
 bKWvVXz84sFf9+b/9ilhvN06oqilIYnemN2zkKMzhsjDNSvkZ/tHdmDrn w==;
X-CSE-ConnectionGUID: XO4PAuHqTBy6f4kb+E52CA==
X-CSE-MsgGUID: swcIp1yqT4eh1qf3IAxkjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="54596251"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="54596251"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:50 -0700
X-CSE-ConnectionGUID: 0pJ+aTNdRg2sVJZaa88c4A==
X-CSE-MsgGUID: +PowfWlRR6CsBDzXUsR9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152626822"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.176])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 15:09:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Improve handling of aborted probe
Date: Fri, 13 Jun 2025 00:09:35 +0200
Message-Id: <20250612220937.857-1-michal.wajdeczko@intel.com>
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

Fix some secondary issues observed during recent VF regression [1]

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5214

Michal Wajdeczko (2):
  drm/xe: Process deferred GGTT node removals on device unwind
  drm/xe/guc: Explicitly exit CT safe mode on unwind

 drivers/gpu/drm/xe/xe_ggtt.c   | 11 +++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.47.1

