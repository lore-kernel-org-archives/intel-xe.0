Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CEACD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 17:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813310E837;
	Mon, 11 May 2026 17:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqjFyQAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C072C10E819
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778520536; x=1810056536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9FNa0ErLvVNB9Nwy1kcPXk5/TLvc3p8HFYxXt8pNyls=;
 b=QqjFyQAioPRcYALbtmy42ynnBDEoNUxj2UQDxlxMKO8+F9p2ysFl/hZz
 GRbZ/jGz3bm3iZDD7EhNqGtDhLhsRBFL0UUbybhkXmu8aaeZz4JWCX+pl
 cbKFxK9yXT1aNiYBb4YPXUH2SQq7L6iY3aLZO+b1FODTCDQCu/4neOVcV
 e2KDY8BOboTij0kTEmUo8oyyXYsCjSxkm/Zbxgr4pErE2ygpLnLYGhPbg
 HAxHn30HsGgjay9cO4Z3T7YmtJ/wKq8EvmAukEjFW0pPOQ8U2D/XeuGXk
 2Gn/7HLV4Ia9B5eehGolyNUSW9xExRjgTg5GCw4cpRvLd/izfYMD82m/+ Q==;
X-CSE-ConnectionGUID: FmIedgZUS1ON6kcZW1YkkQ==
X-CSE-MsgGUID: b7Jl0CC8Rsqof4jC1kIkFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90001354"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90001354"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:55 -0700
X-CSE-ConnectionGUID: zm45i28YT8uG3DyncNqo3g==
X-CSE-MsgGUID: xTLY1lYyQ92N4h4nEI/42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="261256889"
Received: from gkearney-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.250.94])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 10:28:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe/memirq: Update interrupt handler logic
Date: Mon, 11 May 2026 19:28:36 +0200
Message-ID: <20260511172838.2299-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The new programming note for handling memory based interrupts was released.
Update our interrupt handler and stop listening to all interrupts, as they
might now cause unnecessary empty processing.

Bspec: 53672

Michal Wajdeczko (2):
  drm/xe/memirq: Update interrupt handler logic
  drm/xe/memirq: Enable GT_MI_USER_INTERRUPT only

 drivers/gpu/drm/xe/xe_memirq.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

-- 
2.47.1

