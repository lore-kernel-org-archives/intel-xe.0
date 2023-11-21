Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B11C61D96
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 11:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF9E10E26A;
	Tue, 21 Nov 2023 11:56:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3847910E26A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 11:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700567798; x=1732103798;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4f17aidBVNJF5Xo0d4qzhkDapZme4uoSK6HwngQNgQ=;
 b=J84oxZDLwdx7ne97uS0JQEKK4X683DE0LoW6aBCjqgGoQN/5m9LtBiZI
 yIFdsN5OANZZxlatKMSPVIEQKJb5EGkaxV324GQp0ddw9hDcnBV7HjADX
 AUbKB8HuW5is3R7KN7IV/y2a8+xIWsSuAfYqLnSy1bVfIf4bUjEEpduXE
 dLdsxXB5EfextQiaxHLxCOMIY77zGiXkbEzEchuvFiWWpQ6yyZuInZoYg
 xx6/8i462RHiba8Ueff3jk7OkHfuxkP2vBzZoS0Uj44eBHRN0f4FxsEh6
 4laVjQZsTelglUiv9ZlB40l6SYM+dvBF29iheN8AksZJMhNoRW0Qqyi/I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="372000026"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="372000026"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="837030961"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="837030961"
Received: from aokavana-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.6.223])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 03:56:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 11:56:27 +0000
Message-ID: <20231121115626.151214-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v11 0/3] PAT and cache coherency support
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

IGT changes:
https://patchwork.freedesktop.org/series/124667/

Mesa:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25462

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
v5:
  - Rebase, plus some small tweaks and fixes.
v6:
  - CI hooks fixes + checkpatch.
v7:
  - Some small tweaks
v8:
  - Rebase on Xe2 PAT table additions.
v9:
  - Drop coh_mode.
v10:
  - Rebase. Also add some UMD acks.
v11:
  - Rebase on some more changes to vm_bind.

-- 
2.42.0

