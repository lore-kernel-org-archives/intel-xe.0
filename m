Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28944C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E608210ECFA;
	Fri, 14 Feb 2025 15:56:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7175010ECFA;
 Fri, 14 Feb 2025 15:56:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 15:56:26 -0000
Message-ID: <173954858646.2081995.14433874453256811519@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214151132.1811682-1-nemesa.garg@intel.com>
In-Reply-To: <20250214151132.1811682-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev6)
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
commit b2fa3d4255555e38d686795eae4eec0fc7c090f7
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Fri Feb 14 20:41:32 2025 +0530

    drm/i915/display: Load the lut values and enable sharpness
    
    Load the lut values during pipe enable.
    
    v2: Add the display version check
    v3: Fix build issue
    v4: Rebase
    v5: Add HAS_CASF macro. [Ankit]
        Add scaler_id check while reading state. [Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
+ /mt/dim checkpatch 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 drm-intel
75f2c8bb8c7d drm: Introduce sharpness strength property
cba4078241b8 drm/i915/display: Compute the scaler filter coefficients
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 235 lines checked
7517b6b3fee9 drm/i915/display: Enable the second scaler
-:64: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#64: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:744:
+	x = y = 0;

total: 0 errors, 0 warnings, 1 checks, 71 lines checked
f71b90439e68 drm/i915/display: Configure the second scaler for sharpness
3e47003d067b drm/i915/display: Add registers and compute the strength
b2fa3d425555 drm/i915/display: Load the lut values and enable sharpness


