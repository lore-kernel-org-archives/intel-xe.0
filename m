Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E83AEE0212
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 00:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B30C10E1DE;
	Thu, 14 Sep 2023 00:01:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D3EB10E1DE;
 Thu, 14 Sep 2023 00:01:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9F1E9A0BA8;
 Thu, 14 Sep 2023 00:01:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 14 Sep 2023 00:01:26 -0000
Message-ID: <169464968664.29167.16892223871084979235@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uC?=
 =?utf-8?q?_management_cleanup_=28rev2=29?=
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

Series: uC management cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/123654/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eda98c656d3222157868949d9abb3a1a4720bd41
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Sep 13 16:28:37 2023 -0700

    drm/xe/uc: Add GuC/HuC firmware path overrides
    
    When testing a new binary and/or debugging binary-related issues, it is
    useful to have the option to change which binary is loaded without
    having to update and re-compile the kernel. To support this option, this
    patch adds 2 new modparams to override the FW path for GuC and HuC. The
    HuC modparam can also be set to an empty string to disable HuC loading.
    
    Note that those modparams only take effect on platforms where we already
    have a default FW, so we're sure there is support for FW loading and the
    kernel isn't going to explode in an undefined path.
    
    v2: simplify comment (John),
        rebase on s/guc_submission_enabled/uc_enabled
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 89b671db4d8e2c46f27044d39c69095f597290e5 drm-intel
33d42d870 drm/xe/uc: Rename guc_submission_enabled() to uc_enabled()
ba15e29b4 drm/xe/uc: Fix uC status tracking
eda98c656 drm/xe/uc: Add GuC/HuC firmware path overrides
-:32: ERROR:GLOBAL_INITIALISERS: do not initialise globals to NULL
#32: FILE: drivers/gpu/drm/xe/xe_module.c:33:
+char *xe_guc_firmware_path = NULL;

-:37: ERROR:GLOBAL_INITIALISERS: do not initialise globals to NULL
#37: FILE: drivers/gpu/drm/xe/xe_module.c:38:
+char *xe_huc_firmware_path = NULL;

total: 2 errors, 0 warnings, 0 checks, 70 lines checked


