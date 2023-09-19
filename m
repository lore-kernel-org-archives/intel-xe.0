Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293CCCD54AB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 09:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC6D10E33E;
	Tue, 19 Sep 2023 09:47:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0BB10E261
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695116878; x=1726652878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRVcdNLaq85MRhyLRsiPsyy7Hez5Lro/y9GJ6Qi8fM8=;
 b=PnBc6V+BI0KKBPSiDvIHKwdgZlEll4GztexI/6VKpU82ytxp9lG929AZ
 XropQ46Dabep0ryS24aHqo8r64QmIlOHZNlhsW3pvZexwpu+FbzarXFpC
 i/sHgtI6IJ1TGv/A6IeLwv8nHY7gmdnBhlwm+M24NBe0AkK1hqoCvg4+m
 3wXHtUv3X6bFd14VnknPYM/ewmvuXr96DNnq/9inzHTgAAYW4XLXjCi8s
 xaGSiRJ0QONO57Hh90eLJah9JrPjhX8hhZ1uTaZV6isbZt2PboBmgTtn9
 wr93+HqWlubEzCgleZpb3AYuzZA6sDc6a+Hp/l6+lyA4iPSxFwNJVKKr1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466225436"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466225436"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739621339"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="739621339"
Received: from danilova-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.251.219.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:47:56 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 12:47:35 +0300
Message-Id: <20230919094737.743358-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Some changes for Xe in spinlock handling in
 i915/display
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

Hi,

These patches are doing some cleaning up in i915 display code related
to spinlocks.  One of the patches addresses a change that should not
be there, namely the addition of _irqsave() in code where the
interrupts are already disabled.  The other patch abstracts the use of
uncore's spinlock so that we only use it when i915's uncore is
available, which is not the case in Xe builds.

Please review.

Cheers,
Luca.


Luca Coelho (2):
  Revert "FIXME: drm/i915/crtc: use irqsave for locking event_lock"
  drm/i915: handle uncore spinlock when not available

 drivers/gpu/drm/i915/display/intel_crtc.c    |  6 ++--
 drivers/gpu/drm/i915/display/intel_display.h | 20 +++++++++++++
 drivers/gpu/drm/i915/display/intel_vblank.c  | 31 +++++++-------------
 3 files changed, 32 insertions(+), 25 deletions(-)

-- 
2.39.2

