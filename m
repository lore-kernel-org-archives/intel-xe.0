Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D6C3ABD9
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 08:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765710E28C;
	Wed, 14 May 2025 08:55:36 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460F10E27F;
 Wed, 14 May 2025 08:55:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_vario?=
 =?utf-8?q?us_small_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 08:55:35 -0000
Message-ID: <174721293553.77862.5034749730387198540@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747128495.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747128495.git.jani.nikula@intel.com>
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

Series: drm/i915/display: various small cleanups
URL   : https://patchwork.freedesktop.org/series/148951/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 995f55f53e91236422bc0a9821e67513e394a55c
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 13 12:28:45 2025 +0300

    drm/i915/display: drop unnecessary includes on i915 core headers
    
    These includes have become unnecessary. Drop them.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 84da78f30dc4c78f6c328ed142db458457035da0 drm-intel
737e90332d86 drm/i915/pps: drop dependency on intel_display_conversion.h
d8432e0dc7c2 drm/i915/rps: pass struct intel_display to DISPLAY_VER()
aef11f39219e drm/i915/display: drop unused declarations from intel_display.h
6d97703bdea0 drm/i915/gem: drop intel_display.h include
995f55f53e91 drm/i915/display: drop unnecessary includes on i915 core headers


