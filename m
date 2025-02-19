Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835A9C021B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 12:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA7610E7CB;
	Wed, 19 Feb 2025 12:10:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66710E7C8;
 Wed, 19 Feb 2025 12:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 12:10:17 -0000
Message-ID: <173996701705.3937649.4312798159563886759@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev8)
URL   : https://patchwork.freedesktop.org/series/139954/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8f7ef56d1ab6670a8c48613f9a4afe38a0eca73e
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Feb 19 17:23:59 2025 +0530

    drm/i915/display: Load the lut values and enable sharpness
    
    Load the lut values during pipe enable.
    
    v2: Add the display version check
    v3: Fix build issue
    v4: Rebase
    v5: Add HAS_CASF macro. [Ankit]
        Add scaler_id check while reading state. [Ankit]
    v6: Modify the disable condition.
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
+ /mt/dim checkpatch 35ebda344b1753b92ba7665169c84391661758bd drm-intel
a5503441c33b drm: Introduce sharpness strength property
1bc388e927a3 drm/i915/display: Compute the scaler filter coefficients
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 235 lines checked
2d2f18795b11 drm/i915/display: Enable the second scaler
-:64: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#64: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:744:
+	x = y = 0;

total: 0 errors, 0 warnings, 1 checks, 71 lines checked
c0ede7ed9900 drm/i915/display: Configure the second scaler for sharpness
9e4312d50d02 drm/i915/display: Add registers and compute the strength
8f7ef56d1ab6 drm/i915/display: Load the lut values and enable sharpness


