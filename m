Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A6FE6ADC7
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 20:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6408F10E05C;
	Mon, 22 Dec 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cN4WxKIQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2F610E05C
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766434798; x=1797970798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wad1xYn9ITBXLFjah8hoq8NNENk+dl5+U6rAGXUpt4U=;
 b=cN4WxKIQjvUnieKRfhqQ1QBQDAzvm3X3zWvc1zWAkSnHAIYDhP7awKNb
 Y3oyHWZ3rl59OeSteVhuakmmaM9odQ2i1nUDkfVGBhvGAlXzkpoIkE5N8
 1emk7rkGfTEuObpd4J7Kioj+AwQCJ84HwM9P+Ua9lVJqgT3JpE6ucWsd5
 32lgjPNv5FXpiUY5fikMvz1i4tnfovFM/zQcSPrCidEts6eYWB70LCcVE
 oAWyynHs6bZkU19mo9fPE6QQ8LRyI2LpiTbsutAJgYsDQNvcpM5A8VK6U
 PriB9w2qS0ulicL7iwBVpXit2AGDzpaYPpWWtlU7BhTzwicFU92sJyXqa A==;
X-CSE-ConnectionGUID: rCoe4SBXQ/2Ly6L65lLglw==
X-CSE-MsgGUID: GlU0ZiNDSVSiz7SMqa09eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68335792"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="68335792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
X-CSE-ConnectionGUID: r+9kknibTJeAK0dtuT3YPg==
X-CSE-MsgGUID: pXqMuLq9QkS4LOB2wGHjYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; d="scan'208";a="200100902"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 12:19:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v3 0/2] drm/xe/guc: Prevent compiler read/write optimization
 breaks
Date: Mon, 22 Dec 2025 20:19:58 +0000
Message-ID: <20251222201957.63245-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
g2h_fence->done values to prevent the compiler from ignoring these
necessary operations.

v2: (Matt Brost)
- Add Fixes tags
- Add comments

v3:
- Split into multiple patches (Rodrigo Vivi)

v4:
- s/xe_guc_ct/guc (Michal W)
- Add comments with READ_ONCE and WRITE_ONCE updates
  (Rodrigo, Stuart, Dixit)
- Squash patches with same Fixes target
  (Rodrigo, Stuart, Dixit)
- Add partial comment justifying WRITE_ONCE in guc_ct_change_state
  before READ_ONCE in xe_guc_ct_enabled is added (Rodrigo Vivi)
  - Update above comment when adding READ_ONCE to xe_guc_ct_enabled
    (jcavitt)

v4: (Matt Brost)
- Squash patches operating on the same value together
- Remove unnecessary Fixes tags
- Add READ_ONCEs to pair with WRITE_ONCEs on g2h_fence->done

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Jonathan Cavitt (2):
  drm/xe/guc: READ/WRITE_ONCE g2h_fence->done
  drm/xe/guc: READ/WRITE_ONCE ct->state

 drivers/gpu/drm/xe/xe_guc_ct.c | 21 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
 2 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.43.0

