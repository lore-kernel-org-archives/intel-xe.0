Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8404CE810BF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 10:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A8710E4CF;
	Wed, 27 Sep 2023 10:34:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F810E4C8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695810842; x=1727346842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eO6IU5ErzOuYdVNmPdSKOW29rJyA/fnrfaNIau+Xgc0=;
 b=YGwCSKLYrS/7ruTeysw22n3MfCeuk7rKpOoi9dfC6VfZ0QlT666QldSc
 I6r+3k+F9h0iYL/q5S5Kg9XFRaMweW0Dfqh7e3kGELwexAP0fH2PX391A
 rhAc/sHqmL+GHAtB2vv5mW4TeWDCknbGpFF1HaGMYr0PFeya8lP931lIy
 ydwfNFEw01SGBrpg+6e8OyHybFTKLZJOhNl3yrIlzQ9sY0frR5lr9lTeY
 MTG1hbu2Th1aqu9Eq4XA73/o7KjRqD2WPw8+vAuYSvCLPeNiJEabbrmPm
 TJYpqlxQlhV1dd/PCb5rbx1bK4eAMn/4UiP92hb9uNEeDscOZiwPj7MC2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448285213"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="448285213"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872840484"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="872840484"
Received: from vcorfu1-mobl.ger.corp.intel.com (HELO [10.251.220.226])
 ([10.251.220.226])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:33:59 -0700
Message-ID: <ee8b5153-1cbd-4ab3-2b1a-626b13fbd761@linux.intel.com>
Date: Wed, 27 Sep 2023 12:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927073125.3825836-1-jouni.hogander@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230927073125.3825836-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic
 commit
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

When we wrote the original display support, we purposely decided on not 
adding i915_sw_fence support.

In this case, I think a better approach would be to remove this code 
from i915 as well, and end up with cleaner display code for both drivers.

Cheers,
~Maarten

On 2023-09-27 09:31, Jouni Högander wrote:
> This patch set is reverting current changes to fence handling during
> atomic commit. A new compatibility header addressing lack of
> i915_sw_fence implementation in Xe is introduced. This header contains
> dma fence handling during atomic commit for Xe driver and interfaces
> are following current i915_sw_fence implementation.
> 
> Additionally change to current atomic commit code and i915_sw_fence is
> needed. This patch has to go to i915 upstream. It is needed due to
> missing GT reset status in Xe driver. In case of i915 this status is
> polled while waiting for dma fences and in case of GT reset atomic
> commit is completed even if dma fences are not signalled. I'm not sure
> how GT reset is supposed to be handled in case of Xe? Maybe dma fences
> are signaled if GT reset occures?
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Jouni Högander (3):
>    Revert "FIXME: drm/i915: fence stuff"
>    drm/i915/display: Move fence completion wait away from display code
>    fixup! drm/xe/display: Implement display support
> 
>   drivers/gpu/drm/i915/display/intel_atomic.c   |   2 -
>   drivers/gpu/drm/i915/display/intel_display.c  |  50 +-------
>   .../drm/i915/display/intel_display_types.h    |   3 +-
>   drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +++++
>   drivers/gpu/drm/i915/i915_sw_fence.h          |   4 +
>   .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 -
>   .../xe/compat-i915-headers/i915_sw_fence.h    | 111 ++++++++++++++++++
>   7 files changed, 145 insertions(+), 54 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h
> 
