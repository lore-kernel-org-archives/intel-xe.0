Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3541C001E0
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 21:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CD110E155;
	Wed,  2 Aug 2023 21:29:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ACCBB10E155;
 Wed,  2 Aug 2023 21:29:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A91B6A0078;
 Wed,  2 Aug 2023 21:29:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 02 Aug 2023 21:29:52 -0000
Message-ID: <169101179268.6326.9418960447263530964@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230802212646.838717-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe/uc=3A_Fix_uC_status_trackin?=
 =?utf-8?q?g?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/xe/uc: Fix uC status tracking
URL   : https://patchwork.freedesktop.org/series/121910/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cbbc893169ebfd002401c8ffa1488e2145541d57
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Aug 2 14:26:46 2023 -0700

    drm/xe/uc: Add GuC/HuC firmware path overrides
    
    When testing a new binary and/or debugging binary-related issues, it is
    useful to have the option to change which binary is loaded without
    having to update and re-compile the kernel. To support this option, this
    patch adds 2 new modparams to override the FW path for GuC and HuC. The
    HuC modparam can also be set to an empty string to disable HuC loading.
    
    Note that those modparams only take effect on platforms where we already
    have a default FW, so we're sure there is support for FW loading and the
    kernel isn't going to explode in an undefined path.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch f16c04291100aa92caddd4d09e17b56bf7f4833c drm-intel
d28e0bbbd drm/xe/uc: Fix uC status tracking
cbbc89316 drm/xe/uc: Add GuC/HuC firmware path overrides
-:28: ERROR:GLOBAL_INITIALISERS: do not initialise globals to NULL
#28: FILE: drivers/gpu/drm/xe/xe_module.c:33:
+char *xe_guc_firmware_path = NULL;

-:33: ERROR:GLOBAL_INITIALISERS: do not initialise globals to NULL
#33: FILE: drivers/gpu/drm/xe/xe_module.c:38:
+char *xe_huc_firmware_path = NULL;

total: 2 errors, 0 warnings, 0 checks, 70 lines checked


