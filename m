Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE076D26281
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738D210E1CF;
	Tue, 20 Jan 2026 18:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2oKNj/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D53210E1CF
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768933900; x=1800469900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0QlVQ54tU44yFRRpdjP/1yM/aObHgudrlF5YJTk7iU=;
 b=A2oKNj/BgH6FTl3zfIf57t8Jlex6Y1TvBBuZgC/y1Aoq7PqbD+m2R62R
 XHH/XIuDPAzbeMWs7v5tEjT76+FCzhzxKZTJkNauU6CzsaMrqafmKJHDt
 vMFBZjSibcoeeAa4e5dsFnAIHosEt0Fp8iRGB4q/RAdfSj+ychl4FdnMV
 lFgir6d3tpLjkeOkxQvZygGqykm8jyPPgafLnukEFFXSCTH5Gy3Bs0twC
 gSdAQ2aEwLxe9nBAh5GuzK5Zxr2aIZ1olV8Bz9f8mEV7pB8yAXi1p0fbZ
 xa3KqGnAq1nypQdLG0r8f82lggpeIVHS5fLZDv6l5XzIQUlF8oug2dqY1 Q==;
X-CSE-ConnectionGUID: 5BMWpz1kRHyrWV6kOOLAYw==
X-CSE-MsgGUID: c9+51zq/TQ64Yk1kYt6O5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="95628409"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="95628409"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:31:39 -0800
X-CSE-ConnectionGUID: BwCEb1ddQU+IinylpfZA1g==
X-CSE-MsgGUID: TRQ66q49SH6ABgh+YAKCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206612781"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 20 Jan 2026 10:31:38 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v4 0/3] Fix nvm aux resource cleanup
Date: Tue, 20 Jan 2026 18:28:16 +0000
Message-ID: <20260120182815.2966078-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260109220026.2468067-2-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
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

v2: create patch2 to "Fix double-free on aux add failure".
         
v3: drop goto in patch2 and create patch3 to drop the clear of xe->nvm.

v4: re-send series to fix patch apply failure.

Shuicheng Lin (3):
  drm/xe/nvm: Manage nvm aux cleanup with devres
  drm/xe/nvm: Fix double-free on aux add failure
  drm/xe/nvm: Defer xe->nvm assignment until init succeeds

 drivers/gpu/drm/xe/xe_device.c             |  2 -
 drivers/gpu/drm/xe/xe_nvm.c                | 59 ++++++++++------------
 drivers/gpu/drm/xe/xe_nvm.h                |  2 -
 drivers/gpu/drm/xe/xe_survivability_mode.c |  4 --
 4 files changed, 28 insertions(+), 39 deletions(-)

-- 
2.50.1

