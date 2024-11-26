Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DDFD5A6D8
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 03:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCC110E782;
	Tue, 26 Nov 2024 03:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBDJiPbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4346C10E782
 for <Intel-Xe@lists.freedesktop.org>; Tue, 26 Nov 2024 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732592652; x=1764128652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e9vuEl42qgu/xqLL6SPkkNP3JM9IhvqaE4PXl1qk5jM=;
 b=ZBDJiPbWFqbqvu/lTzt28Vzx7as1yE+++DrPBGrKWN7fWDGARZU+SI/M
 vAmhjjXXSShEpd4o92NSUsq+UK7g06wsR6h+vgl5/vmEM3cuTUvxSrG6S
 agzafjcMAlyaT26GKex2XeSC5plgMQ+31u24F6sRn3WoTg2H6cIHttD+C
 MMdHqV9nRsQ/50OqbtDNmaGrx/Ij3YdVEM4adseXFtawP9avXfJbXysiy
 EcmF0KyVm201A81cs5sdftEbMuHqpMbDFNHiJvSCViomqs4T5aXTUI/Fr
 APcusxJVHfZ276G/iHcbmvfZkrSbRo9QWMVUiH8DEYWptdkkbJKKKNYKM w==;
X-CSE-ConnectionGUID: EF9b1IAcRLGElPPaEJ/6Dw==
X-CSE-MsgGUID: 50U3TiOoTvWeafI/+nY0lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="58139086"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="58139086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:44:12 -0800
X-CSE-ConnectionGUID: SCun+NqVRi6RPtkPLo3exw==
X-CSE-MsgGUID: 0UqUi6/8TmmrRgmM6dOcbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96534278"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 19:44:11 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 0/2] drm/xe: Add devcoredump locking and reason string
Date: Mon, 25 Nov 2024 19:44:09 -0800
Message-ID: <20241126034411.2417033-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

There are now many ways to trigger a devcoredump capture. So include a
reason message to say why it happened.

Also, add locking to avoid a races with double captures and free vs read.

v2: Change to spin_lock to mutex and a few other tweaks (review
feedback from Matthew Brost).
v3: Move mutex locks and add reclaim annotation (review feedback from
Matthew Brost).
v4: Fix typo - when adding lockdep specific code it helps to actually
have CONFIG_LOCKDEP enabled!

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe: Add a reason string to the devcoredump
  drm/xe: Add mutex locking to devcoredump

 drivers/gpu/drm/xe/xe_devcoredump.c       | 53 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_devcoredump.h       |  5 ++-
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  8 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++--
 4 files changed, 68 insertions(+), 12 deletions(-)

-- 
2.47.0

