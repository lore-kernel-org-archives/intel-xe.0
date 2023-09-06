Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AECEE14D0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 20:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073A10E1ED;
	Wed,  6 Sep 2023 20:01:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715E10E1EF
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694030481; x=1725566481;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xj5VQGGC05+8r6s3xkwrTFbx2fcW8I6+BAJDwLwlz44=;
 b=a3vn1A88gUbUCCJHWLf1WgedBTLaBTxFHsNjEhpN6jPmMuGhbqYRPdxO
 N6Xrm33roBlCV79IDkLjNKVgzzxbw6KpjcTl+w1thvh9J7TNUHeW1sUJB
 Y97F4g877N7niCpxTwxbv+vhuE2nkPnd2e3BQDXeu5Q6m+/navfI1CaPR
 dsBbpVgFMU7myzL1V5QCSJ42unRd/G+I1CiePc2MaQWOdAvTZL0+lZFYc
 JU70lFeMr4xLWP23wGD1idZuXU1qD2UiDIlZVTlX2zSr/5TSn17NMcpj2
 iTJEg4d/5IhU9aIYIuKBER9Aj7bcQX3MSfQqFQNDzFFpaJxULDf43DK8W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443557424"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="443557424"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811807025"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811807025"
Received: from jeknudse-mobl4.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.96.218])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 13:01:11 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 17:00:48 -0300
Message-ID: <20230906200049.49674-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] Return -EPROBE_DEFER from
 xe_display_driver_probe_defer()
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

The function xe_display_driver_probe_defer() is supposed to return
-EPROBE_DEFER when not yet ready to continue the probing, but the
current implementation is actually returning 1 instead of the proper
value, which would probably keep the probe operation to be attempted
again. Fix that by returning the expected value in case we need to defer
the probe.

Gustavo Sousa (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.41.0

