Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFC3C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 11:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAFA10E045;
	Tue,  6 May 2025 11:04:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A710E045;
 Tue,  6 May 2025 11:04:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_minor?=
 =?utf-8?q?_cleanups_on_drm=5Fi915=5Fprivate_use?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 11:04:10 -0000
Message-ID: <174652945099.50795.10715059330006256067@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1746529001.git.jani.nikula@intel.com>
In-Reply-To: <cover.1746529001.git.jani.nikula@intel.com>
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

Series: drm/i915/display: minor cleanups on drm_i915_private use
URL   : https://patchwork.freedesktop.org/series/148630/
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
commit 5a3ad436fb675c9be259a9d84d1afbbf88dc62eb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue May 6 13:57:19 2025 +0300

    drm/i915/crtc: pass struct intel_display to DISPLAY_VER()
    
    Drop another reference to struct drm_i915_private.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 25c796cd9b15016d205d6c1f7cb3c3852ec55453 drm-intel
c6da404ebb7c drm/i915/dsi: remove dependency on i915_drv.h
4079618905a5 drm/i915/display: remove struct drm_i915_private forward declaration
3568563deccc drm/i915/bios: fix a comment referencing struct drm_i915_private
5a3ad436fb67 drm/i915/crtc: pass struct intel_display to DISPLAY_VER()


