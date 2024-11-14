Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DDD65C6A
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 10:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDA210E26B;
	Thu, 14 Nov 2024 10:27:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8BD10E26B;
 Thu, 14 Nov 2024 10:27:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 10:27:01 -0000
Message-ID: <173158002189.4036525.15689013243794694983@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114101825.3413688-1-nemesa.garg@intel.com>
In-Reply-To: <20241114101825.3413688-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev3)
URL   : https://patchwork.freedesktop.org/series/139954/
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
commit 4347e2c0a13d724b33be8fd636112b7efddea70a
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Thu Nov 14 15:48:25 2024 +0530

    drm/i915/display: Load the lut values and enable sharpness
    
    Load the lut values during pipe enable.
    
    v2: Add the display version check
    v3: Fix build issue
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch db9b7fa434daee4c587135f8b05da417b9097a42 drm-intel
4f7be92ead5c drm: Introduce sharpness strength property
5ead6e8f32b5 drm/i915/display: Compute the scaler filter coefficients
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 226 lines checked
3a87e008f41c drm/i915/display: Enable the second scaler for sharpness
-:251: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#251: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:693:
+	x = y = 0;

total: 0 errors, 0 warnings, 1 checks, 246 lines checked
e73717933019 drm/i915/display: Add registers and compute the strength
4347e2c0a13d drm/i915/display: Load the lut values and enable sharpness


