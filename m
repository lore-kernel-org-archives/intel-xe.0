Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1455CD3447
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 18:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6BC10F26D;
	Thu,  7 May 2026 18:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i9iEruii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DC610F26F
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778177181; x=1809713181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SqL4m9ovsXUVm7HCWJuPhNpKS8PaAWJvxy8xBIIZZTg=;
 b=i9iEruiiKCXjPLoPC/6g/SWp9/B/Jq3lcsdbIr55mtzj/L3d1VhMBUPh
 /varVdfn+moGmBnJWqhx1V5yaz0w3F2CKosda/1njcv44pX8ej2A5P6PD
 YjrxU/7/it6IlXB8+N1Pn6tCfvrujXGj5CRm3+fC676yb/q1WBO2TShkR
 6WryylXhF2y//sgBjaV7i1cm9QiQirbdfPh0hnBXmaskOEUKbqWu09m6q
 zXrX97rK8D3awHoDs/jpUyHNquv2HMJVPHkJMUIScJYkKouerRoflq+gU
 Hm5v/HqoxPPNUAKUuHOn96tJeN5ZXGxu6LlcfTDZ4zzEd/WwBsVJmqq08 A==;
X-CSE-ConnectionGUID: hehEQBU+TSuWQ8ANlo0nPw==
X-CSE-MsgGUID: tnM3oW/qRWSPBmwaquHNvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79325187"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="79325187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 11:06:21 -0700
X-CSE-ConnectionGUID: /0HXb7vVSb6UGJpeUjJqyg==
X-CSE-MsgGUID: wGEn5zcFREmBPo7uW7+8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="259968787"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa002.fm.intel.com with ESMTP; 07 May 2026 11:06:20 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 0/3] drm/xe: shrink and compress GuC snapshot dumps
Date: Thu,  7 May 2026 14:06:15 -0400
Message-Id: <20260507180618.1420986-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

GuC snapshot output is currently expensive in both size and latency: large
log buffers are emitted as raw ascii85, and the surrounding dump text
includes a bit of avoidable noise. This series makes xe snapshot dumps more
compact and easier to handle by compressing the large binary payloads,
tightening the textual output, and trimming the default GuC log size.

Select ZSTD_COMPRESS in DRM_XE so the xe module pulls in the zstd
compressor when built.

Reduces the default GuC log buffer from 8MB to 2MB, which still preserves
useful history while cutting dump latency and dmesg load; with typical
compression, the emitted payload drops further.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (3):
  drm/xe/guc: Compress GuC log and CTB dump with zstd
  drm/xe: Remove extra newlines from LRC snapshot dump
  drm/xe/guc: Reduce GuC log size from 8MB to 2MB

 drivers/gpu/drm/xe/Kconfig      |   1 +
 drivers/gpu/drm/xe/xe_guc_ct.c  |   9 ++-
 drivers/gpu/drm/xe/xe_guc_log.c | 110 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_log.h |   5 +-
 drivers/gpu/drm/xe/xe_lrc.c     |   4 +-
 5 files changed, 108 insertions(+), 21 deletions(-)

-- 
2.34.1

