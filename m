Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B8DCD6E60
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74A510E1F3;
	Wed, 11 Oct 2023 12:17:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8D10E4DC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697026641; x=1728562641;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=54okKXz95shymtmnQU/PLVM/vUlCrOWhiEsFISv6vFQ=;
 b=ODAeVwjLUdKihVqZvT57GyUPZR20dcEQOtz10FeHq2TUVBULTs7VTD6d
 Yraob5vf3S1ZvLnWjcB6ld1HLAeHhJXIRGjWHfO6diltWGFK7Q/pnBTam
 wbGkrAe8bKV5PDXIWSHrGmPlDYSEsDmayiILkt1KNb7elxw7NWqET9Nex
 Ugqpi2a5iIzqwjKUbwCoSn/h5maF6WQ83mkJva+wCrH72QQlejC4nRlwq
 d3w7TaqhoEV8KFR9TXTOfkGqofr24DkQNZoL+KoQGL+ANDI49jAz7wa2E
 b2LttdCFdNvSNXU1KLAXH989K3oGsiLB9O+kp63zFoFXqZ9QZI/qCiBPj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988478"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="374988478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="870121045"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="870121045"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:17:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <877cnw6r2r.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696588392.git.jani.nikula@intel.com>
 <877cnw6r2r.fsf@intel.com>
Date: Wed, 11 Oct 2023 15:17:05 +0300
Message-ID: <87il7d4am6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 0/6] xe/display: clarify display
 configuration
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
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 09 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> On Fri, 06 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> v2 of [1] with all the controversial patches dropped.
>>
>> I'm not going to pursue the dropped patches any further. I'll leave it up to
>> others to clean them up or leave them broken as they see fit.
>
> Lucas, you claimed v1 broke LNL, but I have no way to verify. Does v2
> work for you?

Pushed the lot, fingers crossed.

BR,
Jani.



>
> BR,
> Jani.
>
>
>
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://patchwork.freedesktop.org/series/124561/
>>
>>
>> Jani Nikula (6):
>>   fixup! drm/xe/display: Implement display support
>>   fixup! drm/xe/display: Implement display support
>>   fixup! drm/xe/display: Implement display support
>>   fixup! drm/xe: Introduce Xe assert macros
>>   fixup! drm/xe/display: Implement display support
>>   fixup! drm/xe/display: Implement display support
>>
>>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h | 11 ++++----
>>  drivers/gpu/drm/xe/xe_assert.h                |  3 ---
>>  drivers/gpu/drm/xe/xe_device_types.h          |  2 --
>>  drivers/gpu/drm/xe/xe_display.c               | 25 ++++++++-----------
>>  4 files changed, 17 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel
