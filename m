Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41699E9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 04:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D0F10E546;
	Wed, 18 Feb 2026 04:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brD8D6Ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04BB10E546
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 04:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771389207; x=1802925207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SmrDKHzdV5aoc4xe458s+6q9kkGvyg9x1tg+SSbsyQM=;
 b=brD8D6IaZ+q8btIgWCy9XuvTcpSgFwxlF6uOskp4Ah12naZdAGJMT2yl
 674I/Sl40xNoqBC98W3nrA2xn0yHP37uNroQ0qcr1qYfaFe48dElSKp9V
 KU+oOnteKMXjHzMXNbiLb+pYSrOaPES54Qum9xMKih4yXLdJP2HTZdpzD
 2Pp9YtuzTg+3DFC3tLjtdP5M/oKbqxcp8yijq0aC5cOsiJgWaxWzvA6D6
 1OjMnxzUDbwCSXHfviCmRmwxb9PVX8G+OPTWm2KyniQwBOFEGmhzooyQQ
 6QkiT/TcScwvgE+WeIiEG1yvgyq++DvahXYxB9vj/pCoXbu/3CG11UKQ+ Q==;
X-CSE-ConnectionGUID: F1eUI2DNQnKO8qUKL8jxjg==
X-CSE-MsgGUID: XHKhlJmoTR+NMeDwg3vnLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76303540"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="76303540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
X-CSE-ConnectionGUID: fk78dSxTSFe4nZ8Oc9mDJA==
X-CSE-MsgGUID: OhNU+oOgQYyq41wP5/bZKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237095371"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 20:33:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, francois.dugast@intel.com,
 daniele.ceraolospurio@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 0/3] dGPU memory optimizations
Date: Tue, 17 Feb 2026 20:33:16 -0800
Message-Id: <20260218043319.809548-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Profiling has shown that reading from VRAM on BMG is very slow and
introduces significant latency in GuC CT operations. To address this,
CPU-side read buffers (G2H) are moved to system memory, and unnecessary
CPU reads of VRAM in H2G paths are removed. This results in roughly a
50× improvement in page-fault G2H read latency and a 10× improvement in
H2G send latency (observed in ftrace) These optimizations have produced
noticeable improvements in page-fault UMD benchmarks.

Also move the seqno LRC to system memory. The performance impact of this
has not been measured, but based on GuC behavior, the HW fence signaling
path should see a noticeable speedup.

Matt

v2:
 - Fix devcoredump explosion (Testing)
v3:
 - Drop fixes tags
 - Address Michal's comments
 - Fix H2G tracepoint to avoid unconditional VRAM read
 - Move LRC seqno to system memory

Matthew Brost (3):
  drm/xe: Split H2G and G2H into separate buffer objects
  drm/xe: Avoid unconditional VRAM reads in H2G path
  drm/xe: Move LRC seqno to system memory to avoid slow dGPU reads

 drivers/gpu/drm/xe/xe_guc_ct.c       | 92 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  4 +-
 drivers/gpu/drm/xe/xe_lrc.c          | 57 ++++++++++-------
 drivers/gpu/drm/xe/xe_lrc_types.h    |  6 ++
 4 files changed, 105 insertions(+), 54 deletions(-)

-- 
2.34.1

