Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07A3CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 22:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AAA10F9FD;
	Mon,  8 Jun 2026 22:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5JaCX7v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D8110F9EA
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780958188; x=1812494188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sTlfgUmDDLokbm6CoGQT90bHAwWgM0nRDpHYw2bGfR0=;
 b=Z5JaCX7vUet9ourD71XchjhAT+9BR/0GXYUYFwxTV7cdRpcwEelFkfVm
 qvyw/Isc3xK8OMEFe2tqBDlbPC9NZITvJYiqiWf8FpiT4lTlhT+U+azAT
 hjpw/emxmcf984w8Wh7ma2f13wEdvZ2SKN4cHaci2kGyz8wwUlO3C5Scv
 LkT2hlh7XpVoAntPoicw+5vsD3m/od79Ry3xwn7W1/gG6pPS/u3DVjVi3
 HG8DB+6DxlgzzXmNcbo3+T3R4rA+pqh6bOoEFVWeucFmnpqXsCGekt1rY
 18qbj5LnwEe/pBvJYWO3+Nwi+Q1as/dpnFR+LrzmCOVhmz0IWF7lzF0Wt Q==;
X-CSE-ConnectionGUID: W4mKmi/4Rg+WWrP+oY256w==
X-CSE-MsgGUID: wYvGvDbYTvGFEUsu/xP6jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81750971"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81750971"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 15:36:28 -0700
X-CSE-ConnectionGUID: uqgkEhhUSGCWVzlhML/PbQ==
X-CSE-MsgGUID: ed8BVNSxSva0OV18mMQTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269684735"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 15:36:28 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 0/9] Don't whitelist OA registers unconditionally
Date: Mon,  8 Jun 2026 15:36:15 -0700
Message-ID: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Whitelisting OA registers unconditionally is a security violation. In this
series we resolve this issue as follows:

* Set the 'deny' bit (bit 30) for all OA registers, ensuring OA registers
  are not whitelisted by default after probe/reset/restart
* Reset the 'deny' bit when an OA stream is opened and certain conditions
  are met, whitelisting OA registers only for the duration when OA streams
  are open for a gt
* Set the 'deny' bit again, when OA streams are closed
* To manage this scheme, separate out OA whitelists from non-OA whitelists
  (into separate save-restore lists)

v2: Address code review from Umesh. Patches changed in v2 have changelog
    appended to commit message

Ashutosh Dixit (9):
  drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
  drm/xe/rtp: Maintain OA whitelists separately
  drm/xe/rtp: Keep track of non-OA nonpriv slots
  drm/xe/rtp: Generalize whitelist_apply_to_hwe
  drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
  drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
  drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
  drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
  drm/xe/rtp: Ensure locking/ref counting for OA whitelists

 drivers/gpu/drm/xe/xe_gt_debugfs.c      |  4 +-
 drivers/gpu/drm/xe/xe_hw_engine.c       |  2 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 12 ++++
 drivers/gpu/drm/xe/xe_oa.c              |  7 ++
 drivers/gpu/drm/xe/xe_oa_types.h        |  3 +
 drivers/gpu/drm/xe/xe_reg_whitelist.c   | 94 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_reg_whitelist.h   |  4 ++
 7 files changed, 117 insertions(+), 9 deletions(-)

-- 
2.54.0

