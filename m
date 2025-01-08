Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEA1E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 05:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06810E25D;
	Wed,  8 Jan 2025 05:58:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D030B10E25D;
 Wed,  8 Jan 2025 05:58:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Expose_modifiers/formats_?=
 =?utf-8?q?supported_by_async_flips_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 05:58:56 -0000
Message-ID: <173631593686.1200561.1362273017195504263@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
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

Series: Expose modifiers/formats supported by async flips (rev2)
URL   : https://patchwork.freedesktop.org/series/140934/
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
commit 30bbf2496cb90644c2981f119a7f2f4d14de7fa5
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Jan 8 11:09:03 2025 +0530

    drm/i915/display: Add function for format_mod_supported_async
    
    Add driver specific function definition for the plane->funcs
    format_mod_supported_async to check if the provided format/modifier is
    supported for asynchronous flip.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 8f14ac27d7b0ff9ff973fa44a67cc9a0ff3acad5 drm-intel
f072f6ce9821 drm/plane: Add new plane property IN_FORMATS_ASYNC
-:85: WARNING:TYPO_SPELLING: 'asychronous' may be misspelled - perhaps 'asynchronous'?
#85: FILE: include/drm/drm_plane.h:556:
+	 * asychronous flip the given format/modifier combination is valid for
 	   ^^^^^^^^^^^

-:99: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u32' over 'uint32_t'
#99: FILE: include/drm/drm_plane.h:570:
+					   uint32_t format, uint64_t modifier);

total: 0 errors, 1 warnings, 1 checks, 63 lines checked
e9509bf22398 drm/plane: Expose function to create format/modifier blob
da0d446b37eb drm/plane: Function to check async supported modifier/format
-:6: WARNING:TYPO_SPELLING: 'Seperate' may be misspelled - perhaps 'Separate'?
#6: 
Seperate function for async flips is to be called in order to check the
^^^^^^^^

-:62: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#62: FILE: drivers/gpu/drm/drm_plane.c:933:
+		if (!(is_async ? plane->funcs->format_mod_supported_async(

-:64: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#64: FILE: drivers/gpu/drm/drm_plane.c:935:
+					plane->funcs->format_mod_supported(

total: 0 errors, 1 warnings, 2 checks, 48 lines checked
bb12de39973a drm/i915/display: Populate list of async supported formats/modifiers
30bbf2496cb9 drm/i915/display: Add function for format_mod_supported_async


