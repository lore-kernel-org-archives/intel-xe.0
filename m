Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F6BCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 04:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0EB10E1D1;
	Tue, 28 Oct 2025 04:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ0qR2zV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B3E10E1D1;
 Tue, 28 Oct 2025 04:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761626880; x=1793162880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rn4B2sO1mwX1pkx9oh6imetAm8NER7GibEag0EqXHSs=;
 b=NZ0qR2zVctXE8IVCw/V2ti6fSjblH86/vKA8BXuZvzbEk5GkPe+HO1pR
 5hFGCoWwby4SXf6AR8W96/4Ru0MCn8ae6c6+agW2rrpcekPbaPkVOiU5u
 lPwl+v+3Y5f86uvzoKJ4qVGtviXvWpSGzTE64ZXanxNLVxBXrhVmNU9vO
 DROMN2cKXY6B/f5EgNZAtbi/c3xb71bo/kBmRSaC8lNRQPNe4V8YqYA3P
 OmnYQjLqo343C2MaHMP98flIHekTlfGxVnqbljHDEPbxzH7+/WPgj9BLv
 /vZVd375mLR8IVJ6Vs+JYNPpKOqqOVI3S1roXcY2BM2xRUG/Lgv1Z35up w==;
X-CSE-ConnectionGUID: AJYk8IvHTm+ANVy06qUK7Q==
X-CSE-MsgGUID: zB9FEGy/RcyxsXeI+eP4qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75163291"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="75163291"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 21:48:00 -0700
X-CSE-ConnectionGUID: Nh12NrOTROiWaDbcyTv6yw==
X-CSE-MsgGUID: L4MXm5ZeSH2qPptuZj25GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="190364889"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 21:47:58 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/3] Fix Adaptive Sync SDP for Panel Replay
Date: Tue, 28 Oct 2025 10:04:59 +0530
Message-ID: <20251028043502.2977803-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Enable Adaptive Sync SDP always when Panel replay + auxless ALPM is
supported. Ensure AS SDP is sent on line which is within the SCL +
guardband region.

This series is in continuation from discussions in [1] [2].

[1] https://lore.kernel.org/all/1b8c6c6de1e5fe0db83e6ae942dfee7e6f950767.camel@intel.com/
[2] https://lore.kernel.org/all/aPtqdAxDwiuQZbrn@intel.com/

Ankit Nautiyal (2):
  drm/i915/dp: Move computation of as_sdp_after psr and lobf
  drm/i915/dp: Allow AS_SDP only if panel replay + auxless alpm is
    supported

Jouni Högander (1):
  drm/i915/display: Take into account AS SDP in
    intel_dp_sdp_min_guardband

 drivers/gpu/drm/i915/display/intel_dp.c | 32 ++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.45.2

