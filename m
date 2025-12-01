Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46474D116F3
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 22:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F9210E42A;
	Mon,  1 Dec 2025 22:27:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB9010E42A;
 Mon,  1 Dec 2025 22:27:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/=7Bi915=2C_xe=7D/disp?=
 =?utf-8?q?lay=3A_make_pxp_key_check_part_of_bo_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 22:27:45 -0000
Message-ID: <176462806523.46431.2456020285157452902@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251201172730.2154668-1-jani.nikula@intel.com>
In-Reply-To: <20251201172730.2154668-1-jani.nikula@intel.com>
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

Series: drm/{i915, xe}/display: make pxp key check part of bo interface
URL   : https://patchwork.freedesktop.org/series/158313/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4bfb751dd2074a560de6634a3734dee86b5e2532
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Dec 1 19:27:30 2025 +0200

    drm/{i915, xe}/display: make pxp key check part of bo interface
    
    Add intel_bo_key_check() next to intel_bo_is_protected() where it feels
    like it belongs, and drop the extra pxp compat header.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 639f325d8cbdc690de963db2fe5840444ac7ea65 drm-intel
4bfb751dd207 drm/{i915, xe}/display: make pxp key check part of bo interface
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked


