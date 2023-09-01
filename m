Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C1CA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 13:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E2910E1C9;
	Fri,  1 Sep 2023 13:02:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB24110E1C9
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693573322; x=1725109322;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5Gw0JG4YPFiH6MD0xTmJjHqELE5jeUg9HR16WrQBNQk=;
 b=c/8TNIXekCYvJqFk+/vvZskbmAywpAAS8yva1wTDwKMjvYUBbrWvzUN8
 vXNjZrBjFCOp9vzxt7iVFsBijwNNAuWTthY1zg912AAQuTUpcO9OP2i6V
 n8h/Uhelgkb4SWsqZyzl8xVXPy5XoiYCzzLMDVv0sdlPSVuQpJVWIiuKZ
 FZLmSZwqF2/Y8YvEOFQ86axjZHx1OURhDFGSOr9/8SJCqK1TOBvEqxqqA
 5faT9QSTKjPtiRYkV/BLjhf47f29nrokTn3mMfKndavAo0EljcmIESqGO
 hFNTl22PsBB4bxCWo6jLDOZtVWU2BTV+5nEoJ6EQVKbuUk6aFrwMy1LZ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361239935"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361239935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="739924537"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="739924537"
Received: from jeroenke-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.252.59.110])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:01:57 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	ville.syrajala@intel.com
Date: Fri,  1 Sep 2023 16:01:43 +0300
Message-Id: <20230901130144.76152-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] fbc on any plane
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

FBC can be supported in first three planes in lnl

Matt pointed out that FBC + PSR2 combination require few more condition
checks and also a WA also need to be impleteds. So patch to enabled FBC
in case of PSR2 is removed from this version.  Also per pizel alpha
condition is removed for FBC in LNL.

Vinod Govindapillai (1):
  drm/i915/lnl: possibility to enable FBC on first three planes

 drivers/gpu/drm/i915/display/intel_fbc.c           | 7 ++++++-
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 5 ++++-
 drivers/gpu/drm/i915/i915_reg.h                    | 1 +
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1

