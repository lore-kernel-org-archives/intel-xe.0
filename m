Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89157EE8011
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 14:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F91910E8DA;
	Fri,  8 Sep 2023 14:42:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6510E8DA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694184171; x=1725720171;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WsPZP6X78ykZqsuDc8n335KZkPUoHIiHdS5xP7zDf/w=;
 b=Z9D/0vwn5w5ZB6K0z2AG3+i+IAQrPOgcHwavYSNalEYc1cqu/XkwekmC
 Z5m8DapOpWGzOzkxlS49dVva6petRLvz3UrwOlzmOldPBjXxYydvWRMNA
 8ACPEOP+E4RRxsN2LTjCnqqUOAyW4kRxTXm96UZnfFaB58SNdxYR05tKP
 XBx0idvvgI8Ktelo80DX6V26P1v0Qijlx3m58UUR2Hs9eABzOUKcNwjWL
 CSOyJvmGQF/5Tg2nTwSCtbRNgO1SGE3/rUkzGg1pRXRnz3X0saiMqz21s
 S5iljPdJXfIhwtiVCqlecyv5hz/n1ZuSImNx6Y1Qv0vzCe4ABaY2B/Xr+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375041951"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="375041951"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 07:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="692278262"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="692278262"
Received: from dinahclx-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.213.169.125])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 07:42:49 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 11:42:34 -0300
Message-ID: <20230908144235.33628-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Turn display finalizers into static functions
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

Finalizer counterparts of display initializers are registered with
drmm_add_action_or_reset(). Since there are no other explicit users of
them outside of xe_display.c, let's turn them into static functions.

Gustavo Sousa (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/xe_display.c |  6 +++---
 drivers/gpu/drm/xe/xe_display.h | 15 +--------------
 2 files changed, 4 insertions(+), 17 deletions(-)

-- 
2.41.0

