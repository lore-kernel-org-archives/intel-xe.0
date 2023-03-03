Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2646C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 12:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D9910E5CE;
	Fri,  3 Mar 2023 12:29:12 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9C10E5CE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677846550; x=1709382550;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7QRdpasEfhsti3HNL5rneoMLfaOFFLtSMV2jkPbgAhE=;
 b=TdUStC8Cdtddm9Ez/Ami+waj4SfpTkZzJMaJkIk0kI+68gicuAaX7G10
 IAj7W5hCfzrjCHzQw0X7gMqpu825Yt/2mAi8rWmOnKTkyHVW1h7JZx+V0
 8P0izUD08v+bcb0mngr9UpsAKa2H7GK7zpZU8PIUqmRoZV9XRpBDFNq25
 NmxaCtPktrHYx3y5O9NxyWvYR453nIkwLY+doxEb1091V4x5KKaW+3da5
 DOq0b9w5xkf4XAcLCNUy+CSdYKgej6Jz8Wfx2a7HSSJtyyl5w5G9iO1ln
 76CSUROADAvd2PMzHQ8IvYpxgUc4gXqHD7V7VRi+s8jcoSIxLvF+0OCuC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399838377"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="399838377"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="675350510"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="675350510"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 04:29:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Patchwork <patchwork@emeril.freedesktop.org>
In-Reply-To: <167784096614.9997.9822812608959828099@emeril.freedesktop.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230303105222.3550161-1-jani.nikula@intel.com>
 <167784096614.9997.9822812608959828099@emeril.freedesktop.org>
Date: Fri, 03 Mar 2023 14:29:06 +0200
Message-ID: <871qm6uigd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_clean_up_i915_includes_both_sides_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 03 Mar 2023, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/xe: clean up i915 includes both sides (rev2)
> URL   : https://patchwork.freedesktop.org/series/114573/
> State : failure
>
> == Summary ==
>
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
> ERROR:root:In file included from ../drivers/gpu/drm/i915/display/intel_display_core.h:28,
>                  from ../drivers/gpu/drm/xe/xe_device_types.h:22,
>                  from ../drivers/gpu/drm/xe/xe_device.h:15,
>                  from ../drivers/gpu/drm/xe/xe_bb.c:9:
> ../drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h:11:10: fatal error: display/intel_display.h: No such file or directory
>    11 | #include "display/intel_display.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~

I don't understand this. See patch 3. That line shouldn't exist.

BR,
Jani.


> compilation terminated.
> make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_bb.o] Error 1
> make[6]: *** Waiting for unfinished jobs....
> In file included from ../drivers/gpu/drm/i915/display/intel_display_core.h:28,
>                  from ../drivers/gpu/drm/xe/xe_device_types.h:22,
>                  from ../drivers/gpu/drm/xe/xe_vm_types.h:14,
>                  from ../drivers/gpu/drm/xe/xe_bo.h:11,
>                  from ../drivers/gpu/drm/xe/xe_bo.c:6:
> ../drivers/gpu/drm/xe/compat-i915-headers/intel_pm_types.h:11:10: fatal error: display/intel_display.h: No such file or directory
>    11 | #include "display/intel_display.h"
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[6]: *** [../scripts/Makefile.build:250: drivers/gpu/drm/xe/xe_bo.o] Error 1
> make[5]: *** [../scripts/Makefile.build:500: drivers/gpu/drm/xe] Error 2
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [../scripts/Makefile.build:500: drivers/gpu/drm] Error 2
> make[3]: *** [../scripts/Makefile.build:500: drivers/gpu] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [../scripts/Makefile.build:500: drivers] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/kernel/Makefile:1992: .] Error 2
> make: *** [Makefile:231: __sub-make] Error 2
>
> [10:55:46] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [10:55:50] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
>
>

-- 
Jani Nikula, Intel Open Source Graphics Center
