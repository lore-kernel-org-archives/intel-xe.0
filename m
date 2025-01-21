Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E207C02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 10:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D810E55E;
	Tue, 21 Jan 2025 10:53:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252B910E18F;
 Tue, 21 Jan 2025 10:53:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/backlight=3A_Ret?=
 =?utf-8?q?urn_immediately_when_scale=28=29_finds_invalid_parameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 10:53:06 -0000
Message-ID: <173745678614.2565075.5444756196752645375@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121061746.2730572-1-linux@roeck-us.net>
In-Reply-To: <20250121061746.2730572-1-linux@roeck-us.net>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/i915/backlight: Return immediately when scale() finds invalid parameters
URL   : https://patchwork.freedesktop.org/series/143773/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit af927bced9c1c96e9512db4a7f3c7ad1888d107c
Author: Guenter Roeck <linux@roeck-us.net>
Date:   Mon Jan 20 22:17:46 2025 -0800

    drm/i915/backlight: Return immediately when scale() finds invalid parameters
    
    The scale() functions detects invalid parameters, but continues
    its calculations anyway. This causes bad results if negative values
    are used for unsigned operations. Worst case, a division by 0 error
    will be seen if source_min == source_max.
    
    On top of that, after v6.13, the sequence of WARN_ON() followed by clamp()
    may result in a build error with gcc 13.x.
    
    drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
    include/linux/compiler_types.h:542:45: error:
            call to '__compiletime_assert_415' declared with attribute error:
            clamp() low limit source_min greater than high limit source_max
    
    This happens if the compiler decides to rearrange the code as follows.
    
            if (source_min > source_max) {
                    WARN(..);
                    /* Do the clamp() knowing that source_min > source_max */
                    source_val = clamp(source_val, source_min, source_max);
            } else {
                    /* Do the clamp knowing that source_min <= source_max */
                    source_val = clamp(source_val, source_min, source_max);
            }
    
    Fix the problem by evaluating the return values from WARN_ON and returning
    immediately after a warning. While at it, fix divide by zero error seen
    if source_min == source_max.
    
    Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>
    Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
    Suggested-by: David Laight <david.laight.linux@gmail.com>
    Cc: David Laight <david.laight.linux@gmail.com>
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+ /mt/dim checkpatch 7727d97a1f38c61a60e87b2d38f7cc5a4aae277b drm-intel
af927bced9c1 drm/i915/backlight: Return immediately when scale() finds invalid parameters
-:35: WARNING:BAD_SIGN_OFF: Non-standard signature: Analyzed-by:
#35: 
Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


