Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51133C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096ED10E7E5;
	Thu, 26 Oct 2023 14:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5971210E7E5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698328932; x=1729864932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y20fEi/gtXiew1na/rhqtYRKgPFqwU9lL17l+AOhAT8=;
 b=M+PhvLnw7jT6BbXU6rOMHLPA93cEkFLGBFDqOdjhOXrWG8Q7tHhwS4Ab
 AuSXVD3fCDUXhXyPIQ7aIro2yEzgOmTJAiMGkPQdZ7FTNhZQJhS1BZFWT
 r9Ge3z020skA/5vox/9lCz1jjcoA0rqy/LrzH4hgu05R58wsB7d6WVZNc
 MqxacgEwTe/ZgEhqZ3DlOv8F6bSEVSu2d8H/BbdYHp9yOzhzWibLO96Hk
 4rduYB/66aQFYDOqECRz45RzvrfZi1IzLKHz/ma/CNO0iecgEl1ZqNSVQ
 yCblEtMa2gULgrnMOW3ggSs9GOs7HfK2x4xzHBhai185eArYB/ptW5ce0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="384761785"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="384761785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="709084436"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="709084436"
Received: from tzirr-desk2.ger.corp.intel.com (HELO localhost) ([10.252.49.68])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:02:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231026123326.56044-1-maarten.lankhorst@linux.intel.com>
Date: Thu, 26 Oct 2023 17:02:07 +0300
Message-ID: <87jzr97a8w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 00/15] Destroy 'remaining changes to make xe
 compile'
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
Cc: Maarten Lankhorst <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 26 Oct 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> From: Maarten Lankhorst <dev@lankhorst.se>
>
> Revert all pieces one by 1, and fixup the patch until only a small
> amount of changes are left.
>
> Update compat headers for extra definitions, those patches should
> probably be squashed too.

Yeah. Most of these need proper fixup! annotations. (git commit --amend
--fixup=<sha1>)

A handful of patches need to be sent and merged upstream first and then
backported?

BR,
Jani.





>
> Maarten Lankhorst (15):
>   revert fixme in intel_atomic_plane.c
>   drm/atomic: Add drm_atomic_helper_set_fence_deadline() function
>   drm/i915: Implement fence->set_deadline.
>   FIXME drm/i915/display: Use fence->set_deadline to boost requests
>   fixup xe i915_drv.h compat header
>   revert intel_frontbuffer changes.
>   Update compat headers.
>   more reverts
>   drm/i915/display: Use i915_gem_object_get_dma_address to get dma
>     address
>   revert more (fbc)
>   drm/i915/display: Revert all before remaining changes to make xe
>     compile
>   drm/i915/display: Revert remaining changes to make xe compile
>   drm/xe: Update headers to be more compatible with i915
>   FIXME drm/i915/display: Minimal changes to fbdev to make xe work
>   FIXME drm/i915/display: Make intel_fb.c code compatible with xe
>
>  drivers/gpu/drm/drm_atomic_helper.c           |  15 ++-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  70 +++---------
>  drivers/gpu/drm/i915/display/intel_cursor.c   |  12 +--
>  drivers/gpu/drm/i915/display/intel_display.c  |  37 +------
>  .../drm/i915/display/intel_display_types.h    |   4 -
>  drivers/gpu/drm/i915/display/intel_fb.c       |  89 ++++++----------
>  drivers/gpu/drm/i915/display/intel_fbc.c      |  13 ++-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    | 100 ++++++------------
>  .../gpu/drm/i915/display/intel_frontbuffer.c  |   7 +-
>  .../gpu/drm/i915/display/intel_frontbuffer.h  |   4 -
>  .../drm/i915/display/skl_universal_plane.c    |   4 -
>  drivers/gpu/drm/i915/i915_request.c           |   9 ++
>  .../compat-i915-headers/gem/i915_gem_lmem.h   |   2 +
>  .../compat-i915-headers/gem/i915_gem_mman.h   |  17 +++
>  .../compat-i915-headers/gem/i915_gem_object.h |  76 +++++++++++++
>  .../gem/i915_gem_object_frontbuffer.h         |   4 +-
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
>  .../xe/compat-i915-headers/i915_gem_stolen.h  |  13 ++-
>  .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   6 ++
>  include/drm/drm_atomic_helper.h               |   3 +-
>  20 files changed, 234 insertions(+), 252 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_mman.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h

-- 
Jani Nikula, Intel
