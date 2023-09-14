Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C944EEAA4E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1108910E574;
	Thu, 14 Sep 2023 15:37:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA59A10E574
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705868; x=1726241868;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9DWgA058RTzSGfjSDnrRXGx2wOy5bwsuh/4s52Fg//M=;
 b=Hm1uWzKWnngXb/0QBOi2dZbd3nEkO6sFt0vAw+5lez0NpMQRbgj9WwHD
 9AlJ5XWVTsm71zGBFyjzcGV8g5tZ+In8t8cznqFgO84Y28pCKTpckSchq
 q1XBIC7hpMKlf5btjOwux/iNPw7tbg7iX17DiW/Xl4cA98VnzqCpwGjP2
 7Ni1Jz13PeIrte5NZ8uCZ/A3C2JjsDcA8xkv1sNpe0rnf3kPtkdv+mPGJ
 jbwktQ0ZK3tkBzo1AcurbMYqaDJAlzSRmG0qVfjdBrb3yZMF/vNOfQ8Hl
 DKnOt1cIhrQ31uUs4sZTSFQBVpIuiXqEdwnZk/0sFpKv199laQWx9w637 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376327307"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376327307"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779683401"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779683401"
Received: from ohararox-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:32:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:31:13 +0100
Message-ID: <20230914153112.455547-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] PAT and cache coherency support
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

Branch available here (lightly tested):
https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads

Series still needs some more testing. Also note that the series directly depends
on the WIP patch here: https://patchwork.freedesktop.org/series/122708/

Goal here is to allow userspace to directly control the pat_index when mapping
memory via the ppGTT, in addtion to the CPU caching mode for system memory. This
is very much needed on newer igpu platforms which allow incoherent GT access,
where the choice over the cache level and expected coherency is best left to
userspace depending on their usecase.  In the future there may also be other
stuff encoded in the pat_index, so giving userspace direct control will also be
needed there.

To support this we added new gem_create uAPI for selecting the CPU cache
mode to use for system memory, including the expected GPU coherency mode. There
are various restrictions here for the selected coherency mode and compatible CPU
cache modes.  With that in place the actual pat_index can now be provided as
part of vm_bind. The only restriction is that the coherency mode of the
pat_index must be at least as coherent as the gem_create coherency mode. There
are also some special cases like with userptr and dma-buf.

v2:
  - Loads of improvements/tweaks. Main changes are to now allow
    gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
    exactly. This simplifies the dma-buf policy from userspace pov. Also we now
    only consider COH_NONE and COH_AT_LEAST_1WAY.

-- 
2.41.0

