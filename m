Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89599E95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 10:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012910E0F6;
	Mon,  9 Oct 2023 10:14:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0A10E0F6
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696846449; x=1728382449;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T6+gaR282CL7ZWvGDXNJJ70lS8w/YBhImNC64GOBZTo=;
 b=aPhamqDugpSuWJKpsGjZA3cOiuhL3h2mOrQEeb6ddy9qUzjNFxNAq0bf
 NBfXo06X2ywgAcAApXmCNUVCk3w9BCd1u+GG5bzofBVAGJfVE/TgIwFT+
 itZqsy8lE+TWbfjVDs3ZFc1gx5EBM/umN7c3iIWjBwK+GgNqrsItyciJk
 O+hQTWzKZqO2Z9Rxx9kr1N2URkE6sLJFK/IWGCvbaSGVCb6JmLTWJT3qc
 FNlfRZZD/nbfTGapRbvWBGh+XxAzpvhfF+x7PlyoBha7krTuqKIJdElah
 BvubmhjNHDpySQgTEGuZVz+RdLT/mtm/i3jaQSw//968LkOVTG4CqB0m8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382986207"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="382986207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 03:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084283088"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084283088"
Received: from eboyarsk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.41])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 03:14:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <cover.1696588392.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1696588392.git.jani.nikula@intel.com>
Date: Mon, 09 Oct 2023 13:14:04 +0300
Message-ID: <877cnw6r2r.fsf@intel.com>
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

On Fri, 06 Oct 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> v2 of [1] with all the controversial patches dropped.
>
> I'm not going to pursue the dropped patches any further. I'll leave it up to
> others to clean them up or leave them broken as they see fit.

Lucas, you claimed v1 broke LNL, but I have no way to verify. Does v2
work for you?

BR,
Jani.



>
> BR,
> Jani.
>
>
> [1] https://patchwork.freedesktop.org/series/124561/
>
>
> Jani Nikula (6):
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe: Introduce Xe assert macros
>   fixup! drm/xe/display: Implement display support
>   fixup! drm/xe/display: Implement display support
>
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h | 11 ++++----
>  drivers/gpu/drm/xe/xe_assert.h                |  3 ---
>  drivers/gpu/drm/xe/xe_device_types.h          |  2 --
>  drivers/gpu/drm/xe/xe_display.c               | 25 ++++++++-----------
>  4 files changed, 17 insertions(+), 24 deletions(-)

-- 
Jani Nikula, Intel
