Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9048BC2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3355110E0FF;
	Mon, 20 Nov 2023 18:20:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8B10E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700504409; x=1732040409;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mViT/Vl15NLLKMH+No7Xnpb6FKhmIFnNn8O7Jf0DTtQ=;
 b=N53KaSyppAfu5j1S0K6YVF13js00JiTGq53ZVXZ3UmceWH1uMep7KdD0
 BXElXQ75sauetNnHBYeIuQkFNsJjDOrzbrMq5BQUYUr0O+Cwhn9J3roSN
 QfsPxPV/PEHw0NHYOgPtKwY4W61HpM8sSZXS/V2GZLAwktrD1WC13O2LB
 Qd0Yw8mlcNIDbDDnJsyuB0mK6BHjTeAq63mgFIcyWh0katmpEx7JMdfNg
 UYgVNGwgQOSawB4SDgL5eclLHZG07zwzPSSv7CkZcwqQPaJsIInlfF4ks
 BGXQ38VDScuqq5McVWJPQNIw+VETfkvtuvY3HmKQBhI9IWtHZGi3naA/5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371848834"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371848834"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:20:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="14239241"
Received: from mgrott-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.6.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:20:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:19:51 +0000
Message-ID: <20231120181950.87489-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 0/3] PAT and cache coherency support
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

-- 
2.42.0

