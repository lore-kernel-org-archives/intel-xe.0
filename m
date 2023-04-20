Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38002C77B72
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 09:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26B410E27F;
	Thu, 20 Apr 2023 09:33:02 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A04210E27F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681983181; x=1713519181;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zXwnX6yOutQ5HK5yalPfo2TNSz6uff51la6yPXVN488=;
 b=gvEgpyK0FkNOSSjMNxzrO6B0lTvgqBvu5YQK7j7vuQBx8eucFqz7Cwxi
 uzgEWfkQWDPosoqL9kY1jtW0K5QZW6r2LyXYYOdo7piXMi75Xrmtvb0dp
 r4vunfqK00Ae7+apNEnzC8cZdb+qJ6WX0gJoAldSPI1auB6aN6+WBMXKs
 4L8N79jqwR4gPayeYqhgkkhQvvjsKBtsms3LtwSFvZzAlD94r9AfCSKFC
 2vXG4UTy8IIXeSQ4VKvdaxZkDE5D1rwDfm9n9L5Q1KHHLzqRMhD9UFdwu
 8p7t/6Dkbh4afz7aOI4bRoQWB8c7IfZhHvzyNscWSdxD083//jrm7Gn1s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="326014361"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="326014361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 02:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694424481"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="694424481"
Received: from agrische-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 02:32:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stuart Summers <stuart.summers@intel.com>
In-Reply-To: <20230419175501.155319-1-stuart.summers@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419175501.155319-1-stuart.summers@intel.com>
Date: Thu, 20 Apr 2023 12:32:55 +0300
Message-ID: <87mt32x5iw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/4] RFC: Add new device configuration
 infrastructure to
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
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023, Stuart Summers <stuart.summers@intel.com> wrote:
> This is attempting to take the best parts of i915 module parameters
> (minus the actual module parameters) and add to xe to allow for better
> debuggability and configuration in order to help isolate problems
> on a per-device level instead of global module parameters.
>
> Note that I did review a few options here: configfs (not generally
> used by the drm stack), module parameters (we have some negative
> history here), sysfs (not the right approach given the focus on
> user interface here). Debugfs is used in various drm drivers to
> configure various device characteristics. The infrastructure being
> presented here has at a high level been present in the i915 driver
> for some years now, so provides a good starting point for quick
> debug additions without exposing users to some of the challenges
> faced with module parameters in the past.

Looking into configfs has been on my todo list for a long time. It's
something that often gets recommended as a replacement to module
parameters, but the documentation as well as the existing examples in
the kernel are, I think, less than stellar. Basically would require
implementing it and seeing how it actually works.

In any case, I don't think it should be dismissed with just "not
generally used by the drm stack". A decent implementation could set the
example going forward.

The main problem with debugfs is the inability to set the default values
prior to probing the device. This is where module parameters are handy,
but they aren't device specific (and, as you note, generally
discouraged).

Looking at the patches, I'm not sure I understand what the procedure for
setting the debugfs values before probing the device would be. Can you
provide an example sequence on the command-line please?


BR,
Jani.

>
> Stuart Summers (4):
>   drm/xe: Refactor early device init
>   drm/xe: Refactor debugfs into an early and late part
>   drm/xe: Add new device configuration debugfs infrastructure
>   drm/xe: Migrate module parameters to new debugfs structure
>
>  drivers/gpu/drm/xe/Makefile            |   1 +
>  drivers/gpu/drm/xe/xe_debugfs.c        |  14 +-
>  drivers/gpu/drm/xe/xe_debugfs.h        |   1 +
>  drivers/gpu/drm/xe/xe_debugfs_params.c | 235 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_debugfs_params.h |  14 ++
>  drivers/gpu/drm/xe/xe_device.c         |  23 ++-
>  drivers/gpu/drm/xe/xe_device.h         |   4 +-
>  drivers/gpu/drm/xe/xe_device_types.h   |   4 +
>  drivers/gpu/drm/xe/xe_display.c        |   3 +-
>  drivers/gpu/drm/xe/xe_guc_log.c        |   2 +-
>  drivers/gpu/drm/xe/xe_mmio.c           |   4 +-
>  drivers/gpu/drm/xe/xe_module.c         |  16 --
>  drivers/gpu/drm/xe/xe_module.h         |   5 -
>  drivers/gpu/drm/xe/xe_params.c         | 118 +++++++++++++
>  drivers/gpu/drm/xe/xe_params.h         |  43 +++++
>  drivers/gpu/drm/xe/xe_pci.c            |  14 +-
>  16 files changed, 461 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debugfs_params.h
>  create mode 100644 drivers/gpu/drm/xe/xe_params.c
>  create mode 100644 drivers/gpu/drm/xe/xe_params.h

-- 
Jani Nikula, Intel Open Source Graphics Center
