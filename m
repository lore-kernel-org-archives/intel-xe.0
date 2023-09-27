Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE83E810CB
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784A110E4D9;
	Wed, 27 Sep 2023 11:00:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A607410E4D1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695812426; x=1727348426;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zBBlMxjR6vMvdo8OVsm8C8K2TNtXoloDSSg2JKwCjNY=;
 b=APAOCqhBln2ZMh7cOLr0RYdOBYSGmw4fhrkZmeN5ec/hG8QAHaw6bj55
 a34k6Sy2aSknMAt35nkguaRXAGJ1+7++FrYDDP4oc4Ga5pyZDcZBwx3MG
 M4dubKItrOlLRzybWf5vGn2PqdlAMrBZz6wjZx6sI4Fk3O9VVOXRo+Ts1
 nAL+HIBuM29aZDAVpf7jbCpwdJuSK0kbqL+rnFRm6XJrARJrvVl/iGzX1
 z59rMUd6fn4h6WenDxpQVCsT+1/r9WbZg+WPeifF2cywpu4LjWZQydqAO
 XWxkRpN4Xf97zNjICrhubjpcKSvVhWNov1oACHR4PkmgmtwNpyHBr5gFp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372139515"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372139515"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080109477"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080109477"
Received: from wangyuan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:00:06 +0100
Message-ID: <20230927110005.291917-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/5] PAT and cache coherency support
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

Branch available here:
https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads

Series directly depends on the patches here:
https://patchwork.freedesktop.org/series/124225/

Goal here is to allow userspace to directly control the pat_index when mapping
memory via the ppGTT, in addtion to the CPU caching mode. This is very much
needed on newer igpu platforms which allow incoherent GT access, where the
choice over the cache level and expected coherency is best left to userspace
depending on their usecase.  In the future there may also be other stuff encoded
in the pat_index, so giving userspace direct control will also be needed there.

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
v4:
  - Rebase on Lucas' new series.
  - Drop UC cache mode.
  - s/smem_cpu_caching/cpu_caching/. Idea is to make VRAM WC explicit in the
    uapi, plus make it more future proof.

-- 
2.41.0

