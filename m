Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B97FCCF9E9
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 01:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B715810E31B;
	Wed,  6 Sep 2023 01:20:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353FE10E31B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 01:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693963251; x=1725499251;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJJYdTf22BH2wwmHlRNO2rAi+hd61RnPPXsGjUt4Gus=;
 b=lNkG/62tUHq4RKQJJRP/4aSn6trLwhSam++ikF60RMuxq8SZe2d8VuFh
 ktAWGhNfLLaKYNcKoYEPPZgVizsxfBPKPQdgWykv6JLruNyQNxC4mDWo0
 2oCaZAXP+T37gv58wT/yWapJSwm2HbZ/jrUOIzoDge9GTIgbltk7WXZJq
 HbEfYE/TcrjTuggFTIu/Ld55IaR2o2jrzOVENnOpBZFynhDDMdxWn+nM2
 /ErnQMMr5MQsBvAIwu0KfcfZ7lCRA8AB4BOqfpC8ToQRgrBvpFGovL2Xg
 SBwftwXbR/FlkkTxLsO3SjXaZeSBZG5Jz7Vw4Z+qO7KChOKwffrqwdjck g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="380747234"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="380747234"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915072559"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; d="scan'208";a="915072559"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 18:20:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 18:20:49 -0700
Message-Id: <20230906012053.1733755-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/4] Fix LRC workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Simplify and improve logging for GT/engine workarounds, then apply the
same to LRC workarounds.

v2: Convert the apply_mmio functions to xe_gt_* logging and use them
    for LRC WAs too.

Lucas De Marchi (4):
  drm/xe/reg_sr: Simplify check for masked registers
  drm/xe/reg_sr: Use xe_gt_dbg
  drm/xe: Add dbg messages for LRC WAs
  drm/xe: Fix LRC workarounds

 drivers/gpu/drm/xe/xe_gt.c        | 41 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_reg_sr.c    | 16 ++++++------
 drivers/gpu/drm/xe/xe_rtp_types.h |  5 +++-
 3 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.40.1

