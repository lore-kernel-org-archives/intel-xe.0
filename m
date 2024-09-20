Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B6C78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F4310E121;
	Fri, 20 Sep 2024 14:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwcLlvdR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DEF10E121
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726843746; x=1758379746;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0taUU+PNF5aq4CObsVnuQdGlHkKEbnGDrx0oFShrFZ0=;
 b=KwcLlvdRB05+QAeG1ybsmr0KCovOHRSBz00dIegRq5HBipG3AcLoRH7h
 4kJZhpGOojyJ4lqntNMeqcxGbinATgfvrXf8As5VPP+Fm3ZQfUdpU7qcl
 YDhXpImzThfNOY2S7A5J77oY8/rva8aHuFlHOp4Wd9rwlWVEcXk/5tVXW
 s6Rdk4fwO5Y0boMx4ppjJEoVLJ2h62ZYadbnylU4xnUH7rmekSnxsYDvF
 OKVvXuuWTK0nTyPcUMXnTavmBBb63rsvmhq79hNGwQnsKbOaa+uI61PMy
 UIsTKPe08IThObNuP1CjG3gAKDdafs+gfGOW7XVaoUJsDWlFqfrszKvnv Q==;
X-CSE-ConnectionGUID: mfSH1qWGQGyGm0gxT1UfpQ==
X-CSE-MsgGUID: bhX/ncleRZmwostDxG9dSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51271751"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="51271751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:49:06 -0700
X-CSE-ConnectionGUID: dRwX7VnnSqqesMCg941TRg==
X-CSE-MsgGUID: bdsLEcaRTmeb8BBztcko8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70753680"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.155])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 07:49:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com
Subject: Re: [CI 00/12] Debug g2h timeout issue
In-Reply-To: <20240920142922.618649-1-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240920142922.618649-1-badal.nilawar@intel.com>
Date: Fri, 20 Sep 2024 17:48:58 +0300
Message-ID: <87bk0i8jol.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 20 Sep 2024, Badal Nilawar <badal.nilawar@intel.com> wrote:
> Do not review

Explanation would go here.

[CI] Usually means everything's reviewed, and this is just a resend for
CI. And there's no need to resend multiple times for that. Patchwork has
a "test again" button.

Finally, the patches are missing your Signed-off-by.

BR,
Jani.

>
> John Harrison (10):
>   drm/xe/guc: Remove spurious line feed in debug print
>   drm/xe/devcoredump: Use drm_puts and already cached local variables
>   drm/xe/devcoredump: Improve section headings and add tile info
>   drm/xe/devcoredump: Add ASCII85 dump helper function
>   drm/xe/guc: Copy GuC log prior to dumping
>   drm/xe/guc: Use a two stage dump for GuC logs and add more info
>   drm/xe/guc: Dead CT helper
>   drm/xe/guc: Dump entire CTB on errors
>   drm/xe/guc: Add GuC log to devcoredump captures
>   drm/xe/guc: Add a helper function for dumping GuC log to dmesg
>
> Michal Wajdeczko (1):
>   drm/print: Introduce drm_line_printer
>
> bnilawar (1):
>   [For CI] Debug prints/logs to debug G2H timeout issue
>
>  drivers/gpu/drm/drm_print.c                   |  14 +
>  .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   1 +
>  drivers/gpu/drm/xe/xe_devcoredump.c           | 144 +++++-
>  drivers/gpu/drm/xe/xe_devcoredump.h           |   6 +
>  drivers/gpu/drm/xe/xe_devcoredump_types.h     |  13 +-
>  drivers/gpu/drm/xe/xe_device.c                |   1 +
>  drivers/gpu/drm/xe/xe_guc.c                   |   6 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                | 416 ++++++++++++++----
>  drivers/gpu/drm/xe/xe_guc_ct.h                |  10 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h          |  29 +-
>  drivers/gpu/drm/xe/xe_guc_log.c               | 208 ++++++++-
>  drivers/gpu/drm/xe/xe_guc_log.h               |   5 +
>  drivers/gpu/drm/xe/xe_guc_log_types.h         |  27 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c            |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   1 -
>  include/drm/drm_print.h                       |  64 +++
>  17 files changed, 804 insertions(+), 144 deletions(-)

-- 
Jani Nikula, Intel
