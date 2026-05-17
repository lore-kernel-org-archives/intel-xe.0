Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C1BCD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 14:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B310E292;
	Sun, 17 May 2026 14:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvY18K28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6518910E286;
 Sun, 17 May 2026 14:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779028940; x=1810564940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e82iwcJwIofa68u2Ua2drl5sz4qMeAGl3YQyNyHQzS8=;
 b=GvY18K28dRMpI07THEVlLLo5W1LQAhW75tKqwappxt0A5eHK97X+Cqwh
 MhojQv8zT4LvNHpuJKXrinLtspwqW2rtbIpBtHKkuHwhQEZOHMqXCoHPr
 sI6JrVdwwLzlUPKPoVwoKhnHg3Y1wxRUM3KSKRyBNiELzpAu0qjSufBPg
 raOcwcXm2UL4rJBBJfz7Gtz3sd6CQv/sw9qbQ0xds3wNV0rcYkyB/T/nc
 xBtqqCXcZLn6V5kiHD+Rgg07oJIQOZUjqry4S7ViP32jRW1gFcLhAkTrt
 8yjWZT/UOv/8O/jNxPPU2IpadiJmMfMmSUTIGpIkmxhcCUbQB+xEhgpZ1 g==;
X-CSE-ConnectionGUID: luAjOpFBR6WCj1J4+CzyKw==
X-CSE-MsgGUID: yQdjr+jjSjavGwWVtuOOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="102575513"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="102575513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 07:42:19 -0700
X-CSE-ConnectionGUID: t8W7swayQcyKS+voCmBcjg==
X-CSE-MsgGUID: PDKDQr2iT9SvHJ5O9SL/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; d="scan'208";a="236552049"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 07:42:17 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/2] Refactor and extend SCL handling for VRRTG
Date: Sun, 17 May 2026 19:57:51 +0530
Message-ID: <20260517142753.2813959-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

Simplify the PSR SCL (Set Context Latency) condition logic, then extend it
to support always-on VRR timing generator where SCL can be 0.

Rev2: Avoid clubbing multiple checks and return early if check fails (Jani)

Ankit Nautiyal (2):
  drm/i915/psr: Simplify the conditions for SCL computation
  drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG

 drivers/gpu/drm/i915/display/intel_psr.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
2.45.2

