Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED81C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 14:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5A10E100;
	Thu,  5 Jun 2025 14:51:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B222810E08D;
 Thu,  5 Jun 2025 14:51:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=2C_drm/xe=3A_add?=
 =?utf-8?q?_drm_device_based_pcode_interface_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 14:51:45 -0000
Message-ID: <174913510572.51837.13379721670981289565@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1749119274.git.jani.nikula@intel.com>
In-Reply-To: <cover.1749119274.git.jani.nikula@intel.com>
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

Series: drm/i915, drm/xe: add drm device based pcode interface for display
URL   : https://patchwork.freedesktop.org/series/149877/
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
commit 3710b0c01f588f421af30ce303835a1e4aeb4d4a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Jun 5 13:29:38 2025 +0300

    drm/xe/compat: remove old pcode compat interface
    
    With display code using the struct drm_device based pcode interface, we
    can drop the old pcode compat interface.
    
    We can also drop the __compat_uncore_to_tile() helper from
    intel_uncore.h compat header.
    
    Turns out a couple of headers depended on the intel_uncore.h include via
    intel_pcode.h. Fix them.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d5a5fd842902e24da80b61d64ce337ecee6b0c41 drm-intel
56d2070ebefc drm/i915/pcode: drop fast wait from snb_pcode_write_timeout()
d159ffefc708 drm/i915/pcode: add struct drm_device based interface
985e94ddf9d1 drm/xe/pcode: add struct drm_device based interface
79ec249ef108 drm/i915/display: switch to struct drm_device based pcode interface
7aba660287d9 drm/i915/dram: switch to struct drm_device based pcode interface
3710b0c01f58 drm/xe/compat: remove old pcode compat interface


