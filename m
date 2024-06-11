Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E4CC25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 10:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8669B10E4A6;
	Tue, 11 Jun 2024 10:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5YGJocl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C02110E586
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718100496; x=1749636496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3LYLW3gDfO9r/pMZQ6d8ywExoB3U9lFDrkNfpV67F8o=;
 b=f5YGJocluBInMckTUPBv4d7r/FJfh4wUG89RpHTUeyXdCErBkMs5NDOx
 YMhVnoQCj2UYS4X38z5RLwIli/7VorTtTfypiVbA+eLNQF+Da/iiRVD9h
 U4E02G9/AbpFFvz8XGyna1Ycz2tEjoJ4zxC4zrRLzCSgyLi6t3bFepiFO
 qXwwF9Ph9gAWqa3Xk3LTTOKHFRs5hJurWhXpJQTRTgD3xaRvmvgaQq+Zy
 86UmYjgnMK2rsI+fj5I0icmmshY7nXq2nC4fYZPnnpcdbb7zUY03fl/mA
 GTDxNwG+BEDZ1oXgVEvAIIb484CZFanyJneGcx8TLxj/AkQb9GTGLKV3S g==;
X-CSE-ConnectionGUID: rSFNhz/fQgi9mtlw4cJQpA==
X-CSE-MsgGUID: J+wjqHVVQlyY2dFArK809A==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18582064"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="18582064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:15 -0700
X-CSE-ConnectionGUID: 93hMgxe7RNeXG4BqpGcvjA==
X-CSE-MsgGUID: I/w8erIxQPmpP9YmKXFNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39456829"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v2 0/4] Prepare Xe force-wake code for VFs
Date: Tue, 11 Jun 2024 12:07:53 +0200
Message-Id: <20240611100757.1856-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

But before doing that, make some improvements inside xe_force_wake.c

v1: https://patchwork.freedesktop.org/series/134690/#rev1
v2: remove ret2 and rename str_wake_sleep helper param (Rodrigo)
    drop inline from str_wake_sleep helper (Michal)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

Michal Wajdeczko (4):
  drm/xe: Prefer GT oriented messages in xe_force_wake.c
  drm/xe: Include additional info on failed force-wake operation
  drm/xe: Combine common force-wake code into helpers
  drm/xe/vf: Ignore force-wake requests if VF

 drivers/gpu/drm/xe/xe_force_wake.c | 71 ++++++++++++++++++------------
 1 file changed, 42 insertions(+), 29 deletions(-)

-- 
2.43.0

