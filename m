Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58397C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 09:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA410E6B8;
	Tue, 15 Apr 2025 09:53:06 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D7910E0D8;
 Tue, 15 Apr 2025 09:53:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/edid=3A_more_displayi?=
 =?utf-8?q?d_timing_parsing_and_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Apr 2025 09:53:04 -0000
Message-ID: <174471078451.4942.10280092954907009616@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <cover.1744708239.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744708239.git.jani.nikula@intel.com>
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

Series: drm/edid: more displayid timing parsing and cleanups
URL   : https://patchwork.freedesktop.org/series/147737/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8aa6507bd61179964b0fb3778320b86777d57a98
Author: Egor Vorontsov <sdoregor@sdore.me>
Date:   Tue Apr 15 12:13:31 2025 +0300

    drm/edid: Refactor DisplayID timing block structs
    
    Using le16 instead of u8[2].
    
    Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4e52f6bddf99cb28ed0279d56bb8286a8bbfda65 drm-intel
d06c63335418 drm/edid: Implement DisplayID Type IX & X timing blocks parsing
-:64: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#64: FILE: drivers/gpu/drm/drm_edid.c:6837:
+							   const struct displayid_formula_timings_9 *timings,

-:80: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#80: FILE: drivers/gpu/drm/drm_edid.c:6853:
+	mode = drm_cvt_mode(dev, hactive, vactive, timings->vrefresh + 1, timing_formula == 1, false, false);

-:95: WARNING:LONG_LINE: line length of 116 exceeds 100 columns
#95: FILE: drivers/gpu/drm/drm_edid.c:6868:
+	const struct displayid_formula_timing_block *formula_block = (struct displayid_formula_timing_block *)block;

total: 0 errors, 3 warnings, 0 checks, 100 lines checked
8aa6507bd611 drm/edid: Refactor DisplayID timing block structs
-:56: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#56: FILE: drivers/gpu/drm/drm_edid.c:6763:
+							    const struct displayid_detailed_timings_1 *timings,

total: 0 errors, 1 warnings, 0 checks, 66 lines checked


