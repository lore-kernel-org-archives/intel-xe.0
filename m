Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A28C54E71
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 17:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3A10F6F8;
	Tue, 19 Mar 2024 17:13:27 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7B10F6F8;
 Tue, 19 Mar 2024 17:13:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/display=3A_Unify_DPT_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 17:13:25 -0000
Message-ID: <171086840574.906748.3013742350653308242@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240319170734.156407-1-juhapekka.heikkila@gmail.com>
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

Series: series starting with [1/2] drm/xe/display: Unify DPT mappings
URL   : https://patchwork.freedesktop.org/series/131338/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 771c1dc24c969d47a611d605261b8e694b67dc27
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Tue Mar 19 19:07:34 2024 +0200

    drm/xe/display: Simplify DPT handling
    
    Don't undo structures on higher level but pass them all the way
    to mapping functions.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch c998853b06760efc02617828e7b569a73ac73dc5 drm-intel
22a8fd111ad0 drm/xe/display: Unify DPT mappings
771c1dc24c96 drm/xe/display: Simplify DPT handling
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:42:
+		      u32 (*calc_src_idx)(const struct intel_remapped_plane_info*,
+		      u32, u32))

-:85: WARNING:FUNCTION_ARGUMENTS: function definition argument 'const struct intel_remapped_plane_info*' should also have an identifier name
#85: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:109:
+		u32 (*src_idx)(const struct intel_remapped_plane_info*, u32, u32);

-:85: WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32' should also have an identifier name
#85: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:109:
+		u32 (*src_idx)(const struct intel_remapped_plane_info*, u32, u32);

-:85: WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32' should also have an identifier name
#85: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:109:
+		u32 (*src_idx)(const struct intel_remapped_plane_info*, u32, u32);

total: 0 errors, 3 warnings, 1 checks, 93 lines checked


