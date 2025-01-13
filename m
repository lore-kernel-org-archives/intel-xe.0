Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15E7C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 13:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB1910E043;
	Mon, 13 Jan 2025 13:13:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6889910E684;
 Mon, 13 Jan 2025 13:13:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jan 2025 13:13:57 -0000
Message-ID: <173677403742.3239972.16036703116964245399@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113104936.1338290-1-nemesa.garg@intel.com>
In-Reply-To: <20250113104936.1338290-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property (rev5)
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
commit f2b1a7bd94fdf054cc3f154ce606a5faac68408f
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Mon Jan 13 16:19:36 2025 +0530

    drm/i915/display: Load the lut values and enable sharpness
    
    Load the lut values during pipe enable.
    
    v2: Add the display version check
    v3: Fix build issue
    v4: Rebase
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Naga Venkata Srikanth V <nagavenkata.srikanth.v@intel.com>
+ /mt/dim checkpatch 77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab drm-intel
75ae63788d95 drm: Introduce sharpness strength property
aa9d7d66e748 drm/i915/display: Compute the scaler filter coefficients
-:37: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#37: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 231 lines checked
f45c8959ba74 drm/i915/display: Configure the scaler
-:32: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#32: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:136:
+       (PS_FILTER_PROGRAMMED | \$

-:33: ERROR:CODE_INDENT: code indent should use tabs where possible
#33: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:137:
+        PS_Y_VERT_FILTER_SELECT(1) | \$

-:33: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#33: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:137:
+        PS_Y_VERT_FILTER_SELECT(1) | \$

-:34: ERROR:CODE_INDENT: code indent should use tabs where possible
#34: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:138:
+        PS_Y_HORZ_FILTER_SELECT(0) | \$

-:34: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#34: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:138:
+        PS_Y_HORZ_FILTER_SELECT(0) | \$

-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:139:
+        PS_UV_VERT_FILTER_SELECT(1) | \$

-:35: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#35: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:139:
+        PS_UV_VERT_FILTER_SELECT(1) | \$

-:36: ERROR:CODE_INDENT: code indent should use tabs where possible
#36: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:140:
+        PS_UV_HORZ_FILTER_SELECT(0))$

-:36: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#36: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:140:
+        PS_UV_HORZ_FILTER_SELECT(0))$

-:62: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#62: FILE: drivers/gpu/drm/i915/display/skl_scaler.c:694:
+	x = y = 0;

total: 4 errors, 5 warnings, 1 checks, 71 lines checked
301c312c8b4d drm/i915/display: Enable the second scaler for sharpness
c79fa44c0cd3 drm/i915/display: Add registers and compute the strength
f2b1a7bd94fd drm/i915/display: Load the lut values and enable sharpness


