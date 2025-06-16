Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE97C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F41E10E13D;
	Mon, 16 Jun 2025 06:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJUPpU2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4644A10E060
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750054667; x=1781590667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DiyCsJPxCXHjCZZcPQNlTN4skldxYSCEFniXPooeUv4=;
 b=nJUPpU2hRHsWjyxpb+P4gBCaq78D6uN3+AzbDeZsuxkaGr9g49rlKW95
 QGMnAvAMUawZ7bODgqOsjbV+DCASfBpVTzlUefqN8gpsly+hs3zeyOHGy
 T64j6txz0OS2m96cauk0rHqprIFldsV+b4Zw8t3k0Fq2z7G085gPcu2ZX
 97ncPIDsHUS5y4CfD9kckwlNoS/sKGPX8c+tAVgtUSaNHbsrpw0b5ENtM
 qZwWhGTm7UBdNkX8cxlOazNhugbdIWacxselK84cuayTkjqqAHX2bxc5l
 ggHfcZfWPVBEcBz7eemo2hWNS31jvvo7dPbUNRZ15lrZopEeS8byeGQ24 w==;
X-CSE-ConnectionGUID: cJZktxHGSBCWimr3gKgwQg==
X-CSE-MsgGUID: wH6iQXKTSce+uCRmAR2YTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62796301"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="62796301"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:17:47 -0700
X-CSE-ConnectionGUID: y3lr5YxzTiSA9T/eIvVbNw==
X-CSE-MsgGUID: RxMZ2ERMSFKA75pBQfbhAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148372321"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:17:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH v4 0/3] drm/xe: Update Wa_22019338487
Date: Sun, 15 Jun 2025 23:17:33 -0700
Message-ID: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250613-wa-22019338487-d18a019d79a8
X-Mailer: b4 0.15-dev-a7f9c
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

Extracted from https://lore.kernel.org/r/20250602234415.2015921-4-vinay.belgaumkar@intel.com.
Now that the other workarounds were already update, also update this
one that had more changes.

I'm following the version from that patch series, so this can be
considered v4.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Lucas De Marchi (2):
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_22019338487

 drivers/gpu/drm/xe/xe_device.c       |  13 +-
 drivers/gpu/drm/xe/xe_guc_pc.c       | 280 ++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
 4 files changed, 225 insertions(+), 72 deletions(-)

base-commit: 6e474d767e318b98cc45d4b90095290879085741
change-id: 20250613-wa-22019338487-d18a019d79a8

Lucas De Marchi

