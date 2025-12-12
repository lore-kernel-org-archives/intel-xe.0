Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E25AD59F53
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 23:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF43610E983;
	Fri, 12 Dec 2025 23:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMrZSmzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A2410E979
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 23:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765582490; x=1797118490;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FKO+xWksQwb/BWueaV7op8UjAf6OuQI3AyFNhiKu1xY=;
 b=VMrZSmzLJjvAbGEDqpQOLhe4wFvrOr/BnJl6LZJ5cgPGFKgoFGYc/AUq
 LdMZSoo4fu52DPiwgAd57wpvyJqJQ93t/y9BT0vXtM3gqiyGFJdwur9sP
 u2BwewWNkW1Xxu+F1gUMViyZPIr85Nm92RzfMPawWW80u8SCES1F5PQRm
 whWBZ0u1wbnLg/CUMIayEVNwwlJci0nHNXKpOJT3tJYC1DkEX9J0b2Kcq
 LAdPryEyA3UvSz+EisSyLQ36qYo7KF4udFX+1i51UKQc00+dmNAfw+ilu
 IMxMN7oZVVLcldgK0ulrfoWBXe2lfO+Ybq5JNS7zj2N4lHeDLdiOU5x81 Q==;
X-CSE-ConnectionGUID: OXoW5xTSRJ+x0NS6mbX7vw==
X-CSE-MsgGUID: XYWpS0OrQpu14fZecyOFfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71216668"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71216668"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
X-CSE-ConnectionGUID: qpI62rfUR32VnDAJ7yZd+g==
X-CSE-MsgGUID: GkBw01jQTLqGoQfVV9RBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201696877"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 15:34:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 0/3] Attempt to fixup reset, wedge, unload corner cases 
Date: Fri, 12 Dec 2025 15:34:41 -0800
Message-Id: <20251212233444.1717326-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

We have several bug reports [1], [2], [3] describing failures in reset,
wedge, and unload corner cases where memory is not properly freed or
fences fail to signal. This patch attempts to address the issue by
forcefully killing any remaining queues on driver unload and wedging the
device if not in mode 2.

Sending as RFC for now, as I don’t have sufficient coverage to test and
ensure everything works correctly.

Matt 

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
[3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029

Matthew Brost (3):
  drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
  drm/xe: Forcefully tear down exec queues in GuC submit fini
  drm/xe: Trigger queue cleanup if not in wedged mode 2

 drivers/gpu/drm/xe/xe_guc_submit.c | 40 +++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 14 deletions(-)

-- 
2.34.1

