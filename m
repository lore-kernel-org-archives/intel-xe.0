Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CC1C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94A610EC54;
	Wed,  6 Mar 2024 10:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxOZpX4r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79310EC2B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719426; x=1741255426;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UUgFqFS7MtZrha8enHhFnipOANhZcufhrcaW1+KglQQ=;
 b=hxOZpX4ryWoUQhdhCmbGra+6EfIw9cHT1Gq1gz7fXPTtH7DlXNIkQ0Ze
 wJzHl8x8JYidTuSafyw7apPv//xwXvx3TDXqXSwNHc8AudHMlGCmJv1/J
 EBPpX+BiXvxtgyE9XdXrekZp5SqauE9bWBfpf9j1fuFwlkspfYgfDCqyt
 bjGbhvbH+jXPGPfvPvSyRc4sOKgt4hBJtwuhIQEx+0rnkVUcHv8U9kiad
 Vs4CSIeYHM3l7aPKCJOTqAAaM5o1XkrfbmNanJCJ8EMtP7dzAzU9TYM9Z
 2q2PSRQQOt5Z1JqdYldkH26S0IQTBh3edTQC7f7fVHkevZ2bmsEsEo7oz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8084649"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8084649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9643749"
Received: from cpetrove-mobl.ger.corp.intel.com (HELO [10.249.46.28])
 ([10.249.46.28])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:03:38 -0800
Message-ID: <70628840-088c-4896-aeb3-f567b23e103f@linux.intel.com>
Date: Wed, 6 Mar 2024 11:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Spin of Reduce GGTT display pinning latency.
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
References: <20240306052002.311196-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240306052002.311196-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

For the series:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Not sure how it's supposed to work when I wrote some patches, but this 
version looks good. :)

Den 2024-03-06 kl. 06:19, skrev Matthew Brost:
> Verison of [1] with changes discussed in reviews, mainly the addition of
> XE_BO_GGTT_INVALIDATE_BIT.
>
> [1] https://patchwork.freedesktop.org/series/130739/
>
> Maarten Lankhorst (2):
>    drm/xe: Fix NULL check in xe_ggtt_init()
>    drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
>
> Matthew Brost (2):
>    drm/xe: Drop ggtt invalidate from display code
>    drm/xe: Add XE_BO_GGTT_INVALIDATE_BIT flag
>
>   drivers/gpu/drm/xe/display/xe_fb_pin.c |  5 ++---
>   drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>   drivers/gpu/drm/xe/xe_bo.h             |  1 +
>   drivers/gpu/drm/xe/xe_ggtt.c           | 25 +++++++++++++++----------
>   drivers/gpu/drm/xe/xe_ggtt.h           |  4 ++--
>   drivers/gpu/drm/xe/xe_guc_ads.c        |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_ct.c         |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c   |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_log.c        |  3 ++-
>   drivers/gpu/drm/xe/xe_guc_pc.c         |  3 ++-
>   drivers/gpu/drm/xe/xe_hw_engine.c      |  3 ++-
>   drivers/gpu/drm/xe/xe_lrc.c            |  3 ++-
>   drivers/gpu/drm/xe/xe_memirq.c         |  1 +
>   drivers/gpu/drm/xe/xe_sa.c             |  3 ++-
>   drivers/gpu/drm/xe/xe_uc_fw.c          |  3 ++-
>   15 files changed, 40 insertions(+), 25 deletions(-)
>
