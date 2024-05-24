Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8554C25B7C
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 11:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E29610F1A9;
	Fri, 24 May 2024 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9sDAUnc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB410F1A4
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 11:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716550643; x=1748086643;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0Y09Qdi2BUw/z/Bd0tdMGksOXbHL/zrUgQ68fpLD1NY=;
 b=X9sDAUncYX71ZrvZ8X4GrkOODtHamvoqftLXyhpsgBvBOzF650v9HDYZ
 ydtGQ27vtXWjoPVla8CmJ1fWLmIxbHGmQDInGkCp+C+AMvqAUeg+pnpYa
 ZWjjcs4aL20PvnA6et5Kve0/PF62k1h57xWL4xpDGMPb5SxsQFl5upOTL
 QjxfeWW8A0a6kqO1TbaZD/m87QpSPW2zF4/T/Pjy7U9TlOQLdYpKIVPQ8
 NsIgj9+spoMUB2n4+VWhZ4tjHQR6RfOL/i+V/uDT/zKWWJyxpTi81RZlj
 hvhzJHwiSADYL/zOa6VAmvLlfZodq4uo9cgQrttPAlcI25XbeL6pd2PfN g==;
X-CSE-ConnectionGUID: sTbfEVRaQdWMpqFrzaX89A==
X-CSE-MsgGUID: YiW6uA2XTvKXPvId4SqYRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12772691"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12772691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:23 -0700
X-CSE-ConnectionGUID: jd1Sg0pwTRi6RvTXGVTWyA==
X-CSE-MsgGUID: oHOeGpcoRJixUa/8eyTsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="38986480"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 04:37:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] VF: Use only assigned GGTT region
Date: Fri, 24 May 2024 13:37:12 +0200
Message-Id: <20240524113714.932-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/vf: Read VF configuration prior to GGTT initialization
  drm/xe/vf: Use only assigned GGTT region

 drivers/gpu/drm/xe/xe_device.c       | 11 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  3 +
 drivers/gpu/drm/xe/xe_ggtt.c         | 14 ++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 93 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  1 +
 5 files changed, 121 insertions(+), 1 deletion(-)

-- 
2.43.0

