Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8535CA0EF1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 16:15:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A88910E438;
	Tue, 12 Sep 2023 16:15:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D5210E438
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694535312; x=1726071312;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YJ/UWBWHDYeDK4jTgDN4AmPWISzeVNzrYPCFL068fCM=;
 b=jhTSimYN8JxKHEtPn6IzZ6CYMI+EWHrYt9Zq/RI/8gnnij/tIC333sDS
 nfc7TIvFENZ0iKG03HOhrAvcweHm7byske72o5QBkAOyRk2pGd9MGIs8D
 QDo9jXJ3JrlOg8Xeza9bp7kiRlIzUHrg90Kgq6dIylrFT2iUbiaWw/C/H
 jQgIaAR737N+fgqSRf9i2mW/eJsoElmYCGfHJnWHceF6iAitZLq/NLfX7
 6Hj4854yoQKXWC8T3Yza8eF4xay+c9Z7GQrn7AxiCiZR+iIr2NYqoM2mV
 dVu4CZHHnba9hZ2z1NwKKhIxjThkIF9ts9SsWtFm4sD3zPRI8YG5zc1VL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381125801"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="381125801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="833970864"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="833970864"
Received: from dursu-mobl1.ger.corp.intel.com (HELO [10.252.35.246])
 ([10.252.35.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:13:27 -0700
Message-ID: <0dd3d826-2d1a-6e99-5859-90aab350da2e@linux.intel.com>
Date: Tue, 12 Sep 2023 18:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 00/12] Frontbuffer tracking refactoring
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For the series:
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2023-09-12 08:46, Jouni Högander wrote:
> These patches are cleaning up all #ifdefs added into
> intel_frontbuffer.[ch] for Xe build. I915 part of the refactoring is
> already merged into drm-tip and these patches are implementing or
> adding empty defines for Xe.
> 
> v3:
>    - drop reference counting from xe frontbuffer set implementation
> v2:
>    - xe_bo get/put handling changed
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Jouni Högander (12):
>    drm/i915/display: Move releasing gem object away from fb tracking
>    drm/i915: Ignore set frontbuffer return value on release
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/xe: Add macro to get i915 device from xe_bo
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/xe: Add frontbuffer setter/getter for xe_bo
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/xe: Add i915_active.h compatibility header
>    drm/xe/display: Include i916_active header
>    drm/xe: Add struct i915_active for Xe
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/xe: Add empty define for i915_ggtt_clear_scanout
> 
>   .../gpu/drm/i915/display/intel_frontbuffer.c  | 29 +++----------------
>   .../gpu/drm/i915/display/intel_frontbuffer.h  |  2 --
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
>   .../drm/xe/compat-i915-headers/i915_active.h  | 22 ++++++++++++++
>   .../compat-i915-headers/i915_active_types.h   | 13 +++++++++
>   .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  2 ++
>   drivers/gpu/drm/xe/xe_bo.h                    |  3 ++
>   drivers/gpu/drm/xe/xe_bo_types.h              |  3 ++
>   8 files changed, 48 insertions(+), 27 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_active.h
> 
