Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A57C2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E74910E295;
	Wed, 19 Jun 2024 21:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GbTZh/wr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E73F10E28F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833586; x=1750369586;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bo/yTLSOwowN5g/hYad9S75VmH44auGlcq9uxooVqMY=;
 b=GbTZh/wrSKFc/O8FglLXU1O8eJFeaEnfbC0SF56SFWsRf5Xx+DGZWCtc
 SLPrWWD6ZfSm8GWbuuBH8MIiRN7nQIDii8/eonjDtwm0PRix3v7DJW8es
 rDJapO7ke252xKsLQU+H+X+DVDw9Ss1iTOae/eyCFZsSkkyGxvu/wUgBP
 5GkybpWv/oG8ORTps3h5IoVdGm6/dO+tx/C974hsIEmHWfihZZS5PgIQ0
 Wbmlg7hyhG8BnoKqFiBp5wiZaj3Z6Wjccw3jijrsMD6OFn+9k0PwT9jV/
 N3sAYUzsbUZTvCooCmbeOD73plu77nJFz8pf1lF0/A/huOs44QU1t/t5U Q==;
X-CSE-ConnectionGUID: RBtWPjlVTP2apFRbUDCAkw==
X-CSE-MsgGUID: 6Putwt4CT2iUjj4nMg77TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662971"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662971"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:26 -0700
X-CSE-ConnectionGUID: PHvoizgqQam2b3M8Ew5BUw==
X-CSE-MsgGUID: u1nGiCnrTPORmhrukqPOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157803"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] Adapt the driver to boot on the VF device
Date: Wed, 19 Jun 2024 23:45:48 +0200
Message-Id: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

This series should be the last step required to boot the driver on
the VF device without crashing.

Michal Wajdeczko (9):
  drm/xe/vf: Disable features that do not apply to VFs
  drm/xe/vf: Don't run any save-restore RTP actions if VF
  drm/xe/vf: Don't apply tile workarounds if VF
  drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
  drm/xe/vf: Don't initialize OA if VF
  drm/xe/vf: Don't support gtidle if VF
  drm/xe/vf: Don't use register based TLB invalidation if VF
  drm/xe/vf: Skip engine ring enabling if VF
  drm/xe/vf: Custom HuC initialization if VF

 drivers/gpu/drm/xe/xe_device.c              | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle.c             | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++++
 drivers/gpu/drm/xe/xe_huc.c                 |  4 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c           |  3 ++-
 drivers/gpu/drm/xe/xe_irq.c                 |  3 +++
 drivers/gpu/drm/xe/xe_oa.c                  |  4 ++++
 drivers/gpu/drm/xe/xe_rtp.c                 |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c                  |  4 ++++
 9 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.43.0

