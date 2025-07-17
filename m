Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F1C83F1B
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 05:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AD310E306;
	Thu, 17 Jul 2025 05:39:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7630A10E306;
 Thu, 17 Jul 2025 05:39:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Skip_?=
 =?utf-8?q?unavailable_power_wells_based_on_pipe_mask?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Jul 2025 05:39:45 -0000
Message-ID: <175273078545.168606.11324323278246175338@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717051603.1036746-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250717051603.1036746-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915/display: Skip unavailable power wells based on pipe mask
URL   : https://patchwork.freedesktop.org/series/151737/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4822f0541331cd33099d03ef1f3c6dd711cf548c
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Thu Jul 17 10:46:03 2025 +0530

    drm/i915/display: Skip unavailable power wells based on pipe mask
    
    Some power wells are only relevant for certain display pipes. Add a check
    to ensure we only allocate and initialize power wells whose associated
    pipes are available on the platform.
    
    This avoids unnecessary mapping of power wells, particularly when platforms
    support a subset of pipes described in the power well descriptors.
    
    Suggested-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch e7058b7a607f5fdfd7bc4586644756d7ef002331 drm-intel
4822f0541331 drm/i915/display: Skip unavailable power wells based on pipe mask
-:22: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 0)
#22: FILE: drivers/gpu/drm/i915/display/intel_display_power_map.c:1748:
 		for_each_power_well_instance_in_desc_list((_descs)->list, (_descs)->count, \
[...]
+static bool

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


