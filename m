Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3537C10DC3
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 15:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1110E8B8;
	Thu,  7 Dec 2023 15:10:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB4E10E8B5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701961811; x=1733497811;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VqSz7//OtpbI2iUFEdaJAAw2YLV3qq8xTKIyoQvsbfk=;
 b=gvrjLz0eGrGySOb3ULLZESSlTx78fggJpCIsfLkenMsdm5qj8yMSHjcK
 o5NCoE0sD0V1c8iOV+9Kd4ZRlylBnAPbFiUnpTnzX0hoqY6tp76EM77+U
 +ebyFX+EScGWHorXow5P1rR6APaPKX9fYfSYf1JFH6aHt/B8CSqLXgagm
 9xzDhM4E2XtYRkT9ak33oZjky8ET5v4IREL045nLWh4IQ4on76iQUtFiN
 cmGg8UljVWg4aUJfvkJi8Vh0Y0j8u255svKsjLryNgDj3moAf/TZOxHdn
 8UdTKorcEW3ta3uuSKWlpV4T9pYC46GNgMGuYQa3IdUUpAmF/EEzl1LnI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1351106"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1351106"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:10:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945068078"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="945068078"
Received: from jmadex-mobl.ger.corp.intel.com (HELO [10.249.34.28])
 ([10.249.34.28])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 07:10:09 -0800
Message-ID: <da07bf9b-116b-48c6-bd4c-20ffcb20da54@linux.intel.com>
Date: Thu, 7 Dec 2023 16:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Intel_fb.c refactoring
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231207052252.2092191-1-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231207052252.2092191-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I've noticed v2 has a a-b from Jani, seems to be missing in later versions?

Den 2023-12-07 kl. 06:22, skrev Jouni Högander:
> This patch set is refactoring intel_fb.c code to get rid of
> ifdefs. This is done by splitting i915 and Xe specific parts from
> intel_fb.c into their own source files.
>
> Some ifdefs are tackled by adding definitions into Xe compatibility
> headers.
>
> Patch 7. should be sent to intel-gfx@lists.freedesktop.org.
>
> v5:
>    - s/user_mode_cmd/mode_cmd
>    - Fix typo intel_fb vs. intel_fb_bo
> v4: Empty function instead of define
> v3:
>    - intel_fb_bo_framebuffer_fini added
>    - xe_bo_get/put and unpin moved to intel_fb_bo_framebuffer_init/fini
> v2: i915 changes are now backported
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> Jouni Högander (9):
>    Revert "FIXME: drm/i915: xe intel_fb.c framebuffer init and destroy xe
>      changes"
>    fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>    drm/i915/display: use intel_bo_to_drm_bo in intel_fb.c
>    drm/i915/display: Convert intel_fb_modifier_to_tiling as non-static
>    drm/i915/display: Handle invalid fb_modifier in
>      intel_fb_modifier_to_tiling
>    drm/i915/display: Split i915 specific code away from intel_fb.c
>    drm/i915/display: Add intel_fb_bo_framebuffer_fini
>    fixup! drm/xe/display: Implement display support
>    fixup! drm/xe/display: Implement display support
>
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_fb.c       | 247 +++++-------------
>   drivers/gpu/drm/i915/display/intel_fb.h       |   2 +
>   drivers/gpu/drm/i915/display/intel_fb_bo.c    |  97 +++++++
>   drivers/gpu/drm/i915/display/intel_fb_bo.h    |  26 ++
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../compat-i915-headers/gem/i915_gem_object.h |  16 ++
>   drivers/gpu/drm/xe/display/intel_fb_bo.c      |  74 ++++++
>   drivers/gpu/drm/xe/display/intel_fb_bo.h      |  24 ++
>   9 files changed, 305 insertions(+), 183 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_fb_bo.h
>   create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.c
>   create mode 100644 drivers/gpu/drm/xe/display/intel_fb_bo.h
>
