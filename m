Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F765FC6167
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 16:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0D10ED48;
	Fri, 13 Sep 2024 16:54:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B3710ED48;
 Fri, 13 Sep 2024 16:54:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_driver_load?=
 =?utf-8?q?_error_injection_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 16:54:03 -0000
Message-ID: <172624644346.997518.12564382363196449696@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240913140139.2257069-1-francois.dugast@intel.com>
In-Reply-To: <20240913140139.2257069-1-francois.dugast@intel.com>
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

Series: drm/xe: Add driver load error injection (rev5)
URL   : https://patchwork.freedesktop.org/series/137314/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit feb8c094543dcc9a681953eb020c099a982631a6
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Sep 13 16:01:39 2024 +0200

    drm/xe: Add driver load error injection
    
    Those new macros inject errors by overriding return codes. They must
    manually be called, preferably at the very beginning of the function
    that will fault, otherwise if not possible by turning this pattern:
    
        err = foo();
        if (err)
            return err;
    
    into:
    
        err = foo();
        err = xe_device_inject_driver_probe_error(xe, err);
        if (err)
            return err;
    
    When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
    
    When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
    be overridden when the module argument inject_driver_load_error is
    set to value X. By doing so, it is possible to test proper error
    handling and improve robustness for current and future code. A few
    injection points are added in this patch but more need to be added.
    One way to use this error injection at driver probe is:
    
        for i in {1..200}; do
            echo "Run $i"
            modprobe xe inject_driver_probe_error=$i;
            rmmod xe;
        done
    
    In the future this is expected to be replaced by the infrastructure
    provided by fault-inject.h
    
    v2: Fix style and build errors, modparam to 0 after probe, rename to
        xe_device_inject_driver_probe_error, check type when compiled out,
        add _return macro, move some uses to the beginning of the function
    v3: Rebase
    v4: Improve commit message and comments, keep if/return rather than
        change the flow inside the macro (Lucas De Marchi)
    v5: Rebase, add comments, keep existing return points (Lucas De Marchi)
        Add finish wrapper, move to function beginning for all xe functions
        (Michal Wajdeczko) Bolt into i915 error injection (Jani Nikula)
    v6: Fix documentation of __xe_device_inject_driver_probe_error, fix
        checkpatch warning (Rodrigo Vivi)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch df3eecb1fa97d6d35569c2fa39f0da78b9f13328 drm-intel
feb8c094543d drm/xe: Add driver load error injection


