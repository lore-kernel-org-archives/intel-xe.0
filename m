Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8724CA0EF1
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 16:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E76110E438;
	Tue, 12 Sep 2023 16:22:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792B910E438
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694535765; x=1726071765;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cqVPiMIbnieQQmnFdKZGh+gq8Whg2uzi8B3kMlaxcpo=;
 b=DfsXvIiljbRCYtBWyEx2FX5jPQAH26VhEqrM9qc5pkzjl3hhvdIoT+QA
 1ORZi/C5ZNP3Z+iwANxpJE45k7r7yf8fm+vO1e2OjUKKx5o2XMb32u0Yz
 W4ul1LfAXZ5gWxbIes4p3ixt1qplTZ2aNljI4POBdcQUWDnzt37J5BbBZ
 Eln+DX3K9Sy3+pkqRJxC87+N6MKyxX/iiqbaPboGLWY8W38WoNow2ydtG
 4qh7MeP5/DPaft+EbQA1txk7xtsBqbxHs6qYjXMLjmZFVqNr87k5C6tiw
 2zRQbaoXm4Ri/EB/NiMWqY0M0vCZMnQMWtShBT9EV+lenjB5DXii52LS+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357859287"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="357859287"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="737173633"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="737173633"
Received: from dursu-mobl1.ger.corp.intel.com (HELO [10.252.35.246])
 ([10.252.35.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 09:22:42 -0700
Message-ID: <4a223d04-6578-9ebb-59b4-92e8bbf955b5@linux.intel.com>
Date: Tue, 12 Sep 2023 18:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230831095154.3121578-1-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230831095154.3121578-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 0/5] FBC refactoring
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

On 2023-08-31 11:51, Jouni Högander wrote:
> These patches are cleaning up all #ifdefs added into intel_fbc.c for
> Xe build.  I915 part of the refactoring is already merged into drm-tip
> and these patches are implementing interfaces or adding empty defines
> for Xe.
> 
> v2: Add parenthesis around parameter in i915_gem_stolen_node_allocated
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Jouni Högander (5):
>    Revert "drm/i915/display: Implement FBC support"
>    fixup! drm/i915/display: Remaining changes to make xe compile
>    drm/xe: Xe stolen memory handling for fbc support
>    drm/xe: Add i915_gem.h compatibility header
>    drm/xe: Add Xe implementation for fence checks used by fbc code
> 
>   drivers/gpu/drm/i915/display/intel_fbc.c      | 101 +++---------------
>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   3 +
>   .../gpu/drm/xe/compat-i915-headers/i915_gem.h |   9 ++
>   .../xe/compat-i915-headers/i915_gem_stolen.h  |  79 ++++++++++++++
>   .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   1 +
>   .../xe/compat-i915-headers/intel_gt_types.h   |  11 ++
>   6 files changed, 115 insertions(+), 89 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_gt_types.h
> 
