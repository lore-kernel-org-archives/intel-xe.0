Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A7CFF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 09:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD8710E649;
	Mon, 27 Apr 2026 09:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzmVS5mO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBE510E63B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777282373; x=1808818373;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0vHfNWsFlrjwOVsn6/KBWldckzcfPpkH5aZUQWSaF7I=;
 b=SzmVS5mOYtScg0cZby0c77VG1A7iNyxxVf0+g8xKAENCni/We17pKMg5
 scdPFc0Mye0ERYPmDgs+xz4Sj94qgKFo/10Lu7a08ta9aml6+GXvg/cCB
 btuYNgL30xjoA1t03cknZQathxMu8BakokWmcW9sHiYBg5itlnjoiOSC5
 muQqs4QoCeJc4MzSd/xbMSHhRmDFEdRhRY3IVZ+nYL22dfGD4pHhIvz2V
 lIqUBXthYGGGG8UOTRtUTKrkJYMBllWM2lfJg2kKYCRR8dgEPkTbUpTkp
 Qcs2q6c4KMR+I/r27W+6Re3eHG7JHPe68aCFmZ9HGgTuXJ0mnvKU+Smxj w==;
X-CSE-ConnectionGUID: VmZdjYv8TH2PqwSJuc/v5g==
X-CSE-MsgGUID: 9loeXKuJQiOwYuaPVwzxig==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78082623"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78082623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 02:32:52 -0700
X-CSE-ConnectionGUID: lBhGXPnrSHefKvBE1bLQvg==
X-CSE-MsgGUID: uUf4IlEkSUGL9AEWCdFzvg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2026 02:32:48 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/3] Minor GuC PC cleanups
Date: Mon, 27 Apr 2026 14:59:25 +0530
Message-ID: <20260427092928.1181893-1-raag.jadav@intel.com>
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

Detailed description in commit message.

v2: Split forcewake reordering to separate patch (Rodrigo)
    Expand commit message (Rodrigo)

Raag Jadav (3):
  drm/xe/guc_pc: Make xe_guc_pc_stop() void
  drm/xe/guc_pc: Reorder forcewake in xe_guc_pc_fini_hw()
  drm/xe/gt: Drop redundant forcewake

 drivers/gpu/drm/xe/xe_gt.c     |  1 -
 drivers/gpu/drm/xe/xe_guc.c    |  9 ++-------
 drivers/gpu/drm/xe/xe_guc_pc.c | 10 ++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  2 +-
 4 files changed, 7 insertions(+), 15 deletions(-)

-- 
2.43.0

