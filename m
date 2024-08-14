Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA9DC52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 18:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48B110E50A;
	Wed, 14 Aug 2024 18:13:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF2F10E50A;
 Wed, 14 Aug 2024 18:13:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_driver_load?=
 =?utf-8?q?_error_injection_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 18:13:55 -0000
Message-ID: <172365923537.633672.1712854689535020530@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814180835.558082-1-francois.dugast@intel.com>
In-Reply-To: <20240814180835.558082-1-francois.dugast@intel.com>
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

Series: drm/xe: Add driver load error injection (rev2)
URL   : https://patchwork.freedesktop.org/series/137314/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit dfecd09d0117573004405393612db81fee75476f
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Aug 14 20:08:35 2024 +0200

    drm/xe: Add driver load error injection
    
    Port over i915 driver load error injection.
    
    v2: Fix style and build errors, modparam to 0 after probe, rename to
        xe_device_inject_driver_probe_error, check type when compiled out,
        add _return macro, move some uses to the beginning of the function
    v3: Rebase
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 79d8c33863d99ac1b04afcce123bdc2ad919e993 drm-intel
dfecd09d0117 drm/xe: Add driver load error injection
-:105: WARNING:MACRO_WITH_FLOW_CONTROL: Macros with flow control statements should be avoided
#105: FILE: drivers/gpu/drm/xe/xe_device.h:188:
+#define xe_device_inject_driver_probe_return(__xe) \
+	({ if (__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, \
+						     __LINE__) == XE_DEVICE_INJECTED_ERR) \
+			return XE_DEVICE_INJECTED_ERR; })

-:240: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#240: FILE: drivers/gpu/drm/xe/xe_module.c:57:
+module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);

total: 0 errors, 2 warnings, 0 checks, 256 lines checked


