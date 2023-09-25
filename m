Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F6CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CA110E185;
	Mon, 25 Sep 2023 13:21:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EAA10E185
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648084; x=1727184084;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8heSybhVsvOmzHx1LFUstbwrxnudSj3IJTmhoOamZ+Y=;
 b=YQMqlK7reWyCIDJNGd0hmcsevyF2qpVZzY/y6NhZYTLsTnfE5iN98fOg
 3+roH9OK6/M9HBWCbE/Jpu6OfdxHR+TDeaT+rsboMYS2ZGW6NQCEYLMxV
 9nyMBn0UGJp+XwlVeVzmKqVCWhn4rvZpPBZwdCwGrJkSkXRo5A5WJNuMn
 0tfyYdNbdrNNDdQdewpoVYbJ1YXJnED/HVRFnyZUlNu6SaPe+euUfr76/
 Sr0uEScca4nd7rryNPO23fkvkVuwRhxU6DRnxltNv1cBiRJNiBM54F8Je
 L6iJopQZ6obT8/bjpq6Q3aQVJansKuI3TcTNnyXouezXabIY1gHTYLzXN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378521482"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378521482"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751679060"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751679060"
Received: from ngorb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.27.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:21:13 +0100
Message-ID: <20230925132113.59900-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/7] PAT and cache coherency support
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
v3:
  - Rebase. Split the pte_encode() refactoring, plus various smaller tweaks and
    fixes.

-- 
2.41.0

