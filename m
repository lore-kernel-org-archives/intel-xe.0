Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B9EC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827710E9F8;
	Tue, 21 May 2024 10:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzFF5zNY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6D10E9A8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287317; x=1747823317;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8jeOIIcMgm93OPyy5WIKKlHMjxUpV2OR3L9jsmR1FTE=;
 b=hzFF5zNYgnoNlq3wXZSev4Lb9XYx2PMJYZLOvLk0u+CQ42JZzZ4iJ5aq
 QasNzERokOZdmiVnM5ikvZamNPgonbb9u/g/7oOlXmLaK5k7v5o0RNFw0
 JlKfv6iQGvoUY5+/AxgiBLVoz+EuBAA24EQK2b9lMoNppowNECU/b9voH
 v3N7ogQpAzgxtsDha2K+I/+fLVh0NFAsajFyePpRh+ExlQUmyJaFPjRJj
 Ylez9B4nj/MbK3Tg3G0aUwGFOBa7HVqL01KEZ3gEEflxb60fq/rJ8M5s/
 zI+2S9IIdui46HBTYIV9vDq4kDbwkKo9+Da1exLbMgCsLQ6wbxyKVN1BU w==;
X-CSE-ConnectionGUID: vlA6hSloSyeQmHkVC8uhXg==
X-CSE-MsgGUID: GO1R2v8MQTKRAf7WevOElg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23606680"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23606680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:37 -0700
X-CSE-ConnectionGUID: INVtVUIeSkKsM7JPL0mEOQ==
X-CSE-MsgGUID: Xv/W7HAtQ/Khx6I6hb/UkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37392856"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:28:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] Prefer forward declarations in headers
Date: Tue, 21 May 2024 12:28:24 +0200
Message-Id: <20240521102828.668-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe: Fix xe_uc.h
  drm/xe: Fix xe_gsc.h
  drm/xe: Fix xe_huc.h
  drm/xe: Fix xe_guc_pc.h

 drivers/gpu/drm/xe/xe_gsc.h    | 3 ++-
 drivers/gpu/drm/xe/xe_guc_pc.h | 5 ++++-
 drivers/gpu/drm/xe/xe_huc.h    | 3 ++-
 drivers/gpu/drm/xe/xe_uc.h     | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.43.0

