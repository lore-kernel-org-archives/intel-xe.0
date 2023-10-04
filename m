Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBC8E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1FE10E38F;
	Wed,  4 Oct 2023 16:22:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7110E38F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436521; x=1727972521;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gLsl/QZ7lmbnpkqnyoc1DR5WBg6pIKPRT7yAWHb3JeU=;
 b=gERdc8VNLASIvsH4W1xkGavF8bk4WDg3b+ED16dR3mIKtP+p5MdaFM8s
 n6Nn8eVK5tE9Hd2WU1m53WwN4TuKlTlEjGAJiYj8D9u/wRx67SRY9AH8a
 TWA+B2vEY7L3nqFCJwo4huSIohpa+e1z4S92DlFHzUJmNLMqUB8jt6EZM
 bxX3vIPLL22NzR0cmxUys5TgfNNVX7XCJM9EZmrdJH914Ccx2ZdLwv+1I
 nc0lFIgFDYFwF/9+UPU6etgR5vAtGAWVpS5IDarsdyFGlB4HPc1ZGudgh
 6zG1Y/eCzQYBEh5yZzAKdRAKjyhNtSn07QZXgukGiOt91qne+mi96kKdN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368276442"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368276442"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998525787"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="998525787"
Received: from acenturx-mobl1.amr.corp.intel.com (HELO [10.252.41.145])
 ([10.252.41.145])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:21:58 -0700
Message-ID: <9d2a6f00-14ad-41db-98bb-caaba43f70f5@linux.intel.com>
Date: Wed, 4 Oct 2023 18:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231002102359.3740026-1-jouni.hogander@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231002102359.3740026-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 0/4] Frontbuffer tracking and dirtyfb
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2023-10-02 kl. 12:23, skrev Jouni Högander:
> Generic dirtyfb implementation which Xe is currently using is doing
> atomic commit which is inefficient. We have now dma fence handling in
> our dirtyfb implementation. This works with Xe and CPU/GPU frontbuffer
> rendering as long as sync objects are imported by userspace
> (dma_buf_import_sync_file).
>
> v4: add missing patch
> v3: squash fixup patch
> v2: rebased
>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
>
> Jouni Högander (4):
>    drm/xe: Add empty def for i915_gem_object_flush_if_display
>    Revert "FIXME: drm/i915: More display ugly wa needed after rebase"
>    drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
>    fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
>
>   drivers/gpu/drm/i915/display/intel_fb.c          | 10 ++--------
>   drivers/gpu/drm/i915/display/intel_frontbuffer.c |  2 --
>   drivers/gpu/drm/xe/xe_bo.h                       |  2 ++
>   3 files changed, 4 insertions(+), 10 deletions(-)
>
