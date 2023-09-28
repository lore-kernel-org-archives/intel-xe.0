Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3533CE7B10
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 09:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63D110E5FC;
	Thu, 28 Sep 2023 09:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B9810E5FC
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695893321; x=1727429321;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZA2bJhXQ2FTHXg4Gx20naUMLR30YgNle42QdTmHmuq4=;
 b=OKTzeGEXqy7a/09c3k2gXUgW76Ss+DMWu/cKnuimbEejAt64PZFuU2+m
 xbFSu1rd0uxQ3XjVm0r93M0kzjlo83O8D3lEvfIapeuR6WM2S9YFF6SdF
 j6xJNY+2bxqQiWzFQ/3Nuo1+sUd/IwTaEmZX2DE7nO+rGNisuWioUX7B/
 hm/dnf7YXVFKJE3Xo1iXue8EY4gmCyW+FM9tuENSFwXCtLEIcWqJG1bNl
 0oo6lAvJrXeciGlymifgYEnLkffmByB5+X0y8xeOnrMA/inxelLmCgm8j
 Fqbf5M7JLhDJ/CQru7T0PxQRwxI+FGpLjQiyZLbEhQ6p+ic42HwdO9Hf9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448509981"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="448509981"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752900875"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752900875"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:28:17 +0100
Message-ID: <20230928092816.375130-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/5] PAT and cache coherency support
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

-- 
2.41.0

