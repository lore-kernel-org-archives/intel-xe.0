Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC51EDEBF1
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 20:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720AF10E8B2;
	Tue,  3 Mar 2026 20:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icylZeGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BDF10E8B2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772568877; x=1804104877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zetzTuH1dMvhDDCkVXJhtBxxpSzwH4uWsHh9a4YNlR8=;
 b=icylZeGRxvAgVmk47Y78hrdHeaCFvuC+lLGYfZUz5SZD2p6SY10BB3Ad
 WeydjnO3vQv4gXkiWWefxvZvRnhgmu+fYrzlaMHLska9IgUEaqw2vfR/a
 Llg1/gnwX6q+leL4f8BUl+przGMdYEHzB58DWholVkkIWyevXs6Tn2YDC
 2P2ArfRIuld4axzNIyZ0rKf/izYUpN5B/eUeZQuICBgWdB3fE+ir+DhCI
 eTPHtGuGkxRpZWePZa6U8BwkutkscgnlR/+Obk+RGusx/4G3UdOEyVx/Q
 MELQyk1XoYLpPkJTCeqNmPuMdP5Ykn92SFOHwZnGFC7vjXkjYQ2cpC88B A==;
X-CSE-ConnectionGUID: pFr/i4SXSdiieNFFUQuknw==
X-CSE-MsgGUID: nFl+BZNBRF6Km5wihCOyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99096713"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="99096713"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:36 -0800
X-CSE-ConnectionGUID: +zcNbP35TIGwLpNoX7+2RQ==
X-CSE-MsgGUID: 5gQc96pmRB2Mf1IzgkvZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="256005826"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 12:14:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe/vf: Improve getting clean NULL context
Date: Tue,  3 Mar 2026 21:13:51 +0100
Message-ID: <20260303201354.17948-1-michal.wajdeczko@intel.com>
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

There is a small risk that when fetching a NULL context image the
VF may get a tweaked context image prepared by another VF that was
previously running on the engine before the GuC scheduler switched
the VFs.

Michal Wajdeczko (3):
  drm/xe: Add PR_CTR_CTRL/THRSH register definitions
  drm/xe: Add MI_SEMAPHORE_WAIT command definition
  drm/xe/vf: Improve getting clean NULL context

 .../gpu/drm/xe/instructions/xe_mi_commands.h  | 13 +++++++
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  8 ++++
 drivers/gpu/drm/xe/xe_gt.c                    |  9 +++--
 drivers/gpu/drm/xe/xe_ring_ops.c              | 37 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops_types.h        |  2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h       |  2 +
 6 files changed, 67 insertions(+), 4 deletions(-)

-- 
2.47.1

