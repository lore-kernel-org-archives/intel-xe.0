Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229F6CA0FF3
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 14:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51C10E546;
	Tue,  5 Sep 2023 14:31:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024F10E542
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693924305; x=1725460305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NJuUcM9tA+vxOamS8r7oryQXCMSAycNX5V3JPXHfTss=;
 b=TLEhF7a9Iyq+5xhyDc4J2e8TLqQeMe0zXaLkjaqqDFJu4KFHdB5m9rui
 6/JmK3yDOXctTcse5IaLKhu2K1pmTGfqnhzh2XMOLMOmwKhtRVxdBk1Yk
 FUCRUm2SYb1Dqh10rRKa2SeOSTjRmvdD178WrSlz2R84XGhuQxglTdZs0
 FQbr/EsSrSv8O7QRHkGMzmAIACmIQPCpYk/YZk2Ne+ErzdzD84aUg8Q/E
 2GEesflykVDpx5D1TgiWO1bnulehnLHwsWgpRe/nAyNjiXH/UB7dILpDG
 J0hVdzX3w/SMvjfMlH9AC444NcTMyIF7i0+mAB2LciKQw9Q20eq+75Ets g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407798191"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407798191"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856008683"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="856008683"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:31:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 07:31:41 -0700
Message-Id: <20230905143144.1706967-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Fix LRC workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Simplify and improve logging for GT/engine workarounds, then apply the
same to LRC workarounds.

Lucas De Marchi (3):
  drm/xe/reg_sr: Simplify check for masked registers
  drm/xe: Add dbg messages for LRC WAs
  drm/xe: Fix LRC workarounds

 drivers/gpu/drm/xe/xe_gt.c        | 43 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_reg_sr.c    |  8 +++---
 drivers/gpu/drm/xe/xe_rtp_types.h |  5 +++-
 3 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.40.1

