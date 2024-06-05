Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C1FC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 20:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1309F10E0A4;
	Wed,  5 Jun 2024 20:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNU0AAvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF56A10E253
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717618799; x=1749154799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MBGVMIL1uzWbearaFI+yT/vYDiGKDJfrKA2VsnG/wfc=;
 b=mNU0AAvmSak79JDxVkuna/ZhqGFLHGRB3NUswEK+oU3th9bCX55YKQqB
 BtfXpSGaf+LkTQZk+SchLD+fWS9C8RX03NzwYxrUB94PXt7Yf0P4Whurk
 yeZLr4DXHhHEXiI3xL4Z96GI6I99hkhSfogFqp/5RfzHmY0R/qua47X6L
 8LVcaev/kKYmxqwFvjHoQ/AtYz7xe6Ao/zVnlnA+a3geUrhAimJFMqaId
 PvVFw+j1mgScfN4JQwRBhiZ92Qg7IdXOM3echvQ605wni0jXdI8SRGeR3
 C2dDVqrug0hX9SWTO9FqN+0g2VVmjZRFvZ3JdgzsyUCAaiEhOsJW6ZFQv g==;
X-CSE-ConnectionGUID: 7fBD9iYTSKuioYyG57dFHw==
X-CSE-MsgGUID: xktf+qztTleLRVJS6mFGxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31751840"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="31751840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:19:58 -0700
X-CSE-ConnectionGUID: SrXi1n0WTjqMfLVndoFyOQ==
X-CSE-MsgGUID: vEUDxKheTP2iPDi5tjeqeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42161859"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 13:19:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Allow CTB G2H processing without G2H IRQ
Date: Wed,  5 Jun 2024 22:19:45 +0200
Message-Id: <20240605201947.1460-1-michal.wajdeczko@intel.com>
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
  drm/xe/guc: Prepare fast-path to be called outside of IRQ handler
  drm/xe/guc: Allow CTB G2H processing without G2H IRQ

 drivers/gpu/drm/xe/xe_guc_ct.c       | 47 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
 2 files changed, 47 insertions(+), 2 deletions(-)

-- 
2.43.0

